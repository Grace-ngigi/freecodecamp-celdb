--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

ALTER TABLE ONLY public.star DROP CONSTRAINT star_galaxy_id_fkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_star_id_fkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_planet_id_fkey;
ALTER TABLE ONLY public.sun DROP CONSTRAINT sun_pkey;
ALTER TABLE ONLY public.sun DROP CONSTRAINT sun_name_key;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_pkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_name_key;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_pkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_name_key;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_pkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_name_key;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_pkey;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_name_key;
ALTER TABLE public.sun ALTER COLUMN sun_id DROP DEFAULT;
ALTER TABLE public.star ALTER COLUMN star_id DROP DEFAULT;
ALTER TABLE public.planet ALTER COLUMN planet_id DROP DEFAULT;
ALTER TABLE public.moon ALTER COLUMN moon_id DROP DEFAULT;
ALTER TABLE public.galaxy ALTER COLUMN galaxy_id DROP DEFAULT;
DROP SEQUENCE public.sun_sun_id_seq;
DROP TABLE public.sun;
DROP SEQUENCE public.star_star_id_seq;
DROP TABLE public.star;
DROP SEQUENCE public.planet_planet_id_seq;
DROP TABLE public.planet;
DROP SEQUENCE public.moon_moon_id_seq;
DROP TABLE public.moon;
DROP SEQUENCE public.galaxy_galaxy_id_seq;
DROP TABLE public.galaxy;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    orbital_period numeric(4,2),
    age integer,
    radius integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    orbital_period numeric(4,2),
    age integer,
    radius integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    orbital_period numeric(4,2),
    age integer,
    radius integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    orbital_period numeric(4,2),
    age integer,
    radius integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    sun_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    orbital_period numeric(4,2),
    age integer,
    radius integer
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sun_sun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sun_sun_id_seq OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sun_sun_id_seq OWNED BY public.sun.sun_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: sun sun_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun ALTER COLUMN sun_id SET DEFAULT nextval('public.sun_sun_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'gone', 'interesting', true, false, 45.45, 445, 2343);
INSERT INTO public.galaxy VALUES (2, 'gtwo', 'proud', false, false, 55.32, 4566, 567);
INSERT INTO public.galaxy VALUES (5, 'gfour', 'interesting', true, false, 45.45, 445, 2343);
INSERT INTO public.galaxy VALUES (6, 'gthree', 'proud', false, false, 55.32, 4566, 567);
INSERT INTO public.galaxy VALUES (7, 'gsix', 'interesting', true, false, 45.45, 445, 2343);
INSERT INTO public.galaxy VALUES (8, 'gfive', 'proud', false, false, 55.32, 4566, 567);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (11, 'mone', NULL, false, NULL, NULL, 4567, NULL, 1);
INSERT INTO public.moon VALUES (12, 'mtwo', NULL, false, NULL, NULL, 3456, NULL, 2);
INSERT INTO public.moon VALUES (13, 'mthree', NULL, true, NULL, NULL, 3456, NULL, 3);
INSERT INTO public.moon VALUES (14, 'mfour', NULL, true, NULL, NULL, 3456, NULL, 4);
INSERT INTO public.moon VALUES (15, 'mfive', NULL, true, NULL, NULL, 56767, NULL, 5);
INSERT INTO public.moon VALUES (16, 'mten', NULL, false, NULL, NULL, 4567, NULL, 10);
INSERT INTO public.moon VALUES (17, 'mnine', NULL, false, NULL, NULL, 3456, NULL, 9);
INSERT INTO public.moon VALUES (18, 'eight', NULL, true, NULL, NULL, 3456, NULL, 8);
INSERT INTO public.moon VALUES (19, 'mseven', NULL, true, NULL, NULL, 3456, NULL, 7);
INSERT INTO public.moon VALUES (20, 'msix', NULL, true, NULL, NULL, 56767, NULL, 6);
INSERT INTO public.moon VALUES (21, 'mfifteen', NULL, false, NULL, NULL, 4567, NULL, 1);
INSERT INTO public.moon VALUES (22, 'mfourteen', NULL, false, NULL, NULL, 3456, NULL, 2);
INSERT INTO public.moon VALUES (23, 'mthirteen', NULL, true, NULL, NULL, 3456, NULL, 3);
INSERT INTO public.moon VALUES (24, 'mtwelve', NULL, true, NULL, NULL, 3456, NULL, 4);
INSERT INTO public.moon VALUES (25, 'meleven', NULL, true, NULL, NULL, 56767, NULL, 5);
INSERT INTO public.moon VALUES (26, 'mtwenty', NULL, false, NULL, NULL, 4567, NULL, 10);
INSERT INTO public.moon VALUES (27, 'mnineten', NULL, false, NULL, NULL, 3456, NULL, 9);
INSERT INTO public.moon VALUES (28, 'eigheent', NULL, true, NULL, NULL, 3456, NULL, 8);
INSERT INTO public.moon VALUES (29, 'mseventeen', NULL, true, NULL, NULL, 3456, NULL, 7);
INSERT INTO public.moon VALUES (30, 'msiteenx', NULL, true, NULL, NULL, 56767, NULL, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'pone', NULL, false, NULL, NULL, 4567, NULL, 10);
INSERT INTO public.planet VALUES (2, 'ptwo', NULL, false, NULL, NULL, 4567, NULL, 11);
INSERT INTO public.planet VALUES (3, 'pthree', NULL, false, NULL, NULL, 345, NULL, 12);
INSERT INTO public.planet VALUES (4, 'pfour', NULL, true, NULL, NULL, 3456, NULL, 13);
INSERT INTO public.planet VALUES (5, 'pfive', NULL, false, NULL, NULL, 4567, NULL, 14);
INSERT INTO public.planet VALUES (6, 'psix', NULL, false, NULL, NULL, 345, NULL, 15);
INSERT INTO public.planet VALUES (7, 'pseven', NULL, true, NULL, NULL, 3456, NULL, 10);
INSERT INTO public.planet VALUES (8, 'peight', NULL, false, NULL, NULL, 4567, NULL, 14);
INSERT INTO public.planet VALUES (9, 'pnine', NULL, false, NULL, NULL, 345, NULL, 15);
INSERT INTO public.planet VALUES (10, 'pten', NULL, true, NULL, NULL, 3456, NULL, 11);
INSERT INTO public.planet VALUES (11, 'pelve', NULL, false, NULL, NULL, 4567, NULL, 14);
INSERT INTO public.planet VALUES (12, 'ptwelve', NULL, false, NULL, NULL, 345, NULL, 15);
INSERT INTO public.planet VALUES (13, 'pthirteen', NULL, true, NULL, NULL, 3456, NULL, 11);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (10, 'sone', 'shiny', false, true, 12.44, 456, 567, 1);
INSERT INTO public.star VALUES (11, 'stwo', 'shiny', false, true, 12.44, 456, 567, 2);
INSERT INTO public.star VALUES (12, 'sthree', 'dazlling', true, false, 2.45, 345, 457, 5);
INSERT INTO public.star VALUES (13, 'sfour', 'shiny', false, true, 12.44, 456, 567, 6);
INSERT INTO public.star VALUES (14, 'five', 'dazlling', true, false, 2.45, 345, 457, 7);
INSERT INTO public.star VALUES (15, 'ssixur', 'shiny', false, true, 12.44, 456, 5456, 8);


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES (1, 'mtwenty', NULL, false, NULL, NULL, 4567, 10);
INSERT INTO public.sun VALUES (2, 'mnineten', NULL, false, NULL, NULL, 3456, 9);
INSERT INTO public.sun VALUES (3, 'eigheent', NULL, true, NULL, NULL, 3456, 8);
INSERT INTO public.sun VALUES (4, 'mseventeen', NULL, true, NULL, NULL, 3456, 7);
INSERT INTO public.sun VALUES (5, 'msiteenx', NULL, true, NULL, NULL, 56767, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: sun_sun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sun_sun_id_seq', 5, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: sun sun_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_name_key UNIQUE (name);


--
-- Name: sun sun_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_pkey PRIMARY KEY (sun_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

