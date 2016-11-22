--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN1';
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
-- Name: departments; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE departments (
    dept_code character varying(10) NOT NULL,
    dept character varying(20) NOT NULL,
    phone character varying(20)
);


ALTER TABLE departments OWNER TO vagrant;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE employees (
    id integer NOT NULL,
    fname character varying(20) NOT NULL,
    lname character varying(20) NOT NULL,
    salary integer,
    full_time boolean DEFAULT true NOT NULL,
    start_date date,
    dept_code character varying(10)
);


ALTER TABLE employees OWNER TO vagrant;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE employees_id_seq OWNER TO vagrant;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE employees_id_seq OWNED BY employees.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY departments (dept_code, dept, phone) FROM stdin;
mktg	Marketing	555-1212
legal	Legal	555-1000
fin	Finance	555-9876
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY employees (id, fname, lname, salary, full_time, start_date, dept_code) FROM stdin;
1	Liz	Lemon	90000	t	\N	legal
2	Maggie	McEnroe	70000	t	\N	mktg
3	Leonard	Lancelot	90000	t	\N	legal
4	Nadine	Nelson	\N	t	\N	\N
\.


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('employees_id_seq', 4, true);


--
-- Name: departments_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_code);


--
-- Name: employees_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: employees_dept_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_dept_code_fkey FOREIGN KEY (dept_code) REFERENCES departments(dept_code);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

