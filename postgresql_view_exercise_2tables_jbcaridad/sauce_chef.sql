--
-- PostgreSQL database dump
--

-- Dumped from database version 10.11
-- Dumped by pg_dump version 10.11

-- Started on 2019-11-20 02:07:05

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

--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 2948
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 2 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 1 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 16479)
-- Name: _customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._customer (
    id integer NOT NULL,
    cust_lname character varying(9) DEFAULT NULL::character varying NOT NULL,
    cust_fname character varying(8) DEFAULT NULL::character varying NOT NULL,
    cust_add character varying(6) DEFAULT NULL::character varying NOT NULL,
    cust_phone integer NOT NULL,
    resto_id smallint NOT NULL
);


ALTER TABLE public._customer OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16477)
-- Name: _customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._customer_id_seq OWNER TO postgres;

--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 197
-- Name: _customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._customer_id_seq OWNED BY public._customer.id;


--
-- TOC entry 200 (class 1259 OID 16488)
-- Name: _employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._employee (
    id integer NOT NULL,
    emp_lname character varying(1) DEFAULT NULL::character varying NOT NULL,
    emp_fname character varying(1) DEFAULT NULL::character varying NOT NULL,
    emp_add character varying(1) DEFAULT NULL::character varying NOT NULL,
    emp_email character varying(1) DEFAULT NULL::character varying,
    emp_phone character varying(1) DEFAULT NULL::character varying,
    emp_type character varying(1) DEFAULT NULL::character varying NOT NULL,
    resto_id character varying(1) DEFAULT NULL::character varying NOT NULL
);


ALTER TABLE public._employee OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16486)
-- Name: _employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._employee_id_seq OWNER TO postgres;

--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 199
-- Name: _employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._employee_id_seq OWNED BY public._employee.id;


--
-- TOC entry 202 (class 1259 OID 16501)
-- Name: _food; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._food (
    id integer NOT NULL,
    food_name character varying(18) DEFAULT NULL::character varying NOT NULL,
    food_price smallint NOT NULL,
    food_type character varying(12) DEFAULT NULL::character varying NOT NULL
);


ALTER TABLE public._food OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16499)
-- Name: _food_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._food_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._food_id_seq OWNER TO postgres;

--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 201
-- Name: _food_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._food_id_seq OWNED BY public._food.id;


--
-- TOC entry 204 (class 1259 OID 16509)
-- Name: _ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._ingredients (
    id integer NOT NULL,
    ingredient_code character varying(13) DEFAULT NULL::character varying NOT NULL,
    ingredient_desc character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._ingredients OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16507)
-- Name: _ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._ingredients_id_seq OWNER TO postgres;

--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 203
-- Name: _ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._ingredients_id_seq OWNED BY public._ingredients.id;


--
-- TOC entry 206 (class 1259 OID 16517)
-- Name: _order_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._order_detail (
    id integer NOT NULL,
    od_quantity smallint NOT NULL,
    od_item character varying(51) DEFAULT NULL::character varying NOT NULL,
    od_remarks character varying(1) DEFAULT NULL::character varying,
    food_id smallint NOT NULL
);


ALTER TABLE public._order_detail OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16515)
-- Name: _order_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._order_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._order_detail_id_seq OWNER TO postgres;

--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 205
-- Name: _order_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._order_detail_id_seq OWNED BY public._order_detail.id;


--
-- TOC entry 208 (class 1259 OID 16525)
-- Name: _order_header; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._order_header (
    id integer NOT NULL,
    oh_date character varying(10) DEFAULT NULL::character varying NOT NULL,
    order_stat character varying(9) DEFAULT NULL::character varying NOT NULL,
    customer_id smallint NOT NULL,
    order_detail_id smallint NOT NULL
);


ALTER TABLE public._order_header OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16523)
-- Name: _order_header_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._order_header_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._order_header_id_seq OWNER TO postgres;

--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 207
-- Name: _order_header_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._order_header_id_seq OWNED BY public._order_header.id;


--
-- TOC entry 210 (class 1259 OID 16533)
-- Name: _payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._payment (
    id integer NOT NULL,
    payment_amount_total smallint NOT NULL,
    payment_amount_paid smallint NOT NULL,
    payment_tax smallint,
    payment_discount smallint,
    payment_change smallint,
    payment_reference_num smallint,
    order_header_id smallint NOT NULL
);


ALTER TABLE public._payment OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16531)
-- Name: _payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._payment_id_seq OWNER TO postgres;

--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 209
-- Name: _payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._payment_id_seq OWNED BY public._payment.id;


--
-- TOC entry 212 (class 1259 OID 16539)
-- Name: _purchase_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._purchase_order (
    id integer NOT NULL,
    supplier_id character varying(1) DEFAULT NULL::character varying NOT NULL,
    resto_id character varying(1) DEFAULT NULL::character varying NOT NULL,
    po_order_date character varying(1) DEFAULT NULL::character varying NOT NULL,
    po_delivery_date character varying(1) DEFAULT NULL::character varying NOT NULL,
    po_order_stat character varying(1) DEFAULT NULL::character varying NOT NULL
);


ALTER TABLE public._purchase_order OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16537)
-- Name: _purchase_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._purchase_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._purchase_order_id_seq OWNER TO postgres;

--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 211
-- Name: _purchase_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._purchase_order_id_seq OWNED BY public._purchase_order.id;


--
-- TOC entry 214 (class 1259 OID 16550)
-- Name: _recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._recipe (
    id integer NOT NULL,
    food_id character varying(1) DEFAULT NULL::character varying NOT NULL,
    ingredients_id character varying(1) DEFAULT NULL::character varying NOT NULL
);


ALTER TABLE public._recipe OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16548)
-- Name: _recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._recipe_id_seq OWNER TO postgres;

--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 213
-- Name: _recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._recipe_id_seq OWNED BY public._recipe.id;


--
-- TOC entry 216 (class 1259 OID 16558)
-- Name: _resto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._resto (
    id integer NOT NULL,
    resto_name character varying(10) DEFAULT NULL::character varying NOT NULL,
    resto_found_date character varying(10) DEFAULT NULL::character varying NOT NULL,
    resto_owner character varying(14) DEFAULT NULL::character varying NOT NULL
);


ALTER TABLE public._resto OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16556)
-- Name: _resto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._resto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._resto_id_seq OWNER TO postgres;

--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 215
-- Name: _resto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._resto_id_seq OWNED BY public._resto.id;


--
-- TOC entry 218 (class 1259 OID 16567)
-- Name: _supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._supplier (
    id integer NOT NULL,
    supplier_name character varying(1) DEFAULT NULL::character varying NOT NULL,
    supplier_loc character varying(1) DEFAULT NULL::character varying NOT NULL,
    partners_num character varying(1) DEFAULT NULL::character varying NOT NULL
);


ALTER TABLE public._supplier OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16565)
-- Name: _supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._supplier_id_seq OWNER TO postgres;

--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 217
-- Name: _supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._supplier_id_seq OWNED BY public._supplier.id;


--
-- TOC entry 219 (class 1259 OID 16626)
-- Name: customer_order; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.customer_order AS
 SELECT _customer.id,
    _customer.cust_lname,
    _customer.cust_fname,
    _customer.cust_add,
    _customer.cust_phone,
    _order_header.oh_date,
    _order_header.order_stat,
    _order_header.order_detail_id
   FROM (public._customer
     JOIN public._order_header ON ((_order_header.customer_id = _customer.id)));


ALTER TABLE public.customer_order OWNER TO postgres;

--
-- TOC entry 2735 (class 2604 OID 16482)
-- Name: _customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._customer ALTER COLUMN id SET DEFAULT nextval('public._customer_id_seq'::regclass);


--
-- TOC entry 2739 (class 2604 OID 16491)
-- Name: _employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._employee ALTER COLUMN id SET DEFAULT nextval('public._employee_id_seq'::regclass);


--
-- TOC entry 2747 (class 2604 OID 16504)
-- Name: _food id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._food ALTER COLUMN id SET DEFAULT nextval('public._food_id_seq'::regclass);


--
-- TOC entry 2751 (class 2604 OID 16512)
-- Name: _ingredients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._ingredients ALTER COLUMN id SET DEFAULT nextval('public._ingredients_id_seq'::regclass);


--
-- TOC entry 2753 (class 2604 OID 16520)
-- Name: _order_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._order_detail ALTER COLUMN id SET DEFAULT nextval('public._order_detail_id_seq'::regclass);


--
-- TOC entry 2756 (class 2604 OID 16528)
-- Name: _order_header id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._order_header ALTER COLUMN id SET DEFAULT nextval('public._order_header_id_seq'::regclass);


--
-- TOC entry 2759 (class 2604 OID 16536)
-- Name: _payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._payment ALTER COLUMN id SET DEFAULT nextval('public._payment_id_seq'::regclass);


--
-- TOC entry 2765 (class 2604 OID 16542)
-- Name: _purchase_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._purchase_order ALTER COLUMN id SET DEFAULT nextval('public._purchase_order_id_seq'::regclass);


--
-- TOC entry 2768 (class 2604 OID 16553)
-- Name: _recipe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._recipe ALTER COLUMN id SET DEFAULT nextval('public._recipe_id_seq'::regclass);


--
-- TOC entry 2772 (class 2604 OID 16561)
-- Name: _resto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._resto ALTER COLUMN id SET DEFAULT nextval('public._resto_id_seq'::regclass);


--
-- TOC entry 2776 (class 2604 OID 16570)
-- Name: _supplier id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._supplier ALTER COLUMN id SET DEFAULT nextval('public._supplier_id_seq'::regclass);


--
-- TOC entry 2922 (class 0 OID 16479)
-- Dependencies: 198
-- Data for Name: _customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._customer (id, cust_lname, cust_fname, cust_add, cust_phone, resto_id) VALUES (1, 'Caridad', 'John', 'Makati', 12412344, 1);
INSERT INTO public._customer (id, cust_lname, cust_fname, cust_add, cust_phone, resto_id) VALUES (2, 'Cariaga', 'Kristine', 'Taguig', 786812312, 1);
INSERT INTO public._customer (id, cust_lname, cust_fname, cust_add, cust_phone, resto_id) VALUES (3, 'Caridad', 'Asirrh', 'Makati', 21716237, 1);
INSERT INTO public._customer (id, cust_lname, cust_fname, cust_add, cust_phone, resto_id) VALUES (4, 'Bunagan', 'Jhed', 'Taguig', 21312322, 1);
INSERT INTO public._customer (id, cust_lname, cust_fname, cust_add, cust_phone, resto_id) VALUES (5, 'Bunaganda', 'Jhedi', 'Taguig', 812378677, 1);


--
-- TOC entry 2924 (class 0 OID 16488)
-- Dependencies: 200
-- Data for Name: _employee; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2926 (class 0 OID 16501)
-- Dependencies: 202
-- Data for Name: _food; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._food (id, food_name, food_price, food_type) VALUES (1001, 'Chicken Sandwich', 59, 'Sandwich');
INSERT INTO public._food (id, food_name, food_price, food_type) VALUES (1002, 'Tuna Sandwich', 59, 'Sandwich');
INSERT INTO public._food (id, food_name, food_price, food_type) VALUES (1003, 'Ice Cream Sandwich', 69, 'Sandwich');
INSERT INTO public._food (id, food_name, food_price, food_type) VALUES (1004, 'Chicken with Rice', 89, 'Rice Meal');
INSERT INTO public._food (id, food_name, food_price, food_type) VALUES (1006, 'Torikatsudon', 129, 'Special Meal');


--
-- TOC entry 2928 (class 0 OID 16509)
-- Dependencies: 204
-- Data for Name: _ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._ingredients (id, ingredient_code, ingredient_desc) VALUES (1, 'Ala Sauce', NULL);
INSERT INTO public._ingredients (id, ingredient_code, ingredient_desc) VALUES (2, 'Ala Chef', NULL);
INSERT INTO public._ingredients (id, ingredient_code, ingredient_desc) VALUES (3, 'Ala Cartesian', NULL);
INSERT INTO public._ingredients (id, ingredient_code, ingredient_desc) VALUES (4, 'Ala na', NULL);


--
-- TOC entry 2930 (class 0 OID 16517)
-- Dependencies: 206
-- Data for Name: _order_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._order_detail (id, od_quantity, od_item, od_remarks, food_id) VALUES (2001, 3, 'Chicken with Rice, Ice Cream Sandwich, Torikatsudon', NULL, 1004);
INSERT INTO public._order_detail (id, od_quantity, od_item, od_remarks, food_id) VALUES (2002, 1, 'Chicken Sandwich', NULL, 1001);
INSERT INTO public._order_detail (id, od_quantity, od_item, od_remarks, food_id) VALUES (2003, 1, 'Ice Cream Sandwich', NULL, 1003);
INSERT INTO public._order_detail (id, od_quantity, od_item, od_remarks, food_id) VALUES (2004, 1, 'Torikatsudon', NULL, 1006);
INSERT INTO public._order_detail (id, od_quantity, od_item, od_remarks, food_id) VALUES (2005, 1, 'Tuna Sandwich', NULL, 1002);


--
-- TOC entry 2932 (class 0 OID 16525)
-- Dependencies: 208
-- Data for Name: _order_header; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._order_header (id, oh_date, order_stat, customer_id, order_detail_id) VALUES (1, '2019-10-31', 'Delivered', 1, 2004);
INSERT INTO public._order_header (id, oh_date, order_stat, customer_id, order_detail_id) VALUES (2, '2019-11-01', 'On queue', 6, 2005);
INSERT INTO public._order_header (id, oh_date, order_stat, customer_id, order_detail_id) VALUES (3, '2019-11-01', 'On queue', 8, 2003);
INSERT INTO public._order_header (id, oh_date, order_stat, customer_id, order_detail_id) VALUES (4, '2019-11-04', 'On queue', 2, 2001);
INSERT INTO public._order_header (id, oh_date, order_stat, customer_id, order_detail_id) VALUES (5, '2019-11-07', 'On queue', 4, 2002);


--
-- TOC entry 2934 (class 0 OID 16533)
-- Dependencies: 210
-- Data for Name: _payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._payment (id, payment_amount_total, payment_amount_paid, payment_tax, payment_discount, payment_change, payment_reference_num, order_header_id) VALUES (201910311, 129, 130, 0, 0, 1, 1001, 1);


--
-- TOC entry 2936 (class 0 OID 16539)
-- Dependencies: 212
-- Data for Name: _purchase_order; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2938 (class 0 OID 16550)
-- Dependencies: 214
-- Data for Name: _recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2940 (class 0 OID 16558)
-- Dependencies: 216
-- Data for Name: _resto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._resto (id, resto_name, resto_found_date, resto_owner) VALUES (1, 'Sauce Chef', '2012-12-12', 'Patick Volante');


--
-- TOC entry 2942 (class 0 OID 16567)
-- Dependencies: 218
-- Data for Name: _supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 197
-- Name: _customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._customer_id_seq', 5, true);


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 199
-- Name: _employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._employee_id_seq', 1, false);


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 201
-- Name: _food_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._food_id_seq', 1, false);


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 203
-- Name: _ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._ingredients_id_seq', 1, true);


--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 205
-- Name: _order_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._order_detail_id_seq', 1, false);


--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 207
-- Name: _order_header_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._order_header_id_seq', 1, false);


--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 209
-- Name: _payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._payment_id_seq', 1, false);


--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 211
-- Name: _purchase_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._purchase_order_id_seq', 1, false);


--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 213
-- Name: _recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._recipe_id_seq', 1, false);


--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 215
-- Name: _resto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._resto_id_seq', 1, false);


--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 217
-- Name: _supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._supplier_id_seq', 1, false);


--
-- TOC entry 2778 (class 2606 OID 16578)
-- Name: _customer _customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._customer
    ADD CONSTRAINT _customer_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 16585)
-- Name: _employee _employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._employee
    ADD CONSTRAINT _employee_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 16589)
-- Name: _food _food_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._food
    ADD CONSTRAINT _food_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 16593)
-- Name: _ingredients _ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._ingredients
    ADD CONSTRAINT _ingredients_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 16596)
-- Name: _order_detail _order_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._order_detail
    ADD CONSTRAINT _order_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 16600)
-- Name: _order_header _order_header_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._order_header
    ADD CONSTRAINT _order_header_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 16603)
-- Name: _payment _payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._payment
    ADD CONSTRAINT _payment_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 16610)
-- Name: _purchase_order _purchase_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._purchase_order
    ADD CONSTRAINT _purchase_order_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 16614)
-- Name: _recipe _recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._recipe
    ADD CONSTRAINT _recipe_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 16619)
-- Name: _resto _resto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._resto
    ADD CONSTRAINT _resto_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 16624)
-- Name: _supplier _supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._supplier
    ADD CONSTRAINT _supplier_pkey PRIMARY KEY (id);


-- Completed on 2019-11-20 02:07:06

--
-- PostgreSQL database dump complete
--

