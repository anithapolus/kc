DELIMITER /
ALTER TABLE EPS_PROPOSAL 
ADD (DEADLINE_TIME VARCHAR(15) )
/

alter table EPS_PROPOSAL add HIERARCHY_LAST_BUDGET_DOC_NBR VARCHAR(40)
/

DELIMITER ;
