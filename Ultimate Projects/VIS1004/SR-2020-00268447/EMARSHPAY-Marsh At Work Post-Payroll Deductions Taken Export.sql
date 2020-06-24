SET NOCOUNT ON;
IF OBJECT_ID('U_EMARSHPAY_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EMARSHPAY_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EMARSHPAY_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EMARSHPAY' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEMARSHPAY_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEMARSHPAY_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EMARSHPAY') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EMARSHPAY];
GO
IF OBJECT_ID('U_EMARSHPAY_PDedHist') IS NOT NULL DROP TABLE [dbo].[U_EMARSHPAY_PDedHist];
GO
IF OBJECT_ID('U_EMARSHPAY_File') IS NOT NULL DROP TABLE [dbo].[U_EMARSHPAY_File];
GO
IF OBJECT_ID('U_EMARSHPAY_EEList') IS NOT NULL DROP TABLE [dbo].[U_EMARSHPAY_EEList];
GO
IF OBJECT_ID('U_EMARSHPAY_DrvTbl_T91') IS NOT NULL DROP TABLE [dbo].[U_EMARSHPAY_DrvTbl_T91];
GO
IF OBJECT_ID('U_EMARSHPAY_DrvTbl_H01') IS NOT NULL DROP TABLE [dbo].[U_EMARSHPAY_DrvTbl_H01];
GO
IF OBJECT_ID('U_EMARSHPAY_DrvTbl_D11') IS NOT NULL DROP TABLE [dbo].[U_EMARSHPAY_DrvTbl_D11];
GO
IF OBJECT_ID('U_EMARSHPAY_DedList') IS NOT NULL DROP TABLE [dbo].[U_EMARSHPAY_DedList];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EMARSHPAY';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EMARSHPAY';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EMARSHPAY';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EMARSHPAY';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EMARSHPAY';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCreateTClockBatches,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhRespectZeroPayRate,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhThirdPartyPay) VALUES ('N','C','Y','0','',NULL,'','N','','N','','013010','EMPEXPORT','SDF','EMARSHPAY','Marsh At Work Post-Payroll Deductions Taken Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','150','N','S','N','EMARSHPAY0Z0','N','Jan  1 1900 12:00AM','C','N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDR"','1','(''DA''=''F'')','EMARSHPAY0Z0','3','H','01','1',NULL,'PPFH-CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','2','(''SS''=''F'')','EMARSHPAY0Z0','8','H','01','4',NULL,'PPFH-JOB-NAME',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','3','(''SS''=''F'')','EMARSHPAY0Z0','8','H','01','12',NULL,'PPFH-JOB-STEP-NAME',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','4','(''SS''=''F'')','EMARSHPAY0Z0','7','H','01','20',NULL,'PPFH-FILE-ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PERSONAL PROTECTION PAN"','5','(''DA''=''F'')','EMARSHPAY0Z0','30','H','01','27',NULL,'PPFH-PROGRAM-NAME',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPayrollAccount"','6','(''UA''=''F'')','EMARSHPAY0Z0','20','H','01','57',NULL,'PPFH-PAYROLL-ACCOUNT',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvIplDate"','7','(''UD1''=''F'')','EMARSHPAY0Z0','8','H','01','77',NULL,'PPFH-IPL-DATE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBeginPayrollDate"','8','(''UD1''=''F'')','EMARSHPAY0Z0','8','H','01','85',NULL,'PPFH-BEGIN-PAYROLL-DATE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEndPayrollDate"','9','(''UD1''=''F'')','EMARSHPAY0Z0','8','H','01','93',NULL,'PPFH-END-PAYROLL-DATE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"00"','10','(''DA''=''F'')','EMARSHPAY0Z0','2','H','01','101',NULL,'PPFH-CYCLE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"N"','11','(''DA''=''F'')','EMARSHPAY0Z0','1','H','01','103',NULL,'PPFH-RUN-ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','12','(''SS''=''F'')','EMARSHPAY0Z0','6','H','01','104',NULL,'PPFH-TAPE-NUMBER',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','13','(''SS''=''F'')','EMARSHPAY0Z0','41','H','01','110',NULL,'FILLER',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"DTL"','1','(''DA''=''F'')','EMARSHPAY0Z0','3','D','11','1',NULL,'PPFH-CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSSN"','2','(''UA''=''F'')','EMARSHPAY0Z0','20','D','11','4',NULL,'PPFD-INSURED Ppfdinsured',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSSN2"','3','(''UA''=''F'')','EMARSHPAY0Z0','9','D','11','24',NULL,'PPFD-SSN-IRS-NUMBER',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','4','(''UA''=''F'')','EMARSHPAY0Z0','20','D','11','33',NULL,'PPFD-LAST-NAME',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','5','(''UA''=''F'')','EMARSHPAY0Z0','16','D','11','53',NULL,'PPFD-FIRST-NAME',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvInsuredStatus"','6','(''UA''=''F'')','EMARSHPAY0Z0','1','D','11','69',NULL,'PPFD-INSURED-STATUS',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','7','(''SS''=''F'')','EMARSHPAY0Z0','19','D','11','70',NULL,'PPFD-ITEM-ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDeductionAmount"','8','(''UN0''=''F'')','EMARSHPAY0Z0','7','D','11','89',NULL,'PPFD-DEDUCTION-AMOUNT',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','9','(''SS''=''F'')','EMARSHPAY0Z0','55','D','11','96',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"TRL"','1','(''DA''=''F'')','EMARSHPAY0Z0','3','T','91','1',NULL,'PPFT-CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','2','(''SS''=''F'')','EMARSHPAY0Z0','8','T','91','4',NULL,'PPFH-JOB-NAME',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','3','(''SS''=''F'')','EMARSHPAY0Z0','8','T','91','12',NULL,'PPFH-JOB-STEP-NAME',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','4','(''SS''=''F'')','EMARSHPAY0Z0','7','T','91','20',NULL,'PPFH-FILE-ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','5','(''SS''=''F'')','EMARSHPAY0Z0','30','T','91','27',NULL,'PPFH-PROGRAM-NAME',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPayrollAccount"','6','(''UA''=''F'')','EMARSHPAY0Z0','20','T','91','57',NULL,'PPFH-PAYROLL-ACCOUNT',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvIplDate"','7','(''UD1''=''F'')','EMARSHPAY0Z0','8','T','91','77',NULL,'PPFH-IPL-DATE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBeginPayrollDate"','8','(''UD1''=''F'')','EMARSHPAY0Z0','8','T','91','85',NULL,'PPFH-BEGIN-PAYROLL-DATE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEndPayrollDate"','9','(''UD1''=''F'')','EMARSHPAY0Z0','8','T','91','93',NULL,'PPFH-END-PAYROLL-DATE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"00"','10','(''DA''=''F'')','EMARSHPAY0Z0','2','T','91','101',NULL,'PPFH-CYCLE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"N"','11','(''DA''=''F'')','EMARSHPAY0Z0','1','T','91','103',NULL,'PPFH-RUN-ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','12','(''SS''=''F'')','EMARSHPAY0Z0','6','T','91','104',NULL,'PPFT-TAPE-NUMBER',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRecordCount"','13','(''UN0''=''F'')','EMARSHPAY0Z0','9','T','91','110',NULL,'PPFT-RECORD-COUNT',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRecordAmount"','14','(''UN0''=''F'')','EMARSHPAY0Z0','14','T','91','119',NULL,'PPFT-RECORD-AMOUNT',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','15','(''SS''=''F'')','EMARSHPAY0Z0','18','T','91','133',NULL,'FILLER',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
DECLARE @UDSERVER varchar(5) = (SELECT RTRIM(LEFT(@@SERVERNAME,PATINDEX('%[0-9]%',@@SERVERNAME)) + SUBSTRING(@@SERVERNAME,PATINDEX('%UP[0-9]%',@@SERVERNAME)+2,1)));
SELECT @UDSERVER = CASE WHEN @UDSERVER = 'EW21' THEN 'WP6' WHEN @UDSERVER = 'EW22' THEN 'WP7' ELSE @UDSERVER END;
DECLARE @UDCOCODE varchar(5) = (SELECT RTRIM(CmmCompanyCode) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\EMARSHPAY_20200601.txt',NULL,NULL,NULL,'MI55R,MI5IG,MI5FF',NULL,NULL,NULL,'Marsh Weekly OnDemand','202006019','EMPEXPORT','WK_XOE',NULL,'EMARSHPAY',NULL,NULL,NULL,'202006019','Jun  1 2020  9:22AM','Jun  1 2020  9:22AM','202006011',NULL,'','','202006011',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\EMARSHPAY_20200601.txt',NULL,NULL,NULL,'MI55R,MI5IG,MI5FF',NULL,NULL,NULL,'Marsh Weekly Scheduled','202006019','EMPEXPORT','WKSCHED',NULL,'EMARSHPAY',NULL,NULL,NULL,'202006019','Jun  1 2020  9:22AM','Jun  1 2020  9:22AM','202006011',NULL,'','','202006011',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\EMARSHPAY_20200601.txt',NULL,NULL,NULL,'MI55R,MI5IG,MI5FF',NULL,NULL,NULL,'Marsh Semi OnDemand','202006019','EMPEXPORT','SM_XOE',NULL,'EMARSHPAY',NULL,NULL,NULL,'202006019','Jun  1 2020  9:22AM','Jun  1 2020  9:22AM','202006011',NULL,'','','202006011',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\EMARSHPAY_20200601.txt',NULL,NULL,NULL,'MI55R,MI5IG,MI5FF',NULL,NULL,NULL,'Marsh Semi Scheduled','202006019','EMPEXPORT','SMSCHED',NULL,'EMARSHPAY',NULL,NULL,NULL,'202006019','Jun  1 2020  9:22AM','Jun  1 2020  9:22AM','202006011',NULL,'','','202006011',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\EMARSHPAY_20200601.txt',NULL,NULL,NULL,'MI55R,MI5IG,MI5FF',NULL,NULL,NULL,'Marsh Monthly OnDemand','202006019','EMPEXPORT','MTH_XOE',NULL,'EMARSHPAY',NULL,NULL,NULL,'202006019','Jun  1 2020  9:22AM','Jun  1 2020  9:22AM','202006011',NULL,'','','202006011',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\EMARSHPAY_20200601.txt',NULL,NULL,NULL,'MI55R,MI5IG,MI5FF',NULL,NULL,NULL,'Marsh Monthly Scheduled','202006019','EMPEXPORT','MTHSCHED',NULL,'EMARSHPAY',NULL,NULL,NULL,'202006019','Jun  1 2020  9:22AM','Jun  1 2020  9:22AM','202006011',NULL,'','','202006011',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
UPDATE dbo.AscExp SET expAscFileName = CASE WHEN LEFT(@UDENV,2) IN ('NW','EW','WP') THEN REPLACE(REPLACE(expAscFileName,'[UDENV]',@UDENV),'[UDSERVER]',@UDSERVER) ELSE '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\EMARSHPAY_20200601.txt' END WHERE expFormatCode = 'EMARSHPAY';
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EMARSHPAY','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EMARSHPAY','ExportPath','V',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EMARSHPAY','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EMARSHPAY','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EMARSHPAY','UseFileName','V','Y');
UPDATE dbo.U_dsi_Configuration SET CfgValue = CASE WHEN CfgName = 'UseFileName' THEN 'Y' ELSE NULL END WHERE FormatCode = 'EMARSHPAY' AND CfgName IN ('UseFileName','ExportPath');
INSERT INTO dbo.CustomTemplates (CreationDate,Engine,EngineCode,IsActive,ModifiedDate) SELECT CreationDate = GETDATE(), Engine = AdhEngine, EngineCode = AdhFormatCode, IsActive = 1, ModifiedDate = GETDATE() FROM dbo.AscDefH WITH (NOLOCK) WHERE AdhFormatCode = 'EMARSHPAY' AND NOT EXISTS(SELECT 1 FROM dbo.CustomTemplates WHERE EngineCode = AdhFormatCode);
IF OBJECT_ID('U_EMARSHPAY_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EMARSHPAY_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EMARSHPAY','H01','dbo.U_EMARSHPAY_DrvTbl_H01',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EMARSHPAY','D11','dbo.U_EMARSHPAY_DrvTbl_D11',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EMARSHPAY','T91','dbo.U_EMARSHPAY_DrvTbl_T91',NULL);
IF OBJECT_ID('U_EMARSHPAY_DedList') IS NULL
CREATE TABLE [dbo].[U_EMARSHPAY_DedList] (
    [DedCode] char(5) NOT NULL,
    [DedType] char(4) NOT NULL
);
IF OBJECT_ID('U_EMARSHPAY_EEList') IS NULL
CREATE TABLE [dbo].[U_EMARSHPAY_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EMARSHPAY_File') IS NULL
CREATE TABLE [dbo].[U_EMARSHPAY_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] char(150) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EMARSHPAY]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: Visteon Corporation

Created By: Wyle Cordero
Business Analyst: Jodi Anderson
Create Date: 06/01/2020
Service Request Number: SR-2020-00268447

Purpose: Marsh At Work Post-Payroll Deductions Taken Export

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2020     SR-2020-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EMARSHPAY';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EMARSHPAY';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EMARSHPAY';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EMARSHPAY';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EMARSHPAY' ORDER BY RunID DESC;

Execute Export
--------------
-- Weekly
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EMARSHPAY', 'WK_XOE';

-- Semi-Monthly
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EMARSHPAY', 'SM_XOE';

-- Monthly
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EMARSHPAY', 'MTH_XOE';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'EMARSHPAY', @AllObjects = 'Y', @IsWeb = 'Y'
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
    SELECT @FormatCode = 'EMARSHPAY';

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
    DELETE FROM dbo.U_EMARSHPAY_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_EMARSHPAY_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

    --==========================================
    -- Create Deduction List
    --==========================================
    DECLARE @DedList VARCHAR(MAX)
    SET @DedList = 'PERPP,PERPM';

    IF OBJECT_ID('U_EMARSHPAY_DedList','U') IS NOT NULL
        DROP TABLE dbo.U_EMARSHPAY_DedList;
    SELECT DISTINCT
         DedCode = DedDedCode
        ,DedType = DedDedType
    INTO dbo.U_EMARSHPAY_DedList
    FROM dbo.fn_ListToTable(@DedList)
    JOIN dbo.DedCode WITH (NOLOCK)
        ON DedDedCode = Item;

    --==========================================
    -- Build Working Tables
    --==========================================

    -----------------------------
    -- Working Table - PDedHist
    -----------------------------
    IF OBJECT_ID('U_EMARSHPAY_PDedHist','U') IS NOT NULL
        DROP TABLE dbo.U_EMARSHPAY_PDedHist;
    SELECT DISTINCT
         PdhEEID
		,PdhNameFirst = MAX(PrgNameFirst)
		,PdhNameLast = MAX(PrgNameLast)
		,PdhSSN = MAX(PrgSSN)
		,PdhPayFrequency = MAX(PgrPayFrequency)
		,PdhDedCode
		,PdhPayDate = MAX(PrgPayDate)
		,PdhPeriodStartDate = MAX(PrgPeriodStartDate)
		,PdhPeriodEndDate = MAX(PrgPeriodEndDate)
        ,PdhEECurAmt = CONVERT(DECIMAL(15,2), SUM(COALESCE(PdhEECurAmt, 0.00)))
    INTO dbo.U_EMARSHPAY_PDedHist
    FROM dbo.PayReg WITH (NOLOCK)
	INNER JOIN dbo.PDedHist WITH (NOLOCK)
		ON PdhGenNumber = PrgGenNumber
    JOIN dbo.U_EMARSHPAY_DedList WITH (NOLOCK)
        ON DedCode = PdhDedCode
	INNER JOIN dbo.PayGroup WITH (NOLOCK)
		ON PgrPayGroup = PrgPayGroup
		AND PgrPayFrequency = 
			CASE
				WHEN @ExportCode LIKE 'WK%' THEN 'W'
				WHEN @ExportCode LIKE 'SM%' THEN 'S'
				WHEN @ExportCode LIKE 'MTH%' THEN 'M'
			END
    WHERE PrgPerControl BETWEEN @StartPerControl AND @EndPerControl
	AND EXISTS (SELECT 1 FROM dbo.U_EMARSHPAY_EEList WITH (NOLOCK) WHERE xEEID = PdhEEID)
    GROUP BY PdhEEID, PdhDedCode
    HAVING SUM(PdhEECurAmt) <> 0.00
	OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EMARSHPAY_PDedHist ON dbo.U_EMARSHPAY_PDedHist (PdhSSN);


    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_EMARSHPAY_DrvTbl_D11
    ---------------------------------
    IF OBJECT_ID('U_EMARSHPAY_DrvTbl_D11','U') IS NOT NULL
        DROP TABLE dbo.U_EMARSHPAY_DrvTbl_D11;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = PdhSSN
		,drvPayRollAccount = CASE WHEN PdhPayFrequency = 'S' THEN '381519020990124' ELSE '381519020990112' END
		,drvPeriodStartDate = PdhPeriodStartDate
		,drvPeriodEndDate = PdhPeriodEndDate
        -- standard fields above and additional driver fields below
        ,drvSSN = PdhSSN
        ,drvSSN2 = PdhSSN
        ,drvNameLast = PdhNameLast
        ,drvNameFirst = PdhNameFirst
        ,drvInsuredStatus = 
			CASE
				WHEN EecEmplStatus = 'T' THEN 
					CASE
						WHEN EecTermReason = '203' THEN 'D'
						WHEN EecTermReason IN ('202', '220V', '221V', '222V', '223V') THEN 'R'
						ELSE 'T'
					END
				ELSE EecEmplStatus
			END
        ,drvDeductionAmount = PdhEECurAmt
    INTO dbo.U_EMARSHPAY_DrvTbl_D11
    FROM dbo.U_EMARSHPAY_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID
		AND EecCoID = xCoId
	INNER JOIN dbo.U_EMARSHPAY_PDedHist WITH (NOLOCK)
		ON PdhEEID = xEEID
    ;

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EMARSHPAY_DrvTbl_D11 ON dbo.U_EMARSHPAY_DrvTbl_D11(drvInitialSort);

    ---------------------------------
    -- HEADER RECORD
    ---------------------------------
    IF OBJECT_ID('U_EMARSHPAY_DrvTbl_H01','U') IS NOT NULL
        DROP TABLE dbo.U_EMARSHPAY_DrvTbl_H01;
    SELECT DISTINCT
         drvPayrollAccount = drvPayRollAccount
        ,drvIplDate = GETDATE()
        ,drvBeginPayrollDate = MAX(drvPeriodEndDate)
        ,drvEndPayrollDate = MAX(drvPeriodStartDate)
    INTO dbo.U_EMARSHPAY_DrvTbl_H01
    FROM dbo.U_EMARSHPAY_DrvTbl_D11 WITH (NOLOCK)
	GROUP BY drvPayRollAccount;

    ---------------------------------
    -- TRAILER RECORD
    ---------------------------------
    IF OBJECT_ID('U_EMARSHPAY_DrvTbl_T91','U') IS NOT NULL
        DROP TABLE dbo.U_EMARSHPAY_DrvTbl_T91;
    SELECT DISTINCT
         drvPayrollAccount = drvPayRollAccount
        ,drvIplDate = GETDATE()
        ,drvBeginPayrollDate = MAX(drvPeriodEndDate)
        ,drvEndPayrollDate = MAX(drvPeriodStartDate)
        ,drvRecordCount = COUNT(drvEEID)
        ,drvRecordAmount = SUM(COALESCE(drvDeductionAmount, 0.00))
    INTO dbo.U_EMARSHPAY_DrvTbl_T91
    FROM dbo.U_EMARSHPAY_DrvTbl_D11 WITH (NOLOCK)
	GROUP BY drvPayRollAccount;

END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwEMARSHPAY_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_EMARSHPAY_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'EMARSHPAY%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202004271'
       ,expStartPerControl     = '202004271'
       ,expLastEndPerControl   = '202006059'
       ,expEndPerControl       = '202006019'
WHERE expFormatCode = 'EMARSHPAY';

**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwEMARSHPAY_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_EMARSHPAY_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort
