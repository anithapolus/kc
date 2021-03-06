ALTER TABLE BUDGET_DETAILS ADD (HIERARCHY_PROPOSAL_NUMBER VARCHAR (12) , HIDE_IN_HIERARCHY CHAR (1) DEFAULT 'N' NOT NULL) ;

ALTER TABLE BUDGET_DETAILS 
    ADD CONSTRAINT FK_BUDGET_DETAILS_HIER FOREIGN KEY (HIERARCHY_PROPOSAL_NUMBER) 
                REFERENCES EPS_PROPOSAL (PROPOSAL_NUMBER) ;

ALTER TABLE BUDGET_PERSONS ADD (HIERARCHY_PROPOSAL_NUMBER VARCHAR (12) , HIDE_IN_HIERARCHY CHAR (1) DEFAULT 'N' NOT NULL) ;

ALTER TABLE BUDGET_PERSONS 
    ADD CONSTRAINT FK_BUDGET_PERSONS_HIER FOREIGN KEY (HIERARCHY_PROPOSAL_NUMBER) 
                REFERENCES EPS_PROPOSAL (PROPOSAL_NUMBER) ;