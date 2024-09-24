﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using sciencehub_core.Features.Submissions.VersionControlSystem.Models;
using sciencehub_core.Shared.Serialization;

namespace sciencehub_core.Features.Projects.Models
{
    [Table("project_versions_graphs")]
    public class ProjectGraph
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("project_id")]
        public int ProjectId { get; set; }

        private CustomJsonSerializer _serializer = new CustomJsonSerializer();

        [Column("graph_data", TypeName = "jsonb")]
        public string? GraphDataJson { get; set; }

        private GraphData? _cachedGraphData = null;

        [NotMapped]
        public GraphData GraphData
        {
            get => _cachedGraphData ??= _serializer.DeserializeFromJson<GraphData>(GraphDataJson ?? "{}");
            set
            {
                _cachedGraphData = value;
                GraphDataJson = _serializer.SerializeToJson(value);
            }
        }

        [Column("version_edges", TypeName = "jsonb")]
        public string? VersionEdgesJson { get; set; }

        private VersionEdges? _cachedVersionEdges = null;

        [NotMapped]
        public VersionEdges VersionEdges
        {
            get => _cachedVersionEdges ??= _serializer.DeserializeFromJson<VersionEdges>(VersionEdgesJson ?? "{}");
            set
            {
                _cachedVersionEdges = value;
                VersionEdgesJson = _serializer.SerializeToJson(value);
            }
        }
    }
}

