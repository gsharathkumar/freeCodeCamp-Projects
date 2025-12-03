--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    galaxy_types character varying(20),
    description character varying(100),
    distance_from_earth numeric(10,7) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL
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
    has_life boolean,
    is_spherical boolean,
    distance_from_earth integer NOT NULL,
    description character varying(100),
    planet_id integer NOT NULL,
    age_in_millions_of_years integer
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
-- Name: orbit; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.orbit (
    orbit_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    orbit_duration_earth_years integer
);


ALTER TABLE public.orbit OWNER TO freecodecamp;

--
-- Name: orbit_orbit_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.orbit_orbit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orbit_orbit_id_seq OWNER TO freecodecamp;

--
-- Name: orbit_orbit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.orbit_orbit_id_seq OWNED BY public.orbit.orbit_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
    has_life boolean,
    planet_types character varying(20) NOT NULL,
    star_id integer NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_is_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_is_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_is_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_is_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_is_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(100),
    distance_from_earth numeric(10,7),
    is_spherical boolean,
    has_life boolean,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL
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
-- Name: orbit orbit_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbit ALTER COLUMN orbit_id SET DEFAULT nextval('public.orbit_orbit_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_is_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our home galaxy, containing the solar system', 0.0000000, true, true, 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'The largest sprial galaxy in the Local group', 2.5370000, true, true, 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'A member of teh local group, known for its star-formaing regions', 2.7300000, true, true, 3000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 'A classic sprial galaxy, famous for its interactions with NGC 5195', 23.0000000, false, true, 200);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Irregular', 'Known for its bright nucleus and large dust lanes', 163.0000000, false, false, 10000);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 'An irregular galaxy and a satellite of the Milky Way', 29.0000000, true, false, 200);
INSERT INTO public.galaxy VALUES (7, 'Small Magellanic Cloud', 'Irregular', 'Another irregular galaxy and a satellite of the Milky Way.', 29.0000000, true, false, 200);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, true, 238855, 'Our planets only natural satellite.', 1, 4500);
INSERT INTO public.moon VALUES (2, 'lo', false, true, 390400, 'A volcanic moon with active sulfur eruption.', 4, 4500);
INSERT INTO public.moon VALUES (3, 'Europa', false, true, 390400, 'An icy moon in the solar system, with its own magnetic field.', 4, 4500);
INSERT INTO public.moon VALUES (4, 'Ganymede', false, true, 390400, 'The largest moon in the solar system, with its own magnetic field.', 4, 4500);
INSERT INTO public.moon VALUES (5, 'Callisto', false, true, 519000, 'A heavily cratered moon, possibly with a subsurface ocean.', 4, 4500);
INSERT INTO public.moon VALUES (6, 'Titan', false, true, 759000, 'Saturns largest moon, with a thick atmosphere and liquid methane lakes.', 5, 4500);
INSERT INTO public.moon VALUES (7, 'Enceladus', false, true, 864000, 'A small moon known for its geysers and subsuface ocean.', 5, 4500);
INSERT INTO public.moon VALUES (8, 'Rhea', false, true, 1045000, 'Saturns second largest moon with a thin atmosphere.', 5, 4500);
INSERT INTO public.moon VALUES (9, 'lapetus', false, true, 1223000, 'A moon with a distincitive two-tone coloration.', 5, 4500);
INSERT INTO public.moon VALUES (10, 'Triton', false, true, 270000000, 'Neptunes largest moon, caputred and geologically active.', 6, 4500);
INSERT INTO public.moon VALUES (11, 'Proteus', false, true, 280000000, 'A small irregularly shaped moon of Neptune.', 6, 4500);
INSERT INTO public.moon VALUES (12, 'Charon', false, true, 428000000, 'Plutos largest moon, considered a binary systeme.', 6, 4500);
INSERT INTO public.moon VALUES (13, 'Phobos', false, true, 1400000, 'A small irregular Martin moon, gradullay spiraling inward.', 2, 4400);
INSERT INTO public.moon VALUES (14, 'Deimos', false, true, 1460000, 'The smaller Martian moon, smoother surface than Phobos.', 2, 4400);
INSERT INTO public.moon VALUES (15, 'Miranda', false, true, 1100000, 'An irregularly shaped moon with a diverse landscape.', 7, 4500);
INSERT INTO public.moon VALUES (16, 'Ariel', false, true, 1100000, 'A moon with valleys and crates, indicating geological activity.', 7, 4500);
INSERT INTO public.moon VALUES (17, 'Umbriel', false, true, 1100000, 'Darker moon of Uranus with a heavily cratered surface.', 7, 4500);
INSERT INTO public.moon VALUES (18, 'Titania', false, true, 1100000, 'The largest moon of Uranus, with a mix of cliffs and canyons', 7, 4500);
INSERT INTO public.moon VALUES (19, 'Oberon', false, true, 1100000, 'Uranus second largest moon, with a heavily cratered surface.', 7, 4500);
INSERT INTO public.moon VALUES (20, 'Dione', false, true, 1100000, 'One of Saturns moons with a mixed surface of ice and rock.', 5, 4500);


--
-- Data for Name: orbit; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.orbit VALUES (1, 'Earth Orbit', 1, 1);
INSERT INTO public.orbit VALUES (2, 'Mars Orbit', 2, -1);
INSERT INTO public.orbit VALUES (3, 'Venus Orbit', 3, -1186);
INSERT INTO public.orbit VALUES (4, 'Jupiter Orbit', 4, -615);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The only known plant to support life.', true, true, 'Terrestrial', 1, 4600, 0);
INSERT INTO public.planet VALUES (2, 'Mars', 'known as the Red plant has signs of past water.', true, false, 'Terrestrial', 1, 4600, 21);
INSERT INTO public.planet VALUES (3, 'Venus', 'Similar in size to Earth but thick toxic atmosphere.', true, false, 'Terrestrial', 1, 4600, 12);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'The kargest planet in the solar system, agas giant.', true, false, 'Gas Giant', 1, 4600, 54);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Known for its stunning ring system.', true, false, 'Gas Giant', 1, 4600, 87);
INSERT INTO public.planet VALUES (6, 'Neptune', 'An ice giant with strong winds and storms.', true, false, 'Ice Giant', 1, 4600, 215);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant with a unique tilt, resulting in extreme seasons.', true, false, 'Ice Giant', 1, 4600, 212);
INSERT INTO public.planet VALUES (9, 'Betelgeuse b', 'A massive exoplanet that may have extreme conditions due to its host star.', true, false, 'Gas Giant', 3, 0, 424);
INSERT INTO public.planet VALUES (10, 'Sirius Ab', 'A highly debated exoplanet that might orbit Sirius A; conditions are largely unknown.', true, false, 'Gas Giant', 4, 0, 86);
INSERT INTO public.planet VALUES (11, 'Vega b', 'Known as an exoplanet with conditions potentially favorable for certain forms of life.', true, false, 'Gas Giant', 6, 455, 25);
INSERT INTO public.planet VALUES (12, 'Antares b', 'A hypothetical gas giant that may exist around Antares, characterised by the extreme temperatures and strong wind.', true, false, 'Gas Giant', 7, 0, 550);
INSERT INTO public.planet VALUES (8, 'Proxima Centauri b', 'An exoplanet in the habitable zone of Proxima Centauri.', true, false, 'Terrestrial', 2, 4850, 424);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The central star of our Solar System, providing light and heat', 0.0000000, true, true, 1, 4600);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'The closest known star to the Sun, part of the Alpha Centauri system', 4.2400000, true, true, 1, 4850);
INSERT INTO public.star VALUES (3, 'Betalgeuse', 'A red supergiant star in the Orion constellation, nearing the end of its life', 642.0000000, true, false, 1, 10);
INSERT INTO public.star VALUES (4, 'Sirius A', 'The brightest star in the night sky, part of the Sirius binary system', 8.6000000, true, false, 1, 200);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'A member of the Alpha Centauri system, a slightly larger and brighter star than the Sun', 4.3700000, true, true, 1, 5000);
INSERT INTO public.star VALUES (6, 'Vega', 'A bright star in the Lyra constellation, known for being part of the Summer Triangle', 25.0000000, true, true, 1, 455);
INSERT INTO public.star VALUES (7, 'Antares', 'A red supergiant star in the Scorpius constellation, often referred to as the heart of the scorpion', 550.0000000, true, false, 1, 12);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: orbit_orbit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.orbit_orbit_id_seq', 4, true);


--
-- Name: planet_planet_is_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_is_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: orbit orbit_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbit
    ADD CONSTRAINT orbit_name_key UNIQUE (name);


--
-- Name: orbit orbit_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbit
    ADD CONSTRAINT orbit_pkey PRIMARY KEY (orbit_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


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
-- Name: orbit orbit_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbit
    ADD CONSTRAINT orbit_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

