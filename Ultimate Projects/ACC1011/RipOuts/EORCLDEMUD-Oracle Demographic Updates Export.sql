SET NOCOUNT ON;
IF OBJECT_ID('U_EORCLDEMUD_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMUD_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EORCLDEMUD_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EORCLDEMUD' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEORCLDEMUD_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEORCLDEMUD_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EORCLDEMUD') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EORCLDEMUD];
GO
IF OBJECT_ID('U_EORCLDEMUD_File') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMUD_File];
GO
IF OBJECT_ID('U_EORCLDEMUD_EEList') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMUD_EEList];
GO
IF OBJECT_ID('fn_OracleDefaultExpenseAccount') IS NOT NULL DROP FUNCTION dbo.fn_OracleDefaultExpenseAccount;
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EORCLDEMUD';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EORCLDEMUD';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EORCLDEMUD';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EORCLDEMUD';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EORCLDEMUD';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCreateTClockBatches,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhRespectZeroPayRate,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhThirdPartyPay) VALUES ('N','C','Y','0','',NULL,'','N','','N','','013010','EMPEXPORT','CDE','EORCLDEMUD','Oracle Demographic Updates Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','2000','N','S','N','EORCLDEMUDZ0','N','Jan  1 1900 12:00AM','C','N');

--=====================
-- Worker Section
--=====================
-- Header
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"METADATA"','1','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','27','1',NULL,'METADATA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Worker"','2','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','27','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemOwner"','3','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','27','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemId"','4','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','27','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveStartDate"','5','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','27','5',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonNumber"','6','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','27','6',NULL,'PersonNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ActionCode"','7','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','27','7',NULL,'ActionCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"StartDate"','8','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','27','8',NULL,'StartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FLEX:PER_PERSONS_DFF"','9','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','27','9',NULL,'FLEX:PER_PERSONS_DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"bankAccount(PER_PERSONS_DFF=Global Data Elements)"','10','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','27','10',NULL,'bankAccount(PER_PERSONS_DFF=Global Data Elements)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"bankBranch(PER_PERSONS_DFF=Global Data Elements)"','11','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','27','11',NULL,'bankBranch(PER_PERSONS_DFF=Global Data Elements)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"bankName(PER_PERSONS_DFF=Global Data Elements)"','12','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','27','12',NULL,'bankName(PER_PERSONS_DFF=Global Data Elements)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ifscCode(PER_PERSONS_DFF=Global Data Elements)"','13','(''DA''=''T'')','EORCLDEMUDZ0','50','D','27','13',NULL,'ifscCode(PER_PERSONS_DFF=Global Data Elements)',NULL,NULL);

-- Data
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MERGE"','1','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','17','1',NULL,'MERGER',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Worker"','2','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','17','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDL_LOADER"','3','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','17','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSourceID"','4','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','17','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','5','(''UD111''=''T|'')','EORCLDEMUDZ0','50','D','17','5',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonNumber"','6','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','17','6',NULL,'PersonNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ASG_CHANGE"','7','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','17','7',NULL,'ActionCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateofhire"','8','(''UD111''=''T|'')','EORCLDEMUDZ0','50','D','17','8',NULL,'StartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Global Data Elements"','9','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','17','9',NULL,'FLEX:PER_PERSONS_DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvbankAccount"','10','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','17','10',NULL,'bankAccount(PER_PERSONS_DFF=Global Data Elements)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBankBranch"','11','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','17','11',NULL,'bankBranch(PER_PERSONS_DFF=Global Data Elements)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBankName"','12','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','17','12',NULL,'bankName(PER_PERSONS_DFF=Global Data Elements)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvIfscCode"','13','(''UA''=''T'')','EORCLDEMUDZ0','50','D','17','13',NULL,'ifscCode(PER_PERSONS_DFF=Global Data Elements)',NULL,NULL);

--=======================
-- Person Name Section
--=======================
-- Header
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"METADATA"','1','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','22','1',NULL,'METADATA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonName"','2','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','22','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemOwner"','3','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','22','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemId"','4','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','22','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveStartDate"','5','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','22','5',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveEndDate"','6','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','22','6',NULL,'EffectiveEndDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonId(SourceSystemId)"','7','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','22','7',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FirstName"','8','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','22','8',NULL,'FirstName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LastName"','9','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','22','9',NULL,'LastName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"KnownAs"','10','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','22','10',NULL,'KnownAs',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"NameType"','11','(''DA''=''T'')','EORCLDEMUDZ0','50','D','22','11',NULL,'NameType',NULL,NULL);

-- Data
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MERGE"','1','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','12','1',NULL,'MERGE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonName"','2','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','12','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDL_LOADER"','3','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','12','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSourceID"','4','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','12','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','5','(''UD111''=''T|'')','EORCLDEMUDZ0','50','D','12','5',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','6','(''SS''=''T|'')','EORCLDEMUDZ0','50','D','12','6',NULL,'EffectiveEndDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonID"','7','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','12','7',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','8','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','12','8',NULL,'FirstName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','9','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','12','9',NULL,'LastName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvKnownAs"','10','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','12','10',NULL,'KnownAs',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"GLOBAL"','11','(''DA''=''T'')','EORCLDEMUDZ0','50','D','12','11',NULL,'NameType',NULL,NULL);

--=========================
-- Person Email section
--=========================
--Header
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"METADATA"','1','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','21','1',NULL,'METADATA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonEmail"','2','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','21','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemOwner"','3','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','21','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemId"','4','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','21','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"DateFrom"','5','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','21','5',NULL,'DateFrom',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonId(SourceSystemId)"','6','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','21','6',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EmailType"','7','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','21','7',NULL,'EmailType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EmailAddress"','8','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','21','8',NULL,'EmailAddress',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PrimaryFlag"','9','(''DA''=''T'')','EORCLDEMUDZ0','50','D','21','9',NULL,'PrimaryFlag',NULL,NULL);

-- Data
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MERGE"','1','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','11','1',NULL,'MERGE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonEmail"','2','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','11','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDL_LOADER"','3','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','11','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSourceID"','4','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','11','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','5','(''UD111''=''T|'')','EORCLDEMUDZ0','50','D','11','5',NULL,'DateFrom',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonID"','6','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','11','6',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work Email"','7','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','11','7',NULL,'EmailType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressEmail"','8','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','11','8',NULL,'EmailAddress',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','9','(''DA''=''T'')','EORCLDEMUDZ0','50','D','11','9',NULL,'PrimaryFlag',NULL,NULL);

--===========================
-- WorkRelationship Section
--===========================
-- Header
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"METADATA"','1','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','23','1',NULL,'METADATA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"WorkRelationship"','2','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','23','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemOwner"','3','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','23','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemId"','4','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','23','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonId(SourceSystemId)"','5','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','23','5',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LegalEmployerName"','6','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','23','6',NULL,'LegalEmployerName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"DateStart"','7','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','23','7',NULL,'DateStart',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PrimaryFlag"','8','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','23','8',NULL,'PrimaryFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"WorkerType"','9','(''DA''=''T'')','EORCLDEMUDZ0','50','D','23','9',NULL,'WorkerType',NULL,NULL);

-- Data
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MERGE"','1','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','13','1',NULL,'MERGE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"WorkRelationship"','2','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','13','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDL_LOADER"','3','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','13','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSourceID"','4','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','13','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonID"','5','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','13','5',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCompanyName"','6','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','13','6',NULL,'LegalEmployerName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','7','(''UD111''=''T|'')','EORCLDEMUDZ0','50','D','13','7',NULL,'DateStart',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','8','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','13','8',NULL,'PrimaryFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"E"','9','(''DA''=''T'')','EORCLDEMUDZ0','50','D','13','9',NULL,'WorkerType',NULL,NULL);

--=====================
-- WorkTerms Section
--======================
-- Header
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"METADATA"','1','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','1',NULL,'METADATA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"WorkTerms"','2','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ActionCode"','3','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','3',NULL,'ActionCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemOwner"','4','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','4',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemId"','5','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','5',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AssignmentName"','6','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','6',NULL,'AssignmentName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AssignmentStatusTypeCode"','7','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','7',NULL,'AssignmentStatusTypeCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AssignmentType"','8','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','8',NULL,'AssignmentType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveStartDate"','9','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','9',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveEndDate"','10','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','10',NULL,'EffectiveEndDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveLatestChange"','11','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','11',NULL,'EffectiveLatestChange',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveSequence"','12','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','12',NULL,'EffectiveSequence',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PeriodOfServiceId(SourceSystemId)"','13','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','13',NULL,'PeriodOfServiceId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonId(SourceSystemId)"','14','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','14',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PrimaryWorkTermsFlag"','15','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','15',NULL,'PrimaryWorkTermsFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"BusinessUnitShortCode"','16','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','16',NULL,'BusinessUnitShortCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LegalEmployerName"','17','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','17',NULL,'LegalEmployerName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"DefaultExpenseAccount"','18','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','18',NULL,'DefaultExpenseAccount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"JobCode"','19','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','24','19',NULL,'JobCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"DepartmentName"','20','(''DA''=''T'')','EORCLDEMUDZ0','50','D','24','20',NULL,'DepartmentName',NULL,NULL);

-- Data
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MERGE"','1','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','14','1',NULL,'MERGE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"WorkTerms"','2','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','14','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ASG_CHANGE"','3','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','14','3',NULL,'ActionCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDL_LOADER"','4','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','14','4',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSourceID"','5','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','14','5',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAssignmentName"','6','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','14','6',NULL,'AssignmentName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ACTIVE_PROCESS"','7','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','14','7',NULL,'AssignmentStatusTypeCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ET"','8','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','14','8',NULL,'AssignmentType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','9','(''UD111''=''T|'')','EORCLDEMUDZ0','50','D','14','9',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfTermination"','10','(''UD111''=''T|'')','EORCLDEMUDZ0','50','D','14','10',NULL,'EffectiveEndDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','11','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','14','11',NULL,'EffectiveLatestChange',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','12','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','14','12',NULL,'EffectiveSequence',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPeriodOfServiceID"','13','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','14','13',NULL,'PeriodOfServiceId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonID"','14','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','14','14',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','15','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','14','15',NULL,'PrimaryWorkTermsFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBusinessUnitShortCode"','16','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','14','16',NULL,'BusinessUnitShortCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCompanyName"','17','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','14','17',NULL,'LegalEmployerName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDefaultExpenseAccount"','18','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','14','18',NULL,'DefaultExpenseAccount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvJobCode"','19','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','14','19',NULL,'JobCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvOrgLvl1Desc"','20','(''UA''=''T'')','EORCLDEMUDZ0','50','D','14','20',NULL,'DepartmentName',NULL,NULL);

--==========================
-- Assignment Section
--==========================
-- Header
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"METADATA"','1','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','1',NULL,'METADATA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Assignment"','2','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemOwner"','3','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemId"','4','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"WorkTermsAssignmentId(SourceSystemId)"','5','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','5',NULL,'WorkTermsAssignmentId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PeriodOfServiceId(SourceSystemId)"','6','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','6',NULL,'PeriodOfServiceId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonId(SourceSystemId)"','7','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','7',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ActionCode"','8','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','8',NULL,'ActionCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AssignmentName"','9','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','9',NULL,'AssignmentName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AssignmentType"','10','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','10',NULL,'AssignmentType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PrimaryAssignmentFlag"','11','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','11',NULL,'PrimaryAssignmentFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PrimaryFlag"','12','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','12',NULL,'PrimaryFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ReasonCode"','13','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','13',NULL,'ReasonCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveSequence"','14','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','14',NULL,'EffectiveSequence',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveStartDate"','15','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','15',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveEndDate"','16','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','16',NULL,'EffectiveEndDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveLatestChange"','17','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','17',NULL,'EffectiveLatestChange',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AssignmentNumber"','18','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','18',NULL,'AssignmentNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LegalEmployerName"','19','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','19',NULL,'LegalEmployerName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"JobCode"','20','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','20',NULL,'JobCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"BusinessUnitShortCode"','21','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','21',NULL,'BusinessUnitShortCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"DepartmentName"','22','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','22',NULL,'DepartmentName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"DefaultExpenseAccount"','23','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','23',NULL,'DefaultExpenseAccount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LocationCode"','24','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','24',NULL,'LocationCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HourlySalariedCode"','25','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','25',NULL,'HourlySalariedCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FullPartTime"','26','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','26',NULL,'FullPartTime',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FLEX:PER_ASG_DF"','27','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','25','27',NULL,'FLEX:PER_ASG_DF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"alternatejobtitle(PER_ASG_DF=Global Data Elements)"','28','(''DA''=''T'')','EORCLDEMUDZ0','50','D','25','28',NULL,'alternatejobtitle(PER_ASG_DF=Global Data Elements)',NULL,NULL);

-- Data
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MERGE"','1','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','15','1',NULL,'MERGE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Assignment"','2','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','15','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDL_LOADER"','3','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','15','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSourceID"','4','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','15','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvWorkTermsAssignmentID"','5','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','15','5',NULL,'WorkTermsAssignmentId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPeriodOfServiceID"','6','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','15','6',NULL,'PeriodOfServiceId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonID"','7','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','15','7',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ASG_CHANGE"','8','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','15','8',NULL,'ActionCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAssigmnetName"','9','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','15','9',NULL,'AssignmentName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"E"','10','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','15','10',NULL,'AssignmentType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','11','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','15','10',NULL,'PrimaryAssignmentFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','12','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','15','12',NULL,'PrimaryFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','13','(''SS''=''T|'')','EORCLDEMUDZ0','50','D','15','13',NULL,'ReasonCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','14','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','15','14',NULL,'EffectiveSequence',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfOriginalHire"','15','(''UD111''=''T|'')','EORCLDEMUDZ0','50','D','15','15',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfTermination"','16','(''UD111''=''T|'')','EORCLDEMUDZ0','50','D','15','16',NULL,'EffectiveEndDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','17','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','15','17',NULL,'EffectiveLatestChange',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAssignmentNumber"','18','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','15','18',NULL,'AssignmentNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCompanyName"','19','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','15','19',NULL,'LegalEmployerName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvJobCode"','20','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','15','20',NULL,'JobCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBusinessUnitShortCode"','21','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','15','21',NULL,'BusinessUnitShortCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvOrgLvl1Desc"','22','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','15','22',NULL,'DepartmentName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDefaultExpenseAccount"','23','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','15','23',NULL,'DefaultExpenseAccount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocation"','24','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','15','24',NULL,'LocationCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalaryOrHourly"','25','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','15','25',NULL,'HourlySalariedCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFullTimeOrPartTime"','26','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','15','26',NULL,'FullPartTime',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Global Data Elements"','27','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','15','27',NULL,'FLEX:PER_ASG_DF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvjobTitle"','28','(''UA''=''T'')','EORCLDEMUDZ0','50','D','15','28',NULL,'alternatejobtitle(PER_ASG_DF=Global Data Elements)',NULL,NULL);

--==================================
-- AssignmentSupervisor
--==================================
-- Header
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"METADATA"','1','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','26','1',NULL,'METADATA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AssignmentSupervisor"','2','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','26','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemId"','3','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','26','3',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AssignmentNumber"','4','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','26','4',NULL,'AssignmentNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveStartDate"','5','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','26','5',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveEndDate"','6','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','26','6',NULL,'EffectiveEndDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ManagerType"','7','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','26','7',NULL,'ManagerType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PrimaryFlag"','8','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','26','8',NULL,'PrimaryFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ManagerAssignmentNumber"','9','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','26','9',NULL,'ManagerAssignmentNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemOwner"','10','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','26','10',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ManagerPersonNumber"','11','(''DA''=''T'')','EORCLDEMUDZ0','50','D','26','11',NULL,'ManagerPersonNumber',NULL,NULL);

-- Data
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MERGE"','1','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','16','1',NULL,'MERGE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AssignmentSupervisor"','2','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','16','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSourceID"','3','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','16','3',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAssignmentNumber"','4','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','16','4',NULL,'AssignmentNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','5','(''UD111''=''T|'')','EORCLDEMUDZ0','50','D','16','5',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfTermination"','6','(''UD111''=''T|'')','EORCLDEMUDZ0','50','D','16','6',NULL,'EffectiveEndDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvJobDesc"','7','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','16','7',NULL,'ManagerType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','8','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','16','8',NULL,'PrimaryFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvManagerAssignmentNumber"','9','(''UA''=''T|'')','EORCLDEMUDZ0','50','D','16','9',NULL,'ManagerAssignmentNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDL_LOADER"','10','(''DA''=''T|'')','EORCLDEMUDZ0','50','D','16','10',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvManagerPersonNumber"','11','(''UA''=''T'')','EORCLDEMUDZ0','50','D','16','11',NULL,'ManagerPersonNumber',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Updates OnDemand','201908169','EMPEXPORT','ONDMD_XOE',NULL,'EORCLDEMUD',NULL,NULL,NULL,'201908169','Aug 16 2019 12:19PM','Aug 16 2019 12:19PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'WYLEC',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Updates Test','201908169','EMPEXPORT','TEST_XOE',NULL,'EORCLDEMUD',NULL,NULL,NULL,'201908169','Aug 16 2019 12:19PM','Aug 16 2019 12:19PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'WYLEC',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Updates FullFile','201908169','EMPEXPORT','FULL_XOE',NULL,'EORCLDEMUD',NULL,NULL,NULL,'201908169','Aug 16 2019 12:19PM','Aug 16 2019 12:19PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'WYLEC',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Updates Scheduled','201908169','EMPEXPORT','SCHEDULED',NULL,'EORCLDEMUD',NULL,NULL,NULL,'201908169','Aug 16 2019 12:19PM','Aug 16 2019 12:19PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'WYLEC',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMUD','EEList','V','Y');
--INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMUD','ExportPath','V','\\US.SAAS\Ez\Public\ACC1011\Exports\Oracle\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMUD','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMUD','MultFile','V','N');
--INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMUD','OnDemandPath','V','\\US.SAAS\Ez\Public\ACC1011\Exports\Oracle\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMUD','SubSort','C','drvSubSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMUD','Testing','V','N');
--INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMUD','TestPath','V','\\US.SAAS\Ez\Public\ACC1011\Exports\Oracle\');
--INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMUD','UDESPath','C','\\US.SAAS\Ez\Public\ACC1011\Exports\Oracle\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMUD','UseFileName','V','Y');
--UPDATE dbo.U_dsi_Configuration SET CfgValue = '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\' WHERE FormatCode = 'EORCLDEMUD' AND CfgName = 'ExportPath' AND CfgValue IS NULL;
--UPDATE dbo.U_dsi_Configuration SET CfgValue = svCfgValue FROM dbo.U_EORCLDEMUD_SavePath WHERE CfgName = svCfgName AND FormatCode = svFormatCode AND svCfgValue IS NOT NULL;
IF OBJECT_ID('U_EORCLDEMUD_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMUD_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMUD','D11','dbo.U_EORCLDEMUD_drvTbl_Updates_PersonEmail_D11',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMUD','D12','dbo.U_EORCLDEMUD_drvTbl_Updates_PersonName_D12',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMUD','D13','dbo.U_EORCLDEMUD_drvTbl_Updates_WorkRelationship_D13',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMUD','D14','dbo.U_EORCLDEMUD_drvTbl_Updates_WorkTerms_D14',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMUD','D15','dbo.U_EORCLDEMUD_drvTbl_Updates_Assignment_D15',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMUD','D16','dbo.U_EORCLDEMUD_drvTbl_Updates_AssignmentSupervisor_D16',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMUD','D17','dbo.U_EORCLDEMUD_drvTbl_Updates_Worker_D17',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMUD','D21','dbo.U_EORCLDEMUD_drvTbl_Updates_PersonEmail_D21',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMUD','D22','dbo.U_EORCLDEMUD_drvTbl_Updates_PersonName_D22',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMUD','D23','dbo.U_EORCLDEMUD_drvTbl_Updates_WorkRelationship_D23',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMUD','D24','dbo.U_EORCLDEMUD_drvTbl_Updates_WorkTerms_D24',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMUD','D25','dbo.U_EORCLDEMUD_drvTbl_Updates_Assignment_D25',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMUD','D26','dbo.U_EORCLDEMUD_drvTbl_Updates_AssignmentSupervisor_D26',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMUD','D27','dbo.U_EORCLDEMUD_drvTbl_Updates_Worker_D27',NULL);
IF OBJECT_ID('U_EORCLDEMUD_EEList') IS NULL
CREATE TABLE [dbo].[U_EORCLDEMUD_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EORCLDEMUD_File') IS NULL
CREATE TABLE [dbo].[U_EORCLDEMUD_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(2000) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EORCLDEMUD]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: R1 RCM Inc.

Created By: Wyle Cordero
Business Analyst: Dian Turner
Create Date: 08/16/2019
Service Request Number: SR-2019-00241875

Purpose: Oracle Demographic Updates Export

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2019     SR-2019-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EORCLDEMUD';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EORCLDEMUD';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EORCLDEMUD';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EORCLDEMUD';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EORCLDEMUD' ORDER BY RunID DESC;

Job Ownership Scripts
---------------------
-- Set job owner to ssis_user for Production jobs
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 0;

-- Set job owner to self, to make changes in SQL Job Scheduler. Remember to re-run the above script to change ownership to ssis_user when complete
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 1;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EORCLDEMUD', 'ONDMD_XOE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EORCLDEMUD', 'TEST_XOE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EORCLDEMUD', 'FULL_XOE';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'EORCLDEMUD', @AllObjects = 'Y', @IsWeb = 'Y'
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
    SELECT @FormatCode = 'EORCLDEMUD';

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
    DELETE FROM dbo.U_EORCLDEMUD_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_EORCLDEMUD_EEList GROUP BY xEEID HAVING COUNT(1) > 1);


    --==========================================
    -- Audit Section
    --==========================================
    -- Get data from audit fields table. Add fields here if auditing
    IF OBJECT_ID('U_EORCLDEMUD_AuditFields','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMUD_AuditFields;
    CREATE TABLE dbo.U_EORCLDEMUD_AuditFields (aTableName varchar(30),aFieldName varchar(30));

	INSERT INTO dbo.U_EORCLDEMUD_AuditFields (aTableName, aFieldName)
	VALUES ('EmpComp', 'EmplStatus')
	       ,('EmpComp', 'EecDateOfTermination')
		   ,('EmpComp', 'EecDateOfLastHire')
		   ,('EmpComp', 'EecJobCode')
		   ,('EmpComp', 'EecEEType')
		   ,('EmpComp', 'EecJobChangeReason')
		   ,('EmpComp', 'EecOrgLvl1')
		   ,('EmpComp', 'EecOrgLvl2')
		   ,('EmpComp', 'EecOrgLvl3')
		   ,('EmpComp', 'EecOrgLvl4')
		   ,('EmpPers', 'EepNameFirst')
		   ,('EmpPers', 'EepNameLast')
		   ,('EmpPers', 'EepAddressEmail')

    -- Create audit table based on fields defined above
    IF OBJECT_ID('U_EORCLDEMUD_Audit','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMUD_Audit;
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
    INTO dbo.U_EORCLDEMUD_Audit
    FROM dbo.vw_AuditData WITH (NOLOCK) 
    JOIN dbo.U_EORCLDEMUD_AuditFields WITH (NOLOCK) 
        ON audTableName = aTableName
        AND audFieldName = aFieldName
    WHERE audDateTime BETWEEN @StartDate AND @EndDate
    AND audAction <> 'DELETE';

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EORCLDEMUD_Audit ON dbo.U_EORCLDEMUD_Audit (audEEID,audKey2);


    --================
    -- Changes Only
    --================
    DELETE FROM dbo.U_EORCLDEMUD_EEList
    WHERE NOT EXISTS (SELECT 1 FROM dbo.U_EORCLDEMUD_Audit WHERE audEEID = xEEID AND audRowNo = 1)
	AND @ExportCode <> 'FULL_XOE';

	-- Exclude any future hires.
	DELETE el
	FROM dbo.U_EORCLDEMUD_EEList el
	INNER JOIN dbo.EmpComp
		ON EecEEID = xEEID
		AND EecCoID = xCoID
		AND EecDateOfLastHire > @EndDate
	;

/***********************************************************************************************************************************
-- Importing appendix files provided by the client for mapping purposes.
-- Run the scripts below if the files need to imported again.

--===================================
-- Mappings Business Units:
--====================================
CREATE TABLE [ULTIPRO_RRCM].[dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (
    [MapCompanyCode] VARCHAR(10)
    ,[MapCompanyName] VARCHAR(100)
    ,[MapBusinessUnit] VARCHAR(100)
)
BULK INSERT [ULTIPRO_RRCM].[dbo].[U_EORCLDEMNH_Mappings_BusinessUnits]
FROM '\\US.SAAS\Ez\Public\ACC1011\Exports\Oracle\Appendix\Business Unit Mappings.csv'
    WITH
    (
        FIELDTERMINATOR = '|'
        ,ROWTERMINATOR = '\n'
        ,FIRSTROW = 2
    )
-- DROP TABLE [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits]

-- Location's mapping will no longer be used, will keep just in case.
--===================================
-- Mappings Business Locations:
--====================================
CREATE TABLE [ULTIPRO_RRCM].[dbo].[U_EORCLDEMNH_Mappings_Locations] (
    [MapUltiLocCode] VARCHAR(15)
    ,[MapOracleLocCode] VARCHAR(15)
)
BULK INSERT [ULTIPRO_RRCM].[dbo].[U_EORCLDEMNH_Mappings_Locations]
FROM '\\US.SAAS\Ez\Public\ACC1011\Exports\Oracle\Appendix\Location Code Mappings.csv'
    WITH
    (
        FIELDTERMINATOR = '|'
        ,ROWTERMINATOR = '\n'
        ,FIRSTROW = 2
    )
-- DROP TABLE [dbo].[U_EORCLDEMNH_Mappings_Locations]

***********************************************************************************************************************************/

    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_EORCLDEMUD_drvTbl_Updates_Worker_D17
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMUD_drvTbl_Updates_Worker_D17','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMUD_drvTbl_Updates_Worker_D17;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = '1A'
        ,drvSubSort = EecEmpNo
        -- standard fields above and additional driver fields below
		,drvSourceID = CONCAT(EecEmpNo, '_PERSON')
		,drvDateOfLastHire = EecDateOfLastHire
		,drvPersonNumber = EecEmpNo
		,drvDateofhire = EecDateOfLastHire
		,drvbankAccount = BankAccountNumber
		,drvBankBranch = BeneficiaryAddress3
		,drvBankName = BankName
		,drvIfscCode = SwiftCode
    INTO dbo.U_EORCLDEMUD_drvTbl_Updates_Worker_D17
    FROM dbo.U_EORCLDEMUD_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
	LEFT JOIN dbo.EmpGlobalBankInfo WITH (NOLOCK)
		ON xEEID = EEID
		AND xCoID = CoID
    ;

    ---------------------------------
    -- Header RECORD - U_EORCLDEMUD_drvTbl_Updates_Worker_D27
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMUD_drvTbl_Updates_Worker_D27','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMUD_drvTbl_Updates_Worker_D27;
    SELECT DISTINCT
        drvInitialSort = '1'
        ,drvSubSort = ''
    INTO dbo.U_EORCLDEMUD_drvTbl_Updates_Worker_D27
    FROM dbo.U_EORCLDEMUD_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    ;

    ---------------------------------
    -- DETAIL RECORD - U_EORCLDEMUD_drvTbl_Updates_PersonName_D12
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMUD_drvTbl_Updates_PersonName_D12','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMUD_drvTbl_Updates_PersonName_D12;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = '2A'
        ,drvSubSort = EecEmpno
        -- standard fields above and additional driver fields below
        ,drvSourceID = CONCAT(EecEmpNo, '_PERSON_NAME')
        ,drvDateOfLastHire = GETDATE()
        ,drvPersonID = CONCAT(EecEmpNo, '_PERSON')
        ,drvNameFirst = EepNameFirst
        ,drvNameLast = EepNameLast
        ,drvKnownAs = CASE
		                  WHEN NULLIF(EepNameSuffix, '') IS NOT NULL AND EepNameSuffix <> 'Z' THEN CONCAT(EepNameLast, ', ', EepNameSuffix, ', ', EepNameFirst, ' ', LEFT(EepNameMiddle, 1))
						  WHEN  NULLIF(EepNameMiddle, '') IS NOT NULL THEN CONCAT(EepNameLast, ', ', EepNameFirst, ' ', LEFT(EepNameMiddle, 1))
						  ELSE CONCAT(EepNameLast, ', ', EepNameFirst)
		              END
    INTO dbo.U_EORCLDEMUD_drvTbl_Updates_PersonName_D12
    FROM dbo.U_EORCLDEMUD_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    ;

    ---------------------------------
    -- Header RECORD - U_EORCLDEMUD_drvTbl_Updates_PersonName_D22
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMUD_drvTbl_Updates_PersonName_D22','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMUD_drvTbl_Updates_PersonName_D22;
    SELECT DISTINCT
        drvInitialSort = '2'
        ,drvSubSort = ''
    INTO dbo.U_EORCLDEMUD_drvTbl_Updates_PersonName_D22
    FROM dbo.U_EORCLDEMUD_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    ;

    ---------------------------------
    -- DETAIL RECORD - U_EORCLDEMUD_drvTbl_Updates_PersonEmail_D11
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMUD_drvTbl_Updates_PersonEmail_D11','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMUD_drvTbl_Updates_PersonEmail_D11;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = '3A'
        ,drvSubSort = EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvSourceID = CONCAT(EecEmpNo, '_PERSON_EMAIL')
        ,drvDateOfLastHire = GETDATE()
        ,drvPersonID = CONCAT(EecEmpNo, '_PERSON')
        ,drvAddressEmail = COALESCE(NULLIF(EepAddressEMail, ''), LOWER(CONCAT(LEFT(RTRIM(LTRIM(EepNameFirst)), 1), RTRIM(LTRIM(EepNameLast)), '@r1rcm.com')))
    INTO dbo.U_EORCLDEMUD_drvTbl_Updates_PersonEmail_D11
    FROM dbo.U_EORCLDEMUD_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    ;

    ---------------------------------
    -- Header RECORD - U_EORCLDEMUD_drvTbl_Updates_PersonEmail_D21
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMUD_drvTbl_Updates_PersonEmail_D21','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMUD_drvTbl_Updates_PersonEmail_D21;
    SELECT DISTINCT
        drvInitialSort = '3'
        ,drvSubSort = ''
    INTO dbo.U_EORCLDEMUD_drvTbl_Updates_PersonEmail_D21
    FROM dbo.U_EORCLDEMUD_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    ;

    ---------------------------------
    -- DETAIL RECORD - U_EORCLDEMUD_drvTbl_Updates_WorkRelationship_D13
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMUD_drvTbl_Updates_WorkRelationship_D13','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMUD_drvTbl_Updates_WorkRelationship_D13;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = '4A'
        ,drvSubSort = EecEmpNo
        -- standard fields above and additional driver fields below
		,drvSourceID = CONCAT(EecEmpNo, '_PERSON_WORKRELATIONSHIP')
		,drvPersonID = CONCAT(EecEmpNo, '_PERSON')
		,drvCompanyName = COALESCE(NULLIF(CmpCompanyDBAName, ''), CmpCompanyName)
        ,drvDateOfLastHire = EecDateOfLastHire
    INTO dbo.U_EORCLDEMUD_drvTbl_Updates_WorkRelationship_D13
    FROM dbo.U_EORCLDEMUD_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
	INNER JOIN dbo.Company WITH (NOLOCK)
	    ON xCoID = CmpCoID
	LEFT JOIN [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] WITH (NOLOCK)
		ON CmpGLSegment = MapCompanyCode
    ;

    ---------------------------------
    -- Header RECORD - U_EORCLDEMUD_drvTbl_Updates_WorkRelationship_D23
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMUD_drvTbl_Updates_WorkRelationship_D23','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMUD_drvTbl_Updates_WorkRelationship_D23;
    SELECT DISTINCT
        drvInitialSort = '4'
        ,drvSubSort = ''
    INTO dbo.U_EORCLDEMUD_drvTbl_Updates_WorkRelationship_D23
    FROM dbo.U_EORCLDEMUD_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    ;

    ---------------------------------
    -- DETAIL RECORD - U_EORCLDEMUD_drvTbl_Updates_WorkTerms_D14
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMUD_drvTbl_Updates_WorkTerms_D14','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMUD_drvTbl_Updates_WorkTerms_D14;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = '5A'
        ,drvSubSort = EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvSourceID = CONCAT(EecEmpNo, '_WORKTERMS')
        ,drvAssignmentName = CASE WHEN (EecJobChangeReason NOT IN ('100', '101') OR EecEmplStatus <> 'T') THEN 'E1' END
        ,drvDateOfLastHire = GETDATE()
        ,drvDateOfTermination = CASE WHEN EecEmplStatus = 'T' THEN GETDATE() + 1 END
        ,drvPeriodOfServiceID = CONCAT(EecEmpNo, '_PERSON_RELATIONSHIP')
        ,drvPersonID = CONCAT(EecEmpNo, '_PERSON')
        ,drvBusinessUnitShortCode = MapbusinessUnit
        ,drvCompanyName = COALESCE(NULLIF(CmpCompanyDBAName, ''), CmpCompanyName)
        ,drvDefaultExpenseAccount = dbo.fn_OracleDefaultExpenseAccount(CmpGLSegment, LocAddressCountry, EecOrgLvl1, EecOrgLvl2, EecEmplStatus, LocGLAcctNo)
		,drvjobCode = '' -- COALESCE(NULLIF(JbcDesc, ''), 'Not Applicable')
        ,drvOrgLvl1Desc = Org1.OrgDesc
    INTO dbo.U_EORCLDEMUD_drvTbl_Updates_WorkTerms_D14
    FROM dbo.U_EORCLDEMUD_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.Company WITH (NOLOCK)
        ON CmpCoID = xCoID
	INNER JOIN dbo.JobCode WITH (NOLOCK)
		ON EecJobCode = JbcJobCode
	LEFT JOIN [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] WITH (NOLOCK)
		ON CmpGLSegment = MapCompanyCode
	LEFT JOIN dbo.OrgLevel Org1 WITH (NOLOCK)
	    ON EecOrgLvl1 = Org1.OrgCode
		AND Org1.OrgLvl = 1
	LEFT JOIN dbo.OrgLevel Org4 WITH (NOLOCK)
	    ON EecOrgLvl4 = Org4.OrgCode
		AND org4.OrgLvl = 4
	LEFT JOIN dbo.OrgLevel Org2 WITH (NOLOCK)
	    ON EecOrgLvl2 = Org2.OrgCode
		AND Org2.OrgLvl = 2
	LEFT JOIN dbo.[Location] WITH (NOLOCK)
	    ON EecLocation = LocCode
    ;

    ---------------------------------
    -- Header RECORD - U_EORCLDEMUD_drvTbl_Updates_WorkTerms_D24
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMUD_drvTbl_Updates_WorkTerms_D24','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMUD_drvTbl_Updates_WorkTerms_D24;
    SELECT DISTINCT
        drvInitialSort = '5'
        ,drvSubSort = ''
    INTO dbo.U_EORCLDEMUD_drvTbl_Updates_WorkTerms_D24
    FROM dbo.U_EORCLDEMUD_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    ;

    ---------------------------------
    -- DETAIL RECORD - U_EORCLDEMUD_drvTbl_Updates_Assignment_D15
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMUD_drvTbl_Updates_Assignment_D15','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMUD_drvTbl_Updates_Assignment_D15;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = '6A'
        ,drvSubSort = EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvSourceID = CONCAT(EecEmpNo, '_PERSON_ASSIGNMENT')
		,drvWorkTermsAssignmentID = CONCAT(EecEmpNo, '_WORKTERMS')
		,drvPeriodOfServiceID = CONCAT(EecEmpNo, '_PERSON_RELATIONSHIP')
		,drvPersonID = CONCAT(EecEmpNo, '_PERSON')
		,drvAssigmnetName = CASE WHEN (EecJobChangeReason NOT IN ('100', '101') OR EecEmplStatus <> 'T') THEN 'E1' END
        ,drvDateOfOriginalHire = GETDATE()
        ,drvDateOfTermination = CASE WHEN EecEmplStatus = 'T' THEN GETDATE() + 1 END
        ,drvAssignmentNumber = EecEmpNo
		,drvCompanyName = COALESCE(NULLIF(CmpCompanyDBAName, ''), CmpCompanyName)
		,drvjobCode = '' -- COALESCE(NULLIF(JbcDesc, ''), 'Not Applicable')
		,drvBusinessUnitShortCode = MapbusinessUnit
		,drvOrgLvl1Desc = Org1.OrgDesc
        ,drvDefaultExpenseAccount = dbo.fn_OracleDefaultExpenseAccount(CmpGLSegment, LocAddressCountry, EecOrgLvl1, EecOrgLvl2, EecEmplStatus, LocGLAcctNo)
		,drvLocation = '' -- CASE WHEN LocAddressCountry IN ('USA', 'NZL', 'LTU') THEN '000' ELSE COALESCE(NULLIF(RTRIM(LTRIM(LocGLAcctNo)), ''), '000') END
		,drvSalaryOrHourly = CASE WHEN EecSalaryOrHourly = 'S' THEN 'Salaried' ELSE 'Hourly' END
		,drvFullTimeOrPartTime = CASE WHEN EecFullTimeOrPartTime = 'F' THEN 'Full Time' ELSE 'Part Time' END
		,drvJobTitle = COALESCE(NULLIF(JbcDesc, ''), 'Not Applicable')
    INTO dbo.U_EORCLDEMUD_drvTbl_Updates_Assignment_D15
    FROM dbo.U_EORCLDEMUD_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.Company WITH (NOLOCK)
        ON CmpCoID = xCoID
	INNER JOIN dbo.JobCode WITH (NOLOCK)
		ON EecJobCode = JbcJobCode
	LEFT JOIN [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] WITH (NOLOCK)
		ON CmpGLSegment = MapCompanyCode
	LEFT JOIN dbo.OrgLevel Org1 WITH (NOLOCK)
	    ON EecOrgLvl1 = Org1.OrgCode
		AND Org1.OrgLvl = 1
	LEFT JOIN dbo.OrgLevel Org4 WITH (NOLOCK)
	    ON EecOrgLvl4 = Org4.OrgCode
		AND org4.OrgLvl = 4
	LEFT JOIN dbo.OrgLevel Org2 WITH (NOLOCK)
	    ON EecOrgLvl2 = Org2.OrgCode
		AND Org2.OrgLvl = 2
	LEFT JOIN dbo.[Location] WITH (NOLOCK)
	    ON EecLocation = LocCode
    OPTION (FORCE ORDER);

    ---------------------------------
    -- Header RECORD - U_EORCLDEMUD_drvTbl_Updates_Assignment_D25
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMUD_drvTbl_Updates_Assignment_D25','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMUD_drvTbl_Updates_Assignment_D25;
    SELECT DISTINCT
        drvInitialSort = '6'
        ,drvSubSort = ''
    INTO dbo.U_EORCLDEMUD_drvTbl_Updates_Assignment_D25
    FROM dbo.U_EORCLDEMUD_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    OPTION (FORCE ORDER);

    ---------------------------------
    -- DETAIL RECORD - U_EORCLDEMUD_drvTbl_Updates_AssignmentSupervisor_D16
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMUD_drvTbl_Updates_AssignmentSupervisor_D16','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMUD_drvTbl_Updates_AssignmentSupervisor_D16;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = '7A'
        ,drvSubSort = Ee.EecEmpNo
        -- standard fields above and additional driver fields below
		,drvSourceID = CONCAT(Ee.EecEmpNo, '_MGR_ASG')
        ,drvAssignmentNumber = Ee.EecEmpNo
        ,drvDateOfLastHire = GETDATE()
        ,drvDateOfTermination = CASE WHEN Ee.EecEmplStatus = 'T' THEN GETDATE() + 1 END
        ,drvJobDesc = 'LINE_MANAGER'
        ,drvManagerAssignmentNumber = CASE WHEN Es.EecEmpNo IS NOT NULL THEN CONCAT('E', RTRIM(LTRIM(Es.EecEmpNo))) END
        ,drvManagerPersonNumber = Es.EecEmpNo
    INTO dbo.U_EORCLDEMUD_drvTbl_Updates_AssignmentSupervisor_D16
    FROM dbo.U_EORCLDEMUD_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp Ee WITH (NOLOCK)
        ON Ee.EecEEID = xEEID 
        AND Ee.EecCoID = xCoID
	INNER JOIN dbo.EmpComp Es WITH (NOLOCK)
	    ON Ee.EecSupervisorID = Es.EecEEID
		AND es.EecEmpNo IS NOT NULL
    OPTION (FORCE ORDER);

    ---------------------------------
    -- Header RECORD - U_EORCLDEMUD_drvTbl_Updates_AssignmentSupervisor_D26
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMUD_drvTbl_Updates_AssignmentSupervisor_D26','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMUD_drvTbl_Updates_AssignmentSupervisor_D26;
    SELECT DISTINCT
        drvInitialSort = '7'
        ,drvSubSort = ''
    INTO dbo.U_EORCLDEMUD_drvTbl_Updates_AssignmentSupervisor_D26
    FROM dbo.U_EORCLDEMUD_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    OPTION (FORCE ORDER);

    --==========================================
    -- Set FileName
    --==========================================
    --IF (dbo.dsi_fnVariable(@FormatCode,'UseFileName') = 'N')
    --BEGIN
    --    UPDATE dbo.U_dsi_Parameters
    --        SET ExportFile = CASE WHEN dbo.dsi_fnVariable(@FormatCode,'Testing') = 'Y' THEN 'Oracle_Updates_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.csv'
    --                              WHEN @ExportCode LIKE '%TEST%' THEN 'Oracle_Updates_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.csv'
    --                              ELSE 'Oracle_Updates_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.csv'
    --                         END
    --    WHERE FormatCode = @FormatCode;
    --END

END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwEORCLDEMUD_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_EORCLDEMUD_File (NOLOCK)
    ORDER BY InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'EORCLDEMUD%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '201908091'
       ,expStartPerControl     = '201908091'
       ,expLastEndPerControl   = '201908169'
       ,expEndPerControl       = '201908169'
WHERE expFormatCode = 'EORCLDEMUD';

**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwEORCLDEMUD_Export AS 
    SELECT TOP 20000000 Data FROM dbo.U_EORCLDEMUD_File (NOLOCK)
    ORDER BY InitialSort, SubSort;
GO

CREATE FUNCTION dbo.fn_OracleDefaultExpenseAccount (@CmpGLSegment VARCHAR(10), @LocAddressCountry VARCHAR(10), @EecOrgLvl1 VARCHAR(20), @EecOrgLvl2 VARCHAR(20), @EecEmplStatus VARCHAR(10), @LocGLAcctNo VARCHAR(10))
RETURNS VARCHAR(250)
AS BEGIN
/******************************
Created by: Wyle Cordero
Last Modified: 01/29/2020
Purpose: Default Expense account regarding project ( ACC1011-2019-00255969-Ref: SR-2019-00241875 - Need updates to 2 demographic file)
Notes: (Company (3 Digits) - Department (4 Digits) - Account (5 Digits) - Activity (4 Digits) - Location (3 Digits) - Intercompany (3 Digits) - Future 1 (3 Digits) - Future 2 (3 Digits))
*******************************/
	DECLARE 
		@OutPut VARCHAR(250)
		,@GLSegment VARCHAR(3)
		,@Country VARCHAR(5)
		,@OrgLvl1 VARCHAR(4)
		,@OrgLvl2 VARCHAR(4)
		,@Location VARCHAR(3)


		SET @Country = @LocAddressCountry
		SET @GLSegment = COALESCE(NULLIF(RTRIM(LTRIM(@CmpGLSegment)), ''), '000')
		SET @OrgLvl1 = CASE WHEN ISNUMERIC(@EecOrgLvl1) = 1 AND LEN(@EecOrgLvl1) = 4 THEN RTRIM(LTRIM(@EecOrgLvl1)) ELSE '0000' END
		SET @OrgLvl2 = CASE WHEN ISNUMERIC(@EecOrgLvl2) = 1 AND LEN(@EecOrgLvl2) = 4 AND @EecEmplStatus <> 'T' THEN RTRIM(LTRIM(@EecOrgLvl2)) ELSE '0000' END
		SET @Location = CASE WHEN @LocAddressCountry IN ('USA', 'NZL', 'LTU') THEN '000' ELSE COALESCE(NULLIF(RTRIM(LTRIM(@LocGLAcctNo)), ''), '000') END

		SET @OutPut = CONCAT(@GLSegment, '-', @OrgLvl1, '-53111', '-', @OrgLvl2, '-', @Location, '-000-000-000')

		RETURN @OutPut
END