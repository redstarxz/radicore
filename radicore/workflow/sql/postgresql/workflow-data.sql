--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.2
-- Dumped by pg_dump version 9.1.2
-- Started on 2012-01-21 08:42:57

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = workflow, pg_catalog;

--
-- TOC entry 2322 (class 0 OID 21780)
-- Dependencies: 233
-- Data for Name: wf_arc; Type: TABLE DATA; Schema: workflow; Owner: postgres
--

INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (4, 1, 1, 'IN', 'SEQ', NULL, '2004-04-25 20:56:17', 'AJM', '2006-03-20 11:25:31', 'AJM');
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (1, 2, 1, 'IN', 'SEQ', NULL, '2005-10-06 18:54:22', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (1, 2, 3, 'OUT', 'SEQ', NULL, '2005-10-06 18:54:51', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (4, 1, 4, 'OUT', 'OR-SPLIT-E', NULL, '2006-03-20 11:26:49', 'AJM', '2006-03-20 12:00:53', 'AJM');
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (4, 1, 3, 'OUT', 'OR-SPLIT-E', 'if (strlen($fieldarray[''telephone_no'']) < 1) return TRUE;', '2006-03-20 11:26:30', 'AJM', '2006-03-20 11:59:26', 'AJM');
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (1, 3, 3, 'IN', 'SEQ', NULL, '2004-12-11 18:47:17', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (1, 3, 2, 'OUT', 'SEQ', NULL, '2004-12-11 18:47:37', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (2, 1, 1, 'IN', 'OR-SPLIT-I', NULL, '2006-02-16 14:23:02', 'AJM', '2006-02-18 15:35:09', 'AJM');
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (2, 2, 1, 'IN', 'OR-SPLIT-I', NULL, '2006-02-16 14:59:13', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (2, 2, 2, 'OUT', 'OR-JOIN', NULL, '2006-02-16 15:00:07', 'AJM', '2006-02-18 15:47:28', 'AJM');
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (2, 1, 3, 'OUT', 'SEQ', NULL, '2006-02-16 15:07:04', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (2, 3, 3, 'IN', 'SEQ', NULL, '2006-02-16 15:07:35', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (2, 3, 2, 'OUT', 'OR-JOIN', NULL, '2006-02-16 15:09:39', 'AJM', '2006-02-16 15:12:02', 'AJM');
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (3, 1, 1, 'IN', 'SEQ', NULL, '2006-03-19 16:59:39', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (3, 1, 3, 'OUT', 'AND-SPLIT', NULL, '2006-03-19 17:00:47', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (3, 1, 4, 'OUT', 'AND-SPLIT', NULL, '2006-03-19 17:01:18', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (3, 2, 3, 'IN', 'SEQ', NULL, '2006-03-19 17:03:09', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (3, 4, 4, 'IN', 'SEQ', NULL, '2006-03-19 17:04:05', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (3, 2, 5, 'OUT', 'SEQ', NULL, '2006-03-19 17:19:21', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (3, 4, 6, 'OUT', 'SEQ', NULL, '2006-03-19 17:19:44', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (3, 3, 5, 'IN', 'AND-JOIN', NULL, '2006-03-19 17:20:19', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (3, 3, 6, 'IN', 'AND-JOIN', NULL, '2006-03-19 17:20:38', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (3, 3, 2, 'OUT', 'SEQ', NULL, '2006-03-19 17:22:24', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (4, 2, 3, 'IN', 'SEQ', NULL, '2006-03-20 11:27:11', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (4, 3, 4, 'IN', 'SEQ', NULL, '2006-03-20 11:27:29', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (4, 2, 2, 'OUT', 'OR-JOIN', NULL, '2006-03-20 11:27:51', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (4, 3, 2, 'OUT', 'OR-JOIN', NULL, '2006-03-20 11:28:07', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (5, 1, 1, 'IN', 'SEQ', NULL, '2006-03-20 14:24:03', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (5, 1, 1, 'OUT', 'OR-SPLIT-E', NULL, '2006-03-20 14:28:09', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (5, 1, 3, 'OUT', 'OR-SPLIT-E', 'if ($fieldarray[''count''] > 0) return TRUE;', '2006-03-20 14:28:30', 'AJM', '2006-03-20 14:34:59', 'AJM');
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (5, 2, 3, 'IN', 'SEQ', NULL, '2006-03-20 14:28:46', 'AJM', NULL, NULL);
INSERT INTO wf_arc (workflow_id, transition_id, place_id, direction, arc_type, pre_condition, created_date, created_user, revised_date, revised_user) VALUES (5, 2, 2, 'OUT', 'SEQ', NULL, '2006-03-20 14:28:58', 'AJM', '2006-05-12 18:06:21', 'AJM');


--
-- TOC entry 2323 (class 0 OID 21791)
-- Dependencies: 234
-- Data for Name: wf_case; Type: TABLE DATA; Schema: workflow; Owner: postgres
--



--
-- TOC entry 2324 (class 0 OID 21799)
-- Dependencies: 235
-- Data for Name: wf_place; Type: TABLE DATA; Schema: workflow; Owner: postgres
--

INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (1, 3, '5', 'p1', NULL, '2004-04-12 19:06:04', 'AJM', '2004-04-13 17:11:47', 'AJM');
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (1, 1, '1', 'START', NULL, '2004-04-13 16:47:25', 'AJM', '2004-04-14 12:22:23', 'AJM');
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (1, 2, '9', 'END', NULL, '2004-04-13 16:47:38', 'AJM', '2004-04-14 12:22:40', 'AJM');
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (4, 1, '1', 'START', NULL, '2004-04-20 16:23:28', 'AJM', NULL, NULL);
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (4, 2, '9', 'END', NULL, '2004-04-20 16:23:33', 'AJM', NULL, NULL);
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (3, 1, '1', 'START', NULL, '2004-04-23 16:28:42', 'AJM', NULL, NULL);
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (3, 2, '9', 'END', NULL, '2004-04-23 16:28:42', 'AJM', NULL, NULL);
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (4, 3, '5', 'P1', NULL, '2004-04-25 16:14:28', 'AJM', '2006-03-20 11:21:53', 'AJM');
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (4, 4, '5', 'P2', NULL, '2004-04-25 21:01:37', 'AJM', '2006-03-20 11:21:58', 'AJM');
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (2, 1, '1', 'START', NULL, '2006-02-16 12:28:10', 'AJM', NULL, NULL);
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (2, 2, '9', 'END', NULL, '2006-02-16 12:28:10', 'AJM', NULL, NULL);
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (2, 3, '5', 'P1', NULL, '2006-02-16 12:29:57', 'AJM', NULL, NULL);
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (3, 3, '5', 'P1', NULL, '2006-03-19 16:54:19', 'AJM', NULL, NULL);
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (3, 4, '5', 'P2', NULL, '2006-03-19 16:54:24', 'AJM', NULL, NULL);
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (3, 5, '5', 'P3', NULL, '2006-03-19 16:54:29', 'AJM', NULL, NULL);
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (3, 6, '5', 'P4', NULL, '2006-03-19 17:11:53', 'AJM', NULL, NULL);
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (5, 1, '1', 'START', NULL, '2006-03-20 13:58:31', 'AJM', NULL, NULL);
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (5, 2, '9', 'END', NULL, '2006-03-20 13:58:32', 'AJM', NULL, NULL);
INSERT INTO wf_place (workflow_id, place_id, place_type, place_name, place_desc, created_date, created_user, revised_date, revised_user) VALUES (5, 3, '5', 'P1', NULL, '2006-03-20 14:22:04', 'AJM', NULL, NULL);


--
-- TOC entry 2325 (class 0 OID 21808)
-- Dependencies: 236
-- Data for Name: wf_token; Type: TABLE DATA; Schema: workflow; Owner: postgres
--



--
-- TOC entry 2326 (class 0 OID 21817)
-- Dependencies: 237
-- Data for Name: wf_transition; Type: TABLE DATA; Schema: workflow; Owner: postgres
--

INSERT INTO wf_transition (workflow_id, transition_id, transition_name, transition_desc, transition_trigger, time_limit, task_id, role_id, created_date, created_user, revised_date, revised_user) VALUES (4, 1, 'T1 - Add Person Address', NULL, 'USER', NULL, 'x_person_addr(add)', '', '2004-04-20 16:25:12', 'AJM', '2006-03-20 11:22:43', 'AJM');
INSERT INTO wf_transition (workflow_id, transition_id, transition_name, transition_desc, transition_trigger, time_limit, task_id, role_id, created_date, created_user, revised_date, revised_user) VALUES (1, 2, 'Add Person Address', NULL, 'USER', NULL, 'x_person_addr(add)', '', '2004-04-13 17:51:02', 'AJM', '2005-10-06 18:53:16', 'AJM');
INSERT INTO wf_transition (workflow_id, transition_id, transition_name, transition_desc, transition_trigger, time_limit, task_id, role_id, created_date, created_user, revised_date, revised_user) VALUES (4, 2, 'T2 - Update Person Address', NULL, 'USER', NULL, 'x_person_addr(upd)', '', '2004-04-25 21:02:58', 'AJM', '2006-03-20 11:24:08', 'AJM');
INSERT INTO wf_transition (workflow_id, transition_id, transition_name, transition_desc, transition_trigger, time_limit, task_id, role_id, created_date, created_user, revised_date, revised_user) VALUES (1, 3, 'Update Person Address', NULL, 'USER', NULL, 'x_person_addr(upd)', '', '2004-04-13 17:51:31', 'AJM', '2004-04-22 14:27:30', 'AJM');
INSERT INTO wf_transition (workflow_id, transition_id, transition_name, transition_desc, transition_trigger, time_limit, task_id, role_id, created_date, created_user, revised_date, revised_user) VALUES (2, 1, 'Add Person Address', NULL, 'USER', NULL, 'x_person_addr(add)', '', '2006-02-16 12:56:21', 'AJM', '2006-02-16 18:17:21', 'AJM');
INSERT INTO wf_transition (workflow_id, transition_id, transition_name, transition_desc, transition_trigger, time_limit, task_id, role_id, created_date, created_user, revised_date, revised_user) VALUES (2, 2, 'Delete Person (without user dialog)', NULL, 'TIME', 1, 'x_person(del)2', '', '2006-02-16 13:04:02', 'AJM', '2006-02-16 21:37:53', 'AJM');
INSERT INTO wf_transition (workflow_id, transition_id, transition_name, transition_desc, transition_trigger, time_limit, task_id, role_id, created_date, created_user, revised_date, revised_user) VALUES (2, 3, 'Update Person Address', NULL, 'USER', NULL, 'x_person_addr(upd)', '', '2006-02-16 15:01:25', 'AJM', '2006-02-16 15:05:23', 'AJM');
INSERT INTO wf_transition (workflow_id, transition_id, transition_name, transition_desc, transition_trigger, time_limit, task_id, role_id, created_date, created_user, revised_date, revised_user) VALUES (3, 1, 'T1 - Add Person Address', NULL, 'USER', NULL, 'x_person_addr(add)', '', '2006-03-19 16:55:48', 'AJM', '2006-03-19 17:15:21', 'AJM');
INSERT INTO wf_transition (workflow_id, transition_id, transition_name, transition_desc, transition_trigger, time_limit, task_id, role_id, created_date, created_user, revised_date, revised_user) VALUES (3, 2, 'T2 - Update Person Address (1)', NULL, 'USER', NULL, 'x_person_addr(upd)', '', '2006-03-19 16:56:58', 'AJM', '2006-03-19 17:15:35', 'AJM');
INSERT INTO wf_transition (workflow_id, transition_id, transition_name, transition_desc, transition_trigger, time_limit, task_id, role_id, created_date, created_user, revised_date, revised_user) VALUES (3, 3, 'T4 - Update Person Address (2)', NULL, 'USER', NULL, 'x_person_addr(upd)', '', '2006-03-19 16:57:38', 'AJM', '2006-03-19 17:15:43', 'AJM');
INSERT INTO wf_transition (workflow_id, transition_id, transition_name, transition_desc, transition_trigger, time_limit, task_id, role_id, created_date, created_user, revised_date, revised_user) VALUES (3, 4, 'T3 - Maintain Options', NULL, 'USER', NULL, 'x_pers_opt_xref(link)a', '', '2006-03-19 16:58:42', 'AJM', '2006-03-19 17:15:50', 'AJM');
INSERT INTO wf_transition (workflow_id, transition_id, transition_name, transition_desc, transition_trigger, time_limit, task_id, role_id, created_date, created_user, revised_date, revised_user) VALUES (4, 3, 'T3 - Maintain Options', NULL, 'USER', NULL, 'x_pers_opt_xref(link)a', '', '2006-03-20 11:24:51', 'AJM', NULL, NULL);
INSERT INTO wf_transition (workflow_id, transition_id, transition_name, transition_desc, transition_trigger, time_limit, task_id, role_id, created_date, created_user, revised_date, revised_user) VALUES (5, 1, 'T1 - Maintain Options', NULL, 'USER', NULL, 'x_pers_opt_xref(link)a', '', '2006-03-20 14:22:56', 'AJM', NULL, NULL);
INSERT INTO wf_transition (workflow_id, transition_id, transition_name, transition_desc, transition_trigger, time_limit, task_id, role_id, created_date, created_user, revised_date, revised_user) VALUES (5, 2, 'T2 - Add Person Address', NULL, 'USER', NULL, 'x_person_addr(add)', '', '2006-03-20 14:23:37', 'AJM', NULL, NULL);


--
-- TOC entry 2327 (class 0 OID 21827)
-- Dependencies: 238
-- Data for Name: wf_workflow; Type: TABLE DATA; Schema: workflow; Owner: postgres
--

INSERT INTO wf_workflow (workflow_id, workflow_name, workflow_desc, start_task_id, is_valid, workflow_errors, start_date, end_date, created_date, created_user, revised_date, revised_user) VALUES (1, 'This is a test of a simple sequence.', 'Add Person -> Add Address -> Update Address.

This is just a plain sequence.', 'x_person(add)', 'Y', NULL, '2004-04-10', '9999-12-31', '2004-04-04 00:10:10', 'AJM', '2006-03-21 11:57:40', 'AJM');
INSERT INTO wf_workflow (workflow_id, workflow_name, workflow_desc, start_task_id, is_valid, workflow_errors, start_date, end_date, created_date, created_user, revised_date, revised_user) VALUES (4, 'Conditional routing with a Guard', 'This test uses conditional routing with a Guard (pre-condition).', 'x_person(add)', 'Y', NULL, '2006-03-19', '2006-03-19', '2004-04-20 16:23:27', 'AJM', '2006-03-20 14:51:03', 'AJM');
INSERT INTO wf_workflow (workflow_id, workflow_name, workflow_desc, start_task_id, is_valid, workflow_errors, start_date, end_date, created_date, created_user, revised_date, revised_user) VALUES (5, 'Iterative routing', 'This is an example of iterative routing.', 'x_person(add)', 'Y', NULL, '2006-03-20', '2006-03-20', '2006-03-20 13:58:31', 'AJM', '2006-05-12 18:06:29', 'AJM');
INSERT INTO wf_workflow (workflow_id, workflow_name, workflow_desc, start_task_id, is_valid, workflow_errors, start_date, end_date, created_date, created_user, revised_date, revised_user) VALUES (3, 'This has parallel routing.', 'This is a test of parallel routing.', 'x_person(add)', 'Y', NULL, '2006-03-18', '2006-03-18', '2004-04-23 16:28:42', 'AJM', '2006-03-20 14:50:54', 'AJM');
INSERT INTO wf_workflow (workflow_id, workflow_name, workflow_desc, start_task_id, is_valid, workflow_errors, start_date, end_date, created_date, created_user, revised_date, revised_user) VALUES (2, 'This has a timed split', 'Add Person -> Add Address. Will delete Person if Address is not added within a time limit.

This uses an Implicit OR Split and an OR Join.', 'x_person(add)', 'Y', NULL, '2006-02-16', '2006-02-28', '2006-02-16 12:28:10', 'AJM', '2006-03-18 16:37:03', 'AJM');


--
-- TOC entry 2328 (class 0 OID 21835)
-- Dependencies: 239
-- Data for Name: wf_workitem; Type: TABLE DATA; Schema: workflow; Owner: postgres
--



-- Completed on 2012-01-21 08:42:58

--
-- PostgreSQL database dump complete
--

