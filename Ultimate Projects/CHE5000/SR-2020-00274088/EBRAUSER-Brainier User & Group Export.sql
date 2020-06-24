SET NOCOUNT ON;
IF OBJECT_ID('U_EBRAUSER_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EBRAUSER_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EBRAUSER_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EBRAUSER' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEBRAUSER_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEBRAUSER_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EBRAUSER') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EBRAUSER];
GO
IF OBJECT_ID('U_EBRAUSER_File') IS NOT NULL DROP TABLE [dbo].[U_EBRAUSER_File];
GO
IF OBJECT_ID('U_EBRAUSER_EEList') IS NOT NULL DROP TABLE [dbo].[U_EBRAUSER_EEList];
GO
IF OBJECT_ID('U_EBRAUSER_DrvTbl_D11') IS NOT NULL DROP TABLE [dbo].[U_EBRAUSER_DrvTbl_D11];
GO
IF OBJECT_ID('U_EBRAUSER_Supervisor') IS NOT NULL DROP TABLE [dbo].[U_EBRAUSER_Supervisor];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EBRAUSER';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EBRAUSER';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EBRAUSER';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EBRAUSER';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EBRAUSER';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCreateTClockBatches,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhRespectZeroPayRate,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhThirdPartyPay) VALUES ('N','C','Y','0','',NULL,'','N','','N','','013010','EMPEXPORT','CDE','EBRAUSER','Brainier User & Group Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','2000','N','S','N','EBRAUSER00Z0','N','Jan  1 1900 12:00AM','C','N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"username"','1','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','1',NULL,'username',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"firstName"','2','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','2',NULL,'firstName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"mi"','3','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','3',NULL,'mi',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"lastName"','4','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','4',NULL,'lastName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"email"','5','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','5',NULL,'email',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"phone"','6','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','6',NULL,'phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"jobTitle"','7','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','7',NULL,'jobTitle',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"expiresOn"','8','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','8',NULL,'expiresOn',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"active"','9','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','9',NULL,'active',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"gmtOffset"','10','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','10',NULL,'gmtOffset',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"primaryGroupCode"','11','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','11',NULL,'primaryGroupCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"primaryGroupRoleCode"','12','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','12',NULL,'primaryGroupRoleCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"optGroupCode1"','13','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','13',NULL,'optGroupCode1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"optGroupRoleCode1"','14','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','14',NULL,'optGroupRoleCode1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"optGroupCode2"','15','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','15',NULL,'optGroupCode2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"optGroupRoleCode2"','16','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','16',NULL,'optGroupRoleCode2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"optGroupCode3"','17','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','17',NULL,'optGroupCode3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"optGroupRoleCode3"','18','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','18',NULL,'optGroupRoleCode3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"optGroupCode4"','19','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','19',NULL,'optGroupCode4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"optGroupRoleCode4"','20','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','20',NULL,'optGroupRoleCode4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Employee Number"','21','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','21',NULL,'Employee Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Job Family    "','22','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','22',NULL,'Job Family',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Department"','23','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','23',NULL,'Department',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Role"','24','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','24',NULL,'Role',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Supervisor Name"','25','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','25',NULL,'Supervisor Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Hire Date"','26','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','26',NULL,'Hire Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Preferred name"','27','(''DA''=''Q,'')','EBRAUSER00Z0','50','H','01','27',NULL,'Preferred name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Adjusted Hire Date"','28','(''DA''=''Q'')','EBRAUSER00Z0','50','H','01','28',NULL,'Adjusted Hire Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvUserName"','1','(''UA''=''Q,'')','EBRAUSER00Z0','50','D','11','1',NULL,'username',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','2','(''UA''=''Q,'')','EBRAUSER00Z0','50','D','11','2',NULL,'firstName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameMiddle"','3','(''UA''=''Q,'')','EBRAUSER00Z0','50','D','11','3',NULL,'mi',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','4','(''UA''=''Q,'')','EBRAUSER00Z0','50','D','11','4',NULL,'lastName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressEmail"','5','(''UA''=''Q,'')','EBRAUSER00Z0','50','D','11','5',NULL,'email',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','6','(''SS''=''Q,'')','EBRAUSER00Z0','50','D','11','6',NULL,'phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvJobTitle"','7','(''UA''=''Q,'')','EBRAUSER00Z0','50','D','11','7',NULL,'jobTitle',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','8','(''SS''=''Q,'')','EBRAUSER00Z0','50','D','11','8',NULL,'expiresOn',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmplStatus"','9','(''UA''=''Q,'')','EBRAUSER00Z0','50','D','11','9',NULL,'active',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGmtOffSet"','10','(''UA''=''Q,'')','EBRAUSER00Z0','50','D','11','10',NULL,'gmtOffset',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocation"','11','(''UA''=''Q,'')','EBRAUSER00Z0','50','D','11','11',NULL,'primaryGroupCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"USR"','12','(''DA''=''Q,'')','EBRAUSER00Z0','50','D','11','12',NULL,'primaryGroupRoleCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvOptGroupCode1"','13','(''UA''=''Q,'')','EBRAUSER00Z0','50','D','11','13',NULL,'optGroupCode1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvOptGroupRoleCode1"','14','(''UA''=''Q,'')','EBRAUSER00Z0','50','D','11','14',NULL,'optGroupRoleCode1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvOrgLvl2"','15','(''UA''=''Q,'')','EBRAUSER00Z0','50','D','11','15',NULL,'optGroupCode2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"USR"','16','(''DA''=''Q,'')','EBRAUSER00Z0','50','D','11','16',NULL,'optGroupRoleCode2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvOrgLvl1"','17','(''UA''=''Q,'')','EBRAUSER00Z0','50','D','11','17',NULL,'optGroupCode3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"USR"','18','(''DA''=''Q,'')','EBRAUSER00Z0','50','D','11','18',NULL,'optGroupRoleCode3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvJobCode"','19','(''UA''=''Q,'')','EBRAUSER00Z0','50','D','11','19',NULL,'optGroupCode4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"USR"','20','(''DA''=''Q,'')','EBRAUSER00Z0','50','D','11','20',NULL,'optGroupRoleCode4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','21','(''UA''=''Q,'')','EBRAUSER00Z0','51','D','11','21',NULL,'Employee Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvJobFamily"','22','(''UA''=''Q,'')','EBRAUSER00Z0','52','D','11','22',NULL,'Job Family',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDepartment"','23','(''UA''=''Q,'')','EBRAUSER00Z0','53','D','11','23',NULL,'Department',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRole"','24','(''UA''=''Q,'')','EBRAUSER00Z0','54','D','11','24',NULL,'Role',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSupervisorName"','25','(''UA''=''Q,'')','EBRAUSER00Z0','55','D','11','25',NULL,'Supervisor Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfOriginalHire"','26','(''UD101''=''Q,'')','EBRAUSER00Z0','56','D','11','26',NULL,'Hire Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNamePreferred"','27','(''UA''=''Q,'')','EBRAUSER00Z0','57','D','11','27',NULL,'Preferred name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','28','(''UD101''=''Q'')','EBRAUSER00Z0','58','D','11','28',NULL,'Adjusted Hire Date',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
DECLARE @UDSERVER varchar(5) = (SELECT RTRIM(LEFT(@@SERVERNAME,PATINDEX('%[0-9]%',@@SERVERNAME)) + SUBSTRING(@@SERVERNAME,PATINDEX('%UP[0-9]%',@@SERVERNAME)+2,1)));
SELECT @UDSERVER = CASE WHEN @UDSERVER = 'EW21' THEN 'WP6' WHEN @UDSERVER = 'EW22' THEN 'WP7' ELSE @UDSERVER END;
DECLARE @UDCOCODE varchar(5) = (SELECT RTRIM(CmmCompanyCode) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\EBRAUSER_20200604.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Brainier User OnDemand','202006049','EMPEXPORT','USER_XOE',NULL,'EBRAUSER',NULL,NULL,NULL,'202006049','Jun  4 2020  1:08PM','Jun  4 2020  1:08PM','202006041',NULL,'','','202006041',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\EBRAUSER_20200604.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Brainier User Scheduled','202006049','EMPEXPORT','USERSCHED',NULL,'EBRAUSER',NULL,NULL,NULL,'202006049','Jun  4 2020  1:08PM','Jun  4 2020  1:08PM','202006041',NULL,'','','202006041',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
UPDATE dbo.AscExp SET expAscFileName = CASE WHEN LEFT(@UDENV,2) IN ('NW','EW','WP') THEN REPLACE(REPLACE(expAscFileName,'[UDENV]',@UDENV),'[UDSERVER]',@UDSERVER) ELSE '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\EBRAUSER_20200604.txt' END WHERE expFormatCode = 'EBRAUSER';
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBRAUSER','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBRAUSER','ExportPath','V',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBRAUSER','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBRAUSER','SubSort','C','drvSubSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBRAUSER','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBRAUSER','UseFileName','V','Y');
UPDATE dbo.U_dsi_Configuration SET CfgValue = CASE WHEN CfgName = 'UseFileName' THEN 'Y' ELSE NULL END WHERE FormatCode = 'EBRAUSER' AND CfgName IN ('UseFileName','ExportPath');
INSERT INTO dbo.CustomTemplates (CreationDate,Engine,EngineCode,IsActive,ModifiedDate) SELECT CreationDate = GETDATE(), Engine = AdhEngine, EngineCode = AdhFormatCode, IsActive = 1, ModifiedDate = GETDATE() FROM dbo.AscDefH WITH (NOLOCK) WHERE AdhFormatCode = 'EBRAUSER' AND NOT EXISTS(SELECT 1 FROM dbo.CustomTemplates WHERE EngineCode = AdhFormatCode);
IF OBJECT_ID('U_EBRAUSER_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EBRAUSER_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EBRAUSER','D11','dbo.U_EBRAUSER_DrvTbl_D11',NULL);
IF OBJECT_ID('U_EBRAUSER_EEList') IS NULL
CREATE TABLE [dbo].[U_EBRAUSER_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EBRAUSER_File') IS NULL
CREATE TABLE [dbo].[U_EBRAUSER_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(2000) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EBRAUSER]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: Chemtrade Logistics Inc

Created By: Wyle Cordero
Business Analyst: Josh Smith
Create Date: 06/04/2020
Service Request Number: SR-2020-00274088

Purpose: Brainier User & Group Export

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2020     SR-2020-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EBRAUSER';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EBRAUSER';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EBRAUSER';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EBRAUSER';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EBRAUSER' ORDER BY RunID DESC;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EBRAUSER', 'USER_XOE';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'EBRAUSER', @AllObjects = 'Y', @IsWeb = 'Y'
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
    SELECT @FormatCode = 'EBRAUSER';

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

    -- Cleans EE List of terms where EE active in another company (transfer), or active in more than one company
    DELETE FROM dbo.U_EBRAUSER_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_EBRAUSER_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

	-- Include Effective Date of Termination within last 30 days.
	DELETE el
	FROM dbo.U_EBRAUSER_EEList el
	INNER JOIN dbo.EmpComp
		ON EecEEID = xEEID
		AND EecCoID = xCoID
		AND EecEmplStatus = 'T'
		AND EecDateOfTermination < DATEADD(DAY, -30, @EndDate)
	;

	--========================
	-- Working Tables
	--=======================
	IF OBJECT_ID('U_EBRAUSER_Supervisor','U') IS NOT NULL
		DROP TABLE dbo.U_EBRAUSER_Supervisor;
	SELECT DISTINCT
		SupEmpEEID = eec.EecEEID
		,SupEmpCoID = eec.EecCOID
		,SupEmpNo = sup.EecEmpNo
		,SupEmpLStatus = sup.EecEmplStatus
		,SupName = CONCAT(RTRIM(LTRIM(EepNameFirst)), ',', RTRIM(LTRIM(EepNameLast)))
		,SupRowNo = ROW_NUMBER() OVER (PARTITION BY eec.EecEEID ORDER BY eec.EecEEID, eec.EecCoID, CASE WHEN sup.EecEmplStatus = 'A' THEN 1 ELSE 2 END)
	INTO dbo.U_EBRAUSER_Supervisor
	FROM dbo.EmpComp eec WITH (NOLOCK)
	INNER JOIN dbo.EmpComp sup WITH (NOLOCK)
		ON sup.EecEEID = eec.EecSupervisorID
	INNER JOIN dbo.EmpPers WITH (NOLOCK)
		ON EepEEID = sup.EecEEID
	WHERE EXISTS (SELECT 1 FROM dbo.U_EBRAUSER_EEList WHERE xEEID = eec.EecEEID)
	OPTION (FORCE ORDER);

	CREATE CLUSTERED INDEX CDX_U_EBRAUSER_Supervisor ON dbo.U_EBRAUSER_Supervisor (SupEmpEEID, SupEmpCoID, SupRowNo);

    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_EBRAUSER_DrvTbl_D11
    ---------------------------------
    IF OBJECT_ID('U_EBRAUSER_DrvTbl_D11','U') IS NOT NULL
        DROP TABLE dbo.U_EBRAUSER_DrvTbl_D11;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EepNameLast
        ,drvSubSort = EepNameFirst
        -- standard fields above and additional driver fields below
        ,drvUserName = EepAddressEMail
        ,drvNameFirst = EepNameFirst
        ,drvNameMiddle = LEFT(EepNameMiddle,1)
        ,drvNameLast = EepNameLast
        ,drvAddressEmail = EepAddressEMail
        ,drvJobTitle = JbcDesc
        ,drvEmplStatus = CASE WHEN EecEmplStatus = 'A' THEN 'Active' ELSE 'Inactive' END
        ,drvGmtOffSet = [dbo].[dsi_fnTimeZoneV2](EepAddressState, EepAddressCounty, EepAddressCity)
        ,drvLocation = EecLocation
        ,drvOptGroupCode1 = JbcJobFamily
        ,drvOptGroupRoleCode1 = CASE WHEN JbcJobFamily IN ('ADMIN1', 'ADMIN2', 'ADMIN3', 'MGR1', 'MGR2', 'MGR3', 'MGR4', 'MGR5', 'MGR6', 'SUPV1', 'SUPV2', 'SUPV3') THEN 'MGR' ELSE 'USR' END
        ,drvOrgLvl2 = EecOrgLvl2
        ,drvOrgLvl1 = EecOrgLvl1
        ,drvJobCode = EecJobCode
        ,drvEmpNo = EecEmpNo
        ,drvJobFamily = CodDesc
        ,drvDepartment = org2.OrgDesc
        ,drvRole = CASE WHEN JbcJobFamily IN ('ADMIN1', 'ADMIN2', 'ADMIN3', 'MGR1', 'MGR2', 'MGR3', 'MGR4', 'MGR5', 'MGR6', 'SUPV1', 'SUPV2', 'SUPV3') THEN 'MGR' ELSE 'USR' END
        ,drvSupervisorName = SupName
        ,drvDateOfOriginalHire = EecDateOfOriginalHire
        ,drvNamePreferred = EepNamePreferred
        ,drvDateOfLastHire = EecDateOfLastHire
    INTO dbo.U_EBRAUSER_DrvTbl_D11
    FROM dbo.U_EBRAUSER_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    JOIN dbo.JobCode WITH (NOLOCK)
        ON JbcJobCode = EecJobCode
	LEFT JOIN dbo.Codes WITH (NOLOCK)
		ON CodCode = JbcJobFamily
		AND CodTable = 'JOBFAMILY'
	LEFT JOIN dbo.U_EBRAUSER_Supervisor WITH (NOLOCK)
		ON SupEmpEEID = xEEID
		AND SupEmpCoID = xCOID
		AND SupRowNo = 1
	LEFT JOIN dbo.OrgLevel org2 WITH (NOLOCK)
		ON org2.OrgCode = EecOrgLvl2
		AND org2.OrgLvl = 2
    OPTION (FORCE ORDER);

	CREATE CLUSTERED INDEX CDX_U_EBRAUSER_DrvTbl_D11 ON dbo.U_EBRAUSER_DrvTbl_D11 (drvInitialSort, drvSubSort);

END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwEBRAUSER_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_EBRAUSER_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'EBRAUSER%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202005281'
       ,expStartPerControl     = '202005281'
       ,expLastEndPerControl   = '202006049'
       ,expEndPerControl       = '202006049'
WHERE expFormatCode = 'EBRAUSER';

**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwEBRAUSER_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_EBRAUSER_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort