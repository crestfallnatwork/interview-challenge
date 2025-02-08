--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: doctors; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.doctors (
    id integer NOT NULL,
    name text,
    gender text,
    language text,
    link text,
    phone text,
    rating numeric,
    number_of_ratings numeric,
    accept_new boolean,
    employed boolean,
    specialities text,
    image text
);


ALTER TABLE public.doctors OWNER TO test;

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.doctors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doctors_id_seq OWNER TO test;

--
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.doctors_id_seq OWNED BY public.doctors.id;


--
-- Name: location_doctor; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.location_doctor (
    loc_id integer,
    doc_id integer
);


ALTER TABLE public.location_doctor OWNER TO test;

--
-- Name: locations; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    name text,
    address text,
    phone text,
    link text
);


ALTER TABLE public.locations OWNER TO test;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locations_id_seq OWNER TO test;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: doctors id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.doctors ALTER COLUMN id SET DEFAULT nextval('public.doctors_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.doctors (id, name, gender, language, link, phone, rating, number_of_ratings, accept_new, employed, specialities, image) FROM stdin;
1	Christopher Reid, MD	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1174525364	8504444700	\N	\N	t	f	Critical Care Nephrology, Nephrology	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Reid%20cropped.jpg
2	Gregory D. Price Sr, MD	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1699761106	3342224327	\N	\N	t	f	Preventive Cardiology	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Price.jpg
3	Connie Lasley, CRNP	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1548858202	3342222393	4.7	164	f	t	Urology	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Lasley%20CFNP%20Small%20copy.jpg
4	Bhagwan Bang, MD	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1487615084	3344932400	\N	\N	t	f	Pediatrics	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Bang.jpg
5	Heide Price, FNP	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1033431465	3342224327	\N	\N	t	f	Family Medicine, Preventive Cardiology	\N
6	Ricky Lewis, CRNP	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1194747584	3342228421	\N	\N	t	f	Nurse Practitioner	\N
7	Rex Butler, MD	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1730184961	3342228525	\N	\N	t	f	Internal Medicine	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Butler.jpg
8	Christyl Hines, CRNP	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1861830689	3342227337	\N	\N	t	t	Pediatrics	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Christyl%20Hines%20small.jpg
9	Gabrielle Baldwin, MD	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1528150521	3342227337	\N	\N	t	t	Pediatrics	https://connectimages.azureedge.net/providerimages/9eb91cea-158c-4433-b42d-fe512e05ca9c/3/Baldwin.jpeg
10	Timothy Day, MD	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1124083449	3342224191	4.7	173	t	t	General Surgery	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Day.jpg
11	Sherry Wright, CRNP	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1922366103	3342222073	4.7	115	t	t	Orthopedic Surgery	https://connect-cdn.loyalhealth.com/providerimages/9eb91cea-158c-4433-b42d-fe512e05ca9c/3/8.jpg
12	Kelly Hammett, CRNP	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1518340777	3344282273	4.7	127	t	t	Nurse Practitioner	https://connectimages.azureedge.net/providerimages/9eb91cea-158c-4433-b42d-fe512e05ca9c/3/Kelly%20Hammett.jpg
13	Micalyn Kelley, APRN	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1205588803	8504444700	\N	\N	f	f	Nurse Practitioner	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/278950825_10103570498844003_6216667209515053572_n.jpg
14	Kathrine Langley, CRNP	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1407440829	3342221366	4.7	133	t	t	Family Medicine	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/321284829_456332470006363_8752911111625142886_n.jpg
15	Srividhya Sridharan, MD	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1720465909	3342227337	\N	\N	t	t	Pediatrics	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Dr%20Vidhya%20small.jpg
16	Robert L. Long, MD	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1356317002	3342222393	4.7	102	t	t	Urology	https://connectimages.azureedge.net/providerimages/9eb91cea-158c-4433-b42d-fe512e05ca9c/3/50%20(1).jpg
17	Asia Dutton, CRNP	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1457960635	3344282273	4.6	176	t	t	Family Medicine	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Asia%20Dutton%20small.jpg
18	Patrick Kelly, DO	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1184679417	3342222073	4.7	85	t	t	Orthopedic Surgery, Orthopedics - General, Orthopedic Sports Medicine	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Dr.%20Kelly%20color%20small.jpg
19	Hejal Patel, MD	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1174746168	3347932312	\N	\N	t	f	Radiation Oncology	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Patel.jpg
20	Carson Klein, M.D.	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1174150783	3342221022	\N	\N	t	t	Obstetrics, Family Medicine	https://connect-cdn.loyalhealth.com/providerimages/9eb91cea-158c-4433-b42d-fe512e05ca9c/3/Pic%20Klein.JPG
21	Ashton Wells, MD	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1215974233	3342224191	4.7	173	t	t	General Surgery	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Wells,%20A.jpg
22	Jenny Goss, CNM	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1578984811	3342221366	\N	\N	t	t	Midwife	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Jenny%20Goss%20small.jpg
23	April Johnson, CRNP	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1568815793	3344282273	4.6	181	t	t	Nurse Practitioner	https://connectimages.azureedge.net/providerimages/9eb91cea-158c-4433-b42d-fe512e05ca9c/3/image001%20(3).png
24	Candace Cassady, CRNP	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1093922718	3342222562	\N	\N	t	f	Hematology - Oncology	https://connect-cdn.loyalhealth.com/providerimages/9eb91cea-158c-4433-b42d-fe512e05ca9c/3/285301813_10209998436394285_6583605678937369735_n.jpg
25	Kristy Nichols, CRNP	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1891945614	3342222073	4.8	130	t	t	Orthopedic Surgery	https://connect-cdn.loyalhealth.com/providerimages/9eb91cea-158c-4433-b42d-fe512e05ca9c/3/14.jpg
26	Hope Veasey, CRNP	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1194448506	3342227337	\N	\N	t	t	Pediatrics	https://connectimages.azureedge.net/providerimages/9eb91cea-158c-4433-b42d-fe512e05ca9c/3/HopeCaton.jpeg
27	William Farmer, MD	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1710962535	3342221366	\N	\N	t	t	Internal Medicine	\N
28	Jill Elmore, CRNP	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1285841270	3342221366	4.7	175	t	t	Family Medicine	https://connectimages.azureedge.net/providerimages/9eb91cea-158c-4433-b42d-fe512e05ca9c/3/Jill%20Elmore%20Headshot.jfif
29	Sadik Yesil, MD	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1760471817	3342223222	\N	\N	t	f	Family Medicine, Neurology, Hospice & Palliative Care	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Yesil.jpg
30	Holli Johnson, CRNP	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1184092488	3342222115	4.8	290	t	t	Dermatology	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Johnson%20Holli%20(2)%20small.jpg
31	JoAnne Smith, DO	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1104821099	3342220625	\N	\N	t	f	Family Medicine, Adolescent Medicine	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Smith.jpg
32	Charles R. Kerr, MD	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1790798973	3342220995	\N	\N	t	f	Family Medicine, Adolescent Medicine	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Kerr.jpg
33	Alexandru Benet, MD	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1033114269	3344274999	\N	\N	t	f	Urology	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Benet.jpg
34	Caleb Yongkuma, MD	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1417148081	3342226041	\N	\N	t	f	Internal Medicine	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Yongkuma.jpg
35	Lee Carney, MD	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1407943442	3342225781	\N	\N	t	f	Obstetrics & Gynecology, Female Pelvic Medicine & Reconstructive Surgery	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Carney2.jpg
36	Christopher Blatz, CRNA	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1700922028	3344287047	\N	\N	t	f	Anesthesiology	https://connectimages.azureedge.net/providerimages/9eb91cea-158c-4433-b42d-fe512e05ca9c/3/Chris%20Blatz%20copy.jpg
37	Amy Dugger, FNP	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1508174236	8504444700	\N	\N	t	f	Nurse Practitioner	https://connect-cdn.loyalhealth.com/providerimages/9eb91cea-158c-4433-b42d-fe512e05ca9c/3/renalus-ARNP-a_dugger.jpg
38	Willie Furr, CRNA	Male	English	https://www.andalusiahealth.com/find-a-doctor/provider/1023065398	3344287047	\N	\N	t	f	Anesthesiology	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/Willie%20Furr%20copy.jpg
39	Sandy Griffin, CRNA	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1114931144	3344287047	\N	\N	t	f	Anesthesiology	\N
40	Mary Elizabeth Hobson, CRNA	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1710212170	3342228466	\N	\N	f	f	Anesthesiology	https://connectimages.azureedge.net/providerimages/9eb91cea-158c-4433-b42d-fe512e05ca9c/3/Mary%20Elizabeth%20Hobson%20color.jpg
41	Michele Thomason, CRNA	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1114974482	3344287047	\N	\N	t	f	Anesthesiology	https://connectimages.azureedge.net/providerimages/9eb91cea-158c-4433-b42d-fe512e05ca9c/3/Michele%20Thomason%20copy.jpg
42	Julie Gay, CRNA	Female	English	https://www.andalusiahealth.com/find-a-doctor/provider/1730417973	3344287047	\N	\N	t	f	Anesthesiology	https://connect-cdn.loyalhealth.com/providerimages/502B3446-4551-459A-8170-90166B121AD9/3/289763312_5206399046109478_8098598080740415979_n.jpg
\.


--
-- Data for Name: location_doctor; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.location_doctor (loc_id, doc_id) FROM stdin;
1	2
2	2
3	3
4	4
2	4
1	5
7	6
8	7
9	8
9	9
11	10
2	10
13	11
14	12
15	13
2	13
17	14
9	15
3	16
14	17
13	18
22	20
11	21
2	21
22	22
14	23
13	25
9	26
17	27
17	28
31	29
32	30
33	31
2	31
35	32
2	33
37	34
2	35
2	36
2	37
2	38
2	39
2	40
2	41
2	42
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.locations (id, name, address, phone, link) FROM stdin;
1	Heart Institute of Andalusia	215 Medical Park Drive\nSuite 1\nAndalusia, AL 36420	3342224327	https://www.andalusiahealth.com/find-a-doctor/location/heartinstituteofandalusia1294
2	Andalusia Health	849 S 3 Notch Street\nAndalusia, AL 36420	3342228466	https://www.andalusiahealth.com/find-a-doctor/location/andalusiahealth
3	Andalusia Urology	300 Medical Avenue\nSuite 100\nAndalusia, AL 36420	3342222393	https://www.andalusiahealth.com/find-a-doctor/location/andalusiaurology96
4	South Alabama Pediatrics	101 Paulk Ave, Suite B\nOpp, AL 36467	3344932400	https://www.andalusiahealth.com/find-a-doctor/location/southalabamapediatrics2460
7	Three Notch Medical Center	835 S Three Notch St\nAndalusia, AL 36420	3342228421	https://www.andalusiahealth.com/find-a-doctor/location/jfmaddoxmdthreenotchmedicalcenter1390
8	South Central Medical Center	843 South Three Notch St\nAndalusia, AL 36420	3342228525	https://www.andalusiahealth.com/find-a-doctor/location/southcentralmedicalcenter
9	Andalusia Pediatrics	301 Medical Avenue\nSuite A\nAndalusia, AL 36420	3342227337	https://www.andalusiahealth.com/find-a-doctor/location/andalusiapediatrics95
11	Andalusia General Surgeons	820 South Three Notch Street\nAndalusia, AL 36420	3342224191	https://www.andalusiahealth.com/find-a-doctor/location/daywellsmd804
13	Andalusia Orthopedics and Sports Medicine	301 Medical Avenue\nSuite C\nAndalusia, AL 36420	3342222073	https://www.andalusiahealth.com/find-a-doctor/location/andalusiaorthopedicsandsportsmedicine94
14	Andalusia Walk-In Clinic	847 Western Bypass\nAndalusia, AL 36420	3344282273	https://www.andalusiahealth.com/find-a-doctor/location/andalusiawalkinclinic97
15	Pensacola Nephrology d/b/a Renalus Center for Kidney Care	1619 Creighton Road\nSuite 1\nPansacola, FL 32504-7152	8889	https://www.andalusiahealth.com/find-a-doctor/location/pensacolanephrologydbarenaluscenterforkidneycare2089
17	Andalusia Family Healthcare	847 Western Bypass\nAndalusia, AL 36420	3342221366	https://www.andalusiahealth.com/find-a-doctor/location/301medicalsuitedrive
22	Andalusia Women's Services + Family Health	109 Medical Park Dr\nSuite B\nAndalusia, AL 36420	3342221022	https://www.andalusiahealth.com/find-a-doctor/location/andalusiawomensservices
31	Andalusia Neurology	947 South Three Notch\nAndalusia, AL 36420	3342223222	https://www.andalusiahealth.com/find-a-doctor/location/sadikyesilmd2375
32	Andalusia Dermatology	300 Medical Avenue\nSuite 200\nAndalusia, AL 36420	3342222115	https://www.andalusiahealth.com/find-a-doctor/location/andalusiadermatology
33	Balanced Family Health Care	601 West Bypass\nP. O. Box 609\nAndalusia, AL 36420	3342220625	https://www.andalusiahealth.com/find-a-doctor/location/balancedfamilyhealthcare205
35	Andalusia Family Practice	712 East Three Notch St\nAndalusia, AL 36420	3342228450	https://www.andalusiahealth.com/find-a-doctor/location/andalusiafamilypractice
37	Vyas & Vyas MD	1212 East Three Notch Street\nAndalusia, AL 36420	3342226041	https://www.andalusiahealth.com/find-a-doctor/location/vyasvyasmd3034
\.


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.doctors_id_seq', 42, true);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.locations_id_seq', 45, true);


--
-- Name: doctors doctors_link_key; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_link_key UNIQUE (link);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: locations locations_link_key; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_link_key UNIQUE (link);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: location_doctor unique_loc_doc; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.location_doctor
    ADD CONSTRAINT unique_loc_doc UNIQUE (loc_id, doc_id);


--
-- Name: location_doctor location_doctor_doc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.location_doctor
    ADD CONSTRAINT location_doctor_doc_id_fkey FOREIGN KEY (doc_id) REFERENCES public.doctors(id);


--
-- Name: location_doctor location_doctor_loc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.location_doctor
    ADD CONSTRAINT location_doctor_loc_id_fkey FOREIGN KEY (loc_id) REFERENCES public.locations(id);


--
-- PostgreSQL database dump complete
--

