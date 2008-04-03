create or replace view OSP$S2S_APP_SUBMISSION as 
	select PROPOSAL_NUMBER,SUBMISSION_NUMBER,COMMENTS,STATUS,GG_TRACKING_ID,AGENCY_TRACKING_ID,
	RECEIVED_DATE,LAST_MODIFIED_DATE,LAST_NOTIFIED_DATE,UPDATE_TIMESTAMP,UPDATE_USER
	
	from S2S_APP_SUBMISSION;