CREATE OR REPLACE VIEW OSP$ACCOUNT_TYPE AS SELECT 
	ACCOUNT_TYPE_CODE, 
	DESCRIPTION, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM ACCOUNT_TYPE;

CREATE OR REPLACE VIEW OSP$AFFILIATION_TYPE
AS
   SELECT
    AFFILIATION_TYPE_CODE,
    DESCRIPTION,
    UPDATE_TIMESTAMP,
    UPDATE_USER
     FROM
    AFFILIATION_TYPE;
CREATE OR REPLACE VIEW OSP$AWARD( "MIT_AWARD_NUMBER", "SEQUENCE_NUMBER", "MODIFICATION_NUMBER", "SPONSOR_AWARD_NUMBER", "STATUS_CODE", "TEMPLATE_CODE", "AWARD_EXECUTION_DATE", "AWARD_EFFECTIVE_DATE", "BEGIN_DATE", "SPONSOR_CODE", "ACCOUNT_NUMBER", "APPRVD_EQUIPMENT_INDICATOR", "APPRVD_FOREIGN_TRIP_INDICATOR", "APPRVD_SUBCONTRACT_INDICATOR", "PAYMENT_SCHEDULE_INDICATOR", "IDC_INDICATOR", "TRANSFER_SPONSOR_INDICATOR", "COST_SHARING_INDICATOR", "UPDATE_TIMESTAMP", "UPDATE_USER", "SPECIAL_REVIEW_INDICATOR", "SCIENCE_CODE_INDICATOR", "NSF_CODE" )
AS
   SELECT
    AWARD_NUMBER,
    SEQUENCE_NUMBER,
    MODIFICATION_NUMBER,
    SPONSOR_AWARD_NUMBER,
    STATUS_CODE,
    TEMPLATE_CODE,
    AWARD_EXECUTION_DATE,
    AWARD_EFFECTIVE_DATE,
    BEGIN_DATE,
    SPONSOR_CODE,
    ACCOUNT_NUMBER,
    APPRVD_EQUIPMENT_INDICATOR,
    APPRVD_FOREIGN_TRIP_INDICATOR,
    APPRVD_SUBCONTRACT_INDICATOR,
    PAYMENT_SCHEDULE_INDICATOR,
    IDC_INDICATOR,
    TRANSFER_SPONSOR_INDICATOR,
    COST_SHARING_INDICATOR,
    UPDATE_TIMESTAMP,
    UPDATE_USER,
    SPECIAL_REVIEW_INDICATOR,
    SCIENCE_CODE_INDICATOR,
    NSF_CODE
     FROM
    award;
CREATE OR REPLACE VIEW OSP$AWARD_APPROVED_SUBCONTRACT AS SELECT 
	AWARD_NUMBER MIT_AWARD_NUMBER, 
	SEQUENCE_NUMBER SEQUENCE_NUMBER,
	ORGANIZATION_NAME SUBCONTRACTOR_NAME,
	AMOUNT AMOUNT,
	UPDATE_TIMESTAMP UPDATE_TIMESTAMP, 
	UPDATE_USER UPDATE_USER
FROM AWARD_APPROVED_SUBAWARDS;
CREATE OR REPLACE VIEW OSP$AWARD_COST_SHARING
AS
   SELECT
    AWARD_NUMBER MIT_AWARD_NUMBER,
    SEQUENCE_NUMBER SEQUENCE_NUMBER,
    FISCAL_YEAR FISCAL_YEAR,
    COST_SHARE_PERCENTAGE COST_SHARING_PERCENTAGE,
    COST_SHARE_TYPE_CODE COST_SHARING_TYPE_CODE,
    SOURCE SOURCE_ACCOUNT,
    DESTINATION DESTINATION_ACCOUNT,
    COMMITMENT_AMOUNT AMOUNT,
    UPDATE_TIMESTAMP UPDATE_TIMESTAMP,
    UPDATE_USER UPDATE_USER
     FROM
    AWARD_COST_SHARE;
CREATE OR REPLACE VIEW OSP$AWARD_COMMENTS
AS
   SELECT
    AWARD_NUMBER MIT_AWARD_NUMBER,
    SEQUENCE_NUMBER SEQUENCE_NUMBER,
    COMMENT_TYPE_CODE COMMENT_CODE,
    CHECKLIST_PRINT_FLAG CHECKLIST_PRINT_FLAG,
    COMMENTS COMMENTS,
    UPDATE_TIMESTAMP UPDATE_TIMESTAMP,
    UPDATE_USER UPDATE_USER
     FROM
    AWARD_COMMENT;
    
CREATE OR REPLACE VIEW OSP$AWARD_DOCUMENT_TERMS AS SELECT 
	AWARD_NUMBER MIT_AWARD_NUMBER, 
	SEQUENCE_NUMBER SEQUENCE_NUMBER,
	SPONSOR_TERM_ID EQUIPMENT_APPROVAL_CODE,
	UPDATE_TIMESTAMP UPDATE_TIMESTAMP, 
	UPDATE_USER UPDATE_USER
FROM AWARD_SPONSOR_TERM where exists (select sponsor_term_type_code from sponsor_term where AWARD_SPONSOR_TERM.SPONSOR_TERM_ID = sponsor_term.SPONSOR_TERM_ID and sponsor_term_type_code='6');

CREATE OR REPLACE VIEW OSP$AWARD_EQUIPMENT_TERMS AS SELECT 
	AWARD_NUMBER MIT_AWARD_NUMBER, 
	SEQUENCE_NUMBER SEQUENCE_NUMBER,
	SPONSOR_TERM_ID EQUIPMENT_APPROVAL_CODE,
	UPDATE_TIMESTAMP UPDATE_TIMESTAMP, 
	UPDATE_USER UPDATE_USER
FROM AWARD_SPONSOR_TERM where exists (select sponsor_term_type_code from sponsor_term where AWARD_SPONSOR_TERM.SPONSOR_TERM_ID = sponsor_term.SPONSOR_TERM_ID and sponsor_term_type_code='1');

CREATE OR REPLACE VIEW OSP$AWARD_HEADER( "MIT_AWARD_NUMBER", "SEQUENCE_NUMBER", "PROPOSAL_NUMBER", "TITLE", "AWARD_TYPE_CODE", "SPECIAL_EB_RATE_OFF_CAMPUS", "SPECIAL_EB_RATE_ON_CAMPUS", "PRE_AWARD_AUTHORIZED_AMOUNT", "PRE_AWARD_EFFECTIVE_DATE", "CFDA_NUMBER", "DFAFS_NUMBER", "SUB_PLAN_FLAG", "PROCUREMENT_PRIORITY_CODE", "PRIME_SPONSOR_CODE", "NON_COMPETING_CONT_PRPSL_DUE", "COMPETING_RENEWAL_PRPSL_DUE", "BASIS_OF_PAYMENT_CODE", "METHOD_OF_PAYMENT_CODE", "PAYMENT_INVOICE_FREQ_CODE", "INVOICE_NUMBER_OF_COPIES", "FINAL_INVOICE_DUE", "ACTIVITY_TYPE_CODE", "ACCOUNT_TYPE_CODE", "UPDATE_TIMESTAMP", "UPDATE_USER" )
AS
   SELECT
    AWARD_NUMBER,
    SEQUENCE_NUMBER,
    PROPOSAL_NUMBER,
    TITLE,
    AWARD_TYPE_CODE,
    SPECIAL_EB_RATE_OFF_CAMPUS,
    SPECIAL_EB_RATE_ON_CAMPUS,
    PRE_AWARD_AUTHORIZED_AMOUNT,
    PRE_AWARD_EFFECTIVE_DATE,
    CFDA_NUMBER,
    DFAFS_NUMBER,
    SUB_PLAN_FLAG,
    PROCUREMENT_PRIORITY_CODE,
    PRIME_SPONSOR_CODE,
    NON_COMPETING_CONT_PRPSL_DUE,
    COMPETING_RENEWAL_PRPSL_DUE,
    BASIS_OF_PAYMENT_CODE,
    METHOD_OF_PAYMENT_CODE,
    PAYMENT_INVOICE_FREQ_CODE,
    INVOICE_NUMBER_OF_COPIES,
    FINAL_INVOICE_DUE,
    ACTIVITY_TYPE_CODE,
    ACCOUNT_TYPE_CODE,
    UPDATE_TIMESTAMP,
    UPDATE_USER
     FROM
    AWARD;
    
CREATE OR REPLACE VIEW OSP$AWARD_IDC_RATE AS SELECT 
	AWARD_NUMBER MIT_AWARD_NUMBER, 
	SEQUENCE_NUMBER SEQUENCE_NUMBER, 
	APPLICABLE_IDC_RATE APPLICABLE_IDC_RATE, 
	IDC_RATE_TYPE_CODE IDC_RATE_TYPE_CODE, 
	FISCAL_YEAR FISCAL_YEAR, 
	ON_CAMPUS_FLAG ON_CAMPUS_FLAG, 
	UNDERRECOVERY_OF_IDC UNDERRECOVERY_OF_IDC, 
	SOURCE_ACCOUNT SOURCE_ACCOUNT, 
	DESTINATION_ACCOUNT DESTINATION_ACCOUNT, 
	START_DATE START_DATE, 
	END_DATE END_DATE, 
	UPDATE_TIMESTAMP UPDATE_TIMESTAMP, 
	UPDATE_USER UPDATE_USER
FROM AWARD_IDC_RATE;

CREATE OR REPLACE VIEW OSP$AWARD_INVENTION_TERMS AS SELECT 
	AWARD_NUMBER MIT_AWARD_NUMBER, 
	SEQUENCE_NUMBER SEQUENCE_NUMBER,
	SPONSOR_TERM_ID EQUIPMENT_APPROVAL_CODE,
	UPDATE_TIMESTAMP UPDATE_TIMESTAMP, 
	UPDATE_USER UPDATE_USER
FROM AWARD_SPONSOR_TERM where exists (select sponsor_term_type_code from sponsor_term where AWARD_SPONSOR_TERM.SPONSOR_TERM_ID = sponsor_term.SPONSOR_TERM_ID and sponsor_term_type_code='2');

CREATE OR REPLACE VIEW OSP$AWARD_PAYMENT_SCHEDULE AS SELECT 
	AWARD_NUMBER MIT_AWARD_NUMBER, 
	SEQUENCE_NUMBER, 
	DUE_DATE, 
	AMOUNT, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER, 
	SUBMIT_DATE, 
	SUBMITTED_BY, 
	INVOICE_NUMBER, 
	STATUS_DESCRIPTION
FROM AWARD_PAYMENT_SCHEDULE;

CREATE OR REPLACE VIEW OSP$AWARD_PRIOR_APPROVAL_TERMS AS SELECT 
	AWARD_NUMBER MIT_AWARD_NUMBER, 
	SEQUENCE_NUMBER SEQUENCE_NUMBER,
	SPONSOR_TERM_ID EQUIPMENT_APPROVAL_CODE,
	UPDATE_TIMESTAMP UPDATE_TIMESTAMP, 
	UPDATE_USER UPDATE_USER
FROM AWARD_SPONSOR_TERM where exists (select sponsor_term_type_code from sponsor_term where AWARD_SPONSOR_TERM.SPONSOR_TERM_ID = sponsor_term.SPONSOR_TERM_ID and sponsor_term_type_code='3');

CREATE OR REPLACE VIEW OSP$AWARD_PROPERTY_TERMS AS SELECT 
	AWARD_NUMBER MIT_AWARD_NUMBER, 
	SEQUENCE_NUMBER SEQUENCE_NUMBER,
	SPONSOR_TERM_ID EQUIPMENT_APPROVAL_CODE,
	UPDATE_TIMESTAMP UPDATE_TIMESTAMP, 
	UPDATE_USER UPDATE_USER
FROM AWARD_SPONSOR_TERM where exists (select sponsor_term_type_code from sponsor_term where AWARD_SPONSOR_TERM.SPONSOR_TERM_ID = sponsor_term.SPONSOR_TERM_ID and sponsor_term_type_code='4');

CREATE OR REPLACE VIEW OSP$AWARD_PUBLICATION_TERMS AS SELECT 
	AWARD_NUMBER MIT_AWARD_NUMBER, 
	SEQUENCE_NUMBER SEQUENCE_NUMBER,
	SPONSOR_TERM_ID EQUIPMENT_APPROVAL_CODE,
	UPDATE_TIMESTAMP UPDATE_TIMESTAMP, 
	UPDATE_USER UPDATE_USER
FROM AWARD_SPONSOR_TERM where exists (select sponsor_term_type_code from sponsor_term where AWARD_SPONSOR_TERM.SPONSOR_TERM_ID = sponsor_term.SPONSOR_TERM_ID and sponsor_term_type_code='5');

CREATE OR REPLACE VIEW OSP$AWARD_RIGHTS_IN_DATA_TERMS AS SELECT 
	AWARD_NUMBER MIT_AWARD_NUMBER, 
	SEQUENCE_NUMBER SEQUENCE_NUMBER,
	SPONSOR_TERM_ID EQUIPMENT_APPROVAL_CODE,
	UPDATE_TIMESTAMP UPDATE_TIMESTAMP, 
	UPDATE_USER UPDATE_USER
FROM AWARD_SPONSOR_TERM where exists (select sponsor_term_type_code from sponsor_term where AWARD_SPONSOR_TERM.SPONSOR_TERM_ID = sponsor_term.SPONSOR_TERM_ID and sponsor_term_type_code='7');

CREATE OR REPLACE VIEW OSP$AWARD_REPORT_TERMS ( MIT_AWARD_NUMBER, SEQUENCE_NUMBER, REPORT_CLASS_CODE, REPORT_CODE, FREQUENCY_CODE, FREQUENCY_BASE_CODE, OSP_DISTRIBUTION_CODE, CONTACT_TYPE_CODE, ROLODEX_ID, DUE_DATE, NUMBER_OF_COPIES, UPDATE_TIMESTAMP, UPDATE_USER )
AS
SELECT
AWARD_NUMBER MIT_AWARD_NUMBER,
SEQUENCE_NUMBER,
REPORT_CLASS_CODE,
REPORT_CODE,
FREQUENCY_CODE,
FREQUENCY_BASE_CODE,
OSP_DISTRIBUTION_CODE,
CONTACT_TYPE_CODE,
ROLODEX_ID,
DUE_DATE,
NUMBER_OF_COPIES,
A.UPDATE_TIMESTAMP,
A.UPDATE_USER
FROM AWARD_REPORT_TERMS A, AWARD_REP_TERMS_RECNT B WHERE A.AWARD_REPORT_TERMS_ID = B.AWARD_REPORT_TERMS_ID;

CREATE OR REPLACE VIEW OSP$AWARD_SCIENCE_CODE(MIT_AWARD_NUMBER, 
	SEQUENCE_NUMBER, 
	SCIENCE_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
	AS SELECT 
	B.AWARD_NUMBER, 
	B.SEQUENCE_NUMBER, 
	A.SCIENCE_KEYWORD_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_SCIENCE_KEYWORD A,AWARD B
	where A.AWARD_ID=B.AWARD_ID;
	
CREATE OR REPLACE VIEW OSP$AWARD_STATUS (STATUS_CODE, 
	DESCRIPTION, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
	AS SELECT 
	STATUS_CODE, 
	DESCRIPTION, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM AWARD_STATUS;

CREATE OR REPLACE VIEW OSP$AWARD_SUBCONTRACT_TERMS AS SELECT 
	AWARD_NUMBER MIT_AWARD_NUMBER, 
	SEQUENCE_NUMBER SEQUENCE_NUMBER,
	SPONSOR_TERM_ID EQUIPMENT_APPROVAL_CODE,
	UPDATE_TIMESTAMP UPDATE_TIMESTAMP, 
	UPDATE_USER UPDATE_USER
FROM AWARD_SPONSOR_TERM where exists (select sponsor_term_type_code from sponsor_term where AWARD_SPONSOR_TERM.SPONSOR_TERM_ID = sponsor_term.SPONSOR_TERM_ID and sponsor_term_type_code='8');

CREATE OR REPLACE VIEW OSP$AWARD_TRAVEL_TERMS AS SELECT 
	AWARD_NUMBER MIT_AWARD_NUMBER, 
	SEQUENCE_NUMBER SEQUENCE_NUMBER,
	SPONSOR_TERM_ID EQUIPMENT_APPROVAL_CODE,
	UPDATE_TIMESTAMP UPDATE_TIMESTAMP, 
	UPDATE_USER UPDATE_USER
FROM AWARD_SPONSOR_TERM where exists (select sponsor_term_type_code from sponsor_term where AWARD_SPONSOR_TERM.SPONSOR_TERM_ID = sponsor_term.SPONSOR_TERM_ID and sponsor_term_type_code='9');

CREATE OR REPLACE VIEW OSP$AWARD_TYPE AS SELECT 
	AWARD_TYPE_CODE, 
	DESCRIPTION, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM AWARD_TYPE;

CREATE OR REPLACE VIEW OSP$BASIS_OF_PAYMENT(	
	BASIS_OF_PAYMENT_CODE, 
	DESCRIPTION, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER) 
	AS SELECT 
	BASIS_OF_PAYMENT_CODE, 
	DESCRIPTION, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM AWARD_BASIS_OF_PAYMENT;

CREATE OR REPLACE VIEW OSP$COMM_MEMBERSHIPS AS

SELECT
    COMMITTEE_ID,
    DECODE (PERSON_ID, NULL, TO_CHAR(ROLODEX_ID),
                             PERSON_ID) AS PERSON_ID,
    MEMBERSHIP_ID,
    SEQUENCE_NUMBER,
    PERSON_NAME,
    DECODE (PERSON_ID, NULL, 'N',
                             'Y') AS NON_EMPLOYEE_FLAG,
    PAID_MEMBER_FLAG,
    TERM_START_DATE,
    TERM_END_DATE,
    MEMBERSHIP_TYPE_CODE,
    COMMENTS,
    UPDATE_TIMESTAMP,
    UPDATE_USER
FROM COMM_MEMBERSHIPS;

CREATE OR REPLACE VIEW OSP$COMM_MEMBER_ROLES AS
SELECT 
    MEMBERSHIP_ID, 
    SEQUENCE_NUMBER, 
    MEMBERSHIP_ROLE_CODE, 
    START_DATE, 
    END_DATE, 
    UPDATE_TIMESTAMP, 
    UPDATE_USER
FROM COMM_MEMBER_ROLES; 

CREATE OR REPLACE VIEW OSP$COMM_RESEARCH_AREAS AS SELECT 
  c.COMMITTEE_ID,
  cra.RESEARCH_AREA_CODE,
  cra.UPDATE_TIMESTAMP, 
  cra.UPDATE_USER
FROM COMM_RESEARCH_AREAS cra, COMMITTEE c
where cra.COMMITTEE_ID = c.ID;

CREATE OR REPLACE VIEW osp$comm_schedule AS SELECT 
  a.schedule_id schedule_id,
  b.committee_id committee_id,
  a.time scheduled_date,
  a.place place,
  a.time time,
  a.protocol_sub_deadline protocol_sub_deadline,
  a.schedule_status_code schedule_status_code,
  a.meeting_date meeting_date,
  a.start_time start_time,
  a.end_time end_time,
  a.agenda_prod_rev_date agenda_prod_rev_date,
  a.max_protocols max_protocols,
  a.comments comments,
  a.update_timestamp update_timestamp,
  a.update_user update_user
FROM comm_schedule a
INNER JOIN committee b
ON a.committee_id = b.id;

CREATE OR REPLACE VIEW osp$comm_schedule_frequency AS SELECT 
  frequency_code,
  description,
  no_of_days,
  update_timestamp,
  update_user
FROM comm_schedule_frequency;
CREATE OR REPLACE VIEW OSP$COMMENT AS SELECT 
	COMMENT_TYPE_CODE COMMENT_CODE,
	DESCRIPTION DESCRIPTION,
	TEMPLATE_FLAG TEMPLATE_FLAG,
	CHECKLIST_FLAG CHECKLIST_FLAG,
	AWARD_COMMENT_SCREEN_FLAG AWARD_COMMENT_SCREEN_FLAG,
	UPDATE_TIMESTAMP UPDATE_TIMESTAMP, 
	UPDATE_USER UPDATE_USER
FROM COMMENT_TYPE;

CREATE OR REPLACE VIEW OSP$COMM_MEMBERSHIPS AS

SELECT
    COMMITTEE_ID,
    DECODE (PERSON_ID, NULL, TO_CHAR(ROLODEX_ID),
                             PERSON_ID) AS PERSON_ID,
    MEMBERSHIP_ID,
    SEQUENCE_NUMBER,
    PERSON_NAME,
    DECODE (PERSON_ID, NULL, 'N',
                             'Y') AS NON_EMPLOYEE_FLAG,
    PAID_MEMBER_FLAG,
    TERM_START_DATE,
    TERM_END_DATE,
    MEMBERSHIP_TYPE_CODE,
    COMMENTS,
    UPDATE_TIMESTAMP,
    UPDATE_USER
FROM COMM_MEMBERSHIPS;

CREATE OR REPLACE VIEW OSP$COMM_MEMBERSHIP_TYPE AS SELECT 
    MEMBERSHIP_TYPE_CODE, 
    DESCRIPTION, 
    UPDATE_TIMESTAMP, 
    UPDATE_USER
FROM COMM_MEMBERSHIP_TYPE;
CREATE VIEW OSP$COMMITTEE_TYPE
AS SELECT COMMITTEE_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER
FROM COMMITTEE_TYPE;
CREATE VIEW OSP$COMMITTEE
AS SELECT COMMITTEE_ID, COMMITTEE_NAME, HOME_UNIT_NUMBER, DESCRIPTION,
    SCHEDULE_DESCRIPTION, COMMITTEE_TYPE_CODE, MINIMUM_MEMBERS_REQUIRED,
    MAX_PROTOCOLS, ADV_SUBMISSION_DAYS_REQ, DEFAULT_REVIEW_TYPE_CODE,
    APPLICABLE_REVIEW_TYPE_CODE, CREATE_TIMESTAMP, CREATE_USER,
    UPDATE_TIMESTAMP, UPDATE_USER
FROM COMMITTEE;
CREATE OR REPLACE VIEW OSP$CONTACT_TYPE
AS
   SELECT
    CONTACT_TYPE_CODE,
    DESCRIPTION,
    UPDATE_TIMESTAMP,
    UPDATE_USER
     FROM
    CONTACT_TYPE;
CREATE OR REPLACE VIEW OSP$COST_SHARING_TYPE
AS
   SELECT
    COST_SHARE_TYPE_CODE COST_SHARING_TYPE_CODE,
    DESCRIPTION DESCRIPTION,
    UPDATE_TIMESTAMP UPDATE_TIMESTAMP,
    UPDATE_USER UPDATE_USER
     FROM
    COST_SHARE_TYPE;
CREATE OR REPLACE VIEW OSP$DISTRIBUTION
AS
   SELECT
    OSP_DISTRIBUTION_CODE,
    DESCRIPTION,
    UPDATE_TIMESTAMP,
    UPDATE_USER
     FROM
    DISTRIBUTION;
CREATE OR REPLACE VIEW OSP$FREQUENCY
AS
   SELECT
    FREQUENCY_CODE,
    DESCRIPTION,
    NUMBER_OF_DAYS,
    NUMBER_OF_MONTHS,
    REPEAT_FLAG,
    PROPOSAL_DUE_FLAG,
    INVOICE_FLAG,
    UPDATE_TIMESTAMP,
    UPDATE_USER,
    ADVANCE_NUMBER_OF_DAYS,
    ADVANCE_NUMBER_OF_MONTHS
     FROM
    FREQUENCY;
CREATE OR REPLACE VIEW OSP$FREQUENCY_BASE
AS
   SELECT
    FREQUENCY_BASE_CODE,
    DESCRIPTION,
    UPDATE_TIMESTAMP,
    UPDATE_USER
     FROM
    FREQUENCY_BASE;
CREATE OR REPLACE VIEW OSP$FUNDING_SOURCE_TYPE AS SELECT 
    FUNDING_SOURCE_TYPE_CODE, 
    DESCRIPTION, 
    UPDATE_TIMESTAMP, 
    UPDATE_USER, 
    FUNDING_SOURCE_TYPE_FLAG
FROM FUNDING_SOURCE_TYPE;
CREATE OR REPLACE VIEW OSP$IDC_RATE_TYPE
AS
   SELECT
    IDC_RATE_TYPE_CODE,
    DESCRIPTION,
    UPDATE_TIMESTAMP,
    UPDATE_USER
     FROM
    IDC_RATE_TYPE;
CREATE OR REPLACE VIEW OSP$METHOD_OF_PAYMENT (	
	METHOD_OF_PAYMENT_CODE, 
	DESCRIPTION, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER) 
AS SELECT 
	METHOD_OF_PAYMENT_CODE, 
	DESCRIPTION, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM AWARD_METHOD_OF_PAYMENT;

CREATE OR REPLACE VIEW OSP$MEMBERSHIP_ROLE AS SELECT
    MEMBERSHIP_ROLE_CODE,
    DESCRIPTION,
    UPDATE_TIMESTAMP,
    UPDATE_USER
FROM MEMBERSHIP_ROLE;
CREATE OR REPLACE VIEW OSP$PERSON_TRAINING AS SELECT 
	PERSON_ID, 
	TRAINING_NUMBER, 
	TRAINING_CODE, 
	DATE_REQUESTED, 
	DATE_SUBMITTED, 
	DATE_ACKNOWLEDGED, 
	FOLLOWUP_DATE, 
	SCORE, 
	COMMENTS, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM PERSON_TRAINING;
CREATE OR REPLACE VIEW OSP$PROTOCOL
AS
   SELECT
    PROTOCOL_NUMBER,
    SEQUENCE_NUMBER,
    PROTOCOL_TYPE_CODE,
    PROTOCOL_STATUS_CODE,
    TITLE,
    DESCRIPTION,
    APPLICATION_DATE,
    APPROVAL_DATE,
    EXPIRATION_DATE,
    LAST_APPROVAL_DATE,
    FDA_APPLICATION_NUMBER,
    REFERENCE_NUMBER_1,
    REFERENCE_NUMBER_2,
    IS_BILLABLE,
    SPECIAL_REVIEW_INDICATOR,
    VULNERABLE_SUBJECT_INDICATOR,
    KEY_STUDY_PERSON_INDICATOR,
    FUNDING_SOURCE_INDICATOR,
    CORRESPONDENT_INDICATOR,
    REFERENCE_INDICATOR,
    RELATED_PROJECTS_INDICATOR,
    CREATE_TIMESTAMP,
    CREATE_USER,
    UPDATE_TIMESTAMP,
    UPDATE_USER
     FROM
    PROTOCOL;
CREATE OR REPLACE VIEW OSP$PROTOCOL_FUNDING_SOURCE AS SELECT 
    PROTOCOL_NUMBER, 
    SEQUENCE_NUMBER, 
    FUNDING_SOURCE_TYPE_CODE, 
    FUNDING_SOURCE, 
    UPDATE_TIMESTAMP, 
    UPDATE_USER
FROM PROTOCOL_FUNDING_SOURCE;
CREATE OR REPLACE VIEW OSP$PROTOCOL_INVESTIGATORS(
PROTOCOL_NUMBER, SEQUENCE_NUMBER, PERSON_ID, PERSON_NAME, NON_EMPLOYEE_FLAG,
PRINCIPAL_INVESTIGATOR_FLAG, AFFILIATION_TYPE_CODE, UPDATE_TIMESTAMP, UPDATE_USER)
AS SELECT PROTOCOL_NUMBER, SEQUENCE_NUMBER, 
cast(DECODE(TO_CHAR(ROLODEX_ID),NULL,PERSON_ID,TO_CHAR(ROLODEX_ID)) AS VARCHAR2(10)) PERSON_ID,
PERSON_NAME, DECODE(PERSON_ID,NULL,'Y','N') NON_EMPLOYEE_FLAG, 
DECODE(PROTOCOL_PERSON_ROLE_ID,'PI','Y','N') PRINCIPAL_INVESTIGATOR_FLAG,
AFFILIATION_TYPE_CODE, UPDATE_TIMESTAMP, UPDATE_USER
FROM PROTOCOL_PERSONS
WHERE PROTOCOL_PERSON_ROLE_ID IN ('PI','COI');


CREATE OR REPLACE VIEW OSP$PROTOCOL_KEY_PERSONS
(PROTOCOL_NUMBER, SEQUENCE_NUMBER, PERSON_ID, PERSON_NAME, PERSON_ROLE,
NON_EMPLOYEE_FLAG, AFFILIATION_TYPE_CODE, UPDATE_TIMESTAMP, UPDATE_USER)
AS 
SELECT
PROTOCOL_NUMBER, SEQUENCE_NUMBER,
DECODE(PERSON_ID,NULL,TO_CHAR(ROLODEX_ID),PERSON_ID) PERSON_ID, 
PERSON_NAME, B.DESCRIPTION PERSON_ROLE,
DECODE(PERSON_ID,NULL,'N','Y') NON_EMPLOYEE_FLAG, 
AFFILIATION_TYPE_CODE, A.UPDATE_TIMESTAMP UPDATE_TIMESTAMP, A.UPDATE_USER UPDATE_USER
FROM PROTOCOL_PERSONS A, PROTOCOL_PERSON_ROLES B 
WHERE B.PROTOCOL_PERSON_ROLE_ID = A.PROTOCOL_PERSON_ROLE_ID AND
A.PROTOCOL_PERSON_ROLE_ID NOT IN ('PI','COI');

CREATE OR REPLACE VIEW OSP$PROTOCOL_LOCATION
AS
   SELECT
    PROTOCOL_NUMBER,
    SEQUENCE_NUMBER,
    PROTOCOL_ORG_TYPE_CODE,
    ORGANIZATION_ID,
    ROLODEX_ID,
    UPDATE_TIMESTAMP,
    UPDATE_USER
     FROM
    PROTOCOL_LOCATION;
CREATE OR REPLACE VIEW OSP$PROTOCOL_ORG_TYPE
AS
   SELECT
    PROTOCOL_ORG_TYPE_CODE,
    DESCRIPTION,
    UPDATE_TIMESTAMP,
    UPDATE_USER
     FROM
    PROTOCOL_ORG_TYPE;
CREATE OR REPLACE VIEW osp$protocol_reference_type
AS
   SELECT
    protocol_reference_type_code,
    description,
    update_timestamp,
    update_user
     FROM
    protocol_reference_type;
CREATE OR REPLACE VIEW osp$protocol_references
AS
   SELECT
    protocol_number,
    sequence_number,
    protocol_reference_number,
    protocol_reference_type_code,
    reference_key,
    application_date,
    approval_date,
    comments,
    update_timestamp,
    update_user
     FROM
    protocol_references;
CREATE OR REPLACE VIEW OSP$PROTOCOL_RESEARCH_AREAS AS SELECT 
  PROTOCOL_NUMBER,
  SEQUENCE_NUMBER,
  RESEARCH_AREA_CODE,
  UPDATE_TIMESTAMP, 
  UPDATE_USER
FROM PROTOCOL_RESEARCH_AREAS;

CREATE VIEW OSP$PROTOCOL_REVIEW_TYPE
AS SELECT PROTOCOL_REVIEW_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, null as AVAILABLE_IN_LITE
FROM PROTOCOL_REVIEW_TYPE;

CREATE OR REPLACE VIEW OSP$PROTOCOL_RISK_LEVELS AS SELECT 
	PROTOCOL_NUMBER, 
	SEQUENCE_NUMBER, 
	RISK_LEVEL_CODE, 
	COMMENTS, 
	DATE_ASSIGNED, 
	DATE_UPDATED, 
	STATUS, 
	UPDATE_USER, 
	UPDATE_TIMESTAMP
FROM PROTOCOL_RISK_LEVELS;

CREATE VIEW OSP$PROTOCOL_SPECIAL_REVIEW
AS SELECT PROTOCOL_NUMBER,  
          0 as SEQUENCE_NUMBER, 
          SPECIAL_REVIEW_NUMBER,
          SPECIAL_REVIEW_CODE, 
          APPROVAL_TYPE_CODE, 
          null as SP_REV_PROTOCOL_NUMBER,
          APPLICATION_DATE, 
          APPROVAL_DATE, 
          COMMENTS,
          UPDATE_TIMESTAMP, 
          UPDATE_USER
FROM PROTOCOL_SPECIAL_REVIEW;

CREATE OR REPLACE VIEW OSP$PROTOCOL_TYPE
AS
   SELECT
    PROTOCOL_TYPE_CODE,
    DESCRIPTION,
    UPDATE_TIMESTAMP,
    UPDATE_USER
     FROM
    PROTOCOL_TYPE;
CREATE OR REPLACE VIEW OSP$PROTOCOL_UNITS
AS
   SELECT
    PROTOCOL_NUMBER,
    SEQUENCE_NUMBER,
    UNIT_NUMBER,
    LEAD_UNIT_FLAG,
    PERSON_ID,
    UPDATE_TIMESTAMP,
    UPDATE_USER
     FROM
    PROTOCOL_UNITS;
CREATE OR REPLACE VIEW OSP$PROTOCOL_VULNERABLE_SUB
AS
   SELECT
    PROTOCOL_NUMBER,
    SEQUENCE_NUMBER,
    VULNERABLE_SUBJECT_TYPE_CODE,
    SUBJECT_COUNT,
    UPDATE_TIMESTAMP,
    UPDATE_USER
     FROM
    PROTOCOL_VULNERABLE_SUB;
CREATE OR REPLACE VIEW OSP$REPORT_CLASS
AS
   SELECT
    REPORT_CLASS_CODE,
    DESCRIPTION,
    UPDATE_TIMESTAMP,
    UPDATE_USER,
    GENERATE_REPORT_REQUIREMENTS
     FROM
    REPORT_CLASS;
CREATE OR REPLACE VIEW OSP$REPORT
AS
   SELECT
    REPORT_CODE,
    DESCRIPTION,
    FINAL_REPORT_FLAG,
    UPDATE_TIMESTAMP,
    UPDATE_USER
     FROM
    REPORT;
CREATE OR REPLACE VIEW OSP$RESEARCH_AREAS AS SELECT 
	RESEARCH_AREA_CODE, 
	PARENT_RESEARCH_AREA_CODE, 
	HAS_CHILDREN_FLAG, 
	DESCRIPTION, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM RESEARCH_AREAS;
CREATE OR REPLACE VIEW OSP$RISK_LEVEL AS SELECT 
	RISK_LEVEL_CODE, 
	DESCRIPTION, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM RISK_LEVEL;
CREATE OR REPLACE VIEW osp$schedule_status AS SELECT 
  schedule_status_code,
  description,
  update_timestamp,
  update_user
FROM schedule_status;

CREATE OR REPLACE VIEW OSP$TEMPLATE (
	TEMPLATE_CODE, 
	DESCRIPTION, 
	STATUS_CODE, 
	PRIME_SPONSOR_CODE, 
	NON_COMPETING_CONT_PRPSL_DUE, 
	COMPETING_RENEWAL_PRPSL_DUE, 
	BASIS_OF_PAYMENT_CODE, 
	METHOD_OF_PAYMENT_CODE, 
	PAYMENT_INVOICE_FREQ_CODE, 
	INVOICE_NUMBER_OF_COPIES, 
	FINAL_INVOICE_DUE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
	AS SELECT 
	AWARD_TEMPLATE_CODE, 
	DESCRIPTION, 
	STATUS_CODE, 
	PRIME_SPONSOR_CODE, 
	NON_COMPETING_CONT_PRPSL_DUE, 
	COMPETING_RENEWAL_PRPSL_DUE, 
	BASIS_OF_PAYMENT_CODE, 
	METHOD_OF_PAYMENT_CODE, 
	PAYMENT_INVOICE_FREQ_CODE, 
	INVOICE_NUMBER_OF_COPIES, 
	FINAL_INVOICE_DUE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM AWARD_TEMPLATE;

CREATE OR REPLACE VIEW OSP$TEMPLATE_COMMENTS
	(TEMPLATE_CODE, 
	COMMENT_CODE, 
	CHECKLIST_PRINT_FLAG, 
	COMMENTS, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	AWARD_TEMPLATE_CODE, 
	COMMENT_TYPE_CODE, 
	CHECKLIST_PRINT_FLAG, 
	COMMENTS, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM AWARD_TEMPLATE_COMMENTS;
CREATE OR REPLACE VIEW OSP$TEMPLATE_CONTACT (	TEMPLATE_CODE, 
	CONTACT_TYPE_CODE, 
	ROLODEX_ID, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	AWARD_TEMPLATE_CODE, 
	CONTACT_TYPE_CODE, 
	ROLODEX_ID, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM AWARD_TEMPLATE_CONTACT;

CREATE OR REPLACE VIEW OSP$TEMPLATE_DOCUMENT_TERMS(	TEMPLATE_CODE, 
	REFERENCED_DOCUMENT_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER) 
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_CODE REFERENCED_DOCUMENT_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '6';
		
CREATE OR REPLACE VIEW OSP$TEMPLATE_EQUIPMENT_TERMS (	TEMPLATE_CODE, 
	EQUIPMENT_APPROVAL_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_CODE EQUIPMENT_APPROVAL_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '1';		
		
CREATE OR REPLACE VIEW OSP$TEMPLATE_INVENTION_TERMS (	TEMPLATE_CODE, 
	INVENTION_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_TYPE_CODE INVENTION_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '2';		

CREATE OR REPLACE VIEW OSP$TEMPLATE_PRIOR_TERMS (TEMPLATE_CODE, 
	PRIOR_APPROVAL_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_CODE PRIOR_APPROVAL_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '3';		
		
CREATE OR REPLACE VIEW OSP$TEMPLATE_PROPERTY_TERMS (TEMPLATE_CODE, 
	PROPERTY_CODE, 
	UPDATE_TIMESTAMP,
	UPDATE_USER)
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_CODE PROPERTY_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '4';				
		
CREATE OR REPLACE VIEW OSP$TEMPLATE_PUBLICATION_TERMS (	TEMPLATE_CODE, 
	PUBLICATION_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_CODE PUBLICATION_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '5';		
		
CREATE OR REPLACE VIEW OSP$TEMPLATE_RIGHTS_TERMS (TEMPLATE_CODE, 
	RIGHTS_IN_DATA_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_CODE RIGHTS_IN_DATA_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '7';			
		
CREATE OR REPLACE VIEW OSP$TEMPLATE_SUBCONTRACT_TERMS (	TEMPLATE_CODE, 
	SUBCONTRACT_APPROVAL_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_CODE SUBCONTRACT_APPROVAL_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '8';
		
CREATE OR REPLACE VIEW OSP$TEMPLATE_TRAVEL_TERMS (	TEMPLATE_CODE, 
	TRAVEL_RESTRICTION_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER) 
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_CODE TRAVEL_RESTRICTION_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '9';
		
CREATE OR REPLACE VIEW OSP$TEMPLATE_REPORT_TERMS (	TEMPLATE_CODE, 
	REPORT_CLASS_CODE, 
	REPORT_CODE, 
	FREQUENCY_CODE, 
	FREQUENCY_BASE_CODE, 
	OSP_DISTRIBUTION_CODE, 
	DUE_DATE, 
	CONTACT_TYPE_CODE, 
	ROLODEX_ID, 
	NUMBER_OF_COPIES, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	A.REPORT_CLASS_CODE, 
	A.REPORT_CODE, 
	A.FREQUENCY_CODE, 
	A.FREQUENCY_BASE_CODE, 
	A.OSP_DISTRIBUTION_CODE, 
	A.DUE_DATE, 
	B.CONTACT_TYPE_CODE, 
	B.ROLODEX_ID, 
	B.NUMBER_OF_COPIES, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_REPORT_TERMS A,AWARD_TEMPL_REP_TERMS_RECNT B
WHERE A.TEMPLATE_REPORT_TERMS_ID = B.TEMPLATE_REPORT_TERMS_ID;		

CREATE OR REPLACE VIEW OSP$VALID_CLASS_REPORT_FREQ AS SELECT 
	REPORT_CLASS_CODE, 
	REPORT_CODE, 
	FREQUENCY_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM VALID_CLASS_REPORT_FREQ;
CREATE OR REPLACE VIEW OSP$VALID_RATES
AS
   SELECT
    ON_CAMPUS_RATE,
    OFF_CAMPUS_RATE,
    RATE_CLASS_TYPE,
    ADJUSTMENT_KEY,
    UPDATE_TIMESTAMP,
    UPDATE_USER
     FROM
    VALID_RATES;
CREATE OR REPLACE VIEW OSP$VULNERABLE_SUBJECT_TYPE
AS
   SELECT
    VULNERABLE_SUBJECT_TYPE_CODE,
    DESCRIPTION,
    UPDATE_TIMESTAMP,
    UPDATE_USER
     FROM
    VULNERABLE_SUBJECT_TYPE;