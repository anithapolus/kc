UPDATE ACTIVITY_TYPE SET HIGHER_EDUCATION_FUNCTION_CODE = 'IPR' WHERE DESCRIPTION = 'Research';
UPDATE ACTIVITY_TYPE SET HIGHER_EDUCATION_FUNCTION_CODE = 'IN' WHERE DESCRIPTION = 'Instruction';
UPDATE ACTIVITY_TYPE SET HIGHER_EDUCATION_FUNCTION_CODE = 'CSSR' WHERE DESCRIPTION = 'Public Service';
UPDATE ACTIVITY_TYPE SET HIGHER_EDUCATION_FUNCTION_CODE = 'PSSR' WHERE DESCRIPTION = 'Clinical Trial';
UPDATE ACTIVITY_TYPE SET HIGHER_EDUCATION_FUNCTION_CODE = 'S&F' WHERE DESCRIPTION = 'Fellowship - Pre-Doctoral';
UPDATE ACTIVITY_TYPE SET HIGHER_EDUCATION_FUNCTION_CODE = 'S&F' WHERE DESCRIPTION = 'Fellowship - Post-Doctoral';
UPDATE ACTIVITY_TYPE SET HIGHER_EDUCATION_FUNCTION_CODE = 'User must select' WHERE DESCRIPTION = 'Construction';
UPDATE ACTIVITY_TYPE SET HIGHER_EDUCATION_FUNCTION_CODE = 'User must select' WHERE DESCRIPTION = 'other';
UPDATE ACTIVITY_TYPE SET HIGHER_EDUCATION_FUNCTION_CODE = 'SS' WHERE DESCRIPTION = 'Student Services';

COMMIT;
