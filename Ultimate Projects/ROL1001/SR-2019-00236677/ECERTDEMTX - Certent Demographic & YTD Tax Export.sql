SET NOCOUNT ON;
IF OBJECT_ID('U_ECERTDEMTX_SavePath') IS NOT NULL DROP TABLE [dbo].[U_ECERTDEMTX_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_ECERTDEMTX_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'ECERTDEMTX' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwECERTDEMTX_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwECERTDEMTX_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_ECERTDEMTX') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_ECERTDEMTX];
GO
IF OBJECT_ID('U_ECERTDEMTX_File') IS NOT NULL DROP TABLE [dbo].[U_ECERTDEMTX_File];
GO
IF OBJECT_ID('U_ECERTDEMTX_EEList') IS NOT NULL DROP TABLE [dbo].[U_ECERTDEMTX_EEList];
GO
IF OBJECT_ID('U_ECERTDEMTX_AuditFields') IS NOT NULL DROP TABLE [dbo].[U_ECERTDEMTX_AuditFields];
GO
IF OBJECT_ID('U_ECERTDEMTX_Audit') IS NOT NULL DROP TABLE [dbo].[U_ECERTDEMTX_Audit];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'ECERTDEMTX';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'ECERTDEMTX';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'ECERTDEMTX';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'ECERTDEMTX';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'ECERTDEMTX';
----------------
-- Demo file
----------------
-- Header
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCreateTClockBatches,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhRespectZeroPayRate,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhThirdPartyPay) VALUES ('N','C','Y','0','',NULL,'','N','','N','','013010','EMPEXPORT','CDE','ECERTDEMTX','Certent Demographic & YTD Tax Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','3000','N','S','N','ECERTDEMTXZ0','N','Jan  1 1900 12:00AM','C','N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEquityholderCode"','1','(''UA''=''T,'')','ECERTDEMTXZ0','50','H','01','1',NULL,'Equityholder Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax ID"','2','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','2',NULL,'Tax ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"First Name"','3','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','3',NULL,'First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Middle Name"','4','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','4',NULL,'Middle Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Last Name"','5','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','5',NULL,'Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Address Line 1"','6','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','6',NULL,'Current Address Line 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Address Line 2"','7','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','7',NULL,'Current Address Line 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Address Line 3"','8','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','8',NULL,'Current Address Line 3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current District or Region"','9','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','9',NULL,'Current District or Region',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current City"','10','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','10',NULL,'Current City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current State or Province "','11','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','11',NULL,'Current State or Province',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Postal Code"','12','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','12',NULL,'Current Postal Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Country"','13','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','13',NULL,'Current Country',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work Address Line 1"','14','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','14',NULL,'Work Address Line 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work Address Line 2"','15','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','15',NULL,'Work Address Line 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work Address Line 3"','16','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','16',NULL,'Work Address Line 3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work District or Region "','17','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','17',NULL,'Work District or Region',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work City"','18','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','18',NULL,'Work City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work State or Province"','19','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','19',NULL,'Work State or Province',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work Postal Code"','20','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','20',NULL,'Work Postal Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work Country"','21','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','21',NULL,'Work Country',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Work Phone"','22','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','22',NULL,'Current Work Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Home Phone"','23','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','23',NULL,'Current Home Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Work Fax"','24','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','24',NULL,'Current Work Fax',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Email Address"','25','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','25',NULL,'Current Email Address',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Relationship to Company"','26','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','26',NULL,'Relationship to Company',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Date Relationship Started"','27','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','27',NULL,'Date Relationship Started',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Termination Date"','28','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','28',NULL,'Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Termination Type"','29','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','29',NULL,'Termination Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Currently a Blackout Insider"','30','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','30',NULL,'Currently a Blackout Insider',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Currently an Officer"','31','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','31',NULL,'Currently an Officer',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Currently a Director"','32','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','31',NULL,'Currently a Director',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Currently a Named Executive"','33','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','33',NULL,'Currently a Named Executive',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Currently more Than 10% Shareholder"','34','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','34',NULL,'Currently more Than 10% Shareholder',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Citizenship Country"','35','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','35',NULL,'Citizenship Country',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Job Title"','36','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','36',NULL,'Current Job Title',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Department"','37','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','37',NULL,'Current Department',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Section"','38','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','38',NULL,'Current Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Branch"','39','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','39',NULL,'Current Branch',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Company Code"','40','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','40',NULL,'Company Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Experience Group "','41','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','41',NULL,'Experience Group',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Date of Birth"','42','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','42',NULL,'Date of Birth',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"As of Date"','43','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','43',NULL,'As of Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Annual Salary"','44','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','44',NULL,'Annual Salary',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Retirement Eligibility Date"','45','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','45',NULL,'Retirement Eligibility Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Suspend Vest Upon Term"','46','(''DA''=''T'')','ECERTDEMTXZ0','50','H','01','46',NULL,'Suspend Vest Upon Term',NULL,NULL);
-- Detail Records
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','1','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','1',NULL,'Equityholder Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSSN"','2','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','2',NULL,'Tax ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFIrst"','3','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','3',NULL,'First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameMiddle"','4','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','4',NULL,'Middle Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','5','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','5',NULL,'Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine1"','6','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','6',NULL,'Current Address Line 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine2"','7','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','7',NULL,'Current Address Line 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','8','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','8',NULL,'Current Address Line 3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','9','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','9',NULL,'Current District or Region',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressCity"','10','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','10',NULL,'Current City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressState"','11','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','11',NULL,'Current State or Province',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressZipCode"','12','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','12',NULL,'Current Postal Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressCountry"','13','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','13',NULL,'Current Country',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvWorkAddressLine1"','14','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','14',NULL,'Work Address Line 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvWorkAddressLine2"','15','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','15',NULL,'Work Address Line 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvWorkAddressLine3"','16','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','16',NULL,'Work Address Line 3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','17','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','17',NULL,'Work District or Region',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvWorkCity"','18','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','18',NULL,'Work City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvWorkState"','19','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','19',NULL,'Work State or Province',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvWorkPostalCode"','20','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','20',NULL,'Work Postal Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvWorkCountry"','21','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','21',NULL,'Work Country',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPhoneBusinessNumber"','22','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','22',NULL,'Current Work Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','23','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','23',NULL,'Current Home Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','24','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','24',NULL,'Current Work Fax',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressEmail"','25','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','25',NULL,'Current Email Address',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','26','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','26',NULL,'Relationship to Company',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','27','(''UD101''=''T,'')','ECERTDEMTXZ0','50','D','11','27',NULL,'Date Relationship Started',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfTermination"','28','(''UD101''=''T,'')','ECERTDEMTXZ0','50','D','11','28',NULL,'Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTerminationType"','29','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','29',NULL,'Termination Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','30','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','30',NULL,'Currently a Blackout Insider',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','31','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','31',NULL,'Currently an Officer',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','32','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','32',NULL,'Currently a Director',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','33','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','33',NULL,'Currently a Named Executive',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','34','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','34',NULL,'Currently more Than 10% Shareholder',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','35','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','35',NULL,'Citizenship Country',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvJobLongDesc"','36','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','36',NULL,'Current Job Title',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCurrentDepartment"','37','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','37',NULL,'Current Department',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCurrentSection"','38','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','38',NULL,'Current Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCurrentBranch"','39','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','39',NULL,'Current Branch',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCompanyCode"','40','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','40',NULL,'Subsidiary Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','41','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','41',NULL,'Experience Group',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfBirth"','42','(''UD101''=''T,'')','ECERTDEMTXZ0','50','D','11','42',NULL,'Date of Birth',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAsOfDate"','43','(''UD101''=''T,'')','ECERTDEMTXZ0','50','D','11','43',NULL,'As of Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAnnSalary"','44','(''UNT2''=''T,'')','ECERTDEMTXZ0','50','D','11','44',NULL,'Annual Salary',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','45','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','45',NULL,'Retirement Eligibility Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','46','(''SS''=''T'')','ECERTDEMTXZ0','50','D','11','46',NULL,'Suspend Vest Upon Term',NULL,NULL);

--------------------
-- Tax File
--------------------
-- Header
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEquityholderCode"','1','(''UA''=''T,'')','ECERTDEMTXZ0','50','H','02','1',NULL,'Equityholder Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax Year "','2','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','2',NULL,'Tax Year',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD Total Compensation"','3','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','3',NULL,'YTD Total Compensation',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD TAXABLE SUPPLEMENTAL COMPENSATION "','4','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','4',NULL,'YTD TAXABLE SUPPLEMENTAL COMPENSATION',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD Social Security"','5','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','5',NULL,'YTD Social Security',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD Fica Medicare"','6','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','6',NULL,'YTD Fica Medicare',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD SDI"','7','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','7',NULL,'YTD SDI',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD SUI EE"','8','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','8',NULL,'YTD SUI EE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD FLI"','9','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','9',NULL,'YTD FLI',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD WF"','10','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','10',NULL,'YTD WF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD PFL EE"','11','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','11',NULL,'YTD PFL EE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Live In State Code"','12','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','12',NULL,'Live In State Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work In State Code"','13','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','13',NULL,'Work In State Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"First Name"','14','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','14',NULL,'First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Last Name"','15','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','15',NULL,'Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Company Code"','16','(''DA''=''T'')','ECERTDEMTXZ0','50','H','02','16',NULL,'Company Code',NULL,NULL);
-- Detail Records
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','1','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','12','1',NULL,'Equityholder Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPayDate"','2','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','12','2',NULL,'Tax Year',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDTotalComp"','3','(''UNT2''=''T,'')','ECERTDEMTXZ0','50','D','12','3',NULL,'YTD Total Compensation',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDSupComp"','4','(''UNT2''=''T,'')','ECERTDEMTXZ0','50','D','12','4',NULL,'YTD TAXABLE SUPPLEMENTAL COMPENSATION',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDSocialSecurity"','5','(''UNT2''=''T,'')','ECERTDEMTXZ0','50','D','12','5',NULL,'YTD Social Security',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDFicaMedicare"','6','(''UNT2''=''T,'')','ECERTDEMTXZ0','50','D','12','5',NULL,'YTD Fica Medicare',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDSdi"','7','(''UNT2''=''T,'')','ECERTDEMTXZ0','50','D','12','7',NULL,'YTD FLI',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDSui"','8','(''UNT2''=''T,'')','ECERTDEMTXZ0','50','D','12','8',NULL,'YTD SUI EE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDFLI"','9','(''UNT2''=''T,'')','ECERTDEMTXZ0','50','D','12','9',NULL,'YTD FLI',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDWF"','10','(''UNT2''=''T,'')','ECERTDEMTXZ0','50','D','12','10',NULL,'YTD WF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDPFLEE"','11','(''UNT2''=''T,'')','ECERTDEMTXZ0','50','D','12','11',NULL,'YTD PFL EE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressState"','12','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','12','12',NULL,'Live In State Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStateSUI"','13','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','12','13',NULL,'Work In State Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','14','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','12','14',NULL,'First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','15','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','12','15',NULL,'Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCompanyCode"','16','(''UA''=''T'')','ECERTDEMTXZ0','50','D','12','16',NULL,'Company Code',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Certent Demographic','201908299','EMPEXPORT','DEM_XOE',NULL,'ECERTDEMTX',NULL,NULL,NULL,'201908299','Aug 29 2019  8:09PM','Aug 29 2019  8:09PM','201908291',NULL,'','','201908291',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Certent Demographic Scheduled','201908299','EMPEXPORT','DEMSCHED',NULL,'ECERTDEMTX',NULL,NULL,NULL,'201908299','Aug 29 2019  8:09PM','Aug 29 2019  8:09PM','201908291',NULL,'','','201908291',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Certent Taxes','201908299','EMPEXPORT','TAX_XOE',NULL,'ECERTDEMTX',NULL,NULL,NULL,'201908299','Aug 29 2019  8:09PM','Aug 29 2019  8:09PM','201908291',NULL,'','','201908291',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECERTDEMTX','EEList','V','Y');
--INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECERTDEMTX','ExportPath','V','\\us.saas\e4\Public\ROL1001\Exports\Certent\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECERTDEMTX','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECERTDEMTX','MultFile','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECERTDEMTX','NoEmpty','V','Y');
--INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECERTDEMTX','OnDemandPath','V','\\us.saas\e4\Public\ROL1001\Exports\Certent\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECERTDEMTX','Testing','V','N');
--INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECERTDEMTX','TestPath','V','\\us.saas\e4\Public\ROL1001\Exports\Certent\');
--INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECERTDEMTX','UDESPath','C','\\us.saas\E0\data_exchange\ROL1001\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECERTDEMTX','UseFileName','V','Y');
--UPDATE dbo.U_dsi_Configuration SET CfgValue = '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\' WHERE FormatCode = 'ECERTDEMTX' AND CfgName = 'ExportPath' AND CfgValue IS NULL;
--UPDATE dbo.U_dsi_Configuration SET CfgValue = svCfgValue FROM dbo.U_ECERTDEMTX_SavePath WHERE CfgName = svCfgName AND FormatCode = svFormatCode AND svCfgValue IS NOT NULL;
IF OBJECT_ID('U_ECERTDEMTX_SavePath') IS NOT NULL DROP TABLE [dbo].[U_ECERTDEMTX_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ECERTDEMTX','H01','dbo.U_ECERTDEMTX_drvTbl_Dem_Hdr_H01',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ECERTDEMTX','H02','dbo.U_ECERTDEMTX_drvTbl_Tax_Hdr_H02',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ECERTDEMTX','D11','dbo.U_ECERTDEMTX_drvTbl_Dem_D11',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ECERTDEMTX','D12','dbo.U_ECERTDEMTX_drvTbl_Tax_D12',NULL);
IF OBJECT_ID('U_ECERTDEMTX_Audit') IS NULL
CREATE TABLE [dbo].[U_ECERTDEMTX_Audit] (
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
IF OBJECT_ID('U_ECERTDEMTX_AuditFields') IS NULL
CREATE TABLE [dbo].[U_ECERTDEMTX_AuditFields] (
    [aTableName] varchar(30) NULL,
    [aFieldName] varchar(30) NULL
);
IF OBJECT_ID('U_ECERTDEMTX_EEList') IS NULL
CREATE TABLE [dbo].[U_ECERTDEMTX_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_ECERTDEMTX_File') IS NULL
CREATE TABLE [dbo].[U_ECERTDEMTX_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(3000) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_ECERTDEMTX]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: Roller Bearing Company of America, Inc.

Created By: Wyle Cordero
Business Analyst: Catherine Kozul
Create Date: 08/29/2019
Service Request Number: SR-2019-00236677

Purpose: To provide employee demographic & YTD tax data.

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2019     SR-2019-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'ECERTDEMTX';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'ECERTDEMTX';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'ECERTDEMTX';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'ECERTDEMTX';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'ECERTDEMTX' ORDER BY RunID DESC;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'ECERTDEMTX', 'DEM_XOE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'ECERTDEMTX', 'TAX_XOE';


EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'ECERTDEMTX', @AllObjects = 'Y', @IsWeb = 'Y'
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
    SELECT @FormatCode = 'ECERTDEMTX';

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
    DELETE FROM dbo.U_ECERTDEMTX_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_ECERTDEMTX_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

	-- Only allow terms within the last 120 days keyed.
	DELETE EEList 
	FROM dbo.U_ECERTDEMTX_EEList EEList 
	INNER JOIN dbo.EmpComp
	    ON xCoID = EecCoID
		AND xEEID = EecEEID
		AND EecEmplStatus = 'T'
	    AND EecDateOfTermination < DATEADD(DAY, -120, @EndDate)

	-- Only include employees where EepUDField14 IN ('STOCK', 'STOCK2')
	DELETE El
	FROM dbo.U_ECERTDEMTX_EEList El
	INNER JOIN dbo.EmpPers 
		ON EepEEID = xEEID
	    AND ISNULL(EepUDField14, '') NOT IN ('STOCK', 'STOCK2')
	;

    -----------------------------
    -- Working Table - PEarHist
    -----------------------------
    IF OBJECT_ID('U_ECERTDEMTX_PEarHist','U') IS NOT NULL
        DROP TABLE dbo.U_ECERTDEMTX_PEarHist;
    SELECT DISTINCT
         PehEEID
        ,PrgPayDate = MAX(PrgPayDate)
        -- YTD
        ,PehCurAmtSuppYTD = SUM(CASE WHEN ErnIsSuppWages = 'Y' AND ErnEarnCode IN ('STOCK', 'BONUS') THEN PehCurAmt ELSE 0.00 END)
    INTO dbo.U_ECERTDEMTX_PEarHist
    FROM dbo.PayReg WITH (NOLOCK)
    JOIN dbo.PEarHist WITH (NOLOCK)
        ON PehGenNumber = PrgGenNumber
	INNER JOIN dbo.EarnCode WITH (NOLOCK)
	    ON PehEarnCode = ErnEarnCode
    WHERE (@ExportCode LIKE '%TAX%'
		OR (NULLIF(@ExportCode, '') IS NOT NULL -- For payroll automation
			AND @ExportCode NOT LIKE '%DEM%'))
    AND LEFT(PehPerControl,4) = LEFT(@EndPerControl,4)
    AND PehPerControl <= @EndPerControl
    GROUP BY PehEEID
    HAVING SUM(PehCurAmt) <> 0.00;

	-----------------------------
	-- Working Table - PTaxHist
	-----------------------------
	IF OBJECT_ID('U_ECERTDEMTX_PTaxHist','U') IS NOT NULL
		DROP TABLE dbo.U_ECERTDEMTX_PTaxHist;
	SELECT DISTINCT
		PthEEID
		,PthPayDate = MAX(PthPayDate)
		,PthStateCode = MAX(CASE WHEN PthTypeOfTax IN ('SUI', 'SDI') THEN LEFT(PthTaxCode, 2) END)
		-- YTD
		,PthCurTaxableWagesUSFITYTD = SUM(CASE WHEN PthTaxCode = 'USMEDEE' THEN PthCurTaxableWages ELSE 0.00 END)
		,PthCurTaxableWagesUSSOCEEYTD = SUM(CASE WHEN PthTaxCode = 'USSOCEE' AND Pthisemployertax = 'N' THEN PthCurtaxAmt ELSE 0.00 END)
        ,PthCurTaxableWagesUSMEDEEYTD = SUM(CASE WHEN PthTaxCode = 'USMEDEE' AND Pthisemployertax = 'N' THEN PthCurtaxAmt ELSE 0.00 END)
		,PthCurTaxAmtSDIYTD = SUM(CASE WHEN PthTypeOfTax = 'SDI' AND Pthisemployertax = 'N' AND (PthTaxCode NOT LIKE '%FLI%' AND PthTaxCode NOT LIKE '%PFLEE%') THEN PthCurtaxAmt ELSE 0.00 END)
        ,PthCurTaxAmtSUIYTD = SUM(CASE WHEN PthTypeOfTax = 'SUI' AND Pthisemployertax = 'N' AND PthTaxCode NOT LIKE '%WF%' THEN PthCurtaxAmt ELSE 0.00 END)
		,PthCurTaxAmtFLIYTD = SUM(CASE WHEN PthTypeOfTax = 'SDI' AND PthTaxCode LIKE '%FLI%' AND Pthisemployertax = 'N' THEN PthCurtaxAmt ELSE 0.00 END)
		,PthCurTaxAmtWFYTD = SUM(CASE WHEN PthTypeOfTax = 'SUI' AND PthTaxCode LIKE '%WF%' AND Pthisemployertax = 'N' THEN PthCurtaxAmt ELSE 0.00 END)
		,PthCurTaxAmtPFLEEYTD = SUM(CASE WHEN PthTypeOfTax = 'SDI' AND PthTaxCode LIKE '%PFLEE%' AND Pthisemployertax = 'N' THEN PthCurtaxAmt ELSE 0.00 END)
	INTO dbo.U_ECERTDEMTX_PTaxHist
	FROM dbo.PayReg WITH (NOLOCK)
	JOIN dbo.PTaxHist WITH (NOLOCK)
	    ON PthGenNumber = PrgGenNumber
    WHERE (@ExportCode LIKE '%TAX%'
		OR (NULLIF(@ExportCode, '') IS NOT NULL -- For payroll automation
			AND @ExportCode NOT LIKE '%DEM%'))
    AND LEFT(PthPerControl,4) = LEFT(@EndPerControl,4)
    AND PthPerControl <= @EndPerControl
    GROUP BY PthEEID
    HAVING SUM(PthCurGrossWages) <> 0.00;

    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_ECERTDEMTX_drvTbl_Dem_D11
    ---------------------------------
    IF OBJECT_ID('U_ECERTDEMTX_drvTbl_Dem_D11','U') IS NOT NULL
        DROP TABLE dbo.U_ECERTDEMTX_drvTbl_Dem_D11;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvEmpNo = EecEmpNo
        ,drvSSN = eepSSN
        ,drvNameFIrst = REPLACE(EepNameFirst, ',', '')
        ,drvNameMiddle = LEFT(EepNameMiddle,1)
        ,drvNameLast = EepNameLast
        ,drvAddressLine1 = REPLACE(EepAddressLine1, ',', '')
        ,drvAddressLine2 = REPLACE(EepAddressLine2, ',', '')
        ,drvAddressCity = REPLACE(EepAddressCity, ',', '')
        ,drvAddressState = EepAddressState
        ,drvAddressZipCode = EepAddressZipCode
        ,drvAddressCountry = CASE WHEN EepAddressCountry = 'UKN' THEN 'USA' ELSE EepAddressCountry END
		,drvWorkAddressLine1 = REPLACE(LocAddressLine1, ',', '')
		,drvWorkAddressLine2 = REPLACE(LocAddressLine2, ',', '')
		,drvWorkAddressLine3 = REPLACE(LocAddressLine3, ',', '')
		,drvWorkCity = REPLACE(LocAddressCity, ',', '')
		,drvWorkState = LocAddressState
		,drvWorkPostalCode = LocAddressZipCode
		,drvWorkCountry = CASE WHEN LocAddressCountry = 'UKN' THEN 'USA' ELSE LocAddressCountry END
        ,drvPhoneBusinessNumber = EecPhoneBusinessNumber
        ,drvAddressEmail = REPLACE(EepAddressEMail, ',', '')
        ,drvDateOfLastHire = EecDateOfLastHire
        ,drvDateOfTermination = CASE WHEN EecEmplStatus = 'T' THEN EecDateOfTermination END
        ,drvTerminationType = CASE WHEN EecEmplStatus = 'T' THEN REPLACE(TchDesc, ',', '') END
        ,drvJobLongDesc = REPLACE(JbcLongDesc, ',', '')
        ,drvCurrentDepartment = REPLACE(Org3.OrgDesc, ',', '')
		,drvCurrentSection = REPLACE(Org1.OrgDesc, ',', '')
		,drvCurrentBranch = REPLACE(Org2.OrgDesc, ',', '')
		,drvCompanyCode = CmpCompanyCode
        ,drvDateOfBirth = EepDateOfBirth
        ,drvAsOfDate = GETDATE()
		,drvAnnSalary = EecAnnSalary
    INTO dbo.U_ECERTDEMTX_drvTbl_Dem_D11
    FROM dbo.U_ECERTDEMTX_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    JOIN dbo.JobCode WITH (NOLOCK)
        ON JbcJobCode = EecJobCode
	INNER JOIN dbo.[Location] WITH (NOLOCK)
		ON EecLocation = LocCode
	INNER JOIN dbo.Company WITH (NOLOCK)
		ON CmpCoID = xCoID
	LEFT JOIN dbo.OrgLevel Org3 WITH (NOLOCK)
	    ON EecOrgLvl3 = Org3.OrgCode
		AND Org3.OrgLvl = 3
	LEFT JOIN dbo.OrgLevel Org1 WITH (NOLOCK)
	    ON EecOrgLvl1 = Org1.OrgCode
		AND Org1.OrgLvl = 1
	LEFT JOIN dbo.OrgLevel Org2 WITH (NOLOCK)
	    ON EecOrgLvl2 = Org2.OrgCode
		AND Org2.OrgLvl = 2
	LEFT JOIN dbo.TrmReasn WITH (NOLOCK)
		ON TchCode = EecTermReason
    WHERE @ExportCode LIKE '%DEM%'
    ;

    ---------------------------------
    -- HEADER RECORD
    ---------------------------------
    IF OBJECT_ID('U_ECERTDEMTX_drvTbl_Dem_Hdr_H01','U') IS NOT NULL
        DROP TABLE dbo.U_ECERTDEMTX_drvTbl_Dem_Hdr_H01;
    SELECT DISTINCT
         drvEquityholderCode = 'Equityholder Code'
    INTO dbo.U_ECERTDEMTX_drvTbl_Dem_Hdr_H01
    FROM dbo.U_ECERTDEMTX_EEList WITH (NOLOCK)
    WHERE @ExportCode LIKE '%DEM%'
    ;

    ---------------------------------
    -- DETAIL RECORD - U_ECERTDEMTX_drvTbl_Tax_D12
    ---------------------------------
    IF OBJECT_ID('U_ECERTDEMTX_drvTbl_Tax_D12','U') IS NOT NULL
        DROP TABLE dbo.U_ECERTDEMTX_drvTbl_Tax_D12;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvEmpNo = EecEmpNo
        ,drvPayDate = YEAR(PrgPayDate)
        ,drvYTDTotalComp = PthCurTaxableWagesUSFITYTD
        ,drvYTDSupComp = PehCurAmtSuppYTD
        ,drvYTDSocialSecurity = PthCurTaxableWagesUSSOCEEYTD
        ,drvYTDFicaMedicare = PthCurTaxableWagesUSMEDEEYTD
        ,drvYTDSdi = PthCurTaxAmtSDIYTD
        ,drvYTDSui = PthCurTaxAmtSUIYTD
		,drvYTDFLI = PthCurTaxAmtFLIYTD
		,drvYTDWF = PthCurTaxAmtWFYTD
		,drvYTDPFLEE = PthCurTaxAmtPFLEEYTD
        ,drvAddressState = EepAddressState
		,drvStateSUI = LEFT(RTRIM(LTRIM(EecStateSUI)), 2)
		,drvNameFirst = REPLACE(EepNameFirst, ',', '')
		,drvNameLast = REPLACE(EepNameLast, ',', '')
		,drvCompanyCode = CmpCompanyCode
    INTO dbo.U_ECERTDEMTX_drvTbl_Tax_D12
    FROM dbo.U_ECERTDEMTX_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
	INNER JOIN dbo.Company WITH (NOLOCK)
		ON CmpCoID = xCoID
	INNER JOIN dbo.U_ECERTDEMTX_PEarHist WITH (NOLOCK)
	    ON xEEID = PehEEID
	INNER JOIN dbo.U_ECERTDEMTX_PTaxHist WITH (NOLOCK)
	    ON xEEID = PthEEID
	INNER JOIN dbo.EmpPers WITH (NOLOCK)
		ON EepEEID = xEEID
    WHERE (@ExportCode LIKE '%TAX%'
		OR (NULLIF(@ExportCode, '') IS NOT NULL -- For payroll automation
			AND @ExportCode NOT LIKE '%DEM%'));

    ---------------------------------
    -- HEADER RECORD
    ---------------------------------
    IF OBJECT_ID('U_ECERTDEMTX_drvTbl_Tax_Hdr_H02','U') IS NOT NULL
        DROP TABLE dbo.U_ECERTDEMTX_drvTbl_Tax_Hdr_H02;
    SELECT DISTINCT
         drvEquityholderCode = 'Equityholder Code'
    INTO dbo.U_ECERTDEMTX_drvTbl_Tax_Hdr_H02
    FROM dbo.U_ECERTDEMTX_EEList WITH (NOLOCK)
    WHERE (@ExportCode LIKE '%TAX%'
		OR (NULLIF(@ExportCode, '') IS NOT NULL -- For payroll automation
			AND @ExportCode NOT LIKE '%DEM%'));


END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwECERTDEMTX_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_ECERTDEMTX_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'ECERTDEMTX%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202006301'
       ,expStartPerControl     = '202006301'
       ,expLastEndPerControl   = '202006309'
       ,expEndPerControl       = '202006309'
WHERE expFormatCode = 'ECERTDEMTX';

**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwECERTDEMTX_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_ECERTDEMTX_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort
