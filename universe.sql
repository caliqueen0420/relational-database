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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(255) NOT NULL,
    description text,
    galaxy_type text,
    age_in_billion_years numeric(800,0),
    visible_from_earth boolean,
    galaxy_id integer NOT NULL,
    distance_from_earth integer
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
    name character varying(255) NOT NULL,
    description text,
    moon_classification text,
    days_in_lunar_rotation numeric(500,0),
    planet_id integer,
    galaxy_id integer,
    star_id integer,
    moon_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    description text,
    planet_classification text,
    distance_from_earth_in_light_years numeric(5,2),
    has_moon boolean,
    visible_with_naked_eye boolean,
    star_id integer,
    galaxy_id integer,
    planet_id integer NOT NULL
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    name character varying(255) NOT NULL,
    description text,
    active boolean,
    satellite_id integer NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(255) NOT NULL,
    description text,
    star_classification text,
    brightness_of_star numeric(5,2),
    part_of_constellation boolean,
    burns_hot boolean,
    galaxy_id integer,
    star_id integer NOT NULL
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('GALAXY1', NULL, 'AA', 345, true, 1, NULL);
INSERT INTO public.galaxy VALUES ('GALAXY2', NULL, 'AB', 234, false, 2, NULL);
INSERT INTO public.galaxy VALUES ('GALAXY3', NULL, 'AC', 432, true, 3, NULL);
INSERT INTO public.galaxy VALUES ('GALAXY4', NULL, 'AD', 123, false, 4, NULL);
INSERT INTO public.galaxy VALUES ('GALAXY5', NULL, 'AE', 379, false, 5, NULL);
INSERT INTO public.galaxy VALUES ('GALAXY6', NULL, 'AF', 190, true, 6, NULL);
INSERT INTO public.galaxy VALUES ('GALAXY7', NULL, 'AG', 299, true, 7, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('MOON1', NULL, NULL, NULL, 1, 1, 1, 1);
INSERT INTO public.moon VALUES ('MOON2', NULL, NULL, NULL, 2, 2, 2, 2);
INSERT INTO public.moon VALUES ('MOON3', NULL, NULL, NULL, 3, 3, 3, 3);
INSERT INTO public.moon VALUES ('MOON4', NULL, NULL, NULL, 4, 4, 4, 4);
INSERT INTO public.moon VALUES ('MOON5', NULL, NULL, NULL, 5, 5, 5, 5);
INSERT INTO public.moon VALUES ('MOON6', NULL, NULL, NULL, 6, 6, 6, 6);
INSERT INTO public.moon VALUES ('MOON7', NULL, NULL, NULL, 7, 7, 1, 7);
INSERT INTO public.moon VALUES ('MOON8', NULL, NULL, NULL, 1, 1, 2, 8);
INSERT INTO public.moon VALUES ('MOON9', NULL, NULL, NULL, 2, 2, 2, 9);
INSERT INTO public.moon VALUES ('MOON10', NULL, NULL, NULL, 3, 3, 4, 10);
INSERT INTO public.moon VALUES ('MOON11', NULL, NULL, NULL, 4, 4, 1, 11);
INSERT INTO public.moon VALUES ('MOON12', NULL, NULL, NULL, 1, 1, 5, 12);
INSERT INTO public.moon VALUES ('MOON13', NULL, NULL, NULL, 2, 2, 2, 13);
INSERT INTO public.moon VALUES ('MOON14', NULL, NULL, NULL, 3, 3, 4, 14);
INSERT INTO public.moon VALUES ('MOON15', NULL, NULL, NULL, 4, 4, 1, 15);
INSERT INTO public.moon VALUES ('MOON16', NULL, NULL, NULL, 1, 1, 5, 16);
INSERT INTO public.moon VALUES ('MOON17', NULL, NULL, NULL, 2, 2, 2, 17);
INSERT INTO public.moon VALUES ('MOON18', NULL, NULL, NULL, 3, 3, 4, 18);
INSERT INTO public.moon VALUES ('MOON19', NULL, NULL, NULL, 4, 4, 1, 19);
INSERT INTO public.moon VALUES ('MOON20', NULL, NULL, NULL, 1, 1, 5, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('planet1', NULL, NULL, NULL, true, false, 1, 1, 1);
INSERT INTO public.planet VALUES ('PLANET2', NULL, NULL, NULL, true, false, 2, 2, 2);
INSERT INTO public.planet VALUES ('PLANET3', NULL, NULL, NULL, true, false, 3, 3, 3);
INSERT INTO public.planet VALUES ('PLANET4', NULL, NULL, NULL, true, false, 4, 4, 4);
INSERT INTO public.planet VALUES ('planet5', NULL, NULL, NULL, true, false, 5, 5, 5);
INSERT INTO public.planet VALUES ('PLANET6', NULL, NULL, NULL, true, false, 6, 6, 6);
INSERT INTO public.planet VALUES ('PLANET7', NULL, NULL, NULL, true, false, 1, 7, 7);
INSERT INTO public.planet VALUES ('PLANET8', NULL, NULL, NULL, true, false, 1, 1, 8);
INSERT INTO public.planet VALUES ('planet9', NULL, NULL, NULL, true, false, 2, 2, 9);
INSERT INTO public.planet VALUES ('PLANET10', NULL, NULL, NULL, true, false, 3, 3, 10);
INSERT INTO public.planet VALUES ('PLANET11', NULL, NULL, NULL, true, false, 4, 4, 11);
INSERT INTO public.planet VALUES ('PLANET12', NULL, NULL, NULL, true, false, 5, 5, 12);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES ('SAT1', NULL, true, 3);
INSERT INTO public.satellite VALUES ('SAT2', NULL, false, 1);
INSERT INTO public.satellite VALUES ('SAT3', NULL, true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('STAR1', NULL, 'CA', 876.34, true, false, 1, 1);
INSERT INTO public.star VALUES ('STAR2', NULL, 'CB', 432.56, false, true, 2, 2);
INSERT INTO public.star VALUES ('STAR3', NULL, 'CC', 653.11, true, true, 3, 3);
INSERT INTO public.star VALUES ('STAR4', NULL, 'CD', NULL, true, false, 4, 4);
INSERT INTO public.star VALUES ('STAR5', NULL, 'CE', NULL, false, false, 5, 5);
INSERT INTO public.star VALUES ('STAR6', NULL, 'CF', NULL, true, true, 6, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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
-- Name: star galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

