UPDATE SPONSOR
SET ACTV_IND = 'Y'
/
COMMIT
/
UPDATE SPONSOR
SET ACTV_IND = 'N'
WHERE UPPER(SPONSOR_NAME) LIKE '%DO NOT USE%'
/