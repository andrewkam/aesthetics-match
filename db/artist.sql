--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: artist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artist (
    id integer NOT NULL,
    name text,
    genre text
);


ALTER TABLE public.artist OWNER TO postgres;

--
-- Name: artist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artist_id_seq OWNER TO postgres;

--
-- Name: artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artist_id_seq OWNED BY public.artist.id;


--
-- Name: artist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist ALTER COLUMN id SET DEFAULT nextval('public.artist_id_seq'::regclass);


--
-- Data for Name: artist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artist (id, name, genre) FROM stdin;
1	Cardi B	Hip-Hop
2	The Weeknd	Hip-Hop
3	XXXTENTACION	Hip-Hop
4	Migos	Hip-Hop
5	Rich The Kid	Hip-Hop
6	Post Malone	Hip-Hop
7	Lil Xan	Hip-Hop
8	Flatbush Zombies	Hip-Hop
9	Famous Dex	Hip-Hop
10	2 Chainz	Hip-Hop
11	Kendrick Lamar	Hip-Hop
12	Khalid	Hip-Hop
13	Lil Uzi Vert	Hip-Hop
14	Lil Skies	Hip-Hop
15	Bruno Mars	Hip-Hop
16	Kali Uchis	Hip-Hop
17	Drake	Hip-Hop
18	Lil Yachty	Hip-Hop
19	SZA	Hip-Hop
20	6ix9ine	Hip-Hop
21	BlocBoy JB	Hip-Hop
22	Lil Dicky	Hip-Hop
24	Rae Sremmurd	Hip-Hop
26	YoungBoy Never Broke Again	Hip-Hop
27	Ella Mai	Hip-Hop
28	Nicki Minaj	Hip-Hop
30	Queen Naija	Hip-Hop
31	Kane Brown	Country
32	Blackberry Smoke	Country
33	Kacey Musgraves	Country
34	Chris Stapleton	Country
35	Thomas Rhett	Country
36	Luke Combs	Country
37	Luke Bryan	Country
38	Brett Young	Country
39	Cole Swindell	Country
40	Jon Pardi	Country
41	Scotty McCreery	Country
42	Sam Hunt	Country
43	Florida Georgia Line	Country
44	Michael Ray	Country
45	Jordan Davis	Country
46	Zac Brown Band	Country
47	Blake Shelton	Country
48	Old Dominion	Country
49	Alan Jackson	Country
50	Keith Urban	Country
51	Bebe Rexha	Country
52	Jason Aldean	Country
53	Brett Eldredge	Country
55	Kenny Chesney	Country
56	Morgan Wallen	Country
57	Darius Rucker	Country
58	Dierks Bentley	Country
59	Chris Lane	Country
60	Carrie Underwood	Country
61	NMB48	J-Pop
62	Kenshi Yonezu	J-Pop
63	Bullet Train	J-Pop
64	Gen Hoshino	J-Pop
65	Keyakizaka46	J-Pop
66	Dempagumi. Inc	J-Pop
67	EXILE	J-Pop
68	Masaki Suda	J-Pop
69	Masaharu Fukuyama	J-Pop
70	ONE OK ROCK	J-Pop
71	Sakanaction	J-Pop
73	TWICE	J-Pop
74	Perfume	J-Pop
75	Nogizaka46	J-Pop
76	NGT48	J-Pop
77	Sakurako Ohara	J-Pop
78	Kobukuro	J-Pop
79	Little Glee Monster	J-Pop
81	Aimyon	J-Pop
82	Lozareena	J-Pop
83	Shishido Kavka	J-Pop
84	Kyary Pamyu Pamyu	J-Pop
85	Sukima Switch	J-Pop
86	Mrs.GREEN APPLE	J-Pop
88	SKE48	J-Pop
89	SEKAI NO OWARI	J-Pop
25	G Eazy	Hip-Hop
23	Ty Dolla Sign	Hip-Hop
29	Derez Deshon	Hip-Hop
90	E Girls	J-Pop
72	Momoiro Clover Z	J-Pop
87	SHISHAMO	J-Pop
80	MOMOLAND	J-Pop
54	Dan and Shay	Country
\.


--
-- Name: artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artist_id_seq', 90, true);


--
-- Name: artist artist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (id);


--
-- Name: TABLE artist; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.artist TO tensorflow;


--
-- Name: SEQUENCE artist_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.artist_id_seq TO tensorflow;


--
-- PostgreSQL database dump complete
--

