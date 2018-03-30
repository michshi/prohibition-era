--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.4
-- Dumped by pg_dump version 9.6.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cocktails; Type: TABLE; Schema: public; Owner: alicia
--

CREATE TABLE cocktails (
    id integer NOT NULL,
    name character varying(255),
    instructions text,
    garnish character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    glass_id integer
);


ALTER TABLE cocktails OWNER TO alicia;

--
-- Name: cocktails_id_seq; Type: SEQUENCE; Schema: public; Owner: alicia
--

CREATE SEQUENCE cocktails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cocktails_id_seq OWNER TO alicia;

--
-- Name: cocktails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alicia
--

ALTER SEQUENCE cocktails_id_seq OWNED BY cocktails.id;


--
-- Name: cocktails_ingredients; Type: TABLE; Schema: public; Owner: alicia
--

CREATE TABLE cocktails_ingredients (
    cocktail_id integer,
    ingredient_id integer
);


ALTER TABLE cocktails_ingredients OWNER TO alicia;

--
-- Name: glasses; Type: TABLE; Schema: public; Owner: alicia
--

CREATE TABLE glasses (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE glasses OWNER TO alicia;

--
-- Name: glasses_id_seq; Type: SEQUENCE; Schema: public; Owner: alicia
--

CREATE SEQUENCE glasses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE glasses_id_seq OWNER TO alicia;

--
-- Name: glasses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alicia
--

ALTER SEQUENCE glasses_id_seq OWNED BY glasses.id;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: alicia
--

CREATE TABLE ingredients (
    id integer NOT NULL,
    name character varying(255),
    amount real DEFAULT '0'::real,
    unit character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE ingredients OWNER TO alicia;

--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: alicia
--

CREATE SEQUENCE ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ingredients_id_seq OWNER TO alicia;

--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alicia
--

ALTER SEQUENCE ingredients_id_seq OWNED BY ingredients.id;


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: alicia
--

CREATE TABLE knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE knex_migrations OWNER TO alicia;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: alicia
--

CREATE SEQUENCE knex_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE knex_migrations_id_seq OWNER TO alicia;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alicia
--

ALTER SEQUENCE knex_migrations_id_seq OWNED BY knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: alicia
--

CREATE TABLE knex_migrations_lock (
    is_locked integer
);


ALTER TABLE knex_migrations_lock OWNER TO alicia;

--
-- Name: cocktails id; Type: DEFAULT; Schema: public; Owner: alicia
--

ALTER TABLE ONLY cocktails ALTER COLUMN id SET DEFAULT nextval('cocktails_id_seq'::regclass);


--
-- Name: glasses id; Type: DEFAULT; Schema: public; Owner: alicia
--

ALTER TABLE ONLY glasses ALTER COLUMN id SET DEFAULT nextval('glasses_id_seq'::regclass);


--
-- Name: ingredients id; Type: DEFAULT; Schema: public; Owner: alicia
--

ALTER TABLE ONLY ingredients ALTER COLUMN id SET DEFAULT nextval('ingredients_id_seq'::regclass);


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: alicia
--

ALTER TABLE ONLY knex_migrations ALTER COLUMN id SET DEFAULT nextval('knex_migrations_id_seq'::regclass);


--
-- Data for Name: cocktails; Type: TABLE DATA; Schema: public; Owner: alicia
--

COPY cocktails (id, name, instructions, garnish, created_at, updated_at, glass_id) FROM stdin;
1	Pisco Sour	Shake and strain into a chilled champagne flute. Dash some Angostura bitters on top.	lime slice	2018-03-29 18:52:37.592523-06	2018-03-29 18:52:37.592523-06	3
3	Old Fashioned	Stir the bourbon, simple syrup, and bitters in a mixing glass with ice. Strain into a rocks glass with one large ice cube. Garnish with an orange peel	orange peel	2018-03-29 18:52:37.592931-06	2018-03-29 18:52:37.592931-06	1
2	Manhattan	Stir all the ingredients in a mixing glass with ice, then strain into a coupe. Drop in a cherry, if desired.	cherry	2018-03-29 18:52:37.592753-06	2018-03-29 18:52:37.592753-06	2
\.


--
-- Name: cocktails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alicia
--

SELECT pg_catalog.setval('cocktails_id_seq', 3, true);


--
-- Data for Name: cocktails_ingredients; Type: TABLE DATA; Schema: public; Owner: alicia
--

COPY cocktails_ingredients (cocktail_id, ingredient_id) FROM stdin;
3	2
2	7
3	3
3	1
3	4
1	8
1	9
1	10
1	11
2	5
2	6
\.


--
-- Data for Name: glasses; Type: TABLE DATA; Schema: public; Owner: alicia
--

COPY glasses (id, name, created_at, updated_at) FROM stdin;
1	rocks	2018-03-29 18:52:37.587057-06	2018-03-29 18:52:37.587057-06
2	coupe	2018-03-29 18:52:37.587385-06	2018-03-29 18:52:37.587385-06
3	champagne flute	2018-03-29 18:52:37.588939-06	2018-03-29 18:52:37.588939-06
\.


--
-- Name: glasses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alicia
--

SELECT pg_catalog.setval('glasses_id_seq', 3, true);


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: alicia
--

COPY ingredients (id, name, amount, unit, created_at, updated_at) FROM stdin;
1	bourbon	2	ounce	2018-03-29 18:52:37.598141-06	2018-03-29 18:52:37.598141-06
2	simple syrup	0.25	ounce	2018-03-29 18:52:37.598558-06	2018-03-29 18:52:37.598558-06
3	angostura bitters	1	dash	2018-03-29 18:52:37.598792-06	2018-03-29 18:52:37.598792-06
4	orange bitters	1	dash	2018-03-29 18:52:37.601609-06	2018-03-29 18:52:37.601609-06
5	rye whiskey	2.5	ounce	2018-03-29 18:52:37.602129-06	2018-03-29 18:52:37.602129-06
6	sweet vermouth	0.75	ounce	2018-03-29 18:52:37.60266-06	2018-03-29 18:52:37.60266-06
7	angostura bitters	2	dash	2018-03-29 18:52:37.604114-06	2018-03-29 18:52:37.604114-06
8	pisco	1.5	ounce	2018-03-29 18:52:37.6044-06	2018-03-29 18:52:37.6044-06
9	fresh lemon juice	1	ounce	2018-03-29 18:52:37.605701-06	2018-03-29 18:52:37.605701-06
10	simple syrup	0.660000026	ounce	2018-03-29 18:52:37.605893-06	2018-03-29 18:52:37.605893-06
11	raw egg white	1		2018-03-29 18:52:37.606072-06	2018-03-29 18:52:37.606072-06
\.


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alicia
--

SELECT pg_catalog.setval('ingredients_id_seq', 11, true);


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: alicia
--

COPY knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20160913222934_createCocktailsTable.js	1	2018-03-29 18:46:24.874-06
2	20160913222957_createIngredientsTable.js	1	2018-03-29 18:46:24.881-06
3	20160913223030_createCocktailsIngredientsJoinTable.js	1	2018-03-29 18:46:24.89-06
4	20160913223131_createGlassesTable.js	1	2018-03-29 18:46:24.895-06
5	20160913224125_addGlassesColumnToCocktailsTable.js	1	2018-03-29 18:46:24.9-06
\.


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alicia
--

SELECT pg_catalog.setval('knex_migrations_id_seq', 5, true);


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: alicia
--

COPY knex_migrations_lock (is_locked) FROM stdin;
0
\.


--
-- Name: cocktails cocktails_pkey; Type: CONSTRAINT; Schema: public; Owner: alicia
--

ALTER TABLE ONLY cocktails
    ADD CONSTRAINT cocktails_pkey PRIMARY KEY (id);


--
-- Name: glasses glasses_pkey; Type: CONSTRAINT; Schema: public; Owner: alicia
--

ALTER TABLE ONLY glasses
    ADD CONSTRAINT glasses_pkey PRIMARY KEY (id);


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: alicia
--

ALTER TABLE ONLY ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: alicia
--

ALTER TABLE ONLY knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: cocktails cocktails_glass_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: alicia
--

ALTER TABLE ONLY cocktails
    ADD CONSTRAINT cocktails_glass_id_foreign FOREIGN KEY (glass_id) REFERENCES glasses(id);


--
-- Name: cocktails_ingredients cocktails_ingredients_cocktail_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: alicia
--

ALTER TABLE ONLY cocktails_ingredients
    ADD CONSTRAINT cocktails_ingredients_cocktail_id_foreign FOREIGN KEY (cocktail_id) REFERENCES cocktails(id);


--
-- Name: cocktails_ingredients cocktails_ingredients_ingredient_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: alicia
--

ALTER TABLE ONLY cocktails_ingredients
    ADD CONSTRAINT cocktails_ingredients_ingredient_id_foreign FOREIGN KEY (ingredient_id) REFERENCES ingredients(id);


--
-- PostgreSQL database dump complete
--

