SET NOCOUNT ON;
IF OBJECT_ID('U_EACTIVEDIR_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EACTIVEDIR_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EACTIVEDIR_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EACTIVEDIR' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEACTIVEDIR_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEACTIVEDIR_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EACTIVEDIR') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EACTIVEDIR];
GO
IF OBJECT_ID('U_EACTIVEDIR_Supervisors') IS NOT NULL DROP TABLE [dbo].[U_EACTIVEDIR_Supervisors];
GO
IF OBJECT_ID('U_EACTIVEDIR_File') IS NOT NULL DROP TABLE [dbo].[U_EACTIVEDIR_File];
GO
IF OBJECT_ID('U_EACTIVEDIR_EEList') IS NOT NULL DROP TABLE [dbo].[U_EACTIVEDIR_EEList];
GO
IF OBJECT_ID('U_EACTIVEDIR_drvTbl') IS NOT NULL DROP TABLE [dbo].[U_EACTIVEDIR_drvTbl];
GO
IF OBJECT_ID('U_EACTIVEDIR_AuditFields') IS NOT NULL DROP TABLE [dbo].[U_EACTIVEDIR_AuditFields];
GO
IF OBJECT_ID('U_EACTIVEDIR_Audit') IS NOT NULL DROP TABLE [dbo].[U_EACTIVEDIR_Audit];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EACTIVEDIR';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EACTIVEDIR';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EACTIVEDIR';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EACTIVEDIR';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EACTIVEDIR';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhRecordSize,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhPreProcessSQL,AdhRespectZeroPayRate,AdhCreateTClockBatches,AdhThirdPartyPay) VALUES ('N','C','Y','0','','','N','','N','','013010','EMPEXPORT','CDE','EACTIVEDIR','Active Directory Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','5000','S','N','EACTIVEDIRZ0','N','Jan  1 1900 12:00AM','C','dbo.dsi_sp_Switchbox_v2','N',NULL,'N');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('1','EACTIVEDIRZ0','50','H','01','1',NULL,'Name',NULL,NULL,'"Name"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('2','EACTIVEDIRZ0','50','H','01','2',NULL,'Last',NULL,NULL,'"Last"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('3','EACTIVEDIRZ0','50','H','01','3',NULL,'City',NULL,NULL,'"City"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('4','EACTIVEDIRZ0','50','H','01','4',NULL,'State',NULL,NULL,'"State"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('5','EACTIVEDIRZ0','50','H','01','5',NULL,'Title',NULL,NULL,'"Title"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('6','EACTIVEDIRZ0','50','H','01','6',NULL,'ZipCode',NULL,NULL,'"ZipCode"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('7','EACTIVEDIRZ0','50','H','01','7',NULL,'Address',NULL,NULL,'"Address"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('8','EACTIVEDIRZ0','50','H','01','8',NULL,'WorkPhone',NULL,NULL,'"WorkPhone"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('9','EACTIVEDIRZ0','50','H','01','9',NULL,'First',NULL,NULL,'"First"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('10','EACTIVEDIRZ0','50','H','01','10',NULL,'Department',NULL,NULL,'"Department"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('11','EACTIVEDIRZ0','50','H','01','11',NULL,'Company',NULL,NULL,'"Company"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('12','EACTIVEDIRZ0','50','H','01','12',NULL,'Userstatus',NULL,NULL,'"Userstatus"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('13','EACTIVEDIRZ0','50','H','01','13',NULL,'TermDate',NULL,NULL,'"TermDate"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('14','EACTIVEDIRZ0','50','H','01','14',NULL,'Email',NULL,NULL,'"Email"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('15','EACTIVEDIRZ0','50','H','01','15',NULL,'Manager',NULL,NULL,'"Manager"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('16','EACTIVEDIRZ0','50','H','01','16',NULL,'EmployeeID',NULL,NULL,'"EmployeeID"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('17','EACTIVEDIRZ0','50','H','01','17',NULL,'EEType',NULL,NULL,'"EEType"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('18','EACTIVEDIRZ0','50','H','01','18',NULL,'Middle',NULL,NULL,'"Middle"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('19','EACTIVEDIRZ0','50','H','01','19',NULL,'TermReason',NULL,NULL,'"TermReason"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('20','EACTIVEDIRZ0','50','H','01','20',NULL,'HrlyOrSal',NULL,NULL,'"HrlyOrSal"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('21','EACTIVEDIRZ0','50','H','01','21',NULL,'OrgLvl3',NULL,NULL,'"OrgLvl3"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('22','EACTIVEDIRZ0','50','H','01','22',NULL,'Location',NULL,NULL,'"Location"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('23','EACTIVEDIRZ0','50','H','01','23',NULL,NULL,NULL,NULL,'"SupervisorID"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('24','EACTIVEDIRZ0','50','H','01','24',NULL,NULL,NULL,NULL,'"DivisionCode"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('25','EACTIVEDIRZ0','50','H','01','25',NULL,NULL,NULL,NULL,'"DepartmentCode"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('26','EACTIVEDIRZ0','50','H','01','26',NULL,'Ulti Username',NULL,NULL,'"Ulti Username"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('27','EACTIVEDIRZ0','50','H','01','27',NULL,'EEID',NULL,NULL,'"EEID"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('28','EACTIVEDIRZ0','50','H','01','28',NULL,'Function Code',NULL,NULL,'"Function Code"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('29','EACTIVEDIRZ0','50','H','01','29',NULL,'Function',NULL,NULL,'"Function"','(''DA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('30','EACTIVEDIRZ0','50','H','01','30',NULL,'OrgLvl3 Code',NULL,NULL,'"OrgLvl3 Code"','(''DA''=''Q'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('1','EACTIVEDIRZ0','100','D','10','1',NULL,'Name',NULL,NULL,'"drvName"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('2','EACTIVEDIRZ0','100','D','10','2',NULL,'Last',NULL,NULL,'"drvLast"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('3','EACTIVEDIRZ0','100','D','10','3',NULL,'City',NULL,NULL,'"drvCity"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('4','EACTIVEDIRZ0','100','D','10','4',NULL,'State',NULL,NULL,'"drvState"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('5','EACTIVEDIRZ0','100','D','10','5',NULL,'Title',NULL,NULL,'"drvTitle"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('6','EACTIVEDIRZ0','100','D','10','6',NULL,'ZipCode',NULL,NULL,'"drvZipCode"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('7','EACTIVEDIRZ0','100','D','10','7',NULL,'Address',NULL,NULL,'"drvAddress"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('8','EACTIVEDIRZ0','100','D','10','8',NULL,'WorkPhone',NULL,NULL,'"drvWorkPhone"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('9','EACTIVEDIRZ0','100','D','10','9',NULL,'First',NULL,NULL,'"drvFirst"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('10','EACTIVEDIRZ0','100','D','10','10',NULL,'Department',NULL,NULL,'"drvDepartment"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('11','EACTIVEDIRZ0','100','D','10','11',NULL,'Company',NULL,NULL,'"drvCompany"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('12','EACTIVEDIRZ0','100','D','10','12',NULL,'Userstatus',NULL,NULL,'"drvUserstatus"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('13','EACTIVEDIRZ0','100','D','10','13',NULL,'TermDate',NULL,NULL,'"drvTermDate"','(''UD112''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('14','EACTIVEDIRZ0','100','D','10','14',NULL,'Email',NULL,NULL,'"drvEmail"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('15','EACTIVEDIRZ0','100','D','10','15',NULL,'Manager',NULL,NULL,'"drvManager"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('16','EACTIVEDIRZ0','100','D','10','16',NULL,'EmployeeID',NULL,NULL,'"drvEmployeeID"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('17','EACTIVEDIRZ0','100','D','10','17',NULL,'EEType',NULL,NULL,'"drvEEType"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('18','EACTIVEDIRZ0','100','D','10','18',NULL,'Middle',NULL,NULL,'"drvMiddle"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('19','EACTIVEDIRZ0','100','D','10','19',NULL,'TermReason',NULL,NULL,'"drvTermReason"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('20','EACTIVEDIRZ0','100','D','10','20',NULL,'HrlyOrSal',NULL,NULL,'"drvHrlyOrSal"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('21','EACTIVEDIRZ0','100','D','10','21',NULL,'OrgLvl3',NULL,NULL,'"drvOrgLvl3"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('22','EACTIVEDIRZ0','100','D','10','22',NULL,'Location',NULL,NULL,'"drvLocation"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('23','EACTIVEDIRZ0','100','D','10','23',NULL,NULL,NULL,NULL,'"drvSupervisorID"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('24','EACTIVEDIRZ0','100','D','10','24',NULL,NULL,NULL,NULL,'"drvDivisionCode"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('25','EACTIVEDIRZ0','100','D','10','25',NULL,NULL,NULL,NULL,'"drvDeptCode"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('26','EACTIVEDIRZ0','50','D','10','26',NULL,'Ulti Username',NULL,NULL,'"drvUltiUserName"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('27','EACTIVEDIRZ0','50','D','10','27',NULL,'EEID',NULL,NULL,'"drvEEID2"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('28','EACTIVEDIRZ0','50','D','10','28',NULL,'Function Code',NULL,NULL,'"drvFunctionCode"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('29','EACTIVEDIRZ0','50','D','10','29',NULL,'Function',NULL,NULL,'"drvFunction"','(''UA''=''Q,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('30','EACTIVEDIRZ0','50','D','10','30',NULL,'OrgLvl3 Code',NULL,NULL,'"drvOrgLvl3Code"','(''UA''=''Q'')');
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expCOIDList,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,'Scheduled Session','201805049','EMPEXPORT','SCHEDULED',NULL,'EACTIVEDIR',NULL,NULL,NULL,'201805049','May  4 2018  3:09PM','May  4 2018  3:09PM','201805041',NULL,'','','201805041',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL,NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expCOIDList,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,'Active Directory Export','201911129','EMPEXPORT','ONDEMAND','Nov 12 2019 12:00AM','EACTIVEDIR',NULL,NULL,NULL,'201911129','Nov 12 2019 12:00AM','Dec 30 1899 12:00AM','201910241','147','','','201910241',dbo.fn_GetTimedKey(),NULL,'ULTI_TMARZ',NULL,NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expCOIDList,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,'Test Purposes Only','201911271','EMPEXPORT','TEST','Nov 27 2019 12:00AM','EACTIVEDIR',NULL,NULL,NULL,'201911271','Nov 27 2019 12:00AM','Nov 24 2019 12:00AM','201911271','228','','','201911271',dbo.fn_GetTimedKey(),NULL,'ULTI_TMARZ',NULL,NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expCOIDList,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,'Full Active Directory','201912059','EMPEXPORT','FULLFILE','Dec  5 2019 10:37AM','EACTIVEDIR',NULL,NULL,NULL,'201912059','Dec  5 2019 12:00AM','Dec 30 1899 12:00AM','201912051','2758','','','201912051',dbo.fn_GetTimedKey(),NULL,'ULTI_TMARZ',NULL,NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EACTIVEDIR','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EACTIVEDIR','ExportPath','V','\\us.saas\E0\data_exchange\TMA1000\Active Directory\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EACTIVEDIR','InitialSort','C','drvLast');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EACTIVEDIR','OnDemandPath','V','\\us.saas\E0\data_exchange\TMA1000\Active Directory\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EACTIVEDIR','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EACTIVEDIR','TestPath','V','\\us.saas\E1\Public\TMA1000\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EACTIVEDIR','UDESPath','C','\\us.saas\E0\data_exchange\TMA1000\Active Directory\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EACTIVEDIR','UseFileName','V','N');
UPDATE dbo.U_dsi_Configuration SET CfgValue = '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\' WHERE FormatCode = 'EACTIVEDIR' AND CfgName = 'ExportPath' AND CfgValue IS NULL;
UPDATE dbo.U_dsi_Configuration SET CfgValue = svCfgValue FROM dbo.U_EACTIVEDIR_SavePath WHERE CfgName = svCfgName AND FormatCode = svFormatCode AND svCfgValue IS NOT NULL;
IF OBJECT_ID('U_EACTIVEDIR_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EACTIVEDIR_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EACTIVEDIR','H01','None',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EACTIVEDIR','D10','dbo.U_EACTIVEDIR_drvTbl',NULL);
IF OBJECT_ID('U_EACTIVEDIR_Audit') IS NULL
CREATE TABLE [dbo].[U_EACTIVEDIR_Audit] (
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
IF OBJECT_ID('U_EACTIVEDIR_AuditFields') IS NULL
CREATE TABLE [dbo].[U_EACTIVEDIR_AuditFields] (
    [aTableName] varchar(30) NULL,
    [aFieldName] varchar(30) NULL
);
IF OBJECT_ID('U_EACTIVEDIR_EEList') IS NULL
CREATE TABLE [dbo].[U_EACTIVEDIR_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EACTIVEDIR_File') IS NULL
CREATE TABLE [dbo].[U_EACTIVEDIR_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(max) NULL
);
IF OBJECT_ID('U_EACTIVEDIR_Supervisors') IS NULL
CREATE TABLE [dbo].[U_EACTIVEDIR_Supervisors] (
    [EmpEEID] char(12) NOT NULL,
    [EmpCOID] char(5) NOT NULL,
    [EmpEmpNo] char(9) NULL,
    [EmpName] varchar(202) NULL,
    [EmpStatus] char(1) NULL,
    [Supervisor] varchar(1) NOT NULL,
    [Supervisor1EEID] char(12) NULL,
    [Supervisor1EmpNo] char(9) NULL,
    [Supervisor1Status] char(1) NULL,
    [Supervisor1Name] varchar(202) NULL,
    [Supervisor2EEID] char(12) NULL,
    [Supervisor2EmpNo] char(9) NULL,
    [Supervisor2Status] char(1) NULL,
    [Supervisor2Name] varchar(202) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EACTIVEDIR]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: T. Marzetti Company

Created By: Bryan Heid
Business Analyst: Gail Yates
Create Date: 05/04/2018
Service Request Number: SR-2018-00192929

Purpose: Active Directory Export

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2018     SR-2018-000XXXXX   XXXXX
DAgyei                10/17/2019     SR-2019-00253588   Added new fields
Wyle Cordero        06/29/2020     SR-2020-00278234   Added new fields.   

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EACTIVEDIR';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EACTIVEDIR';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EACTIVEDIR';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EACTIVEDIR';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EACTIVEDIR' ORDER BY RunID DESC;

UPDATE dbo.U_dsi_Configuration set cfgvalue ='\\us.saas\E0\data_exchange\TMA1000\Active Directory\' WHERE FormatCode = 'EACTIVEDIR' AND cfgname in ('ExportPath','OnDemandPath','UDESPath'); 
UPDATE dbo.U_dsi_Configuration set cfgvalue ='\\us.saas\E1\Public\TMA1000\Exports\Active Directory\' WHERE FormatCode = 'EACTIVEDIR' AND cfgname in ('ExportPath','OnDemandPath','TestPath'); 
UPDATE dbo.U_dsi_Configuration set cfgvalue ='N' WHERE FormatCode = 'EACTIVEDIR' AND cfgname = 'Testing'; 

-- (WC 2020-00278234) Update paths in test environment:
BEGIN TRANSACTION UpdateConfig
	UPDATE config
	SET cfgValue = '\\us.saas\nz\Public\TMA1000\Exports\Active Directory\' 
	FROM dbo.U_dsi_Configuration config
	WHERE FormatCode = 'EACTIVEDIR'
	AND CfgName IN ('OnDemandPath', 'TestPath', 'ExportPath')
-- COMMIT TRANSACTION UpdateConfig

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EACTIVEDIR', 'ONDEMAND';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EACTIVEDIR', 'TEST';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EACTIVEDIR', 'SCHEDULED';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EACTIVEDIR', 'FULLFILE';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'EACTIVEDIR', @AllObjects = 'Y', @IsWeb = 'N'
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
    SELECT @FormatCode = 'EACTIVEDIR';

    -- Declare dates from Parameter file
    Update U_dsi_Parameters 
       Set StartPerControl = Convert(Char(8),DateAdd(dd,-1,getdate()),112)+'1',
            EndPerControl   = Convert(Char(8),GetDate(),112)+'9'
    Where Exportcode = 'SCHEDULED' and FormatCode = @FormatCode;

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

    -- Cleans EE List of terms where EE active in another company (transfer), or active in more than one company
    DELETE FROM dbo.U_EACTIVEDIR_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_EACTIVEDIR_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

    IF @ExportCode NOT LIKE 'FULL%'
    BEGIN

    --==========================================
    -- Audit Section
    --==========================================
    -- Get data from audit fields table. Add fields here if auditing
    IF OBJECT_ID('U_EACTIVEDIR_AuditFields','U') IS NOT NULL
        DROP TABLE dbo.U_EACTIVEDIR_AuditFields;
    CREATE TABLE dbo.U_EACTIVEDIR_AuditFields (aTableName varchar(30),aFieldName varchar(30));

    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('EmpComp','EecCOID');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('EmpComp','EecDateofTermination');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('EmpComp','EecEEType');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('EmpComp','EecEmplStatus');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('EmpComp','EecEmpno');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('EmpComp','EecHourlyorSalary');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('EmpComp','EecJobtitle');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('EmpComp','EecLocation');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('EmpComp','EecOrgLVl2');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('EmpComp','EecOrgLvl3');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('EmpComp','EecPhoneBusinessNumber');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('EmpComp','EecSupervisorID ');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('EmpPers','EepAddressEmail');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('EmpPers','EepNameFirst');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('EmpPers','EepNameLast');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('EmpPers','EepNameMiddlde');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('Location','LocAddressCity');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('Location','LocAddressLine1');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('Location','LocAddressLine2');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('Location','LocAddressState');
    INSERT INTO dbo.U_EACTIVEDIR_AuditFields VALUES ('Location','LocAddressZipcode');
    -- Create audit table based on fields defined above

    IF OBJECT_ID('U_EACTIVEDIR_Audit','U') IS NOT NULL
        DROP TABLE dbo.U_EACTIVEDIR_Audit;
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
    INTO dbo.U_EACTIVEDIR_Audit
    FROM dbo.vw_AuditData WITH (NOLOCK) 
    JOIN dbo.U_EACTIVEDIR_AuditFields WITH (NOLOCK) 
        ON audTableName = aTableName
        AND audFieldName = aFieldName
    WHERE audDateTime BETWEEN @StartDate AND @EndDate
    AND audAction <> 'DELETE';

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EACTIVEDIR_Audit ON dbo.U_EACTIVEDIR_Audit (audEEID,audKey2);

    --================
    -- Changes Only
    --================
    DELETE FROM dbo.U_EACTIVEDIR_EEList
    WHERE NOT EXISTS (SELECT 1 FROM dbo.U_EACTIVEDIR_Audit WHERE audEEID = xEEID AND audRowNo = 1);

    END; --FULL FILE CHECK



    -- WORKING TABLE - Supervisors -- DA 10/17/2019
        ---------------------------------
        IF OBJECT_ID('U_EACTIVEDIR_Supervisors','U') IS NOT NULL
            DROP TABLE dbo.U_EACTIVEDIR_Supervisors;

        WITH CTE_Supervisor (EEID, COID, EmpNo, SupervisorID, EmplStatus, JobCode, Name, Supervisor)
        AS ( -- Get All Active Employees with Level 1 and 2 Supervisor Information
            SELECT EecEEID, EecCOID, EecEmpNo, EecSupervisorID, EecEmplStatus, EecJobCode
                ,Name = RTRIM(EepNameLast) + ', '  + RTRIM(COALESCE(NULLIF(EepNamePreferred,''),EepNameFirst))
                ,Supervisor = CASE WHEN EecEEID IN (SELECT EecSupervisorID FROM dbo.EmpComp WITH (NOLOCK) WHERE EecEmplStatus <> 'T') THEN 'Y' ELSE 'N' END
            FROM dbo.EmpComp WITH (NOLOCK)
            JOIN dbo.EmpPers WITH (NOLOCK)
                ON EepEEID = EecEEID
                AND EecCOID = dbo.dsi_BDM_fn_GetCurrentCoID(EecEEID)
            WHERE EecEmplStatus <> 'T'
        )
            SELECT
             EmpEEID = E.EEID
            ,EmpCOID = E.COID
            ,EmpEmpNo = E.EmpNo
            ,EmpName = E.Name
            ,EmpStatus = E.EmplStatus
            ,Supervisor = E.Supervisor
            ,Supervisor1EEID = S1.EEID
            ,Supervisor1EmpNo = S1.EmpNo
            ,Supervisor1Status = S1.EmplStatus
            ,Supervisor1Name = S1.Name
            ,Supervisor2EEID = S2.EEID
            ,Supervisor2EmpNo = S2.EmpNo
            ,Supervisor2Status = S2.EmplStatus
            ,Supervisor2Name = S2.Name
        INTO dbo.U_EACTIVEDIR_Supervisors
        FROM dbo.U_EACTIVEDIR_EEList
        JOIN CTE_Supervisor E
            ON E.EEID = xEEID
            AND E.COID = xCOID
        LEFT JOIN CTE_Supervisor S1
            ON S1.EEID = E.SupervisorID
            AND S1.COID = dbo.dsi_BDM_fn_GetCurrentCoID(S1.EEID)
        LEFT JOIN CTE_Supervisor S2
            ON S2.EEID = S1.SupervisorID
            AND S2.COID = dbo.dsi_BDM_fn_GetCurrentCoID(S2.EEID);




    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_EACTIVEDIR_drvTbl
    ---------------------------------
    IF OBJECT_ID('U_EACTIVEDIR_drvTbl','U') IS NOT NULL
        DROP TABLE dbo.U_EACTIVEDIR_drvTbl;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        -- standard fields above and additional driver fields below
        ,drvName = ltrim(rtrim(Emp.EepNameFirst)) + 
                         CASE WHEN ISNULL(Emp.EepNameMiddle,'') <> ''
                         THEN ' '  + Substring(Emp.EepNameMiddle,1,1)
                         ELSE ''
                         END
                          + ' ' + ltrim(rtrim(Emp.EepnameLast)) +  
                         CASE WHEN ISNULL(Emp.EepNameSuffix,'') NOT IN ('','Z')
                         THEN ' '  + Emp.EepNameSuffix
                         ELSE ''
                         END
        ,drvLast = ltrim(rtrim(Emp.EepnameLast))
        ,drvCity = LocAddressCity
        ,drvState = LocAddressState
        ,drvTitle = JbcLongDesc -- (WC 2020-00278234)
        ,drvZipCode = Substring(LocAddressZipcode,1,5)
        ,drvAddress = ltrim(rtrim(LocAddressLine1)) + 
                         CASE WHEN ISNULL(LocAddressLine2,'') <> ''
                         THEN ' '  + ltrim(rtrim(LocAddressLine2))
                         ELSE ''
                         END
        ,drvWorkPhone = CASE WHEN ltrim(rtrim(ISNULL(EecPhoneBusinessNumber,''))) <> '' 
                             THEN FORMAT(CAST(EecPhoneBusinessNumber AS DECIMAL(25,0)), '###-###-####') 
                        ELSE ''  END 
        ,drvFirst = ltrim(rtrim(Emp.EepNameFirst))
        ,drvDepartment = O2.OrgDesc
        ,drvCompany = CmpCompanyName
        ,drvUserstatus = EecEmplstatus
        ,drvTermDate = CASE WHEN EecEmplStatus = 'T' THEN EecDateLastWorked END
        ,drvEmail = Emp.EepAddressEMail
        ,drvManager = CASE WHEN ISNULL(EecSupervisorID,'') <> '' THEN
                         ltrim(rtrim(super.EepNameFirst)) + 
                         CASE WHEN ISNULL(super.EepNameMiddle,'') <> ''
                         THEN ' '  + Substring(super.EepNameMiddle,1,1)
                         ELSE ''
                         END
                          + ' ' + ltrim(rtrim(super.EepnameLast)) +  
                         CASE WHEN ISNULL(super.EepNameSuffix,'') <> ''
                         THEN ' '  + super.EepNameSuffix
                         ELSE ''
                         END
                      ELSE ''
                      END
        ,drvEmployeeID = EecEmpNo
        ,drvEEType = EecEEType
        ,drvMiddle = Substring(Emp.EepNameMiddle,1,1)
        ,drvTermReason = CASE WHEN EecEmplStatus = 'T' AND EecTermReason = 'TRO' THEN 'Transfer' ELSE '' END
        ,drvHrlyOrSal = EecSalaryOrHourly
        ,drvOrgLvl3 = O3.OrgDesc
        ,drvLocation = LocDesc
        --DA 10/17/2019 added new fields
        ,drvSupervisorID = Supervisor1EmpNo 
        ,drvDivisionCode = eecorglvl1
        ,drvDeptCode =eecorglvl2
        --,drvPreferredName = Emp.EepNamePreferred -- (WC 2020-00278234)
		-- (WC 2020-00278234) added new fields:
		,drvUltiUserName = SusUserName
		,drvEEID2 = xEEID
		,drvFunctionCode = EecOrgLvl4
		,drvFunction = org4.OrgDesc
		,drvOrgLvl3Code = EecOrgLvl3
    INTO dbo.U_EACTIVEDIR_drvTbl
    FROM dbo.U_EACTIVEDIR_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.Company WITH (NOLOCK)
        ON CmpCoID = xCoID
    JOIN dbo.EmpPers Emp WITH (NOLOCK)
        ON EepEEID = xEEID
    JOIN dbo.Location WITH (NOLOCK)  
        ON LocCode = EecLocation
	INNER JOIN dbo.JobCode WITH (NOLOCK)
		ON JbcJobCode = EecJobCode
    LEFT JOIN dbo.EmpPers super WITH (NOLOCK)
    ON super.eepEEID = EecSupervisorID
    LEFT JOIN dbo.OrgLevel O2 WITH (NOLOCK)
    ON O2.OrgCode = EecOrgLvl2    AND O2.OrgLvl = '2'
    LEFT JOIN dbo.OrgLevel O3 WITH (NOLOCK)
    ON O3.OrgCode = EecOrgLvl3    AND O3.OrgLvl = '3'
	LEFT JOIN dbo.OrgLevel org4 WITH (NOLOCK)
		ON org4.OrgCode = EecOrgLvl4 
		AND org4.OrgLvl = 4
	LEFT JOIN vw_rbsUserFinder WITH (NOLOCK)
		ON SucEEID = xEEID
    LEFT JOIN dbo.U_EACTIVEDIR_Supervisors on empeeid = xeeid and empcoid = xcoid
    WHERE EecEmplStatus <> 'T' OR (@ExportCode NOT LIKE 'FULL%' AND EecEmplStatus= 'T' AND EecTermReason <> 'TRO')

    --==========================================
    -- Set FileName
    --==========================================
    IF (dbo.dsi_fnVariable(@FormatCode,'UseFileName') = 'N')
    BEGIN
        UPDATE dbo.U_dsi_Parameters
            SET ExportFile = CASE WHEN dbo.dsi_fnVariable(@FormatCode,'Testing') = 'Y' THEN 'ActiveDirectory_TEST_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.csv'
                                  WHEN @ExportCode LIKE '%TEST%' THEN 'ActiveDirectory_TEST_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.csv'
                                  ELSE 'ActiveDirectory_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.csv'
                             END
        WHERE FormatCode = @FormatCode;
    END

END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwEACTIVEDIR_Export AS
    SELECT TOP 20000000 Data
    FROM dbo.U_EACTIVEDIR_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'EACTIVEDIR%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '201804271'
       ,expStartPerControl     = '201804271'
       ,expLastEndPerControl   = '201805049'
       ,expEndPerControl       = '201805049'
WHERE expFormatCode = 'EACTIVEDIR';

**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwEACTIVEDIR_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_EACTIVEDIR_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort