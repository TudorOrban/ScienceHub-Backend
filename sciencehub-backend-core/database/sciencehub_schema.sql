--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6
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
-- Name: auth; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA auth;


--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA extensions;


--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA graphql;


--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA graphql_public;


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA pgbouncer;


--
-- Name: pgsodium; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA pgsodium;


--
-- Name: pgsodium; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;


--
-- Name: EXTENSION pgsodium; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA realtime;


--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA storage;


--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA vault;


--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


--
-- Name: chat_types; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.chat_types AS ENUM (
    'Private chat',
    'Group chat'
);


--
-- Name: TYPE chat_types; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE public.chat_types IS 'Types of chat rooms';


--
-- Name: issue_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.issue_status AS ENUM (
    'Opened',
    'Closed'
);


--
-- Name: TYPE issue_status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE public.issue_status IS 'The possible status types of a project/work issue';


--
-- Name: pricing_plan_interval; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pricing_plan_interval AS ENUM (
    'day',
    'week',
    'month',
    'year'
);


--
-- Name: pricing_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pricing_type AS ENUM (
    'one_time',
    'recurring'
);


--
-- Name: review_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.review_status AS ENUM (
    'In progress',
    'Submitted'
);


--
-- Name: TYPE review_status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE public.review_status IS 'The possible status types of a project/work review';


--
-- Name: review_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.review_type AS ENUM (
    'Community Review',
    'Blind Review'
);


--
-- Name: TYPE review_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE public.review_type IS 'The possible types of a project/work review';


--
-- Name: role; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.role AS ENUM (
    'Main Author',
    'Contributor'
);


--
-- Name: TYPE role; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE public.role IS 'Roles of users with respect to project/work';


--
-- Name: submission_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.submission_status AS ENUM (
    'In progress',
    'Submitted',
    'Accepted'
);


--
-- Name: TYPE submission_status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE public.submission_status IS 'The possible status types of a project/work submission';


--
-- Name: subscription_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.subscription_status AS ENUM (
    'trialing',
    'active',
    'canceled',
    'incomplete',
    'incomplete_expired',
    'past_due',
    'unpaid'
);


--
-- Name: work_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.work_type AS ENUM (
    'Paper',
    'Experiment',
    'Dataset',
    'Data Analysis',
    'AI Model',
    'Code Block'
);


--
-- Name: TYPE work_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE public.work_type IS 'The types of works in ScienceHub (using labels)';


--
-- Name: work_submissions_in_bulk_result; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.work_submissions_in_bulk_result AS (
	id bigint,
	work_id bigint,
	work_type public.work_type,
	initial_work_version_id bigint,
	final_work_version_id bigint,
	status public.submission_status,
	title text,
	description text,
	public boolean,
	work_delta jsonb,
	file_changes jsonb,
	submitted_data jsonb,
	accepted_data jsonb
);


--
-- Name: action; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


--
-- Name: CAST (character varying AS public.work_type); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (character varying AS public.work_type) WITH INOUT AS ASSIGNMENT;


--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

    REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
    REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

    GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
  END IF;
END;
$$;


--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: -
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;


--
-- Name: fetch_work_submissions(integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.fetch_work_submissions(version_pairs integer[]) RETURNS SETOF public.work_submissions_in_bulk_result
    LANGUAGE plpgsql
    AS $$
DECLARE
    version_pair int[];
    result_row work_submissions_in_bulk_result; -- Declare a variable of your custom type
BEGIN
    FOREACH version_pair SLICE 1 IN ARRAY version_pairs LOOP
        -- For each pair, execute the query and store the result
        FOR result_row IN
            SELECT 
                ws.id, 
                ws.work_id, 
                ws.work_type, 
                ws.initial_work_version_id, 
                ws.final_work_version_id, 
                ws.status,
                ws.title,
                ws.description,
                ws.public,
                ws.work_delta,
                ws.file_changes, 
                ws.submitted_data, 
                ws.accepted_data
            FROM work_submissions ws
            WHERE ws.initial_work_version_id = version_pair[1]
            AND ws.final_work_version_id = version_pair[2]
        LOOP
            RETURN NEXT result_row; -- Return each row
        END LOOP;
    END LOOP;
    RETURN; -- Final return at the end of the function
END;
$$;


--
-- Name: fetch_work_submissions(bigint[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.fetch_work_submissions(version_pairs bigint[]) RETURNS SETOF public.work_submissions_in_bulk_result
    LANGUAGE plpgsql
    AS $$
DECLARE
    i int;
BEGIN
    FOR i IN 1..array_upper(version_pairs, 1) - 1 BY 2 LOOP
        RETURN QUERY SELECT 
            ws.id, 
            ws.work_id, 
            ws.work_type, 
            ws.initial_work_version_id, 
            ws.final_work_version_id, 
            ws.status,
            ws.title,
            ws.description,
            ws.public,
            ws.work_delta,
            ws.file_changes, 
            ws.submitted_data, 
            ws.accepted_data
        FROM work_submissions ws
        WHERE ws.initial_work_version_id = version_pairs[i]
        AND ws.final_work_version_id = version_pairs[i + 1];
    END LOOP;
    RETURN; 
END;
$$;


--
-- Name: handle_new_user(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.handle_new_user() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
  begin
    insert into public.users (id, full_name, avatar_url)
    values (new.id, new.raw_user_meta_data->>'full_name', new.raw_user_meta_data->>'avatar_url');
    return new;
  end;
$$;


--
-- Name: new_fetch_work_submissions(bigint[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.new_fetch_work_submissions(version_pairs bigint[]) RETURNS SETOF public.work_submissions_in_bulk_result
    LANGUAGE plpgsql
    AS $$
DECLARE
    i int;
    query text := ''; -- Initialize an empty query string
BEGIN
    FOR i IN 1..array_upper(version_pairs, 1) - 1 BY 2 LOOP
        -- Append each SELECT statement to the query string with UNION ALL
        query := query || format('SELECT ws.id, ws.work_id, ws.work_type, ws.initial_work_version_id, ws.final_work_version_id, ws.status, ws.title, ws.description, ws.public, ws.work_delta, ws.file_changes, ws.submitted_data, ws.accepted_data FROM work_submissions ws WHERE ws.initial_work_version_id = %s AND ws.final_work_version_id = %s', version_pairs[i], version_pairs[i + 1]);
        IF i < array_upper(version_pairs, 1) - 1 THEN
            query := query || ' UNION ALL '; -- Add UNION ALL except for the last iteration
        END IF;
    END LOOP;

    -- Execute the dynamically built query
    RETURN QUERY EXECUTE query;
END;
$$;


--
-- Name: update_children_comments_count_function(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_children_comments_count_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.parent_comment_id IS NOT NULL THEN
    UPDATE discussion_comments
    SET children_comments_count = children_comments_count + 1
    WHERE id = NEW.parent_comment_id;
  END IF;

  RETURN NEW;
END
$$;


--
-- Name: update_citations_count(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_citations_count() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    CASE
        WHEN NEW.target_work_type = 'Paper' THEN
            UPDATE papers SET citations_count = citations_count + 1 WHERE id = NEW.target_work_id;
        WHEN NEW.target_work_type = 'Experiment' THEN
            UPDATE experiments SET citations_count = citations_count + 1 WHERE id = NEW.target_work_id;
        WHEN NEW.target_work_type = 'Dataset' THEN
            UPDATE datasets SET citations_count = citations_count + 1 WHERE id = NEW.target_work_id;
        WHEN NEW.target_work_type = 'Data Analysis' THEN
            UPDATE data_analyses SET citations_count = citations_count + 1 WHERE id = NEW.target_work_id;
        WHEN NEW.target_work_type = 'AI Model' THEN
            UPDATE ai_models SET citations_count = citations_count + 1 WHERE id = NEW.target_work_id;
        WHEN NEW.target_work_type = 'Code Block' THEN
            UPDATE code_blocks SET citations_count = citations_count + 1 WHERE id = NEW.target_work_id;
    END CASE;
    RETURN NEW;
END;
$$;


--
-- Name: update_project_delta_partial(integer, jsonb); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_project_delta_partial(submission_id integer, delta_changes jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    key text;
    value jsonb;
    current_project_delta jsonb; -- Declare the variable to store the current project_delta
BEGIN
    -- Retrieve the current project_delta
    SELECT COALESCE(project_delta, '{}'::jsonb) INTO current_project_delta FROM project_submissions WHERE id = submission_id;

    -- Iterate over each key-value pair in delta_changes and update the project_delta JSONB column
    FOR key, value IN SELECT * FROM jsonb_each(delta_changes)
    LOOP
        current_project_delta = jsonb_set(
            current_project_delta, 
            ARRAY[key], 
            value, 
            true
        );
    END LOOP;

    -- Update the project_delta field in the project_submissions table
    UPDATE project_submissions
    SET project_delta = current_project_delta
    WHERE id = submission_id;
END;
$$;


--
-- Name: update_work_delta_field(integer, text[], jsonb); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_work_delta_field(submission_id integer, field_path text[], new_value jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE work_submissions
    SET work_delta = jsonb_set(
        COALESCE(work_delta, '{}'::jsonb), -- Ensure work_delta is not null
        field_path, 
        new_value, 
        true
    )
    WHERE id = submission_id;
END;
$$;


--
-- Name: update_work_delta_fields(integer, text[], jsonb[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_work_delta_fields(submission_id integer, keys text[], new_values jsonb[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    i integer;
    new_work_delta jsonb;
BEGIN
    -- Retrieve the current work_delta
    SELECT COALESCE(work_delta, '{}'::jsonb) INTO new_work_delta FROM work_submissions WHERE id = submission_id;

    -- Apply updates for each key
    FOR i IN 1 .. array_length(keys, 1) LOOP
        new_work_delta = jsonb_set(
            new_work_delta, 
            ARRAY[keys[i]], 
            new_values[i], 
            true
        );
    END LOOP;

    -- Update the work_delta field in the table
    UPDATE work_submissions
    SET work_delta = new_work_delta
    WHERE id = submission_id;
END;
$$;


--
-- Name: update_work_delta_partial(integer, jsonb); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_work_delta_partial(submission_id integer, delta_changes jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    key text;
    value jsonb;
    current_work_delta jsonb; -- Declare the variable to store the current work_delta
BEGIN
    -- Retrieve the current work_delta
    SELECT COALESCE(work_delta, '{}'::jsonb) INTO current_work_delta FROM work_submissions WHERE id = submission_id;

    -- Iterate over each key-value pair in delta_changes and update the work_delta JSONB column
    FOR key, value IN SELECT * FROM jsonb_each(delta_changes)
    LOOP
        current_work_delta = jsonb_set(
            current_work_delta, 
            ARRAY[key], 
            value, 
            true
        );
    END LOOP;

    -- Update the work_delta field in the work_submissions table
    UPDATE work_submissions
    SET work_delta = current_work_delta
    WHERE id = submission_id;
END;
$$;


--
-- Name: update_work_deltas(integer, text[], jsonb[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_work_deltas(submission_id integer, field_paths text[], new_values jsonb[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    i integer;
    new_work_delta jsonb;
BEGIN
    -- Initialize new_work_delta with the current work_delta or an empty JSONB object
    SELECT COALESCE(work_delta, '{}'::jsonb) INTO new_work_delta FROM work_submissions WHERE id = submission_id;

    -- Apply each update in turn
    FOR i IN 1 .. array_length(field_paths, 1) LOOP
        new_work_delta = jsonb_set(
            new_work_delta, 
            field_paths[i], 
            new_values[i], 
            true
        );
    END LOOP;

    -- Update the work_delta field in the table with the new JSONB object
    UPDATE work_submissions
    SET work_delta = new_work_delta
    WHERE id = submission_id;
END;
$$;


--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or action = 'DELETE'
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
    select string_to_array(name, '/') into _parts;
    select _parts[array_length(_parts,1)] into _filename;
    -- @todo return the last part instead of 2
    return split_part(_filename, '.', 2);
END
$$;


--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
    select string_to_array(name, '/') into _parts;
    return _parts[array_length(_parts,1)];
END
$$;


--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
    select string_to_array(name, '/') into _parts;
    return _parts[1:array_length(_parts,1)-1];
END
$$;


--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


--
-- Name: secrets_encrypt_secret_secret(); Type: FUNCTION; Schema: vault; Owner: -
--

CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
		BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
		RETURN new;
		END;
		$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text
);


--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone
);


--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: -
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: ai_models; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_models (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    title text,
    description text,
    code_path text,
    model_type text,
    model_path text,
    public boolean,
    folder_id bigint,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    work_type text DEFAULT 'AI Model'::text,
    current_work_version_id bigint,
    work_metadata jsonb DEFAULT '{}'::jsonb,
    file_location jsonb DEFAULT '{}'::jsonb,
    submitted boolean DEFAULT false,
    link text,
    research_score integer DEFAULT 0,
    h_index integer DEFAULT 0,
    citations_count bigint DEFAULT '0'::bigint
);


--
-- Name: AI_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.ai_models ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."AI_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ai_model_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_model_teams (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    ai_model_id bigint NOT NULL,
    role public.role,
    team_id uuid NOT NULL
);


--
-- Name: ai_model_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_model_users (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    ai_model_id bigint NOT NULL,
    role public.role
);


--
-- Name: bookmarks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bookmarks (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid,
    object_type text,
    object_id bigint,
    bookmark_data json,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text)
);


--
-- Name: bookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bookmarks ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bookmarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: chat_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chat_messages (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    chat_id bigint NOT NULL,
    user_id uuid NOT NULL,
    content text,
    updated_at timestamp with time zone,
    seen boolean DEFAULT false
);


--
-- Name: chat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.chat_messages ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.chat_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: chat_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chat_teams (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    chat_id bigint NOT NULL,
    team_id uuid NOT NULL
);


--
-- Name: chat_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chat_users (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    chat_id bigint NOT NULL,
    user_id uuid NOT NULL
);


--
-- Name: chats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chats (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    type public.chat_types,
    title text,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    link text
);


--
-- Name: citations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.citations (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    source_object_id text,
    source_object_type text,
    target_object_id text,
    target_object_type text,
    updated_at timestamp with time zone
);


--
-- Name: citations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.citations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.citations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: code_block_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.code_block_teams (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    team_id uuid NOT NULL,
    code_block_id bigint NOT NULL,
    role public.role
);


--
-- Name: code_block_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.code_block_users (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    code_block_id bigint NOT NULL,
    role text
);


--
-- Name: code_blocks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.code_blocks (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    title text,
    description text,
    code_path text,
    folder_id integer,
    public boolean,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    current_work_version_id bigint,
    work_metadata jsonb DEFAULT '{}'::jsonb,
    file_location jsonb DEFAULT '{}'::jsonb,
    submitted boolean DEFAULT false,
    link text,
    research_score integer DEFAULT 0,
    h_index integer DEFAULT 0,
    citations_count bigint DEFAULT '0'::bigint,
    work_type public.work_type DEFAULT 'Code Block'::public.work_type
);


--
-- Name: code_blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.code_blocks ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.code_blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: comment_upvotes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comment_upvotes (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    comment_id integer NOT NULL
);


--
-- Name: conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.chats ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.conversations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: data_analyses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.data_analyses (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    title text,
    description text,
    public boolean,
    folder_id integer,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    work_type text DEFAULT 'Data Analysis'::text,
    current_work_version_id bigint,
    work_metadata jsonb DEFAULT '{}'::jsonb,
    file_location jsonb DEFAULT '{}'::jsonb,
    submitted boolean DEFAULT false,
    link text,
    research_score integer DEFAULT 0,
    h_index integer DEFAULT 0,
    citations_count integer DEFAULT 0
);


--
-- Name: data_analysis_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.data_analysis_teams (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    data_analysis_id bigint NOT NULL,
    role text,
    team_id uuid NOT NULL
);


--
-- Name: data_analysis_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.data_analysis_users (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    data_analysis_id bigint NOT NULL,
    role text
);


--
-- Name: dataanalysis_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.data_analyses ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.dataanalysis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: dataset_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dataset_teams (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    dataset_id bigint NOT NULL,
    role text,
    team_id uuid NOT NULL
);


--
-- Name: dataset_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dataset_users (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    dataset_id bigint NOT NULL,
    role text
);


--
-- Name: datasets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.datasets (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    title text,
    description text,
    public boolean,
    folder_id integer,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    work_type text DEFAULT 'Dataset'::text,
    current_work_version_id bigint,
    dataset_location json,
    notes text[],
    work_metadata json,
    file_location json,
    submitted boolean DEFAULT false,
    link text,
    research_score integer DEFAULT 0,
    h_index integer DEFAULT 0,
    citations_count bigint DEFAULT '0'::bigint
);


--
-- Name: datasets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.datasets ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.datasets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: discussion_comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.discussion_comments (
    id integer NOT NULL,
    discussion_id integer,
    user_id uuid,
    content text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    parent_comment_id integer,
    children_comments_count integer DEFAULT 0,
    link text
);


--
-- Name: discussion_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.discussion_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: discussion_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.discussion_comments_id_seq OWNED BY public.discussion_comments.id;


--
-- Name: discussion_upvotes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.discussion_upvotes (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    discussion_id bigint NOT NULL
);


--
-- Name: discussions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.discussions (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    title text,
    user_id uuid,
    content text,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    link text
);


--
-- Name: discussions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.discussions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.discussions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: experiment_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.experiment_teams (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    experiment_id bigint NOT NULL,
    role text,
    team_id uuid NOT NULL
);


--
-- Name: experiment_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.experiment_users (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    experiment_id bigint NOT NULL,
    role text
);


--
-- Name: experiments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.experiments (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    title text,
    description text,
    methodology jsonb,
    status text,
    conclusion text,
    experiment_path text,
    folder_id integer,
    public boolean,
    objective text,
    hypothesis text,
    pdf_path text,
    supplementary_material text,
    license text,
    research_grants text[],
    updated_at timestamp with time zone DEFAULT now(),
    work_type text DEFAULT 'Experiment'::text,
    current_work_version_id bigint,
    work_metadata jsonb DEFAULT '{}'::jsonb,
    file_location jsonb DEFAULT '{}'::jsonb,
    submitted boolean DEFAULT false,
    link text,
    research_score integer DEFAULT 0,
    h_index integer DEFAULT 0,
    citations_count bigint DEFAULT '0'::bigint
);


--
-- Name: experiments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.experiments ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.experiments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: feedback_responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.feedback_responses (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    feedback_id bigint,
    content text,
    user_id uuid,
    public boolean
);


--
-- Name: feedback_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.feedback_responses ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.feedback_responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.feedbacks (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    content text,
    public boolean,
    tags jsonb[],
    title text,
    description text,
    link text
);


--
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.feedbacks ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.feedbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: field_of_research_relationships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.field_of_research_relationships (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    parent_field_id bigint NOT NULL,
    child_field_id bigint NOT NULL,
    relationship_type text
);


--
-- Name: fields_of_research; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fields_of_research (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    name text
);


--
-- Name: fields_of_research_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.fields_of_research ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.fields_of_research_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.files (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    name text,
    type text,
    content text,
    updated_at timestamp with time zone DEFAULT now(),
    project_id bigint
);


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.files ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: folders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.folders (
    id integer NOT NULL,
    parent_id integer,
    project_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: folders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.folders_id_seq OWNED BY public.folders.id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.follows (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    follower_id uuid NOT NULL,
    followed_id uuid NOT NULL
);


--
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.links (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    source_object_id text,
    source_object_type text,
    target_object_id text,
    target_object_type text,
    relationship_type text,
    updated_at timestamp with time zone
);


--
-- Name: object_relationships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.links ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.object_relationships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: paper_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.paper_teams (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    paper_id bigint NOT NULL,
    role text,
    team_id uuid NOT NULL
);


--
-- Name: paper_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.paper_users (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    paper_id bigint NOT NULL,
    role text
);


--
-- Name: papers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.papers (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    title text,
    description text,
    folder_id integer,
    public boolean,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    work_type public.work_type DEFAULT 'Paper'::public.work_type,
    current_work_version_id bigint,
    work_metadata jsonb DEFAULT '{}'::jsonb,
    abstract text,
    file_location jsonb,
    submitted boolean DEFAULT false,
    link text,
    research_score integer DEFAULT 0,
    h_index integer DEFAULT 0,
    citations_count bigint DEFAULT '0'::bigint
);


--
-- Name: papers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.papers ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.papers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: plan_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plan_users (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    plan_id bigint NOT NULL
);


--
-- Name: plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plans (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    starting_at_date timestamp with time zone,
    ending_at_date timestamp with time zone,
    title text,
    description text,
    linked_objects json,
    tags text[],
    public boolean,
    updated_at timestamp with time zone,
    color text
);


--
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.plans ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: project_ai_models; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_ai_models (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint NOT NULL,
    ai_model_id bigint NOT NULL
);


--
-- Name: project_code_blocks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_code_blocks (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint NOT NULL,
    code_block_id bigint NOT NULL
);


--
-- Name: project_data_analyses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_data_analyses (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint NOT NULL,
    data_analysis_id bigint NOT NULL
);


--
-- Name: project_datasets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_datasets (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint NOT NULL,
    dataset_id bigint NOT NULL
);


--
-- Name: project_deltas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_deltas (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    initial_project_version_id bigint,
    final_project_version_id bigint,
    delta_data json,
    updated_at timestamp with time zone
);


--
-- Name: project_deltas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.project_deltas ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.project_deltas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: project_experiments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_experiments (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint NOT NULL,
    experiment_id bigint NOT NULL
);


--
-- Name: project_fields_of_research; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_fields_of_research (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint NOT NULL,
    field_of_research_id bigint NOT NULL
);


--
-- Name: project_issue_responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_issue_responses (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid,
    content text,
    project_issue_id bigint
);


--
-- Name: project_issue_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.project_issue_responses ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.project_issue_responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: project_issue_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_issue_teams (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    team_id uuid NOT NULL,
    project_issue_id bigint NOT NULL
);


--
-- Name: project_issue_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_issue_users (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    project_issue_id bigint NOT NULL
);


--
-- Name: project_issues; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_issues (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint,
    status public.issue_status,
    title text,
    description text,
    public boolean,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    link text
);


--
-- Name: project_issues_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.project_issues ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.project_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: project_papers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_papers (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint NOT NULL,
    paper_id bigint NOT NULL
);


--
-- Name: project_review_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_review_teams (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    team_id uuid NOT NULL,
    project_review_id bigint NOT NULL
);


--
-- Name: project_review_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_review_users (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    project_review_id bigint NOT NULL
);


--
-- Name: project_reviews; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_reviews (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint,
    review_type public.review_type DEFAULT 'Community Review'::public.review_type,
    status public.review_status DEFAULT 'In progress'::public.review_status,
    title text,
    description text,
    content text,
    public boolean,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    link text
);


--
-- Name: project_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.project_reviews ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.project_reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: project_shares; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_shares (
    created_at timestamp with time zone,
    project_id bigint NOT NULL,
    sharing_user_id uuid NOT NULL
);


--
-- Name: project_snapshots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_snapshots (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint,
    project_version_id bigint,
    snapshot_data json,
    updated_at timestamp with time zone
);


--
-- Name: project_snapshots_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.project_snapshots ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.project_snapshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: project_submission_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_submission_teams (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    team_id uuid NOT NULL,
    project_submission_id bigint,
    role text
);


--
-- Name: project_submission_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_submission_users (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    project_submission_id bigint NOT NULL
);


--
-- Name: project_submissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_submissions (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint,
    initial_project_version_id bigint,
    final_project_version_id bigint,
    status public.submission_status DEFAULT 'In progress'::public.submission_status,
    title text,
    description text,
    public boolean,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    project_delta jsonb DEFAULT '{}'::jsonb,
    submitted_data jsonb DEFAULT '{}'::jsonb,
    accepted_data jsonb DEFAULT '{}'::jsonb,
    link text
);


--
-- Name: project_submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.project_submissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.project_submissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: project_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_teams (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint NOT NULL,
    role text,
    team_id uuid NOT NULL
);


--
-- Name: project_upvotes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_upvotes (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint NOT NULL,
    upvoting_user_id uuid NOT NULL
);


--
-- Name: project_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_users (
    user_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint NOT NULL,
    role text
);


--
-- Name: project_version_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_version_teams (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    team_id uuid NOT NULL,
    project_version_id bigint NOT NULL,
    role text
);


--
-- Name: project_version_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_version_users (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_version_id bigint NOT NULL,
    role text,
    user_id uuid NOT NULL
);


--
-- Name: project_versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_versions (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    version_number bigint,
    created_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    description text,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    works json,
    version_tag text
);


--
-- Name: project_versions_graphs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_versions_graphs (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint,
    graph_data jsonb,
    title text,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    version_edges jsonb DEFAULT '[]'::jsonb
);


--
-- Name: project_versions_graphs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.project_versions_graphs ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.project_versions_graphs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: project_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.project_versions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.project_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: project_views; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_views (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint NOT NULL,
    viewing_user_id uuid NOT NULL
);


--
-- Name: project_work_submissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_work_submissions (
    project_submission_id bigint NOT NULL,
    work_submission_id bigint NOT NULL
);


--
-- Name: project_works; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_works (
    project_id bigint NOT NULL,
    work_id bigint NOT NULL
);


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    title text,
    description text,
    public boolean,
    image_path text,
    stars integer,
    research_score bigint,
    h_index integer,
    total_project_citations_count bigint,
    total_citations_count bigint,
    name text,
    current_project_version_id bigint,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    project_metadata jsonb DEFAULT '{}'::jsonb,
    link text
);


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.projects ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: team_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.team_users (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    role text,
    team_id uuid NOT NULL
);


--
-- Name: teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teams (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    team_name text,
    description text,
    public boolean,
    team_username text,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    link text
);


--
-- Name: user_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_settings (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    research_highlights json,
    pinned_pages json,
    header_off boolean,
    editor_settings json
);


--
-- Name: user_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_status (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid,
    is_online boolean,
    last_seen timestamp with time zone
);


--
-- Name: user_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.user_status ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    full_name text NOT NULL,
    avatar_url text,
    billing_address jsonb,
    payment_method jsonb,
    username text NOT NULL,
    email text,
    first_name text,
    last_name text,
    bio text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    number_of_projects bigint,
    number_of_works bigint,
    number_of_submissions bigint,
    research_score double precision,
    h_index bigint,
    total_citations bigint,
    total_upvotes bigint,
    reviews_count bigint,
    is_verified boolean,
    qualifications text,
    affiliations text,
    research_interests text,
    roles text,
    education text,
    contact_information text,
    occupations text,
    location text,
    fields_of_research text,
    positions json,
    external_accounts json,
    status text
);


--
-- Name: work_citations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_citations (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    source_work_id bigint,
    source_work_type public.work_type,
    target_work_id bigint,
    target_work_type public.work_type
);


--
-- Name: work_ctations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.work_citations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.work_ctations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: work_deltas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_deltas (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    work_version_id_from bigint,
    work_version_id_to bigint,
    delta_data json,
    updated_at timestamp with time zone,
    work_type text
);


--
-- Name: work_deltas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.work_deltas ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.work_deltas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: work_fields_of_research; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_fields_of_research (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    field_of_research_id bigint,
    work_id bigint,
    work_type text
);


--
-- Name: work_issue_responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_issue_responses (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid,
    content text,
    work_issue_id bigint
);


--
-- Name: work_issue_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.work_issue_responses ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.work_issue_responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: work_issue_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_issue_teams (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    team_id uuid NOT NULL,
    work_issue_id bigint NOT NULL
);


--
-- Name: work_issue_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_issue_users (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    work_issue_id bigint NOT NULL
);


--
-- Name: work_issues; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_issues (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    work_id bigint,
    work_type public.work_type,
    status public.issue_status,
    title text,
    description text,
    public boolean,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    project_id bigint,
    link text
);


--
-- Name: work_issues_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.work_issues ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.work_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: work_review_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_review_teams (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    team_id uuid NOT NULL,
    work_review_id bigint NOT NULL
);


--
-- Name: work_review_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_review_users (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    work_review_id bigint NOT NULL
);


--
-- Name: work_reviews; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_reviews (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    review_type public.review_type DEFAULT 'Community Review'::public.review_type,
    work_id bigint,
    work_type public.work_type,
    status public.review_status DEFAULT 'In progress'::public.review_status,
    title text,
    description text,
    public boolean,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    project_id bigint,
    content text,
    link text
);


--
-- Name: work_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.work_reviews ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.work_reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: work_snapshots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_snapshots (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    work_id bigint,
    work_type public.work_type,
    snapshot_data json,
    work_version_id bigint
);


--
-- Name: work_snapshots_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.work_snapshots ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.work_snapshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: work_submission_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_submission_teams (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    team_id uuid NOT NULL,
    work_submission_id bigint NOT NULL
);


--
-- Name: work_submission_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_submission_users (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    work_submission_id bigint NOT NULL,
    role text
);


--
-- Name: work_submissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_submissions (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    work_type public.work_type,
    work_id bigint,
    initial_work_version_id bigint,
    final_work_version_id bigint,
    status public.submission_status DEFAULT 'In progress'::public.submission_status,
    title text,
    public boolean DEFAULT false,
    description text,
    project_id bigint,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    work_delta jsonb DEFAULT '{}'::json,
    submitted_data jsonb DEFAULT '{}'::jsonb,
    accepted_data jsonb DEFAULT '{}'::jsonb,
    file_changes jsonb DEFAULT '{}'::jsonb,
    link text
);


--
-- Name: work_submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.work_submissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.work_submissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: work_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_users (
    work_id bigint NOT NULL,
    user_id uuid NOT NULL
);


--
-- Name: work_version_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_version_teams (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    team_id uuid NOT NULL,
    work_version_id bigint NOT NULL,
    role text
);


--
-- Name: work_version_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_version_users (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    work_version_id bigint NOT NULL,
    role text
);


--
-- Name: work_versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_versions (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    work_type public.work_type,
    work_id bigint,
    version_number bigint,
    description text,
    public boolean,
    updated_at timestamp with time zone
);


--
-- Name: work_versions_graphs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_versions_graphs (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    work_id bigint,
    work_type public.work_type,
    graph_data json,
    version_edges jsonb DEFAULT '[]'::jsonb
);


--
-- Name: work_versions_graphs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.work_versions_graphs ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.work_versions_graphs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: work_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.work_versions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.work_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: works; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.works (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL,
    updated_at timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    work_type public.work_type DEFAULT 'Paper'::public.work_type,
    title character varying DEFAULT ''::character varying,
    description text,
    research_score bigint,
    h_index bigint,
    citations_count bigint,
    link text,
    current_work_version_id bigint,
    work_metadata jsonb,
    file_location jsonb,
    public boolean
);


--
-- Name: works_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.works ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.works_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages (
    id bigint NOT NULL,
    topic text NOT NULL,
    extension text NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: realtime; Owner: -
--

CREATE SEQUENCE realtime.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: realtime; Owner: -
--

ALTER SEQUENCE realtime.messages_id_seq OWNED BY realtime.messages.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: -
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: -
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: objects; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: -
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: decrypted_secrets; Type: VIEW; Schema: vault; Owner: -
--

CREATE VIEW vault.decrypted_secrets AS
 SELECT secrets.id,
    secrets.name,
    secrets.description,
    secrets.secret,
        CASE
            WHEN (secrets.secret IS NULL) THEN NULL::text
            ELSE
            CASE
                WHEN (secrets.key_id IS NULL) THEN NULL::text
                ELSE convert_from(pgsodium.crypto_aead_det_decrypt(decode(secrets.secret, 'base64'::text), convert_to(((((secrets.id)::text || secrets.description) || (secrets.created_at)::text) || (secrets.updated_at)::text), 'utf8'::name), secrets.key_id, secrets.nonce), 'utf8'::name)
            END
        END AS decrypted_secret,
    secrets.key_id,
    secrets.nonce,
    secrets.created_at,
    secrets.updated_at
   FROM vault.secrets;


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: discussion_comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussion_comments ALTER COLUMN id SET DEFAULT nextval('public.discussion_comments_id_seq'::regclass);


--
-- Name: folders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folders ALTER COLUMN id SET DEFAULT nextval('public.folders_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ALTER COLUMN id SET DEFAULT nextval('realtime.messages_id_seq'::regclass);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_phone_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_phone_key UNIQUE (phone);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ai_models AI_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_models
    ADD CONSTRAINT "AI_pkey" PRIMARY KEY (id);


--
-- Name: ai_model_teams ai_model_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_model_teams
    ADD CONSTRAINT ai_model_teams_pkey PRIMARY KEY (ai_model_id, team_id);


--
-- Name: ai_model_users ai_model_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_model_users
    ADD CONSTRAINT ai_model_users_pkey PRIMARY KEY (user_id, ai_model_id);


--
-- Name: bookmarks bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_pkey PRIMARY KEY (id);


--
-- Name: chat_messages chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_pkey PRIMARY KEY (id);


--
-- Name: chat_teams chat_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_teams
    ADD CONSTRAINT chat_teams_pkey PRIMARY KEY (chat_id, team_id);


--
-- Name: chat_users chat_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_users
    ADD CONSTRAINT chat_users_pkey PRIMARY KEY (chat_id, user_id);


--
-- Name: citations citations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.citations
    ADD CONSTRAINT citations_pkey PRIMARY KEY (id);


--
-- Name: code_block_users code_block_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.code_block_users
    ADD CONSTRAINT code_block_users_pkey PRIMARY KEY (user_id, code_block_id);


--
-- Name: code_blocks code_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.code_blocks
    ADD CONSTRAINT code_blocks_pkey PRIMARY KEY (id);


--
-- Name: code_block_teams code_blocks_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.code_block_teams
    ADD CONSTRAINT code_blocks_teams_pkey PRIMARY KEY (team_id, code_block_id);


--
-- Name: comment_upvotes comment_upvotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comment_upvotes
    ADD CONSTRAINT comment_upvotes_pkey PRIMARY KEY (user_id, comment_id);


--
-- Name: chats conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT conversations_pkey PRIMARY KEY (id);


--
-- Name: data_analysis_teams data_analysis_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_analysis_teams
    ADD CONSTRAINT data_analysis_teams_pkey PRIMARY KEY (data_analysis_id, team_id);


--
-- Name: data_analysis_users data_analysis_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_analysis_users
    ADD CONSTRAINT data_analysis_users_pkey PRIMARY KEY (user_id, data_analysis_id);


--
-- Name: data_analyses dataanalysis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_analyses
    ADD CONSTRAINT dataanalysis_pkey PRIMARY KEY (id);


--
-- Name: dataset_teams dataset_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_teams
    ADD CONSTRAINT dataset_teams_pkey PRIMARY KEY (dataset_id, team_id);


--
-- Name: dataset_users dataset_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_users
    ADD CONSTRAINT dataset_users_pkey PRIMARY KEY (user_id, dataset_id);


--
-- Name: datasets datasets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.datasets
    ADD CONSTRAINT datasets_pkey PRIMARY KEY (id);


--
-- Name: discussion_comments discussion_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussion_comments
    ADD CONSTRAINT discussion_comments_pkey PRIMARY KEY (id);


--
-- Name: discussion_upvotes discussion_upvotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussion_upvotes
    ADD CONSTRAINT discussion_upvotes_pkey PRIMARY KEY (user_id, discussion_id);


--
-- Name: discussions discussions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussions
    ADD CONSTRAINT discussions_pkey PRIMARY KEY (id);


--
-- Name: experiment_teams experiment_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experiment_teams
    ADD CONSTRAINT experiment_teams_pkey PRIMARY KEY (experiment_id, team_id);


--
-- Name: experiment_users experiment_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experiment_users
    ADD CONSTRAINT experiment_users_pkey PRIMARY KEY (user_id, experiment_id);


--
-- Name: experiments experiments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experiments
    ADD CONSTRAINT experiments_pkey PRIMARY KEY (id);


--
-- Name: feedback_responses feedback_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedback_responses
    ADD CONSTRAINT feedback_responses_pkey PRIMARY KEY (id);


--
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: field_of_research_relationships field_of_research_relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.field_of_research_relationships
    ADD CONSTRAINT field_of_research_relationships_pkey PRIMARY KEY (parent_field_id, child_field_id);


--
-- Name: fields_of_research fields_of_research_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fields_of_research
    ADD CONSTRAINT fields_of_research_pkey PRIMARY KEY (id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: folders folders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folders
    ADD CONSTRAINT folders_pkey PRIMARY KEY (id);


--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (follower_id, followed_id);


--
-- Name: links object_relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT object_relationships_pkey PRIMARY KEY (id);


--
-- Name: paper_teams paper_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.paper_teams
    ADD CONSTRAINT paper_teams_pkey PRIMARY KEY (paper_id, team_id);


--
-- Name: paper_users paper_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.paper_users
    ADD CONSTRAINT paper_users_pkey PRIMARY KEY (user_id, paper_id);


--
-- Name: papers papers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.papers
    ADD CONSTRAINT papers_pkey PRIMARY KEY (id);


--
-- Name: plan_users plan_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_users
    ADD CONSTRAINT plan_users_pkey PRIMARY KEY (user_id, plan_id);


--
-- Name: plans plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- Name: project_ai_models project_ai_models_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_ai_models
    ADD CONSTRAINT project_ai_models_pkey PRIMARY KEY (project_id, ai_model_id);


--
-- Name: project_code_blocks project_code_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_code_blocks
    ADD CONSTRAINT project_code_blocks_pkey PRIMARY KEY (project_id, code_block_id);


--
-- Name: project_data_analyses project_data_analyses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_data_analyses
    ADD CONSTRAINT project_data_analyses_pkey PRIMARY KEY (project_id, data_analysis_id);


--
-- Name: project_datasets project_datasets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_datasets
    ADD CONSTRAINT project_datasets_pkey PRIMARY KEY (project_id, dataset_id);


--
-- Name: project_deltas project_deltas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_deltas
    ADD CONSTRAINT project_deltas_pkey PRIMARY KEY (id);


--
-- Name: project_experiments project_experiments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_experiments
    ADD CONSTRAINT project_experiments_pkey PRIMARY KEY (project_id, experiment_id);


--
-- Name: project_fields_of_research project_fields_of_research_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_fields_of_research
    ADD CONSTRAINT project_fields_of_research_pkey PRIMARY KEY (project_id, field_of_research_id);


--
-- Name: project_issue_responses project_issue_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_issue_responses
    ADD CONSTRAINT project_issue_responses_pkey PRIMARY KEY (id);


--
-- Name: project_issue_teams project_issue_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_issue_teams
    ADD CONSTRAINT project_issue_teams_pkey PRIMARY KEY (team_id, project_issue_id);


--
-- Name: project_issue_users project_issue_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_issue_users
    ADD CONSTRAINT project_issue_users_pkey PRIMARY KEY (user_id, project_issue_id);


--
-- Name: project_issues project_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_issues
    ADD CONSTRAINT project_issues_pkey PRIMARY KEY (id);


--
-- Name: project_papers project_papers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_papers
    ADD CONSTRAINT project_papers_pkey PRIMARY KEY (project_id, paper_id);


--
-- Name: project_review_teams project_review_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_review_teams
    ADD CONSTRAINT project_review_teams_pkey PRIMARY KEY (team_id, project_review_id);


--
-- Name: project_review_users project_review_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_review_users
    ADD CONSTRAINT project_review_users_pkey PRIMARY KEY (user_id, project_review_id);


--
-- Name: project_reviews project_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_reviews
    ADD CONSTRAINT project_reviews_pkey PRIMARY KEY (id);


--
-- Name: project_shares project_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_shares
    ADD CONSTRAINT project_shares_pkey PRIMARY KEY (project_id, sharing_user_id);


--
-- Name: project_snapshots project_snapshots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_snapshots
    ADD CONSTRAINT project_snapshots_pkey PRIMARY KEY (id);


--
-- Name: project_submission_teams project_submission_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_submission_teams
    ADD CONSTRAINT project_submission_teams_pkey PRIMARY KEY (team_id);


--
-- Name: project_submission_users project_submission_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_submission_users
    ADD CONSTRAINT project_submission_users_pkey PRIMARY KEY (user_id, project_submission_id);


--
-- Name: project_submissions project_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_submissions
    ADD CONSTRAINT project_submissions_pkey PRIMARY KEY (id);


--
-- Name: project_teams project_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_teams
    ADD CONSTRAINT project_teams_pkey PRIMARY KEY (project_id, team_id);


--
-- Name: project_upvotes project_upvotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_upvotes
    ADD CONSTRAINT project_upvotes_pkey PRIMARY KEY (project_id, upvoting_user_id);


--
-- Name: project_users project_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_users
    ADD CONSTRAINT project_users_pkey PRIMARY KEY (user_id, project_id);


--
-- Name: project_version_teams project_version_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_version_teams
    ADD CONSTRAINT project_version_teams_pkey PRIMARY KEY (team_id, project_version_id);


--
-- Name: project_version_users project_version_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_version_users
    ADD CONSTRAINT project_version_users_pkey PRIMARY KEY (project_version_id, user_id);


--
-- Name: project_versions_graphs project_versions_graphs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_versions_graphs
    ADD CONSTRAINT project_versions_graphs_pkey PRIMARY KEY (id);


--
-- Name: project_versions project_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_versions
    ADD CONSTRAINT project_versions_pkey PRIMARY KEY (id);


--
-- Name: project_views project_views_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_views
    ADD CONSTRAINT project_views_pkey PRIMARY KEY (project_id, viewing_user_id);


--
-- Name: project_work_submissions project_work_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_work_submissions
    ADD CONSTRAINT project_work_submissions_pkey PRIMARY KEY (project_submission_id, work_submission_id);


--
-- Name: project_works project_works_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_works
    ADD CONSTRAINT project_works_pkey PRIMARY KEY (project_id, work_id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: team_users team_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_users
    ADD CONSTRAINT team_users_pkey PRIMARY KEY (user_id, team_id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: user_settings user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_pkey PRIMARY KEY (user_id);


--
-- Name: user_status user_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_status
    ADD CONSTRAINT user_status_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: work_citations work_ctations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_citations
    ADD CONSTRAINT work_ctations_pkey PRIMARY KEY (id);


--
-- Name: work_deltas work_deltas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_deltas
    ADD CONSTRAINT work_deltas_pkey PRIMARY KEY (id);


--
-- Name: work_issue_users work_issue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_issue_users
    ADD CONSTRAINT work_issue_pkey PRIMARY KEY (user_id, work_issue_id);


--
-- Name: work_issue_responses work_issue_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_issue_responses
    ADD CONSTRAINT work_issue_responses_pkey PRIMARY KEY (id);


--
-- Name: work_issue_teams work_issue_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_issue_teams
    ADD CONSTRAINT work_issue_teams_pkey PRIMARY KEY (team_id, work_issue_id);


--
-- Name: work_issues work_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_issues
    ADD CONSTRAINT work_issues_pkey PRIMARY KEY (id);


--
-- Name: work_review_users work_review_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_review_users
    ADD CONSTRAINT work_review_pkey PRIMARY KEY (user_id, work_review_id);


--
-- Name: work_review_teams work_review_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_review_teams
    ADD CONSTRAINT work_review_teams_pkey PRIMARY KEY (team_id, work_review_id);


--
-- Name: work_reviews work_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_reviews
    ADD CONSTRAINT work_reviews_pkey PRIMARY KEY (id);


--
-- Name: work_snapshots work_snapshots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_snapshots
    ADD CONSTRAINT work_snapshots_pkey PRIMARY KEY (id);


--
-- Name: work_submission_teams work_submission_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_submission_teams
    ADD CONSTRAINT work_submission_teams_pkey PRIMARY KEY (team_id, work_submission_id);


--
-- Name: work_submission_users work_submission_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_submission_users
    ADD CONSTRAINT work_submission_users_pkey PRIMARY KEY (user_id, work_submission_id);


--
-- Name: work_submissions work_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_submissions
    ADD CONSTRAINT work_submissions_pkey PRIMARY KEY (id);


--
-- Name: work_users work_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_users
    ADD CONSTRAINT work_users_pkey PRIMARY KEY (work_id, user_id);


--
-- Name: work_version_teams work_version_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_version_teams
    ADD CONSTRAINT work_version_teams_pkey PRIMARY KEY (team_id, work_version_id);


--
-- Name: work_version_users work_version_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_version_users
    ADD CONSTRAINT work_version_users_pkey PRIMARY KEY (user_id, work_version_id);


--
-- Name: work_versions_graphs work_versions_graphs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_versions_graphs
    ADD CONSTRAINT work_versions_graphs_pkey PRIMARY KEY (id);


--
-- Name: work_versions work_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_versions
    ADD CONSTRAINT work_versions_pkey PRIMARY KEY (id);


--
-- Name: works works_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.works
    ADD CONSTRAINT works_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: unique_verified_phone_factor; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX unique_verified_phone_factor ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: idx_project_users_composite; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_project_users_composite ON public.project_users USING btree (user_id, project_id);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING hash (entity);


--
-- Name: messages_topic_index; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_topic_index ON realtime.messages USING btree (topic);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: -
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: users on_auth_user_created; Type: TRIGGER; Schema: auth; Owner: -
--

CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


--
-- Name: discussion_comments update_children_comments_count; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_children_comments_count AFTER INSERT ON public.discussion_comments FOR EACH ROW EXECUTE FUNCTION public.update_children_comments_count_function();


--
-- Name: work_citations updatecitationscount; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER updatecitationscount AFTER INSERT ON public.work_citations FOR EACH ROW EXECUTE FUNCTION public.update_citations_count();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: -
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: ai_model_teams ai_model_teams_ai_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_model_teams
    ADD CONSTRAINT ai_model_teams_ai_model_id_fkey FOREIGN KEY (ai_model_id) REFERENCES public.ai_models(id) ON DELETE CASCADE;


--
-- Name: ai_model_teams ai_model_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_model_teams
    ADD CONSTRAINT ai_model_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: ai_model_users ai_model_users_ai_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_model_users
    ADD CONSTRAINT ai_model_users_ai_model_id_fkey FOREIGN KEY (ai_model_id) REFERENCES public.ai_models(id) ON DELETE CASCADE;


--
-- Name: ai_model_users ai_model_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_model_users
    ADD CONSTRAINT ai_model_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: ai_models ai_models_current_work_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_models
    ADD CONSTRAINT ai_models_current_work_version_id_fkey FOREIGN KEY (current_work_version_id) REFERENCES public.work_versions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ai_models ai_models_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_models
    ADD CONSTRAINT ai_models_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.ai_models(id) ON DELETE CASCADE;


--
-- Name: bookmarks bookmarks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: chat_messages chat_messages_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chats(id) ON DELETE CASCADE;


--
-- Name: chat_messages chat_messages_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: chat_teams chat_teams_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_teams
    ADD CONSTRAINT chat_teams_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chats(id) ON DELETE CASCADE;


--
-- Name: chat_teams chat_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_teams
    ADD CONSTRAINT chat_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: chat_users chat_users_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_users
    ADD CONSTRAINT chat_users_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chats(id) ON DELETE CASCADE;


--
-- Name: chat_users chat_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_users
    ADD CONSTRAINT chat_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: code_block_teams code_block_teams_code_block_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.code_block_teams
    ADD CONSTRAINT code_block_teams_code_block_id_fkey FOREIGN KEY (code_block_id) REFERENCES public.code_blocks(id) ON DELETE CASCADE;


--
-- Name: code_block_teams code_block_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.code_block_teams
    ADD CONSTRAINT code_block_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: code_block_users code_block_users_code_block_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.code_block_users
    ADD CONSTRAINT code_block_users_code_block_id_fkey FOREIGN KEY (code_block_id) REFERENCES public.code_blocks(id) ON DELETE CASCADE;


--
-- Name: code_block_users code_block_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.code_block_users
    ADD CONSTRAINT code_block_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: code_blocks code_blocks_current_work_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.code_blocks
    ADD CONSTRAINT code_blocks_current_work_version_id_fkey FOREIGN KEY (current_work_version_id) REFERENCES public.work_versions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: code_blocks code_blocks_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.code_blocks
    ADD CONSTRAINT code_blocks_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE CASCADE;


--
-- Name: comment_upvotes comment_upvotes_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comment_upvotes
    ADD CONSTRAINT comment_upvotes_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.discussion_comments(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comment_upvotes comment_upvotes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comment_upvotes
    ADD CONSTRAINT comment_upvotes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: data_analyses data_analyses_current_work_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_analyses
    ADD CONSTRAINT data_analyses_current_work_version_id_fkey FOREIGN KEY (current_work_version_id) REFERENCES public.work_versions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: data_analyses data_analyses_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_analyses
    ADD CONSTRAINT data_analyses_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE CASCADE;


--
-- Name: data_analysis_teams data_analysis_teams_data_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_analysis_teams
    ADD CONSTRAINT data_analysis_teams_data_analysis_id_fkey FOREIGN KEY (data_analysis_id) REFERENCES public.data_analyses(id) ON DELETE CASCADE;


--
-- Name: data_analysis_teams data_analysis_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_analysis_teams
    ADD CONSTRAINT data_analysis_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: data_analysis_users data_analysis_users_data_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_analysis_users
    ADD CONSTRAINT data_analysis_users_data_analysis_id_fkey FOREIGN KEY (data_analysis_id) REFERENCES public.data_analyses(id) ON DELETE CASCADE;


--
-- Name: data_analysis_users data_analysis_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_analysis_users
    ADD CONSTRAINT data_analysis_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: dataset_teams dataset_teams_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_teams
    ADD CONSTRAINT dataset_teams_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.datasets(id) ON DELETE CASCADE;


--
-- Name: dataset_teams dataset_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_teams
    ADD CONSTRAINT dataset_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: dataset_users dataset_users_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_users
    ADD CONSTRAINT dataset_users_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.datasets(id) ON DELETE CASCADE;


--
-- Name: dataset_users dataset_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_users
    ADD CONSTRAINT dataset_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: datasets datasets_current_work_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.datasets
    ADD CONSTRAINT datasets_current_work_version_id_fkey FOREIGN KEY (current_work_version_id) REFERENCES public.work_versions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: datasets datasets_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.datasets
    ADD CONSTRAINT datasets_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE CASCADE;


--
-- Name: discussion_comments discussion_comments_discussion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussion_comments
    ADD CONSTRAINT discussion_comments_discussion_id_fkey FOREIGN KEY (discussion_id) REFERENCES public.discussions(id);


--
-- Name: discussion_comments discussion_comments_parent_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussion_comments
    ADD CONSTRAINT discussion_comments_parent_comment_id_fkey FOREIGN KEY (parent_comment_id) REFERENCES public.discussion_comments(id);


--
-- Name: discussion_comments discussion_comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussion_comments
    ADD CONSTRAINT discussion_comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: discussion_upvotes discussion_upvotes_discussion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussion_upvotes
    ADD CONSTRAINT discussion_upvotes_discussion_id_fkey FOREIGN KEY (discussion_id) REFERENCES public.discussions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: discussion_upvotes discussion_upvotes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussion_upvotes
    ADD CONSTRAINT discussion_upvotes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: discussions discussions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussions
    ADD CONSTRAINT discussions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: experiment_teams experiment_teams_experiment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experiment_teams
    ADD CONSTRAINT experiment_teams_experiment_id_fkey FOREIGN KEY (experiment_id) REFERENCES public.experiments(id) ON DELETE CASCADE;


--
-- Name: experiment_teams experiment_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experiment_teams
    ADD CONSTRAINT experiment_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: experiment_users experiment_users_experiment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experiment_users
    ADD CONSTRAINT experiment_users_experiment_id_fkey FOREIGN KEY (experiment_id) REFERENCES public.experiments(id) ON DELETE CASCADE;


--
-- Name: experiment_users experiment_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experiment_users
    ADD CONSTRAINT experiment_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: experiments experiments_current_work_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experiments
    ADD CONSTRAINT experiments_current_work_version_id_fkey FOREIGN KEY (current_work_version_id) REFERENCES public.work_versions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: experiments experiments_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experiments
    ADD CONSTRAINT experiments_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE CASCADE;


--
-- Name: feedback_responses feedback_responses_feedback_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedback_responses
    ADD CONSTRAINT feedback_responses_feedback_id_fkey FOREIGN KEY (feedback_id) REFERENCES public.feedbacks(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: feedback_responses feedback_responses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedback_responses
    ADD CONSTRAINT feedback_responses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: feedbacks feedbacks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: field_of_research_relationships field_of_research_relationships_child_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.field_of_research_relationships
    ADD CONSTRAINT field_of_research_relationships_child_field_id_fkey FOREIGN KEY (child_field_id) REFERENCES public.fields_of_research(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: field_of_research_relationships field_of_research_relationships_parent_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.field_of_research_relationships
    ADD CONSTRAINT field_of_research_relationships_parent_field_id_fkey FOREIGN KEY (parent_field_id) REFERENCES public.fields_of_research(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: files files_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: folders folders_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folders
    ADD CONSTRAINT folders_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.folders(id);


--
-- Name: folders folders_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folders
    ADD CONSTRAINT folders_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: follows follows_followed_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_followed_id_fkey FOREIGN KEY (followed_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: follows follows_follower_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: paper_teams paper_teams_paper_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.paper_teams
    ADD CONSTRAINT paper_teams_paper_id_fkey FOREIGN KEY (paper_id) REFERENCES public.papers(id) ON DELETE CASCADE;


--
-- Name: paper_teams paper_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.paper_teams
    ADD CONSTRAINT paper_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: paper_users paper_users_paper_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.paper_users
    ADD CONSTRAINT paper_users_paper_id_fkey FOREIGN KEY (paper_id) REFERENCES public.papers(id) ON DELETE CASCADE;


--
-- Name: paper_users paper_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.paper_users
    ADD CONSTRAINT paper_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: papers papers_current_work_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.papers
    ADD CONSTRAINT papers_current_work_version_id_fkey FOREIGN KEY (current_work_version_id) REFERENCES public.work_versions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: papers papers_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.papers
    ADD CONSTRAINT papers_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE CASCADE;


--
-- Name: plan_users plan_users_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_users
    ADD CONSTRAINT plan_users_plan_id_fkey FOREIGN KEY (plan_id) REFERENCES public.plans(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plan_users plan_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_users
    ADD CONSTRAINT plan_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_ai_models project_ai_models_ai_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_ai_models
    ADD CONSTRAINT project_ai_models_ai_model_id_fkey FOREIGN KEY (ai_model_id) REFERENCES public.ai_models(id) ON DELETE CASCADE;


--
-- Name: project_ai_models project_ai_models_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_ai_models
    ADD CONSTRAINT project_ai_models_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: project_code_blocks project_code_blocks_code_block_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_code_blocks
    ADD CONSTRAINT project_code_blocks_code_block_id_fkey FOREIGN KEY (code_block_id) REFERENCES public.code_blocks(id) ON DELETE CASCADE;


--
-- Name: project_code_blocks project_code_blocks_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_code_blocks
    ADD CONSTRAINT project_code_blocks_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: project_data_analyses project_data_analyses_data_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_data_analyses
    ADD CONSTRAINT project_data_analyses_data_analysis_id_fkey FOREIGN KEY (data_analysis_id) REFERENCES public.data_analyses(id) ON DELETE CASCADE;


--
-- Name: project_data_analyses project_data_analyses_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_data_analyses
    ADD CONSTRAINT project_data_analyses_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: project_datasets project_datasets_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_datasets
    ADD CONSTRAINT project_datasets_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.datasets(id) ON DELETE CASCADE;


--
-- Name: project_datasets project_datasets_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_datasets
    ADD CONSTRAINT project_datasets_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: project_deltas project_deltas_final_project_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_deltas
    ADD CONSTRAINT project_deltas_final_project_version_id_fkey FOREIGN KEY (final_project_version_id) REFERENCES public.project_versions(id) ON DELETE CASCADE;


--
-- Name: project_deltas project_deltas_initial_project_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_deltas
    ADD CONSTRAINT project_deltas_initial_project_version_id_fkey FOREIGN KEY (initial_project_version_id) REFERENCES public.project_versions(id) ON DELETE CASCADE;


--
-- Name: project_experiments project_experiments_experiment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_experiments
    ADD CONSTRAINT project_experiments_experiment_id_fkey FOREIGN KEY (experiment_id) REFERENCES public.experiments(id) ON DELETE CASCADE;


--
-- Name: project_experiments project_experiments_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_experiments
    ADD CONSTRAINT project_experiments_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: project_fields_of_research project_fields_of_research_field_of_research_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_fields_of_research
    ADD CONSTRAINT project_fields_of_research_field_of_research_id_fkey FOREIGN KEY (field_of_research_id) REFERENCES public.fields_of_research(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_fields_of_research project_fields_of_research_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_fields_of_research
    ADD CONSTRAINT project_fields_of_research_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_issue_responses project_issue_responses_project_issue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_issue_responses
    ADD CONSTRAINT project_issue_responses_project_issue_id_fkey FOREIGN KEY (project_issue_id) REFERENCES public.project_issues(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_issue_responses project_issue_responses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_issue_responses
    ADD CONSTRAINT project_issue_responses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_issue_teams project_issue_teams_project_issue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_issue_teams
    ADD CONSTRAINT project_issue_teams_project_issue_id_fkey FOREIGN KEY (project_issue_id) REFERENCES public.project_issues(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_issue_teams project_issue_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_issue_teams
    ADD CONSTRAINT project_issue_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_issue_users project_issue_users_project_issue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_issue_users
    ADD CONSTRAINT project_issue_users_project_issue_id_fkey FOREIGN KEY (project_issue_id) REFERENCES public.project_issues(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_issue_users project_issue_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_issue_users
    ADD CONSTRAINT project_issue_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_issues project_issues_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_issues
    ADD CONSTRAINT project_issues_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_papers project_papers_paper_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_papers
    ADD CONSTRAINT project_papers_paper_id_fkey FOREIGN KEY (paper_id) REFERENCES public.papers(id) ON DELETE CASCADE;


--
-- Name: project_papers project_papers_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_papers
    ADD CONSTRAINT project_papers_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: project_review_teams project_review_teams_project_review_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_review_teams
    ADD CONSTRAINT project_review_teams_project_review_id_fkey FOREIGN KEY (project_review_id) REFERENCES public.project_reviews(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_review_teams project_review_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_review_teams
    ADD CONSTRAINT project_review_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_review_users project_review_users_project_review_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_review_users
    ADD CONSTRAINT project_review_users_project_review_id_fkey FOREIGN KEY (project_review_id) REFERENCES public.project_reviews(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_review_users project_review_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_review_users
    ADD CONSTRAINT project_review_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_reviews project_reviews_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_reviews
    ADD CONSTRAINT project_reviews_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_shares project_shares_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_shares
    ADD CONSTRAINT project_shares_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_shares project_shares_sharing_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_shares
    ADD CONSTRAINT project_shares_sharing_user_id_fkey FOREIGN KEY (sharing_user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_snapshots project_snapshots_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_snapshots
    ADD CONSTRAINT project_snapshots_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_snapshots project_snapshots_project_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_snapshots
    ADD CONSTRAINT project_snapshots_project_version_id_fkey FOREIGN KEY (project_version_id) REFERENCES public.project_versions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_submission_teams project_submission_teams_project_submission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_submission_teams
    ADD CONSTRAINT project_submission_teams_project_submission_id_fkey FOREIGN KEY (project_submission_id) REFERENCES public.project_submissions(id) ON DELETE CASCADE;


--
-- Name: project_submission_teams project_submission_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_submission_teams
    ADD CONSTRAINT project_submission_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: project_submission_users project_submission_users_project_submission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_submission_users
    ADD CONSTRAINT project_submission_users_project_submission_id_fkey FOREIGN KEY (project_submission_id) REFERENCES public.project_submissions(id) ON DELETE CASCADE;


--
-- Name: project_submission_users project_submission_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_submission_users
    ADD CONSTRAINT project_submission_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: project_submissions project_submissions_final_project_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_submissions
    ADD CONSTRAINT project_submissions_final_project_version_id_fkey FOREIGN KEY (final_project_version_id) REFERENCES public.project_versions(id) ON DELETE CASCADE;


--
-- Name: project_submissions project_submissions_initial_project_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_submissions
    ADD CONSTRAINT project_submissions_initial_project_version_id_fkey FOREIGN KEY (initial_project_version_id) REFERENCES public.project_versions(id) ON DELETE CASCADE;


--
-- Name: project_submissions project_submissions_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_submissions
    ADD CONSTRAINT project_submissions_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: project_teams project_teams_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_teams
    ADD CONSTRAINT project_teams_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: project_teams project_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_teams
    ADD CONSTRAINT project_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: project_upvotes project_upvotes_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_upvotes
    ADD CONSTRAINT project_upvotes_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_upvotes project_upvotes_upvoting_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_upvotes
    ADD CONSTRAINT project_upvotes_upvoting_user_id_fkey FOREIGN KEY (upvoting_user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_users project_users_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_users
    ADD CONSTRAINT project_users_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: project_users project_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_users
    ADD CONSTRAINT project_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: project_version_teams project_version_teams_project_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_version_teams
    ADD CONSTRAINT project_version_teams_project_version_id_fkey FOREIGN KEY (project_version_id) REFERENCES public.project_versions(id) ON DELETE CASCADE;


--
-- Name: project_version_teams project_version_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_version_teams
    ADD CONSTRAINT project_version_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: project_version_users project_version_users_project_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_version_users
    ADD CONSTRAINT project_version_users_project_version_id_fkey FOREIGN KEY (project_version_id) REFERENCES public.project_versions(id) ON DELETE CASCADE;


--
-- Name: project_version_users project_version_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_version_users
    ADD CONSTRAINT project_version_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: project_versions_graphs project_versions_graphs_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_versions_graphs
    ADD CONSTRAINT project_versions_graphs_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_versions project_versions_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_versions
    ADD CONSTRAINT project_versions_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: project_views project_views_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_views
    ADD CONSTRAINT project_views_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_views project_views_viewing_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_views
    ADD CONSTRAINT project_views_viewing_user_id_fkey FOREIGN KEY (viewing_user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_work_submissions project_work_submissions_project_submission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_work_submissions
    ADD CONSTRAINT project_work_submissions_project_submission_id_fkey FOREIGN KEY (project_submission_id) REFERENCES public.project_submissions(id);


--
-- Name: project_work_submissions project_work_submissions_work_submission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_work_submissions
    ADD CONSTRAINT project_work_submissions_work_submission_id_fkey FOREIGN KEY (work_submission_id) REFERENCES public.work_submissions(id);


--
-- Name: project_works project_works_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_works
    ADD CONSTRAINT project_works_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_works project_works_work_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_works
    ADD CONSTRAINT project_works_work_id_fkey FOREIGN KEY (work_id) REFERENCES public.works(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: projects projects_current_project_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_current_project_version_id_fkey FOREIGN KEY (current_project_version_id) REFERENCES public.project_versions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: team_users team_users_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_users
    ADD CONSTRAINT team_users_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: team_users team_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_users
    ADD CONSTRAINT team_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_settings user_settings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_status user_status_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_status
    ADD CONSTRAINT user_status_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users users_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id);


--
-- Name: work_deltas work_deltas_work_version_id_from_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_deltas
    ADD CONSTRAINT work_deltas_work_version_id_from_fkey FOREIGN KEY (work_version_id_from) REFERENCES public.work_versions(id) ON DELETE CASCADE;


--
-- Name: work_deltas work_deltas_work_version_id_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_deltas
    ADD CONSTRAINT work_deltas_work_version_id_to_fkey FOREIGN KEY (work_version_id_to) REFERENCES public.work_versions(id) ON DELETE CASCADE;


--
-- Name: work_fields_of_research work_fields_of_research_field_of_research_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_fields_of_research
    ADD CONSTRAINT work_fields_of_research_field_of_research_id_fkey FOREIGN KEY (field_of_research_id) REFERENCES public.fields_of_research(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: work_issue_responses work_issue_responses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_issue_responses
    ADD CONSTRAINT work_issue_responses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: work_issue_responses work_issue_responses_work_issue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_issue_responses
    ADD CONSTRAINT work_issue_responses_work_issue_id_fkey FOREIGN KEY (work_issue_id) REFERENCES public.work_issues(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: work_issue_teams work_issue_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_issue_teams
    ADD CONSTRAINT work_issue_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: work_issue_teams work_issue_teams_work_issue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_issue_teams
    ADD CONSTRAINT work_issue_teams_work_issue_id_fkey FOREIGN KEY (work_issue_id) REFERENCES public.work_issues(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: work_issue_users work_issue_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_issue_users
    ADD CONSTRAINT work_issue_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: work_issue_users work_issue_users_work_issue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_issue_users
    ADD CONSTRAINT work_issue_users_work_issue_id_fkey FOREIGN KEY (work_issue_id) REFERENCES public.work_issues(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: work_issues work_issues_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_issues
    ADD CONSTRAINT work_issues_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: work_review_teams work_review_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_review_teams
    ADD CONSTRAINT work_review_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: work_review_teams work_review_teams_work_review_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_review_teams
    ADD CONSTRAINT work_review_teams_work_review_id_fkey FOREIGN KEY (work_review_id) REFERENCES public.work_reviews(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: work_review_users work_review_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_review_users
    ADD CONSTRAINT work_review_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: work_review_users work_review_users_work_review_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_review_users
    ADD CONSTRAINT work_review_users_work_review_id_fkey FOREIGN KEY (work_review_id) REFERENCES public.work_reviews(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: work_reviews work_reviews_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_reviews
    ADD CONSTRAINT work_reviews_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: work_snapshots work_snapshots_work_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_snapshots
    ADD CONSTRAINT work_snapshots_work_version_id_fkey FOREIGN KEY (work_version_id) REFERENCES public.work_versions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: work_submission_teams work_submission_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_submission_teams
    ADD CONSTRAINT work_submission_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: work_submission_teams work_submission_teams_work_submission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_submission_teams
    ADD CONSTRAINT work_submission_teams_work_submission_id_fkey FOREIGN KEY (work_submission_id) REFERENCES public.work_submissions(id) ON DELETE CASCADE;


--
-- Name: work_submission_users work_submission_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_submission_users
    ADD CONSTRAINT work_submission_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: work_submission_users work_submission_users_work_submission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_submission_users
    ADD CONSTRAINT work_submission_users_work_submission_id_fkey FOREIGN KEY (work_submission_id) REFERENCES public.work_submissions(id) ON DELETE CASCADE;


--
-- Name: work_submissions work_submissions_final_work_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_submissions
    ADD CONSTRAINT work_submissions_final_work_version_id_fkey FOREIGN KEY (final_work_version_id) REFERENCES public.work_versions(id) ON DELETE CASCADE;


--
-- Name: work_submissions work_submissions_initial_work_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_submissions
    ADD CONSTRAINT work_submissions_initial_work_version_id_fkey FOREIGN KEY (initial_work_version_id) REFERENCES public.work_versions(id) ON DELETE CASCADE;


--
-- Name: work_submissions work_submissions_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_submissions
    ADD CONSTRAINT work_submissions_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: work_users work_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_users
    ADD CONSTRAINT work_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: work_users work_users_work_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_users
    ADD CONSTRAINT work_users_work_id_fkey FOREIGN KEY (work_id) REFERENCES public.works(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: work_version_teams work_version_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_version_teams
    ADD CONSTRAINT work_version_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: work_version_teams work_version_teams_work_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_version_teams
    ADD CONSTRAINT work_version_teams_work_version_id_fkey FOREIGN KEY (work_version_id) REFERENCES public.work_versions(id) ON DELETE CASCADE;


--
-- Name: work_version_users work_version_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_version_users
    ADD CONSTRAINT work_version_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: work_version_users work_version_users_work_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_version_users
    ADD CONSTRAINT work_version_users_work_version_id_fkey FOREIGN KEY (work_version_id) REFERENCES public.work_versions(id) ON DELETE CASCADE;


--
-- Name: works works_current_work_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.works
    ADD CONSTRAINT works_current_work_version_id_fkey FOREIGN KEY (current_work_version_id) REFERENCES public.work_versions(id) ON UPDATE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: users Can update own user data.; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Can update own user data." ON public.users FOR UPDATE USING ((auth.uid() = id));


--
-- Name: users Can view own user data.; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Can view own user data." ON public.users FOR SELECT USING ((auth.uid() = id));


--
-- Name: projects Enable read access for all users; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Enable read access for all users" ON public.projects FOR SELECT USING (true);


--
-- Name: ai_models; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.ai_models ENABLE ROW LEVEL SECURITY;

--
-- Name: work_submissions create_submission; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY create_submission ON public.work_submissions FOR INSERT WITH CHECK (true);


--
-- Name: work_submissions delete_submission; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY delete_submission ON public.work_submissions FOR DELETE USING (((EXISTS ( SELECT 1
   FROM public.work_submission_users
  WHERE ((work_submission_users.work_submission_id = work_submissions.id) AND (work_submission_users.user_id = auth.uid())))) OR (EXISTS ( SELECT 1
   FROM public.work_submission_teams
  WHERE ((work_submission_teams.work_submission_id = work_submissions.id) AND (work_submission_teams.team_id IN ( SELECT team_users.team_id
           FROM public.team_users
          WHERE (team_users.user_id = auth.uid()))))))));


--
-- Name: ai_models select_ai_models; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY select_ai_models ON public.ai_models FOR SELECT USING (((public = true) OR (EXISTS ( SELECT 1
   FROM public.ai_model_users
  WHERE ((ai_model_users.ai_model_id = ai_models.id) AND (ai_model_users.user_id = auth.uid()) AND (ai_model_users.role = 'Main Author'::public.role)))) OR (EXISTS ( SELECT 1
   FROM (public.ai_model_teams
     JOIN public.team_users ON ((ai_model_teams.team_id = team_users.team_id)))
  WHERE ((ai_model_teams.ai_model_id = ai_models.id) AND (team_users.user_id = auth.uid()) AND (ai_model_teams.role = 'Main Author'::public.role))))));


--
-- Name: work_submissions select_submission; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY select_submission ON public.work_submissions FOR SELECT USING (((public = true) OR (((status = 'Submitted'::public.submission_status) AND (EXISTS ( SELECT 1
   FROM public.work_submission_users
  WHERE ((work_submission_users.work_submission_id = work_submissions.id) AND (work_submission_users.user_id = auth.uid()))))) OR (EXISTS ( SELECT 1
   FROM public.work_submission_teams
  WHERE ((work_submission_teams.work_submission_id = work_submissions.id) AND (work_submission_teams.team_id IN ( SELECT team_users.team_id
           FROM public.team_users
          WHERE (team_users.user_id = auth.uid()))))))) OR (((status = 'Accepted'::public.submission_status) AND (((work_type = 'Paper'::public.work_type) AND (EXISTS ( SELECT 1
   FROM public.paper_users
  WHERE ((paper_users.paper_id = work_submissions.id) AND (paper_users.user_id = auth.uid()) AND (paper_users.role = 'Main Author'::text))))) OR (EXISTS ( SELECT 1
   FROM public.paper_teams
  WHERE ((paper_teams.paper_id = work_submissions.id) AND (paper_teams.team_id IN ( SELECT team_users.team_id
           FROM public.team_users
          WHERE (team_users.user_id = auth.uid()))) AND (paper_teams.role = 'Main Author'::text)))))) OR (((work_type = 'Experiment'::public.work_type) AND (EXISTS ( SELECT 1
   FROM public.experiment_users
  WHERE ((experiment_users.experiment_id = work_submissions.id) AND (experiment_users.user_id = auth.uid()) AND (experiment_users.role = 'Main Author'::text))))) OR (EXISTS ( SELECT 1
   FROM public.experiment_teams
  WHERE ((experiment_teams.experiment_id = work_submissions.id) AND (experiment_teams.team_id IN ( SELECT team_users.team_id
           FROM public.team_users
          WHERE (team_users.user_id = auth.uid()))) AND (experiment_teams.role = 'Main Author'::text))))) OR (((work_type = 'Dataset'::public.work_type) AND (EXISTS ( SELECT 1
   FROM public.dataset_users
  WHERE ((dataset_users.dataset_id = work_submissions.id) AND (dataset_users.user_id = auth.uid()) AND (dataset_users.role = 'Main Author'::text))))) OR (EXISTS ( SELECT 1
   FROM public.dataset_teams
  WHERE ((dataset_teams.dataset_id = work_submissions.id) AND (dataset_teams.team_id IN ( SELECT team_users.team_id
           FROM public.team_users
          WHERE (team_users.user_id = auth.uid()))) AND (dataset_teams.role = 'Main Author'::text))))) OR (((work_type = 'Data Analysis'::public.work_type) AND (EXISTS ( SELECT 1
   FROM public.data_analysis_users
  WHERE ((data_analysis_users.data_analysis_id = work_submissions.id) AND (data_analysis_users.user_id = auth.uid()) AND (data_analysis_users.role = 'Main Author'::text))))) OR (EXISTS ( SELECT 1
   FROM public.data_analysis_teams
  WHERE ((data_analysis_teams.data_analysis_id = work_submissions.id) AND (data_analysis_teams.team_id IN ( SELECT team_users.team_id
           FROM public.team_users
          WHERE (team_users.user_id = auth.uid()))) AND (data_analysis_teams.role = 'Main Author'::text))))) OR (((work_type = 'AI Model'::public.work_type) AND (EXISTS ( SELECT 1
   FROM public.ai_model_users
  WHERE ((ai_model_users.ai_model_id = work_submissions.id) AND (ai_model_users.user_id = auth.uid()) AND (ai_model_users.role = 'Main Author'::public.role))))) OR (EXISTS ( SELECT 1
   FROM public.ai_model_teams
  WHERE ((ai_model_teams.ai_model_id = work_submissions.id) AND (ai_model_teams.team_id IN ( SELECT team_users.team_id
           FROM public.team_users
          WHERE (team_users.user_id = auth.uid()))) AND (ai_model_teams.role = 'Main Author'::public.role))))) OR (((work_type = 'Code Block'::public.work_type) AND (EXISTS ( SELECT 1
   FROM public.code_block_users
  WHERE ((code_block_users.code_block_id = work_submissions.id) AND (code_block_users.user_id = auth.uid()) AND (code_block_users.role = 'Main Author'::text))))) OR (EXISTS ( SELECT 1
   FROM public.code_block_teams
  WHERE ((code_block_teams.code_block_id = work_submissions.id) AND (code_block_teams.team_id IN ( SELECT team_users.team_id
           FROM public.team_users
          WHERE (team_users.user_id = auth.uid()))) AND (code_block_teams.role = 'Main Author'::public.role)))))) OR ((EXISTS ( SELECT 1
   FROM public.work_submission_users
  WHERE ((work_submission_users.work_submission_id = work_submissions.id) AND (work_submission_users.user_id = auth.uid())))) OR (EXISTS ( SELECT 1
   FROM public.work_submission_teams
  WHERE ((work_submission_teams.work_submission_id = work_submissions.id) AND (work_submission_teams.team_id IN ( SELECT team_users.team_id
           FROM public.team_users
          WHERE (team_users.user_id = auth.uid())))))))));


--
-- Name: work_submissions update_submission; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY update_submission ON public.work_submissions FOR UPDATE USING ((((status = 'Submitted'::public.submission_status) AND (EXISTS ( SELECT 1
   FROM public.work_submission_users
  WHERE ((work_submission_users.work_submission_id = work_submissions.id) AND (work_submission_users.user_id = auth.uid()))))) OR (EXISTS ( SELECT 1
   FROM public.work_submission_teams
  WHERE ((work_submission_teams.work_submission_id = work_submissions.id) AND (work_submission_teams.team_id IN ( SELECT team_users.team_id
           FROM public.team_users
          WHERE (team_users.user_id = auth.uid())))))) OR (((status = 'Accepted'::public.submission_status) AND (((work_type = 'Paper'::public.work_type) AND (EXISTS ( SELECT 1
   FROM public.paper_users
  WHERE ((paper_users.paper_id = work_submissions.id) AND (paper_users.user_id = auth.uid()) AND (paper_users.role = 'Main Author'::text))))) OR (EXISTS ( SELECT 1
   FROM public.paper_teams
  WHERE ((paper_teams.paper_id = work_submissions.id) AND (paper_teams.team_id IN ( SELECT team_users.team_id
           FROM public.team_users
          WHERE (team_users.user_id = auth.uid()))) AND (paper_teams.role = 'Main Author'::text)))))) OR (((work_type = 'Experiment'::public.work_type) AND (EXISTS ( SELECT 1
   FROM public.experiment_users
  WHERE ((experiment_users.experiment_id = work_submissions.id) AND (experiment_users.user_id = auth.uid()) AND (experiment_users.role = 'Main Author'::text))))) OR (EXISTS ( SELECT 1
   FROM public.experiment_teams
  WHERE ((experiment_teams.experiment_id = work_submissions.id) AND (experiment_teams.team_id IN ( SELECT team_users.team_id
           FROM public.team_users
          WHERE (team_users.user_id = auth.uid()))) AND (experiment_teams.role = 'Main Author'::text))))) OR (((work_type = 'Dataset'::public.work_type) AND (EXISTS ( SELECT 1
   FROM public.dataset_users
  WHERE ((dataset_users.dataset_id = work_submissions.id) AND (dataset_users.user_id = auth.uid()) AND (dataset_users.role = 'Main Author'::text))))) OR (EXISTS ( SELECT 1
   FROM public.dataset_teams
  WHERE ((dataset_teams.dataset_id = work_submissions.id) AND (dataset_teams.team_id IN ( SELECT team_users.team_id
           FROM public.team_users
          WHERE (team_users.user_id = auth.uid()))) AND (dataset_teams.role = 'Main Author'::text))))) OR (((work_type = 'Data Analysis'::public.work_type) AND (EXISTS ( SELECT 1
   FROM public.data_analysis_users
  WHERE ((data_analysis_users.data_analysis_id = work_submissions.id) AND (data_analysis_users.user_id = auth.uid()) AND (data_analysis_users.role = 'Main Author'::text))))) OR (EXISTS ( SELECT 1
   FROM public.data_analysis_teams
  WHERE ((data_analysis_teams.data_analysis_id = work_submissions.id) AND (data_analysis_teams.team_id IN ( SELECT team_users.team_id
           FROM public.team_users
          WHERE (team_users.user_id = auth.uid()))) AND (data_analysis_teams.role = 'Main Author'::text))))) OR (((work_type = 'AI Model'::public.work_type) AND (EXISTS ( SELECT 1
   FROM public.ai_model_users
  WHERE ((ai_model_users.ai_model_id = work_submissions.id) AND (ai_model_users.user_id = auth.uid()) AND (ai_model_users.role = 'Main Author'::public.role))))) OR (EXISTS ( SELECT 1
   FROM public.ai_model_teams
  WHERE ((ai_model_teams.ai_model_id = work_submissions.id) AND (ai_model_teams.team_id IN ( SELECT team_users.team_id
           FROM public.team_users
          WHERE (team_users.user_id = auth.uid()))) AND (ai_model_teams.role = 'Main Author'::public.role))))) OR (((work_type = 'Code Block'::public.work_type) AND (EXISTS ( SELECT 1
   FROM public.code_block_users
  WHERE ((code_block_users.code_block_id = work_submissions.id) AND (code_block_users.user_id = auth.uid()) AND (code_block_users.role = 'Main Author'::text))))) OR (EXISTS ( SELECT 1
   FROM public.code_block_teams
  WHERE ((code_block_teams.code_block_id = work_submissions.id) AND (code_block_teams.team_id IN ( SELECT team_users.team_id
           FROM public.team_users
          WHERE (team_users.user_id = auth.uid()))) AND (code_block_teams.role = 'Main Author'::public.role)))))) OR ((EXISTS ( SELECT 1
   FROM public.work_submission_users
  WHERE ((work_submission_users.work_submission_id = work_submissions.id) AND (work_submission_users.user_id = auth.uid())))) OR (EXISTS ( SELECT 1
   FROM public.work_submission_teams
  WHERE ((work_submission_teams.work_submission_id = work_submissions.id) AND (work_submission_teams.team_id IN ( SELECT team_users.team_id
           FROM public.team_users
          WHERE (team_users.user_id = auth.uid())))))))));


--
-- Name: work_citations; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.work_citations ENABLE ROW LEVEL SECURITY;

--
-- Name: work_submissions; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.work_submissions ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: -
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Allow ALL tlpdrv_0; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow ALL tlpdrv_0" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'datasets'::text));


--
-- Name: objects Allow ALL tlpdrv_1; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow ALL tlpdrv_1" ON storage.objects FOR SELECT USING ((bucket_id = 'datasets'::text));


--
-- Name: objects Allow ALL tlpdrv_2; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow ALL tlpdrv_2" ON storage.objects FOR UPDATE USING ((bucket_id = 'datasets'::text));


--
-- Name: objects Allow All tlpdrv_0; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow All tlpdrv_0" ON storage.objects FOR DELETE USING ((bucket_id = 'datasets'::text));


--
-- Name: objects Allow All tlpdrv_1; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow All tlpdrv_1" ON storage.objects FOR SELECT USING ((bucket_id = 'datasets'::text));


--
-- Name: objects Allow All tlpdrv_2; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow All tlpdrv_2" ON storage.objects FOR UPDATE USING ((bucket_id = 'datasets'::text));


--
-- Name: objects Allow All tlpdrv_3; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow All tlpdrv_3" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'datasets'::text));


--
-- Name: objects allow all 1ffg0oo_0; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow all 1ffg0oo_0" ON storage.objects FOR SELECT USING ((bucket_id = 'images'::text));


--
-- Name: objects allow all 1ffg0oo_1; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow all 1ffg0oo_1" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'images'::text));


--
-- Name: objects allow all 1ffg0oo_2; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow all 1ffg0oo_2" ON storage.objects FOR UPDATE USING ((bucket_id = 'images'::text));


--
-- Name: objects allow all 1ffg0oo_3; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow all 1ffg0oo_3" ON storage.objects FOR DELETE USING ((bucket_id = 'images'::text));


--
-- Name: objects allow all 1t9jwe_0; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow all 1t9jwe_0" ON storage.objects FOR SELECT USING ((bucket_id = 'songs'::text));


--
-- Name: objects allow all 1t9jwe_1; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow all 1t9jwe_1" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'songs'::text));


--
-- Name: objects allow all 1t9jwe_2; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow all 1t9jwe_2" ON storage.objects FOR UPDATE USING ((bucket_id = 'songs'::text));


--
-- Name: objects allow all 1t9jwe_3; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow all 1t9jwe_3" ON storage.objects FOR DELETE USING ((bucket_id = 'songs'::text));


--
-- Name: objects allow_all 1p9cv51_0; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow_all 1p9cv51_0" ON storage.objects FOR SELECT USING ((bucket_id = 'code_files'::text));


--
-- Name: objects allow_all 1p9cv51_1; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow_all 1p9cv51_1" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'code_files'::text));


--
-- Name: objects allow_all 1p9cv51_2; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow_all 1p9cv51_2" ON storage.objects FOR UPDATE USING ((bucket_id = 'code_files'::text));


--
-- Name: objects allow_all 1p9cv51_3; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow_all 1p9cv51_3" ON storage.objects FOR DELETE USING ((bucket_id = 'code_files'::text));


--
-- Name: objects allow_all 21n7l_0; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow_all 21n7l_0" ON storage.objects FOR SELECT USING ((bucket_id = 'pdfs'::text));


--
-- Name: objects allow_all 21n7l_1; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow_all 21n7l_1" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'pdfs'::text));


--
-- Name: objects allow_all 21n7l_2; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow_all 21n7l_2" ON storage.objects FOR UPDATE USING ((bucket_id = 'pdfs'::text));


--
-- Name: objects allow_all 21n7l_3; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow_all 21n7l_3" ON storage.objects FOR DELETE USING ((bucket_id = 'pdfs'::text));


--
-- Name: objects allow_all bxpdnl_0; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow_all bxpdnl_0" ON storage.objects FOR SELECT USING ((bucket_id = 'ai_models'::text));


--
-- Name: objects allow_all bxpdnl_1; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow_all bxpdnl_1" ON storage.objects FOR UPDATE USING ((bucket_id = 'ai_models'::text));


--
-- Name: objects allow_all bxpdnl_2; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow_all bxpdnl_2" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'ai_models'::text));


--
-- Name: objects allow_all bxpdnl_3; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "allow_all bxpdnl_3" ON storage.objects FOR DELETE USING ((bucket_id = 'ai_models'::text));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: -
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


--
-- Name: supabase_realtime chat_messages; Type: PUBLICATION TABLE; Schema: public; Owner: -
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.chat_messages;


--
-- Name: supabase_realtime chats; Type: PUBLICATION TABLE; Schema: public; Owner: -
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.chats;


--
-- Name: supabase_realtime discussion_comments; Type: PUBLICATION TABLE; Schema: public; Owner: -
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.discussion_comments;


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: -
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: -
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: -
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;
GRANT ALL ON FUNCTION auth.email() TO postgres;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;
GRANT ALL ON FUNCTION auth.role() TO postgres;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;
GRANT ALL ON FUNCTION auth.uid() TO postgres;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: -
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION comment_directive(comment_ text); Type: ACL; Schema: graphql; Owner: -
--

GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO postgres;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO anon;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO authenticated;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO service_role;


--
-- Name: FUNCTION exception(message text); Type: ACL; Schema: graphql; Owner: -
--

GRANT ALL ON FUNCTION graphql.exception(message text) TO postgres;
GRANT ALL ON FUNCTION graphql.exception(message text) TO anon;
GRANT ALL ON FUNCTION graphql.exception(message text) TO authenticated;
GRANT ALL ON FUNCTION graphql.exception(message text) TO service_role;


--
-- Name: FUNCTION get_schema_version(); Type: ACL; Schema: graphql; Owner: -
--

GRANT ALL ON FUNCTION graphql.get_schema_version() TO postgres;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO anon;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO authenticated;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO service_role;


--
-- Name: FUNCTION increment_schema_version(); Type: ACL; Schema: graphql; Owner: -
--

GRANT ALL ON FUNCTION graphql.increment_schema_version() TO postgres;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO anon;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO authenticated;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO service_role;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: -
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION lo_export(oid, text); Type: ACL; Schema: pg_catalog; Owner: -
--

REVOKE ALL ON FUNCTION pg_catalog.lo_export(oid, text) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_export(oid, text) TO supabase_admin;


--
-- Name: FUNCTION lo_import(text); Type: ACL; Schema: pg_catalog; Owner: -
--

REVOKE ALL ON FUNCTION pg_catalog.lo_import(text) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_import(text) TO supabase_admin;


--
-- Name: FUNCTION lo_import(text, oid); Type: ACL; Schema: pg_catalog; Owner: -
--

REVOKE ALL ON FUNCTION pg_catalog.lo_import(text, oid) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_import(text, oid) TO supabase_admin;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: -
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: -
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: -
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_keygen(); Type: ACL; Schema: pgsodium; Owner: -
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;


--
-- Name: FUNCTION fetch_work_submissions(version_pairs integer[]); Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON FUNCTION public.fetch_work_submissions(version_pairs integer[]) TO anon;
GRANT ALL ON FUNCTION public.fetch_work_submissions(version_pairs integer[]) TO authenticated;
GRANT ALL ON FUNCTION public.fetch_work_submissions(version_pairs integer[]) TO service_role;


--
-- Name: FUNCTION fetch_work_submissions(version_pairs bigint[]); Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON FUNCTION public.fetch_work_submissions(version_pairs bigint[]) TO anon;
GRANT ALL ON FUNCTION public.fetch_work_submissions(version_pairs bigint[]) TO authenticated;
GRANT ALL ON FUNCTION public.fetch_work_submissions(version_pairs bigint[]) TO service_role;


--
-- Name: FUNCTION handle_new_user(); Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON FUNCTION public.handle_new_user() TO anon;
GRANT ALL ON FUNCTION public.handle_new_user() TO authenticated;
GRANT ALL ON FUNCTION public.handle_new_user() TO service_role;


--
-- Name: FUNCTION new_fetch_work_submissions(version_pairs bigint[]); Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON FUNCTION public.new_fetch_work_submissions(version_pairs bigint[]) TO anon;
GRANT ALL ON FUNCTION public.new_fetch_work_submissions(version_pairs bigint[]) TO authenticated;
GRANT ALL ON FUNCTION public.new_fetch_work_submissions(version_pairs bigint[]) TO service_role;


--
-- Name: FUNCTION update_children_comments_count_function(); Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON FUNCTION public.update_children_comments_count_function() TO anon;
GRANT ALL ON FUNCTION public.update_children_comments_count_function() TO authenticated;
GRANT ALL ON FUNCTION public.update_children_comments_count_function() TO service_role;


--
-- Name: FUNCTION update_citations_count(); Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON FUNCTION public.update_citations_count() TO anon;
GRANT ALL ON FUNCTION public.update_citations_count() TO authenticated;
GRANT ALL ON FUNCTION public.update_citations_count() TO service_role;


--
-- Name: FUNCTION update_project_delta_partial(submission_id integer, delta_changes jsonb); Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON FUNCTION public.update_project_delta_partial(submission_id integer, delta_changes jsonb) TO anon;
GRANT ALL ON FUNCTION public.update_project_delta_partial(submission_id integer, delta_changes jsonb) TO authenticated;
GRANT ALL ON FUNCTION public.update_project_delta_partial(submission_id integer, delta_changes jsonb) TO service_role;


--
-- Name: FUNCTION update_work_delta_field(submission_id integer, field_path text[], new_value jsonb); Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON FUNCTION public.update_work_delta_field(submission_id integer, field_path text[], new_value jsonb) TO anon;
GRANT ALL ON FUNCTION public.update_work_delta_field(submission_id integer, field_path text[], new_value jsonb) TO authenticated;
GRANT ALL ON FUNCTION public.update_work_delta_field(submission_id integer, field_path text[], new_value jsonb) TO service_role;


--
-- Name: FUNCTION update_work_delta_fields(submission_id integer, keys text[], new_values jsonb[]); Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON FUNCTION public.update_work_delta_fields(submission_id integer, keys text[], new_values jsonb[]) TO anon;
GRANT ALL ON FUNCTION public.update_work_delta_fields(submission_id integer, keys text[], new_values jsonb[]) TO authenticated;
GRANT ALL ON FUNCTION public.update_work_delta_fields(submission_id integer, keys text[], new_values jsonb[]) TO service_role;


--
-- Name: FUNCTION update_work_delta_partial(submission_id integer, delta_changes jsonb); Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON FUNCTION public.update_work_delta_partial(submission_id integer, delta_changes jsonb) TO anon;
GRANT ALL ON FUNCTION public.update_work_delta_partial(submission_id integer, delta_changes jsonb) TO authenticated;
GRANT ALL ON FUNCTION public.update_work_delta_partial(submission_id integer, delta_changes jsonb) TO service_role;


--
-- Name: FUNCTION update_work_deltas(submission_id integer, field_paths text[], new_values jsonb[]); Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON FUNCTION public.update_work_deltas(submission_id integer, field_paths text[], new_values jsonb[]) TO anon;
GRANT ALL ON FUNCTION public.update_work_deltas(submission_id integer, field_paths text[], new_values jsonb[]) TO authenticated;
GRANT ALL ON FUNCTION public.update_work_deltas(submission_id integer, field_paths text[], new_values jsonb[]) TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION can_insert_object(bucketid text, name text, owner uuid, metadata jsonb); Type: ACL; Schema: storage; Owner: -
--

GRANT ALL ON FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) TO postgres;


--
-- Name: FUNCTION extension(name text); Type: ACL; Schema: storage; Owner: -
--

GRANT ALL ON FUNCTION storage.extension(name text) TO anon;
GRANT ALL ON FUNCTION storage.extension(name text) TO authenticated;
GRANT ALL ON FUNCTION storage.extension(name text) TO service_role;
GRANT ALL ON FUNCTION storage.extension(name text) TO dashboard_user;
GRANT ALL ON FUNCTION storage.extension(name text) TO postgres;


--
-- Name: FUNCTION filename(name text); Type: ACL; Schema: storage; Owner: -
--

GRANT ALL ON FUNCTION storage.filename(name text) TO anon;
GRANT ALL ON FUNCTION storage.filename(name text) TO authenticated;
GRANT ALL ON FUNCTION storage.filename(name text) TO service_role;
GRANT ALL ON FUNCTION storage.filename(name text) TO dashboard_user;
GRANT ALL ON FUNCTION storage.filename(name text) TO postgres;


--
-- Name: FUNCTION foldername(name text); Type: ACL; Schema: storage; Owner: -
--

GRANT ALL ON FUNCTION storage.foldername(name text) TO anon;
GRANT ALL ON FUNCTION storage.foldername(name text) TO authenticated;
GRANT ALL ON FUNCTION storage.foldername(name text) TO service_role;
GRANT ALL ON FUNCTION storage.foldername(name text) TO dashboard_user;
GRANT ALL ON FUNCTION storage.foldername(name text) TO postgres;


--
-- Name: FUNCTION get_size_by_bucket(); Type: ACL; Schema: storage; Owner: -
--

GRANT ALL ON FUNCTION storage.get_size_by_bucket() TO postgres;


--
-- Name: FUNCTION search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text); Type: ACL; Schema: storage; Owner: -
--

GRANT ALL ON FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) TO postgres;


--
-- Name: FUNCTION update_updated_at_column(); Type: ACL; Schema: storage; Owner: -
--

GRANT ALL ON FUNCTION storage.update_updated_at_column() TO postgres;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO postgres;
GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: -
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: -
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: -
--

GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: SEQUENCE seq_schema_version; Type: ACL; Schema: graphql; Owner: -
--

GRANT ALL ON SEQUENCE graphql.seq_schema_version TO postgres;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO anon;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO authenticated;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO service_role;


--
-- Name: TABLE decrypted_key; Type: ACL; Schema: pgsodium; Owner: -
--

GRANT ALL ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;


--
-- Name: TABLE masking_rule; Type: ACL; Schema: pgsodium; Owner: -
--

GRANT ALL ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;


--
-- Name: TABLE mask_columns; Type: ACL; Schema: pgsodium; Owner: -
--

GRANT ALL ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;


--
-- Name: TABLE ai_models; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.ai_models TO anon;
GRANT ALL ON TABLE public.ai_models TO authenticated;
GRANT ALL ON TABLE public.ai_models TO service_role;


--
-- Name: SEQUENCE "AI_id_seq"; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public."AI_id_seq" TO anon;
GRANT ALL ON SEQUENCE public."AI_id_seq" TO authenticated;
GRANT ALL ON SEQUENCE public."AI_id_seq" TO service_role;


--
-- Name: TABLE ai_model_teams; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.ai_model_teams TO anon;
GRANT ALL ON TABLE public.ai_model_teams TO authenticated;
GRANT ALL ON TABLE public.ai_model_teams TO service_role;


--
-- Name: TABLE ai_model_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.ai_model_users TO anon;
GRANT ALL ON TABLE public.ai_model_users TO authenticated;
GRANT ALL ON TABLE public.ai_model_users TO service_role;


--
-- Name: TABLE bookmarks; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.bookmarks TO anon;
GRANT ALL ON TABLE public.bookmarks TO authenticated;
GRANT ALL ON TABLE public.bookmarks TO service_role;


--
-- Name: SEQUENCE bookmarks_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.bookmarks_id_seq TO anon;
GRANT ALL ON SEQUENCE public.bookmarks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.bookmarks_id_seq TO service_role;


--
-- Name: TABLE chat_messages; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.chat_messages TO anon;
GRANT ALL ON TABLE public.chat_messages TO authenticated;
GRANT ALL ON TABLE public.chat_messages TO service_role;


--
-- Name: SEQUENCE chat_messages_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.chat_messages_id_seq TO anon;
GRANT ALL ON SEQUENCE public.chat_messages_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.chat_messages_id_seq TO service_role;


--
-- Name: TABLE chat_teams; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.chat_teams TO anon;
GRANT ALL ON TABLE public.chat_teams TO authenticated;
GRANT ALL ON TABLE public.chat_teams TO service_role;


--
-- Name: TABLE chat_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.chat_users TO anon;
GRANT ALL ON TABLE public.chat_users TO authenticated;
GRANT ALL ON TABLE public.chat_users TO service_role;


--
-- Name: TABLE chats; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.chats TO anon;
GRANT ALL ON TABLE public.chats TO authenticated;
GRANT ALL ON TABLE public.chats TO service_role;


--
-- Name: TABLE citations; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.citations TO anon;
GRANT ALL ON TABLE public.citations TO authenticated;
GRANT ALL ON TABLE public.citations TO service_role;


--
-- Name: SEQUENCE citations_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.citations_id_seq TO anon;
GRANT ALL ON SEQUENCE public.citations_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.citations_id_seq TO service_role;


--
-- Name: TABLE code_block_teams; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.code_block_teams TO anon;
GRANT ALL ON TABLE public.code_block_teams TO authenticated;
GRANT ALL ON TABLE public.code_block_teams TO service_role;


--
-- Name: TABLE code_block_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.code_block_users TO anon;
GRANT ALL ON TABLE public.code_block_users TO authenticated;
GRANT ALL ON TABLE public.code_block_users TO service_role;


--
-- Name: TABLE code_blocks; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.code_blocks TO anon;
GRANT ALL ON TABLE public.code_blocks TO authenticated;
GRANT ALL ON TABLE public.code_blocks TO service_role;


--
-- Name: SEQUENCE code_blocks_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.code_blocks_id_seq TO anon;
GRANT ALL ON SEQUENCE public.code_blocks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.code_blocks_id_seq TO service_role;


--
-- Name: TABLE comment_upvotes; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.comment_upvotes TO anon;
GRANT ALL ON TABLE public.comment_upvotes TO authenticated;
GRANT ALL ON TABLE public.comment_upvotes TO service_role;


--
-- Name: SEQUENCE conversations_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.conversations_id_seq TO anon;
GRANT ALL ON SEQUENCE public.conversations_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.conversations_id_seq TO service_role;


--
-- Name: TABLE data_analyses; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.data_analyses TO anon;
GRANT ALL ON TABLE public.data_analyses TO authenticated;
GRANT ALL ON TABLE public.data_analyses TO service_role;


--
-- Name: TABLE data_analysis_teams; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.data_analysis_teams TO anon;
GRANT ALL ON TABLE public.data_analysis_teams TO authenticated;
GRANT ALL ON TABLE public.data_analysis_teams TO service_role;


--
-- Name: TABLE data_analysis_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.data_analysis_users TO anon;
GRANT ALL ON TABLE public.data_analysis_users TO authenticated;
GRANT ALL ON TABLE public.data_analysis_users TO service_role;


--
-- Name: SEQUENCE dataanalysis_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.dataanalysis_id_seq TO anon;
GRANT ALL ON SEQUENCE public.dataanalysis_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.dataanalysis_id_seq TO service_role;


--
-- Name: TABLE dataset_teams; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.dataset_teams TO anon;
GRANT ALL ON TABLE public.dataset_teams TO authenticated;
GRANT ALL ON TABLE public.dataset_teams TO service_role;


--
-- Name: TABLE dataset_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.dataset_users TO anon;
GRANT ALL ON TABLE public.dataset_users TO authenticated;
GRANT ALL ON TABLE public.dataset_users TO service_role;


--
-- Name: TABLE datasets; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.datasets TO anon;
GRANT ALL ON TABLE public.datasets TO authenticated;
GRANT ALL ON TABLE public.datasets TO service_role;


--
-- Name: SEQUENCE datasets_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.datasets_id_seq TO anon;
GRANT ALL ON SEQUENCE public.datasets_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.datasets_id_seq TO service_role;


--
-- Name: TABLE discussion_comments; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.discussion_comments TO anon;
GRANT ALL ON TABLE public.discussion_comments TO authenticated;
GRANT ALL ON TABLE public.discussion_comments TO service_role;


--
-- Name: SEQUENCE discussion_comments_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.discussion_comments_id_seq TO anon;
GRANT ALL ON SEQUENCE public.discussion_comments_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.discussion_comments_id_seq TO service_role;


--
-- Name: TABLE discussion_upvotes; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.discussion_upvotes TO anon;
GRANT ALL ON TABLE public.discussion_upvotes TO authenticated;
GRANT ALL ON TABLE public.discussion_upvotes TO service_role;


--
-- Name: TABLE discussions; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.discussions TO anon;
GRANT ALL ON TABLE public.discussions TO authenticated;
GRANT ALL ON TABLE public.discussions TO service_role;


--
-- Name: SEQUENCE discussions_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.discussions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.discussions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.discussions_id_seq TO service_role;


--
-- Name: TABLE experiment_teams; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.experiment_teams TO anon;
GRANT ALL ON TABLE public.experiment_teams TO authenticated;
GRANT ALL ON TABLE public.experiment_teams TO service_role;


--
-- Name: TABLE experiment_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.experiment_users TO anon;
GRANT ALL ON TABLE public.experiment_users TO authenticated;
GRANT ALL ON TABLE public.experiment_users TO service_role;


--
-- Name: TABLE experiments; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.experiments TO anon;
GRANT ALL ON TABLE public.experiments TO authenticated;
GRANT ALL ON TABLE public.experiments TO service_role;


--
-- Name: SEQUENCE experiments_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.experiments_id_seq TO anon;
GRANT ALL ON SEQUENCE public.experiments_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.experiments_id_seq TO service_role;


--
-- Name: TABLE feedback_responses; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.feedback_responses TO anon;
GRANT ALL ON TABLE public.feedback_responses TO authenticated;
GRANT ALL ON TABLE public.feedback_responses TO service_role;


--
-- Name: SEQUENCE feedback_responses_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.feedback_responses_id_seq TO anon;
GRANT ALL ON SEQUENCE public.feedback_responses_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.feedback_responses_id_seq TO service_role;


--
-- Name: TABLE feedbacks; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.feedbacks TO anon;
GRANT ALL ON TABLE public.feedbacks TO authenticated;
GRANT ALL ON TABLE public.feedbacks TO service_role;


--
-- Name: SEQUENCE feedbacks_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.feedbacks_id_seq TO anon;
GRANT ALL ON SEQUENCE public.feedbacks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.feedbacks_id_seq TO service_role;


--
-- Name: TABLE field_of_research_relationships; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.field_of_research_relationships TO anon;
GRANT ALL ON TABLE public.field_of_research_relationships TO authenticated;
GRANT ALL ON TABLE public.field_of_research_relationships TO service_role;


--
-- Name: TABLE fields_of_research; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.fields_of_research TO anon;
GRANT ALL ON TABLE public.fields_of_research TO authenticated;
GRANT ALL ON TABLE public.fields_of_research TO service_role;


--
-- Name: SEQUENCE fields_of_research_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.fields_of_research_id_seq TO anon;
GRANT ALL ON SEQUENCE public.fields_of_research_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.fields_of_research_id_seq TO service_role;


--
-- Name: TABLE files; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.files TO anon;
GRANT ALL ON TABLE public.files TO authenticated;
GRANT ALL ON TABLE public.files TO service_role;


--
-- Name: SEQUENCE files_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.files_id_seq TO anon;
GRANT ALL ON SEQUENCE public.files_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.files_id_seq TO service_role;


--
-- Name: TABLE folders; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.folders TO anon;
GRANT ALL ON TABLE public.folders TO authenticated;
GRANT ALL ON TABLE public.folders TO service_role;


--
-- Name: SEQUENCE folders_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.folders_id_seq TO anon;
GRANT ALL ON SEQUENCE public.folders_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.folders_id_seq TO service_role;


--
-- Name: TABLE follows; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.follows TO anon;
GRANT ALL ON TABLE public.follows TO authenticated;
GRANT ALL ON TABLE public.follows TO service_role;


--
-- Name: TABLE links; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.links TO anon;
GRANT ALL ON TABLE public.links TO authenticated;
GRANT ALL ON TABLE public.links TO service_role;


--
-- Name: SEQUENCE object_relationships_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.object_relationships_id_seq TO anon;
GRANT ALL ON SEQUENCE public.object_relationships_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.object_relationships_id_seq TO service_role;


--
-- Name: TABLE paper_teams; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.paper_teams TO anon;
GRANT ALL ON TABLE public.paper_teams TO authenticated;
GRANT ALL ON TABLE public.paper_teams TO service_role;


--
-- Name: TABLE paper_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.paper_users TO anon;
GRANT ALL ON TABLE public.paper_users TO authenticated;
GRANT ALL ON TABLE public.paper_users TO service_role;


--
-- Name: TABLE papers; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.papers TO anon;
GRANT ALL ON TABLE public.papers TO authenticated;
GRANT ALL ON TABLE public.papers TO service_role;


--
-- Name: SEQUENCE papers_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.papers_id_seq TO anon;
GRANT ALL ON SEQUENCE public.papers_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.papers_id_seq TO service_role;


--
-- Name: TABLE plan_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.plan_users TO anon;
GRANT ALL ON TABLE public.plan_users TO authenticated;
GRANT ALL ON TABLE public.plan_users TO service_role;


--
-- Name: TABLE plans; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.plans TO anon;
GRANT ALL ON TABLE public.plans TO authenticated;
GRANT ALL ON TABLE public.plans TO service_role;


--
-- Name: SEQUENCE plans_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.plans_id_seq TO anon;
GRANT ALL ON SEQUENCE public.plans_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.plans_id_seq TO service_role;


--
-- Name: TABLE project_ai_models; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_ai_models TO anon;
GRANT ALL ON TABLE public.project_ai_models TO authenticated;
GRANT ALL ON TABLE public.project_ai_models TO service_role;


--
-- Name: TABLE project_code_blocks; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_code_blocks TO anon;
GRANT ALL ON TABLE public.project_code_blocks TO authenticated;
GRANT ALL ON TABLE public.project_code_blocks TO service_role;


--
-- Name: TABLE project_data_analyses; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_data_analyses TO anon;
GRANT ALL ON TABLE public.project_data_analyses TO authenticated;
GRANT ALL ON TABLE public.project_data_analyses TO service_role;


--
-- Name: TABLE project_datasets; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_datasets TO anon;
GRANT ALL ON TABLE public.project_datasets TO authenticated;
GRANT ALL ON TABLE public.project_datasets TO service_role;


--
-- Name: TABLE project_deltas; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_deltas TO anon;
GRANT ALL ON TABLE public.project_deltas TO authenticated;
GRANT ALL ON TABLE public.project_deltas TO service_role;


--
-- Name: SEQUENCE project_deltas_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.project_deltas_id_seq TO anon;
GRANT ALL ON SEQUENCE public.project_deltas_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.project_deltas_id_seq TO service_role;


--
-- Name: TABLE project_experiments; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_experiments TO anon;
GRANT ALL ON TABLE public.project_experiments TO authenticated;
GRANT ALL ON TABLE public.project_experiments TO service_role;


--
-- Name: TABLE project_fields_of_research; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_fields_of_research TO anon;
GRANT ALL ON TABLE public.project_fields_of_research TO authenticated;
GRANT ALL ON TABLE public.project_fields_of_research TO service_role;


--
-- Name: TABLE project_issue_responses; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_issue_responses TO anon;
GRANT ALL ON TABLE public.project_issue_responses TO authenticated;
GRANT ALL ON TABLE public.project_issue_responses TO service_role;


--
-- Name: SEQUENCE project_issue_responses_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.project_issue_responses_id_seq TO anon;
GRANT ALL ON SEQUENCE public.project_issue_responses_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.project_issue_responses_id_seq TO service_role;


--
-- Name: TABLE project_issue_teams; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_issue_teams TO anon;
GRANT ALL ON TABLE public.project_issue_teams TO authenticated;
GRANT ALL ON TABLE public.project_issue_teams TO service_role;


--
-- Name: TABLE project_issue_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_issue_users TO anon;
GRANT ALL ON TABLE public.project_issue_users TO authenticated;
GRANT ALL ON TABLE public.project_issue_users TO service_role;


--
-- Name: TABLE project_issues; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_issues TO anon;
GRANT ALL ON TABLE public.project_issues TO authenticated;
GRANT ALL ON TABLE public.project_issues TO service_role;


--
-- Name: SEQUENCE project_issues_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.project_issues_id_seq TO anon;
GRANT ALL ON SEQUENCE public.project_issues_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.project_issues_id_seq TO service_role;


--
-- Name: TABLE project_papers; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_papers TO anon;
GRANT ALL ON TABLE public.project_papers TO authenticated;
GRANT ALL ON TABLE public.project_papers TO service_role;


--
-- Name: TABLE project_review_teams; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_review_teams TO anon;
GRANT ALL ON TABLE public.project_review_teams TO authenticated;
GRANT ALL ON TABLE public.project_review_teams TO service_role;


--
-- Name: TABLE project_review_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_review_users TO anon;
GRANT ALL ON TABLE public.project_review_users TO authenticated;
GRANT ALL ON TABLE public.project_review_users TO service_role;


--
-- Name: TABLE project_reviews; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_reviews TO anon;
GRANT ALL ON TABLE public.project_reviews TO authenticated;
GRANT ALL ON TABLE public.project_reviews TO service_role;


--
-- Name: SEQUENCE project_reviews_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.project_reviews_id_seq TO anon;
GRANT ALL ON SEQUENCE public.project_reviews_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.project_reviews_id_seq TO service_role;


--
-- Name: TABLE project_shares; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_shares TO anon;
GRANT ALL ON TABLE public.project_shares TO authenticated;
GRANT ALL ON TABLE public.project_shares TO service_role;


--
-- Name: TABLE project_snapshots; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_snapshots TO anon;
GRANT ALL ON TABLE public.project_snapshots TO authenticated;
GRANT ALL ON TABLE public.project_snapshots TO service_role;


--
-- Name: SEQUENCE project_snapshots_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.project_snapshots_id_seq TO anon;
GRANT ALL ON SEQUENCE public.project_snapshots_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.project_snapshots_id_seq TO service_role;


--
-- Name: TABLE project_submission_teams; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_submission_teams TO anon;
GRANT ALL ON TABLE public.project_submission_teams TO authenticated;
GRANT ALL ON TABLE public.project_submission_teams TO service_role;


--
-- Name: TABLE project_submission_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_submission_users TO anon;
GRANT ALL ON TABLE public.project_submission_users TO authenticated;
GRANT ALL ON TABLE public.project_submission_users TO service_role;


--
-- Name: TABLE project_submissions; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_submissions TO anon;
GRANT ALL ON TABLE public.project_submissions TO authenticated;
GRANT ALL ON TABLE public.project_submissions TO service_role;


--
-- Name: SEQUENCE project_submissions_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.project_submissions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.project_submissions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.project_submissions_id_seq TO service_role;


--
-- Name: TABLE project_teams; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_teams TO anon;
GRANT ALL ON TABLE public.project_teams TO authenticated;
GRANT ALL ON TABLE public.project_teams TO service_role;


--
-- Name: TABLE project_upvotes; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_upvotes TO anon;
GRANT ALL ON TABLE public.project_upvotes TO authenticated;
GRANT ALL ON TABLE public.project_upvotes TO service_role;


--
-- Name: TABLE project_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_users TO anon;
GRANT ALL ON TABLE public.project_users TO authenticated;
GRANT ALL ON TABLE public.project_users TO service_role;


--
-- Name: TABLE project_version_teams; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_version_teams TO anon;
GRANT ALL ON TABLE public.project_version_teams TO authenticated;
GRANT ALL ON TABLE public.project_version_teams TO service_role;


--
-- Name: TABLE project_version_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_version_users TO anon;
GRANT ALL ON TABLE public.project_version_users TO authenticated;
GRANT ALL ON TABLE public.project_version_users TO service_role;


--
-- Name: TABLE project_versions; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_versions TO anon;
GRANT ALL ON TABLE public.project_versions TO authenticated;
GRANT ALL ON TABLE public.project_versions TO service_role;


--
-- Name: TABLE project_versions_graphs; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_versions_graphs TO anon;
GRANT ALL ON TABLE public.project_versions_graphs TO authenticated;
GRANT ALL ON TABLE public.project_versions_graphs TO service_role;


--
-- Name: SEQUENCE project_versions_graphs_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.project_versions_graphs_id_seq TO anon;
GRANT ALL ON SEQUENCE public.project_versions_graphs_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.project_versions_graphs_id_seq TO service_role;


--
-- Name: SEQUENCE project_versions_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.project_versions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.project_versions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.project_versions_id_seq TO service_role;


--
-- Name: TABLE project_views; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_views TO anon;
GRANT ALL ON TABLE public.project_views TO authenticated;
GRANT ALL ON TABLE public.project_views TO service_role;


--
-- Name: TABLE project_work_submissions; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_work_submissions TO anon;
GRANT ALL ON TABLE public.project_work_submissions TO authenticated;
GRANT ALL ON TABLE public.project_work_submissions TO service_role;


--
-- Name: TABLE project_works; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.project_works TO anon;
GRANT ALL ON TABLE public.project_works TO authenticated;
GRANT ALL ON TABLE public.project_works TO service_role;


--
-- Name: TABLE projects; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.projects TO anon;
GRANT ALL ON TABLE public.projects TO authenticated;
GRANT ALL ON TABLE public.projects TO service_role;


--
-- Name: SEQUENCE projects_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.projects_id_seq TO anon;
GRANT ALL ON SEQUENCE public.projects_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.projects_id_seq TO service_role;


--
-- Name: TABLE team_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.team_users TO anon;
GRANT ALL ON TABLE public.team_users TO authenticated;
GRANT ALL ON TABLE public.team_users TO service_role;


--
-- Name: TABLE teams; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.teams TO anon;
GRANT ALL ON TABLE public.teams TO authenticated;
GRANT ALL ON TABLE public.teams TO service_role;


--
-- Name: TABLE user_settings; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.user_settings TO anon;
GRANT ALL ON TABLE public.user_settings TO authenticated;
GRANT ALL ON TABLE public.user_settings TO service_role;


--
-- Name: TABLE user_status; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.user_status TO anon;
GRANT ALL ON TABLE public.user_status TO authenticated;
GRANT ALL ON TABLE public.user_status TO service_role;


--
-- Name: SEQUENCE user_status_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.user_status_id_seq TO anon;
GRANT ALL ON SEQUENCE public.user_status_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.user_status_id_seq TO service_role;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.users TO anon;
GRANT ALL ON TABLE public.users TO authenticated;
GRANT ALL ON TABLE public.users TO service_role;


--
-- Name: TABLE work_citations; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_citations TO anon;
GRANT ALL ON TABLE public.work_citations TO authenticated;
GRANT ALL ON TABLE public.work_citations TO service_role;


--
-- Name: SEQUENCE work_ctations_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.work_ctations_id_seq TO anon;
GRANT ALL ON SEQUENCE public.work_ctations_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.work_ctations_id_seq TO service_role;


--
-- Name: TABLE work_deltas; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_deltas TO anon;
GRANT ALL ON TABLE public.work_deltas TO authenticated;
GRANT ALL ON TABLE public.work_deltas TO service_role;


--
-- Name: SEQUENCE work_deltas_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.work_deltas_id_seq TO anon;
GRANT ALL ON SEQUENCE public.work_deltas_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.work_deltas_id_seq TO service_role;


--
-- Name: TABLE work_fields_of_research; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_fields_of_research TO anon;
GRANT ALL ON TABLE public.work_fields_of_research TO authenticated;
GRANT ALL ON TABLE public.work_fields_of_research TO service_role;


--
-- Name: TABLE work_issue_responses; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_issue_responses TO anon;
GRANT ALL ON TABLE public.work_issue_responses TO authenticated;
GRANT ALL ON TABLE public.work_issue_responses TO service_role;


--
-- Name: SEQUENCE work_issue_responses_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.work_issue_responses_id_seq TO anon;
GRANT ALL ON SEQUENCE public.work_issue_responses_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.work_issue_responses_id_seq TO service_role;


--
-- Name: TABLE work_issue_teams; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_issue_teams TO anon;
GRANT ALL ON TABLE public.work_issue_teams TO authenticated;
GRANT ALL ON TABLE public.work_issue_teams TO service_role;


--
-- Name: TABLE work_issue_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_issue_users TO anon;
GRANT ALL ON TABLE public.work_issue_users TO authenticated;
GRANT ALL ON TABLE public.work_issue_users TO service_role;


--
-- Name: TABLE work_issues; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_issues TO anon;
GRANT ALL ON TABLE public.work_issues TO authenticated;
GRANT ALL ON TABLE public.work_issues TO service_role;


--
-- Name: SEQUENCE work_issues_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.work_issues_id_seq TO anon;
GRANT ALL ON SEQUENCE public.work_issues_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.work_issues_id_seq TO service_role;


--
-- Name: TABLE work_review_teams; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_review_teams TO anon;
GRANT ALL ON TABLE public.work_review_teams TO authenticated;
GRANT ALL ON TABLE public.work_review_teams TO service_role;


--
-- Name: TABLE work_review_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_review_users TO anon;
GRANT ALL ON TABLE public.work_review_users TO authenticated;
GRANT ALL ON TABLE public.work_review_users TO service_role;


--
-- Name: TABLE work_reviews; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_reviews TO anon;
GRANT ALL ON TABLE public.work_reviews TO authenticated;
GRANT ALL ON TABLE public.work_reviews TO service_role;


--
-- Name: SEQUENCE work_reviews_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.work_reviews_id_seq TO anon;
GRANT ALL ON SEQUENCE public.work_reviews_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.work_reviews_id_seq TO service_role;


--
-- Name: TABLE work_snapshots; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_snapshots TO anon;
GRANT ALL ON TABLE public.work_snapshots TO authenticated;
GRANT ALL ON TABLE public.work_snapshots TO service_role;


--
-- Name: SEQUENCE work_snapshots_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.work_snapshots_id_seq TO anon;
GRANT ALL ON SEQUENCE public.work_snapshots_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.work_snapshots_id_seq TO service_role;


--
-- Name: TABLE work_submission_teams; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_submission_teams TO anon;
GRANT ALL ON TABLE public.work_submission_teams TO authenticated;
GRANT ALL ON TABLE public.work_submission_teams TO service_role;


--
-- Name: TABLE work_submission_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_submission_users TO anon;
GRANT ALL ON TABLE public.work_submission_users TO authenticated;
GRANT ALL ON TABLE public.work_submission_users TO service_role;


--
-- Name: TABLE work_submissions; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_submissions TO anon;
GRANT ALL ON TABLE public.work_submissions TO authenticated;
GRANT ALL ON TABLE public.work_submissions TO service_role;


--
-- Name: SEQUENCE work_submissions_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.work_submissions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.work_submissions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.work_submissions_id_seq TO service_role;


--
-- Name: TABLE work_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_users TO anon;
GRANT ALL ON TABLE public.work_users TO authenticated;
GRANT ALL ON TABLE public.work_users TO service_role;


--
-- Name: TABLE work_version_teams; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_version_teams TO anon;
GRANT ALL ON TABLE public.work_version_teams TO authenticated;
GRANT ALL ON TABLE public.work_version_teams TO service_role;


--
-- Name: TABLE work_version_users; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_version_users TO anon;
GRANT ALL ON TABLE public.work_version_users TO authenticated;
GRANT ALL ON TABLE public.work_version_users TO service_role;


--
-- Name: TABLE work_versions; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_versions TO anon;
GRANT ALL ON TABLE public.work_versions TO authenticated;
GRANT ALL ON TABLE public.work_versions TO service_role;


--
-- Name: TABLE work_versions_graphs; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.work_versions_graphs TO anon;
GRANT ALL ON TABLE public.work_versions_graphs TO authenticated;
GRANT ALL ON TABLE public.work_versions_graphs TO service_role;


--
-- Name: SEQUENCE work_versions_graphs_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.work_versions_graphs_id_seq TO anon;
GRANT ALL ON SEQUENCE public.work_versions_graphs_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.work_versions_graphs_id_seq TO service_role;


--
-- Name: SEQUENCE work_versions_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.work_versions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.work_versions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.work_versions_id_seq TO service_role;


--
-- Name: TABLE works; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE public.works TO anon;
GRANT ALL ON TABLE public.works TO authenticated;
GRANT ALL ON TABLE public.works TO service_role;


--
-- Name: SEQUENCE works_id_seq; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON SEQUENCE public.works_id_seq TO anon;
GRANT ALL ON SEQUENCE public.works_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.works_id_seq TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: SEQUENCE messages_id_seq; Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON SEQUENCE realtime.messages_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.messages_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: -
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: -
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE migrations; Type: ACL; Schema: storage; Owner: -
--

GRANT ALL ON TABLE storage.migrations TO anon;
GRANT ALL ON TABLE storage.migrations TO authenticated;
GRANT ALL ON TABLE storage.migrations TO service_role;
GRANT ALL ON TABLE storage.migrations TO postgres;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: -
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: -
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: -
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON TABLES TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON TABLES TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: -
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


--
-- PostgreSQL database dump complete
--

