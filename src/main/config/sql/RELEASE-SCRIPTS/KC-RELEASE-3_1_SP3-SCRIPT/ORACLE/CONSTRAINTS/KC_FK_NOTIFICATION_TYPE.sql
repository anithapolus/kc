ALTER TABLE NOTIFICATION_TYPE
  ADD CONSTRAINT FK_NOTIFICATION_TYPE FOREIGN KEY (MODULE_CODE)
  REFERENCES COEUS_MODULE (MODULE_CODE);