--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: issue_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.issue_status AS ENUM (
    'Open',
    'Closed'
);


ALTER TYPE public.issue_status OWNER TO postgres;

--
-- Name: issue_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.issue_type AS ENUM (
    'ProjectIssue',
    'WorkIssue'
);


ALTER TYPE public.issue_type OWNER TO postgres;

--
-- Name: review_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.review_status AS ENUM (
    'InProgress',
    'Submitted'
);


ALTER TYPE public.review_status OWNER TO postgres;

--
-- Name: review_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.review_type AS ENUM (
    'ProjectReview',
    'WorkReview'
);


ALTER TYPE public.review_type OWNER TO postgres;

--
-- Name: work_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.work_type AS ENUM (
    'Paper',
    'Experiment',
    'Dataset',
    'DataAnalysis',
    'AIModel',
    'CodeBlock'
);


ALTER TYPE public.work_type OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: issue_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_users (
    user_id integer NOT NULL,
    issue_id integer NOT NULL,
    role character varying(50)
);


ALTER TABLE public.issue_users OWNER TO postgres;

--
-- Name: issues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issues (
    id integer NOT NULL,
    issue_type public.issue_type,
    project_id integer,
    work_id integer,
    work_type public.work_type,
    name character varying(50) NOT NULL,
    title character varying(250) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    description text,
    is_public boolean DEFAULT false,
    status public.issue_status,
    total_upvotes integer
);


ALTER TABLE public.issues OWNER TO postgres;

--
-- Name: issues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.issues_id_seq OWNER TO postgres;

--
-- Name: issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issues_id_seq OWNED BY public.issues.id;


--
-- Name: project_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_users (
    user_id integer NOT NULL,
    project_id integer NOT NULL,
    role character varying(50)
);


ALTER TABLE public.project_users OWNER TO postgres;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    title character varying(250) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    description text,
    is_public boolean DEFAULT false,
    research_score numeric,
    h_index integer,
    total_citations integer,
    total_upvotes integer,
    project_metadata jsonb,
    current_project_version_id integer
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: review_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review_users (
    user_id integer NOT NULL,
    review_id integer NOT NULL,
    role character varying(50)
);


ALTER TABLE public.review_users OWNER TO postgres;

--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    review_type public.review_type,
    project_id integer,
    work_id integer,
    work_type public.work_type,
    name character varying(50) NOT NULL,
    title character varying(250) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    description text,
    is_public boolean DEFAULT false,
    status public.review_status,
    total_upvotes integer
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    full_name character varying(100),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    is_verified boolean DEFAULT false,
    avatar_url character varying(200),
    bio text,
    research_score numeric,
    h_index integer,
    total_citations integer,
    total_upvotes integer,
    user_details jsonb
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: work_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work_users (
    user_id integer NOT NULL,
    work_id integer NOT NULL,
    role character varying(50)
);


ALTER TABLE public.work_users OWNER TO postgres;

--
-- Name: works; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.works (
    id integer NOT NULL,
    work_type public.work_type,
    project_id integer,
    name character varying(50) NOT NULL,
    title character varying(250) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    description text,
    is_public boolean DEFAULT false,
    research_score numeric,
    total_citations integer,
    total_upvotes integer,
    current_work_version_id integer,
    work_metadata jsonb,
    file_location jsonb
);


ALTER TABLE public.works OWNER TO postgres;

--
-- Name: works_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.works_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.works_id_seq OWNER TO postgres;

--
-- Name: works_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.works_id_seq OWNED BY public.works.id;


--
-- Name: issues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues ALTER COLUMN id SET DEFAULT nextval('public.issues_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: works id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.works ALTER COLUMN id SET DEFAULT nextval('public.works_id_seq'::regclass);


--
-- Data for Name: issue_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_users (user_id, issue_id, role) FROM stdin;
1	1	Main Author
2	1	Contributor
1	2	Main Author
\.


--
-- Data for Name: issues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issues (id, issue_type, project_id, work_id, work_type, name, title, created_at, updated_at, description, is_public, status, total_upvotes) FROM stdin;
1	ProjectIssue	1	\N	\N	Alphafold introduction	Alphafold - New model for protein folding	2024-09-11 14:49:47.154233+00	2024-09-11 14:49:47.154233+00	A new model...	t	Open	\N
2	WorkIssue	\N	1	Paper	An experiment for Alphafold	An experiment to determine new materials	2024-09-11 14:49:47.154233+00	2024-09-11 14:49:47.154233+00	A new model...	t	Closed	\N
\.


--
-- Data for Name: project_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project_users (user_id, project_id, role) FROM stdin;
1	1	Main Author
2	1	Contributor
1	2	Contributor
1	3	Main Author
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, name, title, created_at, updated_at, description, is_public, research_score, h_index, total_citations, total_upvotes, project_metadata, current_project_version_id) FROM stdin;
1	Alphafold	Alphafold - New model for protein folding	2024-09-11 14:49:47.154233+00	2024-09-11 14:49:47.154233+00	A new model...	t	\N	\N	\N	\N	\N	\N
2	Derden	Derden - superconductive material	2024-09-11 14:49:47.154233+00	2024-09-11 14:49:47.154233+00	A material that manifests superconductive properties...	t	\N	\N	\N	\N	\N	\N
3	VaismanCYManifolds	Vaisman Calabi-Yau manifolds	2024-09-11 14:49:47.154233+00	2024-09-11 14:49:47.154233+00	We prove several properties of Vaisman manifolds with trivial canonical bundle...	t	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: review_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review_users (user_id, review_id, role) FROM stdin;
1	1	Main Author
2	1	Contributor
1	2	Main Author
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, review_type, project_id, work_id, work_type, name, title, created_at, updated_at, description, is_public, status, total_upvotes) FROM stdin;
1	ProjectReview	1	\N	\N	Alphafold introduction	Alphafold - New model for protein folding	2024-09-11 14:49:47.154233+00	2024-09-11 14:49:47.154233+00	A new model...	t	InProgress	\N
2	WorkReview	\N	1	Paper	An experiment for Alphafold	An experiment to determine new materials	2024-09-11 14:49:47.154233+00	2024-09-11 14:49:47.154233+00	A new model...	t	Submitted	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, full_name, created_at, updated_at, is_verified, avatar_url, bio, research_score, h_index, total_citations, total_upvotes, user_details) FROM stdin;
1	TudorAOrban	tudororban2@gmail.com	Tudor Andrei Orban	2024-09-11 14:49:47.154233+00	2024-09-11 14:49:47.154233+00	t	\N	Junior Developer	\N	\N	\N	\N	\N
2	AndrewJS	andrew92@gmail.com	Andrew Josh Smith	2024-09-11 14:49:47.154233+00	2024-09-11 14:49:47.154233+00	t	\N	AI Researcher	\N	\N	\N	\N	\N
3	Francis91	fredg91@gmail.com	Francis Edgard	2024-09-11 14:49:47.154233+00	2024-09-11 14:49:47.154233+00	t	\N	Materials	\N	\N	\N	\N	\N
\.


--
-- Data for Name: work_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.work_users (user_id, work_id, role) FROM stdin;
1	1	Main Author
2	1	Contributor
1	2	Main Author
1	3	Main Author
3	1	Main Author
\.


--
-- Data for Name: works; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.works (id, work_type, project_id, name, title, created_at, updated_at, description, is_public, research_score, total_citations, total_upvotes, current_work_version_id, work_metadata, file_location) FROM stdin;
1	Paper	1	Alphafold introduction	Alphafold - New model for protein folding	2024-09-11 14:49:47.154233+00	2024-09-11 14:49:47.154233+00	A new model...	t	\N	\N	\N	\N	\N	\N
2	Experiment	1	An experiment for Alphafold	An experiment to determine new materials	2024-09-11 14:49:47.154233+00	2024-09-11 14:49:47.154233+00	A new model...	t	\N	\N	\N	\N	\N	\N
3	Paper	1	Vaisman CY Manifolds	A new type of CY manifolds	2024-09-11 14:49:47.154233+00	2024-09-11 14:49:47.154233+00	In the non-Kahlerian world...	t	\N	\N	\N	\N	\N	\N
\.


--
-- Name: issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issues_id_seq', 2, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 3, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: works_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.works_id_seq', 3, true);


--
-- Name: issue_users issue_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_users
    ADD CONSTRAINT issue_users_pkey PRIMARY KEY (user_id, issue_id);


--
-- Name: issues issues_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT issues_name_key UNIQUE (name);


--
-- Name: issues issues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (id);


--
-- Name: project_users project_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_users
    ADD CONSTRAINT project_users_pkey PRIMARY KEY (user_id, project_id);


--
-- Name: projects projects_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_name_key UNIQUE (name);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: review_users review_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_users
    ADD CONSTRAINT review_users_pkey PRIMARY KEY (user_id, review_id);


--
-- Name: reviews reviews_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_name_key UNIQUE (name);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: work_users work_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_users
    ADD CONSTRAINT work_users_pkey PRIMARY KEY (user_id, work_id);


--
-- Name: works works_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.works
    ADD CONSTRAINT works_name_key UNIQUE (name);


--
-- Name: works works_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.works
    ADD CONSTRAINT works_pkey PRIMARY KEY (id);


--
-- Name: issue_users issue_users_issue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_users
    ADD CONSTRAINT issue_users_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES public.issues(id);


--
-- Name: issue_users issue_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_users
    ADD CONSTRAINT issue_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: issues issues_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT issues_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: issues issues_work_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT issues_work_id_fkey FOREIGN KEY (work_id) REFERENCES public.works(id);


--
-- Name: project_users project_users_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_users
    ADD CONSTRAINT project_users_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: project_users project_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_users
    ADD CONSTRAINT project_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: review_users review_users_review_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_users
    ADD CONSTRAINT review_users_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews(id);


--
-- Name: review_users review_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_users
    ADD CONSTRAINT review_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: reviews reviews_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: reviews reviews_work_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_work_id_fkey FOREIGN KEY (work_id) REFERENCES public.works(id);


--
-- Name: work_users work_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_users
    ADD CONSTRAINT work_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: work_users work_users_work_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_users
    ADD CONSTRAINT work_users_work_id_fkey FOREIGN KEY (work_id) REFERENCES public.works(id) ON DELETE CASCADE;


--
-- Name: works works_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.works
    ADD CONSTRAINT works_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

