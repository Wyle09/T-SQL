SET NOCOUNT ON;
IF OBJECT_ID('U_EVANSFFC_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EVANSFFC_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EVANSFFC_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EVANSFFC' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEVANSFFC_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEVANSFFC_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EVANSFFC') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EVANSFFC];
GO
IF OBJECT_ID('U_EVANSFFC_File') IS NOT NULL DROP TABLE [dbo].[U_EVANSFFC_File];
GO
IF OBJECT_ID('U_EVANSFFC_EEList') IS NOT NULL DROP TABLE [dbo].[U_EVANSFFC_EEList];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EVANSFFC';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EVANSFFC';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EVANSFFC';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EVANSFFC';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EVANSFFC';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhRespectZeroPayRate,AdhCreateTClockBatches,AdhThirdPartyPay) VALUES ('N','C','Y','0','','N','N','','N','','013010','EMPEXPORT','CDE','EVANSFFC','VanguardSFF Contribution Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_SwitchBox','600','S','N','401KRON21D0','N','Jan  1 1900 12:00AM','C','N','','N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dchHeaderZeroes"','1','(''UA''=''F'')','401KRON21D0','11','H','01','1','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dchHeaderIndicator"','2','(''UA''=''F'')','401KRON21D0','3','H','01','12','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dchFormat"','3','(''UA''=''F'')','401KRON21D0','8','H','01','15','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dchPlanNumber"','4','(''UA''=''F'')','401KRON21D0','6','H','01','23','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dchDate"','5','(''UA''=''F'')','401KRON21D0','8','H','01','29','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dchTime"','6','(''UA''=''F'')','401KRON21D0','6','H','01','37','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dchFiller1"','7','(''UA''=''F'')','401KRON21D0','7','H','01','43','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dchFiller2"','8','(''UA''=''F'')','401KRON21D0','31','H','01','50','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvPlanId"','1','(''UA''=''F'')','401KRON21D0','6','D','02','1','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvSSN"','2','(''UA''=''F'')','401KRON21D0','9','D','02','7','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvRecordType"','3','(''UA''=''F'')','401KRON21D0','3','D','02','16','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvFiller1"','4','(''UA''=''F'')','401KRON21D0','22','D','02','19','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvPayrollEndDate"','5','(''UA''=''F'')','401KRON21D0','8','D','02','41','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvOverridePayrollEndDate"','6','(''UA''=''F'')','401KRON21D0','8','D','02','49','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvFiller2"','7','(''UA''=''F'')','401KRON21D0','10','D','02','57','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvContributionSource1"','8','(''UA''=''F'')','401KRON21D0','4','D','02','67','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvContributionAmount1"','9','(''UA''=''F'')','401KRON21D0','10','D','02','71','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvFiller3"','10','(''UA''=''F'')','401KRON21D0','10','D','02','81','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvContributionSource2"','11','(''UA''=''F'')','401KRON21D0','4','D','02','91','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvContributionAmount2"','12','(''UA''=''F'')','401KRON21D0','10','D','02','95','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvFiller4"','13','(''UA''=''F'')','401KRON21D0','10','D','02','105','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvContributionSource3"','14','(''UA''=''F'')','401KRON21D0','4','D','02','115','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvContributionAmount3"','15','(''UA''=''F'')','401KRON21D0','10','D','02','119','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvFiller5"','16','(''UA''=''F'')','401KRON21D0','10','D','02','129','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvContributionSource4"','17','(''UA''=''F'')','401KRON21D0','4','D','02','139','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvContributionAmount4"','18','(''UA''=''F'')','401KRON21D0','10','D','02','143','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvFiller8"','19','(''UA''=''F'')','401KRON21D0','10','D','02','153','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvFiller9"','20','(''UA''=''F'')','401KRON21D0','4','D','02','163','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvFiller10"','21','(''UA''=''F'')','401KRON21D0','10','D','02','167','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvFiller11"','22','(''UA''=''F'')','401KRON21D0','10','D','02','177','','','','');

INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPlanId"','1','(''UA''=''F'')','401KRON21D0','6','D','03','1',NULL,'Plan ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSSN"','2','(''UA''=''F'')','401KRON21D0','9','D','03','7',NULL,'SSN',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"C"','3','(''DA''=''F'')','401KRON21D0','3','D','03','03',NULL,'Record Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','4','(''SS''=''F'')','401KRON21D0','22','D','03','19',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvContributionSource1"','5','(''UA''=''F'')','401KRON21D0','4','D','03','41',NULL,'Contribution Source 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvContributionTotalAmount1"','6','(''UA''=''F'')','401KRON21D0','10','D','03','45',NULL,'Contribution Total Amount 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvContributionSource2"','7','(''UA''=''F'')','401KRON21D0','4','D','03','55',NULL,'Contribution Source 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvContributionTotalAmount2"','8','(''UA''=''F'')','401KRON21D0','10','D','03','59',NULL,'Contribution Total Amount 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvContributionSource3"','9','(''UA''=''F'')','401KRON21D0','4','D','03','69',NULL,'Contribution Source 3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvContributionTotalAmount3"','10','(''UA''=''F'')','401KRON21D0','10','D','03','73',NULL,'Contribution Total Amount 3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvContributionSource4"','11','(''UA''=''F'')','401KRON21D0','4','D','03','83',NULL,'Contribution Source 4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvContributionTotalAmount4"','12','(''UA''=''F'')','401KRON21D0','10','D','03','87',NULL,'Contribution Total Amount 4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','13','(''SS''=''F'')','401KRON21D0','4','D','03','97',NULL,'Contribution Source 5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','14','(''SS''=''F'')','401KRON21D0','10','D','03','101',NULL,'Contribution Total Amount 5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','15','(''SS''=''F'')','401KRON21D0','279','D','03','111',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','16','(''DA''=''F'')','401KRON21D0','1','D','03','391',NULL,'Pretax Limit Override',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','17','(''SS''=''F'')','401KRON21D0','108','D','03','392',NULL,'Filler',NULL,NULL);

INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvPlanId"','1','(''UA''=''F'')','401KRON21D0','6','D','04','1','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvSSN"','2','(''UA''=''F'')','401KRON21D0','9','D','04','7','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvRecordType"','3','(''UA''=''F'')','401KRON21D0','3','D','04','16','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvFiller1"','4','(''UA''=''F'')','401KRON21D0','22','D','04','19','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvLoanNumber1"','5','(''UA''=''F'')','401KRON21D0','3','D','04','41','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvPayrollEndDate1"','6','(''UA''=''F'')','401KRON21D0','8','D','04','44','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvPayAmount1"','7','(''UA''=''F'')','401KRON21D0','10','D','04','52','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvLoanNumber2"','8','(''UA''=''F'')','401KRON21D0','3','D','04','62','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvPayrollEndDate2"','9','(''UA''=''F'')','401KRON21D0','8','D','04','65','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvPayAmount2"','10','(''UA''=''F'')','401KRON21D0','10','D','04','73','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvLoanNumber3"','11','(''UA''=''F'')','401KRON21D0','3','D','04','83','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvPayrollEndDate3"','12','(''UA''=''F'')','401KRON21D0','8','D','04','86','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvPayAmount3"','13','(''UA''=''F'')','401KRON21D0','10','D','04','94','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvLoanNumber4"','14','(''UA''=''F'')','401KRON21D0','3','D','04','104','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvPayrollEndDate4"','15','(''UA''=''F'')','401KRON21D0','8','D','04','107','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvPayAmount4"','16','(''UA''=''F'')','401KRON21D0','10','D','04','115','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvLoanNumber5"','17','(''UA''=''F'')','401KRON21D0','3','D','04','125','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvPayrollEndDate5"','18','(''UA''=''F'')','401KRON21D0','8','D','04','128','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvPayAmount5"','19','(''UA''=''F'')','401KRON21D0','10','D','04','136','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvLoanNumber6"','20','(''UA''=''F'')','401KRON21D0','3','D','04','146','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvPayrollEndDate6"','21','(''UA''=''F'')','401KRON21D0','8','D','04','149','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvPayAmount6"','22','(''UA''=''F'')','401KRON21D0','10','D','04','157','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ddvFiller2"','23','(''UA''=''F'')','401KRON21D0','394','D','04','167','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dctTrailerNines"','1','(''UA''=''F'')','401KRON21D0','11','T','04','1','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dctTrailerIndicator"','2','(''UA''=''F'')','401KRON21D0','4','T','04','12','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dctPlanNumber"','3','(''UA''=''F'')','401KRON21D0','6','T','04','16','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dctDate"','4','(''UA''=''F'')','401KRON21D0','8','T','04','22','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dctTime"','5','(''UA''=''F'')','401KRON21D0','6','T','04','30','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dctRecordCount"','6','(''UA''=''F'')','401KRON21D0','10','T','04','36','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dctFiller1"','7','(''UA''=''F'')','401KRON21D0','35','T','04','46','','','','');
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('No filename needed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'VanguardSFF CONTRIB ONDEMAND','201503311','EMPEXPORT','ONDEMAND','Apr  3 2015  2:39PM','EVANSFFC',NULL,NULL,NULL,'201503311','Mar 31 2015 12:00AM','Dec 30 1899 12:00AM','201503311','2','','','201503311',dbo.fn_GetTimedKey(),NULL,'ULTI_WOSCO',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('No filename needed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'VanguardSFF CONTRIBB SCHEDULED','202005299','EMPEXPORT','SCHEDULED','May 29 2020 11:00PM','EVANSFFC',NULL,NULL,NULL,'202005299','Jul 25 2012  3:02PM','Jul 25 2012  3:02PM','202005161',NULL,'','','202005161',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('No filename needed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Unlock Export Session','201207259','EMPEXPORT','ZAP','Aug 18 2014  1:28PM','EVANSFFC',NULL,NULL,NULL,'201207259','Jul 25 2012  3:02PM','Jul 25 2012  3:02PM','201207251','-99','','','201207251',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFC','EEList','V','Y');
--INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFC','ExportPath','V','\\us.saas\n1\Public\10393\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFC','ExportPath','V','\\us.saas\ez\Public\10393\Exports_Test\Vanguard\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFC','InitialSort','C','ddvSSN');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFC','OEPath','V','');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFC','SubSort','C',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFC','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFC','UseFileName','V','Y');
UPDATE dbo.U_dsi_Configuration SET CfgValue = svCfgValue FROM dbo.U_EVANSFFC_SavePath WHERE CfgName = svCfgName AND FormatCode = svFormatCode AND svCfgValue IS NOT NULL;
IF OBJECT_ID('U_EVANSFFC_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EVANSFFC_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EVANSFFC','H01','u_dsi_drv_Contribution_Headertbl','');
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EVANSFFC','D02','u_dsi_drv_Contribution_RecordBtbl','');
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EVANSFFC','D03','dbo.U_EVANSFFC_drvTbl_C_D03',NULL); -- (WC 2020-00270504)
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EVANSFFC','D04','u_dsi_drv_Contribution_RecordDtbl','');
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EVANSFFC','T04','u_dsi_drv_Contribution_Trailertbl','');
IF OBJECT_ID('U_EVANSFFC_EEList') IS NULL
CREATE TABLE [dbo].[U_EVANSFFC_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EVANSFFC_File') IS NULL
CREATE TABLE [dbo].[U_EVANSFFC_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(20) NOT NULL,
    [SubSort] varchar(32) NOT NULL,
    [Data] varchar(600) NULL
);
GO
CREATE proc [dbo].[dsi_sp_BuildDriverTables_EVANSFFC]
(@SystemID varchar(15))
AS

/*------------------------------------------------------------------------------------
Client: Western Oilfields

Created By: Jasonn Baker
Business Analyst: Jennifer Walker
Create Date: 03-22-2014
Request Number: SR-2013-00019321

Purpose: To provide participant data to Vanguard for 401K & NQ administration.

Revision History
-----------------
Update By            Date            SF Num            Desc
Kathy Reincke       04/21/2017  SR-2017-00147670    Initial updates to SQL job, fixed file name to use formatcode not systemID, 
                                                        fixed SCHEDULED session to use 13 day lookback not 14
Wyle Cordero		06/19/2020	SR-2020-00270504	Add groups B, C, & D


select * from dbo.U_dsi_configuration where formatcode = 'EVANSFFC'
select * from dbo.U_dsi_parameters where formatcode = 'EVANSFFC'
select * from dbo.U_dsi_SQLClauses where formatcode = 'EVANSFFC'
select * from dbo.U_dsi_InterfaceActivityLog where formatcode = 'EVANSFFC' order by runid desc

-- EXEC dbo._dsi_usp_ExportRipout @formatcode = 'EVANSFFC', @allobjects = 'Y'

EXEC dbo.dsi_sp_testswitchbox 'EVANSFFC', 'ONDEMAND'
EXEC dbo.dsi_sp_testswitchbox 'EVANSFFC', 'SCHEDULED'
EXEC dbo.dsi_sp_testswitchbox 'EVANSFFC', 'ZAP'

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '201912271'
       ,expStartPerControl     = '201912271'
       ,expLastEndPerControl   = '201912279'
       ,expEndPerControl       = '201912279'
WHERE expFormatCode = 'EVANSFFC';

*/------------------------------------------------------------------------------------


if exists (select null from sys.tables where name='u_dsi_drv_Contribution_Headertbl')
    drop table dbo.u_dsi_drv_Contribution_Headertbl
if exists (select null from sys.tables where name='u_dsi_drv_Contribution_RecordBtbl')
    drop table dbo.u_dsi_drv_Contribution_RecordBtbl
if exists (select null from sys.tables where name='u_dsi_drv_Contribution_RecordDtbl')
    drop table dbo.u_dsi_drv_Contribution_RecordDtbl
if exists (select null from sys.tables where name='u_dsi_drv_Contribution_Trailertbl')
    drop table dbo.u_dsi_drv_Contribution_Trailertbl
if exists (select null from sys.tables where name='u_dsi_drv_Contribution_RecordBtbl_1')
drop table  dbo.u_dsi_drv_Contribution_RecordBtbl_1


DECLARE @startdate varchar(12),
        @enddate varchar (12),
        @startpercontrol char(9),
        @endpercontrol char(9),
        @date varchar (8),
        @time varchar(6),
        @count int,
        @formatcode varchar(12),
        @exportcode varchar(12)

IF (SELECT FormatCode FROM U_dsi_Parameters WHERE SystemID = @SystemID) = 'EVANSFFC' 
BEGIN
SELECT @StartDate = case when exportcode ='ONDEMAND' then cast(substring(StartPerControl,1,8) as datetime) else CONVERT (VARCHAR (10),dateadd (dd,-13,getdate()),112) end
    , @EndDate = case when exportcode in ('ONDEMAND') then cast(substring(EndPerControl,1,8) as datetime) else CONVERT (VARCHAR(10),getdate(),112) end
    , @StartPerControl = case when exportcode in ('ONDEMAND') then StartPerControl else convert(varchar ,getdate()-13,112)+'1' end
    , @EndPerControl = case when exportcode in ('ONDEMAND') then EndPerControl else  convert(varchar,getdate(),112)+'9' end
    , @Formatcode = Formatcode
    , @Exportcode = Exportcode
FROM dbo.U_dsi_Parameters with (nolock)
    where FormatCode = 'EVANSFFC'
END

select @date=CONVERT(varchar(10),getdate(),112),@time=right (replace(replace(replace(replace(CONVERT (varchar(20),getdate(),121),' ',''),':',''),'-',''),'.',''),6)

--print the variables
PRINT '@StartDate:       ' + CONVERT(char(50),@StartDate)
PRINT '@EndDate:         ' + CONVERT(char(50),@EndDate)
PRINT '@StartPerControl: ' + @StartPerControl
PRINT '@EndPerControl:   ' + @EndPerControl
PRINT '@date:            ' + CONVERT(char(50),@date)
PRINT '@formatcode:      ' + @formatcode
PRINT '@exportcode:      ' + @exportcode


create table dbo.u_dsi_drv_Contribution_RecordBtbl
(
ddvPlanId varchar (6)
,ddvSSN char(11)
,ddvRecordType char(1)
,ddvFiller1 varchar(1)
,ddvPayrollEndDate varchar(10)
,ddvOverridePayrollEndDate varchar (10)
,ddvFiller2 varchar(1)
,ddvContributionSource1 varchar (3)
,ddvContributionAmount1 varchar (10)
,ddvFiller3 varchar(1)
,ddvContributionSource2 varchar(3)
,ddvContributionAmount2 varchar(10)
,ddvFiller4 varchar(1)
,ddvContributionSource3 varchar(3)
,ddvContributionAmount3 varchar(10)
,ddvFiller5 varchar(1)
,ddvContributionSource4 varchar(3)
,ddvContributionAmount4 varchar(10)
,ddvFiller8 varchar(1)
,ddvFiller9 varchar(1)
,ddvFiller10 varchar(1)
,ddvFiller11 varchar(1)
)


select '00000000000' dchHeaderZeroes
,'HDR' dchHeaderIndicator
,'SFF' dchFormat
,'091509' dchPlanNumber
,@date dchDate
,@time dchTime
,''dchFiller1
,'' dchFiller2
into dbo.u_dsi_drv_Contribution_Headertbl


select distinct '091509' ddvPlanId
, eepSSN ddvSSN
,'D' ddvRecordType
,'' ddvFiller1
,'' ddvLoanNumber1
,(select top 1 convert (varchar(10),PrgPeriodEndDate,112) from PDedHist a with (nolock) where a.PdhEEID=b.PdhEEID and a.PdhPerControl=b.PdhPerControl and a.PdhDedCode = '401L'  and a.PdhPerControl between @startpercontrol and @EndPerControl)  ddvPayrollEndDate1
,(select  dbo.[dsi_fnPadZero]( replace (convert(varchar(20),SUM(coalesce (PdhEECurAmt,0))),'.',''),9,0)+'+' from PDedHist a with (nolock) where a.PdhEEID=b.PdhEEID and a.PdhPerControl=b.PdhPerControl and a.PdhDedCode = '401L'  and a.PdhPerControl between @startpercontrol and @EndPerControl)  ddvPayAmount1
,'' ddvLoanNumber2
,(select top 1 convert (varchar(10),PrgPeriodEndDate,112) from PDedHist a with (nolock) where a.PdhEEID=b.PdhEEID and a.PdhPerControl=b.PdhPerControl and a.PdhDedCode = '401L2'  and a.PdhPerControl between @startpercontrol and @EndPerControl) ddvPayrollEndDate2
,(select dbo.[dsi_fnPadZero]( replace (convert(varchar(20),SUM(coalesce (PdhEECurAmt,0))),'.',''),9,0)+'+' from PDedHist a with (nolock) where a.PdhEEID=b.PdhEEID and a.PdhPerControl=b.PdhPerControl and a.PdhDedCode = '401L2'  and a.PdhPerControl between @startpercontrol and @EndPerControl) ddvPayAmount2
,'' ddvLoanNumber3
,(select top 1 convert (varchar(10),PrgPeriodEndDate,112) from PDedHist a with (nolock) where a.PdhEEID=b.PdhEEID and a.PdhPerControl=b.PdhPerControl and a.PdhDedCode = '401L3'   and a.PdhPerControl between @startpercontrol and @EndPerControl) ddvPayrollEndDate3
,(select  dbo.[dsi_fnPadZero]( replace (convert(varchar(20),SUM(coalesce (PdhEECurAmt,0))),'.',''),9,0)+'+' from PDedHist a with (nolock) where a.PdhEEID=b.PdhEEID and a.PdhPerControl=b.PdhPerControl and a.PdhDedCode = '401L3'  and a.PdhPerControl between @startpercontrol and @EndPerControl ) ddvPayAmount3
,'' ddvLoanNumber4
,(select top 1 convert (varchar(10),PrgPeriodEndDate,112) from PDedHist a with (nolock) where a.PdhEEID=b.PdhEEID and a.PdhPerControl=b.PdhPerControl and a.PdhDedCode = '401L4'  and a.PdhPerControl between @startpercontrol and @EndPerControl) ddvPayrollEndDate4
,(select  dbo.[dsi_fnPadZero]( replace (convert(varchar(20),SUM(coalesce (PdhEECurAmt,0))),'.',''),9,0)+'+' from PDedHist a with (nolock) where a.PdhEEID=b.PdhEEID and a.PdhPerControl=b.PdhPerControl and a.PdhDedCode = '401L4'  and a.PdhPerControl between @startpercontrol and @EndPerControl )  ddvPayAmount4
,'' ddvLoanNumber5
,(select top 1 convert (varchar(10),PrgPeriodEndDate,112) from PDedHist a with (nolock) where a.PdhEEID=b.PdhEEID and a.PdhPerControl=b.PdhPerControl and a.PdhDedCode = '401L5'   and a.PdhPerControl between @startpercontrol and @EndPerControl) ddvPayrollEndDate5
,(select dbo.[dsi_fnPadZero]( replace (convert(varchar(20),SUM(coalesce (PdhEECurAmt,0))),'.',''),9,0)+'+' from PDedHist a with (nolock) where a.PdhEEID=b.PdhEEID and a.PdhPerControl=b.PdhPerControl and a.PdhDedCode = '401L5'  and a.PdhPerControl between @startpercontrol and @EndPerControl ) ddvPayAmount5
,'' ddvLoanNumber6
,(select top 1 convert (varchar(10),PrgPeriodEndDate,112) from PDedHist a with (nolock) where a.PdhEEID=b.PdhEEID and a.PdhPerControl=b.PdhPerControl and a.PdhDedCode = '401L6'   and a.PdhPerControl between @startpercontrol and @EndPerControl) ddvPayrollEndDate6
,(select  dbo.[dsi_fnPadZero]( replace (convert(varchar(20),SUM(coalesce (PdhEECurAmt,0))),'.',''),9,0)+'+' from PDedHist a with (nolock) where a.PdhEEID=b.PdhEEID and a.PdhPerControl=b.PdhPerControl and a.PdhDedCode = '401L6'  and a.PdhPerControl between @startpercontrol and @EndPerControl ) ddvPayAmount6
,'' ddvFiller2
into dbo.u_dsi_drv_Contribution_RecordDtbl
from PDedHist b join Payreg on PdhEEID=PrgEEID and PrgGenNumber=PdhGenNumber
join emppers on eepEEID=prgEEID
--join EmpComp on eepEEID=EecEEID /*and eepHomeCoID=EecCoID */
where PdhPerControl between @startpercontrol and @EndPerControl and PdhDedCode in ('401L','401L2','401L3','401l4','401l5','401l6')
and eepHomeCoID<>'055PB' and PdhEECurAmt>0.00
group by eepSSN,PdhDedCode,PrgPeriodEndDate,PdhPerControl,PdhEEID
order by eepSSN



insert into dbo.u_dsi_drv_Contribution_RecordBtbl (
ddvPlanId
,ddvSSN
,ddvRecordType
,ddvFiller1
,ddvPayrollEndDate
,ddvOverridePayrollEndDate
,ddvFiller2
)

select distinct 
case when PdhDedCode in ('EXNQB','EXNQC') then '072347' else '091509' end ddvPlanId
,eepSSN ddvSSN
,'B' ddvRecordType
,'' ddvFiller1
,convert (varchar(10),PrgPeriodEndDate,112)[ddvPayrollEndDate]
,convert (varchar(10),PrgPeriodEndDate,112) ddvOverridePayrollEndDate
,'' ddvFiller2
from PDedHist b join Payreg z on PdhEEID=PrgEEID and PrgPerControl=PdhPerControl
join emppers on eepEEID=prgEEID where PdhPerControl between @startpercontrol and @EndPerControl
and PdhDedCode in ('401CU','401K','401KA','401M7','401M8','EXNQB','EXNQC','401KR', '401KRU') and eepHomeCoID<>'055PB' -- (WC 2020-00270504)
group by case when PdhDedCode in ('EXNQB','EXNQC') then '072347' else '091509' end,eepSSN,PrgPeriodEndDate,PdhPerControl
order by eepSSN

---added and PdhPayDate between convert (datetime,@startdate) and convert (datetime,@enddate) to con Amount select

select distinct case when b.PdhDedCode in ('EXNQB','EXNQC') then '072347' else '091509' end ddvPlanId
,eepSSN ddvSSN
,convert (varchar(10),z.PrgPeriodEndDate,112)[ddvPayrollEndDate]
,case when b.PdhDedCode  in ('401K','401CU','401M7','401M8') then 'AAA' when b.pdhDedCode='EXNQC' and year(z.PrgPeriodEndDate)='2013' then 'EES' when b.pdhDedCode='EXNQC' and year(z.PrgPeriodEndDate)='2014' then 'EET' else '' end ddvContributionSource1
,case when PdhDedCode  in ('401K','401CU','401M7','401M8') then 
(select dbo.[dsi_fnPadZeroS](replace (CONVERT (varchar(20),sum(coalesce(pdhEEcurAmt,0))),'.',''),9,0) from PDedHist a with (nolock) where PdhDedCode in ('401K','401CU','401M7','401M8') and a.PdhPerControl=b.PdhPerControl and a.PdhEEID=b.PdhEEID and  b.PdhGenNumber=a.PdhGenNumber )
when PdhDedCode='EXNQC' then (select dbo.[dsi_fnPadZeroS](replace (CONVERT (varchar(20),sum(coalesce(pdhEEcurAmt,0))),'.',''),9,0) from PDedHist c where c.PdhPerControl=b.PdhPerControl and c.PdhEEID=b.PdhEEID and pdhDedCode='EXNQC') 
 else '' end ddvContributionAmount1
 ,'' ddvFiller3
,case when b.PdhDedCode in ('401K','401M7','401M8') then 'DDD' when PdhDedCode ='EXNQB' and year(PrgPeriodEndDate)='2013' then 'BBM' when PdhDedCode ='EXNQB' and year(PrgPeriodEndDate)='2014' then 'BBN' else '' end ddvContributionSource2
,case when PdhDedCode in ('401K','401M7','401M8') then 
(select dbo.[dsi_fnPadZeroS](replace (CONVERT (varchar(20),sum(coalesce(a.pdhERcurAmt,0))),'.',''),9,0) from PDedHist a with (nolock) where PdhDedCode in ('401K','401M7','401M8') and a.PdhPerControl=b.PdhPerControl and a.PdhEEID=b.PdhEEID and  b.PdhGenNumber=a.PdhGenNumber)
when PdhDedCode='EXNQB' then (select dbo.[dsi_fnPadZeroS](replace (CONVERT (varchar(20),sum(coalesce(c.pdhEEcurAmt,0))),'.',''),9,0) from PDedHist c where c.PdhPerControl=b.PdhPerControl and pdhDedCode='EXNQB')  else '' end
 --from Payreg d where d.PrgPerControl=b.PdhPerControl and d.PrgEEID=z.PrgEEID and b.PdhPerControl between @startpercontrol and @EndPerControl  ) 
 ddvContributionAmount2
,''ddvFiller4
,case b.pdhDedCode when '401KA' then 'GGG' else NULL end ddvContributionSource3
,case when  PdhDedCode = '401KA' then 
    (select dbo.[dsi_fnPadZeroS](replace (CONVERT (varchar(20),sum(coalesce(a.pdhEEcurAmt,0))),'.',''),9,0) from PDedHist a with (nolock) where a.PdhDedCode in ('401KA') and  a.PdhPerControl=b.PdhPerControl and a.PdhEEID=b.PdhEEID and  b.PdhGenNumber=a.PdhGenNumber )
    else '' end     ddvContributionAmount3
,ddvContributionSource4 = CASE WHEN b.pdhDedCode IN ('401KR', '401KRU') THEN 'NRB' END -- (WC 2020-00270504)
,ddvContributionAmount4 = -- (WC 2020-00270504)
	CASE 
		WHEN b.pdhDedCode IN ('401KR', '401KRU') THEN
			(select dbo.[dsi_fnPadZeroS](replace (CONVERT (varchar(20),sum(coalesce(a.pdhEEcurAmt,0))),'.',''),9,0) from PDedHist a with (nolock) where a.PdhDedCode in ('401KR', '401KRU') and  a.PdhPerControl=b.PdhPerControl and a.PdhEEID=b.PdhEEID and  b.PdhGenNumber=a.PdhGenNumber )
		ELSE ''
	END

into dbo.u_dsi_drv_Contribution_RecordBtbl_1
from  PDedHist b join Payreg z on PdhEEID=PrgEEID and PrgPerControl=PdhPerControl and PdhGenNumber=PrgGenNumber
join emppers on eepEEID=prgEEID 
join dbo.u_dsi_drv_Contribution_RecordBtbl on eepSSN=ddvSSN 
where PdhPerControl  between @startpercontrol and @EndPerControl
and PdhDedCode in ('401CU','401K','401KA','401M7','401M8','EXNQB','EXNQC', '401KR', '401KRU') and eepHomeCoID<>'055PB' ---and eepSSN='212909948'
order by eepSSN


update u_dsi_drv_Contribution_RecordBtbl
set ddvContributionSource1 =(select top 1 ltrim (rtrim(ddvContributionSource1))  from u_dsi_drv_Contribution_RecordBtbl_1 a where coalesce (a.ddvContributionSource1,'')<>''  and b.ddvPlanid=a.ddvplanid and b.ddvSSN=a.ddvSSN and b.ddvPayrollEndDate=a.ddvPayrollEndDate)
,ddvContributionAmount1=(select SUM(convert (int,ddvContributionAmount1)) from u_dsi_drv_Contribution_RecordBtbl_1 a where  b.ddvPlanid=a.ddvplanid and b.ddvSSN=a.ddvSSN and b.ddvPayrollEndDate=a.ddvPayrollEndDate)
,ddvContributionSource2= (select top 1 ltrim (rtrim(ddvContributionSource2))  from u_dsi_drv_Contribution_RecordBtbl_1 a where coalesce (a.ddvContributionSource2,'')<>''  and b.ddvPlanid=a.ddvplanid and b.ddvSSN=a.ddvSSN and b.ddvPayrollEndDate=a.ddvPayrollEndDate)
,ddvContributionAmount2=(select SUM(convert (int,ddvContributionAmount2)) from u_dsi_drv_Contribution_RecordBtbl_1 a where  b.ddvPlanid=a.ddvplanid and b.ddvSSN=a.ddvSSN and b.ddvPayrollEndDate=a.ddvPayrollEndDate)
,ddvContributionSource3=(select top 1 ltrim (rtrim(ddvContributionSource3))from u_dsi_drv_Contribution_RecordBtbl_1 a where coalesce (a.ddvContributionSource3,'')<>''  and b.ddvPlanid=a.ddvplanid and b.ddvSSN=a.ddvSSN and b.ddvPayrollEndDate=a.ddvPayrollEndDate)
,ddvContributionAmount3=(select SUM(convert (int,ddvContributionAmount3)) from u_dsi_drv_Contribution_RecordBtbl_1 a where  b.ddvPlanid=a.ddvplanid and b.ddvSSN=a.ddvSSN and b.ddvPayrollEndDate=a.ddvPayrollEndDate)
,ddvContributionSource4=(select top 1 ltrim (rtrim(ddvContributionSource4))from u_dsi_drv_Contribution_RecordBtbl_1 a where coalesce (a.ddvContributionSource4,'')<>''  and b.ddvPlanid=a.ddvplanid and b.ddvSSN=a.ddvSSN and b.ddvPayrollEndDate=a.ddvPayrollEndDate) -- (WC 2020-00270504)
,ddvContributionAmount4=(select SUM(convert (int,ddvContributionAmount4)) from u_dsi_drv_Contribution_RecordBtbl_1 a where  b.ddvPlanid=a.ddvplanid and b.ddvSSN=a.ddvSSN and b.ddvPayrollEndDate=a.ddvPayrollEndDate) -- (WC 2020-00270504)
from u_dsi_drv_Contribution_RecordBtbl b join u_dsi_drv_Contribution_RecordBtbl_1 c
on b.ddvPlanid=c.ddvplanid and b.ddvSSN=c.ddvSSN and b.ddvPayrollEndDate=c.ddvPayrollEndDate

update u_dsi_drv_Contribution_RecordBtbl set ddvContributionAmount1=case when convert (int,ddvContributionAmount1)=0 then NULL when convert (int,ddvContributionAmount1)<0 then dbo.[dsi_fnPadZeroS](ddvContributionAmount1,9,0) else dbo.[dsi_fnPadZeroS](ddvContributionAmount1,9,0)+'+' end 
,ddvContributionAmount2=case when convert (int,ddvContributionAmount2)=0 then NULL when convert (int,ddvContributionAmount2)<0 then dbo.[dsi_fnPadZeroS](ddvContributionAmount2,9,0) else dbo.[dsi_fnPadZeroS](ddvContributionAmount2,9,0)+'+' end
,ddvContributionAmount3=CASE when convert (int,ddvContributionAmount3)=0 then  NULL when convert (int,ddvContributionAmount3)<0 then dbo.[dsi_fnPadZeroS](ddvContributionAmount3,9,0)ELSE dbo.[dsi_fnPadZeroS](ddvContributionAmount3,9,0) +'+' END


-- (WC 2020-00270504)
IF OBJECT_ID('U_EVANSFFC_drvTbl_C_D03') IS NOT NULL 
	DROP TABLE dbo.U_EVANSFFC_drvTbl_C_D03;
SELECT DISTINCT
	--drvEEID = xEEID
	--,drvCoID = xCoID
	ddvSSN = ''
	-- Fields below are valid for export.
	,drvPlanId = ddvPlanId
	,drvSSN = ''
	,drvContributionSource1 = MAX(ddvContributionSource1)
	,drvContributionTotalAmount1 = CASE WHEN NULLIF(MAX(ddvContributionAmount1), '') IS NOT NULL THEN RIGHT(CONCAT('000000000', SUM(CONVERT(INT, REPLACE(ddvContributionAmount1, '+', ''))), '+'), 10) END
	,drvContributionSource2 = MAX(ddvContributionSource2)
	,drvContributionTotalAmount2 = CASE WHEN NULLIF(MAX(ddvContributionAmount2), '') IS NOT NULL THEN RIGHT(CONCAT('000000000', SUM(CONVERT(INT, REPLACE(ddvContributionAmount2, '+', ''))), '+'), 10) END
	,drvContributionSource3 = MAX(ddvContributionSource3)
	,drvContributionTotalAmount3 = CASE WHEN NULLIF(MAX(ddvContributionAmount3), '') IS NOT NULL THEN RIGHT(CONCAT('000000000', SUM(CONVERT(INT, REPLACE(ddvContributionAmount3, '+', ''))), '+'), 10) END
	,drvContributionSource4 = MAX(ddvContributionSource4)
	,drvContributionTotalAmount4 = CASE WHEN NULLIF(MAX(ddvContributionAmount4), '') IS NOT NULL THEN RIGHT(CONCAT('000000000', SUM(CONVERT(INT, REPLACE(ddvContributionAmount4, '+', ''))), '+'), 10) END
INTO dbo.U_EVANSFFC_drvTbl_C_D03
FROM dbo.U_EVANSFFC_EEList
INNER JOIN dbo.EmpPers WITH (NOLOCK)
	ON EepEEID = xEEID
INNER JOIN dbo.u_dsi_drv_Contribution_RecordBtbl b WITH (NOLOCK)
	ON b.ddvSSN = EepSSN
GROUP BY ddvPlanId

set @count=(select COUNT(*) from dbo.u_dsi_drv_Contribution_RecordBtbl)+(select COUNT(*) from dbo.u_dsi_drv_Contribution_RecordDtbl) + (SELECT COUNT(*) FROM dbo.U_EVANSFFC_drvTbl_C_D03 WITH (NOLOCK))

select '99999999999' dctTrailerNines
,'TRLR' dctTrailerIndicator
,'091509' dctPlanNumber
,@date dctDate
,@time dctTime
,dbo.[dsi_fnPadZeroS](convert (varchar (10),@count),10,0) dctRecordCount
,'' dctFiller1
into dbo.u_dsi_drv_Contribution_Trailertbl


update U_dsi_Parameters set ExportFile='091509_Vanguard_Contribution_'+@date
--where SystemID=@SystemID
where FormatCode = 'EVANSFFC'
GO
Create View dbo.dsi_vwEVANSFFC_Export as
        select top 2000000 Data from dbo.U_EVANSFFC_File with (nolock)
        order by substring(RecordSet,2,2), InitialSort