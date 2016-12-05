--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 184 (class 1259 OID 19920)
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE images (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE images OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 19918)
-- Name: user12_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user12_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user12_id_seq OWNER TO postgres;

--
-- TOC entry 2130 (class 0 OID 0)
-- Dependencies: 183
-- Name: user12_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user12_id_seq OWNED BY images.id;


--
-- TOC entry 2007 (class 2604 OID 19923)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('user12_id_seq'::regclass);


--
-- TOC entry 2125 (class 0 OID 19920)
-- Dependencies: 184
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO images (id, name) VALUES (1, '/resources/images/image_001.jpg');
INSERT INTO images (id, name) VALUES (2, '/resources/images/image_002.jpg');
INSERT INTO images (id, name) VALUES (3, '/resources/images/image_003.jpg');
INSERT INTO images (id, name) VALUES (4, '/resources/images/image_004.jpg');


--
-- TOC entry 2131 (class 0 OID 0)
-- Dependencies: 183
-- Name: user12_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user12_id_seq', 74, true);


--
-- TOC entry 2009 (class 2606 OID 19991)
-- Name: pk_images.id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY images
    ADD CONSTRAINT "pk_images.id" PRIMARY KEY (id);

