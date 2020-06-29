SET NOCOUNT ON;
IF OBJECT_ID('U_EALCHEMY_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EALCHEMY_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EALCHEMY_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EALCHEMY' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEALCHEMY_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEALCHEMY_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EALCHEMY') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EALCHEMY];
GO
IF OBJECT_ID('U_EALCHEMY_File') IS NOT NULL DROP TABLE [dbo].[U_EALCHEMY_File];
GO
IF OBJECT_ID('U_EALCHEMY_EEList') IS NOT NULL DROP TABLE [dbo].[U_EALCHEMY_EEList];
GO
IF OBJECT_ID('U_EALCHEMY_AuditFields') IS NOT NULL DROP TABLE [dbo].[U_EALCHEMY_AuditFields];
GO
IF OBJECT_ID('U_EALCHEMY_Audit') IS NOT NULL DROP TABLE [dbo].[U_EALCHEMY_Audit];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EALCHEMY';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EALCHEMY';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EALCHEMY';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EALCHEMY';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EALCHEMY';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhRespectZeroPayRate,AdhCreateTClockBatches,AdhThirdPartyPay) VALUES ('N','C','Y','0','','','N','','N','','013010','EMPEXPORT','CDE','EALCHEMY','Alchemy Export File','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','2000','S','N','EALCHEMY00Z0','N','Jan  1 1900 12:00AM','C','N',NULL,'N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','1','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','1',NULL,'Last Nme',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','2','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','2',NULL,'First Nme',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvUserName"','3','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','3',NULL,'username',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPassword"','4','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','4',NULL,'passwd',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressEmail"','5','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','5',NULL,'Email',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpID"','6','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','6',NULL,'EmployeeID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCompanyCode"','7','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','7',NULL,'Worksite',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvArchived"','8','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','8',NULL,'Archived',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','9','(''SS''=''T|'')','EALCHEMY00Z0','50','D','10','9',NULL,'Address 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','10','(''SS''=''T|'')','EALCHEMY00Z0','50','D','10','10',NULL,'City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','11','(''SS''=''T|'')','EALCHEMY00Z0','50','D','10','11',NULL,'State',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','12','(''SS''=''T|'')','EALCHEMY00Z0','50','D','10','12',NULL,'Zip',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','13','(''SS''=''T|'')','EALCHEMY00Z0','50','D','10','13',NULL,'Phone 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','14','(''SS''=''T|'')','EALCHEMY00Z0','50','D','10','14',NULL,'Phone 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroups"','15','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','15',NULL,'Groups',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','16','(''SS''=''T|'')','EALCHEMY00Z0','50','D','10','16',NULL,'Classes',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSSN"','17','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','17',NULL,'SSN',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','18','(''SS''=''T|'')','EALCHEMY00Z0','50','D','10','18',NULL,'Prefix',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','19','(''UD126''=''T|'')','EALCHEMY00Z0','10','D','10','19',NULL,'Date of Hire',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfTermination"','20','(''UD126''=''T|'')','EALCHEMY00Z0','10','D','10','20',NULL,'Date of Termination',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPositionTitle"','21','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','21',NULL,'Position Title',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','22','(''SS''=''T|'')','EALCHEMY00Z0','50','D','10','22',NULL,'Base Rate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','23','(''SS''=''T|'')','EALCHEMY00Z0','50','D','10','23',NULL,'dob',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTimeClockID"','24','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','24',NULL,'Badge Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvJobFamily"','25','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','25',NULL,'Job Family',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSupervisorEmpID"','26','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','26',NULL,'Supervisor EmpId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSupervisorLastName"','27','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','27',NULL,'Supervisor Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSupervisorFirstName"','28','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','28',NULL,'Supervisor First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSupervisorEmailAddress"','29','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','29',NULL,'Supervisor Email Address',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSecondSupervisorEmpID"','30','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','30',NULL,'Second Supervisor Employee ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSecondSupervisorLastName"','31','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','31',NULL,'Second Supervisor Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSecondSupervisorFirstName"','32','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','32',NULL,'Second Supervisor First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSecondSupervisorEmailAddress"','33','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','33',NULL,'Second Supervisor Email Address',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvThirdSupervisorEmpID"','34','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','34',NULL,'Third Supervisor Employee ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvThirdSupervisorLastName"','35','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','35',NULL,'Third Supervisor Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvThirdSupervisorFirstName"','36','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','36',NULL,'Third Supervisor First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvThirdSupervisorEmailAddress"','37','(''UA''=''T|'')','EALCHEMY00Z0','50','D','10','37',NULL,'Third Supervisor Email Address',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLanguage"','38','(''UA''=''T'')','EALCHEMY00Z0','50','D','10','38',NULL,'Language',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Alchemy Export','202001239','EMPEXPORT','ONDEMAND',NULL,'EALCHEMY',NULL,NULL,NULL,'202001239','Jan 23 2020  3:22PM','Jan 23 2020  3:22PM','202001231',NULL,'','','202001231',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Alchemy Export Sched1','202001239','EMPEXPORT','SCHED1',NULL,'EALCHEMY',NULL,NULL,NULL,'202001239','Jan 23 2020  3:22PM','Jan 23 2020  3:22PM','202001231',NULL,'','','202001231',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Alchemy Export Sched2','202001239','EMPEXPORT','SHCED2',NULL,'EALCHEMY',NULL,NULL,NULL,'202001239','Jan 23 2020  3:22PM','Jan 23 2020  3:22PM','202001231',NULL,'','','202001231',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EALCHEMY','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EALCHEMY','ExportPath','V','\\us.saas\EZ\Public\ROS1000\Exports_Test\Alchemy\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EALCHEMY','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EALCHEMY','OEPath','V','');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EALCHEMY','OnDemandPath','V','\\us.saas\EZ\Public\ROS1000\Exports_Test\Alchemy\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EALCHEMY','Testing','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EALCHEMY','UDESPath','C','\\us.saas\n0\data_exchange\ROS1000\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EALCHEMY','UseFileName','V','N');
UPDATE dbo.U_dsi_Configuration SET CfgValue = '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\' WHERE FormatCode = 'EALCHEMY' AND CfgName = 'ExportPath' AND CfgValue IS NULL;
UPDATE dbo.U_dsi_Configuration SET CfgValue = svCfgValue FROM dbo.U_EALCHEMY_SavePath WHERE CfgName = svCfgName AND FormatCode = svFormatCode AND svCfgValue IS NOT NULL;
IF OBJECT_ID('U_EALCHEMY_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EALCHEMY_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EALCHEMY','D10','dbo.U_EYARDIDEM_DrvTbl_D10',NULL);
IF OBJECT_ID('U_EALCHEMY_Audit') IS NULL
CREATE TABLE [dbo].[U_EALCHEMY_Audit] (
    [audEEID] varchar(255) NOT NULL,
    [audKey2] varchar(255) NOT NULL,
    [audKey3] varchar(255) NOT NULL,
    [audTableName] varchar(128) NOT NULL,
    [audFieldName] varchar(128) NOT NULL,
    [audAction] varchar(6) NOT NULL,
    [audDateTime] datetime NOT NULL,
    [audOldValue] varchar(2000) NULL,
    [audNewValue] varchar(2000) NULL,
    [audRowNo] bigint NULL
);
IF OBJECT_ID('U_EALCHEMY_AuditFields') IS NULL
CREATE TABLE [dbo].[U_EALCHEMY_AuditFields] (
    [aTableName] varchar(30) NULL,
    [aFieldName] varchar(30) NULL
);
IF OBJECT_ID('U_EALCHEMY_EEList') IS NULL
CREATE TABLE [dbo].[U_EALCHEMY_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EALCHEMY_File') IS NULL
CREATE TABLE [dbo].[U_EALCHEMY_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(2000) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EALCHEMY]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: Rosen's Diversified Inc

Created By: Wyle Cordero
Business Analyst: Jackie Finn
Create Date: 01/23/2020
Service Request Number: SR-2019-00252463

Purpose: Alchemy Export File 

Revision History
----------------
Update By           Date           Request Num        Desc
Wyle Cordero        01/23/2020     SR-2019-00252463   Most of the layout changed, the orinal code was outdated. Created a new ripout.
Wyle Cordero        06/29/2020     SR-2020-00281164   Deploying latest updates to production. Updating field 15. 

-- ----------------
-- Updated by:            Date:            CP:                Description:
-- David Dellinger        4/2/2010        CS-2009-21879    Modfiy date formate and add loction to employee number
-- Jim Sibley           08/16/2010        CS-2010-33805    Updated DEEID, DWorkSite, DDOH columns.
-- Matt Goli (RDI)        6/7//2011        N/A                Added OKAPF Location Code Change
-- Matt Goli (RDI)        6/7//2011        N/A                Added WIDEN Location Code Change
-- Sean Hawkins            4/24/2013                        Updated BCP and path for move to SAAS
-- Sean Hawkins            5/2/2013                        Updated BCP for correct path settings, needed double quote in v_path variable
-- Sean Hawkins            03/31/2017        SR-2017-151803    Updated to add job code in field 15 and timeclockID for field 24

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EALCHEMY';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EALCHEMY';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EALCHEMY';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EALCHEMY';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EALCHEMY' ORDER BY RunID DESC;

Job Ownership Scripts
---------------------
-- Set job owner to ssis_user for Production jobs
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 0;

-- Set job owner to self, to make changes in SQL Job Scheduler. Remember to re-run the above script to change ownership to ssis_user when complete
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 1;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EALCHEMY', 'ONDEMAND';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'EALCHEMY', @AllObjects = 'Y', @IsWeb = 'N'
**********************************************************************************/
BEGIN

    --==========================================
    -- Declare variables
    --==========================================
    DECLARE  @FormatCode        VARCHAR(10)
            ,@ExportCode        VARCHAR(10)
            ,@StartDate         DATETIME
            ,@EndDate           DATETIME
            ,@StartPerControl   VARCHAR(9)
            ,@EndPerControl     VARCHAR(9);

    -- Set FormatCode
    SELECT @FormatCode = 'EALCHEMY';

    -- Declare dates from Parameter file
    SELECT
         @StartPerControl = StartPerControl
        ,@EndPerControl   = EndPerControl
        ,@StartDate       = LEFT(StartPerControl,8)
        ,@EndDate         = DATEADD(S,-1,DATEADD(D,1,LEFT(EndPerControl,8)))
        ,@ExportCode      = ExportCode
    FROM dbo.U_dsi_Parameters WITH (NOLOCK)
    WHERE FormatCode = @FormatCode;

    --==========================================
    -- Clean EE List 
    -- Caution: Careful of cleaning EE List if including paycheck data
    --==========================================
    
    -- Exclude companies
    DELETE el
    FROM dbo.U_EALCHEMY_EEList el
    INNER JOIN dbo.Company
        ON cmpCoID = xCoID
        AND CmpCompanyCode IN ('LIG', 'MRD', 'NOEMP', 'RDI', 'ROS', 'VAC', 'WRR')
    ;

    -- Exclude terminated employees
    DELETE el
    FROM dbo.U_EALCHEMY_EEList el
    INNER JOIN dbo.EmpComp
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
        AND EecEmplStatus = 'T'
	;

    --==========================================
    -- Audit Section
    --==========================================
    -- Get data from audit fields table. Add fields here if auditing
    IF OBJECT_ID('U_EALCHEMY_AuditFields','U') IS NOT NULL
        DROP TABLE dbo.U_EALCHEMY_AuditFields;
    CREATE TABLE dbo.U_EALCHEMY_AuditFields (aTableName varchar(30),aFieldName varchar(30));

    INSERT INTO dbo.U_EALCHEMY_AuditFields VALUES ('EmpComp','EecCoID');
    INSERT INTO dbo.U_EALCHEMY_AuditFields VALUES ('EmpComp','EecEmplStatus');
    INSERT INTO dbo.U_EALCHEMY_AuditFields VALUES ('EmpComp','EecEmpNo');
    INSERT INTO dbo.U_EALCHEMY_AuditFields VALUES ('EmpComp','EecJobCode');
    INSERT INTO dbo.U_EALCHEMY_AuditFields VALUES ('EmpComp','EecSupervisorID');
    INSERT INTO dbo.U_EALCHEMY_AuditFields VALUES ('EmpComp','EecUDField01');
    INSERT INTO dbo.U_EALCHEMY_AuditFields VALUES ('EmpComp','EecTermReason');
    INSERT INTO dbo.U_EALCHEMY_AuditFields VALUES ('EmpPers','EepAddressEmail');
    INSERT INTO dbo.U_EALCHEMY_AuditFields VALUES ('EmpPers','EepSSN');

    -- Create audit table based on fields defined above
    IF OBJECT_ID('U_EALCHEMY_Audit','U') IS NOT NULL
        DROP TABLE dbo.U_EALCHEMY_Audit;
    SELECT 
        audEEID  = audKey1Value
        ,audKey2 = audKey2Value
        ,audKey3 = audKey3Value
        ,audTableName
        ,audFieldName
        ,audAction
        ,audDateTime
        ,audOldValue
        ,audNewValue
        ,audRowNo = ROW_NUMBER() OVER (PARTITION BY audKey1Value, audKey2Value, audKey3Value, audFieldName ORDER BY audDateTime DESC)
    INTO dbo.U_EALCHEMY_Audit
    FROM dbo.vw_AuditData WITH (NOLOCK) 
    JOIN dbo.U_EALCHEMY_AuditFields WITH (NOLOCK) 
        ON audTableName = aTableName
        AND audFieldName = aFieldName
    WHERE audDateTime BETWEEN @StartDate AND @EndDate
    AND audAction <> 'DELETE';

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EALCHEMY_Audit ON dbo.U_EALCHEMY_Audit (audEEID,audKey2);

    -- Only keep the latest change.
    DELETE aud
    FROM dbo.U_EALCHEMY_Audit aud
    WHERE audRowNo <> 1;

    --================
    -- Changes Only
    --================
    DELETE FROM dbo.U_EALCHEMY_EEList
    WHERE NOT EXISTS (SELECT 1 FROM dbo.U_EALCHEMY_Audit WHERE audEEID = xEEID AND audKey2 = xCoID);

	-- Include terminations do to tranfers within the last 60 days.
	INSERT INTO dbo.U_EALCHEMY_EEList (xEEID, xCoID)
	SELECT DISTINCT
		EecEEID
		,EecCoID
	FROM dbo.EmpComp WITH (NOLOCK)
	INNER JOIN dbo.Company WITH (NOLOCK)
		ON CmpCoID = EecCoID
		AND CmpCompanyCode NOT IN ('LIG', 'MRD', 'NOEMP', 'RDI', 'ROS', 'VAC', 'WRR') 
	WHERE EecEmplStatus = 'T'
	AND EecTermReason = 'TRO'
	AND EecDateOfTermination >= DATEADD(DAY, -60, @EndDate);


    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_EYARDIDEM_DrvTbl_D10
    ---------------------------------
    IF OBJECT_ID('U_EYARDIDEM_DrvTbl_D10','U') IS NOT NULL
        DROP TABLE dbo.U_EYARDIDEM_DrvTbl_D10;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EecDateOfLastHire
        -- standard fields above and additional driver fields below
        ,drvNameLast = EepNameLast
        ,drvNameFirst = EepNameFirst
        ,drvUserName = EecEmpNo
        ,drvPassword = EepNameFirst
        ,drvAddressEmail = CASE WHEN EepAddressEMail LIKE '%@americanfoodsgroup.com' THEN EepAddressEmail END
        ,drvEmpID = EecEmpNo
        ,drvCompanyCode = CmpCompanyCode
        ,drvArchived = CASE WHEN EecEmplStatus = 'T' THEN '1' ELSE '0' END
        ,drvGroups = CONCAT(RTRIM(LTRIM(EecJobCode)), ':', RTRIM(LTRIM(EecOrgLvl3))) -- (WC 2020-00281164)
        ,drvSSN = RIGHT(RTRIM(LTRIM(eepSSN)), 4)
        ,drvDateOfLastHire = EecDateOfLastHire
        ,drvDateOfTermination = CASE WHEN EecEmplStatus = 'T' THEN EecDateOfTermination END
        ,drvPositionTitle = JbcLongDesc
        ,drvTimeClockID = EecTimeclockID
        ,drvJobFamily = JbcJobFamily 
        ,drvSupervisorEmpID = Sup1EmpNo
        ,drvSupervisorLastName = CASE WHEN NULLIF(Sup1NameSuffix, '') IS NOT NULL THEN CONCAT(Sup1NameLast, ',', Sup1NameSuffix) ELSE Sup1NameLast END
        ,drvSupervisorFirstName = CASE WHEN NULLIF(Sup1NameMiddle, '') IS NOT NULL THEN CONCAT(Sup1NameFirst, ',', RIGHT(RTRIM(LTRIM(Sup1NameMiddle)), 1)) ELSE Sup1NameFirst END 
        ,drvSupervisorEmailAddress = CASE WHEN Sup1AddressEmail LIKE '%@americanfoodsgroup.com' THEN Sup1AddressEmail END 
        ,drvSecondSupervisorEmpID = Sup2EmpNo
        ,drvSecondSupervisorLastName = CASE WHEN NULLIF(Sup2NameSuffix, '') IS NOT NULL THEN CONCAT(Sup2NameLast, ',', Sup2NameSuffix) ELSE Sup2NameLast END 
        ,drvSecondSupervisorFirstName = CASE WHEN NULLIF(Sup2NameMiddle, '') IS NOT NULL THEN CONCAT(Sup2NameFirst, ',', RIGHT(RTRIM(LTRIM(Sup2NameMiddle)), 1)) ELSE Sup2NameFirst END 
        ,drvSecondSupervisorEmailAddress = CASE WHEN Sup2AddressEmail LIKE '%@americanfoodsgroup.com' THEN Sup2AddressEmail END 
        ,drvThirdSupervisorEmpID = Sup3EmpNo
        ,drvThirdSupervisorLastName = CASE WHEN NULLIF(Sup3NameSuffix, '') IS NOT NULL THEN CONCAT(Sup3NameLast, ',', Sup3NameSuffix) ELSE Sup3NameLast END 
        ,drvThirdSupervisorFirstName = CASE WHEN NULLIF(Sup3NameMiddle, '') IS NOT NULL THEN CONCAT(Sup3NameFirst, ',', RIGHT(RTRIM(LTRIM(Sup3NameMiddle)), 1)) ELSE Sup3NameFirst END 
        ,drvThirdSupervisorEmailAddress = CASE WHEN Sup3AddressEmail LIKE '%@americanfoodsgroup.com' THEN Sup3AddressEmail END 
        ,drvLanguage = EecUDField01
    INTO dbo.U_EYARDIDEM_DrvTbl_D10
    FROM dbo.U_EALCHEMY_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.Company WITH (NOLOCK)
        ON CmpCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    JOIN dbo.JobCode WITH (NOLOCK)
        ON JbcJobCode = EecJobCode
	LEFT JOIN (    SELECT DISTINCT
					   Sup1EEID = EecEEID
	                   ,Sup1EmpNo = EecEmpNo
					   ,Sup1SupervisorID = EecSupervisorID
					   ,Sup1NameFirst = EepNameFirst
					   ,Sup1NameMiddle = EepNameMiddle
					   ,Sup1NameSuffix = EepNameSuffix
					   ,Sup1NameLast = EepNameLast
					   ,Sup1AddressEmail = EepAddressEmail
					FROM dbo.EmpComp WITH (NOLOCK)
					INNER JOIN dbo.EmpPers WITH (NOLOCK)
						ON EepEEID = EecEEID   
					WHERE EecEmplStatus = 'A'  
	          ) s1
		ON Sup1EEID = EecSupervisorID
	LEFT JOIN (    SELECT DISTINCT
					   Sup2EEID = EecEEID
	                   ,Sup2EmpNo = EecEmpNo
					   ,Sup2SupervisorID = EecSupervisorID
					   ,Sup2NameFirst = EepNameFirst
					   ,Sup2NameMiddle = EepNameMiddle
					   ,Sup2NameSuffix = EepNameSuffix
					   ,Sup2NameLast = EepNameLast
					   ,Sup2AddressEmail = EepAddressEmail
					FROM dbo.EmpComp WITH (NOLOCK)
					INNER JOIN dbo.EmpPers WITH (NOLOCK)
						ON EepEEID = EecEEID 
					WHERE EecEmplStatus = 'A'  
	          ) s2
		ON Sup2EEID = Sup1SupervisorID
	LEFT JOIN (    SELECT DISTINCT
					   Sup3EEID = EecEEID
	                   ,Sup3EmpNo = EecEmpNo
					   ,Sup3SupervisorID = EecSupervisorID
					   ,Sup3NameFirst = EepNameFirst
					   ,Sup3NameMiddle = EepNameMiddle
					   ,Sup3NameSuffix = EepNameSuffix
					   ,Sup3NameLast = EepNameLast
					   ,Sup3AddressEmail = EepAddressEmail
					FROM dbo.EmpComp WITH (NOLOCK)
					INNER JOIN dbo.EmpPers WITH (NOLOCK)
						ON EepEEID = EecEEID   
					WHERE EecEmplStatus = 'A'  
	          ) s3
		ON Sup3EEID = Sup2SupervisorID
    OPTION (FORCE ORDER);


    --==========================================
    -- Set FileName
    --==========================================
    IF (dbo.dsi_fnVariable(@FormatCode,'UseFileName') = 'N')
    BEGIN
        UPDATE dbo.U_dsi_Parameters
            SET ExportFile = 'hr' + CONVERT(VARCHAR(8),GETDATE(),112) + '.csv'
        WHERE FormatCode = @FormatCode;
    END

END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwEALCHEMY_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_EALCHEMY_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'EALCHEMY%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '201910011'
       ,expStartPerControl     = '201910011'
       ,expLastEndPerControl   = '202001239'
       ,expEndPerControl       = '202001239'
WHERE expFormatCode = 'EALCHEMY';



    --------JOB NAME: Alchemy Export File  (EALCHEMY) - Daily, 12:00AM ET--------
    --Copy and paste this in environment to create job script

    BEGIN TRANSACTION
    DECLARE @ReturnCode INT, @JobName varchar(100), @dbName varchar(50)
    SELECT @ReturnCode = 0
    SELECT @JobName = RTRIM(REPLACE(DB_NAME(),'ULTIPRO_','')) + ' - Alchemy Export File  (EALCHEMY) - Daily, 12:00AM ET'
    SELECT @dbname = RTRIM(DB_NAME())

    -- Job Params
    IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
    BEGIN
    EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

    END

    DECLARE @jobId BINARY(16)
    EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=@JobName, 
            @enabled=0,
            @notify_level_eventlog=0, 
            @notify_level_email=0, 
            @notify_level_netsend=0, 
            @notify_level_page=0, 
            @delete_level=0, 
            @description=N'No description available.', 
            @category_name=N'[Uncategorized (Local)]', 
            @job_id = @jobId OUTPUT
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

    -- Step [Run]
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

    -- Step 'Update AscExp'
    EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Update AscExp Start/End Date (EALCHEMY)', 
            @step_id=1, 
            @cmdexec_success_code=0, 
            @on_success_action=3, 
            @on_success_step_id=0, 
            @on_fail_action=2, 
            @on_fail_step_id=0, 
            @retry_attempts=0, 
            @retry_interval=0, 
            @os_run_priority=0, @subsystem=N'TSQL', 
            @command=N'DECLARE @StartPerControl char(9), 
        @EndPerControl char(9), 
        @RunDate datetime; 

    SELECT @StartPerControl = CONVERT(char(8),GETDATE()-1,112) + ''1''; 
    SELECT @EndPerControl = CONVERT(char(8),GETDATE()-1,112) + ''9''; 
    SELECT @RunDate = GETDATE(); 

UPDATE dbo.AscExp
SET    expStartPerControl = @StartPerControl,
    expLastStartPerControl = @StartPerControl,
    expEndPerControl = @EndPerControl,
    expLastEndPerControl = @EndPerControl,
    expExported = @RunDate
WHERE expFormatCode = ''EALCHEMY''
  AND expExportCode = ''SCHEDULED'';',
            @database_name=@dbName,
            @flags=0
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

    -- Step 'Run SP'
    EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Create Export File (EALCHEMY)', 
            @step_id=2, 
            @cmdexec_success_code=0, 
            @on_success_action=1, 
            @on_success_step_id=0, 
            @on_fail_action=2, 
            @on_fail_step_id=0, 
            @retry_attempts=0, 
            @retry_interval=0, 
            @os_run_priority=0, @subsystem=N'TSQL', 
            @command=N'EXEC dbo.dsi_sp_TestSwitchbox_v2 ''EALCHEMY'', ''SCHEDULED'';', 
            @database_name=@dbName, 
            @flags=0
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
    EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
    EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily, 12:00AM ET',
            @enabled=1, 
            @freq_type=4, 
            @freq_interval=1,  
            @freq_subday_type=1, 
            @freq_subday_interval=0, 
            @freq_relative_interval=0,
            @freq_recurrence_factor=1,
            @active_start_date=20200123,
            @active_end_date=99991231,
            @active_start_time=000000,
            @active_end_time=235959;
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;
    EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)';
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;
    EXEC msdb..usg_set_job_owner @job_id = @jobId, @set_owner_to_self = 0;
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;
    COMMIT TRANSACTION
    GOTO EndSave;
    QuitWithRollback:
        IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION;
    EndSave:

    GO
    --------END JOB SCRIPT--------
**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwEALCHEMY_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_EALCHEMY_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort
