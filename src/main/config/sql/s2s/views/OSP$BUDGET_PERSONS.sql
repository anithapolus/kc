
CREATE OR REPLACE VIEW OSP$BUDGET_PERSONS ( PROPOSAL_NUMBER, 
VERSION_NUMBER, PERSON_ID, JOB_CODE, EFFECTIVE_DATE, 
CALCULATION_BASE, APPOINTMENT_TYPE, PERSON_NAME, NON_EMPLOYEE_FLAG, 
UPDATE_TIMESTAMP, UPDATE_USER ) AS select PROPOSAL_NUMBER,VERSION_NUMBER,PERSON_ID,JOB_CODE,EFFECTIVE_DATE,CALCULATION_BASE,
	APPOINTMENT_TYPE.DESCRIPTION APPOINTMENT_TYPE,PERSON_NAME,NON_EMPLOYEE_FLAG,BUDGET_PERSONS.UPDATE_TIMESTAMP,BUDGET_PERSONS.UPDATE_USER
	from BUDGET_PERSONS,APPOINTMENT_TYPE
	where BUDGET_PERSONS.APPOINTMENT_TYPE_CODE = APPOINTMENT_TYPE.APPOINTMENT_TYPE_CODE
