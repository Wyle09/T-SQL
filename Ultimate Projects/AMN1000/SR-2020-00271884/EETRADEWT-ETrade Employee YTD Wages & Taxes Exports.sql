SET NOCOUNT ON;
IF OBJECT_ID('U_EETRADEWT_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EETRADEWT_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EETRADEWT_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EETRADEWT' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEETRADEWT_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEETRADEWT_Export];
GO
IF OBJECT_ID('dsi_vwEETRADEW_supptaxrates') IS NOT NULL DROP VIEW [dbo].[dsi_vwEETRADEW_supptaxrates]
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EETRADEWT') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EETRADEWT];
GO
IF OBJECT_ID('U_EETRADEWT_YTDWithHeld_PTaxHist') IS NOT NULL DROP TABLE [dbo].[U_EETRADEWT_YTDWithHeld_PTaxHist];
GO
IF OBJECT_ID('U_EETRADEWT_YTDWithHeld_PEarHist') IS NOT NULL DROP TABLE [dbo].[U_EETRADEWT_YTDWithHeld_PEarHist];
GO
IF OBJECT_ID('U_EETRADEWT_AccountTax_PTaxHist') IS NOT NULL DROP TABLE [dbo].[U_EETRADEWT_AccountTax_PTaxHist];
GO
IF OBJECT_ID('U_EETRADEWT_File') IS NOT NULL DROP TABLE [dbo].[U_EETRADEWT_File];
GO
IF OBJECT_ID('U_EETRADEWT_EEList') IS NOT NULL DROP TABLE [dbo].[U_EETRADEWT_EEList];
GO
IF OBJECT_ID('U_EETRADEWT_DrvTbl_YTDWithHeld_H01') IS NOT NULL DROP TABLE [dbo].[U_EETRADEWT_DrvTbl_YTDWithHeld_H01];
GO
IF OBJECT_ID('U_EETRADEWT_DrvTbl_YTDWithHeld_D11') IS NOT NULL DROP TABLE [dbo].[U_EETRADEWT_DrvTbl_YTDWithHeld_D11];
GO
IF OBJECT_ID('U_EETRADEWT_DrvTbl_AccountTax_H02') IS NOT NULL DROP TABLE [dbo].[U_EETRADEWT_DrvTbl_AccountTax_H02];
GO
IF OBJECT_ID('U_EETRADEWT_DrvTbl_AccountTax_D12') IS NOT NULL DROP TABLE [dbo].[U_EETRADEWT_DrvTbl_AccountTax_D12];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EETRADEWT';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EETRADEWT';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EETRADEWT';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EETRADEWT';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EETRADEWT';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhRespectZeroPayRate,AdhCreateTClockBatches,AdhThirdPartyPay) VALUES ('N','C','Y','0','','','N','','N','','013010','EMPEXPORT','CDE','EETRADEWT','ETrade Employee YTD Wages & Taxes Exports','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','4000','S','N','EETRADEWT0Z0','N','Jan  1 1900 12:00AM','C','N',NULL,'N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAccountID"','1','(''UA''=''T,'')','EETRADEWT0Z0','50','H','01','1',NULL,'Account ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax Description"','2','(''DA''=''T,'')','EETRADEWT0Z0','50','H','01','2',NULL,'Tax Description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD Withheld"','3','(''DA''=''T,'')','EETRADEWT0Z0','50','H','01','3',NULL,'YTD Withheld',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Last/Family Name1"','4','(''DA''=''T,'')','EETRADEWT0Z0','50','H','01','4',NULL,'Last/Family Name1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD Supplemental Wages"','5','(''DA''=''T,'')','EETRADEWT0Z0','50','H','01','5',NULL,'YTD Supplemental Wages',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD Wages"','6','(''DA''=''T'')','EETRADEWT0Z0','50','H','01','6',NULL,'YTD Wages',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAccountID"','1','(''UA''=''T,'')','EETRADEWT0Z0','50','H','02','1',NULL,'Account ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax Jurisdiction"','2','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','2',NULL,'Tax Jurisdiction',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 1 Description1"','3','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','3',NULL,'Tax 1 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 1 Rate1"','4','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','4',NULL,'Tax 1 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 1 Max1"','5','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','5',NULL,'Tax 1 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 2 Description1"','6','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','6',NULL,'Tax 2 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 2 Rate1"','7','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','7',NULL,'Tax 2 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 2 Max 1"','8','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','8',NULL,'Tax 2 Max 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 3 Description1"','9','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','9',NULL,'Tax 3 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 3 Rate1"','10','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','10',NULL,'Tax 3 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 3 Max1"','11','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','11',NULL,'Tax 3 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 4 Description1"','12','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','12',NULL,'Tax 4 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 4 Rate1"','13','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','13',NULL,'Tax 4 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 4 Max1"','14','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','14',NULL,'Tax 4 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 5 Description1"','15','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','15',NULL,'Tax 5 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 5 Rate1"','16','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','16',NULL,'Tax 5 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 5 Max1"','17','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','17',NULL,'Tax 5 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 6 Description1"','18','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','18',NULL,'Tax 6 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 6 Rate1"','19','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','19',NULL,'Tax 6 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 6 Max1"','20','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','20',NULL,'Tax 6 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 7 Description1"','21','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','21',NULL,'Tax 7 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 7 Rate1"','22','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','22',NULL,'Tax 7 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 7 Max1"','23','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','23',NULL,'Tax 7 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 8 Description1"','24','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','24',NULL,'Tax 8 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 8 Rate1"','25','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','25',NULL,'Tax 8 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 8 Max1"','26','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','26',NULL,'Tax 8 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 9 Description1"','27','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','27',NULL,'Tax 9 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 9 Rate1"','28','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','28',NULL,'Tax 9 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 9 Max1"','29','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','29',NULL,'Tax 9 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 10 Description1"','30','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','30',NULL,'Tax 10 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 10 Rate1"','31','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','31',NULL,'Tax 10 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 10 Max1"','32','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','32',NULL,'Tax 10 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 11 Description1"','33','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','33',NULL,'Tax 11 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 11 Rate1"','34','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','34',NULL,'Tax 11 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 11 Max1"','35','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','35',NULL,'Tax 11 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 12 Description1"','36','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','36',NULL,'Tax 12 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 12 Rate1"','37','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','37',NULL,'Tax 12 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 12 Max1"','38','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','38',NULL,'Tax 12 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 13 Description1"','39','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','39',NULL,'Tax 13 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 13 Rate1"','40','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','40',NULL,'Tax 13 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 13 Max1"','41','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','41',NULL,'Tax 13 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 14 Description1"','42','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','42',NULL,'Tax 14 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 14 Rate1"','43','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','43',NULL,'Tax 14 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 14 Max1"','44','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','44',NULL,'Tax 14 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 15 Description1"','45','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','45',NULL,'Tax 15 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 15 Rate1"','46','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','46',NULL,'Tax 15 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 15 Max1"','47','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','47',NULL,'Tax 15 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 16 Description1"','48','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','48',NULL,'Tax 16 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 16 Rate1"','49','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','49',NULL,'Tax 16 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 16 Max1"','50','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','50',NULL,'Tax 16 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 17 Description1"','51','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','51',NULL,'Tax 17 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 17 Rate1"','52','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','52',NULL,'Tax 17 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 17 Max1"','53','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','53',NULL,'Tax 17 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 18 Description1"','54','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','54',NULL,'Tax 18 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 18 Rate1"','55','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','55',NULL,'Tax 18 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 18 Max1"','56','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','56',NULL,'Tax 18 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 19 Description1"','57','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','57',NULL,'Tax 19 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 19 Rate1"','58','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','58',NULL,'Tax 19 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 19 Max1"','59','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','59',NULL,'Tax 19 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 20 Description1"','60','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','60',NULL,'Tax 20 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 20 Rate1"','61','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','61',NULL,'Tax 20 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 20 Max1"','62','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','62',NULL,'Tax 20 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 21 Description1"','63','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','63',NULL,'Tax 21 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 21 Rate1"','64','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','64',NULL,'Tax 21 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 21 Max1"','65','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','65',NULL,'Tax 21 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 22 Description1"','66','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','66',NULL,'Tax 22 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 22 Rate1"','67','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','67',NULL,'Tax 22 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 22 Max1"','68','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','68',NULL,'Tax 22 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 23 Description1"','69','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','69',NULL,'Tax 23 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 23 Rate1"','70','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','70',NULL,'Tax 23 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 23 Max1"','71','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','71',NULL,'Tax 23 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 24 Description1"','72','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','72',NULL,'Tax 24 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 24 Rate1"','73','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','73',NULL,'Tax 24 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 24 Max1"','74','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','74',NULL,'Tax 24 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 25 Description1"','75','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','75',NULL,'Tax 25 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 25 Rate1"','76','(''DA''=''T,'')','EETRADEWT0Z0','50','H','02','76',NULL,'Tax 25 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Tax 25 Max1"','77','(''DA''=''T'')','EETRADEWT0Z0','50','H','02','77',NULL,'Tax 25 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','1','(''UA''=''T,'')','EETRADEWT0Z0','50','D','11','1',NULL,'Account ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTaxDescription"','2','(''UA''=''T,'')','EETRADEWT0Z0','50','D','11','2',NULL,'Tax Description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDWithHeld"','3','(''UA''=''T,'')','EETRADEWT0Z0','50','D','11','3',NULL,'YTD Withheld',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','4','(''UA''=''T,'')','EETRADEWT0Z0','50','D','11','4',NULL,'Last/Family Name1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDSupplementalWages"','5','(''UA''=''T,'')','EETRADEWT0Z0','50','D','11','5',NULL,'YTD Supplemental Wages',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDWages"','6','(''UA''=''T'')','EETRADEWT0Z0','50','D','11','6',NULL,'YTD Wages',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','1','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','1',NULL,'Account ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Domestic"','2','(''DA''=''T,'')','EETRADEWT0Z0','50','D','12','2',NULL,'Tax Jurisdiction',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax1Description"','3','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','3',NULL,'Tax 1 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax1Rate"','4','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','4',NULL,'Tax 1 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax1Max"','5','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','5',NULL,'Tax 1 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax2Description"','6','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','6',NULL,'Tax 2 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax2Rate"','7','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','7',NULL,'Tax 2 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax2Max"','8','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','8',NULL,'Tax 2 Max 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax3Description"','9','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','9',NULL,'Tax 3 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax3Rate"','10','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','10',NULL,'Tax 3 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax3Max"','11','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','11',NULL,'Tax 3 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax4Description"','12','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','12',NULL,'Tax 4 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax4Rate"','13','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','13',NULL,'Tax 4 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax4Max"','14','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','14',NULL,'Tax 4 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax5Description"','15','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','15',NULL,'Tax 5 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax5Rate"','16','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','16',NULL,'Tax 5 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax5Max"','17','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','17',NULL,'Tax 5 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax6Description"','18','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','18',NULL,'Tax 6 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax6Rate"','19','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','19',NULL,'Tax 6 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax6Max"','20','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','20',NULL,'Tax 6 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax7Description"','21','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','21',NULL,'Tax 7 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax7Rate"','22','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','22',NULL,'Tax 7 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax7Max"','23','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','23',NULL,'Tax 7 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax8Description"','24','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','24',NULL,'Tax 8 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax8Rate"','25','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','25',NULL,'Tax 8 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax8Max"','26','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','26',NULL,'Tax 8 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax9Description"','27','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','27',NULL,'Tax 9 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax9Rate"','28','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','28',NULL,'Tax 9 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax9Max"','29','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','29',NULL,'Tax 9 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax10Description"','30','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','30',NULL,'Tax 10 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax10Rate"','31','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','31',NULL,'Tax 10 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax10Max"','32','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','32',NULL,'Tax 10 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax11Description"','33','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','33',NULL,'Tax 11 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax11Rate"','34','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','34',NULL,'Tax 11 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax11Max"','35','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','35',NULL,'Tax 11 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax12Description"','36','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','36',NULL,'Tax 12 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax12Rate"','37','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','37',NULL,'Tax 12 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTax12Max"','38','(''UA''=''T,'')','EETRADEWT0Z0','50','D','12','38',NULL,'Tax 12 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','39','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','39',NULL,'Tax 13 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','40','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','40',NULL,'Tax 13 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','41','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','41',NULL,'Tax 13 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','42','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','42',NULL,'Tax 14 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','43','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','43',NULL,'Tax 14 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','44','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','44',NULL,'Tax 14 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','45','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','45',NULL,'Tax 15 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','46','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','46',NULL,'Tax 15 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','47','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','47',NULL,'Tax 15 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','48','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','48',NULL,'Tax 16 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','49','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','49',NULL,'Tax 16 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','50','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','50',NULL,'Tax 16 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','51','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','51',NULL,'Tax 17 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','52','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','52',NULL,'Tax 17 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','53','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','53',NULL,'Tax 17 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','54','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','54',NULL,'Tax 18 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','55','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','55',NULL,'Tax 18 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','56','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','56',NULL,'Tax 18 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','57','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','57',NULL,'Tax 19 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','58','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','58',NULL,'Tax 19 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','59','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','59',NULL,'Tax 19 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','60','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','60',NULL,'Tax 20 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','61','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','61',NULL,'Tax 20 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','62','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','62',NULL,'Tax 20 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','63','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','63',NULL,'Tax 21 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','64','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','64',NULL,'Tax 21 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','65','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','65',NULL,'Tax 21 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','66','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','66',NULL,'Tax 22 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','67','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','67',NULL,'Tax 22 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','68','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','68',NULL,'Tax 22 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','69','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','69',NULL,'Tax 23 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','70','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','70',NULL,'Tax 23 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','71','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','71',NULL,'Tax 23 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','72','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','72',NULL,'Tax 24 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','73','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','73',NULL,'Tax 24 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','74','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','74',NULL,'Tax 24 Max1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','75','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','75',NULL,'Tax 25 Description1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','76','(''SS''=''T,'')','EETRADEWT0Z0','50','D','12','76',NULL,'Tax 25 Rate1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','77','(''SS''=''T'')','EETRADEWT0Z0','50','D','12','77',NULL,'Tax 25 Max1',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Etrade YTDWithHeld OnDemand','202006109','EMPEXPORT','YTDONDMD',NULL,'EETRADEWT',NULL,NULL,NULL,'202006109','Jun 10 2020 12:56PM','Jun 10 2020 12:56PM','202006101',NULL,'','','202006101',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Etrade YTDWithHeld Test','202006109','EMPEXPORT','YTDTST',NULL,'EETRADEWT',NULL,NULL,NULL,'202006109','Jun 10 2020 12:56PM','Jun 10 2020 12:56PM','202006101',NULL,'','','202006101',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Etrade Account OnDemand','202006109','EMPEXPORT','ACCTONDMD',NULL,'EETRADEWT',NULL,NULL,NULL,'202006109','Jun 10 2020 12:56PM','Jun 10 2020 12:56PM','202006101',NULL,'','','202006101',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Etrade Account Test','202006109','EMPEXPORT','ACCTTST',NULL,'EETRADEWT',NULL,NULL,NULL,'202006109','Jun 10 2020 12:56PM','Jun 10 2020 12:56PM','202006101',NULL,'','','202006101',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EETRADEWT','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EETRADEWT','ExportPath','V','\\us.saas\n0\data_exchange\AMN1000\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EETRADEWT','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EETRADEWT','OnDemandPath','V','\\us.saas\n0\data_exchange\AMN1000\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EETRADEWT','SubSort','C','drvSubSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EETRADEWT','Testing','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EETRADEWT','TestPath','V','\\us.saas\n2\Public\AMN1000\Exports\ETrade\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EETRADEWT','UDESPath','C','\\us.saas\n0\data_exchange\AMN1000\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EETRADEWT','UseFileName','V','N');
UPDATE dbo.U_dsi_Configuration SET CfgValue = '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\' WHERE FormatCode = 'EETRADEWT' AND CfgName = 'ExportPath' AND CfgValue IS NULL;
UPDATE dbo.U_dsi_Configuration SET CfgValue = svCfgValue FROM dbo.U_EETRADEWT_SavePath WHERE CfgName = svCfgName AND FormatCode = svFormatCode AND svCfgValue IS NOT NULL;
IF OBJECT_ID('U_EETRADEWT_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EETRADEWT_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EETRADEWT','H01','dbo.U_EETRADEWT_DrvTbl_YTDWithHeld_H01',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EETRADEWT','H02','dbo.U_EETRADEWT_DrvTbl_AccountTax_H02',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EETRADEWT','D11','dbo.U_EETRADEWT_DrvTbl_YTDWithHeld_D11',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EETRADEWT','D12','dbo.U_EETRADEWT_DrvTbl_AccountTax_D12',NULL);
IF OBJECT_ID('U_EETRADEWT_EEList') IS NULL
CREATE TABLE [dbo].[U_EETRADEWT_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EETRADEWT_File') IS NULL
CREATE TABLE [dbo].[U_EETRADEWT_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(4000) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EETRADEWT]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: AMN Healthcare, Inc.

Created By: Wyle Cordero
Business Analyst: Bridget Amsden
Create Date: 06/10/2020
Service Request Number: SR-2020-000271884

Purpose: ETrade Employee YTD Wages & Taxes Exports

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2020     SR-2020-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EETRADEWT';

-- I: drive:
UPDATE U_dsi_configuration
SET cfgvalue = dbo.dsi_fnVariable('EETRADEWT','TestPath') 
WHERE FormatCode = 'EETRADEWT'
AND cfgname IN ('ExportPath', 'OnDemandPath')

-- J: drive:
UPDATE U_dsi_configuration
SET cfgvalue = dbo.dsi_fnVariable('EETRADEWT','UDESpath') 
WHERE FormatCode = 'EETRADEWT'
AND CfgName IN ('ExportPath', 'OnDemandPath')


SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EETRADEWT';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EETRADEWT';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EETRADEWT';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EETRADEWT' ORDER BY RunID DESC;

Execute Export
--------------
-- YTD file
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EETRADEWT', 'YTDONDMD';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EETRADEWT', 'YTDTST';

-- Account & Tax File
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EETRADEWT', 'ACCTONDMD';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EETRADEWT', 'ACCTTST';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'EETRADEWT', @AllObjects = 'Y', @IsWeb = 'N'
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
    SELECT @FormatCode = 'EETRADEWT';

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
    DELETE FROM dbo.U_EETRADEWT_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_EETRADEWT_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

    -- Include employees with EecUDField21 = 'R'
    DELETE el
    FROM dbo.U_EETRADEWT_EEList el
    INNER JOIN dbo.EmpComp
        ON EecEEID = xEEID
        AND EecCoID = xCoID
        AND ISNULL(EecUDField21, '') <> 'R'
    ;

    -----------------------------
    -- Working Table - YTDWithHeld_PEarHist
    -----------------------------
    IF OBJECT_ID('U_EETRADEWT_YTDWithHeld_PEarHist','U') IS NOT NULL
        DROP TABLE dbo.U_EETRADEWT_YTDWithHeld_PEarHist;
    SELECT DISTINCT
            PehEEID
        ,PehCoID
        ,PehPayDate = MAX(PrgPayDate)
        ,PehCurAmtYTD = CONVERT(DECIMAL(15,2), SUM(COALESCE(PehCurAmt, 0.00)))
        ,PehIsSuppWagesYTD = CONVERT(DECIMAL(15,2), SUM(CASE WHEN PehIsSuppWages = 'Y' THEN PehCurAmt ELSE 0.00 END))
    INTO dbo.U_EETRADEWT_YTDWithHeld_PEarHist
    FROM dbo.PayReg WITH (NOLOCK)
    JOIN dbo.PEarHist WITH (NOLOCK)
        ON PehGenNumber = PrgGenNumber
    WHERE EXISTS (SELECT 1 FROM dbo.U_EETRADEWT_EEList WITH (NOLOCK) WHERE xEEID = PehEEID AND xCoID = PehCoID)
    AND LEFT(PehPerControl,4) = LEFT(@EndPerControl,4)
    AND PehPerControl <= @EndPerControl
    GROUP BY PehEEID, PehCoID
    HAVING SUM(PehCurAmt) <> 0.00
    OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EETRADEWT_YTDWithHeld_PEarHist ON dbo.U_EETRADEWT_YTDWithHeld_PEarHist (PehEEID, PehCoID);

    -----------------------------
    -- Working Table - YTDWithHeld_PTaxHist
    -----------------------------
    IF OBJECT_ID('U_EETRADEWT_YTDWithHeld_PTaxHist','U') IS NOT NULL
        DROP TABLE dbo.U_EETRADEWT_YTDWithHeld_PTaxHist;
	CREATE TABLE dbo.U_EETRADEWT_YTDWithHeld_PTaxHist (
		PthEEID VARCHAR(12) NOT NULL
		,PthCoID VARCHAR(5) NOT NULL
		,PthFedTaxID VARCHAR(50) NULL
		,PthStep VARCHAR(5) NULL
		,PthPayDate DATETIME NULL
		,PthTypeOfTax VARCHAR(5) NULL
		,PthTaxDescription VARCHAR(50) NULL
		,PthCurTaxAmtYTD DECIMAL(15,2) NULL
		,PthRowNo BIGINT NULL
	);

	-- 'FIT', 'SOC', 'MED', 'SDI' type of tax
	INSERT INTO dbo.U_EETRADEWT_YTDWithHeld_PTaxHist(PthEEID, PthCoID, PthFedTaxID, PthStep, PthPayDate, PthTypeOfTax, PthTaxDescription, PthCurTaxAmtYTD, PthRowNo)
    SELECT DISTINCT
        PthEEID
        ,PthCoID
		,PthFedTaxID = CmpFedTaxID
        ,PthStep = 'STEP1'
        ,PthPayDate = MAX(PthPayDate)
        ,PthTypeOfTax
        ,PthTaxDescription = 
            CASE PthTypeOfTax
                WHEN 'FIT' THEN 'Federal'
                WHEN 'SOC' THEN 'Social Security'
                WHEN 'MED' THEN 'Medicare'
                WHEN 'SDI' THEN MAX(CONCAT(LEFT(RTRIM(LTRIM(PthTaxCode)), 2), '-', 'SDI'))
            END
        ,PthCurTaxAmtYTD = SUM(COALESCE(PthCurTaxAmt, 0.00))
        ,PthRowNo = ROW_NUMBER() OVER(PARTITION BY PthEEID, PthCoID ORDER BY
            CASE
                WHEN PthTypeOfTax = 'FIT' THEN 1
                WHEN PthTypeOfTax = 'SOC' THEN 2
                WHEN PthTypeOfTax = 'MED' THEN 3
                WHEN PthTypeOfTax = 'SDI' THEN 4
            END)
    FROM dbo.PayReg
    INNER JOIN dbo.PtaxHist WITH (NOLOCK)
        ON PthGenNumber = PrgGenNumber
		AND PthTypeOftax IN ('FIT', 'SOC', 'MED', 'SDI')
		AND PthIsEmployerTax = 'N'
	INNER JOIN dbo.Company WITH (NOLOCK)
		ON CmpCoID = PthCoID
	INNER JOIN dbo.EmpTax WITH (NOLOCK)
		ON EetEEID = PthEEID
		AND EetCoID = PthCoID
		AND EetTaxCode = PthTaxCode
	LEFT JOIN dsi_vwEETRADEW_supptaxrates WITH (NOLOCK)
		ON SupTaxCode = PthTaxCode
		AND SupFilingStatus = EetFilingStatus			
    WHERE @ExportCode LIKE '%YTD%'
	AND EXISTS (SELECT 1 FROM dbo.U_EETRADEWT_EEList WITH (NOLOCK) WHERE xEEID = PthEEID AND xCoID = PthCoID)
    AND LEFT(PthPerControl,4) = LEFT(@EndPerControl,4)
    AND PthPerControl <= @EndPerControl
    GROUP BY PthEEID, PthCoID, PthTypeOfTax, CmpFedTaxID
    HAVING SUM(PthCurTaxAmt) <> 0.00
    OPTION (FORCE ORDER);

    -- LIT type of tax only
    INSERT INTO dbo.U_EETRADEWT_YTDWithHeld_PTaxHist(PthEEID, PthCoID, PthFedTaxID, PthStep, PthPayDate, PthTypeOfTax, PthTaxDescription, PthCurTaxAmtYTD, PthRowNo)
    SELECT DISTINCT
        PthEEID
        ,PthCoID
		,PthFedTaxID = CmpFedTaxID
        ,PthStep = 'STEP2'
        ,PthPayDate = MAX(PthPayDate)
        ,PthTypeOfTax
        ,PthTaxDescription = CASE PthTypeOfTax WHEN 'LIT' THEN REPLACE(CONCAT(LEFT(RTRIM(LTRIM(MAX(PthTaxCode))), 2), '-', RTRIM(LTRIM(SupTaxCodeDesc)), SPACE(1), 'LIT'), ',', '') END
        ,PthCurTaxAmtYTD = SUM(COALESCE(PthCurTaxAmt, 0.00))
        ,PthRowNo = ROW_NUMBER() OVER(PARTITION BY PthEEID, PthCoID ORDER BY SupTaxCodeDesc)
            + (SELECT MAX(pth.PthRowNo) FROM dbo.U_EETRADEWT_YTDWithHeld_PTaxHist pth WITH (NOLOCK) WHERE pth.PthEEID = lit.PthEEID AND pth.PthCoID = lit.PthCOID)
    FROM dbo.PayReg
    INNER JOIN dbo.PtaxHist lit WITH (NOLOCK)
        ON PthGenNumber = PrgGenNumber
        AND PthTypeOftax = 'LIT'
        AND PthIsEmployerTax = 'N'
	INNER JOIN dbo.Company WITH (NOLOCK)
		ON CmpCoID = PthCoID
	INNER JOIN dbo.EmpTax WITH (NOLOCK)
		ON EetEEID = PthEEID
		AND EetCoID = PthCoID
		AND EetTaxCode = PthTaxCode
	LEFT JOIN dsi_vwEETRADEW_supptaxrates WITH (NOLOCK)
		ON SupTaxCode = PthTaxCode
		AND SupFilingStatus = EetFilingStatus
    WHERE @ExportCode LIKE '%YTD%'
	AND EXISTS (SELECT 1 FROM dbo.U_EETRADEWT_YTDWithHeld_PTaxHist pth WITH (NOLOCK) WHERE pth.PthEEID = lit.PthEEID AND pth.PthCoID = lit.PthCOID)
    AND LEFT(PthPerControl,4) = LEFT(@EndPerControl,4)
    AND PthPerControl <= @EndPerControl
    GROUP BY PthEEID, PthCoID, PthTypeOfTax, SupTaxCodeDesc, CmpFedTaxID
    HAVING SUM(PthCurTaxAmt) <> 0.00
    OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EETRADEWT_YTDWithHeld_PTaxHistt ON dbo.U_EETRADEWT_YTDWithHeld_PTaxHist (PthEEID, PthCoID, PthRowNo);

    -----------------------------
    -- Working Table - AccountTax_PTaxHist
    -----------------------------
    IF OBJECT_ID('U_EETRADEWT_AccountTax_PTaxHist','U') IS NOT NULL
        DROP TABLE dbo.U_EETRADEWT_AccountTax_PTaxHist;
	CREATE TABLE dbo.U_EETRADEWT_AccountTax_PTaxHist (
		PthEEID VARCHAR(12) NOT NULL
		,PthCoID VARCHAR(5) NOT NULL
		,PthFedTaxID VARCHAR(50) NULL
		,PthStep VARCHAR(5) NULL
		,PthPayDate DATETIME NULL
		,PthTypeOfTax VARCHAR(5) NULL
		,PthFilingStatus VARCHAR(5) NULL
		,PthCurTaxableWagesYTD DECIMAL(15,2) NULL
		,PthCurTaxAmtYTD DECIMAL(15,2) NULL
		,PthTaxDescription VARCHAR(50) NULL
		,PthTaxRate DECIMAL(15,2) NULL
		,PthTaxMax VARCHAR(1) NULL
		,PthRowNo BIGINT NULL
		,PthSort BIGINT NULL
	);

	-- 'FIT', 'SOC', 'MED', 'SDI', 'SUI' type of tax
	INSERT INTO dbo.U_EETRADEWT_AccountTax_PTaxHist(PthEEID, PthCoID, PthFedTaxID, PthStep, PthPayDate, PthTypeOfTax, PthFilingStatus, PthCurTaxableWagesYTD, 
													PthCurTaxAmtYTD, PthTaxDescription, PthTaxRate, PthTaxMax, PthRowNo, PthSort)
	SELECT DISTINCT 
		PthEEID = PthEEID
		,PthCoID = PthCoID
		,PthFedTaxID = CmpFedTaxID
		,PthStep = 'STEP1'
		,PthPayDate = MAX(PthPayDate)
		,PthTypeOfTax = PthTypeOfTax
		,PthFilingStatus = MAX(EetFilingStatus)
		,PthMedCurTaxableWagesYTD = SUM(COALESCE(PthCurTaxableWages, 0.00))
		,PthCurTaxAmt = SUM(COALESCE(PthCurTaxAmt, 0.00))
		,PthTaxDescription = 
			CASE PthTypeOfTax 
				WHEN 'FIT' THEN 'Federal'
				WHEN 'MED' THEN 'Medicare'
				WHEN 'SOC' THEN 'Social Security'
				WHEN 'SDI' THEN MAX(CONCAT(LEFT(RTRIM(LTRIM(PthTaxCode)), 2), '-', 'SDI'))
				WHEN 'SUI' THEN MAX(CONCAT(LEFT(RTRIM(LTRIM(PthTaxCode)), 2), '-', 'SUI'))
			END 
		,PthTaxRate = 
			CASE PthTypeOfTax
				WHEN 'FIT' THEN CASE WHEN SUM(COALESCE(PthCurTaxAmt, 0.00)) <= 1000000.00 THEN 22.00 ELSE 37.00 END
				WHEN 'MED' THEN CASE WHEN SUM(COALESCE(PthCurTaxAmt, 0.00)) <= 200000.00 THEN SUM(COALESCE(PthCurTaxAmt, 0.00)) / SUM(COALESCE(PthCurTaxableWages, 0.00)) * 100 ELSE MAX(SupCapAmt) END
				WHEN 'SOC' THEN CASE WHEN SUM(COALESCE(PthCurTaxAmt, 0.00)) <= 128400.00 THEN 
					SUM(COALESCE(PthCurTaxAmt, 0.00)) / SUM(COALESCE(PthCurTaxableWages, 0.00)) * 100 ELSE (SUM(COALESCE(PthCurTaxAmt, 0.00)) / 128400.00) * 100 END
				WHEN 'SDI' THEN SUM(COALESCE(PthCurTaxAmt, 0.00)) / SUM(COALESCE(PthCurTaxableWages, 0.00)) * 100
				WHEN 'SUI' THEN SUM(COALESCE(PthCurTaxAmt, 0.00)) / SUM(COALESCE(PthCurTaxableWages, 0.00)) * 100
			END
		,PthTaxMax = 
			CASE PthTypeOfTax
				WHEN 'FIT' THEN 'N' 
				WHEN 'MED' THEN 'N' 
				WHEN 'SOC' THEN 'N'
				WHEN 'SDI' THEN 'N'
				WHEN 'SUI' THEN 'N'
			END
		,PthRowNo = ROW_NUMBER() OVER(PARTITION BY PthEEID, PthCoID, PthTypeOfTax ORDER BY 
			CASE PthTypeOfTax
				WHEN 'FIT' THEN 1
				WHEN 'MED' THEN 2
				WHEN 'SOC' THEN 3
				WHEN 'SDI' THEN 4
				WHEN 'SUI' THEN 5
			END)
		,PthSort = ROW_NUMBER() OVER(PARTITION BY PthEEID, PthCoID ORDER BY 
			CASE PthTypeOfTax
				WHEN 'FIT' THEN 1
				WHEN 'MED' THEN 2
				WHEN 'SOC' THEN 3
				WHEN 'SDI' THEN 4
				WHEN 'SUI' THEN 5
			END)
	FROM dbo.PayReg WITH (NOLOCK)
    INNER JOIN dbo.PtaxHist WITH (NOLOCK)
        ON PthGenNumber = PrgGenNumber
		AND PthTypeOftax IN ('FIT', 'SOC', 'MED', 'SDI', 'SUI')
		AND PthIsEmployerTax = 'N'
	INNER JOIN dbo.Company WITH (NOLOCK)
		ON CmpCoID = PthCoID
	INNER JOIN dbo.EmpTax WITH (NOLOCK)
		ON EetEEID = PthEEID
		AND EetCoID = PthCoID
		AND EetTaxCode = PthTaxCode
	LEFT JOIN dsi_vwEETRADEW_supptaxrates WITH (NOLOCK)
		ON SupTaxCode = PthTaxCode
		AND SupFilingStatus = EetFilingStatus	
    WHERE @ExportCode LIKE '%ACCT%'
	AND EXISTS (SELECT 1 FROM dbo.U_EETRADEWT_EEList WITH (NOLOCK) WHERE xEEID = PthEEID AND xCoID = PthCoID)
    AND LEFT(PthPerControl,4) = LEFT(@EndPerControl,4)
    AND PthPerControl <= @EndPerControl
    GROUP BY PthEEID, PthCoID, PthTypeOfTax, CmpFedTaxID
    HAVING SUM(PthCurTaxAmt) <> 0.00
    OPTION (FORCE ORDER);

	-- Sit Taxes.
	INSERT INTO dbo.U_EETRADEWT_AccountTax_PTaxHist(PthEEID, PthCoID, PthFedTaxID, PthStep, PthPayDate, PthTypeOfTax, PthFilingStatus, PthCurTaxableWagesYTD, 
													PthCurTaxAmtYTD, PthTaxDescription, PthTaxRate, PthTaxMax, PthRowNo, PthSort)
	SELECT DISTINCT 
		PthEEID = PthEEID
		,PthCoID = PthCoID
		,PthFedTaxID = CmpFedTaxID
		,PthStep = 'STEP2'
		,PthPayDate = MAX(PthPayDate)
		,PthTypeOfTax = PthTypeOfTax
		,PthFilingStatus = MAX(EetFilingStatus)
		,PthMedCurTaxableWagesYTD = SUM(COALESCE(PthCurTaxableWages, 0.00))
		,PthCurTaxAmt = SUM(COALESCE(PthCurTaxAmt, 0.00))
		,PthTaxDescription = MAX(CONCAT(LEFT(RTRIM(LTRIM(PthTaxCode)), 2), '-', 'STATE'))
		,PthTaxRate = SUM(COALESCE(PthCurTaxAmt, 0.00)) / SUM(COALESCE(PthCurTaxableWages, 0.00)) * 100
		,PthTaxMax = 'N'
		,PthRowNo = ROW_NUMBER() OVER(PARTITION BY PthEEID, PthCoID ORDER BY CASE PthIsResidentTaxCode WHEN 'Y' THEN 1 ELSE 2 END)
		,PthSort = ROW_NUMBER() OVER(PARTITION BY PthEEID, PthCoID ORDER BY CASE PthIsResidentTaxCode WHEN 'Y' THEN 1 ELSE 2 END)
			+ (SELECT MAX(pth.PthSort) FROM dbo.U_EETRADEWT_AccountTax_PTaxHist pth WITH (NOLOCK) WHERE pth.PthEEID = sdi.PthEEID AND pth.PthCoID = sdi.PthCOID)
	FROM dbo.PayReg WITH (NOLOCK)
    INNER JOIN dbo.PtaxHist sdi WITH (NOLOCK)
        ON PthGenNumber = PrgGenNumber
		AND PthTypeOftax IN ('SIT')
		AND PthIsEmployerTax = 'N'
	INNER JOIN dbo.Company WITH (NOLOCK)
		ON CmpCoID = PthCoID
	INNER JOIN dbo.EmpTax WITH (NOLOCK)
		ON EetEEID = PthEEID
		AND EetCoID = PthCoID
		AND EetTaxCode = PthTaxCode
	LEFT JOIN dsi_vwEETRADEW_supptaxrates WITH (NOLOCK)
		ON SupTaxCode = PthTaxCode
		AND SupFilingStatus = EetFilingStatus	
    WHERE @ExportCode LIKE '%ACCT%'
	AND EXISTS (SELECT 1 FROM dbo.U_EETRADEWT_EEList WITH (NOLOCK) WHERE xEEID = PthEEID AND xCoID = PthCoID)
    AND LEFT(PthPerControl,4) = LEFT(@EndPerControl,4)
    AND PthPerControl <= @EndPerControl
    GROUP BY PthEEID, PthCoID, PthTypeOfTax, CmpFedTaxID, PthIsResidentTaxCode
    HAVING SUM(PthCurTaxAmt) <> 0.00
    OPTION (FORCE ORDER);

	-- LIT Taxes.
	INSERT INTO dbo.U_EETRADEWT_AccountTax_PTaxHist(PthEEID, PthCoID, PthFedTaxID, PthStep, PthPayDate, PthTypeOfTax, PthFilingStatus, PthCurTaxableWagesYTD, 
													PthCurTaxAmtYTD, PthTaxDescription, PthTaxRate, PthTaxMax, PthRowNo, PthSort)
	SELECT DISTINCT 
		PthEEID = PthEEID
		,PthCoID = PthCoID
		,PthFedTaxID = CmpFedTaxID
		,PthStep = 'STEP3'
		,PthPayDate = MAX(PthPayDate)
		,PthTypeOfTax = PthTypeOfTax
		,PthFilingStatus = MAX(EetFilingStatus)
		,PthMedCurTaxableWagesYTD = SUM(COALESCE(PthCurTaxableWages, 0.00))
		,PthCurTaxAmt = SUM(COALESCE(PthCurTaxAmt, 0.00))
		,PthTaxDescription = CASE PthTypeOfTax WHEN 'LIT' THEN REPLACE(CONCAT(LEFT(RTRIM(LTRIM(MAX(PthTaxCode))), 2), '-', RTRIM(LTRIM(SupTaxCodeDesc)), SPACE(1), 'LIT'), ',', '') END
		,PthTaxRate = SUM(COALESCE(PthCurTaxAmt, 0.00)) / SUM(COALESCE(PthCurTaxableWages, 0.00)) * 100
		,PthTaxMax = 'N'
		,PthRowNo = ROW_NUMBER() OVER(PARTITION BY PthEEID, PthCoID ORDER BY SupTaxCodeDesc)
		,PthSort = ROW_NUMBER() OVER(PARTITION BY PthEEID, PthCoID ORDER BY SupTaxCodeDesc)
			+ (SELECT MAX(pth.PthSort) FROM dbo.U_EETRADEWT_AccountTax_PTaxHist pth WITH (NOLOCK) WHERE pth.PthEEID = lit.PthEEID AND pth.PthCoID = lit.PthCOID)
	FROM dbo.PayReg WITH (NOLOCK)
    INNER JOIN dbo.PtaxHist lit WITH (NOLOCK)
        ON PthGenNumber = PrgGenNumber
		AND PthTypeOftax IN ('LIT')
		AND PthIsEmployerTax = 'N'
	INNER JOIN dbo.Company WITH (NOLOCK)
		ON CmpCoID = PthCoID
	INNER JOIN dbo.EmpTax WITH (NOLOCK)
		ON EetEEID = PthEEID
		AND EetCoID = PthCoID
		AND EetTaxCode = PthTaxCode
	LEFT JOIN dsi_vwEETRADEW_supptaxrates WITH (NOLOCK)
		ON SupTaxCode = PthTaxCode
		AND SupFilingStatus = EetFilingStatus	
    WHERE @ExportCode LIKE '%ACCT%'
	AND EXISTS (SELECT 1 FROM dbo.U_EETRADEWT_EEList WITH (NOLOCK) WHERE xEEID = PthEEID AND xCoID = PthCoID)
    AND LEFT(PthPerControl,4) = LEFT(@EndPerControl,4)
    AND PthPerControl <= @EndPerControl
    GROUP BY PthEEID, PthCoID, PthTypeOfTax, CmpFedTaxID, SupTaxCodeDesc
    HAVING SUM(PthCurTaxAmt) <> 0.00
    OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EETRADEWT_AccountTax_PTaxHist ON dbo.U_EETRADEWT_AccountTax_PTaxHist (PthEEID, PthCoID, PthSort, PthRowNo);

    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_EETRADEWT_DrvTbl_YTDWithHeld_D11
    ---------------------------------
    IF OBJECT_ID('U_EETRADEWT_DrvTbl_YTDWithHeld_D11','U') IS NOT NULL
        DROP TABLE dbo.U_EETRADEWT_DrvTbl_YTDWithHeld_D11;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EecEmpNo
        ,drvSubSort = CONVERT(VARCHAR, PthRowNo)
        -- standard fields above and additional driver fields below
        ,drvEmpNo = EecEmpNo
        ,drvTaxDescription = PthTaxDescription
        ,drvYTDWithHeld = CONVERT(VARCHAR, PthCurTaxAmtYTD)
        ,drvNameLast = REPLACE(EepNameLast, ',', '')
        ,drvYTDSupplementalWages = CONVERT(VARCHAR, PehIsSuppWagesYTD)
        ,drvYTDWages = CONVERT(VARCHAR, PehCurAmtYTD)
    INTO dbo.U_EETRADEWT_DrvTbl_YTDWithHeld_D11
    FROM dbo.U_EETRADEWT_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    INNER JOIN dbo.U_EETRADEWT_YTDWithHeld_PTaxHist WITH (NOLOCK)
        ON PthEEID = xEEID
        AND PthCoID = xCoID
    LEFT JOIN dbo.U_EETRADEWT_YTDWithHeld_PEarHist WITH (NOLOCK)
        ON PehEEID = xEEID
        AND PehCoID = xCoID
    WHERE @ExportCode LIKE '%YTD%'
    OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EETRADEWT_DrvTbl_YTDWithHeld_D11 ON dbo.U_EETRADEWT_DrvTbl_YTDWithHeld_D11 (drvInitialSort, drvSubSort);

    ---------------------------------
    -- HEADER RECORD
    ---------------------------------
    IF OBJECT_ID('U_EETRADEWT_DrvTbl_YTDWithHeld_H01','U') IS NOT NULL
        DROP TABLE dbo.U_EETRADEWT_DrvTbl_YTDWithHeld_H01;
    SELECT DISTINCT
         drvAccountID = 'Account ID'
    INTO dbo.U_EETRADEWT_DrvTbl_YTDWithHeld_H01
    WHERE @ExportCode LIKE '%YTD%';

    ---------------------------------
    -- DETAIL RECORD - U_EETRADEWT_DrvTbl_AccountTax_D12
    ---------------------------------
    IF OBJECT_ID('U_EETRADEWT_DrvTbl_AccountTax_D12','U') IS NOT NULL
        DROP TABLE dbo.U_EETRADEWT_DrvTbl_AccountTax_D12;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EecEmpNo
        ,drvSubSort = ''
        -- standard fields above and additional driver fields below
        ,drvEmpNo = EecEmpNo
        ,drvTax1Description = fit.PthTaxDescription
        ,drvTax1Rate = CONVERT(VARCHAR, fit.PthTaxRate)
        ,drvTax1Max = fit.PthTaxMax
        ,drvTax2Description = med.PthTaxDescription
        ,drvTax2Rate = CONVERT(VARCHAR, med.PthTaxRate)
        ,drvTax2Max = med.PthTaxMax
        ,drvTax3Description = soc.PthTaxDescription
        ,drvTax3Rate = CONVERT(VARCHAR, soc.PthTaxRate)
        ,drvTax3Max = soc.PthTaxMax
        ,drvTax4Description = sit.PthTaxDescription
        ,drvTax4Rate = CONVERT(VARCHAR, sit.PthTaxRate)
        ,drvTax4Max = sit.PthTaxMax
        ,drvTax5Description = sdi.PthTaxDescription
        ,drvTax5Rate = CONVERT(VARCHAR, sdi.PthTaxRate)
        ,drvTax5Max = sdi.PthTaxMax
        ,drvTax6Description = lit6.PthTaxDescription
        ,drvTax6Rate = CONVERT(VARCHAR, lit6.PthTaxRate)
        ,drvTax6Max = lit6.PthTaxMax
        ,drvTax7Description = lit7.PthTaxDescription
        ,drvTax7Rate = CONVERT(VARCHAR, lit7.PthTaxRate)
        ,drvTax7Max = lit7.PthTaxMax
        ,drvTax8Description = lit8.PthTaxDescription
        ,drvTax8Rate = CONVERT(VARCHAR, lit8.PthTaxRate)
        ,drvTax8Max = lit8.PthTaxMax
        ,drvTax9Description = lit9.PthTaxDescription
        ,drvTax9Rate = CONVERT(VARCHAR, lit9.PthTaxRate)
        ,drvTax9Max = lit9.PthTaxMax
        ,drvTax10Description = lit10.PthTaxDescription
        ,drvTax10Rate = CONVERT(VARCHAR, lit10.PthTaxRate)
        ,drvTax10Max = lit10.PthTaxMax
        ,drvTax11Description = lit11.PthTaxDescription
        ,drvTax11Rate = CONVERT(VARCHAR, lit11.PthTaxRate)
        ,drvTax11Max = lit11.PthTaxMax
        ,drvTax12Description = lit12.PthTaxDescription
        ,drvTax12Rate = CONVERT(VARCHAR, lit12.PthTaxRate)
        ,drvTax12Max =  lit12.PthTaxMax
    INTO dbo.U_EETRADEWT_DrvTbl_AccountTax_D12
    FROM dbo.U_EETRADEWT_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
	INNER JOIN dbo.U_EETRADEWT_AccountTax_PTaxHist fit WITH (NOLOCK)
		ON fit.PthEEID = xEEID
		AND fit.PthCoID = xCoID
		AND fit.PthTypeOfTax = 'FIT'
	LEFT JOIN dbo.U_EETRADEWT_AccountTax_PTaxHist med WITH (NOLOCK)
		ON med.PthEEID = xEEID
		AND med.PthCoID = xCoID
		AND med.PthTypeOfTax = 'MED'
	LEFT JOIN dbo.U_EETRADEWT_AccountTax_PTaxHist soc WITH (NOLOCK)
		ON soc.PthEEID = xEEID
		AND soc.PthCoID = xCoID
		AND soc.PthTypeOfTax = 'SOC'
	LEFT JOIN dbo.U_EETRADEWT_AccountTax_PTaxHist sit WITH (NOLOCK)
		ON sit.PthEEID = xEEID
		AND sit.PthCoID = xCoID
		AND sit.PthTypeOfTax = 'SIT'
		AND sit.PthRowNo = 1
	LEFT JOIN dbo.U_EETRADEWT_AccountTax_PTaxHist sdi WITH (NOLOCK)
		ON sdi.PthEEID = xEEID
		AND sdi.PthCoID = xCoID
		AND sdi.PthTypeOfTax = 'SDI'
	LEFT JOIN dbo.U_EETRADEWT_AccountTax_PTaxHist lit6 WITH (NOLOCK)
		ON lit6.PthEEID = xEEID
		AND lit6.PthCoID = xCoID
		AND lit6.PthTypeOfTax = 'LIT'
		AND lit6.PthRowNo = 1
	LEFT JOIN dbo.U_EETRADEWT_AccountTax_PTaxHist lit7 WITH (NOLOCK)
		ON lit7.PthEEID = xEEID
		AND lit7.PthCoID = xCoID
		AND lit7.PthTypeOfTax = 'LIT'
		AND lit7.PthRowNo = 2
	LEFT JOIN dbo.U_EETRADEWT_AccountTax_PTaxHist lit8 WITH (NOLOCK)
		ON lit8.PthEEID = xEEID
		AND lit8.PthCoID = xCoID
		AND lit8.PthTypeOfTax = 'LIT'
		AND lit8.PthRowNo = 3
	LEFT JOIN dbo.U_EETRADEWT_AccountTax_PTaxHist lit9 WITH (NOLOCK)
		ON lit9.PthEEID = xEEID
		AND lit9.PthCoID = xCoID
		AND lit9.PthTypeOfTax = 'LIT'
		AND lit9.PthRowNo = 4
	LEFT JOIN dbo.U_EETRADEWT_AccountTax_PTaxHist lit10 WITH (NOLOCK)
		ON lit10.PthEEID = xEEID
		AND lit10.PthCoID = xCoID
		AND lit10.PthTypeOfTax = 'LIT'
		AND lit10.PthRowNo = 5
	LEFT JOIN dbo.U_EETRADEWT_AccountTax_PTaxHist lit11 WITH (NOLOCK)
		ON lit11.PthEEID = xEEID
		AND lit11.PthCoID = xCoID
		AND lit11.PthTypeOfTax = 'LIT'
		AND lit11.PthRowNo = 6
	LEFT JOIN dbo.U_EETRADEWT_AccountTax_PTaxHist lit12 WITH (NOLOCK)
		ON lit12.PthEEID = xEEID
		AND lit12.PthCoID = xCoID
		AND lit12.PthTypeOfTax = 'LIT'
		AND lit12.PthRowNo = 7
    WHERE @ExportCode LIKE '%ACCT%'
    OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EETRADEWT_DrvTbl_AccountTax_D12 ON dbo.U_EETRADEWT_DrvTbl_AccountTax_D12 (drvInitialSort);

    ---------------------------------
    -- HEADER RECORD
    ---------------------------------
    IF OBJECT_ID('U_EETRADEWT_DrvTbl_AccountTax_H02','U') IS NOT NULL
        DROP TABLE dbo.U_EETRADEWT_DrvTbl_AccountTax_H02;
    SELECT DISTINCT
         drvAccountID = 'Account ID'
    INTO dbo.U_EETRADEWT_DrvTbl_AccountTax_H02
    WHERE @ExportCode LIKE '%ACCT%';

    --==========================================
    -- Set FileName
    --==========================================
    IF (dbo.dsi_fnVariable(@FormatCode,'UseFileName') = 'N') BEGIN
        UPDATE dbo.U_dsi_Parameters SET ExportFile = 
            CASE WHEN @ExportCode LIKE '%YTD%' THEN 
                CASE 
                    WHEN dbo.dsi_fnVariable(@FormatCode,'Testing') = 'Y' OR @ExportCode LIKE '%TST%' THEN CONCAT('TEST_ETMC_YTD_', FORMAT(GETDATE(), 'yyyyMMdd'), '.csv')
                    ELSE CONCAT('ETMC_YTD_', FORMAT(GETDATE(), 'yyyyMMdd'), '.csv')
                END
                ELSE CASE WHEN @ExportCode LIKE '%ACCT%' THEN 
                    CASE 
                        WHEN dbo.dsi_fnVariable(@FormatCode,'Testing') = 'Y' OR @ExportCode LIKE '%TST%' THEN CONCAT('TEST_ETMC_AccountTax_', FORMAT(GETDATE(), 'yyyyMMdd'), '.csv')
                        ELSE CONCAT('ETMC_AccountTax_', FORMAT(GETDATE(), 'yyyyMMdd'), '.csv')
                    END
                END
            END
        WHERE FormatCode = @FormatCode;
    END

END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwEETRADEWT_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_EETRADEWT_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'EETRADEWT%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202006101'
       ,expStartPerControl     = '202006101'
       ,expLastEndPerControl   = '202006109'
       ,expEndPerControl       = '202006109'
WHERE expFormatCode = 'EETRADEWT';

**********************************************************************************/
GO
CREATE VIEW [dbo].[dsi_vwEETRADEW_supptaxrates] AS
select MtcTaxCode suptaxcode, mtctypeoftax suptypeoftax,mtclocaltype suplocaltype,MtcIsNonResident supisnonresident,
MtcTaxCodeDesc supTaxCodedesc,mtcisemployertax supisemployertax,mtceffectivedate supeffectivedate, coalesce(mtttaxcalcrule,mtstaxcalcrule) suptaxcalcrule,MtcPSuppWageTaxmthdOpt supPSuppWageTaxmthdOpt, 
                              coalesce(MttFilingStatus, MtsFilingStatus) supfilingstatus, 
                              coalesce(MttIfWageBaseIsNotOver,MtsIfWageBaseIsNotOver) supAmtifwagebaseisnotover,
                              coalesce(MttIfWageBaseIsOver, MtsIfWageBaseIsOver) supamtifwagebaseisover,
							  MttCapAmt SupCapAmt,
            coalesce(MttTaxPercentOverBase, MtsTaxPercentOverBase) suptaxpercentoverbase,
            MtwCreditMaxAmt supcreditmaxamt, MtwCreditMinAmt supcreditminamt, MtwDependentExemption supdependentexemption, MtwFICACreditMax supficacreditmax,
            MtwFlatExemptionAmt1 supflatexemptionamt1,MtwFlatExemptionAmt2 supflatexemptionamt2, MtwHighWageBase suphighwagebase,MtwLowWageBase suplowwagebase,
            MtwPerExemptionAmt supperexemptionamt, MtwStandardDedAmt supstandarddedamt,
            MtwWageBaseCreditPercent supwagebasecrditpercent,MtwWageLimit supwagelimit
            
            from Ultipro_System..TxCdMast  with(nolock)
join (select distinct ctctaxcode from taxcode
      where ctcEffectiveStopDate >= getdate() and ctcHasBeenReplaced = 'N' and ctcHasBeenReplaced = 'N' and ctcEffectiveDate <=GETDATE()) cotax on CtcTaxCode = mtcTaxCode
left join Ultipro_System..TxSpMast with(nolock) on mtstaxcode = mtctaxcode and mtsdatetimecreated = mtcdatetimecreated and MtcPSuppWageTaxmthdOpt in ('ER','E','SR')
left join Ultipro_System..TxtbMast with(nolock) on mtttaxcode = mtctaxcode and mttdatetimecreated = mtcdatetimecreated and MtcPSuppWageTaxmthdOpt in ('R')
left join Ultipro_System..txwhmast w with(nolock) on MtwTaxCode = MtcTaxCode and MtwDateTimeCreated = MtcDateTimeCreated and MtcPSuppWageTaxmthdOpt in ('R') and mttfilingstatus = mtwfilingstatus
where  mtcEffectiveStopDate >= GETDATE() and mtcHasBeenReplaced = 'N' and mtcHasBeenReplaced = 'N' and MtcEffectiveDate <=GETDATE()
and MtcPSuppWageTaxmthdOpt in ('ER','E','SR','R')
GO
CREATE VIEW dbo.dsi_vwEETRADEWT_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_EETRADEWT_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort
