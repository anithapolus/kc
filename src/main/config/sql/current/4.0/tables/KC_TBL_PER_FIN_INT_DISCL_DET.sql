CREATE TABLE PER_FIN_INT_DISCL_DET ( 
    PER_FIN_INT_DISCL_DET_ID NUMBER(12,0) NOT NULL, 
    PERSON_FIN_INT_DISCLOSURE_ID NUMBER(12,0) NOT NULL, 
    ENTITY_NUMBER VARCHAR2(10) NOT NULL, 
    SEQUENCE_NUMBER NUMBER(4,0) NOT NULL, 
    COLUMN_NAME VARCHAR2(30) NOT NULL, 
    COLUMN_VALUE VARCHAR2(2000), 
    RELATIONSHIP_TYPE_CODE VARCHAR2(3) NOT NULL, 
    COMMENTS VARCHAR2(2000), 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) NOT NULL)
/
