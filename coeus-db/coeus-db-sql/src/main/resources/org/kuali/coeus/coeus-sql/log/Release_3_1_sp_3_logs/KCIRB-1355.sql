


-- sequence is out dated so try to update it too.

drop SEQUENCE KRIM_GRP_ID_S;

CREATE SEQUENCE KRIM_GRP_ID_S
    INCREMENT BY 1
    START WITH 1000007
    MAXVALUE 9999999999999999999999999999
    NOMINVALUE
    NOCYCLE
    NOCACHE
    ORDER;


    INSERT INTO KRIM_GRP_T (GRP_ID, GRP_NM, NMSPC_CD, GRP_DESC, KIM_TYP_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID) VALUES    (KRIM_GRP_ID_S.NEXTVAL, 'QuestionnaireAdmin', 'KC-WKFLW', 'Questionnaire Blanket Approver', 1, 'Y', SYSDATE, SYS_GUID());

    INSERT INTO KRIM_GRP_MBR_T (GRP_MBR_ID, GRP_ID, MBR_ID, MBR_TYP_CD, ACTV_FRM_DT, ACTV_TO_DT, LAST_UPDT_DT, OBJ_ID, VER_NBR) VALUES (KRIM_GRP_MBR_ID_S.NEXTVAL, KRIM_GRP_ID_S.CURRVAL, (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T T WHERE T.PRNCPL_NM = 'quickstart'), 'P', NULL, NULL, SYSDATE, SYS_GUID(), 1);

    INSERT INTO KRIM_GRP_MBR_T (GRP_MBR_ID, GRP_ID, MBR_ID, MBR_TYP_CD, ACTV_FRM_DT, ACTV_TO_DT, LAST_UPDT_DT, OBJ_ID, VER_NBR) VALUES (KRIM_GRP_MBR_ID_S.NEXTVAL, KRIM_GRP_ID_S.CURRVAL, '10000000112', 'P', NULL, NULL, SYSDATE, SYS_GUID(), 1);

   INSERT INTO KRIM_GRP_MBR_T (GRP_MBR_ID, GRP_ID, MBR_ID, MBR_TYP_CD, ACTV_FRM_DT, ACTV_TO_DT, LAST_UPDT_DT, OBJ_ID, VER_NBR) VALUES (KRIM_GRP_MBR_ID_S.NEXTVAL, '1000001', '10000000112', 'P', NULL, NULL, SYSDATE, SYS_GUID(), 1);