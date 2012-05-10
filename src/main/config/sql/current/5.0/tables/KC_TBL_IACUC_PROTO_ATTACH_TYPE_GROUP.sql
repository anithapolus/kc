CREATE TABLE IACUC_PROTO_ATTACH_TYPE_GROUP (
  TYPE_GROUP_ID NUMBER(12,0) NOT NULL,
  TYPE_CD VARCHAR2(3) NOT NULL,
  GROUP_CD VARCHAR2(3) COLLATE utf8_bin NOT NULL,
  VER_NBR NUMBER(8,0) NOT NULL DEFAULT '1',
  UPDATE_TIMESTAMP DATE NOT NULL,
  UPDATE_USER VARCHAR2(60) NOT NULL,
  OBJ_ID VARCHAR2(36) NOT NULL)
/
ALTER TABLE IACUC_PROTO_ATTACH_TYPE_GROUP
ADD CONSTRAINT PK_IACUC_PRT_ATTCH_TYPE_GROUP 
PRIMARY KEY (TYPE_GROUP_ID)
/