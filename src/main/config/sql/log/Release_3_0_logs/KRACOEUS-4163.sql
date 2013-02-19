set define off;
delete from SPONSOR_FORM_TEMPLATES where SPONSOR_CODE = '000340' and PACKAGE_NUMBER = 5 and PAGE_NUMBER = 14;
Insert into SPONSOR_FORM_TEMPLATES (SPONSOR_CODE,PACKAGE_NUMBER,PAGE_NUMBER,PAGE_DESCRIPTION,FILE_NAME,CONTENT_TYPE,FORM_TEMPLATE,UPDATE_TIMESTAMP,UPDATE_USER) values ('000340',5,14,'Checklist','Checklist.xslt','text/xml',EMPTY_CLOB(),sysdate,user);
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := '<?xml version="1.0" encoding="UTF-8"?>
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := '-family="ZapfDingbats" font-size="10pt " width="19px">	
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := '2pt" display-align="center">
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := 'ow>
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := 'ock>
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := '-each select="nihInventions">
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := 'dgetSummary/BudgetPeriod/ProgramIncomeDetails/AnticipatedAmount ) = 0">
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := '
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := 'ummary">
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := 'elect="format-number(number(substring(string(string(.)), 6, 2)), ''00'')"/>
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := ' display-align="center">
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := '				</fo:block>
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := 'dRelatedProject">
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := 'getPeriod">
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := 'ize="10pt ">
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := 'order="solid 1pt black" font-family="ZapfDingbats" font-size="10pt ">
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := '-align="before">
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := 'Details">
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := '																			</fo:inline>
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := 'ectCostDetails">
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := 'olid 1pt gray" padding="2pt" display-align="center">
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := '	<fo:table-cell font-family="Verdana" font-size="8pt" border="solid 1pt gray" padding="2pt" display-align="center">
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := '		<fo:table-cell font-family="Verdana" font-size="8pt" border="solid 1pt gray" padding="2pt" display-align="center">
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := 'nt-family="Verdana" font-size="8pt" number-columns-spanned="3" border="solid 1pt gray" padding="2pt" text-align="center" display-align="center">
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := '							</fo:block>
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/
DECLARE    data CLOB; buffer VARCHAR2(30000);
BEGIN
SELECT FORM_TEMPLATE INTO data FROM SPONSOR_FORM_TEMPLATES
WHERE
SPONSOR_CODE =  '000340' and PACKAGE_NUMBER=5 and PAGE_NUMBER=14  FOR UPDATE;
buffer := '						<xsl:copy-of select="$value-of-template"/>
DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);
END;
/