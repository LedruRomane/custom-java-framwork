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
-- Data for Name: baggage; Type: TABLE DATA; Schema: public; Owner: catalogue
--

INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', true, 10, 'v-createCompany()-0-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', false, 20, 'v-createCompany()-1-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 20, 'v-createCompany()-1-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', true, 30, 'v-createCompany()-1-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 30, 'v-createCompany()-1-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, false, 'p-createCompany()-2', false, 30, 'v-createCompany()-1-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', true, 40, 'v-createCompany()-2-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, false, 'p-createCompany()-1', false, 40, 'v-createCompany()-2-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, true, 'p-createCompany()-2', false, 40, 'v-createCompany()-2-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, false, 'p-createCompany()-3', true, 40, 'v-createCompany()-2-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', false, 50, 'v-createCompany()-2-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, false, 'p-createCompany()-1', false, 50, 'v-createCompany()-2-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, true, 'p-createCompany()-2', true, 50, 'v-createCompany()-2-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, false, 'p-createCompany()-3', false, 50, 'v-createCompany()-2-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, true, 'p-createCompany()-4', false, 50, 'v-createCompany()-2-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', true, 60, 'v-createCompany()-2-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 60, 'v-createCompany()-2-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, false, 'p-createCompany()-2', false, 60, 'v-createCompany()-2-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, true, 'p-createCompany()-3', true, 60, 'v-createCompany()-2-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, false, 'p-createCompany()-4', false, 60, 'v-createCompany()-2-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, true, 'p-createCompany()-5', false, 60, 'v-createCompany()-2-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', true, 70, 'v-createCompany()-3-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 70, 'v-createCompany()-3-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, false, 'p-createCompany()-2', false, 70, 'v-createCompany()-3-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, true, 'p-createCompany()-3', true, 70, 'v-createCompany()-3-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, false, 'p-createCompany()-4', false, 70, 'v-createCompany()-3-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, true, 'p-createCompany()-5', false, 70, 'v-createCompany()-3-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, false, 'p-createCompany()-6', true, 70, 'v-createCompany()-3-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', false, 80, 'v-createCompany()-3-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, false, 'p-createCompany()-1', false, 80, 'v-createCompany()-3-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, true, 'p-createCompany()-2', true, 80, 'v-createCompany()-3-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, false, 'p-createCompany()-3', false, 80, 'v-createCompany()-3-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, true, 'p-createCompany()-4', false, 80, 'v-createCompany()-3-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, false, 'p-createCompany()-5', true, 80, 'v-createCompany()-3-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, true, 'p-createCompany()-6', false, 80, 'v-createCompany()-3-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, false, 'p-createCompany()-7', false, 80, 'v-createCompany()-3-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', true, 90, 'v-createCompany()-3-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, false, 'p-createCompany()-1', false, 90, 'v-createCompany()-3-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, true, 'p-createCompany()-2', false, 90, 'v-createCompany()-3-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, false, 'p-createCompany()-3', true, 90, 'v-createCompany()-3-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, true, 'p-createCompany()-4', false, 90, 'v-createCompany()-3-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, false, 'p-createCompany()-5', false, 90, 'v-createCompany()-3-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, true, 'p-createCompany()-6', true, 90, 'v-createCompany()-3-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, false, 'p-createCompany()-7', false, 90, 'v-createCompany()-3-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, true, 'p-createCompany()-8', false, 90, 'v-createCompany()-3-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', true, 100, 'v-createCompany()-3-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 100, 'v-createCompany()-3-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, false, 'p-createCompany()-2', false, 100, 'v-createCompany()-3-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, true, 'p-createCompany()-3', true, 100, 'v-createCompany()-3-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, false, 'p-createCompany()-4', false, 100, 'v-createCompany()-3-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, true, 'p-createCompany()-5', false, 100, 'v-createCompany()-3-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, false, 'p-createCompany()-6', true, 100, 'v-createCompany()-3-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, true, 'p-createCompany()-7', false, 100, 'v-createCompany()-3-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, false, 'p-createCompany()-8', false, 100, 'v-createCompany()-3-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, true, 'p-createCompany()-9', true, 100, 'v-createCompany()-3-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', false, 110, 'v-createCompany()-4-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 110, 'v-createCompany()-4-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, false, 'p-createCompany()-2', true, 110, 'v-createCompany()-4-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, true, 'p-createCompany()-3', false, 110, 'v-createCompany()-4-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, false, 'p-createCompany()-4', false, 110, 'v-createCompany()-4-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, true, 'p-createCompany()-5', true, 110, 'v-createCompany()-4-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, false, 'p-createCompany()-6', false, 110, 'v-createCompany()-4-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, true, 'p-createCompany()-7', false, 110, 'v-createCompany()-4-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, false, 'p-createCompany()-8', true, 110, 'v-createCompany()-4-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, true, 'p-createCompany()-9', false, 110, 'v-createCompany()-4-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, false, 'p-createCompany()-10', false, 110, 'v-createCompany()-4-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', true, 120, 'v-createCompany()-4-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, false, 'p-createCompany()-1', false, 120, 'v-createCompany()-4-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, true, 'p-createCompany()-2', false, 120, 'v-createCompany()-4-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, false, 'p-createCompany()-3', true, 120, 'v-createCompany()-4-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, true, 'p-createCompany()-4', false, 120, 'v-createCompany()-4-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, false, 'p-createCompany()-5', false, 120, 'v-createCompany()-4-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, true, 'p-createCompany()-6', true, 120, 'v-createCompany()-4-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, false, 'p-createCompany()-7', false, 120, 'v-createCompany()-4-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, true, 'p-createCompany()-8', false, 120, 'v-createCompany()-4-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, false, 'p-createCompany()-9', true, 120, 'v-createCompany()-4-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, true, 'p-createCompany()-10', false, 120, 'v-createCompany()-4-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, false, 'p-createCompany()-11', false, 120, 'v-createCompany()-4-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', true, 130, 'v-createCompany()-4-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, false, 'p-createCompany()-1', false, 130, 'v-createCompany()-4-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, true, 'p-createCompany()-2', false, 130, 'v-createCompany()-4-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, false, 'p-createCompany()-3', true, 130, 'v-createCompany()-4-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, true, 'p-createCompany()-4', false, 130, 'v-createCompany()-4-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, false, 'p-createCompany()-5', false, 130, 'v-createCompany()-4-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, true, 'p-createCompany()-6', true, 130, 'v-createCompany()-4-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, false, 'p-createCompany()-7', false, 130, 'v-createCompany()-4-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, true, 'p-createCompany()-8', false, 130, 'v-createCompany()-4-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, false, 'p-createCompany()-9', true, 130, 'v-createCompany()-4-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, true, 'p-createCompany()-10', false, 130, 'v-createCompany()-4-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, false, 'p-createCompany()-11', false, 130, 'v-createCompany()-4-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, true, 'p-createCompany()-12', true, 130, 'v-createCompany()-4-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', false, 140, 'v-createCompany()-4-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 140, 'v-createCompany()-4-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, false, 'p-createCompany()-2', true, 140, 'v-createCompany()-4-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, true, 'p-createCompany()-3', false, 140, 'v-createCompany()-4-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, false, 'p-createCompany()-4', false, 140, 'v-createCompany()-4-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, true, 'p-createCompany()-5', true, 140, 'v-createCompany()-4-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, false, 'p-createCompany()-6', false, 140, 'v-createCompany()-4-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, true, 'p-createCompany()-7', false, 140, 'v-createCompany()-4-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, false, 'p-createCompany()-8', true, 140, 'v-createCompany()-4-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, true, 'p-createCompany()-9', false, 140, 'v-createCompany()-4-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, false, 'p-createCompany()-10', false, 140, 'v-createCompany()-4-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, true, 'p-createCompany()-11', true, 140, 'v-createCompany()-4-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, false, 'p-createCompany()-12', false, 140, 'v-createCompany()-4-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, true, 'p-createCompany()-13', false, 140, 'v-createCompany()-4-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', true, 150, 'v-createCompany()-4-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 150, 'v-createCompany()-4-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, false, 'p-createCompany()-2', false, 150, 'v-createCompany()-4-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, true, 'p-createCompany()-3', true, 150, 'v-createCompany()-4-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, false, 'p-createCompany()-4', false, 150, 'v-createCompany()-4-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, true, 'p-createCompany()-5', false, 150, 'v-createCompany()-4-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, false, 'p-createCompany()-6', true, 150, 'v-createCompany()-4-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, true, 'p-createCompany()-7', false, 150, 'v-createCompany()-4-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, false, 'p-createCompany()-8', false, 150, 'v-createCompany()-4-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, true, 'p-createCompany()-9', true, 150, 'v-createCompany()-4-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, false, 'p-createCompany()-10', false, 150, 'v-createCompany()-4-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, true, 'p-createCompany()-11', false, 150, 'v-createCompany()-4-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, false, 'p-createCompany()-12', true, 150, 'v-createCompany()-4-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, true, 'p-createCompany()-13', false, 150, 'v-createCompany()-4-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, false, 'p-createCompany()-14', false, 150, 'v-createCompany()-4-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', true, 160, 'v-createCompany()-5-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, false, 'p-createCompany()-1', false, 160, 'v-createCompany()-5-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, true, 'p-createCompany()-2', false, 160, 'v-createCompany()-5-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, false, 'p-createCompany()-3', true, 160, 'v-createCompany()-5-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, true, 'p-createCompany()-4', false, 160, 'v-createCompany()-5-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, false, 'p-createCompany()-5', false, 160, 'v-createCompany()-5-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, true, 'p-createCompany()-6', true, 160, 'v-createCompany()-5-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, false, 'p-createCompany()-7', false, 160, 'v-createCompany()-5-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, true, 'p-createCompany()-8', false, 160, 'v-createCompany()-5-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, false, 'p-createCompany()-9', true, 160, 'v-createCompany()-5-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, true, 'p-createCompany()-10', false, 160, 'v-createCompany()-5-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, false, 'p-createCompany()-11', false, 160, 'v-createCompany()-5-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, true, 'p-createCompany()-12', true, 160, 'v-createCompany()-5-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, false, 'p-createCompany()-13', false, 160, 'v-createCompany()-5-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, true, 'p-createCompany()-14', false, 160, 'v-createCompany()-5-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, false, 'p-createCompany()-15', true, 160, 'v-createCompany()-5-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', false, 170, 'v-createCompany()-5-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, false, 'p-createCompany()-1', false, 170, 'v-createCompany()-5-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, true, 'p-createCompany()-2', true, 170, 'v-createCompany()-5-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, false, 'p-createCompany()-3', false, 170, 'v-createCompany()-5-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, true, 'p-createCompany()-4', false, 170, 'v-createCompany()-5-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, false, 'p-createCompany()-5', true, 170, 'v-createCompany()-5-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, true, 'p-createCompany()-6', false, 170, 'v-createCompany()-5-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, false, 'p-createCompany()-7', false, 170, 'v-createCompany()-5-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, true, 'p-createCompany()-8', true, 170, 'v-createCompany()-5-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, false, 'p-createCompany()-9', false, 170, 'v-createCompany()-5-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, true, 'p-createCompany()-10', false, 170, 'v-createCompany()-5-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, false, 'p-createCompany()-11', true, 170, 'v-createCompany()-5-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, true, 'p-createCompany()-12', false, 170, 'v-createCompany()-5-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, false, 'p-createCompany()-13', false, 170, 'v-createCompany()-5-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, true, 'p-createCompany()-14', true, 170, 'v-createCompany()-5-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, false, 'p-createCompany()-15', false, 170, 'v-createCompany()-5-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, true, 'p-createCompany()-16', false, 170, 'v-createCompany()-5-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', true, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, false, 'p-createCompany()-2', false, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, true, 'p-createCompany()-3', true, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, false, 'p-createCompany()-4', false, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, true, 'p-createCompany()-5', false, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, false, 'p-createCompany()-6', true, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, true, 'p-createCompany()-7', false, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, false, 'p-createCompany()-8', false, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, true, 'p-createCompany()-9', true, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, false, 'p-createCompany()-10', false, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, true, 'p-createCompany()-11', false, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, false, 'p-createCompany()-12', true, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, true, 'p-createCompany()-13', false, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, false, 'p-createCompany()-14', false, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, true, 'p-createCompany()-15', true, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, false, 'p-createCompany()-16', false, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, true, 'p-createCompany()-17', false, 180, 'v-createCompany()-5-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', true, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, false, 'p-createCompany()-2', false, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, true, 'p-createCompany()-3', true, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, false, 'p-createCompany()-4', false, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, true, 'p-createCompany()-5', false, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, false, 'p-createCompany()-6', true, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, true, 'p-createCompany()-7', false, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, false, 'p-createCompany()-8', false, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, true, 'p-createCompany()-9', true, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, false, 'p-createCompany()-10', false, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, true, 'p-createCompany()-11', false, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, false, 'p-createCompany()-12', true, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, true, 'p-createCompany()-13', false, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, false, 'p-createCompany()-14', false, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, true, 'p-createCompany()-15', true, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, false, 'p-createCompany()-16', false, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, true, 'p-createCompany()-17', false, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, false, 'p-createCompany()-18', true, 190, 'v-createCompany()-5-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', false, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, false, 'p-createCompany()-1', false, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, true, 'p-createCompany()-2', true, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, false, 'p-createCompany()-3', false, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, true, 'p-createCompany()-4', false, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, false, 'p-createCompany()-5', true, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, true, 'p-createCompany()-6', false, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, false, 'p-createCompany()-7', false, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, true, 'p-createCompany()-8', true, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, false, 'p-createCompany()-9', false, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, true, 'p-createCompany()-10', false, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, false, 'p-createCompany()-11', true, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, true, 'p-createCompany()-12', false, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, false, 'p-createCompany()-13', false, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, true, 'p-createCompany()-14', true, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, false, 'p-createCompany()-15', false, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, true, 'p-createCompany()-16', false, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, false, 'p-createCompany()-17', true, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, true, 'p-createCompany()-18', false, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (20, false, 'p-createCompany()-19', false, 200, 'v-createCompany()-5-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', true, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, false, 'p-createCompany()-1', false, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, true, 'p-createCompany()-2', false, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, false, 'p-createCompany()-3', true, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, true, 'p-createCompany()-4', false, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, false, 'p-createCompany()-5', false, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, true, 'p-createCompany()-6', true, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, false, 'p-createCompany()-7', false, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, true, 'p-createCompany()-8', false, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, false, 'p-createCompany()-9', true, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, true, 'p-createCompany()-10', false, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, false, 'p-createCompany()-11', false, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, true, 'p-createCompany()-12', true, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, false, 'p-createCompany()-13', false, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, true, 'p-createCompany()-14', false, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, false, 'p-createCompany()-15', true, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, true, 'p-createCompany()-16', false, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, false, 'p-createCompany()-17', false, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, true, 'p-createCompany()-18', true, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (20, false, 'p-createCompany()-19', false, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (21, true, 'p-createCompany()-20', false, 210, 'v-createCompany()-5-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', true, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, false, 'p-createCompany()-2', false, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, true, 'p-createCompany()-3', true, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, false, 'p-createCompany()-4', false, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, true, 'p-createCompany()-5', false, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, false, 'p-createCompany()-6', true, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, true, 'p-createCompany()-7', false, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, false, 'p-createCompany()-8', false, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, true, 'p-createCompany()-9', true, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, false, 'p-createCompany()-10', false, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, true, 'p-createCompany()-11', false, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, false, 'p-createCompany()-12', true, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, true, 'p-createCompany()-13', false, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, false, 'p-createCompany()-14', false, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, true, 'p-createCompany()-15', true, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, false, 'p-createCompany()-16', false, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, true, 'p-createCompany()-17', false, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, false, 'p-createCompany()-18', true, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (20, true, 'p-createCompany()-19', false, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (21, false, 'p-createCompany()-20', false, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (22, true, 'p-createCompany()-21', true, 220, 'v-createCompany()-6-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', false, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, false, 'p-createCompany()-2', true, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, true, 'p-createCompany()-3', false, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, false, 'p-createCompany()-4', false, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, true, 'p-createCompany()-5', true, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, false, 'p-createCompany()-6', false, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, true, 'p-createCompany()-7', false, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, false, 'p-createCompany()-8', true, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, true, 'p-createCompany()-9', false, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, false, 'p-createCompany()-10', false, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, true, 'p-createCompany()-11', true, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, false, 'p-createCompany()-12', false, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, true, 'p-createCompany()-13', false, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, false, 'p-createCompany()-14', true, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, true, 'p-createCompany()-15', false, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, false, 'p-createCompany()-16', false, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, true, 'p-createCompany()-17', true, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, false, 'p-createCompany()-18', false, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (20, true, 'p-createCompany()-19', false, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (21, false, 'p-createCompany()-20', true, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (22, true, 'p-createCompany()-21', false, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (23, false, 'p-createCompany()-22', false, 230, 'v-createCompany()-6-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', true, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, false, 'p-createCompany()-1', false, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, true, 'p-createCompany()-2', false, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, false, 'p-createCompany()-3', true, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, true, 'p-createCompany()-4', false, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, false, 'p-createCompany()-5', false, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, true, 'p-createCompany()-6', true, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, false, 'p-createCompany()-7', false, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, true, 'p-createCompany()-8', false, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, false, 'p-createCompany()-9', true, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, true, 'p-createCompany()-10', false, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, false, 'p-createCompany()-11', false, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, true, 'p-createCompany()-12', true, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, false, 'p-createCompany()-13', false, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, true, 'p-createCompany()-14', false, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, false, 'p-createCompany()-15', true, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, true, 'p-createCompany()-16', false, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, false, 'p-createCompany()-17', false, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, true, 'p-createCompany()-18', true, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (20, false, 'p-createCompany()-19', false, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (21, true, 'p-createCompany()-20', false, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (22, false, 'p-createCompany()-21', true, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (23, true, 'p-createCompany()-22', false, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (24, false, 'p-createCompany()-23', false, 240, 'v-createCompany()-6-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', true, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, false, 'p-createCompany()-1', false, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, true, 'p-createCompany()-2', false, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, false, 'p-createCompany()-3', true, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, true, 'p-createCompany()-4', false, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, false, 'p-createCompany()-5', false, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, true, 'p-createCompany()-6', true, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, false, 'p-createCompany()-7', false, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, true, 'p-createCompany()-8', false, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, false, 'p-createCompany()-9', true, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, true, 'p-createCompany()-10', false, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, false, 'p-createCompany()-11', false, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, true, 'p-createCompany()-12', true, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, false, 'p-createCompany()-13', false, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, true, 'p-createCompany()-14', false, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, false, 'p-createCompany()-15', true, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, true, 'p-createCompany()-16', false, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, false, 'p-createCompany()-17', false, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, true, 'p-createCompany()-18', true, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (20, false, 'p-createCompany()-19', false, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (21, true, 'p-createCompany()-20', false, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (22, false, 'p-createCompany()-21', true, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (23, true, 'p-createCompany()-22', false, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (24, false, 'p-createCompany()-23', false, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (25, true, 'p-createCompany()-24', true, 250, 'v-createCompany()-6-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, false, 'p-createCompany()-2', true, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, true, 'p-createCompany()-3', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, false, 'p-createCompany()-4', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, true, 'p-createCompany()-5', true, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, false, 'p-createCompany()-6', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, true, 'p-createCompany()-7', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, false, 'p-createCompany()-8', true, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, true, 'p-createCompany()-9', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, false, 'p-createCompany()-10', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, true, 'p-createCompany()-11', true, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, false, 'p-createCompany()-12', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, true, 'p-createCompany()-13', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, false, 'p-createCompany()-14', true, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, true, 'p-createCompany()-15', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, false, 'p-createCompany()-16', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, true, 'p-createCompany()-17', true, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, false, 'p-createCompany()-18', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (20, true, 'p-createCompany()-19', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (21, false, 'p-createCompany()-20', true, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (22, true, 'p-createCompany()-21', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (23, false, 'p-createCompany()-22', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (24, true, 'p-createCompany()-23', true, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (25, false, 'p-createCompany()-24', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (26, true, 'p-createCompany()-25', false, 260, 'v-createCompany()-6-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', true, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, false, 'p-createCompany()-2', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, true, 'p-createCompany()-3', true, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, false, 'p-createCompany()-4', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, true, 'p-createCompany()-5', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, false, 'p-createCompany()-6', true, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, true, 'p-createCompany()-7', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, false, 'p-createCompany()-8', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, true, 'p-createCompany()-9', true, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, false, 'p-createCompany()-10', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, true, 'p-createCompany()-11', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, false, 'p-createCompany()-12', true, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, true, 'p-createCompany()-13', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, false, 'p-createCompany()-14', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, true, 'p-createCompany()-15', true, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, false, 'p-createCompany()-16', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, true, 'p-createCompany()-17', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, false, 'p-createCompany()-18', true, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (20, true, 'p-createCompany()-19', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (21, false, 'p-createCompany()-20', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (22, true, 'p-createCompany()-21', true, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (23, false, 'p-createCompany()-22', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (24, true, 'p-createCompany()-23', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (25, false, 'p-createCompany()-24', true, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (26, true, 'p-createCompany()-25', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (27, false, 'p-createCompany()-26', false, 270, 'v-createCompany()-6-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', true, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, false, 'p-createCompany()-1', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, true, 'p-createCompany()-2', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, false, 'p-createCompany()-3', true, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, true, 'p-createCompany()-4', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, false, 'p-createCompany()-5', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, true, 'p-createCompany()-6', true, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, false, 'p-createCompany()-7', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, true, 'p-createCompany()-8', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, false, 'p-createCompany()-9', true, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, true, 'p-createCompany()-10', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, false, 'p-createCompany()-11', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, true, 'p-createCompany()-12', true, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, false, 'p-createCompany()-13', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, true, 'p-createCompany()-14', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, false, 'p-createCompany()-15', true, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, true, 'p-createCompany()-16', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, false, 'p-createCompany()-17', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, true, 'p-createCompany()-18', true, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (20, false, 'p-createCompany()-19', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (21, true, 'p-createCompany()-20', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (22, false, 'p-createCompany()-21', true, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (23, true, 'p-createCompany()-22', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (24, false, 'p-createCompany()-23', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (25, true, 'p-createCompany()-24', true, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (26, false, 'p-createCompany()-25', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (27, true, 'p-createCompany()-26', false, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (28, false, 'p-createCompany()-27', true, 280, 'v-createCompany()-6-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, false, 'p-createCompany()-1', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, true, 'p-createCompany()-2', true, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, false, 'p-createCompany()-3', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, true, 'p-createCompany()-4', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, false, 'p-createCompany()-5', true, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, true, 'p-createCompany()-6', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, false, 'p-createCompany()-7', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, true, 'p-createCompany()-8', true, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, false, 'p-createCompany()-9', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, true, 'p-createCompany()-10', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, false, 'p-createCompany()-11', true, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, true, 'p-createCompany()-12', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, false, 'p-createCompany()-13', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, true, 'p-createCompany()-14', true, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, false, 'p-createCompany()-15', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, true, 'p-createCompany()-16', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, false, 'p-createCompany()-17', true, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, true, 'p-createCompany()-18', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (20, false, 'p-createCompany()-19', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (21, true, 'p-createCompany()-20', true, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (22, false, 'p-createCompany()-21', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (23, true, 'p-createCompany()-22', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (24, false, 'p-createCompany()-23', true, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (25, true, 'p-createCompany()-24', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (26, false, 'p-createCompany()-25', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (27, true, 'p-createCompany()-26', true, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (28, false, 'p-createCompany()-27', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (29, true, 'p-createCompany()-28', false, 290, 'v-createCompany()-7-0');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', true, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, false, 'p-createCompany()-2', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, true, 'p-createCompany()-3', true, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, false, 'p-createCompany()-4', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, true, 'p-createCompany()-5', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, false, 'p-createCompany()-6', true, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, true, 'p-createCompany()-7', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, false, 'p-createCompany()-8', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, true, 'p-createCompany()-9', true, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, false, 'p-createCompany()-10', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, true, 'p-createCompany()-11', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, false, 'p-createCompany()-12', true, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, true, 'p-createCompany()-13', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, false, 'p-createCompany()-14', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, true, 'p-createCompany()-15', true, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, false, 'p-createCompany()-16', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, true, 'p-createCompany()-17', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, false, 'p-createCompany()-18', true, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (20, true, 'p-createCompany()-19', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (21, false, 'p-createCompany()-20', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (22, true, 'p-createCompany()-21', true, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (23, false, 'p-createCompany()-22', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (24, true, 'p-createCompany()-23', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (25, false, 'p-createCompany()-24', true, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (26, true, 'p-createCompany()-25', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (27, false, 'p-createCompany()-26', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (28, true, 'p-createCompany()-27', true, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (29, false, 'p-createCompany()-28', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (30, true, 'p-createCompany()-29', false, 300, 'v-createCompany()-7-1');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', true, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, false, 'p-createCompany()-2', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, true, 'p-createCompany()-3', true, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, false, 'p-createCompany()-4', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, true, 'p-createCompany()-5', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, false, 'p-createCompany()-6', true, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, true, 'p-createCompany()-7', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, false, 'p-createCompany()-8', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, true, 'p-createCompany()-9', true, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, false, 'p-createCompany()-10', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, true, 'p-createCompany()-11', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, false, 'p-createCompany()-12', true, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, true, 'p-createCompany()-13', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, false, 'p-createCompany()-14', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, true, 'p-createCompany()-15', true, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, false, 'p-createCompany()-16', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, true, 'p-createCompany()-17', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, false, 'p-createCompany()-18', true, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (20, true, 'p-createCompany()-19', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (21, false, 'p-createCompany()-20', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (22, true, 'p-createCompany()-21', true, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (23, false, 'p-createCompany()-22', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (24, true, 'p-createCompany()-23', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (25, false, 'p-createCompany()-24', true, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (26, true, 'p-createCompany()-25', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (27, false, 'p-createCompany()-26', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (28, true, 'p-createCompany()-27', true, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (29, false, 'p-createCompany()-28', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (30, true, 'p-createCompany()-29', false, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (31, false, 'p-createCompany()-30', true, 310, 'v-createCompany()-7-2');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, false, 'p-createCompany()-1', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, true, 'p-createCompany()-2', true, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, false, 'p-createCompany()-3', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, true, 'p-createCompany()-4', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, false, 'p-createCompany()-5', true, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, true, 'p-createCompany()-6', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, false, 'p-createCompany()-7', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, true, 'p-createCompany()-8', true, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, false, 'p-createCompany()-9', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, true, 'p-createCompany()-10', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, false, 'p-createCompany()-11', true, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, true, 'p-createCompany()-12', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, false, 'p-createCompany()-13', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, true, 'p-createCompany()-14', true, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, false, 'p-createCompany()-15', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, true, 'p-createCompany()-16', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, false, 'p-createCompany()-17', true, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, true, 'p-createCompany()-18', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (20, false, 'p-createCompany()-19', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (21, true, 'p-createCompany()-20', true, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (22, false, 'p-createCompany()-21', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (23, true, 'p-createCompany()-22', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (24, false, 'p-createCompany()-23', true, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (25, true, 'p-createCompany()-24', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (26, false, 'p-createCompany()-25', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (27, true, 'p-createCompany()-26', true, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (28, false, 'p-createCompany()-27', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (29, true, 'p-createCompany()-28', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (30, false, 'p-createCompany()-29', true, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (31, true, 'p-createCompany()-30', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (32, false, 'p-createCompany()-31', false, 320, 'v-createCompany()-7-3');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', true, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, false, 'p-createCompany()-1', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, true, 'p-createCompany()-2', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, false, 'p-createCompany()-3', true, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, true, 'p-createCompany()-4', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, false, 'p-createCompany()-5', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, true, 'p-createCompany()-6', true, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, false, 'p-createCompany()-7', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, true, 'p-createCompany()-8', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, false, 'p-createCompany()-9', true, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, true, 'p-createCompany()-10', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, false, 'p-createCompany()-11', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, true, 'p-createCompany()-12', true, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, false, 'p-createCompany()-13', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, true, 'p-createCompany()-14', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, false, 'p-createCompany()-15', true, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, true, 'p-createCompany()-16', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, false, 'p-createCompany()-17', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, true, 'p-createCompany()-18', true, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (20, false, 'p-createCompany()-19', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (21, true, 'p-createCompany()-20', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (22, false, 'p-createCompany()-21', true, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (23, true, 'p-createCompany()-22', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (24, false, 'p-createCompany()-23', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (25, true, 'p-createCompany()-24', true, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (26, false, 'p-createCompany()-25', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (27, true, 'p-createCompany()-26', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (28, false, 'p-createCompany()-27', true, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (29, true, 'p-createCompany()-28', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (30, false, 'p-createCompany()-29', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (31, true, 'p-createCompany()-30', true, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (32, false, 'p-createCompany()-31', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (33, true, 'p-createCompany()-32', false, 330, 'v-createCompany()-7-4');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', true, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, false, 'p-createCompany()-2', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, true, 'p-createCompany()-3', true, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, false, 'p-createCompany()-4', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, true, 'p-createCompany()-5', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, false, 'p-createCompany()-6', true, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, true, 'p-createCompany()-7', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, false, 'p-createCompany()-8', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, true, 'p-createCompany()-9', true, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, false, 'p-createCompany()-10', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, true, 'p-createCompany()-11', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, false, 'p-createCompany()-12', true, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, true, 'p-createCompany()-13', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, false, 'p-createCompany()-14', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, true, 'p-createCompany()-15', true, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, false, 'p-createCompany()-16', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, true, 'p-createCompany()-17', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, false, 'p-createCompany()-18', true, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (20, true, 'p-createCompany()-19', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (21, false, 'p-createCompany()-20', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (22, true, 'p-createCompany()-21', true, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (23, false, 'p-createCompany()-22', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (24, true, 'p-createCompany()-23', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (25, false, 'p-createCompany()-24', true, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (26, true, 'p-createCompany()-25', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (27, false, 'p-createCompany()-26', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (28, true, 'p-createCompany()-27', true, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (29, false, 'p-createCompany()-28', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (30, true, 'p-createCompany()-29', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (31, false, 'p-createCompany()-30', true, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (32, true, 'p-createCompany()-31', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (33, false, 'p-createCompany()-32', false, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (34, true, 'p-createCompany()-33', true, 340, 'v-createCompany()-7-5');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, false, 'p-createCompany()-0', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, true, 'p-createCompany()-1', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, false, 'p-createCompany()-2', true, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, true, 'p-createCompany()-3', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, false, 'p-createCompany()-4', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, true, 'p-createCompany()-5', true, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, false, 'p-createCompany()-6', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, true, 'p-createCompany()-7', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, false, 'p-createCompany()-8', true, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, true, 'p-createCompany()-9', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, false, 'p-createCompany()-10', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, true, 'p-createCompany()-11', true, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, false, 'p-createCompany()-12', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, true, 'p-createCompany()-13', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, false, 'p-createCompany()-14', true, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, true, 'p-createCompany()-15', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, false, 'p-createCompany()-16', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, true, 'p-createCompany()-17', true, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, false, 'p-createCompany()-18', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (20, true, 'p-createCompany()-19', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (21, false, 'p-createCompany()-20', true, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (22, true, 'p-createCompany()-21', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (23, false, 'p-createCompany()-22', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (24, true, 'p-createCompany()-23', true, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (25, false, 'p-createCompany()-24', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (26, true, 'p-createCompany()-25', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (27, false, 'p-createCompany()-26', true, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (28, true, 'p-createCompany()-27', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (29, false, 'p-createCompany()-28', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (30, true, 'p-createCompany()-29', true, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (31, false, 'p-createCompany()-30', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (32, true, 'p-createCompany()-31', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (33, false, 'p-createCompany()-32', true, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (34, true, 'p-createCompany()-33', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (35, false, 'p-createCompany()-34', false, 350, 'v-createCompany()-7-6');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (1, true, 'p-createCompany()-0', true, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (2, false, 'p-createCompany()-1', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (3, true, 'p-createCompany()-2', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (4, false, 'p-createCompany()-3', true, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (5, true, 'p-createCompany()-4', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (6, false, 'p-createCompany()-5', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (7, true, 'p-createCompany()-6', true, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (8, false, 'p-createCompany()-7', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (9, true, 'p-createCompany()-8', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (10, false, 'p-createCompany()-9', true, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (11, true, 'p-createCompany()-10', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (12, false, 'p-createCompany()-11', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (13, true, 'p-createCompany()-12', true, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (14, false, 'p-createCompany()-13', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (15, true, 'p-createCompany()-14', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (16, false, 'p-createCompany()-15', true, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (17, true, 'p-createCompany()-16', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (18, false, 'p-createCompany()-17', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (19, true, 'p-createCompany()-18', true, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (20, false, 'p-createCompany()-19', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (21, true, 'p-createCompany()-20', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (22, false, 'p-createCompany()-21', true, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (23, true, 'p-createCompany()-22', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (24, false, 'p-createCompany()-23', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (25, true, 'p-createCompany()-24', true, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (26, false, 'p-createCompany()-25', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (27, true, 'p-createCompany()-26', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (28, false, 'p-createCompany()-27', true, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (29, true, 'p-createCompany()-28', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (30, false, 'p-createCompany()-29', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (31, true, 'p-createCompany()-30', true, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (32, false, 'p-createCompany()-31', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (33, true, 'p-createCompany()-32', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (34, false, 'p-createCompany()-33', true, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (35, true, 'p-createCompany()-34', false, 360, 'v-createCompany()-7-7');
INSERT INTO public.baggage (numero, delivre, passenger, recupere, weight, flight_id) VALUES (36, false, 'p-createCompany()-35', false, 360, 'v-createCompany()-7-7');


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: catalogue
--

INSERT INTO public.company (id) VALUES ('c-createCompany()-0');
INSERT INTO public.company (id) VALUES ('c-createCompany()-1');
INSERT INTO public.company (id) VALUES ('c-createCompany()-2');
INSERT INTO public.company (id) VALUES ('c-createCompany()-3');
INSERT INTO public.company (id) VALUES ('c-createCompany()-4');
INSERT INTO public.company (id) VALUES ('c-createCompany()-5');
INSERT INTO public.company (id) VALUES ('c-createCompany()-6');
INSERT INTO public.company (id) VALUES ('c-createCompany()-7');


--
-- Data for Name: flight; Type: TABLE DATA; Schema: public; Owner: catalogue
--

INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-0-0', false, 2, 'livraison-0-0', 'c-createCompany()-0');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-1-0', true, 3, 'livraison-1-0', 'c-createCompany()-1');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-1-1', true, 4, 'livraison-1-1', 'c-createCompany()-1');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-2-0', false, 5, 'livraison-2-0', 'c-createCompany()-2');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-2-1', true, 6, 'livraison-2-1', 'c-createCompany()-2');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-2-2', true, 7, 'livraison-2-2', 'c-createCompany()-2');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-3-0', false, 8, 'livraison-3-0', 'c-createCompany()-3');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-3-1', true, 9, 'livraison-3-1', 'c-createCompany()-3');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-3-2', true, 10, 'livraison-3-2', 'c-createCompany()-3');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-3-3', false, 11, 'livraison-3-3', 'c-createCompany()-3');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-4-0', true, 12, 'livraison-4-0', 'c-createCompany()-4');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-4-1', true, 13, 'livraison-4-1', 'c-createCompany()-4');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-4-2', false, 14, 'livraison-4-2', 'c-createCompany()-4');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-4-3', true, 15, 'livraison-4-3', 'c-createCompany()-4');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-4-4', true, 16, 'livraison-4-4', 'c-createCompany()-4');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-5-0', false, 17, 'livraison-5-0', 'c-createCompany()-5');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-5-1', true, 18, 'livraison-5-1', 'c-createCompany()-5');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-5-2', true, 19, 'livraison-5-2', 'c-createCompany()-5');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-5-3', false, 20, 'livraison-5-3', 'c-createCompany()-5');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-5-4', true, 21, 'livraison-5-4', 'c-createCompany()-5');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-5-5', true, 22, 'livraison-5-5', 'c-createCompany()-5');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-6-0', false, 23, 'livraison-6-0', 'c-createCompany()-6');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-6-1', true, 24, 'livraison-6-1', 'c-createCompany()-6');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-6-2', true, 25, 'livraison-6-2', 'c-createCompany()-6');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-6-3', false, 26, 'livraison-6-3', 'c-createCompany()-6');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-6-4', true, 27, 'livraison-6-4', 'c-createCompany()-6');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-6-5', true, 28, 'livraison-6-5', 'c-createCompany()-6');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-6-6', false, 29, 'livraison-6-6', 'c-createCompany()-6');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-7-0', true, 30, 'livraison-7-0', 'c-createCompany()-7');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-7-1', true, 31, 'livraison-7-1', 'c-createCompany()-7');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-7-2', false, 32, 'livraison-7-2', 'c-createCompany()-7');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-7-3', true, 33, 'livraison-7-3', 'c-createCompany()-7');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-7-4', true, 34, 'livraison-7-4', 'c-createCompany()-7');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-7-5', false, 35, 'livraison-7-5', 'c-createCompany()-7');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-7-6', true, 36, 'livraison-7-6', 'c-createCompany()-7');
INSERT INTO public.flight (id, livraisonencours, nextnumerobagage, pointlivraisonbagages, company_id) VALUES ('v-createCompany()-7-7', true, 37, 'livraison-7-7', 'c-createCompany()-7');


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

