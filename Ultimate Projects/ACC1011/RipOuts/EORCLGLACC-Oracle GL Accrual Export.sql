SET NOCOUNT ON;
IF OBJECT_ID('U_EORCLGLACC_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EORCLGLACC_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EORCLGLACC_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EORCLGLACC' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEORCLGLACC_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEORCLGLACC_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EORCLGLACC') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EORCLGLACC];
GO
IF OBJECT_ID('dsi_sp_AfterCollect_EORCLGLACC') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_AfterCollect_EORCLGLACC];
GO
IF OBJECT_ID('U_EORCLGLACC_File') IS NOT NULL DROP TABLE [dbo].[U_EORCLGLACC_File];
GO
IF OBJECT_ID('U_EORCLGLACC_EEList') IS NOT NULL DROP TABLE [dbo].[U_EORCLGLACC_EEList];
GO
IF OBJECT_ID('U_EORCLGLACC_AuditFields') IS NOT NULL DROP TABLE [dbo].[U_EORCLGLACC_AuditFields];
GO
IF OBJECT_ID('U_EORCLGLACC_Audit') IS NOT NULL DROP TABLE [dbo].[U_EORCLGLACC_Audit];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EORCLGLACC';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EORCLGLACC';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EORCLGLACC';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EORCLGLACC';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EORCLGLACC';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhRespectZeroPayRate,AdhCreateTClockBatches,AdhThirdPartyPay) VALUES ('N','C','Y','0','','','N','','N','','013010','EMPEXPORT','CDE','EORCLGLACC','Oracle GL Accrual Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','3000','S','N','EORCLGLACCZ0','N','Jan  1 1900 12:00AM','C','N',NULL,'N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"NEW"','1','(''DA''=''T,'')','EORCLGLACCZ0','50','D','10','1',NULL,'*Status Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLedgerID"','2','(''UA''=''T,'')','EORCLGLACCZ0','50','D','10','2',NULL,'*Ledger ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPayDate"','3','(''UD111''=''T,'')','EORCLGLACCZ0','50','D','10','3',NULL,'*Effective Date of Transaction',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"UltiPro"','4','(''DA''=''T,'')','EORCLGLACCZ0','50','D','10','4',NULL,'*Journal Source',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Payroll"','5','(''DA''=''T,'')','EORCLGLACCZ0','50','D','10','5',NULL,'*Journal Category',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"USD"','6','(''DA''=''T,'')','EORCLGLACCZ0','50','D','10','6',NULL,'*Currency Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFileCreationDate"','7','(''UD111''=''T,'')','EORCLGLACCZ0','50','D','10','7',NULL,'*Journal Entry Creation Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"A"','8','(''DA''=''T,'')','EORCLGLACCZ0','50','D','10','8',NULL,'*Actual Flag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSegment1"','9','(''UA''=''T,'')','EORCLGLACCZ0','50','D','10','9',NULL,'Segment1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSegment2"','10','(''UA''=''T,'')','EORCLGLACCZ0','50','D','10','10',NULL,'Segment2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSegment3"','11','(''UA''=''T,'')','EORCLGLACCZ0','50','D','10','11',NULL,'Segment3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSegment4"','12','(''UA''=''T,'')','EORCLGLACCZ0','50','D','10','12',NULL,'Segment4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"000"','13','(''DA''=''T,'')','EORCLGLACCZ0','50','D','10','13',NULL,'Segment5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"000"','14','(''DA''=''T,'')','EORCLGLACCZ0','50','D','10','14',NULL,'Segment6',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"000"','15','(''DA''=''T,'')','EORCLGLACCZ0','50','D','10','15',NULL,'Segment7',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"000"','16','(''DA''=''T,'')','EORCLGLACCZ0','50','D','10','16',NULL,'Segment8',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','17','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','17',NULL,'Segment9',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','18','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','18',NULL,'Segment10',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','19','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','19',NULL,'Segment11',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','20','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','20',NULL,'Segment12',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','21','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','21',NULL,'Segment13',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','22','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','22',NULL,'Segment14',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','23','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','23',NULL,'Segment15',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','24','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','24',NULL,'Segment16',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','25','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','25',NULL,'Segment17',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','26','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','26',NULL,'Segment18',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','27','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','27',NULL,'Segment19',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','28','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','28',NULL,'Segment20',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','29','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','29',NULL,'Segment21',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','30','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','30',NULL,'Segment22',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','31','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','31',NULL,'Segment23',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','32','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','32',NULL,'Segment24',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','33','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','33',NULL,'Segment25',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','34','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','34',NULL,'Segment26',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','35','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','35',NULL,'Segment27',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','36','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','36',NULL,'Segment28',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','37','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','37',NULL,'Segment29',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','38','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','38',NULL,'Segment30',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDebitAmnt"','39','(''UA''=''T,'')','EORCLGLACCZ0','50','D','10','39',NULL,'Entered Debit Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCreditAmnt"','40','(''UA''=''T,'')','EORCLGLACCZ0','50','D','10','40',NULL,'Entered Credit Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','41','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','41',NULL,'Converted Debit Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','42','(''ss''=''T,'')','EORCLGLACCZ0','50','D','10','42',NULL,'Converted Credit Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvReference1"','43','(''UA''=''Q,'')','EORCLGLACCZ0','50','D','10','43',NULL,'REFERENCE1 (Batch Name)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','44','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','44',NULL,'REFERENCE2 (Batch Description)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','45','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','45',NULL,'REFERENCE3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvReference4"','46','(''UA''=''T,'')','EORCLGLACCZ0','50','D','10','46',NULL,'REFERENCE4 (Journal Entry Name)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','47','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','47',NULL,'REFERENCE5 (Journal Entry Description)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','48','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','48',NULL,'REFERENCE6 (Journal Entry Reference)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','49','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','49',NULL,'REFERENCE7 (Journal Entry Reversal flag)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','50','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','50',NULL,'REFERENCE8 (Journal Entry Reversal Period)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','51','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','51',NULL,'REFERENCE9 (Journal Reversal Method)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','52','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','52',NULL,'REFERENCE10 (Journal Entry Line Description)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','53','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','53',NULL,'Reference column 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','54','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','54',NULL,'Reference column 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','55','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','55',NULL,'Reference column 3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','56','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','56',NULL,'Reference column 4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','57','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','57',NULL,'Reference column 5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','58','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','58',NULL,'Reference column 6',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','59','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','59',NULL,'Reference column 7',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','60','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','60',NULL,'Reference column 8',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','61','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','61',NULL,'Reference column 9',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','62','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','62',NULL,'Reference column 10',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','63','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','63',NULL,'Statistical Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','64','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','64',NULL,'Currency Conversion Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','65','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','65',NULL,'Currency Conversion Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','66','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','66',NULL,'Currency Conversion Rate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','67','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','67',NULL,'Interface Group Identifier',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','68','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','68',NULL,'Context field for Journal Entry Line DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','69','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','69',NULL,'ATTRIBUTE1 Value for Journal Entry Line DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','70','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','70',NULL,'ATTRIBUTE2 Value for Journal Entry Line DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','71','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','71',NULL,'Attribute3 Value for Journal Entry Line DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','72','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','72',NULL,'Attribute4 Value for Journal Entry Line DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','73','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','73',NULL,'Attribute5 Value for Journal Entry Line DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','74','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','74',NULL,'Attribute6 Value for Journal Entry Line DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','75','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','75',NULL,'Attribute7 Value for Journal Entry Line DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','76','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','76',NULL,'Attribute8 Value for Journal Entry Line DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','77','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','77',NULL,'Attribute9 Value for Journal Entry Line DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','78','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','78',NULL,'Attribute10 Value for Journal Entry Line DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','79','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','79',NULL,'Attribute11 Value for Captured Information DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','80','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','80',NULL,'Attribute12 Value for Captured Information DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','81','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','81',NULL,'Attribute13 Value for Captured Information DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','82','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','82',NULL,'Attribute14 Value for Captured Information DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','83','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','83',NULL,'Attribute15 Value for Captured Information DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','84','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','84',NULL,'Attribute16 Value for Captured Information DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','85','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','85',NULL,'Attribute17 Value for Captured Information DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','86','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','86',NULL,'Attribute18 Value for Captured Information DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','87','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','87',NULL,'Attribute19 Value for Captured Information DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','88','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','88',NULL,'Attribute20 Value for Captured Information DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','89','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','89',NULL,'Context field for Captured Information DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','90','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','90',NULL,'Average Journal Flag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','91','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','91',NULL,'Clearing Company',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','92','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','92',NULL,'Ledger Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','93','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','93',NULL,'Encumbrance Type ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','94','(''SS''=''T,'')','EORCLGLACCZ0','50','D','10','94',NULL,'Reconciliation Reference',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"END"','95','(''DA''=''T'')','EORCLGLACCZ0','50','D','10','95',NULL,'END Column',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Accrural 14','201908169','EMPEXPORT','ACCRUE14',NULL,'EORCLGLACC',NULL,NULL,NULL,'201908169','Aug 15 2019  1:54PM','Aug 15 2019  1:54PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Accrural 14 Test','201908169','EMPEXPORT','ACCRU14TST',NULL,'EORCLGLACC',NULL,NULL,NULL,'201908169','Aug 15 2019  1:54PM','Aug 15 2019  1:54PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Accrural 10','201908169','EMPEXPORT','ACCRUE10',NULL,'EORCLGLACC',NULL,NULL,NULL,'201908169','Aug 15 2019  1:54PM','Aug 15 2019  1:54PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Accrural 10 Test','201908169','EMPEXPORT','ACCRU10TST',NULL,'EORCLGLACC',NULL,NULL,NULL,'201908169','Aug 15 2019  1:54PM','Aug 15 2019  1:54PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Actual','201908169','EMPEXPORT','ONDEMAND',NULL,'EORCLGLACC',NULL,NULL,NULL,'201908169','Aug 15 2019  1:54PM','Aug 15 2019  1:54PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Actual Test','201908169','EMPEXPORT','ACTTEST',NULL,'EORCLGLACC',NULL,NULL,NULL,'201908169','Aug 15 2019  1:54PM','Aug 15 2019  1:54PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLGLACC','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLGLACC','ExportPath','V','\\us.saas\n0\data_exchange\ACC1011\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLGLACC','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLGLACC','MultFile','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLGLACC','NoEmpty','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLGLACC','OnDemandPath','V','\\us.saas\n0\data_exchange\ACC1011\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLGLACC','SubSort','C','drvSubSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLGLACC','SubSort2','C','drvSubSort2');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLGLACC','SubSort3','C','drvSubSort3');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLGLACC','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLGLACC','TestPath','V','\\us.saas\N3\Public\ACC1011\Exports\GL\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLGLACC','UDESPath','C','\\us.saas\n0\data_exchange\ACC1011\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLGLACC','UseFileName','V','Y');
UPDATE dbo.U_dsi_Configuration SET CfgValue = '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\' WHERE FormatCode = 'EORCLGLACC' AND CfgName = 'ExportPath' AND CfgValue IS NULL;
UPDATE dbo.U_dsi_Configuration SET CfgValue = svCfgValue FROM dbo.U_EORCLGLACC_SavePath WHERE CfgName = svCfgName AND FormatCode = svFormatCode AND svCfgValue IS NOT NULL;
IF OBJECT_ID('U_EORCLGLACC_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EORCLGLACC_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLGLACC','D10','dbo.U_EORCLGLACC_drvTbl_D10',NULL);
IF OBJECT_ID('U_EORCLGLACC_Audit') IS NULL
CREATE TABLE [dbo].[U_EORCLGLACC_Audit] (
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
IF OBJECT_ID('U_EORCLGLACC_AuditFields') IS NULL
CREATE TABLE [dbo].[U_EORCLGLACC_AuditFields] (
    [aTableName] varchar(30) NULL,
    [aFieldName] varchar(30) NULL
);
IF OBJECT_ID('U_EORCLGLACC_EEList') IS NULL
CREATE TABLE [dbo].[U_EORCLGLACC_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EORCLGLACC_File') IS NULL
CREATE TABLE [dbo].[U_EORCLGLACC_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(3000) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_AfterCollect_EORCLGLACC]
AS
SET NOCOUNT ON;
BEGIN

    --==========================================
    -- Declare variables
    --==========================================
    DECLARE @FormatCode      VARCHAR(10)
        ,@ExportCode         VARCHAR(10)
        ,@ExportPath         VARCHAR(500)
        ,@dbName             VARCHAR(50)
        ,@NoEmpty            CHAR(1)
        ,@sCmd               VARCHAR(1000)
        ,@QueryInfo          VARCHAR(1000)
        ,@RowCount           INT;

    -- Set variables
    SET @FormatCode = 'EORCLGLACC';

    SELECT @ExportCode = ExportCode
       ,@ExportPath = CASE WHEN dbo.dsi_fnVariable(@FormatCode,'IsUTF8') = 'Y' THEN dbo.dsi_fnVariable(@FormatCode,'UTF8Path') -- If using UTF8 Converter, then use UTF8Path instead of ExportPath
                           WHEN (@ExportCode LIKE '%TEST%' OR @ExportCode LIKE '%TST%' OR dbo.dsi_fnVariable(@FormatCode,'Testing') = 'Y') AND dbo.dsi_fnVariable(@FormatCode,'TestPath') IS NOT NULL THEN dbo.dsi_fnVariable(@FormatCode,'TestPath')
                           WHEN @ExportCode LIKE '%OE%' AND dbo.dsi_fnVariable(@FormatCode,'OEPath') IS NOT NULL THEN dbo.dsi_fnVariable(@FormatCode,'OEPath')
                           WHEN @ExportCode IN ('ONDEMAND','ON_DEMAND', 'ACCRUE14') AND dbo.dsi_fnVariable(@FormatCode,'OnDemandPath') IS NOT NULL THEN dbo.dsi_fnVariable(@FormatCode,'OnDemandPath')
                           ELSE dbo.dsi_fnVariable(@FormatCode,'ExportPath')
                      END
       ,@dbName     = RTRIM(DB_NAME())
       ,@NoEmpty    = dbo.dsi_fnVariable(FormatCode,'NoEmpty')
    FROM dbo.U_dsi_Parameters WITH (NOLOCK)
    WHERE FormatCode = @FormatCode;

    -- =================================================
    -- Define Filenames By Header & Detail ID in File
    -- =================================================

    DECLARE @FilesOut AS TABLE
    (
         RowID               INT IDENTITY(1,1)
        ,RecordSetGroup      VARCHAR(100)
        ,CustomFileName      VARCHAR(1000)
        ,CompanyCode         VARCHAR(10)
    );

    INSERT INTO @FilesOut (RecordSetGroup, CompanyCode, CustomFileName)
    SELECT DISTINCT RecordSetGroup = 'D10', CompanyCode = RTRIM(LTRIM(drvInitialSort)), CustomFileName = CONCAT('GL_ULTIPRO_PYRL_', FORMAT(GETDATE(), 'yyyyMMdd_hhmmss'), '.csv')
    FROM dbo.U_EORCLGLACC_drvTbl_D10

    SET @RowCount = (SELECT COUNT(*) FROM @FilesOut);

    -- ==================================================    
    -- Generate Multiple Files via Custom BCP statement:
    -- ==================================================    
    -- Declare variables
    DECLARE  @RecordSetGroup  VARCHAR(100)
        ,@FileName            VARCHAR(100)
        ,@LoopCount           INT
        ,@CompanyCode          VARCHAR(10);

    SET @LoopCount = 1;

    -- Begin Process of Exporting Multiple Files
    WHILE @LoopCount <= @RowCount
    BEGIN

    -- Set FileName to Export Based On Record Set Group (Header,Detail,Trailer Records)
    SELECT 
         @RecordSetGroup = RecordSetGroup
        ,@FileName = CustomFileName
        ,@CompanyCode = CompanyCode
    FROM @FilesOut
    WHERE RowID = @LoopCount;

    -- Set Query To Be Exported
    SET @QueryInfo = '"SELECT TOP 2000000 Data FROM '+ RTRIM(DB_NAME()) + '.dbo.U_' + @FormatCode + '_File WITH (NOLOCK) '
                        + 'WHERE InitialSort IN (''' + REPLACE(@CompanyCode,',',''',''') + ''') OR InitialSort = ' + '''1'''
                        + 'ORDER BY RIGHT(RECORDSET,2), InitialSort, SubSort"';

    -- Set Custom BCP Statement
    SELECT @sCmd = 'BCP ' + @QueryInfo + ' QUERYOUT "' + @ExportPath + @FileName +'"' + 
              ' -S"' + RTRIM(@@SERVERNAME) + '" -T -c';
    
    IF (dbo.dsi_fnVariable(@FormatCode,'Testing') = 'Y')
    BEGIN
        PRINT 'Custom BCP For File# ' + CONVERT(VARCHAR(2),@LoopCount) + ': ' + ISNULL(@FileName,'');
        PRINT 'Custom BCP Statement: ' + ISNULL(@sCmd,'');
    END;

    -- Get Record Count
    DECLARE @RecordCnt INT, @Query NVARCHAR(1000);
    SET @Query = N'SELECT @RecordCount = COUNT(*) FROM '+ RTRIM(DB_NAME()) + '.dbo.U_' + @FormatCode + '_File WITH (NOLOCK) WHERE RECORDSET IN (''' + REPLACE(@RecordSetGroup,',',''',''') + ''')';
    EXECUTE master.dbo.sp_executesql @Query, N'@RecordCount INT OUTPUT',  @RecordCount = @RecordCnt OUTPUT;

    IF @RecordCnt = 0 AND @NoEmpty = 'Y'
    BEGIN
        IF (dbo.dsi_fnVariable(@FormatCode,'Testing') = 'Y')
        BEGIN
            PRINT 'There are no records in the file, so no file will be created.'
        END
    END ELSE BEGIN
        -- Output File
        EXEC master.dbo.xp_cmdshell @sCmd, NO_OUTPUT;
    END;

    -- Get Next FileName
    SET @LoopCount = @LoopCount + 1;

    END;

END;
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EORCLGLACC]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: R1 RCM Inc.

Created By: Wyle Cordero
Business Analyst: Dian Turner
Create Date: 08/15/2019
Service Request Number: SR-2019-00241878

Purpose: To export GL and GL Accrual data for the purposes of importing into Oracle.

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2019     SR-2019-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EORCLGLACC';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EORCLGLACC';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EORCLGLACC';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EORCLGLACC';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EORCLGLACC' ORDER BY RunID DESC;

Job Ownership Scripts
---------------------
-- Set job owner to ssis_user for Production jobs
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 0;

-- Set job owner to self, to make changes in SQL Job Scheduler. Remember to re-run the above script to change ownership to ssis_user when complete
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 1;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EORCLGLACC', 'ACCRUE14';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EORCLGLACC', 'ACCRU14TST'

EXEC dbo.dsi_sp_TestSwitchbox_v2 'EORCLGLACC', 'ACCRUE10';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EORCLGLACC', 'ACCRU10TST'

EXEC dbo.dsi_sp_TestSwitchbox_v2 'EORCLGLACC', 'ONDEMAND';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EORCLGLACC', 'ACTTEST';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'EORCLGLACC', @AllObjects = 'Y', @IsWeb = 'N'
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
            ,@EndPerControl     VARCHAR(9)
            ,@ExportFile        VARCHAR(9)
			,@Accrue INT; 

    -- Set FormatCode
    SELECT @FormatCode = 'EORCLGLACC';

    -- Declare dates from Parameter file
    SELECT
         @StartPerControl = StartPerControl
        ,@EndPerControl   = EndPerControl
        ,@StartDate       = LEFT(StartPerControl,8)
        ,@EndDate         = LEFT(EndPerControl,8)
        ,@ExportCode      = ExportCode
        ,@ExportFile      = ExportFile -- User will enter number of days to accrue.
    FROM dbo.U_dsi_Parameters WITH (NOLOCK)
    WHERE FormatCode = @FormatCode;

	SET @Accrue = CASE WHEN @ExportCode LIKE '%10%' THEN 10 ELSE 14 END;

    --==========================================
    -- Clean EE List 
    -- Caution: Careful of cleaning EE List if including paycheck data
    --==========================================

    -- Cleans EE List of terms where EE active in another company (transfer), or active in more than one company
    DELETE FROM dbo.U_EORCLGLACC_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_EORCLGLACC_EEList GROUP BY xEEID HAVING COUNT(1) > 1);


    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_EORCLGLACC_drvTbl_D10
    ---------------------------------
    IF @ExportCode IN ('ONDEMAND', 'ACTTEST') BEGIN
        IF OBJECT_ID('U_EORCLGLACC_drvTbl_D10','U') IS NOT NULL
            DROP TABLE dbo.U_EORCLGLACC_drvTbl_D10;
        SELECT DISTINCT
            drvInitialSort = MAX(CmpCompanyCode)
            ,drvSubSort = MAX(LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3))
            ,drvSubSort2 = MAX(SUBSTRING(RTRIM(LTRIM(vGLAcctNumber)), 5, 4))
            ,drvSubSort3 = vGLAcctNumber
			,drvAccrueBy = @Accrue
            -- standard fields above and additional driver fields below
            ,drvLedgerID = '300000001752245'
            ,drvPayDate = MAX(vPerControlDate)
            ,drvFileCreationDate = GETDATE()
            ,drvSegment1 = MAX(
				CASE
					WHEN (LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3) = '261' AND SUBSTRING(RTRIM(LTRIM(vGLAcctNumber)), 10, 5) = '11107') THEN LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3)
					WHEN LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3) = '261' THEN vOrglLvl3Seg 
					WHEN (LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3) = '101' AND SUBSTRING(RTRIM(LTRIM(vGLAcctNumber)), 10, 5) = '11103') THEN LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3)
					WHEN LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3) = '101' THEN vOrglLvl3Seg 
					ELSE LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3) 
				END)
            ,drvSegment2 = MAX(SUBSTRING(RTRIM(LTRIM(vGLAcctNumber)), 5, 4))
            ,drvSegment3 = MAX(SUBSTRING(RTRIM(LTRIM(vGLAcctNumber)), 10, 5))
			,drvSegment4 = MAX(RIGHT(RTRIM(LTRIM(vGLAcctNumber)), 4))
            ,drvDebitAmnt = CONVERT(VARCHAR, SUM(CASE WHEN vDebitAmt = 0.00 THEN NULL ELSE CAST(vDebitAmt AS DECIMAL(15,2)) END))
            ,drvCreditAmnt = CONVERT(VARCHAR, SUM(CASE WHEN vCreditAmt = 0.00 THEN NULL ELSE CAST(vCreditAmt AS DECIMAL(15,2)) END))
            ,drvReference1 = MAX(CONCAT('UltiPro - Payroll and Benefits: Year ', LEFT(vPerControl, 4), ',', 'Period ', SUBSTRING(vPerControl, 5, 2)))
            ,drvReference4 = MAX(CONCAT('PAYROL_', LEFT(vPerControl, 6)))
        INTO dbo.U_EORCLGLACC_drvTbl_D10
		FROM dbo.U_EORCLGLACC_EEList WITH (NOLOCK)
        INNER JOIN dbo.vw_Dsi_Tmpalloc WITH (NOLOCK)
			ON vEEID = xEEID
			AND vCoID = xCoID
        INNER JOIN dbo.Company WITH (NOLOCK)
            ON vCoID = CmpCoID
        WHERE vPerControl BETWEEN @StartPerControl AND @EndPerControl
        GROUP BY vGLAcctNumber, vOrigAcctType
        HAVING(SUM(vDebitAmt) <> 0.00
			OR SUM(vCreditAmt) <> 0.00)
		OPTION (FORCE ORDER);
    END;
    ELSE BEGIN
        --SET @ExportFile = '10'
        IF OBJECT_ID('U_EORCLGLACC_drvTbl_D10','U') IS NOT NULL
            DROP TABLE dbo.U_EORCLGLACC_drvTbl_D10;
        SELECT DISTINCT
            drvInitialSort = MAX(CmpCompanyCode)
            ,drvSubSort = MAX(LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3))
            ,drvSubSort2 = MAX(SUBSTRING(RTRIM(LTRIM(vGLAcctNumber)), 5, 4))
            ,drvSubSort3 = vGLAcctNumber
			,drvAccrueBy = @Accrue
            -- standard fields above and additional driver fields below
            ,drvLedgerID = '300000001752245'
            ,drvPayDate = MAX(vPerControlDate)
            ,drvFileCreationDate = GETDATE()
            ,drvSegment1 = MAX(
				CASE
					WHEN (LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3) = '261' AND SUBSTRING(RTRIM(LTRIM(vGLAcctNumber)), 10, 5) = '11107') THEN LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3)
					WHEN LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3) = '261' THEN vOrglLvl3Seg 
					WHEN (LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3) = '101' AND SUBSTRING(RTRIM(LTRIM(vGLAcctNumber)), 10, 5) = '11103') THEN LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3)
					WHEN LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3) = '101' THEN vOrglLvl3Seg 
					ELSE LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3) 
				END)
            ,drvSegment2 = MAX(SUBSTRING(RTRIM(LTRIM(vGLAcctNumber)), 5, 4))
            ,drvSegment3 = MAX(SUBSTRING(RTRIM(LTRIM(vGLAcctNumber)), 10, 5))
			,drvSegment4 = MAX(RIGHT(RTRIM(LTRIM(vGLAcctNumber)), 4))
            ,drvDebitAmnt = CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), SUM(vDebitAmt) * (CASE WHEN ISNUMERIC(@ExportFile) = 1 THEN (CAST(@ExportFile AS DECIMAL(15,2)) / @Accrue) END)))
            ,drvCreditAmnt = CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), SUM(vCreditAmt) * (CASE WHEN ISNUMERIC(@ExportFile) = 1 THEN (CAST(@ExportFile AS DECIMAL(15,2)) / @Accrue) END)))
            ,drvReference1 = MAX(CONCAT('UltiPro - Payroll and Benefits: Year ', LEFT(vPerControl, 4), ',', 'Period ', SUBSTRING(vPerControl, 5, 2)))
            ,drvReference4 = MAX(CONCAT('PAYROL_', LEFT(vPerControl, 6)))
        INTO dbo.U_EORCLGLACC_drvTbl_D10
		FROM dbo.U_EORCLGLACC_EEList WITH (NOLOCK)
        INNER JOIN dbo.vw_Dsi_Tmpalloc WITH (NOLOCK)
			ON vEEID = xEEID
			AND vCoID = xCoID
        INNER JOIN dbo.Company WITH (NOLOCK)
            ON vCoID = CmpCoID
        WHERE vPerControl BETWEEN @StartPerControl AND @EndPerCOntrol
        AND vGLCodeType IN ('EE', 'DR')
        GROUP BY vGLAcctNumber, vOrigAcctType
        HAVING(SUM(CASE WHEN ISNUMERIC(@ExportFile) = 1 THEN vDebitAmt * (CAST(@ExportFile AS FLOAT) / @Accrue) ELSE 0.00 END) <> 0.00
			OR SUM(CASE WHEN ISNUMERIC(@ExportFile) = 1 THEN vCreditAmt * (CAST(@ExportFile AS FLOAT) / @Accrue) ELSE 0.00 END) <> 0.00)

		UNION ALL -- Need opesite signs of the expenses to balance the expenses.

        SELECT DISTINCT
            drvInitialSort = MAX(CmpCompanyCode)
            ,drvSubSort = MAX(LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3))
            ,drvSubSort2 = MAX(SUBSTRING(RTRIM(LTRIM(vGLAcctNumber)), 5, 4))
            ,drvSubSort3 = vGLAcctNumber
			,drvAccrueBy = @Accrue
            -- standard fields above and additional driver fields below
            ,drvLedgerID = '300000001752245'
            ,drvPayDate = MAX(vPerControlDate)
            ,drvFileCreationDate = GETDATE()
            ,drvSegment1 = MAX(
				CASE
					WHEN (LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3) = '261' AND SUBSTRING(RTRIM(LTRIM(vGLAcctNumber)), 10, 5) = '11107') THEN LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3)
					WHEN LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3) = '261' THEN vOrglLvl3Seg 
					WHEN (LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3) = '101' AND SUBSTRING(RTRIM(LTRIM(vGLAcctNumber)), 10, 5) = '11103') THEN LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3)
					WHEN LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3) = '101' THEN vOrglLvl3Seg 
					ELSE LEFT(RTRIM(LTRIM(vGLAcctNumber)), 3) 
				END)
            ,drvSegment2 = '5121'
            ,drvSegment3 = '21501'
			,drvSegment4 = '0000'
            ,drvDebitAmnt = CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), SUM(vDebitAmt) * (CASE WHEN ISNUMERIC(@ExportFile) = 1 THEN (CAST(@ExportFile AS DECIMAL(15,2)) / @Accrue) END)) * -1)
            ,drvCreditAmnt = CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), SUM(vCreditAmt) * (CASE WHEN ISNUMERIC(@ExportFile) = 1 THEN (CAST(@ExportFile AS DECIMAL(15,2)) / @Accrue) END)) * -1)
            ,drvReference1 = MAX(CONCAT('UltiPro - Payroll and Benefits: Year ', LEFT(vPerControl, 4), ',', 'Period ', SUBSTRING(vPerControl, 5, 2)))
            ,drvReference4 = MAX(CONCAT('PAYROL_', LEFT(vPerControl, 6)))
		FROM dbo.U_EORCLGLACC_EEList WITH (NOLOCK)
        INNER JOIN dbo.vw_Dsi_Tmpalloc WITH (NOLOCK)
			ON vEEID = xEEID
			AND vCoID = xCoID
        INNER JOIN dbo.Company WITH (NOLOCK)
            ON vCoID = CmpCoID
        WHERE vPerControl BETWEEN @StartPerControl AND @EndPerCOntrol
        AND vGLCodeType IN ('EE', 'DR')
        GROUP BY vGLAcctNumber, vOrigAcctType
        HAVING(SUM(CASE WHEN ISNUMERIC(@ExportFile) = 1 THEN vDebitAmt * (CAST(@ExportFile AS FLOAT) / @Accrue) ELSE 0.00 END) <> 0.00
			OR SUM(CASE WHEN ISNUMERIC(@ExportFile) = 1 THEN vCreditAmt * (CAST(@ExportFile AS FLOAT) / @Accrue) ELSE 0.00 END) <> 0.00)
		OPTION (FORCE ORDER);

    END;


END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwEORCLGLACC_Export AS
    SELECT TOP 200000000 Data FROM dbo.U_EORCLGLACC_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort, SubSort2, SubSort3

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'EORCLGLACC%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202005291'
       ,expStartPerControl     = '202005291'
       ,expLastEndPerControl   = '202005299'
       ,expEndPerControl       = '202005299'
WHERE expFormatCode = 'EORCLGLACC';

**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwEORCLGLACC_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_EORCLGLACC_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort, SubSort2, SubSort3
