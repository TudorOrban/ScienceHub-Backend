CREATE TABLE public.users (
	id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	full_name VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	is_verified BOOL DEFAULT FALSE,
	avatar_url VARCHAR(200),
	bio TEXT,
	research_score DECIMAL,
	h_index INT,
	total_citations INT,
	total_upvotes INT,
	user_details JSONB
);

INSERT INTO public.users (username, email, full_name, is_verified, bio)
VALUES ('TudorAOrban', 'tudororban2@gmail.com', 'Tudor Andrei Orban', TRUE, 'Junior Developer');
INSERT INTO public.users (username, email, full_name, is_verified, bio)
VALUES ('AndrewJS', 'andrew92@gmail.com', 'Andrew Josh Smith', TRUE, 'AI Researcher');

CREATE TABLE public.projects (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL,
	title VARCHAR(250) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	description TEXT,
	is_public BOOLEAN DEFAULT FALSE,
	research_score DECIMAL,
	h_index INT,
	total_citations INT,
	total_upvotes INT,
	project_metadata JSONB,
	current_project_version_id INT
);

INSERT INTO public.projects (name, title, description, is_public)
VALUES ('Alphafold', 'Alphafold - New model for protein folding', 'A new model...', TRUE);

CREATE TABLE public.project_users (
    user_id INT NOT NULL,
    project_id INT NOT NULL,
    role VARCHAR(50),
    PRIMARY KEY (user_id, project_id),
    FOREIGN KEY (user_id) REFERENCES public.users (id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES public.projects (id) ON DELETE CASCADE
);

INSERT INTO public.project_users (user_id, project_id, role)
VALUES (1, 1, 'Main Author');
INSERT INTO public.project_users (user_id, project_id, role)
VALUES (2, 1, 'Contributor');
