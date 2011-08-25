DELIMITER /
INSERT INTO SEQ_COMMITTEE_ID VALUES(NULL)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
VALUES ((SELECT (MAX(ID)) FROM SEQ_COMMITTEE_ID),(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000005'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Chair'),'20100701','20150701','quickstart',NOW(),UUID(),0)
/
INSERT INTO SEQ_COMMITTEE_ID VALUES(NULL)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
VALUES ((SELECT (MAX(ID)) FROM SEQ_COMMITTEE_ID),(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000006'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Member'),'20100701','20150701','quickstart',NOW(),UUID(),0)
/
INSERT INTO SEQ_COMMITTEE_ID VALUES(NULL)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
VALUES ((SELECT (MAX(ID)) FROM SEQ_COMMITTEE_ID),(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000007'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Alternate'),'20100701','20150701','quickstart',NOW(),UUID(),0)
/
INSERT INTO SEQ_COMMITTEE_ID VALUES(NULL)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
VALUES ((SELECT (MAX(ID)) FROM SEQ_COMMITTEE_ID),(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000008'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Member'),'20080101','20100701','quickstart',NOW(),UUID(),0)
/
INSERT INTO SEQ_COMMITTEE_ID VALUES(NULL)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
VALUES ((SELECT (MAX(ID)) FROM SEQ_COMMITTEE_ID),(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000008'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Inactive'),'20100702','20120701','quickstart',NOW(),UUID(),0)
/
INSERT INTO SEQ_COMMITTEE_ID VALUES(NULL)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
VALUES ((SELECT (MAX(ID)) FROM SEQ_COMMITTEE_ID),(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000008'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Member'),'20120702','20150701','quickstart',NOW(),UUID(),0)
/
INSERT INTO SEQ_COMMITTEE_ID VALUES(NULL)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
VALUES ((SELECT (MAX(ID)) FROM SEQ_COMMITTEE_ID),(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000059'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Member - Scientist'),'20010701','20100701','quickstart',NOW(),UUID(),0)
/
INSERT INTO SEQ_COMMITTEE_ID VALUES(NULL)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
VALUES ((SELECT (MAX(ID)) FROM SEQ_COMMITTEE_ID),(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000004'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Prisoner Representative'),'20100701','20130701','quickstart',NOW(),UUID(),0)
/
INSERT INTO SEQ_COMMITTEE_ID VALUES(NULL)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
VALUES ((SELECT (MAX(ID)) FROM SEQ_COMMITTEE_ID),(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000002'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Alternate'),'20100701','20150701','quickstart',NOW(),UUID(),0)
/
INSERT INTO SEQ_COMMITTEE_ID VALUES(NULL)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
VALUES ((SELECT (MAX(ID)) FROM SEQ_COMMITTEE_ID),(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000002'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Member'),'20100701','20150701','quickstart',NOW(),UUID(),0)
/
DELIMITER ;
