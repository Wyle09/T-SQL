SET NOCOUNT ON;
IF OBJECT_ID('U_ECERTDEMTX_SavePath') IS NOT NULL DROP TABLE [dbo].[U_ECERTDEMTX_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_ECERTDEMTX_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'ECERTDEMTX' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwECERTDEMTX_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwECERTDEMTX_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_ECERTDEMTX') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_ECERTDEMTX];
GO
IF OBJECT_ID('U_ECERTDEMTX_PTaxHist') IS NOT NULL DROP TABLE [dbo].[U_ECERTDEMTX_PTaxHist];
GO
IF OBJECT_ID('U_ECERTDEMTX_MiscPTaxHist') IS NOT NULL DROP TABLE [dbo].[U_ECERTDEMTX_MiscPTaxHist];
GO
IF OBJECT_ID('U_ECERTDEMTX_PEarHist') IS NOT NULL DROP TABLE [dbo].[U_ECERTDEMTX_PEarHist];
GO
IF OBJECT_ID('U_ECERTDEMTX_File') IS NOT NULL DROP TABLE [dbo].[U_ECERTDEMTX_File];
GO
IF OBJECT_ID('U_ECERTDEMTX_EEList') IS NOT NULL DROP TABLE [dbo].[U_ECERTDEMTX_EEList];
GO
IF OBJECT_ID('U_ECERTDEMTX_DrvTbl_Tax_H02') IS NOT NULL DROP TABLE [dbo].[U_ECERTDEMTX_DrvTbl_Tax_H02];
GO
IF OBJECT_ID('U_ECERTDEMTX_DrvTbl_Tax_D12') IS NOT NULL DROP TABLE [dbo].[U_ECERTDEMTX_DrvTbl_Tax_D12];
GO
IF OBJECT_ID('U_ECERTDEMTX_DrvTbl_Demo_H01') IS NOT NULL DROP TABLE [dbo].[U_ECERTDEMTX_DrvTbl_Demo_H01];
GO
IF OBJECT_ID('U_ECERTDEMTX_DrvTbl_Demo_D11') IS NOT NULL DROP TABLE [dbo].[U_ECERTDEMTX_DrvTbl_Demo_D11];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'ECERTDEMTX';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'ECERTDEMTX';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'ECERTDEMTX';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'ECERTDEMTX';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'ECERTDEMTX';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCreateTClockBatches,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhRespectZeroPayRate,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhThirdPartyPay) VALUES ('N','C','Y','0','',NULL,'','N','','N','','013010','EMPEXPORT','CDE','ECERTDEMTX','Certent Demographic & YTD Tax Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','3000','N','S','N','ECERTDEMTXZ0','N','Jan  1 1900 12:00AM','C','N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEquityHolderCode"','1','(''UA''=''T,'')','ECERTDEMTXZ0','50','H','01','1',NULL,'Equityholder Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax ID "','2','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','2',NULL,'Tax ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"First Name "','3','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','3',NULL,'First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Middle Name "','4','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','4',NULL,'Middle Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Last Name "','5','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','5',NULL,'Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Address Line 1 "','6','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','6',NULL,'Current Address Line 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Address Line 2 "','7','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','7',NULL,'Current Address Line 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Address Line 3 "','8','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','8',NULL,'Current Address Line 3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current District or Region "','9','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','9',NULL,'Current District or Region',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current City "','10','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','10',NULL,'Current City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current State or Province "','11','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','11',NULL,'Current State or Province',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Postal Code "','12','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','12',NULL,'Current Postal Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Country "','13','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','13',NULL,'Current Country',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work Address Line1 "','14','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','14',NULL,'Work Address Line1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work Address Line2 "','15','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','15',NULL,'Work Address Line2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work Address Line3 "','16','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','16',NULL,'Work Address Line3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work District or Region "','17','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','17',NULL,'Work District or Region',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work City "','18','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','18',NULL,'Work City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work State or Province "','19','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','19',NULL,'Work State or Province',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work Postal Code "','20','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','20',NULL,'Work Postal Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work Country "','21','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','21',NULL,'Work Country',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Work Phone "','22','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','22',NULL,'Current Work Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Home Phone "','23','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','23',NULL,'Current Home Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Email Address "','24','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','24',NULL,'Current Email Address',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Date Relationship Started"','25','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','25',NULL,'Date Relationship Started',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Termination Date "','26','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','26',NULL,'Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Termination Type "','27','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','27',NULL,'Termination Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Currently a Blackout Insider "','28','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','28',NULL,'Currently a Blackout Insider',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Currently an Officer "','29','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','29',NULL,'Currently an Officer',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Currently a Director "','30','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','30',NULL,'Currently a Director',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Currently a Named Executive "','31','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','31',NULL,'Currently a Named Executive',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Currently more Than 10% Shareholder "','32','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','32',NULL,'Currently more Than 10% Shareholder',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Section 16 Insider "','33','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','33',NULL,'Section 16 Insider',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Citizenship Country "','34','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','34',NULL,'Citizenship Country',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Job Title "','35','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','35',NULL,'Current Job Title',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Department "','36','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','36',NULL,'Current Department',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Section "','37','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','37',NULL,'Current Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Current Branch "','38','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','38',NULL,'Current Branch',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Subsidiary Code "','39','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','39',NULL,'Subsidiary Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Experience Group   "','40','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','40',NULL,'Experience Group',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Date of Birth "','41','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','41',NULL,'Date of Birth',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"As of Date "','42','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','42',NULL,'As of Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Annual Salary "','43','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','43',NULL,'Annual Salary',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Retirement Eligibility Date "','44','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','01','44',NULL,'Retirement Eligibility Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Suspend Vest Upon Term "','45','(''DA''=''T'')','ECERTDEMTXZ0','50','H','01','45',NULL,'Suspend Vest Upon Term',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEquityHolderCode"','1','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','1',NULL,'Equityholder Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSSN"','2','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','2',NULL,'Tax ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','3','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','3',NULL,'First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameMiddle"','4','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','4',NULL,'Middle Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','5','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','5',NULL,'Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine1"','6','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','6',NULL,'Current Address Line 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine2"','7','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','7',NULL,'Current Address Line 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','8','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','8',NULL,'Current Address Line 3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCurrentDistrictOrRegion"','9','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','9',NULL,'Current District or Region',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressCity"','10','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','10',NULL,'Current City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressState"','11','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','11',NULL,'Current State or Province',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressZipCode"','12','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','12',NULL,'Current Postal Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressCountry"','13','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','13',NULL,'Current Country',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','14','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','14',NULL,'Work Address Line1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','15','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','15',NULL,'Work Address Line2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','16','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','16',NULL,'Work Address Line3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','17','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','17',NULL,'Work District or Region',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','18','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','18',NULL,'Work City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','19','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','19',NULL,'Work State or Province',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','20','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','20',NULL,'Work Postal Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','21','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','21',NULL,'Work Country',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPhoneBusinessNumber"','22','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','22',NULL,'Current Work Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','23','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','23',NULL,'Current Home Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressEmail"','24','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','24',NULL,'Current Email Address',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','25','(''UD101''=''T,'')','ECERTDEMTXZ0','50','D','11','25',NULL,'Date Relationship Started',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfTermination"','26','(''UD101''=''T,'')','ECERTDEMTXZ0','50','D','11','26',NULL,'Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTerminationType"','27','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','11','27',NULL,'Termination Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','28','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','28',NULL,'Currently a Blackout Insider',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','29','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','29',NULL,'Currently an Officer',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','30','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','30',NULL,'Currently a Director',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','31','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','31',NULL,'Currently a Named Executive',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','32','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','32',NULL,'Currently more Than 10% Shareholder',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','33','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','33',NULL,'Section 16 Insider',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','34','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','34',NULL,'Citizenship Country',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','35','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','35',NULL,'Current Job Title',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','36','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','36',NULL,'Current Department',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','37','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','37',NULL,'Current Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','38','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','38',NULL,'Current Branch',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','39','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','39',NULL,'Subsidiary Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','40','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','40',NULL,'Experience Group',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfBirth"','41','(''UD101''=''T,'')','ECERTDEMTXZ0','50','D','11','41',NULL,'Date of Birth',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAsOfDate"','42','(''UD101''=''T,'')','ECERTDEMTXZ0','50','D','11','42',NULL,'As of Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','43','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','43',NULL,'Annual Salary',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','44','(''SS''=''T,'')','ECERTDEMTXZ0','50','D','11','44',NULL,'Retirement Eligibility Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','45','(''SS''=''T'')','ECERTDEMTXZ0','50','D','11','45',NULL,'Suspend Vest Upon Term',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEquityHolderCode"','1','(''UA''=''T,'')','ECERTDEMTXZ0','50','H','02','1',NULL,'Equityholder Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax Year"','2','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','2',NULL,'Tax Year',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD Total Compensation  "','3','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','3',NULL,'YTD Total Compensation',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD Taxable Supplemental Compensation"','4','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','4',NULL,'YTD Taxable Supplemental Compensation',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD Social Security "','5','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','5',NULL,'YTD Social Security',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD SDI"','6','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','6',NULL,'YTD SDI',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"State Code "','7','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','7',NULL,'State Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD SUI"','8','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','8',NULL,'YTD SUI',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"State Code "','9','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','9',NULL,'State Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD FLI"','10','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','10',NULL,'YTD FLI',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"State Code "','11','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','11',NULL,'State Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD WDF"','12','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','12',NULL,'YTD WDF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"State Code "','13','(''DA''=''T,'')','ECERTDEMTXZ0','50','H','02','13',NULL,'State Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Company Code"','14','(''DA''=''T'')','ECERTDEMTXZ0','50','H','02','14',NULL,'Company Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEquityHolderCode"','1','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','12','1',NULL,'Equityholder Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTaxYear"','2','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','12','2',NULL,'Tax Year',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDTotalCompensation"','3','(''UNT2''=''T,'')','ECERTDEMTXZ0','50','D','12','3',NULL,'YTD Total Compensation',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDTaxableSupplementalCompesation"','4','(''UNT2''=''T,'')','ECERTDEMTXZ0','50','D','12','4',NULL,'YTD Taxable Supplemental Compensation',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDSocialSecurity"','5','(''UNT2''=''T,'')','ECERTDEMTXZ0','50','D','12','5',NULL,'YTD Social Security',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDSdi"','6','(''UNT2''=''T,'')','ECERTDEMTXZ0','50','D','12','6',NULL,'YTD SDI',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStateCodeSdi"','7','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','12','7',NULL,'State Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYtdSui"','8','(''UNT2''=''T,'')','ECERTDEMTXZ0','50','D','12','8',NULL,'YTD SUI',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStateCodeSui"','9','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','12','9',NULL,'State Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYtdFli"','10','(''UNT2''=''T,'')','ECERTDEMTXZ0','50','D','12','10',NULL,'YTD FLI',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStateCodeFli "','11','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','12','11',NULL,'State Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYtdWdf"','12','(''UNT2''=''T,'')','ECERTDEMTXZ0','50','D','12','12',NULL,'YTD WDF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStateCodeWdf"','13','(''UA''=''T,'')','ECERTDEMTXZ0','50','D','12','13',NULL,'State Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCompanyCode"','14','(''UA''=''T'')','ECERTDEMTXZ0','50','D','12','14',NULL,'Company Code',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
DECLARE @UDSERVER varchar(5) = (SELECT RTRIM(LEFT(@@SERVERNAME,PATINDEX('%[0-9]%',@@SERVERNAME)) + SUBSTRING(@@SERVERNAME,PATINDEX('%UP[0-9]%',@@SERVERNAME)+2,1)));
SELECT @UDSERVER = CASE WHEN @UDSERVER = 'EW21' THEN 'WP6' WHEN @UDSERVER = 'EW22' THEN 'WP7' ELSE @UDSERVER END;
DECLARE @UDCOCODE varchar(5) = (SELECT RTRIM(CmmCompanyCode) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\ECERTDEMTX_20200407.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Certent Demographic OnDemand','202004079','EMPEXPORT','DEMO_XOE',NULL,'ECERTDEMTX',NULL,NULL,NULL,'202004079','Apr  7 2020  8:40AM','Apr  7 2020  8:40AM','202004071',NULL,'','','202004071',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\ECERTDEMTX_20200407.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Certent Demographic Scheduled','202004079','EMPEXPORT','DEMOSCHED',NULL,'ECERTDEMTX',NULL,NULL,NULL,'202004079','Apr  7 2020  8:40AM','Apr  7 2020  8:40AM','202004071',NULL,'','','202004071',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\ECERTDEMTX_20200407.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Certent Taxes OnDemand','202004079','EMPEXPORT','TAX_XOE',NULL,'ECERTDEMTX',NULL,NULL,NULL,'202004079','Apr  7 2020  8:40AM','Apr  7 2020  8:40AM','202004071',NULL,'','','202004071',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\ECERTDEMTX_20200407.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Certent Taxes Scheduled','202004079','EMPEXPORT','TAXSCHED',NULL,'ECERTDEMTX',NULL,NULL,NULL,'202004079','Apr  7 2020  8:40AM','Apr  7 2020  8:40AM','202004071',NULL,'','','202004071',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
UPDATE dbo.AscExp SET expAscFileName = CASE WHEN LEFT(@UDENV,2) IN ('NW','EW','WP') THEN REPLACE(REPLACE(expAscFileName,'[UDENV]',@UDENV),'[UDSERVER]',@UDSERVER) ELSE '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\ECERTDEMTX_20200407.txt' END WHERE expFormatCode = 'ECERTDEMTX';
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECERTDEMTX','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECERTDEMTX','ExportPath','V',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECERTDEMTX','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECERTDEMTX','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECERTDEMTX','UseFileName','V','Y');
UPDATE dbo.U_dsi_Configuration SET CfgValue = CASE WHEN CfgName = 'UseFileName' THEN 'Y' ELSE NULL END WHERE FormatCode = 'ECERTDEMTX' AND CfgName IN ('UseFileName','ExportPath');
INSERT INTO dbo.CustomTemplates (CreationDate,Engine,EngineCode,IsActive,ModifiedDate) SELECT CreationDate = GETDATE(), Engine = AdhEngine, EngineCode = AdhFormatCode, IsActive = 1, ModifiedDate = GETDATE() FROM dbo.AscDefH WITH (NOLOCK) WHERE AdhFormatCode = 'ECERTDEMTX' AND NOT EXISTS(SELECT 1 FROM dbo.CustomTemplates WHERE EngineCode = AdhFormatCode);
IF OBJECT_ID('U_ECERTDEMTX_SavePath') IS NOT NULL DROP TABLE [dbo].[U_ECERTDEMTX_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ECERTDEMTX','H01','dbo.U_ECERTDEMTX_DrvTbl_Demo_H01',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ECERTDEMTX','H02','dbo.U_ECERTDEMTX_DrvTbl_Tax_H02',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ECERTDEMTX','D11','dbo.U_ECERTDEMTX_DrvTbl_Demo_D11',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ECERTDEMTX','D12','dbo.U_ECERTDEMTX_DrvTbl_Tax_D12',NULL);
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
Client Name: Surgery Center Holdings, Inc.

Created By: Wyle Cordero
Business Analyst: Jackie Finn
Create Date: 04/07/2020
Service Request Number: SR-2019-00261191

Purpose: Certent Demographic & YTD Tax Export

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2020     SR-2020-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'ECERTDEMTX';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'ECERTDEMTX';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'ECERTDEMTX';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'ECERTDEMTX';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'ECERTDEMTX' ORDER BY RunID DESC;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'ECERTDEMTX', 'DEMO_XOE';
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

	-- Include term employees within the last 90 days from the effective date.
	DELETE el
	FROM dbo.U_ECERTDEMTX_EEList el
	INNER JOIN dbo.EmpComp
		ON EecEEID = xEEID
		AND EecCoID = xCoID
		AND EecEmplStatus = 'T'
		AND EecDateOfTermination < CONVERT(DATE, DATEADD(DAY, -90, @EndDate))
	;

	-- Exclude if EecUDField14 is null.
	DELETE el
	FROM dbo.U_ECERTDEMTX_EEList el
	INNER JOIN dbo.EmpComp
		ON EecEEID = xEEID
		AND EecCoID = xCoID
		AND NULLIF(EecUDField14, '') IS NULL
	;

    -----------------------------
    -- Working Table - PEarHist
    -----------------------------
    IF OBJECT_ID('U_ECERTDEMTX_PEarHist','U') IS NOT NULL
        DROP TABLE dbo.U_ECERTDEMTX_PEarHist;
    SELECT DISTINCT
         PehEEID
        ,PehPayDate = MAX(PrgPayDate)
        ,PehCurAmtSuppWagesYTD = SUM(CASE WHEN PehIsSuppWages = 'Y' THEN PehCurAmt ELSE 0.00 END)
    INTO dbo.U_ECERTDEMTX_PEarHist
    FROM dbo.PayReg WITH (NOLOCK)
    JOIN dbo.PEarHist WITH (NOLOCK)
        ON PehGenNumber = PrgGenNumber
	WHERE EXISTS (SELECT 1 FROM dbo.U_ECERTDEMTX_EEList WITH (NOLOCK) WHERE xEEID = PehEEID)
    AND LEFT(PehPerControl,4) = LEFT(@EndPerControl,4)
    AND PehPerControl <= @EndPerControl
	AND @ExportCode LIKE '%TAX%'
    GROUP BY PehEEID
    HAVING SUM(PehCurAmt) <> 0.00
	OPTION (FORCE ORDER);

	-- Create Index
	CREATE CLUSTERED INDEX CDX_U_ECERTDEMTX_PEarHist ON dbo.U_ECERTDEMTX_PEarHist (PehEEID, PehPayDate);

	-----------------------------
	-- Working Table - PTaxHist
	-----------------------------
	IF OBJECT_ID('U_ECERTDEMTX_PTaxHist','U') IS NOT NULL
		DROP TABLE dbo.U_ECERTDEMTX_PTaxHist;
	SELECT DISTINCT
		PthEEID
		,PthPayDate = MAX(PrgPayDate)
		,PthCurGrossWagesUSFITYTD = SUM(CASE WHEN PthTaxCode = 'USFIT' THEN PthCurGrossWages ELSE 0.00 END)
		,PthCurTaxAmtUSSOCEEYTD = SUM(CASE WHEN PthTaxCode = 'USSOCEE' THEN PthCurTaxAmt ELSE 0.00 END)
	INTO dbo.U_ECERTDEMTX_PTaxHist
	FROM dbo.PayReg WITH (NOLOCK)
	JOIN dbo.PTaxHist WITH (NOLOCK)
	    ON PthGenNumber = PrgGenNumber
    WHERE EXISTS (SELECT 1 FROM dbo.U_ECERTDEMTX_EEList WITH (NOLOCK) WHERE xEEID = PthEEID)
	AND LEFT(PthPerControl,4) = LEFT(@EndPerControl,4)
    AND PthPerControl <= @EndPerControl
	AND @ExportCode LIKE '%TAX%'
    GROUP BY PthEEID
    HAVING SUM(PthCurGrossWages) <> 0.00
	OPTION (FORCE ORDER);

	-- Create Index
	CREATE CLUSTERED INDEX CDX_U_ECERTDEMTX_PTaxHist ON dbo.U_ECERTDEMTX_PTaxHist (PthEEID, PthPayDate);

	-----------------------------
	-- Working Table - PTaxHist
	-----------------------------
	IF OBJECT_ID('U_ECERTDEMTX_MiscPTaxHist','U') IS NOT NULL
		DROP TABLE dbo.U_ECERTDEMTX_MiscPTaxHist;
	SELECT DISTINCT
		MpthEEID = PthEEID
		,MpthPayDate = MAX(PrgPayDate)
		,MpthYtdSdi = SUM(CASE WHEN PthTaxCode IN ('CASDIEE', 'HISDIEE', 'NYSDIEE', 'NJSDIEE', 'NJSDIPEE') THEN PthCurTaxAmt ELSE 0.00 END)
		,MpthStateCodeSdi = MAX(CASE WHEN PthTaxCode IN ('CASDIEE', 'HISDIEE', 'NYSDIEE', 'NJSDIEE', 'NJSDIPEE') THEN LEFT(RTRIM(LTRIM(PthTaxCode)), 2) END)
		,MpthYtdSui = SUM(CASE WHEN PthTaxCode IN ('PASUIEE', 'NJSUIEE') THEN PthCurTaxAmt ELSE 0.00 END)
		,MpthStateCodeSui = MAX(CASE WHEN PthTaxCode IN ('PASUIEE', 'NJSUIEE') THEN LEFT(RTRIM(LTRIM(PthTaxCode)), 2) END)
		,MpthYtdFli = SUM(CASE WHEN PthTaxCode IN ('WAPFLEE', 'WAPMLEE', 'WAVPFLEE', 'WAVPMLEE', 'NJFLIEE', 'NYPFLEE') THEN PthCurTaxAmt ELSE 0.00 END)
		,MpthStateCodeFli = MAX(CASE WHEN PthTaxCode IN ('WAPFLEE', 'WAPMLEE', 'WAVPFLEE', 'WAVPMLEE', 'NJFLIEE', 'NYPFLEE') THEN LEFT(RTRIM(LTRIM(PthTaxCode)), 2) END)
		,MpthYtdWdf = SUM(CASE WHEN PthTaxCode = 'NJWFDEE' THEN PthCurTaxAmt ELSE 0.00 END)
		,MpthStateCodeWdf = MAX(CASE WHEN PthTaxCode = 'NJWFDEE' THEN LEFT(RTRIM(LTRIM(PthTaxCode)), 2) END)
	INTO dbo.U_ECERTDEMTX_MiscPTaxHist
	FROM dbo.PayReg WITH (NOLOCK)
	INNER JOIN dbo.PTaxHist WITH (NOLOCK)
	    ON PthGenNumber = PrgGenNumber
	WHERE EXISTS (SELECT 1 FROM dbo.U_ECERTDEMTX_EEList WITH (NOLOCK) WHERE xEEID = PthEEID)
	AND LEFT(PthPerControl,4) = LEFT(@EndPerControl,4)
    AND PthPerControl <= @EndPerControl
	AND @ExportCode LIKE '%TAX%'
	GROUP BY PthEEID, LEFT(RTRIM(LTRIM(PthTaxCode)), 2)
	HAVING SUM(
		CASE 
			WHEN PthTaxCode IN ('CASDIEE', 'HISDIEE', 'NYSDIEE', 'NJSDIEE', 'NJSDIPEE', 'PASUIEE', 'NJSUIEE', 'WAPFLEE', 'WAPMLEE', 'WAVPFLEE', 'WAVPMLEE', 'NJFLIEE', 'NYPFLEE', 'NJWFDEE') THEN PthCurtaxAmt 
			ELSE 0.00 
		END) <> 0.00
	OPTION (FORCE ORDER);

	-- Create Index
	CREATE CLUSTERED INDEX CDX_U_ECERTDEMTX_MiscPTaxHist ON dbo.U_ECERTDEMTX_MiscPTaxHist (MPthEEID, MPthPayDate);


    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_ECERTDEMTX_DrvTbl_Demo_D11
    ---------------------------------
    IF OBJECT_ID('U_ECERTDEMTX_DrvTbl_Demo_D11','U') IS NOT NULL
        DROP TABLE dbo.U_ECERTDEMTX_DrvTbl_Demo_D11;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EecUDField14
        -- standard fields above and additional driver fields below
        ,drvEquityHolderCode = EecUDField14
        ,drvSSN = eepSSN
        ,drvNameFirst = REPLACE(EepNameFirst, ',', '')
        ,drvNameMiddle = LEFT(EepNameMiddle,1)
        ,drvNameLast = REPLACE(EepNameLast, ',', '')
        ,drvAddressLine1 = REPLACE(EepAddressLine1, ',', '')
        ,drvAddressLine2 = REPLACE(EepAddressLine2, ',', '')
        ,drvCurrentDistrictOrRegion = REPLACE(EepAddressCounty, ',', '')
        ,drvAddressCity = REPLACE(EepAddressCity, ',', '')
        ,drvAddressState = EepAddressState
        ,drvAddressZipCode = EepAddressZipCode
        ,drvAddressCountry = EepAddressCountry
        ,drvPhoneBusinessNumber = EecPhoneBusinessNumber
        ,drvAddressEmail = EepAddressEMail
        ,drvDateOfLastHire = EecDateOfLastHire
        ,drvDateOfTermination = CASE WHEN EecEmplStatus = 'T' THEN EecDateOfTermination END
        ,drvTerminationType = CASE WHEN EecEmplStatus = 'T' THEN IIF(TchType = 'V', 'Voluntary', 'Involuntary') END
		,drvDateOfBirth = EepDateOfBirth
        ,drvAsOfDate = GETDATE()
    INTO dbo.U_ECERTDEMTX_DrvTbl_Demo_D11
    FROM dbo.U_ECERTDEMTX_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
	LEFT JOIN dbo.TrmReasn WITH (NOLOCK)
		ON TchCode = EecTermReason
    WHERE @ExportCode LIKE '%DEMO%'
	OPTION (FORCE ORDER);

	-- Create Index
	CREATE CLUSTERED INDEX CDX_U_ECERTDEMTX_DrvTbl_Demo_D11 ON dbo.U_ECERTDEMTX_DrvTbl_Demo_D11(drvInitialSort);

    ---------------------------------
    -- HEADER RECORD
    ---------------------------------
    IF OBJECT_ID('U_ECERTDEMTX_DrvTbl_Demo_H01','U') IS NOT NULL
        DROP TABLE dbo.U_ECERTDEMTX_DrvTbl_Demo_H01;
    SELECT DISTINCT
         drvEquityHolderCode = 'Equityholder Code'
    INTO dbo.U_ECERTDEMTX_DrvTbl_Demo_H01
    FROM dbo.U_ECERTDEMTX_EEList WITH (NOLOCK)
    WHERE @ExportCode LIKE '%DEMO%';

    ---------------------------------
    -- DETAIL RECORD - U_ECERTDEMTX_DrvTbl_Tax_D12
    ---------------------------------
    IF OBJECT_ID('U_ECERTDEMTX_DrvTbl_Tax_D12','U') IS NOT NULL
        DROP TABLE dbo.U_ECERTDEMTX_DrvTbl_Tax_D12;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EecUDField14
        -- standard fields above and additional driver fields below
        ,drvEquityHolderCode = EecUDField14
        ,drvTaxYear = YEAR(PehPayDate)
        ,drvYTDTotalCompensation = PthCurGrossWagesUSFITYTD
        ,drvYTDTaxableSupplementalCompesation = PehCurAmtSuppWagesYTD
        ,drvYTDSocialSecurity = PthCurTaxAmtUSSOCEEYTD
        ,drvYTDSdi = MpthYtdSdi
        ,drvStateCodeSdi = MpthStateCodeSdi
		,drvYtdSui = MpthYtdSui
		,drvStateCodeSui = MpthStateCodeSui
		,drvYtdFli = MpthYtdFli
		,drvStateCodeFli = MpthStateCodeFli
		,drvYtdWdf = MpthYtdWdf
		,drvStateCodeWdf = MpthStateCodeWdf
        ,drvCompanyCode = CmpCompanyCode
    INTO dbo.U_ECERTDEMTX_DrvTbl_Tax_D12
    FROM dbo.U_ECERTDEMTX_EEList WITH (NOLOCK)
    JOIN dbo.Company WITH (NOLOCK)
        ON CmpCoID = xCoID
	INNER JOIN dbo.EmpComp WITH (NOLOCK)
		ON EecEEID = xEEID
		AND EecCoID = xCoID
	INNER JOIN dbo.U_ECERTDEMTX_PEarHist WITH (NOLOCK)
		ON PehEEID = xEEID
	INNER JOIN dbo.U_ECERTDEMTX_PTaxHist
		ON PthEEID = xEEID
	LEFT JOIN dbo.U_ECERTDEMTX_MiscPTaxHist WITH (NOLOCK)
		ON MPthEEID = xEEID
    WHERE @ExportCode LIKE '%TAX%'
	OPTION (FORCE ORDER);

	-- Create Index
	CREATE CLUSTERED INDEX CDX_U_ECERTDEMTX_DrvTbl_Tax_D12 ON dbo.U_ECERTDEMTX_DrvTbl_Tax_D12 (drvInitialSort);

    ---------------------------------
    -- HEADER RECORD
    ---------------------------------
    IF OBJECT_ID('U_ECERTDEMTX_DrvTbl_Tax_H02','U') IS NOT NULL
        DROP TABLE dbo.U_ECERTDEMTX_DrvTbl_Tax_H02;
    SELECT DISTINCT
         drvEquityHolderCode = 'Equityholder Code'
    INTO dbo.U_ECERTDEMTX_DrvTbl_Tax_H02
    FROM dbo.U_ECERTDEMTX_EEList WITH (NOLOCK)
    WHERE @ExportCode LIKE '%TAX%';

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
    SET expLastStartPerControl = '202006031'
       ,expStartPerControl     = '202006031'
       ,expLastEndPerControl   = '202006039'
       ,expEndPerControl       = '202006039'
WHERE expFormatCode = 'ECERTDEMTX';

**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwECERTDEMTX_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_ECERTDEMTX_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort
