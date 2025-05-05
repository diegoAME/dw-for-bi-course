--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4

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

--
-- Name: university; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA university;


ALTER SCHEMA university OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: course; Type: TABLE; Schema: university; Owner: postgres
--

CREATE TABLE university.course (
    courseno character(6) NOT NULL,
    crsdesc character varying(50) NOT NULL,
    crsunits integer
);


ALTER TABLE university.course OWNER TO postgres;

--
-- Name: enrollment; Type: TABLE; Schema: university; Owner: postgres
--

CREATE TABLE university.enrollment (
    offerno integer NOT NULL,
    stdno character(11) NOT NULL,
    enrgrade numeric(3,2) DEFAULT 0
);


ALTER TABLE university.enrollment OWNER TO postgres;

--
-- Name: faculty; Type: TABLE; Schema: university; Owner: postgres
--

CREATE TABLE university.faculty (
    facno character(11) NOT NULL,
    facfirstname character varying(30) NOT NULL,
    faclastname character varying(30) NOT NULL,
    faccity character varying(30) NOT NULL,
    facstate character(2) NOT NULL,
    faczipcode character(10) NOT NULL,
    facrank character(4),
    fachiredate date,
    facsalary numeric(10,2),
    facsupervisor character(11),
    facdept character(6)
);


ALTER TABLE university.faculty OWNER TO postgres;

--
-- Name: offering; Type: TABLE; Schema: university; Owner: postgres
--

CREATE TABLE university.offering (
    offerno integer NOT NULL,
    courseno character(6) NOT NULL,
    offterm character(6) NOT NULL,
    offyear integer DEFAULT 2022 NOT NULL,
    offlocation character varying(30),
    offtime character varying(10),
    facno character(11),
    offdays character(6) DEFAULT 'MW'::bpchar
);


ALTER TABLE university.offering OWNER TO postgres;

--
-- Name: student; Type: TABLE; Schema: university; Owner: postgres
--

CREATE TABLE university.student (
    stdno character(11) NOT NULL,
    stdfirstname character varying(50) NOT NULL,
    stdlastname character varying(50) NOT NULL,
    stdcity character varying(50) NOT NULL,
    stdstate character(2) NOT NULL,
    stdzip character(10) NOT NULL,
    stdmajor character(6),
    stdclass character(6),
    stdgpa numeric(3,2) DEFAULT 0,
    CONSTRAINT majordeclared CHECK (((stdclass = ANY (ARRAY['FR'::bpchar, 'SO'::bpchar])) OR (stdmajor IS NOT NULL))),
    CONSTRAINT validgpa CHECK (((stdgpa >= (0)::numeric) AND (stdgpa <= (4)::numeric))),
    CONSTRAINT validstdclass CHECK ((stdclass = ANY (ARRAY['FR'::bpchar, 'SO'::bpchar, 'JR'::bpchar, 'SR'::bpchar])))
);


ALTER TABLE university.student OWNER TO postgres;

--
-- Data for Name: course; Type: TABLE DATA; Schema: university; Owner: postgres
--

COPY university.course (courseno, crsdesc, crsunits) FROM stdin;
FIN300	FUNDAMENTALS OF FINANCE	4
FIN450	PRINCIPLES OF INVESTMENTS	4
FIN480	CORPORATE FINANCE	4
IS320 	FUNDAMENTALS OF BUSINESS PROGRAMMING	4
IS460 	SYSTEMS ANALYSIS	4
IS470 	BUSINESS DATA COMMUNICATIONS	4
IS480 	FUNDAMENTALS OF DATABASE MANAGEMENT	4
\.


--
-- Data for Name: enrollment; Type: TABLE DATA; Schema: university; Owner: postgres
--

COPY university.enrollment (offerno, stdno, enrgrade) FROM stdin;
1234	123-45-6789	3.30
1234	234-56-7890	3.50
1234	345-67-8901	3.20
1234	456-78-9012	3.10
1234	567-89-0123	3.80
1234	678-90-1234	3.40
4321	123-45-6789	3.50
4321	124-56-7890	3.20
4321	789-01-2345	3.50
4321	876-54-3210	3.10
4321	890-12-3456	3.40
4321	901-23-4567	3.10
5555	123-45-6789	3.20
5555	124-56-7890	2.70
5678	123-45-6789	3.20
5678	234-56-7890	2.80
5678	345-67-8901	3.30
5678	456-78-9012	3.40
5678	567-89-0123	2.60
5679	123-45-6789	2.00
5679	124-56-7890	3.70
5679	678-90-1234	3.30
5679	789-01-2345	3.80
5679	890-12-3456	2.90
5679	901-23-4567	3.10
6666	234-56-7890	3.10
6666	567-89-0123	3.60
7777	876-54-3210	3.40
7777	890-12-3456	3.70
7777	901-23-4567	3.40
9876	124-56-7890	3.50
9876	234-56-7890	3.20
9876	345-67-8901	3.20
9876	456-78-9012	3.40
9876	567-89-0123	2.60
9876	678-90-1234	3.30
9876	901-23-4567	4.00
1111	901-23-4567	0.00
\.


--
-- Data for Name: faculty; Type: TABLE DATA; Schema: university; Owner: postgres
--

COPY university.faculty (facno, facfirstname, faclastname, faccity, facstate, faczipcode, facrank, fachiredate, facsalary, facsupervisor, facdept) FROM stdin;
543-21-0987	VICTORIA	EMMANUEL	BOTHELL	WA	98011-2242	PROF	2008-04-15	120000.00	\N	MS    
765-43-2109	NICKI	MACON	BELLEVUE	WA	98015-9945	PROF	2009-04-11	65000.00	\N	FIN   
654-32-1098	LEONARD	FIBON	SEATTLE	WA	98121-0094	ASSC	2006-05-01	70000.00	543-21-0987	MS    
098-76-5432	LEONARD	VINCE	SEATTLE	WA	98111-9921	ASST	2007-04-10	35000.00	654-32-1098	MS    
876-54-3210	CRISTOPHER	COLAN	SEATTLE	WA	98114-1332	ASST	2011-03-01	40000.00	654-32-1098	MS    
987-65-4321	JULIA	MILLS	SEATTLE	WA	98114-9954	ASSC	2012-03-15	75000.00	765-43-2109	FIN   
\.


--
-- Data for Name: offering; Type: TABLE DATA; Schema: university; Owner: postgres
--

COPY university.offering (offerno, courseno, offterm, offyear, offlocation, offtime, facno, offdays) FROM stdin;
1111	IS320 	SUMMER	2020	BLM302	10:30:00	\N	MW    
1234	IS320 	FALL  	2019	BLM302	10:30:00	098-76-5432	MW    
2222	IS460 	SUMMER	2019	BLM412	13:30:00	\N	TTH   
3333	IS320 	SPRING	2020	BLM214	08:30:00	098-76-5432	MW    
4321	IS320 	FALL  	2019	BLM214	15:30:00	098-76-5432	TTH   
4444	IS320 	WINTER	2020	BLM302	15:30:00	543-21-0987	TTH   
5555	FIN300	WINTER	2020	BLM207	08:30:00	765-43-2109	MW    
5678	IS480 	WINTER	2020	BLM302	10:30:00	987-65-4321	MW    
5679	IS480 	SPRING	2020	BLM412	15:30:00	876-54-3210	TTH   
6666	FIN450	WINTER	2020	BLM212	10:30:00	987-65-4321	TTH   
7777	FIN480	SPRING	2020	BLM305	13:30:00	765-43-2109	MW    
8888	IS320 	SUMMER	2020	BLM405	13:30:00	654-32-1098	MW    
9876	IS460 	SPRING	2020	BLM307	13:30:00	654-32-1098	TTH   
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: university; Owner: postgres
--

COPY university.student (stdno, stdfirstname, stdlastname, stdcity, stdstate, stdzip, stdmajor, stdclass, stdgpa) FROM stdin;
123-45-6789	HOMER	WELLS	SEATTLE	WA	98121-1111	IS    	FR    	3.00
124-56-7890	BOB	NORBERT	BOTHELL	WA	98011-2121	FIN   	JR    	2.70
234-56-7890	CANDY	KENDALL	TACOMA	WA	99042-3321	ACCT  	JR    	3.50
345-67-8901	WALLY	KENDALL	SEATTLE	WA	98123-1141	IS    	SR    	2.80
456-78-9012	JOE	ESTRADA	SEATTLE	WA	98121-2333	FIN   	SR    	3.20
567-89-0123	MARIAH	DODGE	SEATTLE	WA	98114-0021	IS    	JR    	3.60
678-90-1234	TESS	DODGE	REDMOND	WA	98116-2344	ACCT  	SO    	3.30
789-01-2345	ROBERTO	MORALES	SEATTLE	WA	98121-2212	FIN   	JR    	2.50
876-54-3210	CRISTOPHER	COLAN	SEATTLE	WA	98114-1332	IS    	SR    	4.00
890-12-3456	LUKE	BRAZZI	SEATTLE	WA	98116-0021	IS    	SR    	2.20
901-23-4567	WILLIAM	PILGRIM	BOTHELL	WA	98113-1885	IS    	SO    	3.80
\.


--
-- Name: course coursepk; Type: CONSTRAINT; Schema: university; Owner: postgres
--

ALTER TABLE ONLY university.course
    ADD CONSTRAINT coursepk PRIMARY KEY (courseno);


--
-- Name: enrollment enrollmentpk; Type: CONSTRAINT; Schema: university; Owner: postgres
--

ALTER TABLE ONLY university.enrollment
    ADD CONSTRAINT enrollmentpk PRIMARY KEY (offerno, stdno);


--
-- Name: faculty facultypk; Type: CONSTRAINT; Schema: university; Owner: postgres
--

ALTER TABLE ONLY university.faculty
    ADD CONSTRAINT facultypk PRIMARY KEY (facno);


--
-- Name: offering offeringpk; Type: CONSTRAINT; Schema: university; Owner: postgres
--

ALTER TABLE ONLY university.offering
    ADD CONSTRAINT offeringpk PRIMARY KEY (offerno);


--
-- Name: student pkstudent; Type: CONSTRAINT; Schema: university; Owner: postgres
--

ALTER TABLE ONLY university.student
    ADD CONSTRAINT pkstudent PRIMARY KEY (stdno);


--
-- Name: course uniquecrsdesc; Type: CONSTRAINT; Schema: university; Owner: postgres
--

ALTER TABLE ONLY university.course
    ADD CONSTRAINT uniquecrsdesc UNIQUE (crsdesc);


--
-- Name: offering coursefk; Type: FK CONSTRAINT; Schema: university; Owner: postgres
--

ALTER TABLE ONLY university.offering
    ADD CONSTRAINT coursefk FOREIGN KEY (courseno) REFERENCES university.course(courseno);


--
-- Name: offering facultyfk; Type: FK CONSTRAINT; Schema: university; Owner: postgres
--

ALTER TABLE ONLY university.offering
    ADD CONSTRAINT facultyfk FOREIGN KEY (facno) REFERENCES university.faculty(facno);


--
-- Name: enrollment offeringfk; Type: FK CONSTRAINT; Schema: university; Owner: postgres
--

ALTER TABLE ONLY university.enrollment
    ADD CONSTRAINT offeringfk FOREIGN KEY (offerno) REFERENCES university.offering(offerno) ON DELETE CASCADE;


--
-- Name: enrollment studentfk; Type: FK CONSTRAINT; Schema: university; Owner: postgres
--

ALTER TABLE ONLY university.enrollment
    ADD CONSTRAINT studentfk FOREIGN KEY (stdno) REFERENCES university.student(stdno) ON DELETE CASCADE;


--
-- Name: faculty supervisorfk; Type: FK CONSTRAINT; Schema: university; Owner: postgres
--

ALTER TABLE ONLY university.faculty
    ADD CONSTRAINT supervisorfk FOREIGN KEY (facsupervisor) REFERENCES university.faculty(facno);


--
-- PostgreSQL database dump complete
--

