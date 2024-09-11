-- Database: sciencehub_community_database

-- DROP DATABASE IF EXISTS sciencehub_community_database;

CREATE DATABASE sciencehub_community_database
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
CREATE TABLE public.discussions (
	id SERIAL PRIMARY KEY,
	user_id INT NOT NULL,
	title VARCHAR(250) NOT NULL,
	content TEXT,
	name VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	is_public BOOLEAN DEFAULT FALSE,
	total_upvotes INT,
	total_shares INT,
	total_views INT,
);

INSERT INTO public.discussions (user_id, title, name, content, is_public, total_upvotes, total_shares, total_views)
VALUES (1, 'About Alphafold', 'Alph#12', 'I am not sure how much Alphafold will impact the world of protein folding', FALSE, 123, 412, 4295);

CREATE TABLE public.comments (
	id SERIAL PRIMARY KEY,
	user_id INT NOT NULL,
	discussion_id INT NOT NULL,
	parent_comment_id INT,
	title VARCHAR(250),
	content TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	is_public BOOLEAN DEFAULT FALSE,
	total_upvotes INT,
	total_shares INT,
	total_views INT,
	total_comments INT,
	FOREIGN KEY (discussion_id) REFERENCES public.discussions (id),
	FOREIGN KEY (parent_comment_id) REFERENCES public.comments (id)
);

INSERT INTO public.comments (user_id, discussion_id, title, content, is_public, total_upvotes, total_shares, total_views, total_comments)
VALUES (1, 1, 'Alphafold Discussion', 'A discussion about the latest developments in protein folding...', TRUE, 12, 14, 351, 9);

INSERT INTO public.comments (user_id, discussion_id, parent_comment_id, title, content, is_public, total_upvotes, total_shares, total_views, total_comments)
VALUES (1, 1, 1, 'Alphafold Comment', 'A ...', TRUE, 2, 1, 49, 2);