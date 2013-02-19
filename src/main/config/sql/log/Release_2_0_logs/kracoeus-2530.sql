-- Table Script 
CREATE TABLE IP_REVIEW_ACTIVITY_TYPE ( 
    IP_REVIEW_ACTIVITY_TYPE_CODE VARCHAR2(3) NOT NULL, 
    DESCRIPTION VARCHAR2(200) NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL);

-- Primary Key Constraint 
ALTER TABLE IP_REVIEW_ACTIVITY_TYPE 
ADD CONSTRAINT PK_IP_REVIEW_ACTIVITY_TYPE 
PRIMARY KEY (IP_REVIEW_ACTIVITY_TYPE_CODE);

-- View for Coeus compatibility 
CREATE OR REPLACE VIEW OSP$IP_REVIEW_ACTIVITY_TYPE AS SELECT 
    IP_REVIEW_ACTIVITY_TYPE_CODE, 
    DESCRIPTION, 
    UPDATE_TIMESTAMP, 
    UPDATE_USER
FROM IP_REVIEW_ACTIVITY_TYPE;

INSERT INTO IP_REVIEW_ACTIVITY_TYPE ( IP_REVIEW_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 1, 'Conference Call', sysdate, user ); 
INSERT INTO IP_REVIEW_ACTIVITY_TYPE ( IP_REVIEW_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 2, 'Copies Made', sysdate, user ); 
INSERT INTO IP_REVIEW_ACTIVITY_TYPE ( IP_REVIEW_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 3, 'Email', sysdate, user ); 
INSERT INTO IP_REVIEW_ACTIVITY_TYPE ( IP_REVIEW_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 4, 'Fax sent', sysdate, user ); 
INSERT INTO IP_REVIEW_ACTIVITY_TYPE ( IP_REVIEW_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 5, 'Fax received', sysdate, user ); 
INSERT INTO IP_REVIEW_ACTIVITY_TYPE ( IP_REVIEW_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 6, 'Meeting', sysdate, user ); 
INSERT INTO IP_REVIEW_ACTIVITY_TYPE ( IP_REVIEW_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 7, 'Telephone Call', sysdate, user ); 

commit;

-- Table Script 
CREATE TABLE IP_REVIEW_REQ_TYPE ( 
    IP_REVIEW_REQ_TYPE_CODE VARCHAR2(3) NOT NULL, 
    DESCRIPTION VARCHAR2(200) NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL);

-- Primary Key Constraint 
ALTER TABLE IP_REVIEW_REQ_TYPE 
ADD CONSTRAINT PK_IP_REVIEW_REQ_TYPE 
PRIMARY KEY (IP_REVIEW_REQ_TYPE_CODE);

-- View for Coeus compatibility 
CREATE OR REPLACE VIEW OSP$IP_REVIEW_REQ_TYPE AS SELECT 
    IP_REVIEW_REQ_TYPE_CODE, 
    DESCRIPTION, 
    UPDATE_TIMESTAMP, 
    UPDATE_USER
FROM IP_REVIEW_REQ_TYPE;

INSERT INTO IP_REVIEW_REQ_TYPE ( IP_REVIEW_REQ_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 1, 'Expedited', sysdate, user ); 
INSERT INTO IP_REVIEW_REQ_TYPE ( IP_REVIEW_REQ_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 2, 'Special', sysdate, user ); 
INSERT INTO IP_REVIEW_REQ_TYPE ( IP_REVIEW_REQ_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 3, 'Standard', sysdate, user ); 
INSERT INTO IP_REVIEW_REQ_TYPE ( IP_REVIEW_REQ_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 4, 'Other', sysdate, user ); 

commit;

-- Table Script 
CREATE TABLE IP_REVIEW_RESULT_TYPE ( 
    IP_REVIEW_RESULT_TYPE_CODE VARCHAR2(3) NOT NULL, 
    DESCRIPTION VARCHAR2(200) NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL);

-- Primary Key Constraint 
ALTER TABLE IP_REVIEW_RESULT_TYPE 
ADD CONSTRAINT PK_IP_REVIEW_RESULT_TYPE 
PRIMARY KEY (IP_REVIEW_RESULT_TYPE_CODE);

-- View for Coeus compatibility 
CREATE OR REPLACE VIEW OSP$IP_REVIEW_RESULT_TYPE AS SELECT 
    IP_REVIEW_RESULT_TYPE_CODE, 
    DESCRIPTION, 
    UPDATE_TIMESTAMP, 
    UPDATE_USER
FROM IP_REVIEW_RESULT_TYPE;

INSERT INTO IP_REVIEW_RESULT_TYPE ( IP_REVIEW_RESULT_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 1, 'A', sysdate, user ); 
INSERT INTO IP_REVIEW_RESULT_TYPE ( IP_REVIEW_RESULT_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 2, 'B1', sysdate, user ); 
INSERT INTO IP_REVIEW_RESULT_TYPE ( IP_REVIEW_RESULT_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 3, 'B2', sysdate, user ); 
INSERT INTO IP_REVIEW_RESULT_TYPE ( IP_REVIEW_RESULT_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 4, 'B2-R', sysdate, user ); 

commit;