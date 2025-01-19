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
-- Name: classification_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.classification_type (
    classification_type_id integer NOT NULL,
    classification_for character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.classification_type OWNER TO freecodecamp;

--
-- Name: classification_type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.classification_type_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classification_type_type_id_seq OWNER TO freecodecamp;

--
-- Name: classification_type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.classification_type_type_id_seq OWNED BY public.classification_type.classification_type_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_light_year integer,
    number_of_stars_billion integer,
    apparent_magnitude numeric(5,2),
    classification_type_id integer
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
    name character varying(50) NOT NULL,
    has_life boolean,
    planet_id integer,
    diameter_km integer
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
    name character varying(50) NOT NULL,
    has_life boolean,
    description text,
    star_id integer,
    classification_type_id integer
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
    name character varying(50) NOT NULL,
    distance_from_earth integer,
    galaxy_id integer,
    classification_type_id integer
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
-- Name: classification_type classification_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.classification_type ALTER COLUMN classification_type_id SET DEFAULT nextval('public.classification_type_type_id_seq'::regclass);


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
-- Data for Name: classification_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.classification_type VALUES (1, 'galaxy', 'E0', NULL);
INSERT INTO public.classification_type VALUES (2, 'galaxy', 'E3', NULL);
INSERT INTO public.classification_type VALUES (3, 'galaxy', 'E7', NULL);
INSERT INTO public.classification_type VALUES (4, 'galaxy', 'Sa', NULL);
INSERT INTO public.classification_type VALUES (5, 'galaxy', 'Sb', NULL);
INSERT INTO public.classification_type VALUES (6, 'galaxy', 'Sc', NULL);
INSERT INTO public.classification_type VALUES (7, 'galaxy', 'SBa', NULL);
INSERT INTO public.classification_type VALUES (8, 'galaxy', 'SBb', NULL);
INSERT INTO public.classification_type VALUES (9, 'galaxy', 'SBc', NULL);
INSERT INTO public.classification_type VALUES (10, 'galaxy', 'Irregular', NULL);
INSERT INTO public.classification_type VALUES (11, 'star', 'Red Giant', NULL);
INSERT INTO public.classification_type VALUES (12, 'star', 'Red Supergiant', NULL);
INSERT INTO public.classification_type VALUES (13, 'star', 'Yellow Dwarf', NULL);
INSERT INTO public.classification_type VALUES (14, 'star', 'Red Dwarf', NULL);
INSERT INTO public.classification_type VALUES (15, 'star', 'Brown Dwarf', NULL);
INSERT INTO public.classification_type VALUES (16, 'star', 'Blue Giant', NULL);
INSERT INTO public.classification_type VALUES (17, 'star', 'White Dwarf', NULL);
INSERT INTO public.classification_type VALUES (18, 'planet', 'Terrestrial', NULL);
INSERT INTO public.classification_type VALUES (19, 'planet', 'Gas', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 400, NULL, 5);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 14000, 20, 0.13, 7);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 220000, 1000, 3.44, 4);
INSERT INTO public.galaxy VALUES (4, 'Messier 82', 37000, NULL, 8.41, 1);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 170000, 1000, 7.90, 7);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 50000, NULL, 8.00, 4);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Io', false, 5, 3643);
INSERT INTO public.moon VALUES (2, 'Europa', false, 5, 3121);
INSERT INTO public.moon VALUES (3, 'Ganymede', false, 5, 5268);
INSERT INTO public.moon VALUES (4, 'Callisto', false, 5, 4821);
INSERT INTO public.moon VALUES (5, 'Titan', false, 6, 5151);
INSERT INTO public.moon VALUES (6, 'Rhea', false, 6, 1527);
INSERT INTO public.moon VALUES (7, 'Enceladus', false, 6, 504);
INSERT INTO public.moon VALUES (8, 'Mimas', false, 6, 396);
INSERT INTO public.moon VALUES (9, 'Iapetus', false, 6, 1471);
INSERT INTO public.moon VALUES (10, 'Triton', false, 7, 2710);
INSERT INTO public.moon VALUES (11, 'Miranda', false, 7, 472);
INSERT INTO public.moon VALUES (12, 'Ariel', false, 7, 1159);
INSERT INTO public.moon VALUES (13, 'Umbriel', false, 7, 1169);
INSERT INTO public.moon VALUES (14, 'Titania', false, 7, 1579);
INSERT INTO public.moon VALUES (15, 'Oberon', false, 7, 1523);
INSERT INTO public.moon VALUES (16, 'Phoebe', false, 6, 213);
INSERT INTO public.moon VALUES (17, 'Charon', false, 8, 1212);
INSERT INTO public.moon VALUES (18, 'Ceres', false, 9, 25);
INSERT INTO public.moon VALUES (19, 'Deimos', false, 4, 12);
INSERT INTO public.moon VALUES (20, 'Phobos', false, 4, 22);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, NULL, 1, 18);
INSERT INTO public.planet VALUES (2, 'Venus', false, NULL, 1, 18);
INSERT INTO public.planet VALUES (3, 'Earth', true, NULL, 1, 18);
INSERT INTO public.planet VALUES (4, 'Mars', false, NULL, 1, 18);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, NULL, 1, 19);
INSERT INTO public.planet VALUES (6, 'Saturn', false, NULL, 1, 19);
INSERT INTO public.planet VALUES (7, 'Uranus', false, NULL, 1, 19);
INSERT INTO public.planet VALUES (8, 'Neptune', false, NULL, 1, 19);
INSERT INTO public.planet VALUES (9, 'Kepler-56b', false, NULL, 1, 19);
INSERT INTO public.planet VALUES (10, 'Kepler-56c', false, NULL, 1, 19);
INSERT INTO public.planet VALUES (11, 'HD 102272 b', false, NULL, 1, 19);
INSERT INTO public.planet VALUES (12, 'HD 102272 c', false, NULL, 1, 19);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1, 13);
INSERT INTO public.star VALUES (2, 'Antares', 550, 1, 12);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 643, 1, 13);
INSERT INTO public.star VALUES (4, 'KW Sagittarii', 7800, 1, 13);
INSERT INTO public.star VALUES (5, 'Alpheratz', 97, 2, 16);
INSERT INTO public.star VALUES (6, 'Mirach', 199, 2, 13);


--
-- Name: classification_type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.classification_type_type_id_seq', 19, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: classification_type classification_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.classification_type
    ADD CONSTRAINT classification_type_pkey PRIMARY KEY (classification_type_id);


--
-- Name: classification_type classification_type_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.classification_type
    ADD CONSTRAINT classification_type_type_key UNIQUE (name);


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
-- Name: galaxy galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_id_fkey FOREIGN KEY (classification_type_id) REFERENCES public.classification_type(classification_type_id);


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
-- Name: planet planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_type_id_fkey FOREIGN KEY (classification_type_id) REFERENCES public.classification_type(classification_type_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_type_id_fkey FOREIGN KEY (classification_type_id) REFERENCES public.classification_type(classification_type_id);


--
-- PostgreSQL database dump complete
--

