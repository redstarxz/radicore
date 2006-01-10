--
-- PostgreSQL database dump
--

-- Started on 2005-09-14 17:54:52 GMT Standard Time

SET client_encoding = 'UNICODE';
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 11 (class 16672 OID 20624)
-- Name: classroom; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA classroom;


ALTER SCHEMA classroom OWNER TO postgres;

SET search_path = classroom, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1288 (class 1259 OID 20629)
-- Dependencies: 1613 1614 1615 11
-- Name: crs_class; Type: TABLE; Schema: classroom; Owner: postgres; Tablespace: 
--

CREATE TABLE crs_class (
    class_id character varying(8) DEFAULT ''::character varying NOT NULL,
    class_name character varying(40) DEFAULT ''::character varying NOT NULL,
    "year" numeric(1,0),
    class_notes text,
    created_date timestamp without time zone DEFAULT '2000-01-01 00:00:00'::timestamp without time zone NOT NULL,
    created_user character varying(16),
    revised_date timestamp without time zone,
    revised_user character varying(16)
);


ALTER TABLE classroom.crs_class OWNER TO postgres;

--
-- TOC entry 1289 (class 1259 OID 20639)
-- Dependencies: 1616 1617 11
-- Name: crs_class_lesson; Type: TABLE; Schema: classroom; Owner: postgres; Tablespace: 
--

CREATE TABLE crs_class_lesson (
    class_id character varying(8) DEFAULT ''::character varying NOT NULL,
    lesson_id smallint DEFAULT 0::smallint NOT NULL
);


ALTER TABLE classroom.crs_class_lesson OWNER TO postgres;

--
-- TOC entry 1290 (class 1259 OID 20645)
-- Dependencies: 1618 1619 1620 1621 11
-- Name: crs_conflict; Type: TABLE; Schema: classroom; Owner: postgres; Tablespace: 
--

CREATE TABLE crs_conflict (
    conflict_id integer DEFAULT 0 NOT NULL,
    conflict_type character(1) DEFAULT ''::bpchar NOT NULL,
    teacher_id smallint,
    student_id smallint,
    class_id character varying(8),
    lesson_id1 smallint DEFAULT 0::smallint NOT NULL,
    lesson_id2 smallint DEFAULT 0::smallint NOT NULL
);


ALTER TABLE classroom.crs_conflict OWNER TO postgres;

--
-- TOC entry 1291 (class 1259 OID 20654)
-- Dependencies: 1622 1623 1624 11
-- Name: crs_lesson; Type: TABLE; Schema: classroom; Owner: postgres; Tablespace: 
--

CREATE TABLE crs_lesson (
    lesson_id smallint DEFAULT 0::smallint NOT NULL,
    lesson_name character varying(40),
    lesson_short_name character varying(30),
    "year" numeric(1,0),
    teacher_id smallint,
    lesson_notes text,
    subject_id character varying(8) DEFAULT ''::character varying NOT NULL,
    created_date timestamp without time zone DEFAULT '2000-01-01 00:00:00'::timestamp without time zone NOT NULL,
    created_user character varying(16),
    revised_date timestamp without time zone,
    revised_user character varying(16)
);


ALTER TABLE classroom.crs_lesson OWNER TO postgres;

--
-- TOC entry 1292 (class 1259 OID 20664)
-- Dependencies: 1625 1626 1627 1628 11
-- Name: crs_room; Type: TABLE; Schema: classroom; Owner: postgres; Tablespace: 
--

CREATE TABLE crs_room (
    room_id character varying(8) DEFAULT ''::character varying NOT NULL,
    room_desc character varying(40) DEFAULT ''::character varying NOT NULL,
    room_capacity numeric(2,0) DEFAULT 0::numeric NOT NULL,
    room_notes text,
    created_date timestamp without time zone DEFAULT '2000-01-01 00:00:00'::timestamp without time zone NOT NULL,
    created_user character varying(16),
    revised_date timestamp without time zone,
    revised_user character varying(16)
);


ALTER TABLE classroom.crs_room OWNER TO postgres;

--
-- TOC entry 1293 (class 1259 OID 20675)
-- Dependencies: 1629 1630 1631 1632 1633 1634 1635 1636 1637 11
-- Name: crs_schedule; Type: TABLE; Schema: classroom; Owner: postgres; Tablespace: 
--

CREATE TABLE crs_schedule (
    schedule_id smallint DEFAULT 0::smallint NOT NULL,
    seq_no smallint DEFAULT 0::smallint NOT NULL,
    room_id character varying(8) DEFAULT ''::character varying NOT NULL,
    day_no numeric(1,0) DEFAULT 0::numeric NOT NULL,
    start_time time without time zone DEFAULT '00:00:00'::time without time zone NOT NULL,
    end_time time without time zone DEFAULT '00:00:00'::time without time zone NOT NULL,
    lesson_id smallint DEFAULT 0::smallint NOT NULL,
    is_valid character(1) DEFAULT 'N'::bpchar NOT NULL,
    schedule_errors text,
    created_date timestamp without time zone DEFAULT '2000-01-01 00:00:00'::timestamp without time zone NOT NULL,
    created_user character varying(16),
    revised_date timestamp without time zone,
    revised_user character varying(16)
);


ALTER TABLE classroom.crs_schedule OWNER TO postgres;

--
-- TOC entry 1294 (class 1259 OID 20691)
-- Dependencies: 1638 1639 1640 1641 1642 11
-- Name: crs_schedule_hdr; Type: TABLE; Schema: classroom; Owner: postgres; Tablespace: 
--

CREATE TABLE crs_schedule_hdr (
    schedule_id smallint DEFAULT 0::smallint NOT NULL,
    schedule_desc character varying(40),
    schedule_notes text,
    is_active character(1),
    start_time time without time zone DEFAULT '00:00:00'::time without time zone NOT NULL,
    end_time time without time zone DEFAULT '00:00:00'::time without time zone NOT NULL,
    last_day_no numeric(1,0) DEFAULT 0::numeric NOT NULL,
    created_date timestamp without time zone DEFAULT '2000-01-01 00:00:00'::timestamp without time zone NOT NULL,
    created_user character varying(16),
    revised_date timestamp without time zone,
    revised_user character varying(16)
);


ALTER TABLE classroom.crs_schedule_hdr OWNER TO postgres;

--
-- TOC entry 1295 (class 1259 OID 20703)
-- Dependencies: 1643 1644 1645 1646 11
-- Name: crs_student; Type: TABLE; Schema: classroom; Owner: postgres; Tablespace: 
--

CREATE TABLE crs_student (
    student_id smallint DEFAULT 0::smallint NOT NULL,
    first_name character varying(40) DEFAULT ''::character varying NOT NULL,
    last_name character varying(40) DEFAULT ''::character varying NOT NULL,
    initials character varying(4),
    "year" numeric(1,0),
    class_id character varying(8),
    student_notes text,
    created_date timestamp without time zone DEFAULT '2000-01-01 00:00:00'::timestamp without time zone NOT NULL,
    created_user character varying(16),
    revised_date timestamp without time zone,
    revised_user character varying(16)
);


ALTER TABLE classroom.crs_student OWNER TO postgres;

--
-- TOC entry 1296 (class 1259 OID 20714)
-- Dependencies: 1647 1648 11
-- Name: crs_student_lesson; Type: TABLE; Schema: classroom; Owner: postgres; Tablespace: 
--

CREATE TABLE crs_student_lesson (
    student_id smallint DEFAULT 0::smallint NOT NULL,
    lesson_id smallint DEFAULT 0::smallint NOT NULL
);


ALTER TABLE classroom.crs_student_lesson OWNER TO postgres;

--
-- TOC entry 1297 (class 1259 OID 20720)
-- Dependencies: 1649 1650 1651 11
-- Name: crs_subject; Type: TABLE; Schema: classroom; Owner: postgres; Tablespace: 
--

CREATE TABLE crs_subject (
    subject_id character varying(8) DEFAULT ''::character varying NOT NULL,
    subject_name character varying(80) DEFAULT ''::character varying NOT NULL,
    created_date timestamp without time zone DEFAULT '2000-01-01 00:00:00'::timestamp without time zone NOT NULL,
    created_user character varying(16),
    revised_date timestamp without time zone,
    revised_user character varying(16)
);


ALTER TABLE classroom.crs_subject OWNER TO postgres;

--
-- TOC entry 1298 (class 1259 OID 20727)
-- Dependencies: 1652 1653 1654 1655 11
-- Name: crs_teacher; Type: TABLE; Schema: classroom; Owner: postgres; Tablespace: 
--

CREATE TABLE crs_teacher (
    teacher_id smallint DEFAULT 0::smallint NOT NULL,
    first_name character varying(40) DEFAULT ''::character varying NOT NULL,
    last_name character varying(40) DEFAULT ''::character varying NOT NULL,
    initials character varying(4),
    title character varying(4),
    teacher_notes text,
    created_date timestamp without time zone DEFAULT '2000-01-01 00:00:00'::timestamp without time zone NOT NULL,
    created_user character varying(16),
    revised_date timestamp without time zone,
    revised_user character varying(16)
);


ALTER TABLE classroom.crs_teacher OWNER TO postgres;

--
-- TOC entry 1679 (class 0 OID 20629)
-- Dependencies: 1288
-- Data for Name: crs_class; Type: TABLE DATA; Schema: classroom; Owner: postgres
--

INSERT INTO crs_class (class_id, class_name, "year", class_notes, created_date, created_user, revised_date, revised_user) VALUES ('1A', 'Class 1a', 1, NULL, '2004-12-25 19:56:39', 'AJM', '2004-12-26 11:10:44', 'AJM');
INSERT INTO crs_class (class_id, class_name, "year", class_notes, created_date, created_user, revised_date, revised_user) VALUES ('1B', 'Class 1b', 1, NULL, '2004-12-25 19:56:47', 'AJM', '2004-12-26 11:10:52', 'AJM');
INSERT INTO crs_class (class_id, class_name, "year", class_notes, created_date, created_user, revised_date, revised_user) VALUES ('1C', 'Class 1c', 1, 'These are some notes for Class 1c.', '2004-12-25 19:57:11', 'AJM', '2004-12-26 11:10:55', 'AJM');
INSERT INTO crs_class (class_id, class_name, "year", class_notes, created_date, created_user, revised_date, revised_user) VALUES ('2A', 'Class 2a', 2, NULL, '2004-12-27 14:59:28', 'AJM', NULL, NULL);
INSERT INTO crs_class (class_id, class_name, "year", class_notes, created_date, created_user, revised_date, revised_user) VALUES ('2B', 'Class 2b', 2, NULL, '2004-12-27 14:59:38', 'AJM', NULL, NULL);
INSERT INTO crs_class (class_id, class_name, "year", class_notes, created_date, created_user, revised_date, revised_user) VALUES ('2C', 'Class 2c', 2, NULL, '2004-12-27 14:59:47', 'AJM', NULL, NULL);
INSERT INTO crs_class (class_id, class_name, "year", class_notes, created_date, created_user, revised_date, revised_user) VALUES ('3A', 'Class 3a', 3, NULL, '2004-12-27 14:59:58', 'AJM', NULL, NULL);
INSERT INTO crs_class (class_id, class_name, "year", class_notes, created_date, created_user, revised_date, revised_user) VALUES ('3B', 'Class 3b', 3, NULL, '2004-12-27 15:00:13', 'AJM', NULL, NULL);
INSERT INTO crs_class (class_id, class_name, "year", class_notes, created_date, created_user, revised_date, revised_user) VALUES ('3C', 'Class 3c', 3, NULL, '2004-12-27 15:00:21', 'AJM', NULL, NULL);


--
-- TOC entry 1680 (class 0 OID 20639)
-- Dependencies: 1289
-- Data for Name: crs_class_lesson; Type: TABLE DATA; Schema: classroom; Owner: postgres
--

INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1A', 1);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1A', 4);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1A', 7);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1A', 10);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1A', 13);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1A', 16);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1A', 19);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1A', 22);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1A', 25);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1A', 28);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1A', 92);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1A', 95);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1A', 96);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1B', 32);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1B', 38);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1B', 44);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1B', 50);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1B', 56);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1B', 62);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1B', 68);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1B', 74);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1B', 80);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1B', 86);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1B', 93);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1B', 97);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1B', 99);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1C', 33);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1C', 39);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1C', 45);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1C', 51);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1C', 57);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1C', 63);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1C', 69);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1C', 75);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1C', 81);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1C', 87);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1C', 94);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1C', 98);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('1C', 100);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2A', 2);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2A', 5);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2A', 8);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2A', 11);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2A', 14);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2A', 17);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2A', 20);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2A', 23);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2A', 26);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2A', 29);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2B', 34);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2B', 40);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2B', 46);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2B', 52);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2B', 58);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2B', 64);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2B', 70);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2B', 76);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2B', 82);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2B', 88);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2C', 35);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2C', 41);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2C', 47);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2C', 53);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2C', 59);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2C', 65);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2C', 71);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2C', 77);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2C', 83);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('2C', 89);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3A', 3);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3A', 6);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3A', 9);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3A', 12);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3A', 15);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3A', 18);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3A', 21);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3A', 24);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3A', 27);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3A', 30);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3B', 36);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3B', 42);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3B', 48);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3B', 54);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3B', 60);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3B', 66);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3B', 72);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3B', 78);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3B', 84);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3B', 90);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3C', 37);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3C', 43);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3C', 49);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3C', 55);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3C', 61);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3C', 67);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3C', 73);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3C', 79);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3C', 85);
INSERT INTO crs_class_lesson (class_id, lesson_id) VALUES ('3C', 91);


--
-- TOC entry 1681 (class 0 OID 20645)
-- Dependencies: 1290
-- Data for Name: crs_conflict; Type: TABLE DATA; Schema: classroom; Owner: postgres
--

INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1960, 'S', NULL, 260, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1959, 'S', NULL, 260, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1958, 'S', NULL, 248, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1957, 'S', NULL, 248, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1956, 'S', NULL, 241, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1955, 'S', NULL, 241, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1954, 'S', NULL, 215, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1953, 'S', NULL, 215, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1952, 'S', NULL, 179, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1951, 'S', NULL, 179, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1950, 'S', NULL, 165, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1949, 'S', NULL, 165, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1948, 'S', NULL, 159, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1947, 'S', NULL, 159, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1946, 'S', NULL, 116, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1945, 'S', NULL, 116, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1944, 'S', NULL, 35, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1943, 'S', NULL, 35, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1942, 'S', NULL, 23, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1941, 'S', NULL, 23, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1940, 'S', NULL, 22, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1939, 'S', NULL, 22, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1938, 'S', NULL, 20, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1937, 'S', NULL, 20, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1936, 'S', NULL, 19, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1935, 'S', NULL, 19, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1934, 'S', NULL, 18, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1933, 'S', NULL, 18, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1932, 'S', NULL, 14, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1931, 'S', NULL, 14, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1930, 'S', NULL, 13, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1929, 'S', NULL, 13, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1928, 'S', NULL, 12, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1927, 'S', NULL, 12, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1926, 'S', NULL, 11, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1925, 'S', NULL, 11, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1924, 'S', NULL, 9, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1923, 'S', NULL, 9, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1922, 'S', NULL, 8, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1921, 'S', NULL, 8, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1920, 'S', NULL, 7, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1919, 'S', NULL, 7, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1918, 'S', NULL, 6, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1917, 'S', NULL, 6, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1916, 'S', NULL, 5, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1915, 'S', NULL, 5, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1914, 'S', NULL, 4, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1913, 'S', NULL, 4, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1912, 'S', NULL, 3, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1911, 'S', NULL, 3, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1910, 'S', NULL, 2, NULL, 31, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1909, 'S', NULL, 2, NULL, 21, 31);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1908, 'C', NULL, NULL, '3C', 91, 85);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1907, 'C', NULL, NULL, '3C', 85, 91);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1906, 'C', NULL, NULL, '3C', 91, 79);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1905, 'C', NULL, NULL, '3C', 79, 91);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1904, 'C', NULL, NULL, '3C', 85, 79);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1903, 'C', NULL, NULL, '3C', 79, 85);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1902, 'C', NULL, NULL, '3C', 91, 73);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1901, 'C', NULL, NULL, '3C', 73, 91);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1900, 'C', NULL, NULL, '3C', 85, 73);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1899, 'C', NULL, NULL, '3C', 73, 85);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1898, 'C', NULL, NULL, '3C', 79, 73);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1897, 'C', NULL, NULL, '3C', 73, 79);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1896, 'C', NULL, NULL, '3C', 91, 67);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1895, 'C', NULL, NULL, '3C', 67, 91);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1894, 'C', NULL, NULL, '3C', 85, 67);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1893, 'C', NULL, NULL, '3C', 67, 85);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1892, 'C', NULL, NULL, '3C', 79, 67);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1891, 'C', NULL, NULL, '3C', 67, 79);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1890, 'C', NULL, NULL, '3C', 73, 67);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1889, 'C', NULL, NULL, '3C', 67, 73);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1888, 'C', NULL, NULL, '3C', 91, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1887, 'C', NULL, NULL, '3C', 61, 91);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1886, 'C', NULL, NULL, '3C', 85, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1885, 'C', NULL, NULL, '3C', 61, 85);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1884, 'C', NULL, NULL, '3C', 79, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1883, 'C', NULL, NULL, '3C', 61, 79);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1882, 'C', NULL, NULL, '3C', 73, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1881, 'C', NULL, NULL, '3C', 61, 73);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1880, 'C', NULL, NULL, '3C', 67, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1879, 'C', NULL, NULL, '3C', 61, 67);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1878, 'C', NULL, NULL, '3C', 91, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1877, 'C', NULL, NULL, '3C', 55, 91);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1876, 'C', NULL, NULL, '3C', 85, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1875, 'C', NULL, NULL, '3C', 55, 85);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1874, 'C', NULL, NULL, '3C', 79, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1873, 'C', NULL, NULL, '3C', 55, 79);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1872, 'C', NULL, NULL, '3C', 73, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1871, 'C', NULL, NULL, '3C', 55, 73);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1870, 'C', NULL, NULL, '3C', 67, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1869, 'C', NULL, NULL, '3C', 55, 67);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1868, 'C', NULL, NULL, '3C', 61, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1867, 'C', NULL, NULL, '3C', 55, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1866, 'C', NULL, NULL, '3C', 91, 49);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1865, 'C', NULL, NULL, '3C', 49, 91);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1864, 'C', NULL, NULL, '3C', 85, 49);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1863, 'C', NULL, NULL, '3C', 49, 85);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1862, 'C', NULL, NULL, '3C', 79, 49);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1861, 'C', NULL, NULL, '3C', 49, 79);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1860, 'C', NULL, NULL, '3C', 73, 49);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1859, 'C', NULL, NULL, '3C', 49, 73);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1858, 'C', NULL, NULL, '3C', 67, 49);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1857, 'C', NULL, NULL, '3C', 49, 67);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1856, 'C', NULL, NULL, '3C', 61, 49);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1855, 'C', NULL, NULL, '3C', 49, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1854, 'C', NULL, NULL, '3C', 55, 49);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1853, 'C', NULL, NULL, '3C', 49, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1852, 'C', NULL, NULL, '3C', 91, 43);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1851, 'C', NULL, NULL, '3C', 43, 91);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1850, 'C', NULL, NULL, '3C', 85, 43);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1849, 'C', NULL, NULL, '3C', 43, 85);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1848, 'C', NULL, NULL, '3C', 79, 43);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1847, 'C', NULL, NULL, '3C', 43, 79);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1846, 'C', NULL, NULL, '3C', 73, 43);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1845, 'C', NULL, NULL, '3C', 43, 73);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1844, 'C', NULL, NULL, '3C', 67, 43);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1843, 'C', NULL, NULL, '3C', 43, 67);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1842, 'C', NULL, NULL, '3C', 61, 43);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1841, 'C', NULL, NULL, '3C', 43, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1840, 'C', NULL, NULL, '3C', 55, 43);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1839, 'C', NULL, NULL, '3C', 43, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1838, 'C', NULL, NULL, '3C', 49, 43);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1837, 'C', NULL, NULL, '3C', 43, 49);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1836, 'C', NULL, NULL, '3C', 91, 37);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1835, 'C', NULL, NULL, '3C', 37, 91);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1834, 'C', NULL, NULL, '3C', 85, 37);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1833, 'C', NULL, NULL, '3C', 37, 85);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1832, 'C', NULL, NULL, '3C', 79, 37);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1831, 'C', NULL, NULL, '3C', 37, 79);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1830, 'C', NULL, NULL, '3C', 73, 37);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1829, 'C', NULL, NULL, '3C', 37, 73);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1828, 'C', NULL, NULL, '3C', 67, 37);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1827, 'C', NULL, NULL, '3C', 37, 67);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1826, 'C', NULL, NULL, '3C', 61, 37);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1825, 'C', NULL, NULL, '3C', 37, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1824, 'C', NULL, NULL, '3C', 55, 37);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1823, 'C', NULL, NULL, '3C', 37, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1822, 'C', NULL, NULL, '3C', 49, 37);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1821, 'C', NULL, NULL, '3C', 37, 49);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1820, 'C', NULL, NULL, '3C', 43, 37);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1819, 'C', NULL, NULL, '3C', 37, 43);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1818, 'C', NULL, NULL, '3B', 90, 84);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1817, 'C', NULL, NULL, '3B', 84, 90);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1816, 'C', NULL, NULL, '3B', 90, 78);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1815, 'C', NULL, NULL, '3B', 78, 90);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1814, 'C', NULL, NULL, '3B', 84, 78);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1813, 'C', NULL, NULL, '3B', 78, 84);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1812, 'C', NULL, NULL, '3B', 90, 72);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1811, 'C', NULL, NULL, '3B', 72, 90);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1810, 'C', NULL, NULL, '3B', 84, 72);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1809, 'C', NULL, NULL, '3B', 72, 84);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1808, 'C', NULL, NULL, '3B', 78, 72);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1807, 'C', NULL, NULL, '3B', 72, 78);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1806, 'C', NULL, NULL, '3B', 90, 66);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1805, 'C', NULL, NULL, '3B', 66, 90);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1804, 'C', NULL, NULL, '3B', 84, 66);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1803, 'C', NULL, NULL, '3B', 66, 84);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1802, 'C', NULL, NULL, '3B', 78, 66);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1801, 'C', NULL, NULL, '3B', 66, 78);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1800, 'C', NULL, NULL, '3B', 72, 66);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1799, 'C', NULL, NULL, '3B', 66, 72);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1798, 'C', NULL, NULL, '3B', 90, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1797, 'C', NULL, NULL, '3B', 60, 90);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1796, 'C', NULL, NULL, '3B', 84, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1795, 'C', NULL, NULL, '3B', 60, 84);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1794, 'C', NULL, NULL, '3B', 78, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1793, 'C', NULL, NULL, '3B', 60, 78);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1792, 'C', NULL, NULL, '3B', 72, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1791, 'C', NULL, NULL, '3B', 60, 72);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1790, 'C', NULL, NULL, '3B', 66, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1789, 'C', NULL, NULL, '3B', 60, 66);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1788, 'C', NULL, NULL, '3B', 90, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1787, 'C', NULL, NULL, '3B', 54, 90);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1786, 'C', NULL, NULL, '3B', 84, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1785, 'C', NULL, NULL, '3B', 54, 84);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1784, 'C', NULL, NULL, '3B', 78, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1783, 'C', NULL, NULL, '3B', 54, 78);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1782, 'C', NULL, NULL, '3B', 72, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1781, 'C', NULL, NULL, '3B', 54, 72);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1780, 'C', NULL, NULL, '3B', 66, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1779, 'C', NULL, NULL, '3B', 54, 66);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1778, 'C', NULL, NULL, '3B', 60, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1777, 'C', NULL, NULL, '3B', 54, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1776, 'C', NULL, NULL, '3B', 90, 48);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1775, 'C', NULL, NULL, '3B', 48, 90);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1774, 'C', NULL, NULL, '3B', 84, 48);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1773, 'C', NULL, NULL, '3B', 48, 84);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1772, 'C', NULL, NULL, '3B', 78, 48);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1771, 'C', NULL, NULL, '3B', 48, 78);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1770, 'C', NULL, NULL, '3B', 72, 48);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1769, 'C', NULL, NULL, '3B', 48, 72);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1768, 'C', NULL, NULL, '3B', 66, 48);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1767, 'C', NULL, NULL, '3B', 48, 66);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1766, 'C', NULL, NULL, '3B', 60, 48);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1765, 'C', NULL, NULL, '3B', 48, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1764, 'C', NULL, NULL, '3B', 54, 48);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1763, 'C', NULL, NULL, '3B', 48, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1762, 'C', NULL, NULL, '3B', 90, 42);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1761, 'C', NULL, NULL, '3B', 42, 90);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1760, 'C', NULL, NULL, '3B', 84, 42);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1759, 'C', NULL, NULL, '3B', 42, 84);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1758, 'C', NULL, NULL, '3B', 78, 42);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1757, 'C', NULL, NULL, '3B', 42, 78);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1756, 'C', NULL, NULL, '3B', 72, 42);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1755, 'C', NULL, NULL, '3B', 42, 72);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1754, 'C', NULL, NULL, '3B', 66, 42);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1753, 'C', NULL, NULL, '3B', 42, 66);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1752, 'C', NULL, NULL, '3B', 60, 42);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1751, 'C', NULL, NULL, '3B', 42, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1750, 'C', NULL, NULL, '3B', 54, 42);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1749, 'C', NULL, NULL, '3B', 42, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1748, 'C', NULL, NULL, '3B', 48, 42);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1747, 'C', NULL, NULL, '3B', 42, 48);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1746, 'C', NULL, NULL, '3B', 90, 36);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1745, 'C', NULL, NULL, '3B', 36, 90);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1744, 'C', NULL, NULL, '3B', 84, 36);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1743, 'C', NULL, NULL, '3B', 36, 84);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1742, 'C', NULL, NULL, '3B', 78, 36);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1741, 'C', NULL, NULL, '3B', 36, 78);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1740, 'C', NULL, NULL, '3B', 72, 36);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1739, 'C', NULL, NULL, '3B', 36, 72);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1738, 'C', NULL, NULL, '3B', 66, 36);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1737, 'C', NULL, NULL, '3B', 36, 66);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1736, 'C', NULL, NULL, '3B', 60, 36);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1735, 'C', NULL, NULL, '3B', 36, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1734, 'C', NULL, NULL, '3B', 54, 36);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1733, 'C', NULL, NULL, '3B', 36, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1732, 'C', NULL, NULL, '3B', 48, 36);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1731, 'C', NULL, NULL, '3B', 36, 48);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1730, 'C', NULL, NULL, '3B', 42, 36);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1729, 'C', NULL, NULL, '3B', 36, 42);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1728, 'C', NULL, NULL, '3A', 30, 27);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1727, 'C', NULL, NULL, '3A', 27, 30);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1726, 'C', NULL, NULL, '3A', 30, 24);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1725, 'C', NULL, NULL, '3A', 24, 30);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1724, 'C', NULL, NULL, '3A', 27, 24);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1723, 'C', NULL, NULL, '3A', 24, 27);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1722, 'C', NULL, NULL, '3A', 30, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1721, 'C', NULL, NULL, '3A', 21, 30);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1720, 'C', NULL, NULL, '3A', 27, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1719, 'C', NULL, NULL, '3A', 21, 27);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1718, 'C', NULL, NULL, '3A', 24, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1717, 'C', NULL, NULL, '3A', 21, 24);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1716, 'C', NULL, NULL, '3A', 30, 18);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1715, 'C', NULL, NULL, '3A', 18, 30);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1714, 'C', NULL, NULL, '3A', 27, 18);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1713, 'C', NULL, NULL, '3A', 18, 27);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1712, 'C', NULL, NULL, '3A', 24, 18);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1711, 'C', NULL, NULL, '3A', 18, 24);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1710, 'C', NULL, NULL, '3A', 21, 18);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1709, 'C', NULL, NULL, '3A', 18, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1708, 'C', NULL, NULL, '3A', 30, 15);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1707, 'C', NULL, NULL, '3A', 15, 30);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1706, 'C', NULL, NULL, '3A', 27, 15);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1705, 'C', NULL, NULL, '3A', 15, 27);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1704, 'C', NULL, NULL, '3A', 24, 15);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1703, 'C', NULL, NULL, '3A', 15, 24);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1702, 'C', NULL, NULL, '3A', 21, 15);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1701, 'C', NULL, NULL, '3A', 15, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1700, 'C', NULL, NULL, '3A', 18, 15);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1699, 'C', NULL, NULL, '3A', 15, 18);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1698, 'C', NULL, NULL, '3A', 30, 12);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1697, 'C', NULL, NULL, '3A', 12, 30);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1696, 'C', NULL, NULL, '3A', 27, 12);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1695, 'C', NULL, NULL, '3A', 12, 27);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1694, 'C', NULL, NULL, '3A', 24, 12);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1693, 'C', NULL, NULL, '3A', 12, 24);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1692, 'C', NULL, NULL, '3A', 21, 12);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1691, 'C', NULL, NULL, '3A', 12, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1690, 'C', NULL, NULL, '3A', 18, 12);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1689, 'C', NULL, NULL, '3A', 12, 18);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1688, 'C', NULL, NULL, '3A', 15, 12);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1687, 'C', NULL, NULL, '3A', 12, 15);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1686, 'C', NULL, NULL, '3A', 30, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1685, 'C', NULL, NULL, '3A', 9, 30);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1684, 'C', NULL, NULL, '3A', 27, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1683, 'C', NULL, NULL, '3A', 9, 27);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1682, 'C', NULL, NULL, '3A', 24, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1681, 'C', NULL, NULL, '3A', 9, 24);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1680, 'C', NULL, NULL, '3A', 21, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1679, 'C', NULL, NULL, '3A', 9, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1678, 'C', NULL, NULL, '3A', 18, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1677, 'C', NULL, NULL, '3A', 9, 18);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1676, 'C', NULL, NULL, '3A', 15, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1675, 'C', NULL, NULL, '3A', 9, 15);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1674, 'C', NULL, NULL, '3A', 12, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1673, 'C', NULL, NULL, '3A', 9, 12);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1672, 'C', NULL, NULL, '3A', 30, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1671, 'C', NULL, NULL, '3A', 6, 30);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1670, 'C', NULL, NULL, '3A', 27, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1669, 'C', NULL, NULL, '3A', 6, 27);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1668, 'C', NULL, NULL, '3A', 24, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1667, 'C', NULL, NULL, '3A', 6, 24);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1666, 'C', NULL, NULL, '3A', 21, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1665, 'C', NULL, NULL, '3A', 6, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1664, 'C', NULL, NULL, '3A', 18, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1663, 'C', NULL, NULL, '3A', 6, 18);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1662, 'C', NULL, NULL, '3A', 15, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1661, 'C', NULL, NULL, '3A', 6, 15);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1660, 'C', NULL, NULL, '3A', 12, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1659, 'C', NULL, NULL, '3A', 6, 12);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1658, 'C', NULL, NULL, '3A', 9, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1657, 'C', NULL, NULL, '3A', 6, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1656, 'C', NULL, NULL, '3A', 30, 3);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1655, 'C', NULL, NULL, '3A', 3, 30);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1654, 'C', NULL, NULL, '3A', 27, 3);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1653, 'C', NULL, NULL, '3A', 3, 27);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1652, 'C', NULL, NULL, '3A', 24, 3);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1651, 'C', NULL, NULL, '3A', 3, 24);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1650, 'C', NULL, NULL, '3A', 21, 3);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1649, 'C', NULL, NULL, '3A', 3, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1648, 'C', NULL, NULL, '3A', 18, 3);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1647, 'C', NULL, NULL, '3A', 3, 18);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1646, 'C', NULL, NULL, '3A', 15, 3);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1645, 'C', NULL, NULL, '3A', 3, 15);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1644, 'C', NULL, NULL, '3A', 12, 3);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1643, 'C', NULL, NULL, '3A', 3, 12);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1642, 'C', NULL, NULL, '3A', 9, 3);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1641, 'C', NULL, NULL, '3A', 3, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1640, 'C', NULL, NULL, '3A', 6, 3);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1639, 'C', NULL, NULL, '3A', 3, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1638, 'C', NULL, NULL, '2C', 89, 83);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1637, 'C', NULL, NULL, '2C', 83, 89);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1636, 'C', NULL, NULL, '2C', 89, 77);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1635, 'C', NULL, NULL, '2C', 77, 89);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1634, 'C', NULL, NULL, '2C', 83, 77);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1633, 'C', NULL, NULL, '2C', 77, 83);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1632, 'C', NULL, NULL, '2C', 89, 71);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1631, 'C', NULL, NULL, '2C', 71, 89);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1630, 'C', NULL, NULL, '2C', 83, 71);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1629, 'C', NULL, NULL, '2C', 71, 83);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1628, 'C', NULL, NULL, '2C', 77, 71);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1627, 'C', NULL, NULL, '2C', 71, 77);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1626, 'C', NULL, NULL, '2C', 89, 65);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1625, 'C', NULL, NULL, '2C', 65, 89);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1624, 'C', NULL, NULL, '2C', 83, 65);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1623, 'C', NULL, NULL, '2C', 65, 83);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1622, 'C', NULL, NULL, '2C', 77, 65);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1621, 'C', NULL, NULL, '2C', 65, 77);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1620, 'C', NULL, NULL, '2C', 71, 65);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1619, 'C', NULL, NULL, '2C', 65, 71);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1618, 'C', NULL, NULL, '2C', 89, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1617, 'C', NULL, NULL, '2C', 59, 89);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1616, 'C', NULL, NULL, '2C', 83, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1615, 'C', NULL, NULL, '2C', 59, 83);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1614, 'C', NULL, NULL, '2C', 77, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1613, 'C', NULL, NULL, '2C', 59, 77);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1612, 'C', NULL, NULL, '2C', 71, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1611, 'C', NULL, NULL, '2C', 59, 71);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1610, 'C', NULL, NULL, '2C', 65, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1609, 'C', NULL, NULL, '2C', 59, 65);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1608, 'C', NULL, NULL, '2C', 89, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1607, 'C', NULL, NULL, '2C', 53, 89);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1606, 'C', NULL, NULL, '2C', 83, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1605, 'C', NULL, NULL, '2C', 53, 83);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1604, 'C', NULL, NULL, '2C', 77, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1603, 'C', NULL, NULL, '2C', 53, 77);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1602, 'C', NULL, NULL, '2C', 71, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1601, 'C', NULL, NULL, '2C', 53, 71);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1600, 'C', NULL, NULL, '2C', 65, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1599, 'C', NULL, NULL, '2C', 53, 65);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1598, 'C', NULL, NULL, '2C', 59, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1597, 'C', NULL, NULL, '2C', 53, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1596, 'C', NULL, NULL, '2C', 89, 47);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1595, 'C', NULL, NULL, '2C', 47, 89);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1594, 'C', NULL, NULL, '2C', 83, 47);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1593, 'C', NULL, NULL, '2C', 47, 83);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1592, 'C', NULL, NULL, '2C', 77, 47);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1591, 'C', NULL, NULL, '2C', 47, 77);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1590, 'C', NULL, NULL, '2C', 71, 47);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1589, 'C', NULL, NULL, '2C', 47, 71);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1588, 'C', NULL, NULL, '2C', 65, 47);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1587, 'C', NULL, NULL, '2C', 47, 65);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1586, 'C', NULL, NULL, '2C', 59, 47);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1585, 'C', NULL, NULL, '2C', 47, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1584, 'C', NULL, NULL, '2C', 53, 47);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1583, 'C', NULL, NULL, '2C', 47, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1582, 'C', NULL, NULL, '2C', 89, 41);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1581, 'C', NULL, NULL, '2C', 41, 89);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1580, 'C', NULL, NULL, '2C', 83, 41);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1579, 'C', NULL, NULL, '2C', 41, 83);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1578, 'C', NULL, NULL, '2C', 77, 41);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1577, 'C', NULL, NULL, '2C', 41, 77);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1576, 'C', NULL, NULL, '2C', 71, 41);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1575, 'C', NULL, NULL, '2C', 41, 71);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1574, 'C', NULL, NULL, '2C', 65, 41);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1573, 'C', NULL, NULL, '2C', 41, 65);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1572, 'C', NULL, NULL, '2C', 59, 41);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1571, 'C', NULL, NULL, '2C', 41, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1570, 'C', NULL, NULL, '2C', 53, 41);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1569, 'C', NULL, NULL, '2C', 41, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1568, 'C', NULL, NULL, '2C', 47, 41);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1567, 'C', NULL, NULL, '2C', 41, 47);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1566, 'C', NULL, NULL, '2C', 89, 35);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1565, 'C', NULL, NULL, '2C', 35, 89);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1564, 'C', NULL, NULL, '2C', 83, 35);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1563, 'C', NULL, NULL, '2C', 35, 83);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1562, 'C', NULL, NULL, '2C', 77, 35);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1561, 'C', NULL, NULL, '2C', 35, 77);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1560, 'C', NULL, NULL, '2C', 71, 35);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1559, 'C', NULL, NULL, '2C', 35, 71);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1558, 'C', NULL, NULL, '2C', 65, 35);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1557, 'C', NULL, NULL, '2C', 35, 65);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1556, 'C', NULL, NULL, '2C', 59, 35);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1555, 'C', NULL, NULL, '2C', 35, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1554, 'C', NULL, NULL, '2C', 53, 35);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1553, 'C', NULL, NULL, '2C', 35, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1552, 'C', NULL, NULL, '2C', 47, 35);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1551, 'C', NULL, NULL, '2C', 35, 47);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1550, 'C', NULL, NULL, '2C', 41, 35);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1549, 'C', NULL, NULL, '2C', 35, 41);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1548, 'C', NULL, NULL, '2B', 88, 82);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1547, 'C', NULL, NULL, '2B', 82, 88);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1546, 'C', NULL, NULL, '2B', 88, 76);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1545, 'C', NULL, NULL, '2B', 76, 88);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1544, 'C', NULL, NULL, '2B', 82, 76);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1543, 'C', NULL, NULL, '2B', 76, 82);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1542, 'C', NULL, NULL, '2B', 88, 70);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1541, 'C', NULL, NULL, '2B', 70, 88);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1540, 'C', NULL, NULL, '2B', 82, 70);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1539, 'C', NULL, NULL, '2B', 70, 82);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1538, 'C', NULL, NULL, '2B', 76, 70);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1537, 'C', NULL, NULL, '2B', 70, 76);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1536, 'C', NULL, NULL, '2B', 88, 64);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1535, 'C', NULL, NULL, '2B', 64, 88);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1534, 'C', NULL, NULL, '2B', 82, 64);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1533, 'C', NULL, NULL, '2B', 64, 82);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1532, 'C', NULL, NULL, '2B', 76, 64);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1531, 'C', NULL, NULL, '2B', 64, 76);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1530, 'C', NULL, NULL, '2B', 70, 64);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1529, 'C', NULL, NULL, '2B', 64, 70);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1528, 'C', NULL, NULL, '2B', 88, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1527, 'C', NULL, NULL, '2B', 58, 88);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1526, 'C', NULL, NULL, '2B', 82, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1525, 'C', NULL, NULL, '2B', 58, 82);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1524, 'C', NULL, NULL, '2B', 76, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1523, 'C', NULL, NULL, '2B', 58, 76);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1522, 'C', NULL, NULL, '2B', 70, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1521, 'C', NULL, NULL, '2B', 58, 70);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1520, 'C', NULL, NULL, '2B', 64, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1519, 'C', NULL, NULL, '2B', 58, 64);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1518, 'C', NULL, NULL, '2B', 88, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1517, 'C', NULL, NULL, '2B', 52, 88);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1516, 'C', NULL, NULL, '2B', 82, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1515, 'C', NULL, NULL, '2B', 52, 82);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1514, 'C', NULL, NULL, '2B', 76, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1513, 'C', NULL, NULL, '2B', 52, 76);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1512, 'C', NULL, NULL, '2B', 70, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1511, 'C', NULL, NULL, '2B', 52, 70);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1510, 'C', NULL, NULL, '2B', 64, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1509, 'C', NULL, NULL, '2B', 52, 64);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1508, 'C', NULL, NULL, '2B', 58, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1507, 'C', NULL, NULL, '2B', 52, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1506, 'C', NULL, NULL, '2B', 88, 46);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1505, 'C', NULL, NULL, '2B', 46, 88);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1504, 'C', NULL, NULL, '2B', 82, 46);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1503, 'C', NULL, NULL, '2B', 46, 82);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1502, 'C', NULL, NULL, '2B', 76, 46);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1501, 'C', NULL, NULL, '2B', 46, 76);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1500, 'C', NULL, NULL, '2B', 70, 46);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1499, 'C', NULL, NULL, '2B', 46, 70);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1498, 'C', NULL, NULL, '2B', 64, 46);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1497, 'C', NULL, NULL, '2B', 46, 64);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1496, 'C', NULL, NULL, '2B', 58, 46);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1495, 'C', NULL, NULL, '2B', 46, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1494, 'C', NULL, NULL, '2B', 52, 46);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1493, 'C', NULL, NULL, '2B', 46, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1492, 'C', NULL, NULL, '2B', 88, 40);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1491, 'C', NULL, NULL, '2B', 40, 88);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1490, 'C', NULL, NULL, '2B', 82, 40);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1489, 'C', NULL, NULL, '2B', 40, 82);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1488, 'C', NULL, NULL, '2B', 76, 40);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1487, 'C', NULL, NULL, '2B', 40, 76);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1486, 'C', NULL, NULL, '2B', 70, 40);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1485, 'C', NULL, NULL, '2B', 40, 70);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1484, 'C', NULL, NULL, '2B', 64, 40);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1483, 'C', NULL, NULL, '2B', 40, 64);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1482, 'C', NULL, NULL, '2B', 58, 40);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1481, 'C', NULL, NULL, '2B', 40, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1480, 'C', NULL, NULL, '2B', 52, 40);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1479, 'C', NULL, NULL, '2B', 40, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1478, 'C', NULL, NULL, '2B', 46, 40);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1477, 'C', NULL, NULL, '2B', 40, 46);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1476, 'C', NULL, NULL, '2B', 88, 34);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1475, 'C', NULL, NULL, '2B', 34, 88);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1474, 'C', NULL, NULL, '2B', 82, 34);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1473, 'C', NULL, NULL, '2B', 34, 82);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1472, 'C', NULL, NULL, '2B', 76, 34);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1471, 'C', NULL, NULL, '2B', 34, 76);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1470, 'C', NULL, NULL, '2B', 70, 34);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1469, 'C', NULL, NULL, '2B', 34, 70);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1468, 'C', NULL, NULL, '2B', 64, 34);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1467, 'C', NULL, NULL, '2B', 34, 64);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1466, 'C', NULL, NULL, '2B', 58, 34);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1465, 'C', NULL, NULL, '2B', 34, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1464, 'C', NULL, NULL, '2B', 52, 34);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1463, 'C', NULL, NULL, '2B', 34, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1462, 'C', NULL, NULL, '2B', 46, 34);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1461, 'C', NULL, NULL, '2B', 34, 46);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1460, 'C', NULL, NULL, '2B', 40, 34);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1459, 'C', NULL, NULL, '2B', 34, 40);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1458, 'C', NULL, NULL, '2A', 29, 26);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1457, 'C', NULL, NULL, '2A', 26, 29);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1456, 'C', NULL, NULL, '2A', 29, 23);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1455, 'C', NULL, NULL, '2A', 23, 29);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1454, 'C', NULL, NULL, '2A', 26, 23);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1453, 'C', NULL, NULL, '2A', 23, 26);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1452, 'C', NULL, NULL, '2A', 29, 20);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1451, 'C', NULL, NULL, '2A', 20, 29);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1450, 'C', NULL, NULL, '2A', 26, 20);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1449, 'C', NULL, NULL, '2A', 20, 26);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1448, 'C', NULL, NULL, '2A', 23, 20);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1447, 'C', NULL, NULL, '2A', 20, 23);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1446, 'C', NULL, NULL, '2A', 29, 17);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1445, 'C', NULL, NULL, '2A', 17, 29);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1444, 'C', NULL, NULL, '2A', 26, 17);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1443, 'C', NULL, NULL, '2A', 17, 26);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1442, 'C', NULL, NULL, '2A', 23, 17);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1441, 'C', NULL, NULL, '2A', 17, 23);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1440, 'C', NULL, NULL, '2A', 20, 17);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1439, 'C', NULL, NULL, '2A', 17, 20);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1438, 'C', NULL, NULL, '2A', 29, 14);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1437, 'C', NULL, NULL, '2A', 14, 29);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1436, 'C', NULL, NULL, '2A', 26, 14);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1435, 'C', NULL, NULL, '2A', 14, 26);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1434, 'C', NULL, NULL, '2A', 23, 14);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1433, 'C', NULL, NULL, '2A', 14, 23);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1432, 'C', NULL, NULL, '2A', 20, 14);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1431, 'C', NULL, NULL, '2A', 14, 20);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1430, 'C', NULL, NULL, '2A', 17, 14);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1429, 'C', NULL, NULL, '2A', 14, 17);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1428, 'C', NULL, NULL, '2A', 29, 11);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1427, 'C', NULL, NULL, '2A', 11, 29);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1426, 'C', NULL, NULL, '2A', 26, 11);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1425, 'C', NULL, NULL, '2A', 11, 26);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1424, 'C', NULL, NULL, '2A', 23, 11);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1423, 'C', NULL, NULL, '2A', 11, 23);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1422, 'C', NULL, NULL, '2A', 20, 11);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1421, 'C', NULL, NULL, '2A', 11, 20);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1420, 'C', NULL, NULL, '2A', 17, 11);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1419, 'C', NULL, NULL, '2A', 11, 17);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1418, 'C', NULL, NULL, '2A', 14, 11);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1417, 'C', NULL, NULL, '2A', 11, 14);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1416, 'C', NULL, NULL, '2A', 29, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1415, 'C', NULL, NULL, '2A', 8, 29);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1414, 'C', NULL, NULL, '2A', 26, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1413, 'C', NULL, NULL, '2A', 8, 26);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1412, 'C', NULL, NULL, '2A', 23, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1411, 'C', NULL, NULL, '2A', 8, 23);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1410, 'C', NULL, NULL, '2A', 20, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1409, 'C', NULL, NULL, '2A', 8, 20);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1408, 'C', NULL, NULL, '2A', 17, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1407, 'C', NULL, NULL, '2A', 8, 17);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1406, 'C', NULL, NULL, '2A', 14, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1405, 'C', NULL, NULL, '2A', 8, 14);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1404, 'C', NULL, NULL, '2A', 11, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1403, 'C', NULL, NULL, '2A', 8, 11);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1402, 'C', NULL, NULL, '2A', 29, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1401, 'C', NULL, NULL, '2A', 5, 29);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1400, 'C', NULL, NULL, '2A', 26, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1399, 'C', NULL, NULL, '2A', 5, 26);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1398, 'C', NULL, NULL, '2A', 23, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1397, 'C', NULL, NULL, '2A', 5, 23);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1396, 'C', NULL, NULL, '2A', 20, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1395, 'C', NULL, NULL, '2A', 5, 20);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1394, 'C', NULL, NULL, '2A', 17, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1393, 'C', NULL, NULL, '2A', 5, 17);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1392, 'C', NULL, NULL, '2A', 14, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1391, 'C', NULL, NULL, '2A', 5, 14);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1390, 'C', NULL, NULL, '2A', 11, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1389, 'C', NULL, NULL, '2A', 5, 11);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1388, 'C', NULL, NULL, '2A', 8, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1387, 'C', NULL, NULL, '2A', 5, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1386, 'C', NULL, NULL, '2A', 29, 2);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1385, 'C', NULL, NULL, '2A', 2, 29);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1384, 'C', NULL, NULL, '2A', 26, 2);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1383, 'C', NULL, NULL, '2A', 2, 26);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1382, 'C', NULL, NULL, '2A', 23, 2);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1381, 'C', NULL, NULL, '2A', 2, 23);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1380, 'C', NULL, NULL, '2A', 20, 2);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1379, 'C', NULL, NULL, '2A', 2, 20);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1378, 'C', NULL, NULL, '2A', 17, 2);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1377, 'C', NULL, NULL, '2A', 2, 17);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1376, 'C', NULL, NULL, '2A', 14, 2);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1375, 'C', NULL, NULL, '2A', 2, 14);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1374, 'C', NULL, NULL, '2A', 11, 2);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1373, 'C', NULL, NULL, '2A', 2, 11);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1372, 'C', NULL, NULL, '2A', 8, 2);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1371, 'C', NULL, NULL, '2A', 2, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1370, 'C', NULL, NULL, '2A', 5, 2);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1369, 'C', NULL, NULL, '2A', 2, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1368, 'C', NULL, NULL, '1C', 100, 98);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1367, 'C', NULL, NULL, '1C', 98, 100);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1366, 'C', NULL, NULL, '1C', 100, 94);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1365, 'C', NULL, NULL, '1C', 94, 100);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1364, 'C', NULL, NULL, '1C', 98, 94);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1363, 'C', NULL, NULL, '1C', 94, 98);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1362, 'C', NULL, NULL, '1C', 100, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1361, 'C', NULL, NULL, '1C', 87, 100);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1360, 'C', NULL, NULL, '1C', 98, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1359, 'C', NULL, NULL, '1C', 87, 98);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1358, 'C', NULL, NULL, '1C', 94, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1357, 'C', NULL, NULL, '1C', 87, 94);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1356, 'C', NULL, NULL, '1C', 100, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1355, 'C', NULL, NULL, '1C', 81, 100);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1354, 'C', NULL, NULL, '1C', 98, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1353, 'C', NULL, NULL, '1C', 81, 98);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1352, 'C', NULL, NULL, '1C', 94, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1351, 'C', NULL, NULL, '1C', 81, 94);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1350, 'C', NULL, NULL, '1C', 87, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1349, 'C', NULL, NULL, '1C', 81, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1348, 'C', NULL, NULL, '1C', 100, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1347, 'C', NULL, NULL, '1C', 75, 100);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1346, 'C', NULL, NULL, '1C', 98, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1345, 'C', NULL, NULL, '1C', 75, 98);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1344, 'C', NULL, NULL, '1C', 94, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1343, 'C', NULL, NULL, '1C', 75, 94);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1342, 'C', NULL, NULL, '1C', 87, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1341, 'C', NULL, NULL, '1C', 75, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1340, 'C', NULL, NULL, '1C', 81, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1339, 'C', NULL, NULL, '1C', 75, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1338, 'C', NULL, NULL, '1C', 100, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1337, 'C', NULL, NULL, '1C', 69, 100);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1336, 'C', NULL, NULL, '1C', 98, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1335, 'C', NULL, NULL, '1C', 69, 98);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1334, 'C', NULL, NULL, '1C', 94, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1333, 'C', NULL, NULL, '1C', 69, 94);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1332, 'C', NULL, NULL, '1C', 87, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1331, 'C', NULL, NULL, '1C', 69, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1330, 'C', NULL, NULL, '1C', 81, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1329, 'C', NULL, NULL, '1C', 69, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1328, 'C', NULL, NULL, '1C', 75, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1327, 'C', NULL, NULL, '1C', 69, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1326, 'C', NULL, NULL, '1C', 100, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1325, 'C', NULL, NULL, '1C', 63, 100);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1324, 'C', NULL, NULL, '1C', 98, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1323, 'C', NULL, NULL, '1C', 63, 98);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1322, 'C', NULL, NULL, '1C', 94, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1321, 'C', NULL, NULL, '1C', 63, 94);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1320, 'C', NULL, NULL, '1C', 87, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1319, 'C', NULL, NULL, '1C', 63, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1318, 'C', NULL, NULL, '1C', 81, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1317, 'C', NULL, NULL, '1C', 63, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1316, 'C', NULL, NULL, '1C', 75, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1315, 'C', NULL, NULL, '1C', 63, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1314, 'C', NULL, NULL, '1C', 69, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1313, 'C', NULL, NULL, '1C', 63, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1312, 'C', NULL, NULL, '1C', 100, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1311, 'C', NULL, NULL, '1C', 57, 100);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1310, 'C', NULL, NULL, '1C', 98, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1309, 'C', NULL, NULL, '1C', 57, 98);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1308, 'C', NULL, NULL, '1C', 94, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1307, 'C', NULL, NULL, '1C', 57, 94);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1306, 'C', NULL, NULL, '1C', 87, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1305, 'C', NULL, NULL, '1C', 57, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1304, 'C', NULL, NULL, '1C', 81, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1303, 'C', NULL, NULL, '1C', 57, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1302, 'C', NULL, NULL, '1C', 75, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1301, 'C', NULL, NULL, '1C', 57, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1300, 'C', NULL, NULL, '1C', 69, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1299, 'C', NULL, NULL, '1C', 57, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1298, 'C', NULL, NULL, '1C', 63, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1297, 'C', NULL, NULL, '1C', 57, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1296, 'C', NULL, NULL, '1C', 100, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1295, 'C', NULL, NULL, '1C', 51, 100);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1294, 'C', NULL, NULL, '1C', 98, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1293, 'C', NULL, NULL, '1C', 51, 98);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1292, 'C', NULL, NULL, '1C', 94, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1291, 'C', NULL, NULL, '1C', 51, 94);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1290, 'C', NULL, NULL, '1C', 87, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1289, 'C', NULL, NULL, '1C', 51, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1288, 'C', NULL, NULL, '1C', 81, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1287, 'C', NULL, NULL, '1C', 51, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1286, 'C', NULL, NULL, '1C', 75, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1285, 'C', NULL, NULL, '1C', 51, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1284, 'C', NULL, NULL, '1C', 69, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1283, 'C', NULL, NULL, '1C', 51, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1282, 'C', NULL, NULL, '1C', 63, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1281, 'C', NULL, NULL, '1C', 51, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1280, 'C', NULL, NULL, '1C', 57, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1279, 'C', NULL, NULL, '1C', 51, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1278, 'C', NULL, NULL, '1C', 100, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1277, 'C', NULL, NULL, '1C', 45, 100);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1276, 'C', NULL, NULL, '1C', 98, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1275, 'C', NULL, NULL, '1C', 45, 98);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1274, 'C', NULL, NULL, '1C', 94, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1273, 'C', NULL, NULL, '1C', 45, 94);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1272, 'C', NULL, NULL, '1C', 87, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1271, 'C', NULL, NULL, '1C', 45, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1270, 'C', NULL, NULL, '1C', 81, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1269, 'C', NULL, NULL, '1C', 45, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1268, 'C', NULL, NULL, '1C', 75, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1267, 'C', NULL, NULL, '1C', 45, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1266, 'C', NULL, NULL, '1C', 69, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1265, 'C', NULL, NULL, '1C', 45, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1264, 'C', NULL, NULL, '1C', 63, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1263, 'C', NULL, NULL, '1C', 45, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1262, 'C', NULL, NULL, '1C', 57, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1261, 'C', NULL, NULL, '1C', 45, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1260, 'C', NULL, NULL, '1C', 51, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1259, 'C', NULL, NULL, '1C', 45, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1258, 'C', NULL, NULL, '1C', 100, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1257, 'C', NULL, NULL, '1C', 39, 100);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1256, 'C', NULL, NULL, '1C', 98, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1255, 'C', NULL, NULL, '1C', 39, 98);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1254, 'C', NULL, NULL, '1C', 94, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1253, 'C', NULL, NULL, '1C', 39, 94);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1252, 'C', NULL, NULL, '1C', 87, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1251, 'C', NULL, NULL, '1C', 39, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1250, 'C', NULL, NULL, '1C', 81, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1249, 'C', NULL, NULL, '1C', 39, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1248, 'C', NULL, NULL, '1C', 75, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1247, 'C', NULL, NULL, '1C', 39, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1246, 'C', NULL, NULL, '1C', 69, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1245, 'C', NULL, NULL, '1C', 39, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1244, 'C', NULL, NULL, '1C', 63, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1243, 'C', NULL, NULL, '1C', 39, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1242, 'C', NULL, NULL, '1C', 57, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1241, 'C', NULL, NULL, '1C', 39, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1240, 'C', NULL, NULL, '1C', 51, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1239, 'C', NULL, NULL, '1C', 39, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1238, 'C', NULL, NULL, '1C', 45, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1237, 'C', NULL, NULL, '1C', 39, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1236, 'C', NULL, NULL, '1C', 100, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1235, 'C', NULL, NULL, '1C', 33, 100);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1234, 'C', NULL, NULL, '1C', 98, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1233, 'C', NULL, NULL, '1C', 33, 98);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1232, 'C', NULL, NULL, '1C', 94, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1231, 'C', NULL, NULL, '1C', 33, 94);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1230, 'C', NULL, NULL, '1C', 87, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1229, 'C', NULL, NULL, '1C', 33, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1228, 'C', NULL, NULL, '1C', 81, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1227, 'C', NULL, NULL, '1C', 33, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1226, 'C', NULL, NULL, '1C', 75, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1225, 'C', NULL, NULL, '1C', 33, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1224, 'C', NULL, NULL, '1C', 69, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1223, 'C', NULL, NULL, '1C', 33, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1222, 'C', NULL, NULL, '1C', 63, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1221, 'C', NULL, NULL, '1C', 33, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1220, 'C', NULL, NULL, '1C', 57, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1219, 'C', NULL, NULL, '1C', 33, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1218, 'C', NULL, NULL, '1C', 51, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1217, 'C', NULL, NULL, '1C', 33, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1216, 'C', NULL, NULL, '1C', 45, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1215, 'C', NULL, NULL, '1C', 33, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1214, 'C', NULL, NULL, '1C', 39, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1213, 'C', NULL, NULL, '1C', 33, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1212, 'C', NULL, NULL, '1B', 99, 97);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1211, 'C', NULL, NULL, '1B', 97, 99);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1210, 'C', NULL, NULL, '1B', 99, 93);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1209, 'C', NULL, NULL, '1B', 93, 99);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1208, 'C', NULL, NULL, '1B', 97, 93);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1207, 'C', NULL, NULL, '1B', 93, 97);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1206, 'C', NULL, NULL, '1B', 99, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1205, 'C', NULL, NULL, '1B', 86, 99);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1204, 'C', NULL, NULL, '1B', 97, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1203, 'C', NULL, NULL, '1B', 86, 97);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1202, 'C', NULL, NULL, '1B', 93, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1201, 'C', NULL, NULL, '1B', 86, 93);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1200, 'C', NULL, NULL, '1B', 99, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1199, 'C', NULL, NULL, '1B', 80, 99);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1198, 'C', NULL, NULL, '1B', 97, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1197, 'C', NULL, NULL, '1B', 80, 97);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1196, 'C', NULL, NULL, '1B', 93, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1195, 'C', NULL, NULL, '1B', 80, 93);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1194, 'C', NULL, NULL, '1B', 86, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1193, 'C', NULL, NULL, '1B', 80, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1192, 'C', NULL, NULL, '1B', 99, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1191, 'C', NULL, NULL, '1B', 74, 99);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1190, 'C', NULL, NULL, '1B', 97, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1189, 'C', NULL, NULL, '1B', 74, 97);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1188, 'C', NULL, NULL, '1B', 93, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1187, 'C', NULL, NULL, '1B', 74, 93);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1186, 'C', NULL, NULL, '1B', 86, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1185, 'C', NULL, NULL, '1B', 74, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1184, 'C', NULL, NULL, '1B', 80, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1183, 'C', NULL, NULL, '1B', 74, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1182, 'C', NULL, NULL, '1B', 99, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1181, 'C', NULL, NULL, '1B', 68, 99);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1180, 'C', NULL, NULL, '1B', 97, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1179, 'C', NULL, NULL, '1B', 68, 97);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1178, 'C', NULL, NULL, '1B', 93, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1177, 'C', NULL, NULL, '1B', 68, 93);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1176, 'C', NULL, NULL, '1B', 86, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1175, 'C', NULL, NULL, '1B', 68, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1174, 'C', NULL, NULL, '1B', 80, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1173, 'C', NULL, NULL, '1B', 68, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1172, 'C', NULL, NULL, '1B', 74, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1171, 'C', NULL, NULL, '1B', 68, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1170, 'C', NULL, NULL, '1B', 99, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1169, 'C', NULL, NULL, '1B', 62, 99);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1168, 'C', NULL, NULL, '1B', 97, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1167, 'C', NULL, NULL, '1B', 62, 97);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1166, 'C', NULL, NULL, '1B', 93, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1165, 'C', NULL, NULL, '1B', 62, 93);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1164, 'C', NULL, NULL, '1B', 86, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1163, 'C', NULL, NULL, '1B', 62, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1162, 'C', NULL, NULL, '1B', 80, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1161, 'C', NULL, NULL, '1B', 62, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1160, 'C', NULL, NULL, '1B', 74, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1159, 'C', NULL, NULL, '1B', 62, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1158, 'C', NULL, NULL, '1B', 68, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1157, 'C', NULL, NULL, '1B', 62, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1156, 'C', NULL, NULL, '1B', 99, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1155, 'C', NULL, NULL, '1B', 56, 99);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1154, 'C', NULL, NULL, '1B', 97, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1153, 'C', NULL, NULL, '1B', 56, 97);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1152, 'C', NULL, NULL, '1B', 93, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1151, 'C', NULL, NULL, '1B', 56, 93);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1150, 'C', NULL, NULL, '1B', 86, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1149, 'C', NULL, NULL, '1B', 56, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1148, 'C', NULL, NULL, '1B', 80, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1147, 'C', NULL, NULL, '1B', 56, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1146, 'C', NULL, NULL, '1B', 74, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1145, 'C', NULL, NULL, '1B', 56, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1144, 'C', NULL, NULL, '1B', 68, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1143, 'C', NULL, NULL, '1B', 56, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1142, 'C', NULL, NULL, '1B', 62, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1141, 'C', NULL, NULL, '1B', 56, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1140, 'C', NULL, NULL, '1B', 99, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1139, 'C', NULL, NULL, '1B', 50, 99);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1138, 'C', NULL, NULL, '1B', 97, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1137, 'C', NULL, NULL, '1B', 50, 97);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1136, 'C', NULL, NULL, '1B', 93, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1135, 'C', NULL, NULL, '1B', 50, 93);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1134, 'C', NULL, NULL, '1B', 86, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1133, 'C', NULL, NULL, '1B', 50, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1132, 'C', NULL, NULL, '1B', 80, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1131, 'C', NULL, NULL, '1B', 50, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1130, 'C', NULL, NULL, '1B', 74, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1129, 'C', NULL, NULL, '1B', 50, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1128, 'C', NULL, NULL, '1B', 68, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1127, 'C', NULL, NULL, '1B', 50, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1126, 'C', NULL, NULL, '1B', 62, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1125, 'C', NULL, NULL, '1B', 50, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1124, 'C', NULL, NULL, '1B', 56, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1123, 'C', NULL, NULL, '1B', 50, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1122, 'C', NULL, NULL, '1B', 99, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1121, 'C', NULL, NULL, '1B', 44, 99);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1120, 'C', NULL, NULL, '1B', 97, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1119, 'C', NULL, NULL, '1B', 44, 97);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1118, 'C', NULL, NULL, '1B', 93, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1117, 'C', NULL, NULL, '1B', 44, 93);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1116, 'C', NULL, NULL, '1B', 86, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1115, 'C', NULL, NULL, '1B', 44, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1114, 'C', NULL, NULL, '1B', 80, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1113, 'C', NULL, NULL, '1B', 44, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1112, 'C', NULL, NULL, '1B', 74, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1111, 'C', NULL, NULL, '1B', 44, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1110, 'C', NULL, NULL, '1B', 68, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1109, 'C', NULL, NULL, '1B', 44, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1108, 'C', NULL, NULL, '1B', 62, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1107, 'C', NULL, NULL, '1B', 44, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1106, 'C', NULL, NULL, '1B', 56, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1105, 'C', NULL, NULL, '1B', 44, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1104, 'C', NULL, NULL, '1B', 50, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1103, 'C', NULL, NULL, '1B', 44, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1102, 'C', NULL, NULL, '1B', 99, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1101, 'C', NULL, NULL, '1B', 38, 99);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1100, 'C', NULL, NULL, '1B', 97, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1099, 'C', NULL, NULL, '1B', 38, 97);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1098, 'C', NULL, NULL, '1B', 93, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1097, 'C', NULL, NULL, '1B', 38, 93);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1096, 'C', NULL, NULL, '1B', 86, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1095, 'C', NULL, NULL, '1B', 38, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1094, 'C', NULL, NULL, '1B', 80, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1093, 'C', NULL, NULL, '1B', 38, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1092, 'C', NULL, NULL, '1B', 74, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1091, 'C', NULL, NULL, '1B', 38, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1090, 'C', NULL, NULL, '1B', 68, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1089, 'C', NULL, NULL, '1B', 38, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1088, 'C', NULL, NULL, '1B', 62, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1087, 'C', NULL, NULL, '1B', 38, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1086, 'C', NULL, NULL, '1B', 56, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1085, 'C', NULL, NULL, '1B', 38, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1084, 'C', NULL, NULL, '1B', 50, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1083, 'C', NULL, NULL, '1B', 38, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1082, 'C', NULL, NULL, '1B', 44, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1081, 'C', NULL, NULL, '1B', 38, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1080, 'C', NULL, NULL, '1B', 99, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1079, 'C', NULL, NULL, '1B', 32, 99);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1078, 'C', NULL, NULL, '1B', 97, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1077, 'C', NULL, NULL, '1B', 32, 97);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1076, 'C', NULL, NULL, '1B', 93, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1075, 'C', NULL, NULL, '1B', 32, 93);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1074, 'C', NULL, NULL, '1B', 86, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1073, 'C', NULL, NULL, '1B', 32, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1072, 'C', NULL, NULL, '1B', 80, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1071, 'C', NULL, NULL, '1B', 32, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1070, 'C', NULL, NULL, '1B', 74, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1069, 'C', NULL, NULL, '1B', 32, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1068, 'C', NULL, NULL, '1B', 68, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1067, 'C', NULL, NULL, '1B', 32, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1066, 'C', NULL, NULL, '1B', 62, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1065, 'C', NULL, NULL, '1B', 32, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1064, 'C', NULL, NULL, '1B', 56, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1063, 'C', NULL, NULL, '1B', 32, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1062, 'C', NULL, NULL, '1B', 50, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1061, 'C', NULL, NULL, '1B', 32, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1060, 'C', NULL, NULL, '1B', 44, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1059, 'C', NULL, NULL, '1B', 32, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1058, 'C', NULL, NULL, '1B', 38, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1057, 'C', NULL, NULL, '1B', 32, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1056, 'C', NULL, NULL, '1A', 96, 95);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1055, 'C', NULL, NULL, '1A', 95, 96);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1054, 'C', NULL, NULL, '1A', 96, 92);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1053, 'C', NULL, NULL, '1A', 92, 96);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1052, 'C', NULL, NULL, '1A', 95, 92);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1051, 'C', NULL, NULL, '1A', 92, 95);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1050, 'C', NULL, NULL, '1A', 96, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1049, 'C', NULL, NULL, '1A', 28, 96);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1048, 'C', NULL, NULL, '1A', 95, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1047, 'C', NULL, NULL, '1A', 28, 95);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1046, 'C', NULL, NULL, '1A', 92, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1045, 'C', NULL, NULL, '1A', 28, 92);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1044, 'C', NULL, NULL, '1A', 96, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1043, 'C', NULL, NULL, '1A', 25, 96);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1042, 'C', NULL, NULL, '1A', 95, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1041, 'C', NULL, NULL, '1A', 25, 95);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1040, 'C', NULL, NULL, '1A', 92, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1039, 'C', NULL, NULL, '1A', 25, 92);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1038, 'C', NULL, NULL, '1A', 28, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1037, 'C', NULL, NULL, '1A', 25, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1036, 'C', NULL, NULL, '1A', 96, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1035, 'C', NULL, NULL, '1A', 22, 96);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1034, 'C', NULL, NULL, '1A', 95, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1033, 'C', NULL, NULL, '1A', 22, 95);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1032, 'C', NULL, NULL, '1A', 92, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1031, 'C', NULL, NULL, '1A', 22, 92);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1030, 'C', NULL, NULL, '1A', 28, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1029, 'C', NULL, NULL, '1A', 22, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1028, 'C', NULL, NULL, '1A', 25, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1027, 'C', NULL, NULL, '1A', 22, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1026, 'C', NULL, NULL, '1A', 96, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1025, 'C', NULL, NULL, '1A', 19, 96);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1024, 'C', NULL, NULL, '1A', 95, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1023, 'C', NULL, NULL, '1A', 19, 95);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1022, 'C', NULL, NULL, '1A', 92, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1021, 'C', NULL, NULL, '1A', 19, 92);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1020, 'C', NULL, NULL, '1A', 28, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1019, 'C', NULL, NULL, '1A', 19, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1018, 'C', NULL, NULL, '1A', 25, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1017, 'C', NULL, NULL, '1A', 19, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1016, 'C', NULL, NULL, '1A', 22, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1015, 'C', NULL, NULL, '1A', 19, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1014, 'C', NULL, NULL, '1A', 96, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1013, 'C', NULL, NULL, '1A', 16, 96);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1012, 'C', NULL, NULL, '1A', 95, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1011, 'C', NULL, NULL, '1A', 16, 95);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1010, 'C', NULL, NULL, '1A', 92, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1009, 'C', NULL, NULL, '1A', 16, 92);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1008, 'C', NULL, NULL, '1A', 28, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1007, 'C', NULL, NULL, '1A', 16, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1006, 'C', NULL, NULL, '1A', 25, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1005, 'C', NULL, NULL, '1A', 16, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1004, 'C', NULL, NULL, '1A', 22, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1003, 'C', NULL, NULL, '1A', 16, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1002, 'C', NULL, NULL, '1A', 19, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1001, 'C', NULL, NULL, '1A', 16, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1000, 'C', NULL, NULL, '1A', 96, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (999, 'C', NULL, NULL, '1A', 13, 96);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (998, 'C', NULL, NULL, '1A', 95, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (997, 'C', NULL, NULL, '1A', 13, 95);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (996, 'C', NULL, NULL, '1A', 92, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (995, 'C', NULL, NULL, '1A', 13, 92);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (994, 'C', NULL, NULL, '1A', 28, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (993, 'C', NULL, NULL, '1A', 13, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (992, 'C', NULL, NULL, '1A', 25, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (991, 'C', NULL, NULL, '1A', 13, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (990, 'C', NULL, NULL, '1A', 22, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (989, 'C', NULL, NULL, '1A', 13, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (988, 'C', NULL, NULL, '1A', 19, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (987, 'C', NULL, NULL, '1A', 13, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (986, 'C', NULL, NULL, '1A', 16, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (985, 'C', NULL, NULL, '1A', 13, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (984, 'C', NULL, NULL, '1A', 96, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (983, 'C', NULL, NULL, '1A', 10, 96);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (982, 'C', NULL, NULL, '1A', 95, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (981, 'C', NULL, NULL, '1A', 10, 95);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (980, 'C', NULL, NULL, '1A', 92, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (979, 'C', NULL, NULL, '1A', 10, 92);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (978, 'C', NULL, NULL, '1A', 28, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (977, 'C', NULL, NULL, '1A', 10, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (976, 'C', NULL, NULL, '1A', 25, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (975, 'C', NULL, NULL, '1A', 10, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (974, 'C', NULL, NULL, '1A', 22, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (973, 'C', NULL, NULL, '1A', 10, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (972, 'C', NULL, NULL, '1A', 19, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (971, 'C', NULL, NULL, '1A', 10, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (970, 'C', NULL, NULL, '1A', 16, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (969, 'C', NULL, NULL, '1A', 10, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (968, 'C', NULL, NULL, '1A', 13, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (967, 'C', NULL, NULL, '1A', 10, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (966, 'C', NULL, NULL, '1A', 96, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (965, 'C', NULL, NULL, '1A', 7, 96);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (964, 'C', NULL, NULL, '1A', 95, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (963, 'C', NULL, NULL, '1A', 7, 95);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (962, 'C', NULL, NULL, '1A', 92, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (961, 'C', NULL, NULL, '1A', 7, 92);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (960, 'C', NULL, NULL, '1A', 28, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (959, 'C', NULL, NULL, '1A', 7, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (958, 'C', NULL, NULL, '1A', 25, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (957, 'C', NULL, NULL, '1A', 7, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (956, 'C', NULL, NULL, '1A', 22, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (955, 'C', NULL, NULL, '1A', 7, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (954, 'C', NULL, NULL, '1A', 19, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (953, 'C', NULL, NULL, '1A', 7, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (952, 'C', NULL, NULL, '1A', 16, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (951, 'C', NULL, NULL, '1A', 7, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (950, 'C', NULL, NULL, '1A', 13, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (949, 'C', NULL, NULL, '1A', 7, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (948, 'C', NULL, NULL, '1A', 10, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (947, 'C', NULL, NULL, '1A', 7, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (946, 'C', NULL, NULL, '1A', 96, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (945, 'C', NULL, NULL, '1A', 4, 96);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (944, 'C', NULL, NULL, '1A', 95, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (943, 'C', NULL, NULL, '1A', 4, 95);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (942, 'C', NULL, NULL, '1A', 92, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (941, 'C', NULL, NULL, '1A', 4, 92);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (940, 'C', NULL, NULL, '1A', 28, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (939, 'C', NULL, NULL, '1A', 4, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (938, 'C', NULL, NULL, '1A', 25, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (937, 'C', NULL, NULL, '1A', 4, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (936, 'C', NULL, NULL, '1A', 22, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (935, 'C', NULL, NULL, '1A', 4, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (934, 'C', NULL, NULL, '1A', 19, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (933, 'C', NULL, NULL, '1A', 4, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (932, 'C', NULL, NULL, '1A', 16, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (931, 'C', NULL, NULL, '1A', 4, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (930, 'C', NULL, NULL, '1A', 13, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (929, 'C', NULL, NULL, '1A', 4, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (928, 'C', NULL, NULL, '1A', 10, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (927, 'C', NULL, NULL, '1A', 4, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (926, 'C', NULL, NULL, '1A', 7, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (925, 'C', NULL, NULL, '1A', 4, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (924, 'C', NULL, NULL, '1A', 96, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (923, 'C', NULL, NULL, '1A', 1, 96);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (922, 'C', NULL, NULL, '1A', 95, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (921, 'C', NULL, NULL, '1A', 1, 95);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (920, 'C', NULL, NULL, '1A', 92, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (919, 'C', NULL, NULL, '1A', 1, 92);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (918, 'C', NULL, NULL, '1A', 28, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (917, 'C', NULL, NULL, '1A', 1, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (916, 'C', NULL, NULL, '1A', 25, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (915, 'C', NULL, NULL, '1A', 1, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (914, 'C', NULL, NULL, '1A', 22, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (913, 'C', NULL, NULL, '1A', 1, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (912, 'C', NULL, NULL, '1A', 19, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (911, 'C', NULL, NULL, '1A', 1, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (910, 'C', NULL, NULL, '1A', 16, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (909, 'C', NULL, NULL, '1A', 1, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (908, 'C', NULL, NULL, '1A', 13, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (907, 'C', NULL, NULL, '1A', 1, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (906, 'C', NULL, NULL, '1A', 10, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (905, 'C', NULL, NULL, '1A', 1, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (904, 'C', NULL, NULL, '1A', 7, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (903, 'C', NULL, NULL, '1A', 1, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (902, 'C', NULL, NULL, '1A', 4, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (901, 'C', NULL, NULL, '1A', 1, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (900, 'T', 14, NULL, NULL, 100, 99);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (899, 'T', 14, NULL, NULL, 99, 100);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (898, 'T', 14, NULL, NULL, 100, 96);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (897, 'T', 14, NULL, NULL, 96, 100);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (896, 'T', 14, NULL, NULL, 99, 96);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (895, 'T', 14, NULL, NULL, 96, 99);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (894, 'T', 13, NULL, NULL, 98, 97);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (893, 'T', 13, NULL, NULL, 97, 98);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (892, 'T', 13, NULL, NULL, 98, 95);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (891, 'T', 13, NULL, NULL, 95, 98);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (890, 'T', 13, NULL, NULL, 97, 95);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (889, 'T', 13, NULL, NULL, 95, 97);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (888, 'T', 12, NULL, NULL, 94, 93);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (887, 'T', 12, NULL, NULL, 93, 94);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (886, 'T', 12, NULL, NULL, 94, 92);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (885, 'T', 12, NULL, NULL, 92, 94);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (884, 'T', 12, NULL, NULL, 93, 92);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (883, 'T', 12, NULL, NULL, 92, 93);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (882, 'T', 11, NULL, NULL, 91, 90);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (881, 'T', 11, NULL, NULL, 90, 91);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (880, 'T', 11, NULL, NULL, 91, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (879, 'T', 11, NULL, NULL, 21, 91);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (878, 'T', 11, NULL, NULL, 90, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (877, 'T', 11, NULL, NULL, 21, 90);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (876, 'T', 11, NULL, NULL, 91, 89);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (875, 'T', 11, NULL, NULL, 89, 91);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (874, 'T', 11, NULL, NULL, 90, 89);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (873, 'T', 11, NULL, NULL, 89, 90);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (872, 'T', 11, NULL, NULL, 21, 89);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (871, 'T', 11, NULL, NULL, 89, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (870, 'T', 11, NULL, NULL, 91, 88);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (869, 'T', 11, NULL, NULL, 88, 91);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (868, 'T', 11, NULL, NULL, 90, 88);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (867, 'T', 11, NULL, NULL, 88, 90);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (866, 'T', 11, NULL, NULL, 21, 88);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (865, 'T', 11, NULL, NULL, 88, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (864, 'T', 11, NULL, NULL, 89, 88);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (863, 'T', 11, NULL, NULL, 88, 89);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (862, 'T', 11, NULL, NULL, 91, 20);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (861, 'T', 11, NULL, NULL, 20, 91);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (860, 'T', 11, NULL, NULL, 90, 20);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (859, 'T', 11, NULL, NULL, 20, 90);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (858, 'T', 11, NULL, NULL, 21, 20);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (857, 'T', 11, NULL, NULL, 20, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (856, 'T', 11, NULL, NULL, 89, 20);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (855, 'T', 11, NULL, NULL, 20, 89);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (854, 'T', 11, NULL, NULL, 88, 20);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (853, 'T', 11, NULL, NULL, 20, 88);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (852, 'T', 11, NULL, NULL, 91, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (851, 'T', 11, NULL, NULL, 87, 91);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (850, 'T', 11, NULL, NULL, 90, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (849, 'T', 11, NULL, NULL, 87, 90);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (848, 'T', 11, NULL, NULL, 21, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (847, 'T', 11, NULL, NULL, 87, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (846, 'T', 11, NULL, NULL, 89, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (845, 'T', 11, NULL, NULL, 87, 89);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (844, 'T', 11, NULL, NULL, 88, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (843, 'T', 11, NULL, NULL, 87, 88);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (842, 'T', 11, NULL, NULL, 20, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (841, 'T', 11, NULL, NULL, 87, 20);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (840, 'T', 11, NULL, NULL, 91, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (839, 'T', 11, NULL, NULL, 86, 91);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (838, 'T', 11, NULL, NULL, 90, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (837, 'T', 11, NULL, NULL, 86, 90);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (836, 'T', 11, NULL, NULL, 21, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (835, 'T', 11, NULL, NULL, 86, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (834, 'T', 11, NULL, NULL, 89, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (833, 'T', 11, NULL, NULL, 86, 89);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (832, 'T', 11, NULL, NULL, 88, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (831, 'T', 11, NULL, NULL, 86, 88);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (830, 'T', 11, NULL, NULL, 20, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (829, 'T', 11, NULL, NULL, 86, 20);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (828, 'T', 11, NULL, NULL, 87, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (827, 'T', 11, NULL, NULL, 86, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (826, 'T', 11, NULL, NULL, 91, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (825, 'T', 11, NULL, NULL, 19, 91);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (824, 'T', 11, NULL, NULL, 90, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (823, 'T', 11, NULL, NULL, 19, 90);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (822, 'T', 11, NULL, NULL, 21, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (821, 'T', 11, NULL, NULL, 19, 21);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (820, 'T', 11, NULL, NULL, 89, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (819, 'T', 11, NULL, NULL, 19, 89);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (818, 'T', 11, NULL, NULL, 88, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (817, 'T', 11, NULL, NULL, 19, 88);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (816, 'T', 11, NULL, NULL, 20, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (815, 'T', 11, NULL, NULL, 19, 20);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (814, 'T', 11, NULL, NULL, 87, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (813, 'T', 11, NULL, NULL, 19, 87);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (812, 'T', 11, NULL, NULL, 86, 19);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (811, 'T', 11, NULL, NULL, 19, 86);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (810, 'T', 10, NULL, NULL, 73, 72);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (809, 'T', 10, NULL, NULL, 72, 73);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (808, 'T', 10, NULL, NULL, 73, 15);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (807, 'T', 10, NULL, NULL, 15, 73);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (806, 'T', 10, NULL, NULL, 72, 15);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (805, 'T', 10, NULL, NULL, 15, 72);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (804, 'T', 10, NULL, NULL, 73, 71);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (803, 'T', 10, NULL, NULL, 71, 73);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (802, 'T', 10, NULL, NULL, 72, 71);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (801, 'T', 10, NULL, NULL, 71, 72);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (800, 'T', 10, NULL, NULL, 15, 71);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (799, 'T', 10, NULL, NULL, 71, 15);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (798, 'T', 10, NULL, NULL, 73, 70);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (797, 'T', 10, NULL, NULL, 70, 73);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (796, 'T', 10, NULL, NULL, 72, 70);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (795, 'T', 10, NULL, NULL, 70, 72);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (794, 'T', 10, NULL, NULL, 15, 70);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (793, 'T', 10, NULL, NULL, 70, 15);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (792, 'T', 10, NULL, NULL, 71, 70);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (791, 'T', 10, NULL, NULL, 70, 71);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (790, 'T', 10, NULL, NULL, 73, 14);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (789, 'T', 10, NULL, NULL, 14, 73);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (788, 'T', 10, NULL, NULL, 72, 14);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (787, 'T', 10, NULL, NULL, 14, 72);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (786, 'T', 10, NULL, NULL, 15, 14);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (785, 'T', 10, NULL, NULL, 14, 15);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (784, 'T', 10, NULL, NULL, 71, 14);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (783, 'T', 10, NULL, NULL, 14, 71);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (782, 'T', 10, NULL, NULL, 70, 14);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (781, 'T', 10, NULL, NULL, 14, 70);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (780, 'T', 10, NULL, NULL, 73, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (779, 'T', 10, NULL, NULL, 69, 73);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (778, 'T', 10, NULL, NULL, 72, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (777, 'T', 10, NULL, NULL, 69, 72);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (776, 'T', 10, NULL, NULL, 15, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (775, 'T', 10, NULL, NULL, 69, 15);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (774, 'T', 10, NULL, NULL, 71, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (773, 'T', 10, NULL, NULL, 69, 71);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (772, 'T', 10, NULL, NULL, 70, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (771, 'T', 10, NULL, NULL, 69, 70);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (770, 'T', 10, NULL, NULL, 14, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (769, 'T', 10, NULL, NULL, 69, 14);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (768, 'T', 10, NULL, NULL, 73, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (767, 'T', 10, NULL, NULL, 68, 73);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (766, 'T', 10, NULL, NULL, 72, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (765, 'T', 10, NULL, NULL, 68, 72);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (764, 'T', 10, NULL, NULL, 15, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (763, 'T', 10, NULL, NULL, 68, 15);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (762, 'T', 10, NULL, NULL, 71, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (761, 'T', 10, NULL, NULL, 68, 71);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (760, 'T', 10, NULL, NULL, 70, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (759, 'T', 10, NULL, NULL, 68, 70);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (758, 'T', 10, NULL, NULL, 14, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (757, 'T', 10, NULL, NULL, 68, 14);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (756, 'T', 10, NULL, NULL, 69, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (755, 'T', 10, NULL, NULL, 68, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (754, 'T', 10, NULL, NULL, 73, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (753, 'T', 10, NULL, NULL, 13, 73);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (752, 'T', 10, NULL, NULL, 72, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (751, 'T', 10, NULL, NULL, 13, 72);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (750, 'T', 10, NULL, NULL, 15, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (749, 'T', 10, NULL, NULL, 13, 15);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (748, 'T', 10, NULL, NULL, 71, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (747, 'T', 10, NULL, NULL, 13, 71);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (746, 'T', 10, NULL, NULL, 70, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (745, 'T', 10, NULL, NULL, 13, 70);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (744, 'T', 10, NULL, NULL, 14, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (743, 'T', 10, NULL, NULL, 13, 14);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (742, 'T', 10, NULL, NULL, 69, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (741, 'T', 10, NULL, NULL, 13, 69);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (740, 'T', 10, NULL, NULL, 68, 13);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (739, 'T', 10, NULL, NULL, 13, 68);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (738, 'T', 9, NULL, NULL, 79, 78);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (737, 'T', 9, NULL, NULL, 78, 79);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (736, 'T', 9, NULL, NULL, 79, 18);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (735, 'T', 9, NULL, NULL, 18, 79);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (734, 'T', 9, NULL, NULL, 78, 18);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (733, 'T', 9, NULL, NULL, 18, 78);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (732, 'T', 9, NULL, NULL, 79, 77);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (731, 'T', 9, NULL, NULL, 77, 79);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (730, 'T', 9, NULL, NULL, 78, 77);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (729, 'T', 9, NULL, NULL, 77, 78);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (728, 'T', 9, NULL, NULL, 18, 77);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (727, 'T', 9, NULL, NULL, 77, 18);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (726, 'T', 9, NULL, NULL, 79, 76);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (725, 'T', 9, NULL, NULL, 76, 79);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (724, 'T', 9, NULL, NULL, 78, 76);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (723, 'T', 9, NULL, NULL, 76, 78);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (722, 'T', 9, NULL, NULL, 18, 76);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (721, 'T', 9, NULL, NULL, 76, 18);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (720, 'T', 9, NULL, NULL, 77, 76);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (719, 'T', 9, NULL, NULL, 76, 77);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (718, 'T', 9, NULL, NULL, 79, 17);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (717, 'T', 9, NULL, NULL, 17, 79);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (716, 'T', 9, NULL, NULL, 78, 17);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (715, 'T', 9, NULL, NULL, 17, 78);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (714, 'T', 9, NULL, NULL, 18, 17);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (713, 'T', 9, NULL, NULL, 17, 18);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (712, 'T', 9, NULL, NULL, 77, 17);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (711, 'T', 9, NULL, NULL, 17, 77);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (710, 'T', 9, NULL, NULL, 76, 17);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (709, 'T', 9, NULL, NULL, 17, 76);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (708, 'T', 9, NULL, NULL, 79, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (707, 'T', 9, NULL, NULL, 75, 79);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (706, 'T', 9, NULL, NULL, 78, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (705, 'T', 9, NULL, NULL, 75, 78);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (704, 'T', 9, NULL, NULL, 18, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (703, 'T', 9, NULL, NULL, 75, 18);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (702, 'T', 9, NULL, NULL, 77, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (701, 'T', 9, NULL, NULL, 75, 77);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (700, 'T', 9, NULL, NULL, 76, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (699, 'T', 9, NULL, NULL, 75, 76);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (698, 'T', 9, NULL, NULL, 17, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (697, 'T', 9, NULL, NULL, 75, 17);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (696, 'T', 9, NULL, NULL, 79, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (695, 'T', 9, NULL, NULL, 74, 79);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (694, 'T', 9, NULL, NULL, 78, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (693, 'T', 9, NULL, NULL, 74, 78);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (692, 'T', 9, NULL, NULL, 18, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (691, 'T', 9, NULL, NULL, 74, 18);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (690, 'T', 9, NULL, NULL, 77, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (689, 'T', 9, NULL, NULL, 74, 77);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (688, 'T', 9, NULL, NULL, 76, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (687, 'T', 9, NULL, NULL, 74, 76);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (686, 'T', 9, NULL, NULL, 17, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (685, 'T', 9, NULL, NULL, 74, 17);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (684, 'T', 9, NULL, NULL, 75, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (683, 'T', 9, NULL, NULL, 74, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (682, 'T', 9, NULL, NULL, 79, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (681, 'T', 9, NULL, NULL, 16, 79);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (680, 'T', 9, NULL, NULL, 78, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (679, 'T', 9, NULL, NULL, 16, 78);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (678, 'T', 9, NULL, NULL, 18, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (677, 'T', 9, NULL, NULL, 16, 18);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (676, 'T', 9, NULL, NULL, 77, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (675, 'T', 9, NULL, NULL, 16, 77);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (674, 'T', 9, NULL, NULL, 76, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (673, 'T', 9, NULL, NULL, 16, 76);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (672, 'T', 9, NULL, NULL, 17, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (671, 'T', 9, NULL, NULL, 16, 17);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (670, 'T', 9, NULL, NULL, 75, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (669, 'T', 9, NULL, NULL, 16, 75);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (668, 'T', 9, NULL, NULL, 74, 16);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (667, 'T', 9, NULL, NULL, 16, 74);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (666, 'T', 8, NULL, NULL, 67, 66);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (665, 'T', 8, NULL, NULL, 66, 67);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (664, 'T', 8, NULL, NULL, 67, 12);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (663, 'T', 8, NULL, NULL, 12, 67);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (662, 'T', 8, NULL, NULL, 66, 12);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (661, 'T', 8, NULL, NULL, 12, 66);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (660, 'T', 8, NULL, NULL, 67, 65);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (659, 'T', 8, NULL, NULL, 65, 67);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (658, 'T', 8, NULL, NULL, 66, 65);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (657, 'T', 8, NULL, NULL, 65, 66);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (656, 'T', 8, NULL, NULL, 12, 65);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (655, 'T', 8, NULL, NULL, 65, 12);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (654, 'T', 8, NULL, NULL, 67, 64);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (653, 'T', 8, NULL, NULL, 64, 67);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (652, 'T', 8, NULL, NULL, 66, 64);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (651, 'T', 8, NULL, NULL, 64, 66);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (650, 'T', 8, NULL, NULL, 12, 64);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (649, 'T', 8, NULL, NULL, 64, 12);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (648, 'T', 8, NULL, NULL, 65, 64);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (647, 'T', 8, NULL, NULL, 64, 65);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (646, 'T', 8, NULL, NULL, 67, 11);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (645, 'T', 8, NULL, NULL, 11, 67);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (644, 'T', 8, NULL, NULL, 66, 11);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (643, 'T', 8, NULL, NULL, 11, 66);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (642, 'T', 8, NULL, NULL, 12, 11);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (641, 'T', 8, NULL, NULL, 11, 12);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (640, 'T', 8, NULL, NULL, 65, 11);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (639, 'T', 8, NULL, NULL, 11, 65);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (638, 'T', 8, NULL, NULL, 64, 11);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (637, 'T', 8, NULL, NULL, 11, 64);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (636, 'T', 8, NULL, NULL, 67, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (635, 'T', 8, NULL, NULL, 63, 67);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (634, 'T', 8, NULL, NULL, 66, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (633, 'T', 8, NULL, NULL, 63, 66);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (632, 'T', 8, NULL, NULL, 12, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (631, 'T', 8, NULL, NULL, 63, 12);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (630, 'T', 8, NULL, NULL, 65, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (629, 'T', 8, NULL, NULL, 63, 65);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (628, 'T', 8, NULL, NULL, 64, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (627, 'T', 8, NULL, NULL, 63, 64);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (626, 'T', 8, NULL, NULL, 11, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (625, 'T', 8, NULL, NULL, 63, 11);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (624, 'T', 8, NULL, NULL, 67, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (623, 'T', 8, NULL, NULL, 62, 67);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (622, 'T', 8, NULL, NULL, 66, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (621, 'T', 8, NULL, NULL, 62, 66);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (620, 'T', 8, NULL, NULL, 12, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (619, 'T', 8, NULL, NULL, 62, 12);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (618, 'T', 8, NULL, NULL, 65, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (617, 'T', 8, NULL, NULL, 62, 65);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (616, 'T', 8, NULL, NULL, 64, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (615, 'T', 8, NULL, NULL, 62, 64);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (614, 'T', 8, NULL, NULL, 11, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (613, 'T', 8, NULL, NULL, 62, 11);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (612, 'T', 8, NULL, NULL, 63, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (611, 'T', 8, NULL, NULL, 62, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (610, 'T', 8, NULL, NULL, 67, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (609, 'T', 8, NULL, NULL, 10, 67);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (608, 'T', 8, NULL, NULL, 66, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (607, 'T', 8, NULL, NULL, 10, 66);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (606, 'T', 8, NULL, NULL, 12, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (605, 'T', 8, NULL, NULL, 10, 12);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (604, 'T', 8, NULL, NULL, 65, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (603, 'T', 8, NULL, NULL, 10, 65);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (602, 'T', 8, NULL, NULL, 64, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (601, 'T', 8, NULL, NULL, 10, 64);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (600, 'T', 8, NULL, NULL, 11, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (599, 'T', 8, NULL, NULL, 10, 11);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (598, 'T', 8, NULL, NULL, 63, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (597, 'T', 8, NULL, NULL, 10, 63);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (596, 'T', 8, NULL, NULL, 62, 10);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (595, 'T', 8, NULL, NULL, 10, 62);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (594, 'T', 7, NULL, NULL, 49, 48);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (593, 'T', 7, NULL, NULL, 48, 49);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (592, 'T', 7, NULL, NULL, 49, 30);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (591, 'T', 7, NULL, NULL, 30, 49);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (590, 'T', 7, NULL, NULL, 48, 30);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (589, 'T', 7, NULL, NULL, 30, 48);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (588, 'T', 7, NULL, NULL, 49, 47);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (587, 'T', 7, NULL, NULL, 47, 49);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (586, 'T', 7, NULL, NULL, 48, 47);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (585, 'T', 7, NULL, NULL, 47, 48);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (584, 'T', 7, NULL, NULL, 30, 47);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (583, 'T', 7, NULL, NULL, 47, 30);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (582, 'T', 7, NULL, NULL, 49, 46);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (581, 'T', 7, NULL, NULL, 46, 49);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (580, 'T', 7, NULL, NULL, 48, 46);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (579, 'T', 7, NULL, NULL, 46, 48);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (578, 'T', 7, NULL, NULL, 30, 46);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (577, 'T', 7, NULL, NULL, 46, 30);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (576, 'T', 7, NULL, NULL, 47, 46);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (575, 'T', 7, NULL, NULL, 46, 47);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (574, 'T', 7, NULL, NULL, 49, 29);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (573, 'T', 7, NULL, NULL, 29, 49);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (572, 'T', 7, NULL, NULL, 48, 29);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (571, 'T', 7, NULL, NULL, 29, 48);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (570, 'T', 7, NULL, NULL, 30, 29);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (569, 'T', 7, NULL, NULL, 29, 30);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (568, 'T', 7, NULL, NULL, 47, 29);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (567, 'T', 7, NULL, NULL, 29, 47);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (566, 'T', 7, NULL, NULL, 46, 29);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (565, 'T', 7, NULL, NULL, 29, 46);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (564, 'T', 7, NULL, NULL, 49, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (563, 'T', 7, NULL, NULL, 45, 49);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (562, 'T', 7, NULL, NULL, 48, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (561, 'T', 7, NULL, NULL, 45, 48);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (560, 'T', 7, NULL, NULL, 30, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (559, 'T', 7, NULL, NULL, 45, 30);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (558, 'T', 7, NULL, NULL, 47, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (557, 'T', 7, NULL, NULL, 45, 47);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (556, 'T', 7, NULL, NULL, 46, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (555, 'T', 7, NULL, NULL, 45, 46);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (554, 'T', 7, NULL, NULL, 29, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (553, 'T', 7, NULL, NULL, 45, 29);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (552, 'T', 7, NULL, NULL, 49, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (551, 'T', 7, NULL, NULL, 44, 49);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (550, 'T', 7, NULL, NULL, 48, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (549, 'T', 7, NULL, NULL, 44, 48);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (548, 'T', 7, NULL, NULL, 30, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (547, 'T', 7, NULL, NULL, 44, 30);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (546, 'T', 7, NULL, NULL, 47, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (545, 'T', 7, NULL, NULL, 44, 47);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (544, 'T', 7, NULL, NULL, 46, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (543, 'T', 7, NULL, NULL, 44, 46);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (542, 'T', 7, NULL, NULL, 29, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (541, 'T', 7, NULL, NULL, 44, 29);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (540, 'T', 7, NULL, NULL, 45, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (539, 'T', 7, NULL, NULL, 44, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (538, 'T', 7, NULL, NULL, 49, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (537, 'T', 7, NULL, NULL, 28, 49);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (536, 'T', 7, NULL, NULL, 48, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (535, 'T', 7, NULL, NULL, 28, 48);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (534, 'T', 7, NULL, NULL, 30, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (533, 'T', 7, NULL, NULL, 28, 30);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (532, 'T', 7, NULL, NULL, 47, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (531, 'T', 7, NULL, NULL, 28, 47);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (530, 'T', 7, NULL, NULL, 46, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (529, 'T', 7, NULL, NULL, 28, 46);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (528, 'T', 7, NULL, NULL, 29, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (527, 'T', 7, NULL, NULL, 28, 29);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (526, 'T', 7, NULL, NULL, 45, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (525, 'T', 7, NULL, NULL, 28, 45);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (524, 'T', 7, NULL, NULL, 44, 28);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (523, 'T', 7, NULL, NULL, 28, 44);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (522, 'T', 6, NULL, NULL, 37, 36);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (521, 'T', 6, NULL, NULL, 36, 37);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (520, 'T', 6, NULL, NULL, 37, 24);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (519, 'T', 6, NULL, NULL, 24, 37);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (518, 'T', 6, NULL, NULL, 36, 24);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (517, 'T', 6, NULL, NULL, 24, 36);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (516, 'T', 6, NULL, NULL, 37, 35);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (515, 'T', 6, NULL, NULL, 35, 37);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (514, 'T', 6, NULL, NULL, 36, 35);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (513, 'T', 6, NULL, NULL, 35, 36);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (512, 'T', 6, NULL, NULL, 24, 35);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (511, 'T', 6, NULL, NULL, 35, 24);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (510, 'T', 6, NULL, NULL, 37, 34);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (509, 'T', 6, NULL, NULL, 34, 37);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (508, 'T', 6, NULL, NULL, 36, 34);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (507, 'T', 6, NULL, NULL, 34, 36);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (506, 'T', 6, NULL, NULL, 24, 34);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (505, 'T', 6, NULL, NULL, 34, 24);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (504, 'T', 6, NULL, NULL, 35, 34);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (503, 'T', 6, NULL, NULL, 34, 35);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (502, 'T', 6, NULL, NULL, 37, 23);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (501, 'T', 6, NULL, NULL, 23, 37);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (500, 'T', 6, NULL, NULL, 36, 23);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (499, 'T', 6, NULL, NULL, 23, 36);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (498, 'T', 6, NULL, NULL, 24, 23);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (497, 'T', 6, NULL, NULL, 23, 24);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (496, 'T', 6, NULL, NULL, 35, 23);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (495, 'T', 6, NULL, NULL, 23, 35);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (494, 'T', 6, NULL, NULL, 34, 23);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (493, 'T', 6, NULL, NULL, 23, 34);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (492, 'T', 6, NULL, NULL, 37, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (491, 'T', 6, NULL, NULL, 33, 37);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (490, 'T', 6, NULL, NULL, 36, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (489, 'T', 6, NULL, NULL, 33, 36);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (488, 'T', 6, NULL, NULL, 24, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (487, 'T', 6, NULL, NULL, 33, 24);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (486, 'T', 6, NULL, NULL, 35, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (485, 'T', 6, NULL, NULL, 33, 35);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (484, 'T', 6, NULL, NULL, 34, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (483, 'T', 6, NULL, NULL, 33, 34);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (482, 'T', 6, NULL, NULL, 23, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (481, 'T', 6, NULL, NULL, 33, 23);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (480, 'T', 6, NULL, NULL, 37, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (479, 'T', 6, NULL, NULL, 32, 37);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (478, 'T', 6, NULL, NULL, 36, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (477, 'T', 6, NULL, NULL, 32, 36);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (476, 'T', 6, NULL, NULL, 24, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (475, 'T', 6, NULL, NULL, 32, 24);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (474, 'T', 6, NULL, NULL, 35, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (473, 'T', 6, NULL, NULL, 32, 35);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (472, 'T', 6, NULL, NULL, 34, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (471, 'T', 6, NULL, NULL, 32, 34);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (470, 'T', 6, NULL, NULL, 23, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (469, 'T', 6, NULL, NULL, 32, 23);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (468, 'T', 6, NULL, NULL, 33, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (467, 'T', 6, NULL, NULL, 32, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (466, 'T', 6, NULL, NULL, 37, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (465, 'T', 6, NULL, NULL, 22, 37);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (464, 'T', 6, NULL, NULL, 36, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (463, 'T', 6, NULL, NULL, 22, 36);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (462, 'T', 6, NULL, NULL, 24, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (461, 'T', 6, NULL, NULL, 22, 24);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (460, 'T', 6, NULL, NULL, 35, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (459, 'T', 6, NULL, NULL, 22, 35);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (458, 'T', 6, NULL, NULL, 34, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (457, 'T', 6, NULL, NULL, 22, 34);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (456, 'T', 6, NULL, NULL, 23, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (455, 'T', 6, NULL, NULL, 22, 23);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (454, 'T', 6, NULL, NULL, 33, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (453, 'T', 6, NULL, NULL, 22, 33);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (452, 'T', 6, NULL, NULL, 32, 22);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (451, 'T', 6, NULL, NULL, 22, 32);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (450, 'T', 5, NULL, NULL, 61, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (449, 'T', 5, NULL, NULL, 60, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (448, 'T', 5, NULL, NULL, 61, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (447, 'T', 5, NULL, NULL, 9, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (446, 'T', 5, NULL, NULL, 60, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (445, 'T', 5, NULL, NULL, 9, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (444, 'T', 5, NULL, NULL, 61, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (443, 'T', 5, NULL, NULL, 59, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (442, 'T', 5, NULL, NULL, 60, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (441, 'T', 5, NULL, NULL, 59, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (440, 'T', 5, NULL, NULL, 9, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (439, 'T', 5, NULL, NULL, 59, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (438, 'T', 5, NULL, NULL, 61, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (437, 'T', 5, NULL, NULL, 58, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (436, 'T', 5, NULL, NULL, 60, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (435, 'T', 5, NULL, NULL, 58, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (434, 'T', 5, NULL, NULL, 9, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (433, 'T', 5, NULL, NULL, 58, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (432, 'T', 5, NULL, NULL, 59, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (431, 'T', 5, NULL, NULL, 58, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (430, 'T', 5, NULL, NULL, 61, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (429, 'T', 5, NULL, NULL, 8, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (428, 'T', 5, NULL, NULL, 60, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (427, 'T', 5, NULL, NULL, 8, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (426, 'T', 5, NULL, NULL, 9, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (425, 'T', 5, NULL, NULL, 8, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (424, 'T', 5, NULL, NULL, 59, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (423, 'T', 5, NULL, NULL, 8, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (422, 'T', 5, NULL, NULL, 58, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (421, 'T', 5, NULL, NULL, 8, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (420, 'T', 5, NULL, NULL, 61, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (419, 'T', 5, NULL, NULL, 57, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (418, 'T', 5, NULL, NULL, 60, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (417, 'T', 5, NULL, NULL, 57, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (416, 'T', 5, NULL, NULL, 9, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (415, 'T', 5, NULL, NULL, 57, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (414, 'T', 5, NULL, NULL, 59, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (413, 'T', 5, NULL, NULL, 57, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (412, 'T', 5, NULL, NULL, 58, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (411, 'T', 5, NULL, NULL, 57, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (410, 'T', 5, NULL, NULL, 8, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (409, 'T', 5, NULL, NULL, 57, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (408, 'T', 5, NULL, NULL, 61, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (407, 'T', 5, NULL, NULL, 56, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (406, 'T', 5, NULL, NULL, 60, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (405, 'T', 5, NULL, NULL, 56, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (404, 'T', 5, NULL, NULL, 9, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (403, 'T', 5, NULL, NULL, 56, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (402, 'T', 5, NULL, NULL, 59, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (401, 'T', 5, NULL, NULL, 56, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (400, 'T', 5, NULL, NULL, 58, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (399, 'T', 5, NULL, NULL, 56, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (398, 'T', 5, NULL, NULL, 8, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (397, 'T', 5, NULL, NULL, 56, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (396, 'T', 5, NULL, NULL, 57, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (395, 'T', 5, NULL, NULL, 56, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (394, 'T', 5, NULL, NULL, 61, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (393, 'T', 5, NULL, NULL, 7, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (392, 'T', 5, NULL, NULL, 60, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (391, 'T', 5, NULL, NULL, 7, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (390, 'T', 5, NULL, NULL, 9, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (389, 'T', 5, NULL, NULL, 7, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (388, 'T', 5, NULL, NULL, 59, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (387, 'T', 5, NULL, NULL, 7, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (386, 'T', 5, NULL, NULL, 58, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (385, 'T', 5, NULL, NULL, 7, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (384, 'T', 5, NULL, NULL, 8, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (383, 'T', 5, NULL, NULL, 7, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (382, 'T', 5, NULL, NULL, 57, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (381, 'T', 5, NULL, NULL, 7, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (380, 'T', 5, NULL, NULL, 56, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (379, 'T', 5, NULL, NULL, 7, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (378, 'T', 5, NULL, NULL, 61, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (377, 'T', 5, NULL, NULL, 55, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (376, 'T', 5, NULL, NULL, 60, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (375, 'T', 5, NULL, NULL, 55, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (374, 'T', 5, NULL, NULL, 9, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (373, 'T', 5, NULL, NULL, 55, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (372, 'T', 5, NULL, NULL, 59, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (371, 'T', 5, NULL, NULL, 55, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (370, 'T', 5, NULL, NULL, 58, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (369, 'T', 5, NULL, NULL, 55, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (368, 'T', 5, NULL, NULL, 8, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (367, 'T', 5, NULL, NULL, 55, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (366, 'T', 5, NULL, NULL, 57, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (365, 'T', 5, NULL, NULL, 55, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (364, 'T', 5, NULL, NULL, 56, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (363, 'T', 5, NULL, NULL, 55, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (362, 'T', 5, NULL, NULL, 7, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (361, 'T', 5, NULL, NULL, 55, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (360, 'T', 5, NULL, NULL, 61, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (359, 'T', 5, NULL, NULL, 54, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (358, 'T', 5, NULL, NULL, 60, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (357, 'T', 5, NULL, NULL, 54, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (356, 'T', 5, NULL, NULL, 9, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (355, 'T', 5, NULL, NULL, 54, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (354, 'T', 5, NULL, NULL, 59, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (353, 'T', 5, NULL, NULL, 54, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (352, 'T', 5, NULL, NULL, 58, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (351, 'T', 5, NULL, NULL, 54, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (350, 'T', 5, NULL, NULL, 8, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (349, 'T', 5, NULL, NULL, 54, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (348, 'T', 5, NULL, NULL, 57, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (347, 'T', 5, NULL, NULL, 54, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (346, 'T', 5, NULL, NULL, 56, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (345, 'T', 5, NULL, NULL, 54, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (344, 'T', 5, NULL, NULL, 7, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (343, 'T', 5, NULL, NULL, 54, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (342, 'T', 5, NULL, NULL, 55, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (341, 'T', 5, NULL, NULL, 54, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (340, 'T', 5, NULL, NULL, 61, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (339, 'T', 5, NULL, NULL, 6, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (338, 'T', 5, NULL, NULL, 60, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (337, 'T', 5, NULL, NULL, 6, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (336, 'T', 5, NULL, NULL, 9, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (335, 'T', 5, NULL, NULL, 6, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (334, 'T', 5, NULL, NULL, 59, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (333, 'T', 5, NULL, NULL, 6, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (332, 'T', 5, NULL, NULL, 58, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (331, 'T', 5, NULL, NULL, 6, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (330, 'T', 5, NULL, NULL, 8, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (329, 'T', 5, NULL, NULL, 6, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (328, 'T', 5, NULL, NULL, 57, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (327, 'T', 5, NULL, NULL, 6, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (326, 'T', 5, NULL, NULL, 56, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (325, 'T', 5, NULL, NULL, 6, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (324, 'T', 5, NULL, NULL, 7, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (323, 'T', 5, NULL, NULL, 6, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (322, 'T', 5, NULL, NULL, 55, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (321, 'T', 5, NULL, NULL, 6, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (320, 'T', 5, NULL, NULL, 54, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (319, 'T', 5, NULL, NULL, 6, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (318, 'T', 5, NULL, NULL, 61, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (317, 'T', 5, NULL, NULL, 53, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (316, 'T', 5, NULL, NULL, 60, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (315, 'T', 5, NULL, NULL, 53, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (314, 'T', 5, NULL, NULL, 9, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (313, 'T', 5, NULL, NULL, 53, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (312, 'T', 5, NULL, NULL, 59, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (311, 'T', 5, NULL, NULL, 53, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (310, 'T', 5, NULL, NULL, 58, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (309, 'T', 5, NULL, NULL, 53, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (308, 'T', 5, NULL, NULL, 8, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (307, 'T', 5, NULL, NULL, 53, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (306, 'T', 5, NULL, NULL, 57, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (305, 'T', 5, NULL, NULL, 53, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (304, 'T', 5, NULL, NULL, 56, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (303, 'T', 5, NULL, NULL, 53, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (302, 'T', 5, NULL, NULL, 7, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (301, 'T', 5, NULL, NULL, 53, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (300, 'T', 5, NULL, NULL, 55, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (299, 'T', 5, NULL, NULL, 53, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (298, 'T', 5, NULL, NULL, 54, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (297, 'T', 5, NULL, NULL, 53, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (296, 'T', 5, NULL, NULL, 6, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (295, 'T', 5, NULL, NULL, 53, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (294, 'T', 5, NULL, NULL, 61, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (293, 'T', 5, NULL, NULL, 52, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (292, 'T', 5, NULL, NULL, 60, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (291, 'T', 5, NULL, NULL, 52, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (290, 'T', 5, NULL, NULL, 9, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (289, 'T', 5, NULL, NULL, 52, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (288, 'T', 5, NULL, NULL, 59, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (287, 'T', 5, NULL, NULL, 52, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (286, 'T', 5, NULL, NULL, 58, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (285, 'T', 5, NULL, NULL, 52, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (284, 'T', 5, NULL, NULL, 8, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (283, 'T', 5, NULL, NULL, 52, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (282, 'T', 5, NULL, NULL, 57, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (281, 'T', 5, NULL, NULL, 52, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (280, 'T', 5, NULL, NULL, 56, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (279, 'T', 5, NULL, NULL, 52, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (278, 'T', 5, NULL, NULL, 7, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (277, 'T', 5, NULL, NULL, 52, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (276, 'T', 5, NULL, NULL, 55, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (275, 'T', 5, NULL, NULL, 52, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (274, 'T', 5, NULL, NULL, 54, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (273, 'T', 5, NULL, NULL, 52, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (272, 'T', 5, NULL, NULL, 6, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (271, 'T', 5, NULL, NULL, 52, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (270, 'T', 5, NULL, NULL, 53, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (269, 'T', 5, NULL, NULL, 52, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (268, 'T', 5, NULL, NULL, 61, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (267, 'T', 5, NULL, NULL, 5, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (266, 'T', 5, NULL, NULL, 60, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (265, 'T', 5, NULL, NULL, 5, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (264, 'T', 5, NULL, NULL, 9, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (263, 'T', 5, NULL, NULL, 5, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (262, 'T', 5, NULL, NULL, 59, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (261, 'T', 5, NULL, NULL, 5, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (260, 'T', 5, NULL, NULL, 58, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (259, 'T', 5, NULL, NULL, 5, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (258, 'T', 5, NULL, NULL, 8, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (257, 'T', 5, NULL, NULL, 5, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (256, 'T', 5, NULL, NULL, 57, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (255, 'T', 5, NULL, NULL, 5, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (254, 'T', 5, NULL, NULL, 56, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (253, 'T', 5, NULL, NULL, 5, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (252, 'T', 5, NULL, NULL, 7, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (251, 'T', 5, NULL, NULL, 5, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (250, 'T', 5, NULL, NULL, 55, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (249, 'T', 5, NULL, NULL, 5, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (248, 'T', 5, NULL, NULL, 54, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (247, 'T', 5, NULL, NULL, 5, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (246, 'T', 5, NULL, NULL, 6, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (245, 'T', 5, NULL, NULL, 5, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (244, 'T', 5, NULL, NULL, 53, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (243, 'T', 5, NULL, NULL, 5, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (242, 'T', 5, NULL, NULL, 52, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (241, 'T', 5, NULL, NULL, 5, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (240, 'T', 5, NULL, NULL, 61, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (239, 'T', 5, NULL, NULL, 51, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (238, 'T', 5, NULL, NULL, 60, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (237, 'T', 5, NULL, NULL, 51, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (236, 'T', 5, NULL, NULL, 9, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (235, 'T', 5, NULL, NULL, 51, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (234, 'T', 5, NULL, NULL, 59, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (233, 'T', 5, NULL, NULL, 51, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (232, 'T', 5, NULL, NULL, 58, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (231, 'T', 5, NULL, NULL, 51, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (230, 'T', 5, NULL, NULL, 8, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (229, 'T', 5, NULL, NULL, 51, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (228, 'T', 5, NULL, NULL, 57, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (227, 'T', 5, NULL, NULL, 51, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (226, 'T', 5, NULL, NULL, 56, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (225, 'T', 5, NULL, NULL, 51, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (224, 'T', 5, NULL, NULL, 7, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (223, 'T', 5, NULL, NULL, 51, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (222, 'T', 5, NULL, NULL, 55, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (221, 'T', 5, NULL, NULL, 51, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (220, 'T', 5, NULL, NULL, 54, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (219, 'T', 5, NULL, NULL, 51, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (218, 'T', 5, NULL, NULL, 6, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (217, 'T', 5, NULL, NULL, 51, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (216, 'T', 5, NULL, NULL, 53, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (215, 'T', 5, NULL, NULL, 51, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (214, 'T', 5, NULL, NULL, 52, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (213, 'T', 5, NULL, NULL, 51, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (212, 'T', 5, NULL, NULL, 5, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (211, 'T', 5, NULL, NULL, 51, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (210, 'T', 5, NULL, NULL, 61, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (209, 'T', 5, NULL, NULL, 50, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (208, 'T', 5, NULL, NULL, 60, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (207, 'T', 5, NULL, NULL, 50, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (206, 'T', 5, NULL, NULL, 9, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (205, 'T', 5, NULL, NULL, 50, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (204, 'T', 5, NULL, NULL, 59, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (203, 'T', 5, NULL, NULL, 50, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (202, 'T', 5, NULL, NULL, 58, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (201, 'T', 5, NULL, NULL, 50, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (200, 'T', 5, NULL, NULL, 8, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (199, 'T', 5, NULL, NULL, 50, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (198, 'T', 5, NULL, NULL, 57, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (197, 'T', 5, NULL, NULL, 50, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (196, 'T', 5, NULL, NULL, 56, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (195, 'T', 5, NULL, NULL, 50, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (194, 'T', 5, NULL, NULL, 7, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (193, 'T', 5, NULL, NULL, 50, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (192, 'T', 5, NULL, NULL, 55, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (191, 'T', 5, NULL, NULL, 50, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (190, 'T', 5, NULL, NULL, 54, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (189, 'T', 5, NULL, NULL, 50, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (188, 'T', 5, NULL, NULL, 6, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (187, 'T', 5, NULL, NULL, 50, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (186, 'T', 5, NULL, NULL, 53, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (185, 'T', 5, NULL, NULL, 50, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (184, 'T', 5, NULL, NULL, 52, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (183, 'T', 5, NULL, NULL, 50, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (182, 'T', 5, NULL, NULL, 5, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (181, 'T', 5, NULL, NULL, 50, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (180, 'T', 5, NULL, NULL, 51, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (179, 'T', 5, NULL, NULL, 50, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (178, 'T', 5, NULL, NULL, 61, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (177, 'T', 5, NULL, NULL, 4, 61);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (176, 'T', 5, NULL, NULL, 60, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (175, 'T', 5, NULL, NULL, 4, 60);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (174, 'T', 5, NULL, NULL, 9, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (173, 'T', 5, NULL, NULL, 4, 9);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (172, 'T', 5, NULL, NULL, 59, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (171, 'T', 5, NULL, NULL, 4, 59);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (170, 'T', 5, NULL, NULL, 58, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (169, 'T', 5, NULL, NULL, 4, 58);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (168, 'T', 5, NULL, NULL, 8, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (167, 'T', 5, NULL, NULL, 4, 8);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (166, 'T', 5, NULL, NULL, 57, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (165, 'T', 5, NULL, NULL, 4, 57);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (164, 'T', 5, NULL, NULL, 56, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (163, 'T', 5, NULL, NULL, 4, 56);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (162, 'T', 5, NULL, NULL, 7, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (161, 'T', 5, NULL, NULL, 4, 7);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (160, 'T', 5, NULL, NULL, 55, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (159, 'T', 5, NULL, NULL, 4, 55);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (158, 'T', 5, NULL, NULL, 54, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (157, 'T', 5, NULL, NULL, 4, 54);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (156, 'T', 5, NULL, NULL, 6, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (155, 'T', 5, NULL, NULL, 4, 6);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (154, 'T', 5, NULL, NULL, 53, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (153, 'T', 5, NULL, NULL, 4, 53);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (152, 'T', 5, NULL, NULL, 52, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (151, 'T', 5, NULL, NULL, 4, 52);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (150, 'T', 5, NULL, NULL, 5, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (149, 'T', 5, NULL, NULL, 4, 5);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (148, 'T', 5, NULL, NULL, 51, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (147, 'T', 5, NULL, NULL, 4, 51);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (146, 'T', 5, NULL, NULL, 50, 4);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (145, 'T', 5, NULL, NULL, 4, 50);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (144, 'T', 4, NULL, NULL, 43, 42);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (143, 'T', 4, NULL, NULL, 42, 43);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (142, 'T', 4, NULL, NULL, 43, 27);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (141, 'T', 4, NULL, NULL, 27, 43);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (140, 'T', 4, NULL, NULL, 42, 27);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (139, 'T', 4, NULL, NULL, 27, 42);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (138, 'T', 4, NULL, NULL, 43, 41);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (137, 'T', 4, NULL, NULL, 41, 43);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (136, 'T', 4, NULL, NULL, 42, 41);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (135, 'T', 4, NULL, NULL, 41, 42);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (134, 'T', 4, NULL, NULL, 27, 41);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (133, 'T', 4, NULL, NULL, 41, 27);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (132, 'T', 4, NULL, NULL, 43, 40);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (131, 'T', 4, NULL, NULL, 40, 43);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (130, 'T', 4, NULL, NULL, 42, 40);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (129, 'T', 4, NULL, NULL, 40, 42);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (128, 'T', 4, NULL, NULL, 27, 40);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (127, 'T', 4, NULL, NULL, 40, 27);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (126, 'T', 4, NULL, NULL, 41, 40);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (125, 'T', 4, NULL, NULL, 40, 41);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (124, 'T', 4, NULL, NULL, 43, 26);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (123, 'T', 4, NULL, NULL, 26, 43);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (122, 'T', 4, NULL, NULL, 42, 26);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (121, 'T', 4, NULL, NULL, 26, 42);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (120, 'T', 4, NULL, NULL, 27, 26);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (119, 'T', 4, NULL, NULL, 26, 27);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (118, 'T', 4, NULL, NULL, 41, 26);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (117, 'T', 4, NULL, NULL, 26, 41);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (116, 'T', 4, NULL, NULL, 40, 26);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (115, 'T', 4, NULL, NULL, 26, 40);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (114, 'T', 4, NULL, NULL, 43, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (113, 'T', 4, NULL, NULL, 39, 43);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (112, 'T', 4, NULL, NULL, 42, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (111, 'T', 4, NULL, NULL, 39, 42);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (110, 'T', 4, NULL, NULL, 27, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (109, 'T', 4, NULL, NULL, 39, 27);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (108, 'T', 4, NULL, NULL, 41, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (107, 'T', 4, NULL, NULL, 39, 41);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (106, 'T', 4, NULL, NULL, 40, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (105, 'T', 4, NULL, NULL, 39, 40);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (104, 'T', 4, NULL, NULL, 26, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (103, 'T', 4, NULL, NULL, 39, 26);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (102, 'T', 4, NULL, NULL, 43, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (101, 'T', 4, NULL, NULL, 38, 43);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (100, 'T', 4, NULL, NULL, 42, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (99, 'T', 4, NULL, NULL, 38, 42);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (98, 'T', 4, NULL, NULL, 27, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (97, 'T', 4, NULL, NULL, 38, 27);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (96, 'T', 4, NULL, NULL, 41, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (95, 'T', 4, NULL, NULL, 38, 41);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (94, 'T', 4, NULL, NULL, 40, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (93, 'T', 4, NULL, NULL, 38, 40);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (92, 'T', 4, NULL, NULL, 26, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (91, 'T', 4, NULL, NULL, 38, 26);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (90, 'T', 4, NULL, NULL, 39, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (89, 'T', 4, NULL, NULL, 38, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (88, 'T', 4, NULL, NULL, 43, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (87, 'T', 4, NULL, NULL, 25, 43);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (86, 'T', 4, NULL, NULL, 42, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (85, 'T', 4, NULL, NULL, 25, 42);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (84, 'T', 4, NULL, NULL, 27, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (83, 'T', 4, NULL, NULL, 25, 27);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (82, 'T', 4, NULL, NULL, 41, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (81, 'T', 4, NULL, NULL, 25, 41);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (80, 'T', 4, NULL, NULL, 40, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (79, 'T', 4, NULL, NULL, 25, 40);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (78, 'T', 4, NULL, NULL, 26, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (77, 'T', 4, NULL, NULL, 25, 26);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (76, 'T', 4, NULL, NULL, 39, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (75, 'T', 4, NULL, NULL, 25, 39);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (74, 'T', 4, NULL, NULL, 38, 25);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (73, 'T', 4, NULL, NULL, 25, 38);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (72, 'T', 2, NULL, NULL, 85, 84);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (71, 'T', 2, NULL, NULL, 84, 85);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (70, 'T', 2, NULL, NULL, 85, 3);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (69, 'T', 2, NULL, NULL, 3, 85);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (68, 'T', 2, NULL, NULL, 84, 3);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (67, 'T', 2, NULL, NULL, 3, 84);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (66, 'T', 2, NULL, NULL, 85, 83);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (65, 'T', 2, NULL, NULL, 83, 85);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (64, 'T', 2, NULL, NULL, 84, 83);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (63, 'T', 2, NULL, NULL, 83, 84);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (62, 'T', 2, NULL, NULL, 3, 83);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (61, 'T', 2, NULL, NULL, 83, 3);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (60, 'T', 2, NULL, NULL, 85, 82);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (59, 'T', 2, NULL, NULL, 82, 85);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (58, 'T', 2, NULL, NULL, 84, 82);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (57, 'T', 2, NULL, NULL, 82, 84);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (56, 'T', 2, NULL, NULL, 3, 82);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (55, 'T', 2, NULL, NULL, 82, 3);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (54, 'T', 2, NULL, NULL, 83, 82);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (53, 'T', 2, NULL, NULL, 82, 83);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (52, 'T', 2, NULL, NULL, 85, 2);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (51, 'T', 2, NULL, NULL, 2, 85);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (50, 'T', 2, NULL, NULL, 84, 2);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (49, 'T', 2, NULL, NULL, 2, 84);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (48, 'T', 2, NULL, NULL, 3, 2);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (47, 'T', 2, NULL, NULL, 2, 3);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (46, 'T', 2, NULL, NULL, 83, 2);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (45, 'T', 2, NULL, NULL, 2, 83);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (44, 'T', 2, NULL, NULL, 82, 2);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (43, 'T', 2, NULL, NULL, 2, 82);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (42, 'T', 2, NULL, NULL, 85, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (41, 'T', 2, NULL, NULL, 81, 85);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (40, 'T', 2, NULL, NULL, 84, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (39, 'T', 2, NULL, NULL, 81, 84);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (38, 'T', 2, NULL, NULL, 3, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (37, 'T', 2, NULL, NULL, 81, 3);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (36, 'T', 2, NULL, NULL, 83, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (35, 'T', 2, NULL, NULL, 81, 83);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (34, 'T', 2, NULL, NULL, 82, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (33, 'T', 2, NULL, NULL, 81, 82);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (32, 'T', 2, NULL, NULL, 2, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (31, 'T', 2, NULL, NULL, 81, 2);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (30, 'T', 2, NULL, NULL, 85, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (29, 'T', 2, NULL, NULL, 80, 85);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (28, 'T', 2, NULL, NULL, 84, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (27, 'T', 2, NULL, NULL, 80, 84);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (26, 'T', 2, NULL, NULL, 3, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (25, 'T', 2, NULL, NULL, 80, 3);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (24, 'T', 2, NULL, NULL, 83, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (23, 'T', 2, NULL, NULL, 80, 83);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (22, 'T', 2, NULL, NULL, 82, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (21, 'T', 2, NULL, NULL, 80, 82);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (20, 'T', 2, NULL, NULL, 2, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (19, 'T', 2, NULL, NULL, 80, 2);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (18, 'T', 2, NULL, NULL, 81, 80);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (17, 'T', 2, NULL, NULL, 80, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (16, 'T', 2, NULL, NULL, 85, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (15, 'T', 2, NULL, NULL, 1, 85);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (14, 'T', 2, NULL, NULL, 84, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (13, 'T', 2, NULL, NULL, 1, 84);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (12, 'T', 2, NULL, NULL, 3, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (11, 'T', 2, NULL, NULL, 1, 3);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (10, 'T', 2, NULL, NULL, 83, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (9, 'T', 2, NULL, NULL, 1, 83);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (8, 'T', 2, NULL, NULL, 82, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (7, 'T', 2, NULL, NULL, 1, 82);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (6, 'T', 2, NULL, NULL, 2, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (5, 'T', 2, NULL, NULL, 1, 2);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (4, 'T', 2, NULL, NULL, 81, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (3, 'T', 2, NULL, NULL, 1, 81);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (2, 'T', 2, NULL, NULL, 80, 1);
INSERT INTO crs_conflict (conflict_id, conflict_type, teacher_id, student_id, class_id, lesson_id1, lesson_id2) VALUES (1, 'T', 2, NULL, NULL, 1, 80);


--
-- TOC entry 1682 (class 0 OID 20654)
-- Dependencies: 1291
-- Data for Name: crs_lesson; Type: TABLE DATA; Schema: classroom; Owner: postgres
--

INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (1, 'Maths, 1st year, class 1a', 'Maths', 1, 2, NULL, 'MATH', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:26:33', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (2, 'Maths, 2nd year, class 2a', 'Maths', 2, 2, NULL, 'MATH', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:26:45', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (3, 'Maths, 3rd year, class 3a', 'Maths', 3, 2, NULL, 'MATH', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:27:05', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (4, 'English Language, 1st year, class 1a', 'English Language', 1, 5, NULL, 'LANG', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:22:46', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (5, 'English Language, 2nd year, class 2a', 'English Language', 2, 5, NULL, 'LANG', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:22:56', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (6, 'English Language, 3rd year, class 3a', 'English Language', 3, 5, NULL, 'LANG', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:23:05', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (7, 'English Literature, 1st year, class 1a', 'English Literature', 1, 5, NULL, 'LANG', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:23:36', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (8, 'English Literature, 2nd year, class 2a', 'English Literature', 2, 5, NULL, 'LANG', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:23:57', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (9, 'English Literature, 3rd year, class 3a', 'English Literature', 3, 5, NULL, 'LANG', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:24:06', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (10, 'French, 1st year, class 1a', 'French', 1, 8, NULL, 'LANG', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:24:15', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (11, 'French, 2nd year, class 2a', 'French', 2, 8, NULL, 'LANG', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:24:33', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (12, 'French, 3rd year, class 3a', 'French', 3, 8, NULL, 'LANG', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:24:42', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (13, 'Geography, 1st year, class 1a', 'Geography', 1, 10, NULL, 'SCIENCE', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:24:53', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (14, 'Geography, 2nd year, class 2a', 'Geography', 2, 10, NULL, 'SCIENCE', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:25:36', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (15, 'Geography, 3rd year, class 3a', 'Geography', 3, 10, NULL, 'SCIENCE', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:25:45', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (16, 'History, 1st year, class 1a', 'History', 1, 9, NULL, 'HIST', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:25:55', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (17, 'History, 2nd year, class 2a', 'History', 2, 9, NULL, 'HIST', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:26:04', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (18, 'History, 3rd year, class 3a', 'History', 3, 9, NULL, 'HIST', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:26:20', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (19, 'Physics, 1st year, class 1a', 'Physics', 1, 11, NULL, 'SCIENCE', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:28:07', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (20, 'Physics, 2nd year, class 2a', 'Physics', 2, 11, NULL, 'SCIENCE', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:28:58', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (21, 'Physics, 3rd year, class 3a', 'Physics', 3, 11, NULL, 'SCIENCE', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:29:09', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (22, 'Art, 1st year, class 1a', 'Art', 1, 6, NULL, 'ART', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:20:34', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (23, 'Art, 2nd year, class 2a', 'Art', 2, 6, NULL, 'ART', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:20:45', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (24, 'Art, 3rd year, class 3a', 'Art', 3, 6, NULL, 'ART', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:20:55', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (25, 'Biology, 1st year, class 1a', 'Biology', 1, 4, NULL, 'SCIENCE', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:21:06', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (26, 'Biology, 2nd year, class 2a', 'Biology', 2, 4, NULL, 'SCIENCE', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:21:24', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (27, 'Biology, 3rd year, class 3a', 'Biology', 3, 4, NULL, 'SCIENCE', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:21:33', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (28, 'Chemistry, 1st year, class 1a', 'Chemistry', 1, 7, NULL, 'SCIENCE', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:21:43', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (29, 'Chemistry, 2nd year, class 2a', 'Chemistry', 2, 7, NULL, 'SCIENCE', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:22:10', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (30, 'Chemistry, 3rd year, class 3a', 'Chemistry', 3, 7, NULL, 'SCIENCE', '2004-12-23 12:00:00', 'AJM', '2005-07-28 14:22:19', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (31, 'Nuclear Physics', 'Nuclear Physics', 3, 3, NULL, 'SCIENCE', '2004-12-26 10:08:00', 'AJM', '2005-07-28 14:28:03', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (32, 'Art, 1st year, class 1b', 'Art', 1, 6, NULL, 'ART', '2005-01-30 17:46:54', 'AJM', '2005-07-28 14:20:38', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (33, 'Art, 1st year, class 1c', 'Art', 1, 6, NULL, 'ART', '2005-01-30 17:47:04', 'AJM', '2005-07-28 14:20:41', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (34, 'Art, 2nd year, class 2b', 'Art', 2, 6, NULL, 'ART', '2005-01-30 17:52:23', 'AJM', '2005-07-28 14:20:49', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (35, 'Art, 2nd year, class 2c', 'Art', 2, 6, NULL, 'ART', '2005-01-30 17:52:31', 'AJM', '2005-07-28 14:20:52', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (36, 'Art, 3rd year, class 3b', 'Art', 3, 6, NULL, 'ART', '2005-01-30 17:52:48', 'AJM', '2005-07-28 14:20:59', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (37, 'Art, 3rd year, class 3c', 'Art', 3, 6, NULL, 'ART', '2005-01-30 17:52:54', 'AJM', '2005-07-28 14:21:02', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (38, 'Biology, 1st year, class 1b', 'Biology', 1, 4, NULL, 'SCIENCE', '2005-01-30 17:53:31', 'AJM', '2005-07-28 14:21:18', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (39, 'Biology, 1st year, class 1c', 'Biology', 1, 4, NULL, 'SCIENCE', '2005-01-30 17:53:37', 'AJM', '2005-07-28 14:21:21', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (40, 'Biology, 2nd year, class 2b', 'Biology', 2, 4, NULL, 'SCIENCE', '2005-01-30 17:55:11', 'AJM', '2005-07-28 14:21:27', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (41, 'Biology, 2nd year, class 2c', 'Biology', 2, 4, NULL, 'SCIENCE', '2005-01-30 17:55:16', 'AJM', '2005-07-28 14:21:30', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (42, 'Biology, 3rd year, class 3b', 'Biology', 3, 4, NULL, 'SCIENCE', '2005-01-30 17:55:33', 'AJM', '2005-07-28 14:21:36', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (43, 'Biology, 3rd year, class 3c', 'Biology', 3, 4, NULL, 'SCIENCE', '2005-01-30 17:55:39', 'AJM', '2005-07-28 14:21:40', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (44, 'Chemistry, 1st year, class 1b', 'Chemistry', 1, 7, NULL, 'SCIENCE', '2005-01-30 17:56:05', 'AJM', '2005-07-28 14:21:45', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (45, 'Chemistry, 1st year, class 1c', 'Chemistry', 1, 7, NULL, 'SCIENCE', '2005-01-30 17:56:12', 'AJM', '2005-07-28 14:22:07', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (46, 'Chemistry, 2nd year, class 2b', 'Chemistry', 2, 7, NULL, 'SCIENCE', '2005-01-30 18:00:54', 'AJM', '2005-07-28 14:22:13', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (47, 'Chemistry, 2nd year, class 2c', 'Chemistry', 2, 7, NULL, 'SCIENCE', '2005-01-30 18:01:01', 'AJM', '2005-07-28 14:22:16', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (48, 'Chemistry, 3rd year, class 3b', 'Chemistry', 3, 7, NULL, 'SCIENCE', '2005-01-30 18:01:24', 'AJM', '2005-07-28 14:22:22', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (49, 'Chemistry, 3rd year, class 3c', 'Chemistry', 3, 7, NULL, 'SCIENCE', '2005-01-30 18:01:29', 'AJM', '2005-07-28 14:22:25', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (50, 'English Language, 1st year, class 1b', 'English Language', 1, 5, NULL, 'LANG', '2005-01-30 18:01:49', 'AJM', '2005-07-28 14:22:50', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (51, 'English Language, 1st year, class 1c', 'English Language', 1, 5, NULL, 'LANG', '2005-01-30 18:01:56', 'AJM', '2005-07-28 14:22:53', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (52, 'English Language, 2nd year, class 2b', 'English Language', 2, 5, NULL, 'LANG', '2005-01-30 18:02:32', 'AJM', '2005-07-28 14:22:59', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (53, 'English Language, 2nd year, class 2c', 'English Language', 2, 5, NULL, 'LANG', '2005-01-30 18:02:37', 'AJM', '2005-07-28 14:23:02', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (54, 'English Language, 3rd year, class 3b', 'English Language', 3, 5, NULL, 'LANG', '2005-01-30 18:02:53', 'AJM', '2005-07-28 14:23:08', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (55, 'English Language, 3rd year, class 3c', 'English Language', 3, 5, NULL, 'LANG', '2005-01-30 18:02:59', 'AJM', '2005-07-28 14:23:11', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (56, 'English Literature, 1st year, class 1b', 'English Literature', 1, 5, NULL, 'LANG', '2005-01-30 18:03:41', 'AJM', '2005-07-28 14:23:50', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (57, 'English Literature, 1st year, class 1c', 'English Literature', 1, 5, NULL, 'LANG', '2005-01-30 18:03:46', 'AJM', '2005-07-28 14:23:54', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (58, 'English Literature, 2nd year, class 2b', 'English Literature', 2, 5, NULL, 'LANG', '2005-01-30 18:04:02', 'AJM', '2005-07-28 14:24:00', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (59, 'English Literature, 2nd year, class 2c', 'English Literature', 2, 5, NULL, 'LANG', '2005-01-30 18:04:08', 'AJM', '2005-07-28 14:24:03', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (60, 'English Literature, 3rd year, class 3b', 'English Literature', 3, 5, NULL, 'LANG', '2005-01-30 18:04:34', 'AJM', '2005-07-28 14:24:09', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (61, 'English Literature, 3rd year, class 3c', 'English Literature', 3, 5, NULL, 'LANG', '2005-01-30 18:04:40', 'AJM', '2005-07-28 14:24:13', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (62, 'French, 1st year, class 1b', 'French', 1, 8, NULL, 'LANG', '2005-01-30 18:05:06', 'AJM', '2005-07-28 14:24:19', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (63, 'French, 1st year, class 1c', 'French', 1, 8, NULL, 'LANG', '2005-01-30 18:05:11', 'AJM', '2005-07-28 14:24:30', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (64, 'French, 2nd year, class 2b', 'French', 2, 8, NULL, 'LANG', '2005-01-30 18:05:25', 'AJM', '2005-07-28 14:24:36', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (65, 'French, 2nd year, class 2c', 'French', 2, 8, NULL, 'LANG', '2005-01-30 18:05:30', 'AJM', '2005-07-28 14:24:39', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (66, 'French, 3rd year, class 3b', 'French', 3, 8, NULL, 'LANG', '2005-01-30 18:05:50', 'AJM', '2005-07-28 14:24:45', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (67, 'French, 3rd year, class 3c', 'French', 3, 8, NULL, 'LANG', '2005-01-30 18:05:56', 'AJM', '2005-07-28 14:24:48', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (68, 'Geography, 1st year, class 1b', 'Geography', 1, 10, NULL, 'SCIENCE', '2005-01-30 18:27:02', 'AJM', '2005-07-28 14:24:55', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (69, 'Geography, 1st year, class 1c', 'Geography', 1, 10, NULL, 'SCIENCE', '2005-01-30 18:27:08', 'AJM', '2005-07-28 14:24:59', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (70, 'Geography, 2nd year, class 2b', 'Geography', 2, 10, NULL, 'SCIENCE', '2005-01-30 18:29:51', 'AJM', '2005-07-28 14:25:39', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (71, 'Geography, 2nd year, class 2c', 'Geography', 2, 10, NULL, 'SCIENCE', '2005-01-30 18:29:56', 'AJM', '2005-07-28 14:25:42', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (72, 'Geography, 3rd year, class 3b', 'Geography', 3, 10, NULL, 'SCIENCE', '2005-01-30 18:33:53', 'AJM', '2005-07-28 14:25:48', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (73, 'Geography, 3rd year, class 3c', 'Geography', 3, 10, NULL, 'SCIENCE', '2005-01-30 18:33:58', 'AJM', '2005-07-28 14:25:51', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (74, 'History, 1st year, class 1b', 'History', 1, 9, NULL, 'HIST', '2005-01-30 18:40:49', 'AJM', '2005-07-28 14:25:58', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (75, 'History, 1st year, class 1c', 'History', 1, 9, NULL, 'HIST', '2005-01-30 18:40:56', 'AJM', '2005-07-28 14:26:01', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (76, 'History, 2nd year, class 2b', 'History', 2, 9, NULL, 'HIST', '2005-01-30 18:41:21', 'AJM', '2005-07-28 14:26:14', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (77, 'History, 2nd year, class 2c', 'History', 2, 9, NULL, 'HIST', '2005-01-30 18:41:25', 'AJM', '2005-07-28 14:26:17', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (78, 'History, 3rd year, class 3b', 'History', 3, 9, NULL, 'HIST', '2005-01-30 18:41:43', 'AJM', '2005-07-28 14:26:24', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (79, 'History, 3rd year, class 3c', 'History', 3, 9, NULL, 'HIST', '2005-01-30 18:41:48', 'AJM', '2005-07-28 14:26:28', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (80, 'Maths, 1st year, class 1b', 'Maths', 1, 2, NULL, 'MATH', '2005-01-30 18:42:09', 'AJM', '2005-07-28 14:26:37', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (81, 'Maths, 1st year, class 1c', 'Maths', 1, 2, NULL, 'MATH', '2005-01-30 18:42:14', 'AJM', '2005-07-28 14:26:40', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (82, 'Maths, 2nd year, class 2b', 'Maths', 2, 2, NULL, 'MATH', '2005-01-30 18:42:30', 'AJM', '2005-07-28 14:26:49', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (83, 'Maths, 2nd year, class 2c', 'Maths', 2, 2, NULL, 'MATH', '2005-01-30 18:42:35', 'AJM', '2005-07-28 14:27:01', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (84, 'Maths, 3rd year, class 3b', 'Maths', 3, 2, NULL, 'MATH', '2005-01-30 18:42:53', 'AJM', '2005-07-28 14:27:08', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (85, 'Maths, 3rd year, class 3c', 'Maths', 3, 2, NULL, 'MATH', '2005-01-30 18:43:00', 'AJM', '2005-07-28 14:27:12', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (86, 'Physics, 1st year, class 1b', 'Physics', 1, 11, NULL, 'SCIENCE', '2005-01-30 18:43:19', 'AJM', '2005-07-28 14:28:11', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (87, 'Physics, 1st year, class 1c', 'Physics', 1, 11, NULL, 'SCIENCE', '2005-01-30 18:43:26', 'AJM', '2005-07-28 14:28:55', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (88, 'Physics, 2nd year, class 2b', 'Physics', 2, 11, NULL, 'SCIENCE', '2005-01-30 18:43:42', 'AJM', '2005-07-28 14:29:02', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (89, 'Physics, 2nd year, class 2c', 'Physics', 2, 11, NULL, 'SCIENCE', '2005-01-30 18:43:48', 'AJM', '2005-07-28 14:29:06', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (90, 'Physics, 3rd year, class 3b', 'Physics', 3, 11, NULL, 'SCIENCE', '2005-01-30 18:44:09', 'AJM', '2005-07-28 14:29:12', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (91, 'Physics, 3rd year, class 3c', 'Physics', 3, 11, NULL, 'SCIENCE', '2005-01-30 18:44:16', 'AJM', '2005-07-28 14:29:16', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (92, 'Religious Knowledge, 1st year, class 1a', 'Religious Knowledge', 1, 12, NULL, 'THEOLOGY', '2005-01-31 19:15:13', 'AJM', '2005-07-28 14:29:20', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (93, 'Religious Knowledge, 1st year, class 1b', 'Religious Knowledge', 1, 12, NULL, 'THEOLOGY', '2005-01-31 19:15:43', 'AJM', '2005-07-28 14:29:23', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (94, 'Religious Knowledge, 1st year, class 1c', 'Religious Knowledge', 1, 12, NULL, 'THEOLOGY', '2005-01-31 19:15:54', 'AJM', '2005-07-28 14:29:26', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (95, 'Music, 1st year, class 1a', 'Music', 1, 13, NULL, 'MUSIC', '2005-01-31 21:18:19', 'AJM', '2005-07-28 14:27:51', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (96, 'Economics, 1st year, class 1a', 'Economics', 1, 14, NULL, '', '2005-01-31 21:18:34', 'AJM', NULL, NULL);
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (97, 'Music, 1st year, class 1b', 'Music', 1, 13, NULL, 'MUSIC', '2005-02-25 21:25:54', 'AJM', '2005-07-28 14:27:55', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (98, 'Music, 1st year, class 1c', 'Music', 1, 13, NULL, 'MUSIC', '2005-02-25 21:26:02', 'AJM', '2005-07-28 14:27:59', 'AJM');
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (99, 'Economics, 1st year, class 1b', 'Economics', 1, 14, NULL, '', '2005-02-25 21:28:02', 'AJM', NULL, NULL);
INSERT INTO crs_lesson (lesson_id, lesson_name, lesson_short_name, "year", teacher_id, lesson_notes, subject_id, created_date, created_user, revised_date, revised_user) VALUES (100, 'Economics, 1st year, class 1c', 'Economics', 1, 14, NULL, '', '2005-02-25 21:28:09', 'AJM', NULL, NULL);


--
-- TOC entry 1683 (class 0 OID 20664)
-- Dependencies: 1292
-- Data for Name: crs_room; Type: TABLE DATA; Schema: classroom; Owner: postgres
--

INSERT INTO crs_room (room_id, room_desc, room_capacity, room_notes, created_date, created_user, revised_date, revised_user) VALUES ('A.1', 'Room A.1', 30, NULL, '2004-12-23 12:00:00', 'AJM', NULL, NULL);
INSERT INTO crs_room (room_id, room_desc, room_capacity, room_notes, created_date, created_user, revised_date, revised_user) VALUES ('A.2', 'Room A.2', 30, NULL, '2004-12-23 12:00:00', 'AJM', NULL, NULL);
INSERT INTO crs_room (room_id, room_desc, room_capacity, room_notes, created_date, created_user, revised_date, revised_user) VALUES ('A.3', 'Room A.3', 30, NULL, '2004-12-23 12:00:00', 'AJM', NULL, NULL);
INSERT INTO crs_room (room_id, room_desc, room_capacity, room_notes, created_date, created_user, revised_date, revised_user) VALUES ('A.4', 'Room A.4', 25, NULL, '2004-12-23 12:00:00', 'AJM', NULL, NULL);
INSERT INTO crs_room (room_id, room_desc, room_capacity, room_notes, created_date, created_user, revised_date, revised_user) VALUES ('A.5', 'Room A.5', 25, NULL, '2004-12-23 12:00:00', 'AJM', NULL, NULL);
INSERT INTO crs_room (room_id, room_desc, room_capacity, room_notes, created_date, created_user, revised_date, revised_user) VALUES ('CHEMLAB', 'Chemistry Lab', 35, NULL, '2004-12-23 12:00:00', 'AJM', '2005-02-26 15:15:51', 'AJM');
INSERT INTO crs_room (room_id, room_desc, room_capacity, room_notes, created_date, created_user, revised_date, revised_user) VALUES ('BIOLAB', 'Biology Lab', 35, NULL, '2004-12-23 12:00:00', 'AJM', '2005-02-26 15:15:46', 'AJM');
INSERT INTO crs_room (room_id, room_desc, room_capacity, room_notes, created_date, created_user, revised_date, revised_user) VALUES ('GYM', 'Gymnasium', 30, NULL, '2005-01-31 19:11:34', 'AJM', NULL, NULL);
INSERT INTO crs_room (room_id, room_desc, room_capacity, room_notes, created_date, created_user, revised_date, revised_user) VALUES ('PHYLAB', 'Physics Lab', 30, NULL, '2005-02-26 15:11:22', 'AJM', '2005-02-26 15:15:57', 'AJM');
INSERT INTO crs_room (room_id, room_desc, room_capacity, room_notes, created_date, created_user, revised_date, revised_user) VALUES ('MUSIC', 'Music Room', 30, NULL, '2005-02-26 15:22:56', 'AJM', NULL, NULL);


--
-- TOC entry 1684 (class 0 OID 20675)
-- Dependencies: 1293
-- Data for Name: crs_schedule; Type: TABLE DATA; Schema: classroom; Owner: postgres
--

INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 1, 'A.1', 1, '09:00:00', '10:00:00', 22, 'Y', '', '2005-01-03 17:53:26', 'AJM', '2005-02-15 19:26:32', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 2, 'A.1', 1, '10:00:00', '11:00:00', 16, 'Y', '', '2005-01-03 19:07:33', 'AJM', '2005-02-15 19:26:32', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 3, 'A.1', 1, '11:00:00', '12:00:00', 13, 'Y', '', '2005-01-09 21:25:52', 'AJM', '2005-02-15 18:44:29', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 8, 'CHEMLAB', 2, '11:00:00', '12:00:00', 28, 'Y', '', '2005-01-31 21:38:48', 'AJM', '2005-02-26 15:13:33', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 9, 'A.1', 2, '13:00:00', '14:30:00', 96, 'Y', '', '2005-01-31 21:39:14', 'AJM', '2005-02-21 19:07:13', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 10, 'BIOLAB', 2, '14:30:00', '15:30:00', 25, 'Y', '', '2005-01-31 21:39:34', 'AJM', '2005-02-26 15:17:34', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 11, 'A.1', 3, '09:00:00', '10:00:00', 1, 'Y', '', '2005-01-31 21:40:47', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 4, 'A.1', 1, '13:00:00', '14:00:00', 4, 'Y', '', '2005-01-31 18:38:04', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 5, 'A.1', 1, '14:00:00', '15:30:00', 1, 'Y', '', '2005-01-31 18:39:48', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 6, 'MUSIC', 2, '09:00:00', '10:00:00', 95, 'Y', '', '2005-01-31 21:37:52', 'AJM', '2005-02-26 15:23:44', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 7, 'A.1', 2, '10:00:00', '11:00:00', 7, 'Y', '', '2005-01-31 21:38:22', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 12, 'A.1', 3, '10:00:00', '11:00:00', 4, 'Y', '', '2005-01-31 21:41:08', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 13, 'A.1', 3, '11:00:00', '12:00:00', 10, 'Y', '', '2005-01-31 21:41:30', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 14, 'A.1', 3, '13:00:00', '14:00:00', 13, 'Y', '', '2005-01-31 21:41:50', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 15, 'PHYLAB', 3, '14:00:00', '15:30:00', 19, 'Y', '', '2005-01-31 21:42:15', 'AJM', '2005-02-26 15:19:06', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 16, 'A.1', 4, '09:00:00', '10:00:00', 92, 'Y', '', '2005-01-31 21:42:30', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 17, 'A.1', 4, '10:00:00', '11:00:00', 10, 'Y', '', '2005-01-31 21:42:59', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 18, 'BIOLAB', 4, '11:00:00', '12:00:00', 25, 'Y', '', '2005-01-31 21:43:28', 'AJM', '2005-02-26 15:17:40', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 19, 'A.1', 4, '13:00:00', '14:30:00', 7, 'Y', '', '2005-01-31 21:43:52', 'AJM', '2005-02-21 19:08:23', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 20, 'CHEMLAB', 4, '14:30:00', '15:30:00', 28, 'Y', '', '2005-01-31 21:44:08', 'AJM', '2005-02-26 15:13:40', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 21, 'A.1', 5, '09:00:00', '10:00:00', 16, 'Y', '', '2005-01-31 21:44:25', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 22, 'A.1', 5, '10:00:00', '11:00:00', 96, 'Y', '', '2005-01-31 21:44:43', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 23, 'PHYLAB', 5, '11:00:00', '12:00:00', 19, 'Y', '', '2005-01-31 21:45:00', 'AJM', '2005-02-26 15:19:15', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 24, 'MUSIC', 5, '13:00:00', '14:00:00', 95, 'Y', '', '2005-01-31 21:45:16', 'AJM', '2005-02-26 15:23:50', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 25, 'A.1', 5, '14:00:00', '15:30:00', 22, 'Y', '', '2005-01-31 21:45:32', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 41, 'A.2', 3, '09:00:00', '10:00:00', 93, 'Y', '', '2005-02-25 21:35:20', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 42, 'A.2', 3, '10:00:00', '11:00:00', 62, 'Y', '', '2005-02-25 21:35:34', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 43, 'BIOLAB', 3, '11:00:00', '12:00:00', 38, 'Y', '', '2005-02-25 21:35:46', 'AJM', '2005-02-26 15:18:11', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 37, 'A.2', 5, '10:00:00', '11:00:00', 74, 'Y', '', '2005-02-25 21:32:51', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 38, 'A.2', 5, '11:00:00', '12:00:00', 68, 'Y', '', '2005-02-25 21:33:09', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 39, 'A.2', 5, '13:00:00', '14:00:00', 50, 'Y', '', '2005-02-25 21:33:26', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 40, 'A.2', 5, '14:00:00', '15:30:00', 80, 'Y', '', '2005-02-25 21:33:46', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 76, 'PHYLAB', 1, '10:00:00', '12:00:00', 31, 'Y', '', '2005-02-26 15:28:50', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 26, 'MUSIC', 1, '09:00:00', '10:00:00', 97, 'Y', '', '2005-02-25 21:26:35', 'AJM', '2005-02-26 15:24:12', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 27, 'A.2', 1, '10:00:00', '11:00:00', 56, 'Y', '', '2005-02-25 21:27:04', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 36, 'A.2', 5, '09:00:00', '10:00:00', 32, 'Y', '', '2005-02-25 21:32:40', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 30, 'BIOLAB', 1, '14:30:00', '15:30:00', 38, 'Y', '', '2005-02-25 21:29:03', 'AJM', '2005-02-26 15:18:05', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 31, 'A.2', 2, '09:00:00', '10:00:00', 80, 'Y', '', '2005-02-25 21:30:00', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 32, 'A.2', 2, '11:00:00', '12:00:00', 50, 'Y', '', '2005-02-25 21:30:20', 'AJM', '2005-02-25 21:47:18', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 35, 'PHYLAB', 2, '14:00:00', '15:30:00', 86, 'Y', '', '2005-02-25 21:31:15', 'AJM', '2005-02-26 15:19:53', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 28, 'CHEMLAB', 1, '11:00:00', '12:00:00', 44, 'Y', '', '2005-02-25 21:27:21', 'AJM', '2005-02-26 15:14:06', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 29, 'A.2', 1, '13:00:00', '14:30:00', 99, 'Y', '', '2005-02-25 21:28:31', 'AJM', '2005-02-25 21:29:15', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 33, 'A.2', 2, '10:00:00', '11:00:00', 62, 'Y', '', '2005-02-25 21:30:35', 'AJM', '2005-02-25 21:47:18', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 34, 'A.2', 2, '13:00:00', '14:00:00', 68, 'Y', '', '2005-02-25 21:30:57', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 44, 'A.2', 3, '13:00:00', '14:30:00', 56, 'Y', '', '2005-02-25 21:36:06', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 45, 'CHEMLAB', 3, '14:30:00', '15:30:00', 44, 'Y', '', '2005-02-25 21:36:23', 'AJM', '2005-02-26 15:14:13', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 46, 'A.2', 4, '09:00:00', '10:00:00', 74, 'Y', '', '2005-02-25 21:36:58', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 47, 'A.2', 4, '10:00:00', '11:00:00', 99, 'Y', '', '2005-02-25 21:37:10', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 48, 'PHYLAB', 4, '11:00:00', '12:00:00', 86, 'Y', '', '2005-02-25 21:37:24', 'AJM', '2005-02-26 15:20:00', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 49, 'MUSIC', 4, '13:00:00', '14:00:00', 97, 'Y', '', '2005-02-25 21:37:42', 'AJM', '2005-02-26 15:24:17', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 50, 'A.2', 4, '14:00:00', '15:30:00', 32, 'Y', '', '2005-02-25 21:37:59', 'AJM', NULL, NULL);
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 51, 'A.3', 1, '10:00:00', '11:00:00', 33, 'Y', '', '2005-02-25 23:20:47', 'AJM', '2005-02-25 23:22:40', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 68, 'BIOLAB', 4, '10:00:00', '11:00:00', 39, 'Y', '', '2005-02-25 23:31:23', 'AJM', '2005-02-26 15:18:40', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 52, 'A.3', 1, '09:00:00', '10:00:00', 75, 'Y', '', '2005-02-25 23:21:06', 'AJM', '2005-02-25 23:22:40', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 60, 'BIOLAB', 2, '11:00:00', '12:00:00', 39, 'Y', '', '2005-02-25 23:25:48', 'AJM', '2005-02-26 15:18:34', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 53, 'A.3', 1, '13:00:00', '14:00:00', 69, 'Y', '', '2005-02-25 23:21:22', 'AJM', '2005-02-25 23:23:43', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 59, 'A.3', 2, '10:00:00', '11:00:00', 100, 'Y', '', '2005-02-25 23:25:34', 'AJM', '2005-02-26 00:07:10', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 54, 'A.3', 1, '14:00:00', '15:30:00', 51, 'Y', '', '2005-02-25 23:21:46', 'AJM', '2005-02-25 23:23:44', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 61, 'A.3', 3, '13:00:00', '14:00:00', 81, 'Y', '', '2005-02-25 23:27:29', 'AJM', '2005-02-25 23:29:20', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 55, 'A.3', 1, '11:00:00', '12:00:00', 81, 'Y', '', '2005-02-25 23:22:00', 'AJM', '2005-02-25 23:23:44', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 56, 'MUSIC', 2, '13:00:00', '14:30:00', 98, 'Y', '', '2005-02-25 23:24:42', 'AJM', '2005-02-26 15:26:27', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 57, 'A.3', 2, '09:00:00', '10:00:00', 57, 'Y', '', '2005-02-25 23:24:59', 'AJM', '2005-02-26 00:07:11', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 58, 'CHEMLAB', 2, '14:30:00', '15:30:00', 45, 'Y', '', '2005-02-25 23:25:16', 'AJM', '2005-02-26 15:14:46', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 62, 'A.3', 3, '11:00:00', '12:00:00', 51, 'Y', '', '2005-02-25 23:28:00', 'AJM', '2005-02-25 23:29:37', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 73, 'PHYLAB', 5, '09:00:00', '10:00:00', 87, 'Y', '', '2005-02-25 23:34:07', 'AJM', '2005-02-26 15:20:25', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 63, 'A.3', 3, '14:00:00', '15:30:00', 63, 'Y', '', '2005-02-25 23:28:18', 'AJM', '2005-02-25 23:30:14', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 67, 'A.3', 4, '09:00:00', '10:00:00', 63, 'Y', '', '2005-02-25 23:31:02', 'AJM', '2005-02-26 00:07:50', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 64, 'A.3', 3, '09:00:00', '10:00:00', 69, 'Y', '', '2005-02-25 23:28:35', 'AJM', '2005-02-25 23:29:21', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 72, 'A.3', 5, '11:00:00', '12:00:00', 100, 'Y', '', '2005-02-25 23:33:44', 'AJM', '2005-02-26 00:08:12', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 65, 'PHYLAB', 3, '10:00:00', '11:00:00', 87, 'Y', '', '2005-02-25 23:28:53', 'AJM', '2005-02-26 15:20:18', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 66, 'A.3', 4, '11:00:00', '12:00:00', 94, 'Y', '', '2005-02-25 23:30:46', 'AJM', '2005-02-26 00:07:50', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 69, 'A.3', 4, '14:30:00', '15:30:00', 57, 'Y', '', '2005-02-25 23:31:46', 'AJM', '2005-02-25 23:33:00', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 70, 'CHEMLAB', 4, '13:00:00', '14:30:00', 45, 'Y', '', '2005-02-25 23:32:01', 'AJM', '2005-02-26 15:14:53', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 71, 'A.3', 5, '14:00:00', '15:30:00', 75, 'Y', '', '2005-02-25 23:33:30', 'AJM', '2005-02-25 23:36:12', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 74, 'MUSIC', 5, '10:00:00', '11:00:00', 98, 'Y', '', '2005-02-25 23:34:24', 'AJM', '2005-02-26 15:26:34', 'AJM');
INSERT INTO crs_schedule (schedule_id, seq_no, room_id, day_no, start_time, end_time, lesson_id, is_valid, schedule_errors, created_date, created_user, revised_date, revised_user) VALUES (1, 75, 'A.3', 5, '13:00:00', '14:00:00', 33, 'Y', '', '2005-02-25 23:34:37', 'AJM', '2005-02-25 23:35:15', 'AJM');


--
-- TOC entry 1685 (class 0 OID 20691)
-- Dependencies: 1294
-- Data for Name: crs_schedule_hdr; Type: TABLE DATA; Schema: classroom; Owner: postgres
--

INSERT INTO crs_schedule_hdr (schedule_id, schedule_desc, schedule_notes, is_active, start_time, end_time, last_day_no, created_date, created_user, revised_date, revised_user) VALUES (1, 'Test # 1', NULL, 'Y', '09:00:00', '16:00:00', 5, '2005-01-03 16:30:01', 'AJM', '2005-02-25 17:46:01', 'AJM');


--
-- TOC entry 1686 (class 0 OID 20703)
-- Dependencies: 1295
-- Data for Name: crs_student; Type: TABLE DATA; Schema: classroom; Owner: postgres
--

INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (1, 'Anthony', 'Abbot', 'J', NULL, '1C', NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 19:38:43', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (2, 'Bartholomew', 'Barclay', 'B', 3, NULL, NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 19:42:27', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (3, 'Christopher', 'Carter', 'C', 3, NULL, NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:34:37', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (4, 'Derek', 'Donaldson', 'D', 3, NULL, NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:36:06', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (5, 'Eric', 'Emery', 'E', 3, NULL, NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:37:20', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (6, 'Frederick', 'Ford', 'F', 3, NULL, NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:38:34', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (7, 'Gary', 'Garfield', 'G', 3, NULL, NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:40:10', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (8, 'Harry', 'Hoffman', 'H', 3, NULL, NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:41:13', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (9, 'Ian', 'Isleworth', 'K', 3, NULL, NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:42:09', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (10, 'Jerry', 'Jackson', 'J', NULL, '1C', NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:43:17', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (11, 'Kevin', 'King', 'K', 3, NULL, NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:44:56', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (12, 'Larry', 'Long', 'L', 3, NULL, NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:45:55', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (13, 'Mary', 'Mitchell', 'M', 3, NULL, NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:48:02', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (14, 'Nicholas', 'Nickleby', 'N', 3, NULL, NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:49:01', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (15, 'Orville', 'Oakes', 'P', NULL, '2C', NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:49:58', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (16, 'Peter', 'Parker', 'P', NULL, '3C', NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:51:20', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (17, 'Quentin', 'Quick', 'K', NULL, '3A', NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:52:09', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (18, 'Robert', 'Robertson', 'J', 3, NULL, NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:53:12', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (19, 'Samuel', 'Smith', 'L', 3, NULL, NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:54:05', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (20, 'Terry', 'Thomas', 'O', 3, NULL, NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:54:57', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (21, 'Ursula', 'Urquart', 'P', NULL, '3C', NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:56:07', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (22, 'Veronica', 'Villiers', 'P', 3, NULL, NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:57:04', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (23, 'Willy', 'Wonka', 'P', 3, NULL, NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 21:57:58', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (24, 'Adam', 'Xanadu', NULL, NULL, '1A', NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 22:04:24', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (25, 'Yohannes', 'Yeoman', NULL, NULL, '3B', NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 22:05:43', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (26, 'Zebedee', 'Zabaglioni', NULL, NULL, '1B', NULL, '2004-12-23 12:00:00', 'AJM', '2005-01-24 22:06:56', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (27, 'Harold', 'Abbey', 'W', NULL, '1A', NULL, '2005-01-23 16:45:04', 'AJM', '2005-01-24 19:38:28', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (28, 'Alan', 'Abbot', 'D', NULL, '1B', NULL, '2005-01-23 16:45:21', 'AJM', '2005-01-24 19:38:35', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (29, 'Eric', 'Abbott', 'JW', NULL, '2A', NULL, '2005-01-23 16:46:03', 'AJM', '2005-01-24 19:39:02', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (30, 'John', 'Abbotts', NULL, NULL, '2B', NULL, '2005-01-23 16:46:26', 'AJM', '2005-01-24 19:39:07', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (31, 'Thomas', 'Abercrombie', NULL, NULL, '2C', NULL, '2005-01-23 16:46:53', 'AJM', '2005-01-24 19:39:10', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (32, 'Roger', 'Ackerman', NULL, NULL, '3A', NULL, '2005-01-23 16:47:25', 'AJM', '2005-01-24 19:39:14', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (33, 'Michael', 'Ackland', NULL, NULL, '3B', NULL, '2005-01-23 16:47:52', 'AJM', '2005-01-24 19:39:18', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (34, 'Diana', 'Acott', 'L', NULL, '3C', NULL, '2005-01-23 16:49:07', 'AJM', '2005-01-24 19:39:22', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (35, 'Roger', 'Acourt', 'A', 3, NULL, NULL, '2005-01-23 16:49:24', 'AJM', '2005-01-24 21:35:16', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (36, 'Charles', 'Babbage', NULL, NULL, '1A', NULL, '2005-01-23 16:50:07', 'AJM', '2005-01-24 19:41:07', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (37, 'Brenda', 'Babbington', 'R', NULL, '1B', NULL, '2005-01-23 16:50:35', 'AJM', '2005-01-24 19:41:11', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (38, 'Derek', 'Backhurst', 'F', NULL, '1C', NULL, '2005-01-23 16:51:01', 'AJM', '2005-01-24 19:41:15', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (39, 'Mary', 'Backshall', 'A', NULL, '2A', NULL, '2005-01-23 16:51:39', 'AJM', '2005-01-24 19:41:19', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (40, 'Angela', 'Backshell', 'J', NULL, '2B', NULL, '2005-01-23 16:52:02', 'AJM', '2005-01-24 19:41:23', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (41, 'Kevim', 'Backus', 'M', NULL, '2C', NULL, '2005-01-23 16:52:26', 'AJM', '2005-01-24 19:41:27', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (42, 'Brenda', 'Bacon', NULL, NULL, '3A', NULL, '2005-01-23 16:53:11', 'AJM', '2005-01-24 19:41:31', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (43, 'Brian', 'Bacon', NULL, NULL, '3B', NULL, '2005-01-23 16:53:21', 'AJM', '2005-01-24 19:41:34', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (44, 'Frank', 'Bacon', 'W', NULL, '3C', NULL, '2005-01-23 16:53:42', 'AJM', '2005-01-24 19:41:38', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (45, 'Geoff', 'Cable', NULL, NULL, '1B', NULL, '2005-01-23 16:54:49', 'AJM', '2005-01-24 21:33:41', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (46, 'Eric', 'Caborn', NULL, NULL, '1C', NULL, '2005-01-23 16:55:19', 'AJM', '2005-01-24 21:33:45', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (47, 'David', 'Cabot', NULL, NULL, '2A', NULL, '2005-01-23 16:55:40', 'AJM', '2005-01-24 21:33:48', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (48, 'Charles', 'Cabbot', NULL, NULL, '1A', NULL, '2005-01-23 16:55:52', 'AJM', '2005-01-24 21:33:38', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (49, 'Alan', 'Caddick', NULL, NULL, '2B', NULL, '2005-01-23 16:56:29', 'AJM', '2005-01-24 21:33:51', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (50, 'Derek', 'Cadell', NULL, NULL, '2C', NULL, '2005-01-23 16:56:43', 'AJM', '2005-01-24 21:33:56', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (51, 'Thomas', 'Campbell', NULL, NULL, '3A', NULL, '2005-01-23 16:57:14', 'AJM', '2005-01-24 21:33:59', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (52, 'William', 'Campbell', NULL, NULL, '3B', NULL, '2005-01-23 16:57:24', 'AJM', '2005-01-24 21:34:03', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (53, 'Charles', 'Campbell-Smith', 'M', NULL, '3C', NULL, '2005-01-23 16:58:01', 'AJM', '2005-01-24 21:34:06', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (54, 'Peter', 'Dabbs', 'F', NULL, '1A', NULL, '2005-01-23 17:49:02', 'AJM', '2005-01-24 21:35:31', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (55, 'Nigel', 'Dabney', 'R', NULL, '1B', NULL, '2005-01-23 17:49:26', 'AJM', '2005-01-24 21:35:39', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (56, 'Alan', 'Dabo', NULL, NULL, '1C', NULL, '2005-01-23 17:49:48', 'AJM', '2005-01-24 21:35:42', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (57, 'John', 'Dace', 'F', NULL, '2A', NULL, '2005-01-23 17:50:16', 'AJM', '2005-01-24 21:35:45', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (58, 'Stephen', 'Dacey', NULL, NULL, '2B', NULL, '2005-01-23 17:50:31', 'AJM', '2005-01-24 21:35:49', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (59, 'Stephen', 'Dack', NULL, NULL, '2C', NULL, '2005-01-23 17:51:12', 'AJM', '2005-01-24 21:35:52', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (60, 'Ursula', 'Dade', 'M', NULL, '3A', NULL, '2005-01-23 17:51:34', 'AJM', '2005-01-24 21:35:55', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (61, 'Ian', 'Daggett', NULL, NULL, '3B', NULL, '2005-01-23 17:52:32', 'AJM', '2005-01-24 21:35:59', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (62, 'Peter', 'Dailey', NULL, NULL, '3C', NULL, '2005-01-23 17:52:59', 'AJM', '2005-01-24 21:36:02', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (63, 'Alan', 'Eade', 'G', NULL, '1A', NULL, '2005-01-23 17:53:47', 'AJM', '2005-01-24 21:36:49', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (64, 'Anthony', 'Eades', 'R', NULL, '1B', NULL, '2005-01-23 17:54:25', 'AJM', '2005-01-24 21:36:52', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (65, 'Charles', 'Eadie', 'M', NULL, '1C', NULL, '2005-01-23 17:54:45', 'AJM', '2005-01-24 21:36:55', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (66, 'Stephanie', 'Eagles', NULL, NULL, '2A', NULL, '2005-01-23 17:54:59', 'AJM', '2005-01-24 21:36:59', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (67, 'Peter', 'Eales', 'G', NULL, '2B', NULL, '2005-01-23 17:55:21', 'AJM', '2005-01-24 21:37:02', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (68, 'David', 'Ealing', 'B', NULL, '2C', NULL, '2005-01-23 17:55:38', 'AJM', '2005-01-24 21:37:05', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (69, 'Camilla', 'Earl', NULL, NULL, '3A', NULL, '2005-01-23 17:56:38', 'AJM', '2005-01-24 21:37:09', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (70, 'Matthew', 'Earls', NULL, NULL, '3C', NULL, '2005-01-23 17:58:16', 'AJM', '2005-01-24 21:37:15', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (71, 'Andrew', 'Earley', NULL, NULL, '3B', NULL, '2005-01-23 17:58:25', 'AJM', '2005-01-24 21:37:12', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (72, 'Laurence', 'Faber', NULL, NULL, '1A', NULL, '2005-01-23 17:59:15', 'AJM', '2005-01-24 21:37:58', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (73, 'Bartholomew', 'Fabian', 'D', NULL, '1B', NULL, '2005-01-23 17:59:46', 'AJM', '2005-01-24 21:38:01', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (74, 'Gerry', 'Fade', NULL, NULL, '1C', NULL, '2005-01-23 18:00:08', 'AJM', '2005-01-24 21:38:05', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (75, 'Harold', 'Fagan', NULL, NULL, '2A', NULL, '2005-01-23 18:00:23', 'AJM', '2005-01-24 21:38:08', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (76, 'Eric', 'Fagg', 'K', NULL, '2B', NULL, '2005-01-23 18:00:40', 'AJM', '2005-01-24 21:38:12', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (77, 'Malcolm', 'Fagin', NULL, NULL, '2C', NULL, '2005-01-23 18:01:09', 'AJM', '2005-01-24 21:38:15', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (78, 'Alan', 'Fahey', NULL, NULL, '3A', NULL, '2005-01-23 18:01:28', 'AJM', '2005-01-24 21:38:18', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (79, 'Charles', 'Fairbrother', NULL, NULL, '3C', NULL, '2005-01-23 18:04:04', 'AJM', '2005-01-24 21:38:24', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (80, 'Adam', 'Fairbrother', NULL, NULL, '3B', NULL, '2005-01-23 18:04:18', 'AJM', '2005-01-24 21:38:21', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (81, 'Donald', 'Gabriel', NULL, NULL, '1A', NULL, '2005-01-23 18:05:10', 'AJM', '2005-01-24 21:39:39', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (82, 'Charles', 'Gadd', 'J', NULL, '1B', NULL, '2005-01-23 18:05:42', 'AJM', '2005-01-24 21:39:41', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (83, 'Kevin', 'Gadsby', NULL, NULL, '1C', NULL, '2005-01-23 18:08:02', 'AJM', '2005-01-24 21:39:44', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (84, 'Alan', 'Gaff', 'N', NULL, '2A', NULL, '2005-01-23 18:08:22', 'AJM', '2005-01-24 21:39:48', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (85, 'David', 'Gaffney', NULL, NULL, '2B', NULL, '2005-01-23 18:08:31', 'AJM', '2005-01-24 21:39:51', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (86, 'Frank', 'Gage', 'B', NULL, '2C', NULL, '2005-01-23 18:08:50', 'AJM', '2005-01-24 21:39:54', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (87, 'Jackie', 'Gaines', NULL, NULL, '3A', NULL, '2005-01-23 18:09:17', 'AJM', '2005-01-24 21:39:57', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (88, 'Paul', 'Gainey', NULL, NULL, '3B', NULL, '2005-01-23 18:09:47', 'AJM', '2005-01-24 21:40:01', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (89, 'Alan', 'Gale', NULL, NULL, '3C', NULL, '2005-01-23 18:10:06', 'AJM', '2005-01-24 21:40:05', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (90, 'Gordon', 'Hack', NULL, NULL, '1A', NULL, '2005-01-23 18:11:40', 'AJM', '2005-01-24 21:40:40', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (91, 'Eric', 'Hacker', NULL, NULL, '1B', NULL, '2005-01-23 18:11:59', 'AJM', '2005-01-24 21:40:43', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (92, 'David', 'Hackett', 'J', NULL, '1C', NULL, '2005-01-23 18:12:21', 'AJM', '2005-01-24 21:40:46', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (93, 'Roger', 'Hackney', NULL, NULL, '2A', NULL, '2005-01-23 18:12:30', 'AJM', '2005-01-24 21:40:52', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (94, 'William', 'Hackwell', 'S', NULL, '2B', NULL, '2005-01-23 18:12:52', 'AJM', '2005-01-24 21:40:55', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (95, 'Alan', 'Hadden', 'C', NULL, '2C', NULL, '2005-01-23 18:13:48', 'AJM', '2005-01-24 21:40:58', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (96, 'David', 'Haddock', 'J', NULL, '3A', NULL, '2005-01-23 18:14:04', 'AJM', '2005-01-24 21:41:01', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (97, 'Michael', 'Hadley', NULL, NULL, '3B', NULL, '2005-01-23 18:14:29', 'AJM', '2005-01-24 21:41:04', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (98, 'Kevin', 'Hadwick', NULL, NULL, '3C', NULL, '2005-01-23 18:14:55', 'AJM', '2005-01-24 21:41:07', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (99, 'Alan', 'Iles', 'D', NULL, '1A', NULL, '2005-01-23 18:19:45', 'AJM', '2005-01-24 21:41:41', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (100, 'Michael', 'Illing', 'R', NULL, '1B', NULL, '2005-01-23 18:20:08', 'AJM', '2005-01-24 21:41:43', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (101, 'Fred', 'Illingworth', 'K', NULL, '1C', NULL, '2005-01-23 18:20:20', 'AJM', '2005-01-24 21:41:47', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (102, 'Stephen', 'Imrie', NULL, NULL, '2A', NULL, '2005-01-23 18:20:59', 'AJM', '2005-01-24 21:41:50', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (103, 'David', 'Ince', NULL, NULL, '2B', NULL, '2005-01-23 18:21:13', 'AJM', '2005-01-24 21:41:53', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (104, 'Roger', 'Ingham', 'T', NULL, '2C', NULL, '2005-01-23 18:21:32', 'AJM', '2005-01-24 21:41:56', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (105, 'Nicholas', 'Ingleby', 'J', NULL, '3A', NULL, '2005-01-23 18:22:00', 'AJM', '2005-01-24 21:41:59', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (106, 'John', 'Ingram', NULL, NULL, '3B', NULL, '2005-01-23 18:22:42', 'AJM', '2005-01-24 21:42:02', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (107, 'Roger', 'Ingram', NULL, NULL, '3C', NULL, '2005-01-23 18:22:49', 'AJM', '2005-01-24 21:42:05', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (108, 'Gordon', 'Jack', 'D', NULL, '1A', NULL, '2005-01-23 18:36:34', 'AJM', '2005-01-24 21:43:08', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (109, 'Michael', 'Jackman', 'J', NULL, '1B', NULL, '2005-01-23 18:36:58', 'AJM', '2005-01-24 21:43:11', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (110, 'Michael', 'Jackson', NULL, NULL, '2A', NULL, '2005-01-23 18:37:55', 'AJM', '2005-01-24 21:43:21', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (111, 'Veronica', 'Jackson', NULL, NULL, '2C', NULL, '2005-01-23 18:38:18', 'AJM', '2005-01-24 21:43:29', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (112, 'Stephen', 'Jackson', NULL, NULL, '2B', NULL, '2005-01-23 18:38:27', 'AJM', '2005-01-24 21:43:25', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (113, 'Roger', 'Jacob', NULL, NULL, '3A', NULL, '2005-01-23 18:38:47', 'AJM', '2005-01-24 21:43:32', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (114, 'Nicholas', 'Jacobs', NULL, NULL, '3B', NULL, '2005-01-23 18:39:02', 'AJM', '2005-01-24 21:43:34', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (115, 'Lionel', 'Jacobson', NULL, NULL, '3C', NULL, '2005-01-23 18:39:27', 'AJM', '2005-01-24 21:43:38', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (116, 'Harriet', 'Jacques', NULL, 3, NULL, NULL, '2005-01-23 18:40:14', 'AJM', '2005-01-24 21:43:41', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (118, 'Peter', 'Kane', 'B', NULL, '1B', NULL, '2005-01-23 18:41:59', 'AJM', '2005-01-24 21:44:27', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (117, 'Alan', 'Kane', NULL, NULL, '1A', NULL, '2005-01-23 18:41:49', 'AJM', '2005-01-24 21:44:24', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (119, 'Brian', 'Kavanagh', 'L', NULL, '1C', NULL, '2005-01-23 18:43:07', 'AJM', '2005-01-24 21:44:30', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (120, 'Charles', 'Kavanagh', 'P', NULL, '2A', NULL, '2005-01-23 18:43:19', 'AJM', '2005-01-24 21:44:35', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (121, 'Alan', 'Kay', 'J', NULL, '2B', NULL, '2005-01-23 18:43:33', 'AJM', '2005-01-24 21:44:38', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (122, 'Stephen', 'Kaye', 'P', NULL, '2C', NULL, '2005-01-23 18:43:57', 'AJM', '2005-01-24 21:44:42', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (123, 'Terence', 'Kaye', NULL, NULL, '3A', NULL, '2005-01-23 18:44:21', 'AJM', '2005-01-24 21:44:45', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (124, 'Laurence', 'Kean', NULL, NULL, '3B', NULL, '2005-01-23 18:44:52', 'AJM', '2005-01-24 21:44:48', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (125, 'Michael', 'Keane', NULL, NULL, '3C', NULL, '2005-01-23 18:45:02', 'AJM', '2005-01-24 21:44:51', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (126, 'Alan', 'La Roche', 'J', NULL, '1A', NULL, '2005-01-23 18:45:34', 'AJM', '2005-01-24 21:45:23', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (127, 'David', 'Lacey', 'K', NULL, '1B', NULL, '2005-01-23 18:46:00', 'AJM', '2005-01-24 21:45:26', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (128, 'Peter', 'Lacy', NULL, NULL, '1C', NULL, '2005-01-23 18:46:28', 'AJM', '2005-01-24 21:45:30', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (129, 'David', 'Ladbrook', 'A', NULL, '2A', NULL, '2005-01-23 18:46:48', 'AJM', '2005-01-24 21:45:33', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (130, 'Alan', 'Ladd', NULL, NULL, '2B', NULL, '2005-01-23 18:46:56', 'AJM', '2005-01-24 21:45:36', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (131, 'Derek', 'Laidlaw', 'J', NULL, '2C', NULL, '2005-01-23 18:47:18', 'AJM', '2005-01-24 21:45:39', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (132, 'Charles', 'Laing', 'W', NULL, '3A', NULL, '2005-01-23 18:47:48', 'AJM', '2005-01-24 21:45:43', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (133, 'Michael', 'Laird', 'P', NULL, '3B', NULL, '2005-01-23 18:48:06', 'AJM', '2005-01-24 21:45:45', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (134, 'Brian', 'Lake', NULL, NULL, '3C', NULL, '2005-01-23 18:48:33', 'AJM', '2005-01-24 21:45:49', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (135, 'David', 'Mabey', NULL, NULL, '1A', NULL, '2005-01-23 18:49:21', 'AJM', '2005-01-24 21:47:32', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (136, 'Ronald', 'Mabin', NULL, NULL, '1B', NULL, '2005-01-23 18:49:34', 'AJM', '2005-01-24 21:47:35', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (137, 'David', 'Macauley', NULL, NULL, '1C', NULL, '2005-01-23 18:51:11', 'AJM', '2005-01-24 21:47:38', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (138, 'Kevin', 'McCarthy', NULL, NULL, '3B', NULL, '2005-01-23 18:51:25', 'AJM', '2005-01-24 21:47:54', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (139, 'Paul', 'McCartney', NULL, NULL, '3C', NULL, '2005-01-23 18:51:34', 'AJM', '2005-01-24 21:47:58', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (140, 'Charles', 'McCafferty', NULL, NULL, '3A', NULL, '2005-01-23 18:52:03', 'AJM', '2005-01-24 21:47:51', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (141, 'Ronald', 'MacDonald', NULL, NULL, '2A', NULL, '2005-01-23 18:52:33', 'AJM', '2005-01-24 21:47:41', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (142, 'David', 'Mace', NULL, NULL, '2B', NULL, '2005-01-23 18:53:59', 'AJM', '2005-01-24 21:47:44', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (143, 'Veronica', 'Macey', NULL, NULL, '2C', NULL, '2005-01-23 18:54:12', 'AJM', '2005-01-24 21:47:48', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (144, 'David', 'Nagle', 'E', NULL, '1A', NULL, '2005-01-23 18:55:08', 'AJM', '2005-01-24 21:48:31', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (145, 'David', 'Nailor', NULL, NULL, '1B', NULL, '2005-01-23 18:55:17', 'AJM', '2005-01-24 21:48:34', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (146, 'Steven', 'Nair', NULL, NULL, '1C', NULL, '2005-01-23 18:55:37', 'AJM', '2005-01-24 21:48:38', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (147, 'Alan', 'Napper', NULL, NULL, '2A', NULL, '2005-01-23 18:56:03', 'AJM', '2005-01-24 21:48:41', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (148, 'Gorden', 'Nash', NULL, NULL, '2C', NULL, '2005-01-23 18:56:29', 'AJM', '2005-01-24 21:48:47', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (149, 'Fraser', 'Nash', NULL, NULL, '2B', NULL, '2005-01-23 18:56:35', 'AJM', '2005-01-24 21:48:44', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (150, 'Peter', 'Nathan', 'S', NULL, '3A', NULL, '2005-01-23 18:56:59', 'AJM', '2005-01-24 21:48:50', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (151, 'Alan', 'Neal', 'B', NULL, '3B', NULL, '2005-01-23 18:57:17', 'AJM', '2005-01-24 21:48:53', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (152, 'Alan', 'Neale', 'K', NULL, '3C', NULL, '2005-01-23 18:57:25', 'AJM', '2005-01-24 21:48:56', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (153, 'Malcolm', 'O''Donnell', NULL, NULL, '2A', NULL, '2005-01-23 18:58:19', 'AJM', '2005-01-24 21:49:46', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (154, 'Christopher', 'Oakes', NULL, NULL, '2B', NULL, '2005-01-23 18:58:38', 'AJM', '2005-01-24 21:49:49', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (155, 'Thomas', 'Oakland', NULL, NULL, '3A', NULL, '2005-01-23 18:59:04', 'AJM', '2005-01-24 21:50:02', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (156, 'David', 'Oakley', 'J', NULL, '3B', NULL, '2005-01-23 18:59:20', 'AJM', '2005-01-24 21:50:05', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (157, 'Veronica', 'O''Brian', NULL, NULL, '1A', NULL, '2005-01-23 18:59:50', 'AJM', '2005-01-24 21:49:31', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (158, 'Peter', 'Oates', 'M', NULL, '3C', NULL, '2005-01-23 19:00:32', 'AJM', '2005-01-24 21:50:10', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (159, 'Donald', 'Oatley', 'A', 3, NULL, NULL, '2005-01-23 19:01:26', 'AJM', '2005-01-24 21:50:13', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (160, 'Derek', 'O''Brien', NULL, NULL, '1B', NULL, '2005-01-23 19:01:54', 'AJM', '2005-01-24 21:49:40', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (161, 'Kevin', 'O''Connor', NULL, NULL, '1C', NULL, '2005-01-23 19:02:42', 'AJM', '2005-01-24 21:49:43', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (162, 'Alan', 'Pace', NULL, NULL, '1A', NULL, '2005-01-23 19:03:21', 'AJM', '2005-01-24 21:50:50', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (163, 'Alan', 'Paice', NULL, NULL, '3A', NULL, '2005-01-23 19:03:32', 'AJM', '2005-01-24 21:51:08', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (164, 'Peter', 'Packer', NULL, NULL, '1C', NULL, '2005-01-23 19:04:02', 'AJM', '2005-01-24 21:50:56', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (165, 'Peter', 'Parker', 'J', 3, NULL, NULL, '2005-01-23 19:04:15', 'AJM', '2005-01-24 21:51:23', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (166, 'Alan', 'Packer', NULL, NULL, '1B', NULL, '2005-01-23 19:07:10', 'AJM', '2005-01-24 21:50:53', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (167, 'Jack', 'Paine', NULL, NULL, '3B', NULL, '2005-01-23 19:07:34', 'AJM', '2005-01-24 21:51:12', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (168, 'Anthony', 'Packwood', NULL, NULL, '2A', NULL, '2005-01-23 19:08:18', 'AJM', '2005-01-24 21:50:59', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (169, 'Christopher', 'Paddick', NULL, NULL, '2B', NULL, '2005-01-23 19:08:58', 'AJM', '2005-01-24 21:51:02', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (170, 'Steven', 'Paddon', NULL, NULL, '2C', NULL, '2005-01-23 19:09:13', 'AJM', '2005-01-24 21:51:05', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (171, 'Adam', 'Quantrill', NULL, NULL, '1A', NULL, '2005-01-23 19:09:56', 'AJM', '2005-01-24 21:51:46', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (172, 'Michael', 'Quarrell', NULL, NULL, '1B', NULL, '2005-01-23 19:10:19', 'AJM', '2005-01-24 21:51:49', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (173, 'Alan', 'Quartermain', NULL, NULL, '1C', NULL, '2005-01-23 19:10:43', 'AJM', '2005-01-24 21:51:52', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (174, 'Pamela', 'Queen', NULL, NULL, '2A', NULL, '2005-01-23 19:11:08', 'AJM', '2005-01-24 21:51:55', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (175, 'Veronica', 'Quennell', NULL, NULL, '2B', NULL, '2005-01-23 19:11:32', 'AJM', '2005-01-24 21:51:58', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (176, 'Jackie', 'Quesne', NULL, NULL, '2C', NULL, '2005-01-23 19:11:58', 'AJM', '2005-01-24 21:52:01', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (177, 'Orville', 'Quigley', 'B', NULL, '3B', NULL, '2005-01-23 19:12:55', 'AJM', '2005-01-24 21:52:15', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (178, 'Peter', 'Quinlan', NULL, NULL, '3C', NULL, '2005-01-23 19:13:12', 'AJM', '2005-01-24 21:52:18', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (179, 'Michael', 'Quinn', NULL, 3, NULL, NULL, '2005-01-23 19:13:34', 'AJM', '2005-01-24 21:52:21', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (180, 'Gordon', 'Radcliffe', NULL, NULL, '1A', NULL, '2005-01-23 19:14:21', 'AJM', '2005-01-24 21:52:44', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (181, 'John', 'Radford', 'N', NULL, '1B', NULL, '2005-01-23 19:14:40', 'AJM', '2005-01-24 21:52:47', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (182, 'Christopher', 'Radley', NULL, NULL, '1C', NULL, '2005-01-23 19:15:02', 'AJM', '2005-01-24 21:52:50', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (183, 'David', 'Radmore', NULL, NULL, '2A', NULL, '2005-01-23 19:15:18', 'AJM', '2005-01-24 21:52:53', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (184, 'Jack', 'Rae', NULL, NULL, '2B', NULL, '2005-01-23 19:15:30', 'AJM', '2005-01-24 21:52:56', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (185, 'Nicholas', 'Rafferty', NULL, NULL, '2C', NULL, '2005-01-23 19:15:48', 'AJM', '2005-01-24 21:52:59', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (186, 'Graeme', 'Raggett', 'T', NULL, '3A', NULL, '2005-01-23 19:16:15', 'AJM', '2005-01-24 21:53:02', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (187, 'Jack', 'Raikes', NULL, NULL, '3B', NULL, '2005-01-23 19:16:48', 'AJM', '2005-01-24 21:53:05', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (188, 'Amanda', 'Rainbow', NULL, NULL, '3C', NULL, '2005-01-23 19:17:01', 'AJM', '2005-01-24 21:53:08', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (189, 'Laurence', 'Sack', NULL, NULL, '1A', NULL, '2005-01-23 19:17:52', 'AJM', '2005-01-24 21:53:36', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (190, 'Alan', 'Sadler', NULL, NULL, '1B', NULL, '2005-01-23 19:18:09', 'AJM', '2005-01-24 21:53:39', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (191, 'Christopher', 'Sage', NULL, NULL, '1C', NULL, '2005-01-23 19:18:27', 'AJM', '2005-01-24 21:53:42', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (192, 'John', 'Sainsbury', NULL, NULL, '2A', NULL, '2005-01-23 19:18:53', 'AJM', '2005-01-24 21:53:45', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (193, 'Peter', 'Saint', NULL, NULL, '2B', NULL, '2005-01-23 19:19:17', 'AJM', '2005-01-24 21:53:49', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (194, 'Richard', 'Sale', NULL, NULL, '2C', NULL, '2005-01-23 19:19:40', 'AJM', '2005-01-24 21:53:52', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (195, 'Brian', 'Salisbury', NULL, NULL, '3A', NULL, '2005-01-23 19:19:56', 'AJM', '2005-01-24 21:53:55', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (196, 'Geoffrey', 'Salman', NULL, NULL, '3B', NULL, '2005-01-23 19:20:20', 'AJM', '2005-01-24 21:53:57', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (197, 'Alan', 'Salter', NULL, NULL, '3C', NULL, '2005-01-23 19:20:35', 'AJM', '2005-01-24 21:54:00', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (198, 'Robert', 'Tadd', NULL, NULL, '1A', NULL, '2005-01-23 19:21:35', 'AJM', '2005-01-24 21:54:28', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (199, 'Richard', 'Tagg', NULL, NULL, '1B', NULL, '2005-01-23 19:23:04', 'AJM', '2005-01-24 21:54:31', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (200, 'Alan', 'Tait', NULL, NULL, '1C', NULL, '2005-01-23 19:23:30', 'AJM', '2005-01-24 21:54:34', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (201, 'John', 'Taite', 'P', NULL, '2A', NULL, '2005-01-23 19:23:53', 'AJM', '2005-01-24 21:54:37', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (202, 'Jack', 'Talbot', NULL, NULL, '2B', NULL, '2005-01-23 19:24:08', 'AJM', '2005-01-24 21:54:40', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (203, 'Richard', 'Tallboy', NULL, NULL, '2C', NULL, '2005-01-23 19:24:29', 'AJM', '2005-01-24 21:54:43', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (204, 'Gordon', 'Tamplin', NULL, NULL, '3A', NULL, '2005-01-23 19:24:48', 'AJM', '2005-01-24 21:54:47', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (205, 'Brian', 'Tanner', NULL, NULL, '3B', NULL, '2005-01-23 19:25:12', 'AJM', '2005-01-24 21:54:49', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (206, 'Christopher', 'Tarrant', NULL, NULL, '3C', NULL, '2005-01-23 19:25:42', 'AJM', '2005-01-24 21:54:52', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (207, 'Brian', 'Udall', NULL, NULL, '1A', NULL, '2005-01-23 19:26:22', 'AJM', '2005-01-24 21:55:39', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (208, 'Gordon', 'Ulrich', NULL, NULL, '1B', NULL, '2005-01-23 19:26:40', 'AJM', '2005-01-24 21:55:42', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (209, 'Carl', 'Underhay', NULL, NULL, '1C', NULL, '2005-01-23 20:48:30', 'AJM', '2005-01-24 21:55:45', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (210, 'David', 'Underwood', NULL, NULL, '2A', NULL, '2005-01-23 20:48:45', 'AJM', '2005-01-24 21:55:48', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (211, 'Donald', 'Unsworth', NULL, NULL, '2B', NULL, '2005-01-23 20:48:59', 'AJM', '2005-01-24 21:55:50', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (212, 'Brian', 'Unwin', NULL, NULL, '2C', NULL, '2005-01-23 20:49:10', 'AJM', '2005-01-24 21:55:53', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (213, 'Jack', 'Upchurch', NULL, NULL, '3A', NULL, '2005-01-23 20:49:32', 'AJM', '2005-01-24 21:55:56', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (214, 'Christopher', 'Upton', NULL, NULL, '3B', NULL, '2005-01-23 20:50:06', 'AJM', '2005-01-24 21:55:59', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (215, 'Mary', 'Usher', NULL, 3, NULL, NULL, '2005-01-23 20:50:16', 'AJM', '2005-01-24 21:56:11', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (216, 'Linda', 'Vaile', NULL, NULL, '1A', NULL, '2005-01-23 20:51:06', 'AJM', '2005-01-24 21:56:36', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (217, 'Vicky', 'Vale', NULL, NULL, '1B', NULL, '2005-01-23 20:51:20', 'AJM', '2005-01-24 21:56:39', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (218, 'Rudolf', 'Valentine', NULL, NULL, '2B', NULL, '2005-01-23 20:51:54', 'AJM', '2005-01-24 21:56:47', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (219, 'Derek', 'Valence', NULL, NULL, '1C', NULL, '2005-01-23 20:52:27', 'AJM', '2005-01-24 21:56:41', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (220, 'Roger', 'Valence', NULL, NULL, '2A', NULL, '2005-01-23 20:52:45', 'AJM', '2005-01-24 21:56:44', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (221, 'Victoria', 'Vanderbilt', NULL, NULL, '2C', NULL, '2005-01-23 20:53:28', 'AJM', '2005-01-24 21:56:50', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (222, 'Albert', 'Varney', NULL, NULL, '3A', NULL, '2005-01-23 20:53:44', 'AJM', '2005-01-24 21:56:53', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (223, 'James', 'Vaughan', NULL, NULL, '3B', NULL, '2005-01-23 20:54:30', 'AJM', '2005-01-24 21:56:56', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (224, 'Roger', 'Vernon', NULL, NULL, '3C', NULL, '2005-01-23 20:54:38', 'AJM', '2005-01-24 21:56:59', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (225, 'Francis', 'Waddingham', NULL, NULL, '1A', NULL, '2005-01-23 20:55:56', 'AJM', '2005-01-24 21:57:28', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (226, 'David', 'Waddington', NULL, NULL, '1B', NULL, '2005-01-23 20:56:10', 'AJM', '2005-01-24 21:57:31', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (227, 'Gordon', 'Waddon', NULL, NULL, '1C', NULL, '2005-01-23 20:56:25', 'AJM', '2005-01-24 21:57:34', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (228, 'Paul', 'Wade', NULL, NULL, '2A', NULL, '2005-01-23 20:56:47', 'AJM', '2005-01-24 21:57:38', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (229, 'Michael', 'Wadham', NULL, NULL, '2B', NULL, '2005-01-23 20:57:03', 'AJM', '2005-01-24 21:57:41', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (230, 'William', 'Wadsworth', NULL, NULL, '2C', NULL, '2005-01-23 20:57:32', 'AJM', '2005-01-24 21:57:44', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (231, 'Jeffrey', 'Wagstaff', NULL, NULL, '3A', NULL, '2005-01-23 20:57:49', 'AJM', '2005-01-24 21:57:47', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (232, 'David', 'Waite', NULL, NULL, '3B', NULL, '2005-01-23 20:58:15', 'AJM', '2005-01-24 21:57:50', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (233, 'Albert', 'Wakefield', NULL, NULL, '3C', NULL, '2005-01-23 20:58:28', 'AJM', '2005-01-24 21:57:53', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (234, 'Paul', 'Yardley', NULL, NULL, '1A', NULL, '2005-01-23 20:59:51', 'AJM', '2005-01-24 22:05:17', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (235, 'Jeff', 'Yarrow', NULL, NULL, '1B', NULL, '2005-01-23 20:59:58', 'AJM', '2005-01-24 22:05:20', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (236, 'Mike', 'Yarwood', NULL, NULL, '1C', NULL, '2005-01-23 21:00:35', 'AJM', '2005-01-24 22:05:23', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (237, 'Charles', 'Yates', NULL, NULL, '2A', NULL, '2005-01-23 21:00:52', 'AJM', '2005-01-24 22:05:26', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (238, 'Kevin', 'Yeates', NULL, NULL, '2B', NULL, '2005-01-23 21:01:06', 'AJM', '2005-01-24 22:05:29', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (239, 'Mark', 'Yeo', NULL, NULL, '2C', NULL, '2005-01-23 21:01:35', 'AJM', '2005-01-24 22:05:32', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (240, 'Alan', 'Yeoman', NULL, NULL, '3A', NULL, '2005-01-23 21:01:52', 'AJM', '2005-01-24 22:05:37', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (241, 'Josef', 'Youngblood', NULL, 3, NULL, NULL, '2005-01-23 21:02:14', 'AJM', '2005-01-24 22:05:48', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (242, 'Edward', 'York', NULL, NULL, '3C', NULL, '2005-01-23 21:03:00', 'AJM', '2005-01-24 22:05:45', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (243, 'Guido', 'Zabaglione', NULL, NULL, '1A', NULL, '2005-01-23 21:03:46', 'AJM', '2005-01-24 22:06:54', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (244, 'Edward', 'Zacharia', NULL, NULL, '1C', NULL, '2005-01-23 21:04:36', 'AJM', '2005-01-24 22:06:59', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (245, 'Thomas', 'Zacharry', NULL, NULL, '2A', NULL, '2005-01-23 21:04:49', 'AJM', '2005-01-24 22:07:02', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (246, 'Roberto', 'Zanelli', NULL, NULL, '2B', NULL, '2005-01-23 21:05:04', 'AJM', '2005-01-24 22:07:05', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (247, 'Stephanie', 'Zenda', NULL, NULL, '3A', NULL, '2005-01-23 21:05:28', 'AJM', '2005-01-24 22:07:11', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (248, 'Lloyd', 'Zipman', NULL, 3, NULL, NULL, '2005-01-23 21:06:07', 'AJM', '2005-01-24 22:07:21', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (249, 'Luciano', 'Zanutto', NULL, NULL, '2C', NULL, '2005-01-23 21:07:16', 'AJM', '2005-01-24 22:07:08', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (250, 'Chang', 'Zhang', NULL, NULL, '3B', NULL, '2005-01-23 21:07:28', 'AJM', '2005-01-24 22:07:14', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (251, 'Chou', 'Zhou', NULL, NULL, '3C', NULL, '2005-01-23 21:07:36', 'AJM', '2005-01-24 22:07:17', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (252, 'Brian', 'Xankandi', NULL, NULL, '1B', NULL, '2005-01-24 22:00:35', 'AJM', '2005-01-24 22:04:27', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (253, 'Candy', 'Xanthan', NULL, NULL, '1C', NULL, '2005-01-24 22:00:52', 'AJM', '2005-01-24 22:04:30', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (254, 'Diana', 'Xanthate', NULL, NULL, '2A', NULL, '2005-01-24 22:01:20', 'AJM', '2005-01-24 22:04:33', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (255, 'Emily', 'Xanthene', NULL, NULL, '2B', NULL, '2005-01-24 22:02:13', 'AJM', '2005-01-24 22:04:35', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (256, 'Francis', 'Xanthian', NULL, NULL, '2C', NULL, '2005-01-24 22:02:32', 'AJM', '2005-01-24 22:04:39', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (257, 'Gordon', 'Xanthic', NULL, NULL, '3A', NULL, '2005-01-24 22:02:56', 'AJM', '2005-01-24 22:04:42', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (258, 'Harry', 'Xanthin', NULL, NULL, '3B', NULL, '2005-01-24 22:03:14', 'AJM', '2005-01-24 22:04:45', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (259, 'Ian', 'Xanthippe', NULL, NULL, '3C', NULL, '2005-01-24 22:03:35', 'AJM', '2005-01-24 22:04:48', 'AJM');
INSERT INTO crs_student (student_id, first_name, last_name, initials, "year", class_id, student_notes, created_date, created_user, revised_date, revised_user) VALUES (260, 'Jonathon', 'Xanthoma', NULL, 3, NULL, NULL, '2005-01-24 22:04:12', 'AJM', '2005-01-24 22:04:52', 'AJM');


--
-- TOC entry 1687 (class 0 OID 20714)
-- Dependencies: 1296
-- Data for Name: crs_student_lesson; Type: TABLE DATA; Schema: classroom; Owner: postgres
--

INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (2, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (2, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (3, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (3, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (4, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (4, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (5, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (5, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (6, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (6, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (7, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (7, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (8, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (8, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (9, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (9, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (11, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (11, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (12, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (12, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (13, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (13, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (14, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (14, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (18, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (18, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (19, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (19, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (20, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (20, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (22, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (22, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (23, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (23, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (35, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (35, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (116, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (116, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (159, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (159, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (165, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (165, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (179, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (179, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (215, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (215, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (241, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (241, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (248, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (248, 31);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (260, 21);
INSERT INTO crs_student_lesson (student_id, lesson_id) VALUES (260, 31);


--
-- TOC entry 1688 (class 0 OID 20720)
-- Dependencies: 1297
-- Data for Name: crs_subject; Type: TABLE DATA; Schema: classroom; Owner: postgres
--

INSERT INTO crs_subject (subject_id, subject_name, created_date, created_user, revised_date, revised_user) VALUES ('LANG', 'Languages', '2005-07-28 12:48:45', 'AJM', NULL, NULL);
INSERT INTO crs_subject (subject_id, subject_name, created_date, created_user, revised_date, revised_user) VALUES ('MATH', 'Mathematics', '2005-07-28 12:48:59', 'AJM', NULL, NULL);
INSERT INTO crs_subject (subject_id, subject_name, created_date, created_user, revised_date, revised_user) VALUES ('SCIENCE', 'Science', '2005-07-28 12:49:10', 'AJM', NULL, NULL);
INSERT INTO crs_subject (subject_id, subject_name, created_date, created_user, revised_date, revised_user) VALUES ('ART', 'Art', '2005-07-28 12:49:18', 'AJM', NULL, NULL);
INSERT INTO crs_subject (subject_id, subject_name, created_date, created_user, revised_date, revised_user) VALUES ('HIST', 'History', '2005-07-28 14:25:25', 'AJM', NULL, NULL);
INSERT INTO crs_subject (subject_id, subject_name, created_date, created_user, revised_date, revised_user) VALUES ('MUSIC', 'Music', '2005-07-28 14:27:35', 'AJM', NULL, NULL);
INSERT INTO crs_subject (subject_id, subject_name, created_date, created_user, revised_date, revised_user) VALUES ('THEOLOGY', 'Theology', '2005-07-28 14:28:42', 'AJM', NULL, NULL);


--
-- TOC entry 1689 (class 0 OID 20727)
-- Dependencies: 1298
-- Data for Name: crs_teacher; Type: TABLE DATA; Schema: classroom; Owner: postgres
--

INSERT INTO crs_teacher (teacher_id, first_name, last_name, initials, title, teacher_notes, created_date, created_user, revised_date, revised_user) VALUES (1, 'Anne', 'Onnymouse', '', 'Ms', NULL, '2004-12-23 12:00:00', 'AJM', NULL, NULL);
INSERT INTO crs_teacher (teacher_id, first_name, last_name, initials, title, teacher_notes, created_date, created_user, revised_date, revised_user) VALUES (2, 'Carl', 'Culus', '', 'Mr', NULL, '2004-12-23 12:00:00', 'AJM', '2004-12-25 12:25:28', 'AJM');
INSERT INTO crs_teacher (teacher_id, first_name, last_name, initials, title, teacher_notes, created_date, created_user, revised_date, revised_user) VALUES (3, 'Albert', 'Eisenstein', '', 'Prof', NULL, '2004-12-23 12:00:00', 'AJM', NULL, NULL);
INSERT INTO crs_teacher (teacher_id, first_name, last_name, initials, title, teacher_notes, created_date, created_user, revised_date, revised_user) VALUES (4, 'Daniel', 'Doolittle', '', 'Dr', NULL, '2004-12-23 12:00:00', 'AJM', NULL, NULL);
INSERT INTO crs_teacher (teacher_id, first_name, last_name, initials, title, teacher_notes, created_date, created_user, revised_date, revised_user) VALUES (5, 'Enid', 'Blyton', NULL, 'Ms', NULL, '2004-12-25 12:17:09', 'AJM', NULL, NULL);
INSERT INTO crs_teacher (teacher_id, first_name, last_name, initials, title, teacher_notes, created_date, created_user, revised_date, revised_user) VALUES (6, 'Michael', 'Angelo', NULL, 'Mr', NULL, '2004-12-25 12:18:31', 'AJM', NULL, NULL);
INSERT INTO crs_teacher (teacher_id, first_name, last_name, initials, title, teacher_notes, created_date, created_user, revised_date, revised_user) VALUES (7, 'Al', 'Kemmy', NULL, 'Prof', NULL, '2004-12-25 12:22:17', 'AJM', NULL, NULL);
INSERT INTO crs_teacher (teacher_id, first_name, last_name, initials, title, teacher_notes, created_date, created_user, revised_date, revised_user) VALUES (8, 'Kermit', 'Le Frog', NULL, 'Mr', NULL, '2004-12-25 12:23:39', 'AJM', NULL, NULL);
INSERT INTO crs_teacher (teacher_id, first_name, last_name, initials, title, teacher_notes, created_date, created_user, revised_date, revised_user) VALUES (9, 'Alexander', 'LeGreat', NULL, 'Mr', NULL, '2004-12-25 12:26:18', 'AJM', NULL, NULL);
INSERT INTO crs_teacher (teacher_id, first_name, last_name, initials, title, teacher_notes, created_date, created_user, revised_date, revised_user) VALUES (10, 'Marco', 'Polo', NULL, 'Mr', NULL, '2004-12-25 12:27:20', 'AJM', NULL, NULL);
INSERT INTO crs_teacher (teacher_id, first_name, last_name, initials, title, teacher_notes, created_date, created_user, revised_date, revised_user) VALUES (11, 'Isaac', 'Newton', NULL, 'Prof', NULL, '2004-12-25 12:31:13', 'AJM', NULL, NULL);
INSERT INTO crs_teacher (teacher_id, first_name, last_name, initials, title, teacher_notes, created_date, created_user, revised_date, revised_user) VALUES (12, 'Ian', 'Paisley', NULL, 'Rev', NULL, '2005-01-31 19:17:36', 'AJM', '2005-01-31 19:18:50', 'AJM');
INSERT INTO crs_teacher (teacher_id, first_name, last_name, initials, title, teacher_notes, created_date, created_user, revised_date, revised_user) VALUES (13, 'Elton', 'John', NULL, 'Mr', NULL, '2005-01-31 19:44:01', 'AJM', '2005-01-31 21:17:06', 'AJM');
INSERT INTO crs_teacher (teacher_id, first_name, last_name, initials, title, teacher_notes, created_date, created_user, revised_date, revised_user) VALUES (14, 'Penny', 'Spender', NULL, 'Mrs', NULL, '2005-01-31 21:17:44', 'AJM', NULL, NULL);


--
-- TOC entry 1659 (class 16386 OID 20644)
-- Dependencies: 1289 1289 1289
-- Name: crs_class_lesson_pkey; Type: CONSTRAINT; Schema: classroom; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crs_class_lesson
    ADD CONSTRAINT crs_class_lesson_pkey PRIMARY KEY (class_id, lesson_id);


ALTER INDEX classroom.crs_class_lesson_pkey OWNER TO postgres;

--
-- TOC entry 1657 (class 16386 OID 20638)
-- Dependencies: 1288 1288
-- Name: crs_class_pkey; Type: CONSTRAINT; Schema: classroom; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crs_class
    ADD CONSTRAINT crs_class_pkey PRIMARY KEY (class_id);


ALTER INDEX classroom.crs_class_pkey OWNER TO postgres;

--
-- TOC entry 1662 (class 16386 OID 20652)
-- Dependencies: 1290 1290
-- Name: crs_conflict_pkey; Type: CONSTRAINT; Schema: classroom; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crs_conflict
    ADD CONSTRAINT crs_conflict_pkey PRIMARY KEY (conflict_id);


ALTER INDEX classroom.crs_conflict_pkey OWNER TO postgres;

--
-- TOC entry 1664 (class 16386 OID 20663)
-- Dependencies: 1291 1291
-- Name: crs_lesson_pkey; Type: CONSTRAINT; Schema: classroom; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crs_lesson
    ADD CONSTRAINT crs_lesson_pkey PRIMARY KEY (lesson_id);


ALTER INDEX classroom.crs_lesson_pkey OWNER TO postgres;

--
-- TOC entry 1666 (class 16386 OID 20674)
-- Dependencies: 1292 1292
-- Name: crs_room_pkey; Type: CONSTRAINT; Schema: classroom; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crs_room
    ADD CONSTRAINT crs_room_pkey PRIMARY KEY (room_id);


ALTER INDEX classroom.crs_room_pkey OWNER TO postgres;

--
-- TOC entry 1670 (class 16386 OID 20702)
-- Dependencies: 1294 1294
-- Name: crs_schedule_hdr_pkey; Type: CONSTRAINT; Schema: classroom; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crs_schedule_hdr
    ADD CONSTRAINT crs_schedule_hdr_pkey PRIMARY KEY (schedule_id);


ALTER INDEX classroom.crs_schedule_hdr_pkey OWNER TO postgres;

--
-- TOC entry 1668 (class 16386 OID 20690)
-- Dependencies: 1293 1293 1293
-- Name: crs_schedule_pkey; Type: CONSTRAINT; Schema: classroom; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crs_schedule
    ADD CONSTRAINT crs_schedule_pkey PRIMARY KEY (schedule_id, seq_no);


ALTER INDEX classroom.crs_schedule_pkey OWNER TO postgres;

--
-- TOC entry 1674 (class 16386 OID 20719)
-- Dependencies: 1296 1296 1296
-- Name: crs_student_lesson_pkey; Type: CONSTRAINT; Schema: classroom; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crs_student_lesson
    ADD CONSTRAINT crs_student_lesson_pkey PRIMARY KEY (student_id, lesson_id);


ALTER INDEX classroom.crs_student_lesson_pkey OWNER TO postgres;

--
-- TOC entry 1672 (class 16386 OID 20713)
-- Dependencies: 1295 1295
-- Name: crs_student_pkey; Type: CONSTRAINT; Schema: classroom; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crs_student
    ADD CONSTRAINT crs_student_pkey PRIMARY KEY (student_id);


ALTER INDEX classroom.crs_student_pkey OWNER TO postgres;

--
-- TOC entry 1676 (class 16386 OID 20726)
-- Dependencies: 1297 1297
-- Name: crs_subject_pkey; Type: CONSTRAINT; Schema: classroom; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crs_subject
    ADD CONSTRAINT crs_subject_pkey PRIMARY KEY (subject_id);


ALTER INDEX classroom.crs_subject_pkey OWNER TO postgres;

--
-- TOC entry 1678 (class 16386 OID 20737)
-- Dependencies: 1298 1298
-- Name: crs_teacher_pkey; Type: CONSTRAINT; Schema: classroom; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crs_teacher
    ADD CONSTRAINT crs_teacher_pkey PRIMARY KEY (teacher_id);


ALTER INDEX classroom.crs_teacher_pkey OWNER TO postgres;

--
-- TOC entry 1660 (class 1259 OID 20653)
-- Dependencies: 1290
-- Name: crs_conflict_index; Type: INDEX; Schema: classroom; Owner: postgres; Tablespace: 
--

CREATE INDEX crs_conflict_index ON crs_conflict USING btree (lesson_id1);


ALTER INDEX classroom.crs_conflict_index OWNER TO postgres;

-- Completed on 2005-09-14 17:54:52 GMT Standard Time

--
-- PostgreSQL database dump complete
--

