--
-- PostgreSQL database dump
--

DROP TABLE IF EXISTS public.baggage;
DROP TABLE IF EXISTS public.flight;
DROP TABLE IF EXISTS public.company;
--
-- Name: baggage; Type: TABLE; Schema: public; Owner: catalogue
--

CREATE TABLE public.baggage (
    numero integer NOT NULL,
    delivre boolean NOT NULL,
    passenger character varying(255),
    recupere boolean NOT NULL,
    weight real NOT NULL,
    flight_id character varying(255) NOT NULL
);


ALTER TABLE public.baggage OWNER TO catalogue;

--
-- Name: company; Type: TABLE; Schema: public; Owner: catalogue
--

CREATE TABLE public.company (
    id character varying(255) NOT NULL
);


ALTER TABLE public.company OWNER TO catalogue;

--
-- Name: flight; Type: TABLE; Schema: public; Owner: catalogue
--

CREATE TABLE public.flight (
    id character varying(255) NOT NULL,
    livraisonencours boolean NOT NULL,
    nextnumerobagage integer NOT NULL,
    pointlivraisonbagages character varying(255),
    company_id character varying(255)
);


ALTER TABLE public.flight OWNER TO catalogue;

--
-- Name: baggage baggage_pkey; Type: CONSTRAINT; Schema: public; Owner: catalogue
--

ALTER TABLE ONLY public.baggage
    ADD CONSTRAINT baggage_pkey PRIMARY KEY (flight_id, numero);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: catalogue
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- Name: flight flight_pkey; Type: CONSTRAINT; Schema: public; Owner: catalogue
--

ALTER TABLE ONLY public.flight
    ADD CONSTRAINT flight_pkey PRIMARY KEY (id);


--
-- Name: baggage fkoooxhuxeoo1nf353cwrkpsy3m; Type: FK CONSTRAINT; Schema: public; Owner: catalogue
--

ALTER TABLE ONLY public.baggage
    ADD CONSTRAINT fkoooxhuxeoo1nf353cwrkpsy3m FOREIGN KEY (flight_id) REFERENCES public.flight(id);


--
-- Name: flight fkr0i7w068ngl9bcduy5qdu1vvk; Type: FK CONSTRAINT; Schema: public; Owner: catalogue
--

ALTER TABLE ONLY public.flight
    ADD CONSTRAINT fkr0i7w068ngl9bcduy5qdu1vvk FOREIGN KEY (company_id) REFERENCES public.company(id);


--
-- PostgreSQL database dump complete
--

