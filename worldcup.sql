--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (33, 2018, 'Final', 4, 2, 65, 66);
INSERT INTO public.games VALUES (34, 2018, 'Third Place', 2, 0, 67, 68);
INSERT INTO public.games VALUES (35, 2018, 'Semi-Final', 2, 1, 66, 68);
INSERT INTO public.games VALUES (36, 2018, 'Semi-Final', 1, 0, 65, 67);
INSERT INTO public.games VALUES (37, 2018, 'Quarter-Final', 3, 2, 66, 74);
INSERT INTO public.games VALUES (38, 2018, 'Quarter-Final', 2, 0, 68, 76);
INSERT INTO public.games VALUES (39, 2018, 'Quarter-Final', 2, 1, 67, 78);
INSERT INTO public.games VALUES (40, 2018, 'Quarter-Final', 2, 0, 65, 80);
INSERT INTO public.games VALUES (41, 2018, 'Eighth-Final', 2, 1, 68, 82);
INSERT INTO public.games VALUES (42, 2018, 'Eighth-Final', 1, 0, 76, 84);
INSERT INTO public.games VALUES (43, 2018, 'Eighth-Final', 3, 2, 67, 86);
INSERT INTO public.games VALUES (44, 2018, 'Eighth-Final', 2, 0, 78, 88);
INSERT INTO public.games VALUES (45, 2018, 'Eighth-Final', 2, 1, 66, 90);
INSERT INTO public.games VALUES (46, 2018, 'Eighth-Final', 2, 1, 74, 92);
INSERT INTO public.games VALUES (47, 2018, 'Eighth-Final', 2, 1, 80, 94);
INSERT INTO public.games VALUES (48, 2018, 'Eighth-Final', 4, 3, 65, 96);
INSERT INTO public.games VALUES (49, 2014, 'Final', 1, 0, 97, 96);
INSERT INTO public.games VALUES (50, 2014, 'Third Place', 3, 0, 99, 78);
INSERT INTO public.games VALUES (51, 2014, 'Semi-Final', 1, 0, 96, 99);
INSERT INTO public.games VALUES (52, 2014, 'Semi-Final', 7, 1, 97, 78);
INSERT INTO public.games VALUES (53, 2014, 'Quarter-Final', 1, 0, 99, 106);
INSERT INTO public.games VALUES (54, 2014, 'Quarter-Final', 1, 0, 96, 67);
INSERT INTO public.games VALUES (55, 2014, 'Quarter-Final', 2, 1, 78, 82);
INSERT INTO public.games VALUES (56, 2014, 'Quarter-Final', 1, 0, 97, 65);
INSERT INTO public.games VALUES (57, 2014, 'Eighth-Final', 2, 1, 78, 114);
INSERT INTO public.games VALUES (58, 2014, 'Eighth-Final', 2, 0, 82, 80);
INSERT INTO public.games VALUES (59, 2014, 'Eighth-Final', 2, 0, 65, 118);
INSERT INTO public.games VALUES (60, 2014, 'Eighth-Final', 2, 1, 97, 120);
INSERT INTO public.games VALUES (61, 2014, 'Eighth-Final', 2, 1, 99, 88);
INSERT INTO public.games VALUES (62, 2014, 'Eighth-Final', 2, 1, 106, 124);
INSERT INTO public.games VALUES (63, 2014, 'Eighth-Final', 1, 0, 96, 84);
INSERT INTO public.games VALUES (64, 2014, 'Eighth-Final', 2, 1, 67, 128);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (65, 'France');
INSERT INTO public.teams VALUES (66, 'Croatia');
INSERT INTO public.teams VALUES (67, 'Belgium');
INSERT INTO public.teams VALUES (68, 'England');
INSERT INTO public.teams VALUES (74, 'Russia');
INSERT INTO public.teams VALUES (76, 'Sweden');
INSERT INTO public.teams VALUES (78, 'Brazil');
INSERT INTO public.teams VALUES (80, 'Uruguay');
INSERT INTO public.teams VALUES (82, 'Colombia');
INSERT INTO public.teams VALUES (84, 'Switzerland');
INSERT INTO public.teams VALUES (86, 'Japan');
INSERT INTO public.teams VALUES (88, 'Mexico');
INSERT INTO public.teams VALUES (90, 'Denmark');
INSERT INTO public.teams VALUES (92, 'Spain');
INSERT INTO public.teams VALUES (94, 'Portugal');
INSERT INTO public.teams VALUES (96, 'Argentina');
INSERT INTO public.teams VALUES (97, 'Germany');
INSERT INTO public.teams VALUES (99, 'Netherlands');
INSERT INTO public.teams VALUES (106, 'Costa Rica');
INSERT INTO public.teams VALUES (114, 'Chile');
INSERT INTO public.teams VALUES (118, 'Nigeria');
INSERT INTO public.teams VALUES (120, 'Algeria');
INSERT INTO public.teams VALUES (124, 'Greece');
INSERT INTO public.teams VALUES (128, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 64, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 128, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

