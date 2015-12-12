-- ALTER SESSION SET CURRENT_SCHEMA = "MENU";
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
SET SCAN OFF;

CREATE TABLE mnu_saved_selection (
  selection_id NUMBER(10,0) NOT NULL, 
  selection_desc VARCHAR2(80 BYTE) NOT NULL,
  user_id VARCHAR2(16 BYTE) NOT NULL,
  task_id VARCHAR2(80 BYTE) NOT NULL,
  created_date TIMESTAMP(6) DEFAULT '2000-01-01 00:00:00',
  created_user VARCHAR2(16 BYTE) DEFAULT 'UNKNOWN',
  revised_date TIMESTAMP(6) DEFAULT NULL,
  revised_user VARCHAR2(16 BYTE) DEFAULT NULL,
  PRIMARY KEY (selection_id)
);
GRANT DELETE, INSERT, SELECT, UPDATE ON "MENU"."MNU_SAVED_SELECTION" TO PUBLIC;

CREATE SEQUENCE  "MENU"."MNU_SAVED_SELECTION_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE;
GRANT ALTER, SELECT ON "MENU"."MNU_SAVED_SELECTION_SEQ" TO PUBLIC;

CREATE TABLE mnu_saved_selection_data (
  selection_id NUMBER(10,0) NOT NULL,
  fieldname VARCHAR2(80 BYTE) NOT NULL,
  fieldvalue VARCHAR2(80 BYTE) DEFAULT NULL,
  created_date TIMESTAMP(6) DEFAULT '2000-01-01 00:00:00',
  created_user VARCHAR2(16 BYTE) DEFAULT 'UNKNOWN',
  revised_date TIMESTAMP(6) DEFAULT NULL,
  revised_user VARCHAR2(16 BYTE) DEFAULT NULL,
  PRIMARY KEY (selection_id,fieldname)
);
GRANT DELETE, INSERT, SELECT, UPDATE ON "MENU"."MNU_SAVED_SELECTION_DATA" TO PUBLIC;