UPDATE QUESTIONNAIRE_USAGE SET QUESTIONNAIRE_LABEL='Grants.gov S2S Questionnaire' WHERE QUESTIONNAIRE_REF_ID_FK IN (SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE QUESTIONNAIRE_ID=5)
/