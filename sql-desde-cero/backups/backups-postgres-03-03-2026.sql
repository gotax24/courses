--
-- PostgreSQL database dump
--

\restrict r5FXCyIzhQEk9TNDjwI2hqLCmMxJOL393R4N1EF4SG7qUt7TfIYnskhHywTn4sp

-- Dumped from database version 18.2
-- Dumped by pg_dump version 18.2

-- Started on 2026-03-03 13:02:19

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
-- TOC entry 225 (class 1259 OID 16505)
-- Name: alpha; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alpha (
    id integer NOT NULL,
    description character varying(100) NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 16512)
-- Name: beta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.beta (
    id integer NOT NULL,
    title character varying(50) NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 16522)
-- Name: gamma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gamma (
    id integer NOT NULL,
    description character varying(50) NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 16466)
-- Name: invoices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invoices (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    invoice_date date DEFAULT now() NOT NULL,
    persons_id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 16481)
-- Name: invoices_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invoices_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    invoice_id uuid NOT NULL,
    product_id uuid NOT NULL,
    price numeric(10,2) NOT NULL,
    quantity integer DEFAULT 1 NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 16439)
-- Name: jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jobs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    persons_id uuid NOT NULL,
    job_name character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);


--
-- TOC entry 220 (class 1259 OID 16425)
-- Name: persons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.persons (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    birthday date NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    email character varying(80)
);


--
-- TOC entry 222 (class 1259 OID 16455)
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    product_name character varying(30) NOT NULL,
    price numeric(10,2) NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 16413)
-- Name: students; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.students (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    first_name character varying(50) NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    update_at timestamp without time zone
);


--
-- TOC entry 4978 (class 0 OID 16505)
-- Dependencies: 225
-- Data for Name: alpha; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.alpha (id, description) FROM stdin;
1	UNO
2	DOS
3	TRES
4	CUATRO
\.


--
-- TOC entry 4979 (class 0 OID 16512)
-- Dependencies: 226
-- Data for Name: beta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.beta (id, title) FROM stdin;
1	ONE
2	TWO
3	THREE
\.


--
-- TOC entry 4980 (class 0 OID 16522)
-- Dependencies: 227
-- Data for Name: gamma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gamma (id, description) FROM stdin;
1	ONE
2	TWO
3	THREE
4	FOUR
5	FIVE
6	SIX
\.


--
-- TOC entry 4976 (class 0 OID 16466)
-- Dependencies: 223
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.invoices (id, invoice_date, persons_id) FROM stdin;
bbc6d4f8-03ae-4f79-bb20-31871848d58d	2026-03-03	7226c01a-f28d-4532-9a1a-0c0c03869e32
4a935d2f-30f8-4d53-92d6-1e81b0fcafb1	2026-03-03	e36f93c6-6f20-4136-b295-a4094b036a6a
5b3bb0dc-eaf5-42a2-bce4-908b291d573b	2026-03-03	61566ee8-4d94-4973-a1d6-1376a487d760
92ada10a-b656-4c88-8421-bcf093ed9127	2026-03-03	7226c01a-f28d-4532-9a1a-0c0c03869e32
\.


--
-- TOC entry 4977 (class 0 OID 16481)
-- Dependencies: 224
-- Data for Name: invoices_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.invoices_items (id, invoice_id, product_id, price, quantity) FROM stdin;
472d8cfb-5f85-4444-820e-1ef984714d8a	bbc6d4f8-03ae-4f79-bb20-31871848d58d	d92276fa-9d8a-4a01-a3c3-6ccad596096e	1.44	3
c4de5b95-1677-4535-9dd4-8e975484601b	bbc6d4f8-03ae-4f79-bb20-31871848d58d	f7c57630-a5ba-4244-8e30-eb05d2c82b62	21.00	12
c9fc8352-1934-4a31-9626-dac99b7526ce	4a935d2f-30f8-4d53-92d6-1e81b0fcafb1	d92276fa-9d8a-4a01-a3c3-6ccad596096e	1.44	1
d1f76a29-5918-4940-ae9a-71797547309a	4a935d2f-30f8-4d53-92d6-1e81b0fcafb1	f7c57630-a5ba-4244-8e30-eb05d2c82b62	21.00	10
adfbb073-387c-4811-a47d-76728a1f8331	4a935d2f-30f8-4d53-92d6-1e81b0fcafb1	65bcdb0d-de19-45a5-ae5f-b3c00e321baa	14.11	3
72a096a0-c4e3-4612-9e87-b35a22d4bd24	5b3bb0dc-eaf5-42a2-bce4-908b291d573b	65bcdb0d-de19-45a5-ae5f-b3c00e321baa	14.11	1
aa69fd29-7395-481b-a519-2545fef146ae	5b3bb0dc-eaf5-42a2-bce4-908b291d573b	d92276fa-9d8a-4a01-a3c3-6ccad596096e	1.44	5
239cfde5-813e-4406-bd9c-375e88494c84	bbc6d4f8-03ae-4f79-bb20-31871848d58d	d92276fa-9d8a-4a01-a3c3-6ccad596096e	1.44	12
3977f978-f6d1-4fb7-b22e-9bab05928d45	bbc6d4f8-03ae-4f79-bb20-31871848d58d	f7c57630-a5ba-4244-8e30-eb05d2c82b62	21.00	5
52b0c393-10f4-4e23-af10-d9d51145bf02	92ada10a-b656-4c88-8421-bcf093ed9127	d92276fa-9d8a-4a01-a3c3-6ccad596096e	1.44	12
9f0ddfeb-555a-4c9e-ac5d-0aef24187b1b	92ada10a-b656-4c88-8421-bcf093ed9127	f7c57630-a5ba-4244-8e30-eb05d2c82b62	21.00	5
\.


--
-- TOC entry 4974 (class 0 OID 16439)
-- Dependencies: 221
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.jobs (id, persons_id, job_name, created_at, updated_at) FROM stdin;
d9378cd0-34c6-49fe-9998-b5f59989321c	e36f93c6-6f20-4136-b295-a4094b036a6a	Analista IT	2026-03-03 12:17:01.156426	\N
0f26f6dd-dd45-4e98-af61-132c9dfab63c	7226c01a-f28d-4532-9a1a-0c0c03869e32	Asistente de proyecto | Analista SGC	2026-03-03 13:26:21.662217	\N
\.


--
-- TOC entry 4973 (class 0 OID 16425)
-- Dependencies: 220
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.persons (id, first_name, last_name, birthday, created_at, updated_at, email) FROM stdin;
7226c01a-f28d-4532-9a1a-0c0c03869e32	Yaldriani	De Bracho	2000-04-18	2026-03-03 12:17:15.903249	\N	yaldriani@gmail.com
e36f93c6-6f20-4136-b295-a4094b036a6a	Ernesto	Bracho	1999-09-30	2026-02-28 17:24:05.801559	\N	ernestobracho@cevaz.com
61566ee8-4d94-4973-a1d6-1376a487d760	Rosanna	Ragno	1959-07-28	2026-03-03 13:25:55.784808	\N	rosannaragno@gmail.com
8824eade-9bea-4795-9720-a067510d5bf0	Pedro	Pinedo	1993-05-13	2026-03-03 16:26:51.2151	\N	\N
\.


--
-- TOC entry 4975 (class 0 OID 16455)
-- Dependencies: 222
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, product_name, price) FROM stdin;
65bcdb0d-de19-45a5-ae5f-b3c00e321baa	Arroz	12.31
d92276fa-9d8a-4a01-a3c3-6ccad596096e	Papa	1.44
f7c57630-a5ba-4244-8e30-eb05d2c82b62	Carne	20.00
\.


--
-- TOC entry 4972 (class 0 OID 16413)
-- Dependencies: 219
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.students (id, first_name, is_active, created_at, update_at) FROM stdin;
b2f518ee-4969-4a30-bf85-5929d4be80dc	Jose	t	2026-02-28 16:48:46.781594	\N
6d044b93-0239-4df9-bfdc-6a6af031ffbd	David	t	2026-02-28 16:48:46.781594	\N
fd80b7d2-0727-4996-8913-498a43aad720	Ernesto	t	2026-02-28 16:48:46.781594	\N
\.


--
-- TOC entry 4817 (class 2606 OID 16511)
-- Name: alpha alpha_id_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alpha
    ADD CONSTRAINT alpha_id_pk PRIMARY KEY (id);


--
-- TOC entry 4819 (class 2606 OID 16528)
-- Name: gamma gamma_id_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gamma
    ADD CONSTRAINT gamma_id_pk PRIMARY KEY (id);


--
-- TOC entry 4813 (class 2606 OID 16475)
-- Name: invoices invoices_id_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_id_pk PRIMARY KEY (id);


--
-- TOC entry 4815 (class 2606 OID 16492)
-- Name: invoices_items invoices_items_id_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices_items
    ADD CONSTRAINT invoices_items_id_pk PRIMARY KEY (id);


--
-- TOC entry 4807 (class 2606 OID 16449)
-- Name: jobs jobs_id_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_id_pk PRIMARY KEY (id);


--
-- TOC entry 4801 (class 2606 OID 16504)
-- Name: persons persons_email_uk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_email_uk UNIQUE (email);


--
-- TOC entry 4803 (class 2606 OID 16438)
-- Name: persons persons_first_name_last_name_uk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_first_name_last_name_uk UNIQUE (first_name, last_name);


--
-- TOC entry 4805 (class 2606 OID 16436)
-- Name: persons persons_id_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_id_pk PRIMARY KEY (id);


--
-- TOC entry 4809 (class 2606 OID 16463)
-- Name: products products_id_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_id_pk PRIMARY KEY (id);


--
-- TOC entry 4811 (class 2606 OID 16465)
-- Name: products products_product_name_uk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_name_uk UNIQUE (product_name);


--
-- TOC entry 4799 (class 2606 OID 16424)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- TOC entry 4824 (class 2606 OID 16517)
-- Name: beta beta_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.beta
    ADD CONSTRAINT beta_id_fk FOREIGN KEY (id) REFERENCES public.alpha(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4822 (class 2606 OID 16493)
-- Name: invoices_items invoices_items_invoices_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices_items
    ADD CONSTRAINT invoices_items_invoices_id_fk FOREIGN KEY (invoice_id) REFERENCES public.invoices(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4823 (class 2606 OID 16498)
-- Name: invoices_items invoices_items_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices_items
    ADD CONSTRAINT invoices_items_products_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4821 (class 2606 OID 16476)
-- Name: invoices invoices_persons_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_persons_id_fk FOREIGN KEY (persons_id) REFERENCES public.persons(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4820 (class 2606 OID 16450)
-- Name: jobs jobs_persons_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_persons_id_fk FOREIGN KEY (persons_id) REFERENCES public.persons(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2026-03-03 13:02:25

--
-- PostgreSQL database dump complete
--

\unrestrict r5FXCyIzhQEk9TNDjwI2hqLCmMxJOL393R4N1EF4SG7qUt7TfIYnskhHywTn4sp

