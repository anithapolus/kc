DELIMITER /
ALTER TABLE SUBAWARD_CLOSEOUT
  ADD CONSTRAINT UQ_SUBAWARD_CLOSEOUT 
  UNIQUE (CLOSEOUT_NUMBER)
/
ALTER TABLE SUBAWARD_CLOSEOUT
  ADD CONSTRAINT FK_SUBAWARD_CLOSEOUT
  FOREIGN KEY (SUBAWARD_ID) REFERENCES SUBAWARD (SUBAWARD_ID)
/
DELIMITER ;
