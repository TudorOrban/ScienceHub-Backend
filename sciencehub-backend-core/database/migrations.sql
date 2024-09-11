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
INSERT INTO public.users (username, email, full_name, is_verified, bio)
VALUES ('Francis91', 'fredg91@gmail.com', 'Francis Edgard', TRUE, 'Materials');

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

INSERT INTO public.projects (name, title, description, is_public)
VALUES ('Derden', 'Derden - superconductive material', 'A material that manifests superconductive properties...', TRUE);

INSERT INTO public.projects (name, title, description, is_public)
VALUES ('VaismanCYManifolds', 'Vaisman Calabi-Yau manifolds', 'We prove several properties of Vaisman manifolds with trivial canonical bundle...', TRUE);

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
INSERT INTO public.project_users (user_id, project_id, role)
VALUES (1, 2, 'Contributor');
INSERT INTO public.project_users (user_id, project_id, role)
VALUES (1, 3, 'Main Author');

SELECT * FROM public.projects;

CREATE TYPE work_type AS ENUM ('Paper', 'Experiment', 'Dataset', 'DataAnalysis', 'AIModel', 'CodeBlock');

CREATE TABLE public.works (
	id SERIAL PRIMARY KEY,
	work_type work_type,
	project_id INT,
	name VARCHAR(50) UNIQUE NOT NULL,
	title VARCHAR(250) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	description TEXT,
	is_public BOOLEAN DEFAULT FALSE,
	research_score DECIMAL,
	total_citations INT,
	total_upvotes INT,
	current_work_version_id INT,
	work_metadata JSONB,
	file_location JSONB,
	FOREIGN KEY (project_id) REFERENCES public.projects (id) ON DELETE CASCADE
);

INSERT INTO public.works (work_type, project_id, name, title, description, is_public)
VALUES ('Paper', 1, 'Alphafold introduction', 'Alphafold - New model for protein folding', 'A new model...', TRUE);
INSERT INTO public.works (work_type, project_id, name, title, description, is_public)
VALUES ('Experiment', 1, 'An experiment for Alphafold', 'An experiment to determine new materials', 'A new model...', TRUE);
INSERT INTO public.works (work_type, project_id, name, title, description, is_public)
VALUES ('Paper', 1, 'Vaisman CY Manifolds', 'A new type of CY manifolds', 'In the non-Kahlerian world...', TRUE);

CREATE TABLE public.work_users (
    user_id INT NOT NULL,
    work_id INT NOT NULL,
    role VARCHAR(50),
    PRIMARY KEY (user_id, work_id),
    FOREIGN KEY (user_id) REFERENCES public.users (id) ON DELETE CASCADE,
    FOREIGN KEY (work_id) REFERENCES public.works (id) ON DELETE CASCADE
);

INSERT INTO public.work_users (user_id, work_id, role)
VALUES (1, 1, 'Main Author');
INSERT INTO public.work_users (user_id, work_id, role)
VALUES (2, 1, 'Contributor');
INSERT INTO public.work_users (user_id, work_id, role)
VALUES (1, 2, 'Main Author');
INSERT INTO public.work_users (user_id, work_id, role)
VALUES (1, 3, 'Main Author');
INSERT INTO public.work_users (user_id, work_id, role)
VALUES (3, 1, 'Main Author');

CREATE TYPE issue_type AS ENUM ('ProjectIssue', 'WorkIssue');
CREATE TYPE issue_status AS ENUM ('Open', 'Closed');

CREATE TABLE public.issues (
	id SERIAL PRIMARY KEY,
	issue_type issue_type,
	project_id INT,
	work_id INT,
	work_type work_type,
	name VARCHAR(50) UNIQUE NOT NULL,
	title VARCHAR(250) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	description TEXT,
	is_public BOOLEAN DEFAULT FALSE,
	status issue_status,
	total_upvotes INT,
	FOREIGN KEY (project_id) REFERENCES public.projects (id),
	FOREIGN KEY (work_id) REFERENCES public.works (id)
);

INSERT INTO public.issues (issue_type, project_id, name, title, description, is_public, status)
VALUES ('ProjectIssue', 1, 'Alphafold introduction', 'Alphafold - New model for protein folding', 'A new model...', TRUE, 'Open');
INSERT INTO public.issues (issue_type, work_id, work_type, name, title, description, is_public, status)
VALUES ('WorkIssue', 1, 'Paper', 'An experiment for Alphafold', 'An experiment to determine new materials', 'A new model...', TRUE, 'Closed');

CREATE TABLE public.issue_users (
    user_id INT NOT NULL,
    issue_id INT NOT NULL,
    role VARCHAR(50),
    PRIMARY KEY (user_id, issue_id),
    FOREIGN KEY (user_id) REFERENCES public.users (id),
    FOREIGN KEY (issue_id) REFERENCES public.issues (id)
);

INSERT INTO public.issue_users (user_id, issue_id, role)
VALUES (1, 1, 'Main Author');
INSERT INTO public.issue_users (user_id, issue_id, role)
VALUES (2, 1, 'Contributor');
INSERT INTO public.issue_users (user_id, issue_id, role)
VALUES (1, 2, 'Main Author');


CREATE TYPE review_type AS ENUM ('ProjectReview', 'WorkReview');
CREATE TYPE review_status AS ENUM ('InProgress', 'Submitted');

CREATE TABLE public.reviews (
	id SERIAL PRIMARY KEY,
	review_type review_type,
	project_id INT,
	work_id INT,
	work_type work_type,
	name VARCHAR(50) UNIQUE NOT NULL,
	title VARCHAR(250) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	description TEXT,
	is_public BOOLEAN DEFAULT FALSE,
	status review_status,
	total_upvotes INT,
	FOREIGN KEY (project_id) REFERENCES public.projects (id),
	FOREIGN KEY (work_id) REFERENCES public.works (id)
);

INSERT INTO public.reviews (review_type, project_id, name, title, description, is_public, status)
VALUES ('ProjectReview', 1, 'Alphafold introduction', 'Alphafold - New model for protein folding', 'A new model...', TRUE, 'InProgress');
INSERT INTO public.reviews (review_type, work_id, work_type, name, title, description, is_public, status)
VALUES ('WorkReview', 1, 'Paper', 'An experiment for Alphafold', 'An experiment to determine new materials', 'A new model...', TRUE, 'Submitted');

CREATE TABLE public.review_users (
    user_id INT NOT NULL,
    review_id INT NOT NULL,
    role VARCHAR(50),
    PRIMARY KEY (user_id, review_id),
    FOREIGN KEY (user_id) REFERENCES public.users (id),
    FOREIGN KEY (review_id) REFERENCES public.reviews (id)
);

INSERT INTO public.review_users (user_id, review_id, role)
VALUES (1, 1, 'Main Author');
INSERT INTO public.review_users (user_id, review_id, role)
VALUES (2, 1, 'Contributor');
INSERT INTO public.review_users (user_id, review_id, role)
VALUES (1, 2, 'Main Author');