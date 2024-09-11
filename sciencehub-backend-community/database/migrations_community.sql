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
	FOREIGN KEY (user_id) REFERENCES public.users (id)
);

INSERT INTO public.discussions (user_id, title, name, content, is_public, total_upvotes, total_shares, total_views)
VALUES (1, 'About Alphafold', 'Alph#12', 'I am not sure how much Alphafold will impact the world of protein folding', FALSE, 123, 412, 4295);
