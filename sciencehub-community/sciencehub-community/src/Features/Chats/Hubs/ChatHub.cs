using Microsoft.AspNetCore.SignalR;

namespace sciencehub_community.Features.Chats.Hubs
{
    public class ChatHub : Hub
    {
        public async Task TestMethod(string groupName)
        {
            Console.WriteLine("TestMethod called with groupName: " + groupName);
            try
            {   
                await Groups.AddToGroupAsync(Context.ConnectionId, groupName);
                await Clients.Group(groupName).SendAsync("ReceiveMessage", $"{Context.ConnectionId} has joined the group {groupName}.");
            }
            catch (Exception ex)
            {
                // Log the error to the server console
                Console.WriteLine($"Error joining group {groupName}: {ex.Message}");
                // Send an error message directly to the client
                await Clients.Caller.SendAsync("Error", $"Failed to join group {groupName}: {ex.Message}");
                throw;  // Re-throwing the exception may be redundant if you're already handling the error
            }
        }

        public async Task JoinChatGroup(string groupName)
        {
            Console.WriteLine($"Joining group {groupName}...");
            try
            {   
                await Groups.AddToGroupAsync(Context.ConnectionId, groupName);
                await Clients.Group(groupName).SendAsync("ReceiveMessage", $"{Context.ConnectionId} has joined the group {groupName}.");
            }
            catch (Exception ex)
            {
                // Log the error to the server console
                Console.WriteLine($"Error joining group {groupName}: {ex.Message}");
                // Send an error message directly to the client
                await Clients.Caller.SendAsync("Error", $"Failed to join group {groupName}: {ex.Message}");
                throw;  // Re-throwing the exception may be redundant if you're already handling the error
            }
        }

        public override Task OnConnectedAsync()
        {
            Console.WriteLine($"Client connected: {Context.ConnectionId}");
            return base.OnConnectedAsync();
        }

        public override Task OnDisconnectedAsync(Exception exception)
        {
            Console.WriteLine($"Client disconnected: {Context.ConnectionId}");
            return base.OnDisconnectedAsync(exception);
        }

        public async Task LeaveChatGroup(string groupName)
        {
            await Groups.RemoveFromGroupAsync(Context.ConnectionId, groupName);
            await Clients.Group(groupName).SendAsync("Send", $"{Context.ConnectionId} has left the group {groupName}.");
        }

        public Task SendMessageToGroup(string groupName, string message)
        {
            return Clients.Group(groupName).SendAsync("ReceiveMessage", Context.User.Identity.Name, message);
        }
    }
}