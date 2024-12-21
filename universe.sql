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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years integer,
    mass numeric(12,3),
    description text,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(100) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    distance integer,
    diameter integer,
    distance_from_next_galaxy numeric(12,4),
    composition text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years integer,
    mass numeric(12,3),
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years integer,
    mass numeric(12,3),
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years integer,
    mass numeric(12,3),
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 12, 15, 78.700, 'Our house', true, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 3, 10000, 150.200, 'The closest spiral galaxy to the Milky Way, known for its size and potential future collision with our galaxy.', true, true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 29, 13000, 200.500, 'A spiral galaxy named for its resemblance to a sombrero hat, located in the constellation Virgo.', false, true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 3, 12000, 50.100, 'A smaller spiral galaxy located 3 million light-years from Earth, part of the Local Group of galaxies, and a companion of Andromeda.', true, true);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 54, 13000, 2000.000, 'A giant elliptical galaxy located in the Virgo Cluster, known for hosting a supermassive black hole at its center.', false, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 23, 10000, 50.000, 'A stunning spiral galaxy located in the constellation Canes Venatici, famous for its well-defined spiral arms and interaction with the neighboring galaxy NGC 5195.', true, true);
INSERT INTO public.galaxy VALUES (7, 'Black Eye Galaxy', 17, 12000, 60.500, 'An edge-on spiral galaxy with a prominent dark band of dust across its center, located 17 million light-years from Earth.', false, true);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 'hey have spiral-shaped arms extending from a bright central nucleus.', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 'They have an oval or spherical shape and lack defined structures like arms.', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', 'They do not have a defined shape.', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy_types VALUES (4, 'Lenticular', 'These galaxies have a disk-like shape but lack the spiral arms that characterize spiral galaxies.', NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384400, 4600, 0.073, 'Earth only natural satellite, the fifth-largest moon in the Solar System.', false, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 6000, 4500, 0.010, 'One of Mars two moons, the closest moon to its planet.', false, true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 23460, 4500, 0.002, 'The smaller of Mars two moons, orbiting at a greater distance than Phobos.', false, true, 4);
INSERT INTO public.moon VALUES (4, 'Io', 421700, 4600, 0.225, 'One of Jupiters moons, known for its extreme volcanic activity and numerous active volcanoes.', false, true, 21);
INSERT INTO public.moon VALUES (5, 'Europa', 670900, 4600, 0.313, 'A moon of Jupiter, believed to have a subsurface ocean beneath its icy surface.', false, true, 21);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1070400, 4600, 0.148, 'The largest moon in the Solar System, orbiting Jupiter and having its own magnetic field.', false, true, 21);
INSERT INTO public.moon VALUES (7, 'Titan', 1221900, 4600, 1.345, 'Saturns largest moon, known for its dense atmosphere and liquid methane lakes.', false, true, 22);
INSERT INTO public.moon VALUES (8, 'Rhea', 527040, 4600, 0.023, 'A large moon of Saturn, characterized by a heavily cratered surface and a thin atmosphere.', false, true, 22);
INSERT INTO public.moon VALUES (9, 'Triton', 3564000, 4600, 0.021, 'Neptunes largest moon, known for its retrograde orbit and geysers spewing nitrogen ice.', false, true, 24);
INSERT INTO public.moon VALUES (10, 'Charon', 595000, 4600, 0.012, 'The largest moon of Pluto, known for its large size relative to its planet and a shared center of gravity with Pluto.', false, true, 25);
INSERT INTO public.moon VALUES (11, 'Mimas', 1850000, 4600, 0.004, 'A small moon of Saturn, known for the large impact crater called Herschel, making it resemble the Death Star.', false, true, 22);
INSERT INTO public.moon VALUES (12, 'Enceladus', 2380000, 4600, 0.004, 'A moon of Saturn with geysers of water ice erupting from its southern pole, suggesting subsurface oceans.', true, true, 22);
INSERT INTO public.moon VALUES (14, 'Umbriel', 2650000, 4600, 0.010, 'A dark, heavily cratered moon of Uranus, characterized by its low albedo and icy surface.', false, true, 23);
INSERT INTO public.moon VALUES (16, 'Tethys', 2940000, 4600, 0.008, 'A moon of Saturn, noted for its large impact crater Odysseus and its relatively low density.', false, true, 22);
INSERT INTO public.moon VALUES (17, 'Iapetus', 3560000, 4600, 0.023, 'A moon of Saturn with a striking two-tone coloration, with one hemisphere dark and the other bright.', false, true, 22);
INSERT INTO public.moon VALUES (19, 'Pandora', 1412000, 4600, 0.009, 'A moon of Saturn, known for its ring system and being one of the inner moons of the planet.', false, true, 22);
INSERT INTO public.moon VALUES (20, 'Phoebe', 13000000, 4600, 0.018, 'A retrograde irregular moon of Saturn, with a highly elliptical orbit and dark surface.', false, true, 22);
INSERT INTO public.moon VALUES (21, 'Ariel', 1910000, 4600, 0.022, 'A bright moon of Uranus, with a surface full of canyons and valleys, thought to be geologically active in the past.', false, true, 23);
INSERT INTO public.moon VALUES (22, 'Janus', 1514000, 4600, 0.004, 'A small moon of Saturn, known for its co-orbital relationship with Epimetheus.', false, true, 22);
INSERT INTO public.moon VALUES (23, 'Epimetheus', 1514000, 4600, 0.005, 'A small moon of Saturn, co-orbiting with Janus and known for its unique gravitational interactions.', false, true, 22);
INSERT INTO public.moon VALUES (24, 'Atlas', 1370000, 4600, 0.001, 'A small moon of Saturn, known for its ring-like features and location within Saturn’s rings.', false, true, 22);
INSERT INTO public.moon VALUES (25, 'Titania', 4350000, 4600, 0.035, 'The largest moon of Uranus, with a geologically diverse surface including canyons and a thick ice crust.', false, true, 23);
INSERT INTO public.moon VALUES (26, 'Oberon', 5830000, 4600, 0.030, 'A large moon of Uranus, characterized by its heavily cratered surface and frozen surface ice.', false, true, 23);
INSERT INTO public.moon VALUES (13, 'Carontitira', 1290000, 4600, 0.007, 'A moon of Uranus, known for its extreme topography, with cliffs and valleys that make it appear heavily shattered.', false, true, 23);
INSERT INTO public.moon VALUES (18, 'Hetesfoscles', 2380000, 4600, 0.014, 'A moon of Saturn with active water geysers, suggesting subsurface oceans and potential for life.', true, true, 22);
INSERT INTO public.moon VALUES (27, 'Tazaios', 1290000, 4600, 0.007, 'A moon of Uranus, known for its extreme topography, with cliffs and valleys that make it appear heavily shattered.', false, true, 23);
INSERT INTO public.moon VALUES (15, 'Demontenes', 1910000, 4600, 0.022, 'A bright moon of Uranus, with a surface full of canyons and valleys, thought to be geologically active in the past.', false, true, 23);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 92000000, 4500, 0.330, 'The smallest planet, closest to the Sun, with extreme temperature variations.', false, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 41000000, 4600, 4.870, 'Earth’s “sister” planet, with a thick atmosphere and extreme heat.', false, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 0, 4600, 5.970, 'The only known planet to support life, with a diverse ecosystem.', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 56000000, 4500, 0.642, 'The Red Planet, with signs of ancient water and potential for future exploration.', false, true, 1);
INSERT INTO public.planet VALUES (21, 'Jupiter', 77800, 4600, 1898.000, 'The largest planet in the Solar System, with a giant storm known as the Great Red Spot.', false, true, 1);
INSERT INTO public.planet VALUES (22, 'Saturn', 1430, 4600, 568.000, 'Known for its stunning rings made of ice and rock particles.', false, true, 1);
INSERT INTO public.planet VALUES (23, 'Uranus', 28700, 4600, 86.810, 'A gas giant with a tilted axis, rotating on its side.', false, true, 1);
INSERT INTO public.planet VALUES (24, 'Neptune', 4500, 4600, 102.000, 'The farthest planet from the Sun, known for its deep blue color.', false, true, 1);
INSERT INTO public.planet VALUES (25, 'Pluto', 59000, 4600, 0.014, 'Once considered the ninth planet, now classified as a dwarf planet.', false, true, 1);
INSERT INTO public.planet VALUES (26, 'Kepler-452b', 140000, 1000, 5.000, 'A potentially habitable exoplanet located in the habitable zone of its star.', true, true, 2);
INSERT INTO public.planet VALUES (27, 'Kepler-22b', 60000, 1000, 4.700, 'An exoplanet in the habitable zone with Earth-like characteristics.', false, true, 2);
INSERT INTO public.planet VALUES (28, 'Proxima b', 42000, 4600, 1.270, 'A potentially habitable exoplanet orbiting Proxima Centauri.', true, true, 3);
INSERT INTO public.planet VALUES (29, 'Kepler-186f', 500000, 1200, 1.120, 'An exoplanet in the habitable zone of its star, potentially capable of supporting life.', true, true, 2);
INSERT INTO public.planet VALUES (30, 'TRAPPIST-1d', 400000, 1000, 0.500, 'An exoplanet orbiting the TRAPPIST-1 system, part of a system of seven Earth-sized planets.', false, true, 2);
INSERT INTO public.planet VALUES (31, 'LHS 1140 b', 390000, 700, 1.600, 'A rocky exoplanet in the habitable zone of its star, a possible candidate for study in the search for life.', true, true, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0, 4500, 1.989, 'The star at the center of our solar system, providing heat and light to the Earth.', true, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 9, 230, 4.368, 'The brightest star in Earth night sky, located in the constellation Canis Major.', false, true, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 643, 100, 20.000, 'A red supergiant star in the constellation Orion, known for its large size and brightness.', false, true, 3);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 4, 5000, 1.100, 'The closest star system to the Earth, part of the Alpha Centauri system.', false, true, 1);
INSERT INTO public.star VALUES (5, 'Polaris', 433, 12000, 5.400, 'The North Star, located almost directly above the Earth northern pole.', false, true, 4);
INSERT INTO public.star VALUES (6, 'Rigel', 860, 800, 21.000, 'A blue supergiant star in the constellation Orion, one of the brightest stars in the sky.', false, true, 3);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 4, 4500, 0.120, 'The closest known star to the Sun, located in the Alpha Centauri system.', true, false, 1);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_id_seq', 1, false);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 27, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 31, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_id PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id PRIMARY KEY (moon_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id PRIMARY KEY (planet_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id PRIMARY KEY (star_id);


--
-- Name: galaxy_types unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy unique_name_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name_galaxy UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: star unique_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name_star UNIQUE (name);


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

