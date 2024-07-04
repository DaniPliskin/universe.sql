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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    composition text,
    diameter numeric(8,2) NOT NULL,
    orbit_type text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type text,
    size numeric(10,2),
    active boolean NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    type text,
    diameter numeric(8,2) NOT NULL,
    orbit_days integer,
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
    name character varying(100) NOT NULL,
    type text,
    distance numeric(10,2) NOT NULL,
    habitable boolean NOT NULL,
    star_id integer,
    moon_id integer
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
    name character varying(100) NOT NULL,
    type text,
    age integer,
    mass numeric(8,2) NOT NULL,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Carbonaceous', 939.40, 'Main Belt');
INSERT INTO public.asteroid VALUES (2, 'Pallas', 'Silicaceous', 512.00, 'Main Belt');
INSERT INTO public.asteroid VALUES (3, 'Vesta', 'Silicaceous', 525.40, 'Main Belt');
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 'Carbonaceous', 431.00, 'Main Belt');
INSERT INTO public.asteroid VALUES (5, 'Eunomia', 'Silicaceous', 268.00, 'Main Belt');
INSERT INTO public.asteroid VALUES (6, 'Juno', 'Silicaceous', 233.00, 'Main Belt');
INSERT INTO public.asteroid VALUES (7, 'Psyche', 'Metallic', 226.00, 'Main Belt');
INSERT INTO public.asteroid VALUES (8, 'Davida', 'Carbonaceous', 326.00, 'Main Belt');
INSERT INTO public.asteroid VALUES (9, 'Interamnia', 'Carbonaceous', 306.00, 'Main Belt');
INSERT INTO public.asteroid VALUES (10, 'Euphrosyne', 'Carbonaceous', 255.00, 'Main Belt');
INSERT INTO public.asteroid VALUES (11, 'Hektor', 'Carbonaceous', 370.00, 'Jupiter Trojan');
INSERT INTO public.asteroid VALUES (12, 'Patroclus', 'Carbonaceous', 140.00, 'Jupiter Trojan');
INSERT INTO public.asteroid VALUES (13, 'Eurybates', 'Carbonaceous', 64.00, 'Jupiter Trojan');
INSERT INTO public.asteroid VALUES (14, 'Bennu', 'Carbonaceous', 0.49, 'Near-Earth');
INSERT INTO public.asteroid VALUES (15, 'Gaspra', 'Silicaceous', 18.00, 'Main Belt');
INSERT INTO public.asteroid VALUES (16, 'Ida', 'Silicaceous', 31.40, 'Main Belt');
INSERT INTO public.asteroid VALUES (17, 'Eros', 'Silicaceous', 16.80, 'Near-Earth');
INSERT INTO public.asteroid VALUES (18, 'Itokawa', 'Silicaceous', 0.33, 'Near-Earth');
INSERT INTO public.asteroid VALUES (19, 'Toutatis', 'Silicaceous', 4.50, 'Near-Earth');
INSERT INTO public.asteroid VALUES (20, 'Apophis', 'Silicaceous', 0.37, 'Near-Earth');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000.00, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 110000.00, true, 'Closest large galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Spiral', 50000.00, true, 'A bright galaxy with a distinctive shape');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 60000.00, true, 'A galaxy interacting with a smaller galaxy');
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Spiral', 30000.00, true, 'Third-largest member of the Local Group');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring', 150000.00, false, 'A galaxy with a distinctive ring shape');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Phobos', 'Terrestrial', 22.40, 0, NULL);
INSERT INTO public.moon VALUES (1, 'Luna', 'Terrestrial', 3474.20, 27, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Terrestrial', 12.40, 1, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanic', 3642.60, 2, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy', 3121.60, 4, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Icy', 5268.20, 7, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Icy', 4820.60, 17, NULL);
INSERT INTO public.moon VALUES (8, 'Titan', 'Icy', 5150.00, 16, NULL);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Icy', 1528.40, 5, NULL);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'Icy', 1469.00, 79, NULL);
INSERT INTO public.moon VALUES (11, 'Dione', 'Icy', 1122.60, 3, NULL);
INSERT INTO public.moon VALUES (12, 'Tethys', 'Icy', 1062.00, 2, NULL);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'Icy', 504.20, 1, NULL);
INSERT INTO public.moon VALUES (14, 'Mimas', 'Icy', 396.60, 1, NULL);
INSERT INTO public.moon VALUES (15, 'Oberon', 'Icy', 1522.80, 13, NULL);
INSERT INTO public.moon VALUES (16, 'Titania', 'Icy', 1577.80, 9, NULL);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Icy', 1169.40, 4, NULL);
INSERT INTO public.moon VALUES (18, 'Ariel', 'Icy', 1158.80, 3, NULL);
INSERT INTO public.moon VALUES (19, 'Triton', 'Icy', 2706.80, 6, NULL);
INSERT INTO public.moon VALUES (20, 'Nereid', 'Icy', 340.00, 360, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (21, 'Mercury', 'Terrestrial', 0.39, false, 1, 1);
INSERT INTO public.planet VALUES (22, 'Venus', 'Terrestrial', 0.72, false, 1, 2);
INSERT INTO public.planet VALUES (23, 'Earth', 'Terrestrial', 1.00, true, 1, 3);
INSERT INTO public.planet VALUES (24, 'Mars', 'Terrestrial', 1.52, false, 1, 4);
INSERT INTO public.planet VALUES (25, 'Jupiter', 'Gas giant', 5.20, false, 1, 5);
INSERT INTO public.planet VALUES (26, 'Saturn', 'Gas giant', 9.58, false, 1, 6);
INSERT INTO public.planet VALUES (27, 'Uranus', 'Ice giant', 19.22, false, 1, 7);
INSERT INTO public.planet VALUES (28, 'Neptune', 'Ice giant', 30.05, false, 1, 8);
INSERT INTO public.planet VALUES (29, 'Alpha Centauri Bb', 'Terrestrial', 0.04, false, 2, 9);
INSERT INTO public.planet VALUES (30, 'Alpha Centauri Bc', 'Gas giant', 0.60, false, 3, 10);
INSERT INTO public.planet VALUES (31, 'Kepler-452b', 'Super-Earth', 1.05, true, 4, 11);
INSERT INTO public.planet VALUES (32, 'Proxima Centauri b', 'Terrestrial', 0.05, false, 8, 12);
INSERT INTO public.planet VALUES (33, 'Tau Ceti e', 'Terrestrial', 0.55, false, 5, 13);
INSERT INTO public.planet VALUES (34, 'Tau Ceti f', 'Terrestrial', 1.35, false, 5, 14);
INSERT INTO public.planet VALUES (35, 'Wolf 1061c', 'Super-Earth', 0.10, false, 6, 15);
INSERT INTO public.planet VALUES (36, 'Gliese 581g', 'Super-Earth', 0.15, false, 6, 16);
INSERT INTO public.planet VALUES (37, 'HD 40307 g', 'Super-Earth', 0.60, true, 7, 17);
INSERT INTO public.planet VALUES (38, 'Kepler-22b', 'Super-Earth', 0.85, true, 7, 18);
INSERT INTO public.planet VALUES (39, 'Gliese 667 Cc', 'Super-Earth', 0.12, true, 9, 19);
INSERT INTO public.planet VALUES (40, 'Gliese 832 c', 'Super-Earth', 0.16, false, 10, 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type main-sequence', 5, 1.00, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'G-type main-sequence', 4, 1.10, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 'K-type main-sequence', 4, 0.90, 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant', 8, 20.00, 3);
INSERT INTO public.star VALUES (5, 'Sirius A', 'A-type main-sequence', 0, 2.10, 4);
INSERT INTO public.star VALUES (6, 'Sirius B', 'White dwarf', 0, 0.98, 4);
INSERT INTO public.star VALUES (7, 'Vega', 'A-type main-sequence', 0, 2.10, 5);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 'M-type main-sequence', 5, 0.12, 6);
INSERT INTO public.star VALUES (9, 'Rigel', 'Blue supergiant', 8, 21.00, 3);
INSERT INTO public.star VALUES (10, 'Polaris', 'F-type main-sequence', 0, 1.26, 1);
INSERT INTO public.star VALUES (11, 'Aldebaran', 'K-type giant', 7, 1.16, 2);
INSERT INTO public.star VALUES (12, 'Spica', 'B-type main-sequence', 0, 10.25, 4);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 20, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 40, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: asteroid asteroid_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_unique UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: planet galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


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
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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

