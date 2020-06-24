SET NOCOUNT ON;
IF OBJECT_ID('U_ETHOMASCMP_SavePath') IS NOT NULL DROP TABLE [dbo].[U_ETHOMASCMP_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_ETHOMASCMP_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'ETHOMASCMP' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwETHOMASCMP_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwETHOMASCMP_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_ETHOMASCMP') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_ETHOMASCMP];
GO
IF OBJECT_ID('U_ETHOMASCMP_Current_PEarHist') IS NOT NULL DROP TABLE [dbo].[U_ETHOMASCMP_Current_PEarHist];
GO
IF OBJECT_ID('U_ETHOMASCMP_YTD_PEarHist') IS NOT NULL DROP TABLE [dbo].[U_ETHOMASCMP_YTD_PEarHist];
GO
IF OBJECT_ID('U_ETHOMASCMP_File') IS NOT NULL DROP TABLE [dbo].[U_ETHOMASCMP_File];
GO
IF OBJECT_ID('U_ETHOMASCMP_EEList') IS NOT NULL DROP TABLE [dbo].[U_ETHOMASCMP_EEList];
GO
IF OBJECT_ID('U_ETHOMASCMP_AuditFields') IS NOT NULL DROP TABLE [dbo].[U_ETHOMASCMP_AuditFields];
GO
IF OBJECT_ID('U_ETHOMASCMP_Audit') IS NOT NULL DROP TABLE [dbo].[U_ETHOMASCMP_Audit];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'ETHOMASCMP';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'ETHOMASCMP';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'ETHOMASCMP';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'ETHOMASCMP';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'ETHOMASCMP';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCreateTClockBatches,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhRespectZeroPayRate,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhThirdPartyPay) VALUES ('N','C','Y','0','',NULL,'','N','','N','','013010','EMPEXPORT','SDF','ETHOMASCMP','Thomas & Company Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','210','N','S','N','ETHOMASCMPZ0','N','Jan  1 1900 12:00AM','C','N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"H1"','1','(''DA''=''F'')','ETHOMASCMPZ0','2','H','01','1',NULL,'Record Id',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFileDate"','2','(''UD112''=''F'')','ETHOMASCMPZ0','8','H','01','3',NULL,'File Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"BVSL"','3','(''DA''=''F'')','ETHOMASCMPZ0','12','H','01','11',NULL,'Company Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Brightview Senior Living"','4','(''DA''=''F'')','ETHOMASCMPZ0','40','H','01','23',NULL,'Company Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','5','(''SS''=''F'')','ETHOMASCMPZ0','148','H','01','63',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"E1"','1','(''DA''=''F'')','ETHOMASCMPZ0','2','D','11','1',NULL,'Record Id',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSSN"','2','(''UA''=''F'')','ETHOMASCMPZ0','9','D','11','3',NULL,'Employee SSN',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','3','(''UA''=''F'')','ETHOMASCMPZ0','25','D','11','12',NULL,'Employee Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','4','(''UA''=''F'')','ETHOMASCMPZ0','15','D','11','37',NULL,'Employee First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameMiddle"','5','(''UA''=''F'')','ETHOMASCMPZ0','1','D','11','52',NULL,'Employee Middle Initial',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvOrgLvl1"','6','(''UA''=''F'')','ETHOMASCMPZ0','15','D','11','53',NULL,'Location Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','7','(''UD112''=''F'')','ETHOMASCMPZ0','8','D','11','68',NULL,'First Day Worked',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastWorked"','8','(''UD112''=''F'')','ETHOMASCMPZ0','8','D','11','76',NULL,'Last Day Worked',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmplStatus"','9','(''UA''=''F'')','ETHOMASCMPZ0','1','D','11','84',NULL,'Employee Status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTermReason"','10','(''UA''=''F'')','ETHOMASCMPZ0','15','D','11','85',NULL,'Separation Reason Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','11','(''SS''=''F'')','ETHOMASCMPZ0','20','D','11','100',NULL,'Miscellaneous Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','12','(''SS''=''F'')','ETHOMASCMPZ0','50','D','11','120',NULL,'Comments',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfOriginalHire"','13','(''UD112''=''F'')','ETHOMASCMPZ0','8','D','11','170',NULL,'Original First Day Worked',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','14','(''UA''=''F'')','ETHOMASCMPZ0','15','D','11','178',NULL,'Employee ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAuthenticationIDPIN"','15','(''UA''=''F'')','ETHOMASCMPZ0','15','D','11','193',NULL,'Authentication ID (PIN)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','16','(''SS''=''F'')','ETHOMASCMPZ0','3','D','11','208',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"E2"','1','(''DA''=''F'')','ETHOMASCMPZ0','2','D','12','1',NULL,'Record Id',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSSN"','2','(''UA''=''F'')','ETHOMASCMPZ0','9','D','12','3',NULL,'Employee SSN',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine1"','3','(''UA''=''F'')','ETHOMASCMPZ0','30','D','12','12',NULL,'Employee Address 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine2"','4','(''UA''=''F'')','ETHOMASCMPZ0','30','D','12','42',NULL,'Employee Address 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressCity"','5','(''UA''=''F'')','ETHOMASCMPZ0','20','D','12','72',NULL,'Employee City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressState"','6','(''UA''=''F'')','ETHOMASCMPZ0','2','D','12','92',NULL,'Employee State',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressZipCode5"','7','(''UA''=''F'')','ETHOMASCMPZ0','5','D','12','94',NULL,'Employee Zip Code (5 Digit)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressZipCode4"','8','(''UA''=''F'')','ETHOMASCMPZ0','4','D','12','99',NULL,'Employee Zip Code (4 Digit ext)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPosition"','9','(''UA''=''F'')','ETHOMASCMPZ0','40','D','12','103',NULL,'Position',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalaryOrHourly"','10','(''UA''=''F'')','ETHOMASCMPZ0','1','D','12','143',NULL,'Position Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPositionStatus"','11','(''UA''=''F'')','ETHOMASCMPZ0','1','D','12','144',NULL,'Position Status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPayRate"','12','(''UA''=''F'')','ETHOMASCMPZ0','9','D','12','145',NULL,'Pay Rate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvScheduledWorkHrs"','13','(''UA''=''F'')','ETHOMASCMPZ0','4','D','12','154',NULL,'Standard Hours Per Week',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPayPeriod"','14','(''UA''=''F'')','ETHOMASCMPZ0','1','D','12','158',NULL,'Pay Frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEligibleForMedicalCoverage"','15','(''UA''=''F'')','ETHOMASCMPZ0','1','D','12','159',NULL,'Eligible for Medical Coverage',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMultiPositionIndicator"','16','(''UA''=''F'')','ETHOMASCMPZ0','1','D','12','160',NULL,'Multi-Position Indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','17','(''SS''=''F'')','ETHOMASCMPZ0','50','D','12','161',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"P1"','1','(''DA''=''F'')','ETHOMASCMPZ0','2','D','13','1',NULL,'Record Id',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSSN"','2','(''UA''=''F'')','ETHOMASCMPZ0','9','D','13','3',NULL,'Employee SSN',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFedTaxID"','3','(''UA''=''F'')','ETHOMASCMPZ0','10','D','13','12',NULL,'Federal ID Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStateUINumber"','4','(''UA''=''F'')','ETHOMASCMPZ0','15','D','13','22',NULL,'State UI Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocationStateCode"','5','(''UA''=''F'')','ETHOMASCMPZ0','2','D','13','37',NULL,'Location State Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvOrgLvl1"','6','(''UA''=''F'')','ETHOMASCMPZ0','15','D','13','39',NULL,'Location Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPayDate"','7','(''UD112''=''F'')','ETHOMASCMPZ0','8','D','13','54',NULL,'Check Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGrossPay"','8','(''UA''=''F'')','ETHOMASCMPZ0','9','D','13','62',NULL,'Gross Pay',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNetPay"','9','(''UA''=''F'')','ETHOMASCMPZ0','9','D','13','71',NULL,'Net Pay',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGrossBasePay"','10','(''UA''=''F'')','ETHOMASCMPZ0','9','D','13','80',NULL,'Gross Base Pay',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGrossOverTimePay"','11','(''UA''=''F'')','ETHOMASCMPZ0','9','D','13','89',NULL,'Gross Overtime Pay',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGrossBonusPay"','12','(''UA''=''F'')','ETHOMASCMPZ0','9','D','13','98',NULL,'Gross Bonus Pay',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGrossCommission"','13','(''UA''=''F'')','ETHOMASCMPZ0','9','D','13','107',NULL,'Gross Commission',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGrossSeverance"','14','(''UA''=''F'')','ETHOMASCMPZ0','9','D','13','116',NULL,'Gross Severance',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGrossOtherPay"','15','(''UA''=''F'')','ETHOMASCMPZ0','9','D','13','125',NULL,'Gross Other Pay',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvHours"','16','(''UA''=''F'')','ETHOMASCMPZ0','7','D','13','134',NULL,'Hours',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGrossPayYTD"','17','(''UA''=''F'')','ETHOMASCMPZ0','10','D','13','141',NULL,'Gross Pay (YTD)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGrossBasePayYTD"','18','(''UA''=''F'')','ETHOMASCMPZ0','10','D','13','151',NULL,'Gross Base Pay (YTD)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGrossOvertimePayYTD"','19','(''UA''=''F'')','ETHOMASCMPZ0','10','D','13','161',NULL,'Gross Overtime Pay (YTD)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGrossBonusPayYTD"','20','(''UA''=''F'')','ETHOMASCMPZ0','10','D','13','171',NULL,'Gross Bonus Pay (YTD)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGrossCommissionYTD"','21','(''UA''=''F'')','ETHOMASCMPZ0','10','D','13','181',NULL,'Gross Commission (YTD)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGrossSeveranceYTD"','22','(''UA''=''F'')','ETHOMASCMPZ0','10','D','13','191',NULL,'Gross Severance (YTD)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGrossOtherPayYTD"','23','(''UA''=''F'')','ETHOMASCMPZ0','10','D','13','201',NULL,'Gross Other Pay (YTD)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"L1"','1','(''DA''=''F'')','ETHOMASCMPZ0','2','D','14','1',NULL,'Record Id',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocCode"','2','(''UA''=''F'')','ETHOMASCMPZ0','15','D','14','3',NULL,'Location Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocDesc"','3','(''UA''=''F'')','ETHOMASCMPZ0','30','D','14','18',NULL,'Location Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocAddressLine1"','4','(''UA''=''F'')','ETHOMASCMPZ0','30','D','14','48',NULL,'Address Line 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocAddressLine2"','5','(''UA''=''F'')','ETHOMASCMPZ0','30','D','14','78',NULL,'Address Line 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocAddressCity"','6','(''UA''=''F'')','ETHOMASCMPZ0','20','D','14','108',NULL,'City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocAddresState"','7','(''UA''=''F'')','ETHOMASCMPZ0','2','D','14','128',NULL,'State',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocAdressZipCode5"','8','(''UA''=''F'')','ETHOMASCMPZ0','5','D','14','130',NULL,'Zip Code (5 digit)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocAddressZipCode4"','9','(''UA''=''F'')','ETHOMASCMPZ0','4','D','14','135',NULL,'Zip Code (4 digit ext)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocPhoneMainNumber"','10','(''UA''=''F'')','ETHOMASCMPZ0','10','D','14','139',NULL,'Phone Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFedTaxID"','11','(''UA''=''F'')','ETHOMASCMPZ0','10','D','14','149',NULL,'Federal ID Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSUIAccountNumber"','12','(''UA''=''F'')','ETHOMASCMPZ0','15','D','14','159',NULL,'SUI Account Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','13','(''SS''=''F'')','ETHOMASCMPZ0','10','D','14','174',NULL,'Group Code 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','14','(''SS''=''F'')','ETHOMASCMPZ0','10','D','14','184',NULL,'Group Code 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','15','(''SS''=''F'')','ETHOMASCMPZ0','10','D','14','194',NULL,'Group Code 3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','16','(''SS''=''F'')','ETHOMASCMPZ0','7','D','14','204',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"S1"','1','(''DA''=''F'')','ETHOMASCMPZ0','2','D','15','1',NULL,'Record Id',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTchCode"','2','(''UA''=''F'')','ETHOMASCMPZ0','15','D','15','3',NULL,'Separation Reason Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTchDesc"','3','(''UA''=''F'')','ETHOMASCMPZ0','50','D','15','18',NULL,'Separation Reason Description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','4','(''SS''=''F'')','ETHOMASCMPZ0','143','D','15','68',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"T1"','1','(''DA''=''F'')','ETHOMASCMPZ0','2','T','91','1',NULL,'Record Id',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTotalE1Records"','2','(''UN0''=''F'')','ETHOMASCMPZ0','7','T','91','3',NULL,'Total E1 Records',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTotalE2Records"','3','(''UN0''=''F'')','ETHOMASCMPZ0','7','T','91','10',NULL,'Total E2 Records',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTotalE3Records"','4','(''UN0''=''F'')','ETHOMASCMPZ0','7','T','91','17',NULL,'Total E3 Records',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTotalP1Records"','5','(''UN0''=''F'')','ETHOMASCMPZ0','7','T','91','24',NULL,'Total P1 Records',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTotalD1Records"','6','(''UN0''=''F'')','ETHOMASCMPZ0','7','T','91','31',NULL,'Total D1 Records',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTotalB1Records"','7','(''UN0''=''F'')','ETHOMASCMPZ0','7','T','91','38',NULL,'Total B1 Records',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTotalL1Records"','8','(''UN0''=''F'')','ETHOMASCMPZ0','7','T','91','45',NULL,'Total L1 Records',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTotalL2Records"','9','(''UN0''=''F'')','ETHOMASCMPZ0','7','T','91','52',NULL,'Total L2 Records',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTotalP2Records"','10','(''UN0''=''F'')','ETHOMASCMPZ0','7','T','91','59',NULL,'Total P2 Records',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTotalP3Records"','11','(''UN0''=''F'')','ETHOMASCMPZ0','7','T','91','66',NULL,'Total P3 Records',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTotalS1Records"','12','(''UN0''=''F'')','ETHOMASCMPZ0','7','T','91','73',NULL,'Total S1 Records',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','13','(''SS''=''F'')','ETHOMASCMPZ0','131','T','91','80',NULL,'Filler',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
DECLARE @UDSERVER varchar(5) = (SELECT RTRIM(LEFT(@@SERVERNAME,PATINDEX('%[0-9]%',@@SERVERNAME)) + SUBSTRING(@@SERVERNAME,PATINDEX('%UP[0-9]%',@@SERVERNAME)+2,1)));
SELECT @UDSERVER = CASE WHEN @UDSERVER = 'EW21' THEN 'WP6' WHEN @UDSERVER = 'EW22' THEN 'WP7' ELSE @UDSERVER END;
DECLARE @UDCOCODE varchar(5) = (SELECT RTRIM(CmmCompanyCode) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\ETHOMASCMP_20200514.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Thomas & Company OnDemand','202005149','EMPEXPORT','ONDMD_XOE',NULL,'ETHOMASCMP',NULL,NULL,NULL,'202005149','May 14 2020  1:57PM','May 14 2020  1:57PM','202005141',NULL,'','','202005141',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\ETHOMASCMP_20200514.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Thomas & Company Scheduled','202005149','EMPEXPORT','SCHEDULED',NULL,'ETHOMASCMP',NULL,NULL,NULL,'202005149','May 14 2020  1:57PM','May 14 2020  1:57PM','202005141',NULL,'','','202005141',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
UPDATE dbo.AscExp SET expAscFileName = CASE WHEN LEFT(@UDENV,2) IN ('NW','EW','WP') THEN REPLACE(REPLACE(expAscFileName,'[UDENV]',@UDENV),'[UDSERVER]',@UDSERVER) ELSE '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\ETHOMASCMP_20200514.txt' END WHERE expFormatCode = 'ETHOMASCMP';
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ETHOMASCMP','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ETHOMASCMP','ExportPath','V',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ETHOMASCMP','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ETHOMASCMP','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ETHOMASCMP','UseFileName','V','Y');
UPDATE dbo.U_dsi_Configuration SET CfgValue = CASE WHEN CfgName = 'UseFileName' THEN 'Y' ELSE NULL END WHERE FormatCode = 'ETHOMASCMP' AND CfgName IN ('UseFileName','ExportPath');
INSERT INTO dbo.CustomTemplates (CreationDate,Engine,EngineCode,IsActive,ModifiedDate) SELECT CreationDate = GETDATE(), Engine = AdhEngine, EngineCode = AdhFormatCode, IsActive = 1, ModifiedDate = GETDATE() FROM dbo.AscDefH WITH (NOLOCK) WHERE AdhFormatCode = 'ETHOMASCMP' AND NOT EXISTS(SELECT 1 FROM dbo.CustomTemplates WHERE EngineCode = AdhFormatCode);
IF OBJECT_ID('U_ETHOMASCMP_SavePath') IS NOT NULL DROP TABLE [dbo].[U_ETHOMASCMP_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ETHOMASCMP','H01','dbo.U_ETHOMASCMP_DrvTbl_H01',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ETHOMASCMP','D11','dbo.U_ETHOMASCMP_DrvTbl_E1_D11',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ETHOMASCMP','D12','dbo.U_ETHOMASCMP_DrvTbl_E2_D12',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ETHOMASCMP','D13','dbo.U_ETHOMASCMP_DrvTbl_P1_D13',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ETHOMASCMP','D14','dbo.U_ETHOMASCMP_DrvTbl_L1_D14',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ETHOMASCMP','D15','dbo.U_ETHOMASCMP_DrvTbl_S1_D15',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ETHOMASCMP','T91','dbo.U_ETHOMASCMP_DrvTbl_T91',NULL);
IF OBJECT_ID('U_ETHOMASCMP_Audit') IS NULL
CREATE TABLE [dbo].[U_ETHOMASCMP_Audit] (
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
IF OBJECT_ID('U_ETHOMASCMP_AuditFields') IS NULL
CREATE TABLE [dbo].[U_ETHOMASCMP_AuditFields] (
    [aTableName] varchar(30) NULL,
    [aFieldName] varchar(30) NULL
);
IF OBJECT_ID('U_ETHOMASCMP_EEList') IS NULL
CREATE TABLE [dbo].[U_ETHOMASCMP_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_ETHOMASCMP_File') IS NULL
CREATE TABLE [dbo].[U_ETHOMASCMP_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] char(210) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_ETHOMASCMP]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: Brightview Senior Living, LLC

Created By: Wyle Cordero
Business Analyst: Josh Smith
Create Date: 05/14/2020
Service Request Number: SR-2020-00264748

Purpose: Thomas & Company Export

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2020     SR-2020-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'ETHOMASCMP';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'ETHOMASCMP';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'ETHOMASCMP';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'ETHOMASCMP';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'ETHOMASCMP' ORDER BY RunID DESC;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'ETHOMASCMP', 'ONDMD_XOE';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'ETHOMASCMP', @AllObjects = 'Y', @IsWeb = 'Y'
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
    SELECT @FormatCode = 'ETHOMASCMP';

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
    DELETE FROM dbo.U_ETHOMASCMP_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_ETHOMASCMP_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

	-- Exclude EecOrgLvl1
	DELETE el
	FROM dbo.U_ETHOMASCMP_EEList el
	INNER JOIN dbo.EmpComp 
		ON EecEEID = xEEID
		AND EecCOID = xCoID
		AND EecOrgLvl1 IN (
			'0200', '1001', '1002', '1003', '1004', '1006', '1007', '1008', '1009', '1010', '1011', '1012', '1013', '1014', '1015', 
			'1016', '1017', '1018', '1020', '1022', '1025', '1026', '1027', '1029', '1030', '1031', '1032', '1033', '1034', '1035', 
			'1040', '1044', '1045', '1047', '1049', '1050', '1052', '1054', '1055', '1056', '1057', '1058', '1059', '1060', '1062', 
			'1063', '1064', '1065', '1066', '1067', '1068', '1075', '1077', '1502', '1510', '1511', '1517', '1518', '1519', '1520', 
			'1521', '1522', '1523', '1524', '1525', '1529', '4001', '4005', '4602', '4603', '4605', '6001', '6003', '6004', '6007', 
			'6008', '6009', '6012', '6013', '6014', '6015', '6016', '6099', '6108', 'ZBVSL')
	;


    --==========================================
    -- Audit Section
    --==========================================
    -- Get data from audit fields table. Add fields here if auditing
    IF OBJECT_ID('U_ETHOMASCMP_AuditFields','U') IS NOT NULL
        DROP TABLE dbo.U_ETHOMASCMP_AuditFields;
    CREATE TABLE dbo.U_ETHOMASCMP_AuditFields (aTableName varchar(30),aFieldName varchar(30));

    INSERT INTO dbo.U_ETHOMASCMP_AuditFields VALUES ('EmpComp','EecDateOfTermination');

    -- Create audit table based on fields defined above
    IF OBJECT_ID('U_ETHOMASCMP_Audit','U') IS NOT NULL
        DROP TABLE dbo.U_ETHOMASCMP_Audit;
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
    INTO dbo.U_ETHOMASCMP_Audit
    FROM dbo.vw_AuditData WITH (NOLOCK) 
    JOIN dbo.U_ETHOMASCMP_AuditFields WITH (NOLOCK) 
        ON audTableName = aTableName
        AND audFieldName = aFieldName
    WHERE audDateTime BETWEEN @StartDate AND @EndDate
    AND audAction <> 'DELETE';

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_ETHOMASCMP_Audit ON dbo.U_ETHOMASCMP_Audit (audEEID,audKey2);

	-- Only allow recent terms keyed within the date range of interface.
	DELETE EEList 
	FROM dbo.U_ETHOMASCMP_EEList EEList 
	INNER JOIN dbo.EmpComp
	    ON xCoID = EecCoID
		AND xEEID = EecEEID
		AND EecEmplStatus = 'T'
	    AND NOT EXISTS (	
			SELECT 1 FROM dbo.U_ETHOMASCMP_Audit 
	        WHERE xCoID = audKey2 
			AND xEEID = audEEID 
			AND audRowNo = 1
			AND audFieldName = 'EecDateOfTermination' AND audNewValue IS NOT NULL)
	;

	-- Exclude future term date employees.
	DELETE EEList 
	FROM dbo.U_ETHOMASCMP_EEList EEList 
	INNER JOIN dbo.EmpComp
	    ON xCoID = EecCoID
		AND xEEID = EecEEID
		AND EecEmplStatus = 'T'
		AND EecDateOfTermination > @EndDate
	;

    -----------------------------
    -- Working Table - Current PEarHist
    -----------------------------
    IF OBJECT_ID('U_ETHOMASCMP_Current_PEarHist','U') IS NOT NULL
        DROP TABLE dbo.U_ETHOMASCMP_Current_PEarHist;
    SELECT DISTINCT
         PehEEID
        ,PehPayDate = MAX(PrgPayDate)
		,PehStateUINumber = MAX(CtcIDNumber)
		,PehLocation = PrgLocation
		,PehStateSUI = LEFT(RTRIM(LTRIM(PrgStateSUI)), 2)
		,PehGrossPay = CONVERT(DECIMAL(15,2), SUM(COALESCE(PehCurAmt, 0.00)))
		,PehNetPay = CONVERT(DECIMAL(15,2),MAX(PrgNetAmt))
		,PehGrossBasePay = CONVERT(DECIMAL(15,2), SUM(CASE WHEN PehEarnCode IN ('REG','HOLPT','HOLWF','HOL','BEREV','PTO','JURY','MDSC','MSIC') THEN PehCurAmt ELSE 0.00 END))
		,PehGrossOvertimePay = CONVERT(DECIMAL(15,2), SUM(CASE WHEN PehEarnCode IN ('OT','COT','COLBK','COTF') THEN PehCurAmt ELSE 0.00 END))
		,PehGrossBonusPay = CONVERT(DECIMAL(15,2), SUM(
			CASE 
				WHEN PehEarnCode IN ('BONUS','ASOY','ASMTH','ASQTR','AWARD','AWDT','COVPR','EDGA','GIFTC','HERO','HREWD',
					'ICG','ICM','MENP','OCBV','OCWP','PTOP','REFEE','REFR','RETRO','SHIF1','SHIF2','SHIF3','SHIF4','SHIF5',
					'SHIF6','SRRA','TRAIN','WEP','WON','WRK','WRK2') 
				THEN PehCurAmt 
				ELSE 0.00 
			END))
		,PehGrossCommission = CONVERT(DECIMAL(15,2), SUM(CASE WHEN PehEarnCode = 'COMM' THEN PehCurAmt ELSE 0.00 END))
		,PehGrossSeverance = CONVERT(DECIMAL(15,2), SUM(CASE WHEN PehEarnCode = 'SEVER' THEN PehCurAmt ELSE 0.00 END))
		,PehGrossOtherPay = CONVERT(DECIMAL(15,2), SUM(
			CASE 
				WHEN PehEarnCode NOT IN ('BONUS','ASOY','ASMTH','ASQTR','AWARD','AWDT','COVPR','EDGA','GIFTC','HERO','HREWD',
					'ICG','ICM','MENP','OCBV','OCWP','PTOP','REFEE','REFR','RETRO','SHIF1','SHIF2','SHIF3','SHIF4','SHIF5',
					'SHIF6','SRRA','TRAIN','WEP','WON','WRK','WRK2','OT', 'COT','COLBK','COTF', 'REG', 'HOLPT','HOLWF','HOL',
					'BEREV','PTO','JURY','MDSC','MSIC', 'COMM', 'SEVER') 
				THEN PehCurAmt
				ELSE 0.00 
			END))
		,PehHours = SUM(COALESCE(PehCurHrs, 0.00))
    INTO dbo.U_ETHOMASCMP_Current_PEarHist
    FROM dbo.PayReg WITH (NOLOCK)
    JOIN dbo.PEarHist WITH (NOLOCK)
        ON PehGenNumber = PrgGenNumber
	INNER JOIN dbo.TaxCode WITH (NOLOCK)
		ON CtcCoID = PrgCoID
		AND SUBSTRING(RTRIM(LTRIM(CtcTaxCode)), 3, 3) = 'SUI'
		AND LEFT(RTRIM(LTRIM(CtcTaxCode)), 2) = LEFT(RTRIM(LTRIM(PrgStateSUI)), 2)
	WHERE EXISTS (SELECT 1 FROM dbo.U_ETHOMASCMP_EEList WITH (NOLOCK) WHERE PehEEID = xEEID)
    AND PehPerControl BETWEEN @StartPerControl AND @EndPerControl
    GROUP BY PehEEID, PrgGenNumber, LEFT(RTRIM(LTRIM(PrgStateSUI)), 2), PrgLocation
    HAVING SUM(PehCurAmt) <> 0.00
	OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_ETHOMASCMP_Current_PEarHist ON dbo.U_ETHOMASCMP_Current_PEarHist (PehEEID,PehPayDate);

    -----------------------------
    -- Working Table - YTD PEarHist
    -----------------------------
    IF OBJECT_ID('U_ETHOMASCMP_YTD_PEarHist','U') IS NOT NULL
        DROP TABLE dbo.U_ETHOMASCMP_YTD_PEarHist;
    SELECT DISTINCT
         PehEEIDYTD = PehEEID
		,PehGrossPayYTD = CONVERT(DECIMAL(15,2), SUM(COALESCE(PehCurAmt, 0.00)))
		,PehGrossBasePayYTD = CONVERT(DECIMAL(15,2), SUM(CASE WHEN PehEarnCode IN ('REG','HOLPT','HOLWF','HOL','BEREV','PTO','JURY','MDSC','MSIC') THEN PehCurAmt ELSE 0.00 END))
		,PehGrossOvertimePayYTD = CONVERT(DECIMAL(15,2), SUM(CASE WHEN PehEarnCode IN ('OT','COT','COLBK','COTF') THEN PehCurAmt ELSE 0.00 END))
		,PehGrossBonusPayYTD = CONVERT(DECIMAL(15,2), SUM(
			CASE 
				WHEN PehEarnCode IN ('BONUS','ASOY','ASMTH','ASQTR','AWARD','AWDT','COVPR','EDGA','GIFTC','HERO','HREWD',
					'ICG','ICM','MENP','OCBV','OCWP','PTOP','REFEE','REFR','RETRO','SHIF1','SHIF2','SHIF3','SHIF4','SHIF5',
					'SHIF6','SRRA','TRAIN','WEP','WON','WRK','WRK2') 
				THEN PehCurAmt 
				ELSE 0.00 
			END))
		,PehGrossCommissionYTD = CONVERT(DECIMAL(15,2), SUM(CASE WHEN PehEarnCode = 'COMM' THEN PehCurAmt ELSE 0.00 END))
		,PehGrossSeveranceYTD = CONVERT(DECIMAL(15,2), SUM(CASE WHEN PehEarnCode = 'SEVER' THEN PehCurAmt ELSE 0.00 END))
		,PehGrossOtherPayYTD = CONVERT(DECIMAL(15,2), SUM(
			CASE 
				WHEN PehEarnCode NOT IN ('BONUS','ASOY','ASMTH','ASQTR','AWARD','AWDT','COVPR','EDGA','GIFTC','HERO','HREWD',
					'ICG','ICM','MENP','OCBV','OCWP','PTOP','REFEE','REFR','RETRO','SHIF1','SHIF2','SHIF3','SHIF4','SHIF5',
					'SHIF6','SRRA','TRAIN','WEP','WON','WRK','WRK2','OT', 'COT','COLBK','COTF', 'REG', 'HOLPT','HOLWF','HOL',
					'BEREV','PTO','JURY','MDSC','MSIC', 'COMM', 'SEVER') 
				THEN PehCurAmt
				ELSE 0.00 
			END))
    INTO dbo.U_ETHOMASCMP_YTD_PEarHist
    FROM dbo.PayReg WITH (NOLOCK)
    JOIN dbo.PEarHist ytd WITH (NOLOCK)
        ON PehGenNumber = PrgGenNumber
	INNER JOIN dbo.TaxCode WITH (NOLOCK)
		ON CtcCoID = PrgCoID
		AND SUBSTRING(RTRIM(LTRIM(CtcTaxCode)), 3, 3) = 'SUI'
		AND LEFT(RTRIM(LTRIM(CtcTaxCode)), 2) = LEFT(RTRIM(LTRIM(PrgStateSUI)), 2)
	WHERE EXISTS (SELECT 1 FROM dbo.U_ETHOMASCMP_Current_PEarHist cur WITH (NOLOCK) WHERE ytd.PehEEID = cur.PehEEID)
    AND LEFT(PehPerControl, 4) = LEFT(@EndPerControl, 4)
	AND PehPerControl <= @EndPerControl
    GROUP BY PehEEID
    HAVING SUM(PehCurAmt) <> 0.00
	OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_ETHOMASCMP_YTD_PEarHist ON dbo.U_ETHOMASCMP_YTD_PEarHist (PehEEIDYTD);

    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_ETHOMASCMP_DrvTbl_E1_D11
    ---------------------------------
    IF OBJECT_ID('U_ETHOMASCMP_DrvTbl_E1_D11','U') IS NOT NULL
        DROP TABLE dbo.U_ETHOMASCMP_DrvTbl_E1_D11;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EepSSN
        -- standard fields above and additional driver fields below
        ,drvSSN = eepSSN
        ,drvNameLast = EepNameLast
        ,drvNameFirst = EepNameFirst
        ,drvNameMiddle = LEFT(EepNameMiddle,1)
        ,drvOrgLvl1 = EecOrgLvl1
        ,drvDateOfLastHire = EecDateOfLastHire
        ,drvDateOfLastWorked = EecDateLastWorked
        ,drvEmplStatus = EecEmplStatus
        ,drvTermReason = CASE WHEN EecEmplStatus = 'T' THEN EecTermReason END
        ,drvDateOfOriginalHire = EecDateOfOriginalHire
        ,drvEmpNo = EecEmpNo
        ,drvAuthenticationIDPIN = EecEmpNo
    INTO dbo.U_ETHOMASCMP_DrvTbl_E1_D11
    FROM dbo.U_ETHOMASCMP_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_ETHOMASCMP_DrvTbl_E1_D11 ON dbo.U_ETHOMASCMP_DrvTbl_E1_D11 (drvInitialSort);

    ---------------------------------
    -- DETAIL RECORD - U_ETHOMASCMP_DrvTbl_E2_D12
    ---------------------------------
    IF OBJECT_ID('U_ETHOMASCMP_DrvTbl_E2_D12','U') IS NOT NULL
        DROP TABLE dbo.U_ETHOMASCMP_DrvTbl_E2_D12;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EepSSN
        -- standard fields above and additional driver fields below
        ,drvSSN = eepSSN
        ,drvAddressLine1 = EepAddressLine1
        ,drvAddressLine2 = EepAddressLine2
        ,drvAddressCity = EepAddressCity
        ,drvAddressState = EepAddressState
        ,drvAddressZipCode5 = CASE WHEN LEN(EepAddressZipCode) = 9 THEN LEFT(RTRIM(LTRIM(EepAddressZipCode)), 5) ELSE EepAddressZipCode END
        ,drvAddressZipCode4 = CASE WHEN LEN(EepAddressZipCode) = 9 THEN RIGHT(RTRIM(LTRIM(EepAddressZipCode)), 4) END
        ,drvPosition = JbcDesc
        ,drvSalaryOrHourly = EecSalaryOrHourly
        ,drvPositionStatus = 
			CASE 
				WHEN EecEEType = 'FTR' THEN 'F'
				WHEN EecEEType IN ('PTT', 'FTT') THEN 'T'
				ELSE 'P'
			END
        ,drvPayRate = RIGHT(CONCAT('000000000', REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(15, 2), 
			CASE
				WHEN EecSalaryOrHourly = 'H' THEN EecHourlyPayRate
				WHEN EecSalaryOrHourly = 'S' THEN EecAnnSalary
			END)), '.', '')), 9) 
        ,drvScheduledWorkHrs = RIGHT(CONCAT('0000', REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(15,2 ), (EecScheduledWorkHrs / IIF(EecPayPeriod = 'B', 2, 1)))), '.', '')), 4)
        ,drvPayPeriod = EecPayPeriod
        ,drvEligibleForMedicalCoverage = CASE WHEN EecDedGroupCode NOT IN ('PTG15', 'PTL15', 'NONE', 'TEMP') THEN 'Y' ELSE 'N' END
        ,drvMultiPositionIndicator = CASE WHEN EejJobIsInActive = 'N' THEN 'N' ELSE 'Y' END
    INTO dbo.U_ETHOMASCMP_DrvTbl_E2_D12
    FROM dbo.U_ETHOMASCMP_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
	INNER JOIN dbo.JobCode WITH (NOLOCK)
		ON JbcJobCode = EecJobCode
	LEFT JOIN dbo.EmpMJobsHistory WITH (NOLOCK)
		ON EejEEID = xEEID 
		AND EejCoID = xCoID
    OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_ETHOMASCMP_DrvTbl_E2_D12 ON dbo.U_ETHOMASCMP_DrvTbl_E2_D12 (drvInitialSort);

    ---------------------------------
    -- DETAIL RECORD - U_ETHOMASCMP_DrvTbl_P1_D13
    ---------------------------------
    IF OBJECT_ID('U_ETHOMASCMP_DrvTbl_P1_D13','U') IS NOT NULL
        DROP TABLE dbo.U_ETHOMASCMP_DrvTbl_P1_D13;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EepSSN
        -- standard fields above and additional driver fields below
        ,drvSSN = eepSSN
        ,drvFedTaxID = CmpFedTaxID
        ,drvStateUINumber = PehStateUINumber
        ,drvLocationStateCode = LEFT(RTRIM(LTRIM(EecLocation)), 2)
        ,drvOrgLvl1 = EecOrgLvl1
        ,drvPayDate = PehPayDate
        ,drvGrossPay = RIGHT(CONCAT('000000000', REPLACE(CONVERT(VARCHAR, PehGrossPay), '.', '')), 9)
        ,drvNetPay = RIGHT(CONCAT('000000000', REPLACE(CONVERT(VARCHAR, PehNetPay), '.', '')), 9) 
        ,drvGrossBasePay = RIGHT(CONCAT('000000000', REPLACE(CONVERT(VARCHAR, PehGrossBasePay), '.', '')), 9) 
        ,drvGrossOverTimePay = RIGHT(CONCAT('000000000', REPLACE(CONVERT(VARCHAR, PehGrossOvertimePay), '.', '')), 9)
        ,drvGrossBonusPay = RIGHT(CONCAT('000000000', REPLACE(CONVERT(VARCHAR, PehGrossBonusPay), '.', '')), 9) 
        ,drvGrossCommission = RIGHT(CONCAT('000000000', REPLACE(CONVERT(VARCHAR, PehGrossCommission), '.', '')), 9) 
        ,drvGrossSeverance = RIGHT(CONCAT('000000000', REPLACE(CONVERT(VARCHAR, PehGrossSeverance), '.', '')), 9) 
        ,drvGrossOtherPay = RIGHT(CONCAT('000000000', REPLACE(CONVERT(VARCHAR, PehGrossOtherPay), '.', '')), 9) 
        ,drvHours = RIGHT(CONCAT('0000000', REPLACE(CONVERT(VARCHAR, PehHours), '.', '')), 7)
        ,drvGrossPayYTD = RIGHT(CONCAT('0000000000', REPLACE(CONVERT(VARCHAR, PehGrossPayYTD), '.', '')), 10) 
        ,drvGrossBasePayYTD = RIGHT(CONCAT('0000000000', REPLACE(CONVERT(VARCHAR, PehGrossBasePayYTD), '.', '')), 10) 
        ,drvGrossOvertimePayYTD = RIGHT(CONCAT('0000000000', REPLACE(CONVERT(VARCHAR, PehGrossOvertimePayYTD), '.', '')), 10) 
        ,drvGrossBonusPayYTD = RIGHT(CONCAT('0000000000', REPLACE(CONVERT(VARCHAR, PehGrossBonusPayYTD), '.', '')), 10)
        ,drvGrossCommissionYTD = RIGHT(CONCAT('0000000000', REPLACE(CONVERT(VARCHAR, PehGrossCommissionYTD), '.', '')), 10)
        ,drvGrossSeveranceYTD = RIGHT(CONCAT('0000000000', REPLACE(CONVERT(VARCHAR, PehGrossSeveranceYTD), '.', '')), 10)
        ,drvGrossOtherPayYTD = RIGHT(CONCAT('0000000000', REPLACE(CONVERT(VARCHAR, PehGrossOtherPayYTD), '.', '')), 10)
    INTO dbo.U_ETHOMASCMP_DrvTbl_P1_D13
    FROM dbo.U_ETHOMASCMP_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.Company WITH (NOLOCK)
        ON CmpCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
	INNER JOIN dbo.U_ETHOMASCMP_Current_PEarHist WITH (NOLOCK)
		ON PehEEID = xEEID
	INNER JOIN dbo.U_ETHOMASCMP_YTD_PEarHist WITH (NOLOCK)
		ON PehEEIDYTD = xEEID
    OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_ETHOMASCMP_DrvTbl_P1_D13 ON dbo.U_ETHOMASCMP_DrvTbl_P1_D13 (drvInitialSort, drvPayDate);

    ---------------------------------
    -- DETAIL RECORD - U_ETHOMASCMP_DrvTbl_L1_D14
    ---------------------------------
    IF OBJECT_ID('U_ETHOMASCMP_DrvTbl_L1_D14','U') IS NOT NULL
        DROP TABLE dbo.U_ETHOMASCMP_DrvTbl_L1_D14;
    SELECT DISTINCT
        drvInitialSort = LocCode
        -- standard fields above and additional driver fields below
        ,drvLocCode = LocCode
        ,drvLocDesc = LocDesc
        ,drvLocAddressLine1 = LocAddressLine1
        ,drvLocAddressLine2 = LocAddressLine2
        ,drvLocAddressCity = LocAddressCity
        ,drvLocAddresState = LocAddressState
        ,drvLocAdressZipCode5 = CASE WHEN LEN(LocAddressZipCode) = 9 THEN LEFT(RTRIM(LTRIM(LocAddressZipCode)), 5) ELSE LocAddressZipCode END 
        ,drvLocAddressZipCode4 = CASE WHEN LEN(LocAddressZipCode) = 9 THEN RIGHT(RTRIM(LTRIM(LocAddressZipCode)), 4) END
        ,drvLocPhoneMainNumber = LocPhoneMainNumber
        ,drvFedTaxID = CmpFedTaxID
        ,drvSUIAccountNumber = CtcIDNumber
    INTO dbo.U_ETHOMASCMP_DrvTbl_L1_D14
    FROM dbo.U_ETHOMASCMP_EEList WITH (NOLOCK)
    JOIN dbo.Company WITH (NOLOCK)
        ON CmpCoID = xCoID
	INNER JOIN dbo.EmpComp WITH (NOLOCK)
		ON EecEEID = xEEID
		AND EecCoID = xCOID
	INNER JOIN dbo.Location WITH (NOLOCK)
		ON LocCode = EecLocation
		AND LEFT(RTRIM(LTRIM(LocCode)), 2) = LEFT(RTRIM(LTRIM(EecStateSUI)), 2)
	INNER JOIN dbo.TaxCode WITH (NOLOCK)
		ON CtcCoID = xCOID
		AND SUBSTRING(RTRIM(LTRIM(CtcTaxCode)), 3, 3) = 'SUI'
		AND LEFT(RTRIM(LTRIM(CtcTaxCode)), 2) = LEFT(RTRIM(LTRIM(EecStateSUI)), 2)
	ORDER BY LocCode
    OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_ETHOMASCMP_DrvTbl_L1_D14 ON dbo.U_ETHOMASCMP_DrvTbl_L1_D14 (drvInitialSort);

    ---------------------------------
    -- DETAIL RECORD - U_ETHOMASCMP_DrvTbl_S1_D15
    ---------------------------------
    IF OBJECT_ID('U_ETHOMASCMP_DrvTbl_S1_D15','U') IS NOT NULL
        DROP TABLE dbo.U_ETHOMASCMP_DrvTbl_S1_D15;
    SELECT DISTINCT
        drvInitialSort = TchCode
        -- standard fields above and additional driver fields below
        ,drvTchCode = TchCode
        ,drvTchDesc = TchDesc
    INTO dbo.U_ETHOMASCMP_DrvTbl_S1_D15
    FROM dbo.TrmReasn WITH (NOLOCK);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_ETHOMASCMP_DrvTbl_S1_D15 ON dbo.U_ETHOMASCMP_DrvTbl_S1_D15 (drvInitialSort);

    ---------------------------------
    -- HEADER RECORD
    ---------------------------------
    IF OBJECT_ID('U_ETHOMASCMP_DrvTbl_H01','U') IS NOT NULL
        DROP TABLE dbo.U_ETHOMASCMP_DrvTbl_H01;
    SELECT DISTINCT
         drvFileDate = GETDATE()
    INTO dbo.U_ETHOMASCMP_DrvTbl_H01;

    ---------------------------------
    -- TRAILER RECORD
    ---------------------------------
    IF OBJECT_ID('U_ETHOMASCMP_DrvTbl_T91','U') IS NOT NULL
        DROP TABLE dbo.U_ETHOMASCMP_DrvTbl_T91;
    SELECT DISTINCT
         drvTotalE1Records = (SELECT COUNT (*) FROM dbo.U_ETHOMASCMP_DrvTbl_E1_D11 WITH (NOLOCK))
        ,drvTotalE2Records = (SELECT COUNT (*) FROM dbo.U_ETHOMASCMP_DrvTbl_E2_D12 WITH (NOLOCK))
        ,drvTotalE3Records = 0
        ,drvTotalP1Records = (SELECT COUNT(*) FROM dbo.U_ETHOMASCMP_DrvTbl_P1_D13 WITH (NOLOCK))
        ,drvTotalD1Records = 0
        ,drvTotalB1Records = 0
        ,drvTotalL1Records = (SELECT COUNT(*) FROM dbo.U_ETHOMASCMP_DrvTbl_L1_D14 WITH (NOLOCK))
        ,drvTotalL2Records = 0
        ,drvTotalP2Records = 0
        ,drvTotalP3Records = 0
        ,drvTotalS1Records = (SELECT COUNT(*) FROM dbo.U_ETHOMASCMP_DrvTbl_S1_D15 WITH (NOLOCK))
    INTO dbo.U_ETHOMASCMP_DrvTbl_T91;

END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwETHOMASCMP_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_ETHOMASCMP_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'ETHOMASCMP%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202006051'
       ,expStartPerControl     = '202006051'
       ,expLastEndPerControl   = '202006059'
       ,expEndPerControl       = '202006059'
WHERE expFormatCode = 'ETHOMASCMP';

**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwETHOMASCMP_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_ETHOMASCMP_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort
