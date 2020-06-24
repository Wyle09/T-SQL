/*****************
	V3.4
*****************/

SET NOCOUNT ON;
IF OBJECT_ID('U_ELFSTDLTD_SavePath') IS NOT NULL DROP TABLE [dbo].[U_ELFSTDLTD_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_ELFSTDLTD_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'ELFSTDLTD' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwELFSTDLTD_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwELFSTDLTD_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_ELFSTDLTD') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_ELFSTDLTD];
GO
IF OBJECT_ID('U_ELFSTDLTD_File') IS NOT NULL DROP TABLE [dbo].[U_ELFSTDLTD_File];
GO
IF OBJECT_ID('U_ELFSTDLTD_EEList') IS NOT NULL DROP TABLE [dbo].[U_ELFSTDLTD_EEList];
GO
IF OBJECT_ID('U_ELFSTDLTD_DrvTbl_H01') IS NOT NULL DROP TABLE [dbo].[U_ELFSTDLTD_DrvTbl_H01];
GO
IF OBJECT_ID('U_ELFSTDLTD_DrvTbl_D11') IS NOT NULL DROP TABLE [dbo].[U_ELFSTDLTD_DrvTbl_D11];
GO
IF OBJECT_ID('U_ELFSTDLTD_PearHist') IS NOT NULL DROP TABLE [dbo].[U_ELFSTDLTD_PearHist];
GO
IF OBJECT_ID('U_ELFSTDLTD_HrInfo') IS NOT NULL DROP TABLE [dbo].[U_ELFSTDLTD_HrInfo];
GO
IF OBJECT_ID('U_ELFSTDLTD_CustomDataElements') IS NOT NULL DROP TABLE [dbo].[U_ELFSTDLTD_CustomDataElements];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'ELFSTDLTD';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'ELFSTDLTD';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'ELFSTDLTD';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'ELFSTDLTD';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'ELFSTDLTD';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCreateTClockBatches,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhRespectZeroPayRate,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhThirdPartyPay) VALUES ('N','C','Y','0','',NULL,'','N','','N','','013010','EMPEXPORT','SDF','ELFSTDLTD','Lincoln Financial STD, LTD, FMLA','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','963','N','S','N','ELFSTDLTD0Z0','N','Jan  1 1900 12:00AM','C','N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"09-LF0111"','1','(''DA''=''F'')','ELFSTDLTD0Z0','9','H','01','1',NULL,'Customer ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNumberOfRecords"','2','(''UA''=''F'')','ELFSTDLTD0Z0','7','H','01','10',NULL,'Number of detailed records',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFileDate"','3','(''UD112''=''F'')','ELFSTDLTD0Z0','8','H','01','17',NULL,'File Create Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','4','(''SS''=''F'')','ELFSTDLTD0Z0','548','H','01','24',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSSN"','1','(''UA''=''F'')','ELFSTDLTD0Z0','9','D','11','1',NULL,'Social Security Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','2','(''UA''=''F'')','ELFSTDLTD0Z0','11','D','11','10',NULL,'Employee Identification',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','3','(''UA''=''F'')','ELFSTDLTD0Z0','35','D','11','21',NULL,'First Name Employee',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','4','(''UA''=''F'')','ELFSTDLTD0Z0','35','D','11','56',NULL,'Last Name Employee',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameMiddle"','5','(''UA''=''F'')','ELFSTDLTD0Z0','1','D','11','91',NULL,'Employee Middle Initial',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine1"','6','(''UA''=''F'')','ELFSTDLTD0Z0','30','D','11','92',NULL,'Employee Address Line 1 Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine2"','7','(''UA''=''F'')','ELFSTDLTD0Z0','30','D','11','122',NULL,'Employee Address Line 2 Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressCity"','8','(''UA''=''F'')','ELFSTDLTD0Z0','20','D','11','152',NULL,'Employee Address City Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressState"','9','(''UA''=''F'')','ELFSTDLTD0Z0','2','D','11','172',NULL,'Employee Address State Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressZipCode"','10','(''UA''=''F'')','ELFSTDLTD0Z0','9','D','11','174',NULL,'Employee Address Postal Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LEAVE"','11','(''DA''=''F'')','ELFSTDLTD0Z0','5','D','11','183',NULL,'Product 3 code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FMLA"','12','(''DA''=''F'')','ELFSTDLTD0Z0','5','D','11','188',NULL,'Product 3 Benefit type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"A"','13','(''DA''=''F'')','ELFSTDLTD0Z0','1','D','11','193',NULL,'Product 3 Coverage Status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvProd3CoverageEffDate"','14','(''UD112''=''F'')','ELFSTDLTD0Z0','8','D','11','194',NULL,'Product 3 Coverage Effective date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"000"','15','(''DA''=''F'')','ELFSTDLTD0Z0','3','D','11','202',NULL,'Product 3 Employee Premium Contribution',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"000"','16','(''DA''=''F'')','ELFSTDLTD0Z0','3','D','11','205',NULL,'Product 3-Benefit Level',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvElgibilityAmountDuration"','17','(''UA''=''F'')','ELFSTDLTD0Z0','11','D','11','208',NULL,'Eligibility Amount Duration',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvservicceAmount"','18','(''UA''=''F'')','ELFSTDLTD0Z0','12','D','11','219',NULL,'Service Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','19','(''UD112''=''F'')','ELFSTDLTD0Z0','8','D','11','231',NULL,'Latest Hire Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvHrsPerdayMonday"','20','(''UA''=''F'')','ELFSTDLTD0Z0','9','D','11','239',NULL,'Hours per day Monday',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvHrsPerDayTuesday"','21','(''UA''=''F'')','ELFSTDLTD0Z0','9','D','11','248',NULL,'Hours per day Tuesday',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvHrsPerDayWeds"','22','(''UA''=''F'')','ELFSTDLTD0Z0','9','D','11','257',NULL,'Hours per day Weds',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvHrsPerDayThurs"','23','(''UA''=''F'')','ELFSTDLTD0Z0','9','D','11','266',NULL,'Hours per day Thurs',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvHrsPerDayFriday"','24','(''UA''=''F'')','ELFSTDLTD0Z0','9','D','11','275',NULL,'Hours per day Friday',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStateSUI"','25','(''UA''=''F'')','ELFSTDLTD0Z0','2','D','11','284',NULL,'Employment State',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmplStatus"','26','(''UA''=''F'')','ELFSTDLTD0Z0','1','D','11','286',NULL,'Employments Status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfBirth"','27','(''UD112''=''F'')','ELFSTDLTD0Z0','11','D','11','287',NULL,'Date Of Birth',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFullTimeOrPartTime"','28','(''UA''=''F'')','ELFSTDLTD0Z0','1','D','11','298',NULL,'Employment Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGender"','29','(''UA''=''F'')','ELFSTDLTD0Z0','1','D','11','299',NULL,'Employee Gender',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfTermination"','30','(''UD112''=''F'')','ELFSTDLTD0Z0','80','D','11','300',NULL,'Date of Termination',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubsidaryCodes"','31','(''UA''=''F'')','ELFSTDLTD0Z0','4','D','11','380',NULL,'Subsidary codes',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"A"','32','(''DA''=''F'')','ELFSTDLTD0Z0','1','D','11','384',NULL,'Disability Contact Type Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDisabilityContactFirstName"','33','(''UA''=''F'')','ELFSTDLTD0Z0','35','D','11','385',NULL,'Disability Contact First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDisabilityContactLastName"','34','(''UA''=''F'')','ELFSTDLTD0Z0','35','D','11','420',NULL,'Disability Contact Last name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDisabilityContactEmail"','35','(''UA''=''F'')','ELFSTDLTD0Z0','100','D','11','455',NULL,'Disability Contact Email',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalaryEffectiveDate"','36','(''UD112''=''F'')','ELFSTDLTD0Z0','8','D','11','555',NULL,'Salary Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeCustomDataElement1"','37','(''UA''=''F'')','ELFSTDLTD0Z0','80','D','11','563',NULL,'Employee Custom Data Element 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeCustomDataElement2"','38','(''UA''=''F'')','ELFSTDLTD0Z0','80','D','11','643',NULL,'Employee Custom Data Element 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeCustomDataElement3"','39','(''UA''=''F'')','ELFSTDLTD0Z0','80','D','11','723',NULL,'Employee Custom Data Element 3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeCustomDataElement4"','40','(''UA''=''F'')','ELFSTDLTD0Z0','80','D','11','803',NULL,'Employee Custom Data Element 4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','41','(''SS''=''F'')','ELFSTDLTD0Z0','81','D','11','883',NULL,'Employee Custom Data Element 5',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
DECLARE @UDSERVER varchar(5) = (SELECT RTRIM(LEFT(@@SERVERNAME,PATINDEX('%[0-9]%',@@SERVERNAME)) + SUBSTRING(@@SERVERNAME,PATINDEX('%UP[0-9]%',@@SERVERNAME)+2,1)));
SELECT @UDSERVER = CASE WHEN @UDSERVER = 'EW21' THEN 'WP6' WHEN @UDSERVER = 'EW22' THEN 'WP7' ELSE @UDSERVER END;
DECLARE @UDCOCODE varchar(5) = (SELECT RTRIM(CmmCompanyCode) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\ELFSTDLTD_20200204.txt',NULL,NULL,NULL,'G4NOK,MY3CR,MY379,MY3GI',NULL,NULL,NULL,'Linc F STD,LTD,FMAL OnDemand','202002049','EMPEXPORT','ONDMD_XOE',NULL,'ELFSTDLTD',NULL,NULL,NULL,'202002049','Feb  4 2020  6:33PM','Feb  4 2020  6:33PM','202002041',NULL,'','','202002041',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\ELFSTDLTD_20200204.txt',NULL,NULL,NULL,'G4NOK,MY3CR,MY379,MY3GI',NULL,NULL,NULL,'Linc F STD,LTD,FMAL Scheduled','202002049','EMPEXPORT','SCHEDULED',NULL,'ELFSTDLTD',NULL,NULL,NULL,'202002049','Feb  4 2020  6:33PM','Feb  4 2020  6:33PM','202002041',NULL,'','','202002041',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ELFSTDLTD','BCPParms','V','-c -t -r "0x0A"');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ELFSTDLTD','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ELFSTDLTD','ExportPath','V',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ELFSTDLTD','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ELFSTDLTD','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ELFSTDLTD','UseFileName','V','Y');
UPDATE dbo.U_dsi_Configuration SET CfgValue = CASE WHEN CfgName = 'UseFileName' THEN 'Y' ELSE NULL END WHERE FormatCode = 'ELFSTDLTD' AND CfgName IN ('UseFileName','ExportPath');
INSERT INTO dbo.CustomTemplates (CreationDate,Engine,EngineCode,IsActive,ModifiedDate) SELECT CreationDate = GETDATE(), Engine = AdhEngine, EngineCode = AdhFormatCode, IsActive = 1, ModifiedDate = GETDATE() FROM dbo.AscDefH WITH (NOLOCK) WHERE AdhFormatCode = 'ELFSTDLTD' AND NOT EXISTS(SELECT 1 FROM dbo.CustomTemplates WHERE EngineCode = AdhFormatCode);
IF OBJECT_ID('U_ELFSTDLTD_SavePath') IS NOT NULL DROP TABLE [dbo].[U_ELFSTDLTD_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ELFSTDLTD','H01','dbo.U_ELFSTDLTD_DrvTbl_H01',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ELFSTDLTD','D11','dbo.U_ELFSTDLTD_DrvTbl_D11',NULL);
IF OBJECT_ID('U_ELFSTDLTD_EEList') IS NULL
CREATE TABLE [dbo].[U_ELFSTDLTD_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_ELFSTDLTD_File') IS NULL
CREATE TABLE [dbo].[U_ELFSTDLTD_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] char(573) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_ELFSTDLTD]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: Tarkett Enterprises Inc

Created By: Wyle Cordero
Business Analyst: Josh Smith
Create Date: 02/04/2020
Service Request Number: SR-2019-00261002

Purpose: Lincoln Financial STD, LTD, FMLA

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2020     SR-2020-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'ELFSTDLTD';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'ELFSTDLTD';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'ELFSTDLTD';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'ELFSTDLTD';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'ELFSTDLTD' ORDER BY RunID DESC;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'ELFSTDLTD', 'ONDMD_XOE';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'ELFSTDLTD', @AllObjects = 'Y', @IsWeb = 'Y'
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
    SELECT @FormatCode = 'ELFSTDLTD';

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
    DELETE FROM dbo.U_ELFSTDLTD_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_ELFSTDLTD_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

	-- Include terminated employees within the last 90 days (effective date)
	DELETE el
	FROM dbo.U_ELFSTDLTD_EEList el
	INNER JOIN dbo.EmpComp 
		ON EecEEID = xEEID
		AND EecCoID = xCoID
		AND EecDateOfTermination < DATEADD(DAY, -90, @EndDate)
	;

	-- Exclude Employee tyes 'TMP'
	DELETE el
	FROM dbo.U_ELFSTDLTD_EEList el
	INNER JOIN dbo.EmpComp 
		ON EecEEID = xEEID
		AND EecCoID = xCoID
		AND EecEEType = 'TMP'
	;

	-- Remove canadian employees.
	DELETE el
	FROM dbo.U_ELFSTDLTD_EEList el
	INNER JOIN dbo.EmpPers
		ON EepEEID = xEEID
		AND EepAddressCountry = 'CAN'
	;

    --==========================================
    -- Create Deduction List
    --==========================================
    DECLARE @DedList VARCHAR(MAX)
    SET @DedList = ('MED1,MISC1,DEN1,VIS1,FSAMD,FSADC,VLIF2,SLF2,CLF2,ADD2,SADD2,CADD2,VLTD2,LTD2');

    IF OBJECT_ID('U_ELFSTDLTD_DedList','U') IS NOT NULL
        DROP TABLE dbo.U_ELFSTDLTD_DedList;
    SELECT DISTINCT
         DedCode = DedDedCode
        ,DedType = DedDedType
    INTO dbo.U_ELFSTDLTD_DedList
    FROM dbo.fn_ListToTable(@DedList)
    JOIN dbo.DedCode WITH (NOLOCK)
        ON DedDedCode = Item;


    --==========================================
    -- BDM Section
    --==========================================
    DELETE FROM dbo.U_dsi_BDM_Configuration WHERE FormatCode = @FormatCode;

    -- Required parameters
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES(@FormatCode,'DedCodes',@DedList);
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES(@FormatCode,'StartDateTime',@StartDate);
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES(@FormatCode,'EndDateTime',@EndDate);
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES(@FormatCode,'TermSelectionOption','AuditDate');

    -- Non-Required parameters
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'BuildConsolidatedTable','Standard');
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'GetChangeReason','Y');

	-- Required OE parameters
    IF @ExportCode = 'POE_XOE'
    BEGIN
        INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'OEType','PASSIVE');
    END;

    IF @ExportCode = 'AOE_XOE'
    BEGIN
        INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'OEType','ACTIVE');
    END;

    -- Run BDM Module
    EXEC dbo.dsi_BDM_sp_PopulateDeductionsTable @FormatCode;

	--==================================
	-- Build Working Tables
	--==================================
	DECLARE @PerControlLst12Mths VARCHAR(9) = CONCAT(FORMAT(DATEADD(MONTH, -12, @EndDate), 'yyyyMMdd'), '1')

	-----------------------------------
	-- Working Table - U_ELFSTDLTD_PearHist
	------------------------------------
    IF OBJECT_ID('dbo.U_ELFSTDLTD_PearHist','U') IS NOT NULL
        DROP TABLE dbo.U_ELFSTDLTD_PearHist;
	SELECT DISTINCT
		PehEEID
		,PehCurHrsLst12Mths = CONVERT(VARCHAR, CAST(SUM(PehCurhrs) AS DECIMAL(11, 2)))
		,PehHoursPerDay = CONVERT(VARCHAR, CAST((SUM(PehCurhrs) / 52) / 5 AS DECIMAL(11, 2)))
	INTO dbo.U_ELFSTDLTD_PearHist
	FROM dbo.PearHist WITH (NOLOCK)
	WHERE EXISTS (SELECT 1 FROM dbo.U_ELFSTDLTD_EEList WITH (NOLOCK) WHERE PehEEID = xEEID)
	AND PehEarnCode IN ('UDT', 'UMT01', 'UMT02', 'UMT03', 'UOVT', 'UREG', 'UTRAN', 'UVOLN')
	AND PehPerControl BETWEEN @PerControlLst12Mths AND @EndPerControl
	GROUP BY PehEEID	
	HAVING SUM(PehCurhrs) <> 0.00
	OPTION (FORCE ORDER);	

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_ELFSTDLTD_PearHist ON dbo.U_ELFSTDLTD_PearHist (PehEEID);

	-----------------------------------
	-- Working Table - U_ELFSTDLTD_HrInfo
	------------------------------------
    IF OBJECT_ID('dbo.U_ELFSTDLTD_HrInfo','U') IS NOT NULL
        DROP TABLE dbo.U_ELFSTDLTD_HrInfo;
	SELECT DISTINCT
	    hriEEID = pcf.EecEEId
		,hriCoID = pcf.EecCoID
		,HRInCharge1 = CodDesc
		,hriNameFirst = EepNameFirst
		,hriNameLast = EepNameLast
		,hriAddressEmail = EepAddressEmail 
	INTO dbo.U_ELFSTDLTD_HrInfo
	FROM [dbo].[fn_MP_CustomFields_EmpComp_Export] (NULL, NULL, NULL, NULL) pcf
	INNER JOIN dbo.EmpComp eec WITH (NOLOCK)
		ON eec.EecEEID = pcf.EecEEID
		AND eec.EecCoID = pcf.EecCoID
	INNER JOIN dbo.Codes WITH (NOLOCK)
		ON (CodCode = Employment_HRInCharge1DropDown
		OR CodDesc = Employment_HRInCharge1DropDown)
		AND CodTable = 'CO_HRRPT'
	INNER JOIN dbo.EmpPers WITH (NOLOCK)
		ON CONCAT(RTRIM(LTRIM(EepNameFirst)), ' ', RTRIM(LTRIM(EepNameLast))) = RTRIM(LTRIM(CodDesc))
		AND NULLIF(EepAddressEmail, '') IS NOT NULL
	WHERE EXISTS (SELECT 1 FROM dbo.U_ELFSTDLTD_EEList WITH (NOLOCK) WHERE pcf.EecEEID = xEEID AND pcf.EecCoID = xCoID)
	OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_ELFSTDLTD_HrInfo ON dbo.U_ELFSTDLTD_HrInfo (hriEEID, hriCoID);

	-----------------------------------
	-- Working Table - U_ELFSTDLTD_CustomDataElements
	------------------------------------
    IF OBJECT_ID('U_ELFSTDLTD_CustomDataElements','U') IS NOT NULL
        DROP TABLE dbo.U_ELFSTDLTD_CustomDataElements;
	SELECT DISTINCT
		cdeEEID = bdm.BdmEEID
		,cdeCOID = bdm.BdmCoID
		,cdeEmployeeCustomDataElement1 = MAX(CONCAT(
			CASE WHEN med1.BdmDedCode IS NOT NULL THEN CONCAT('MED1_', CONVERT(VARCHAR, med1.BdmEEAmt), '_') ELSE 'MED1_0.00_' END,
			CASE WHEN misc1.BdmDedCode IS NOT NULL THEN CONCAT('MISC1_', CONVERT(VARCHAR, misc1.BdmEEAmt), '_') ELSE 'MISC1_0.00_' END,
			CASE WHEN den1.BdmDedCode IS NOT NULL THEN CONCAT('DEN1_', CONVERT(VARCHAR, den1.BdmEEAmt)) ELSE 'DEN1_0.00' END))
		,cdeEmployeeCustomDataElement2 = MAX(CONCAT(
			CASE WHEN vis1.BdmDedCode IS NOT NULL THEN CONCAT('VIS1_', CONVERT(VARCHAR, vis1.BdmEEAmt), '_') ELSE 'VIS1_0.00_' END,
			CASE WHEN fsamd.BdmDedCode IS NOT NULL THEN CONCAT('FSAMD_', CONVERT(VARCHAR, fsamd.BdmEEAmt), '_') ELSE 'FSAMD_0.00_' END,
			CASE WHEN fsadc.BdmDedCode IS NOT NULL THEN CONCAT('FSADC_', CONVERT(VARCHAR, fsadc.BdmEEAmt)) ELSE 'FSADC_0.00' END))
		,cdeEmployeeCustomDataElement3 = MAX(CONCAT(
			CASE WHEN vlif2.BdmDedCode IS NOT NULL THEN CONCAT('VLIF2_', CONVERT(VARCHAR, vlif2.BdmEEAmt), '_') ELSE 'VLIF2_0.00_' END,
			CASE WHEN slf2.BdmDedCode IS NOT NULL THEN CONCAT('SLF2_', CONVERT(VARCHAR, slf2.BdmEEAmt), '_') ELSE 'SLF2_0.00_' END,
			CASE WHEN clf2.BdmDedCode IS NOT NULL THEN CONCAT('CLF2_', CONVERT(VARCHAR, clf2.BdmEEAmt), '_') ELSE 'CLF2_0.00_' END,
			CASE WHEN add2.BdmDedCode IS NOT NULL THEN CONCAT('ADD2_', CONVERT(VARCHAR, add2.BdmEEAmt)) ELSE 'ADD2_0.00' END))
		,cdeEmployeeCustomDataElement4 = MAX(CONCAT(
			CASE WHEN sadd2.BdmDedCode IS NOT NULL THEN CONCAT('SADD2_', CONVERT(VARCHAR, sadd2.BdmEEAmt), '_') ELSE 'SADD2_0.00_' END,
			CASE WHEN cadd2.BdmDedCode IS NOT NULL THEN CONCAT('CADD2_', CONVERT(VARCHAR, cadd2.BdmEEAmt), '_') ELSE 'CADD2_0.00_' END,
			CASE WHEN vltd2.BdmDedCode IS NOT NULL THEN CONCAT('VLTD2_', CONVERT(VARCHAR, vltd2.BdmEEAmt), '_') ELSE 'VLTD2_0.00_' END,
			CASE WHEN ltd2.BdmDedCode IS NOT NULL THEN CONCAT('LTD2_', CONVERT(VARCHAR, ltd2.BdmEEAmt)) ELSE 'LTD2_0.00' END))
	INTO dbo.U_ELFSTDLTD_CustomDataElements
	FROM dbo.U_dsi_Bdm_ELFSTDLTD bdm WITH (NOLOCK)
	LEFT JOIN dbo.U_dsi_Bdm_ELFSTDLTD med1 WITH (NOLOCK)
		ON med1.BdmEEID = bdm.BdmEEID
		AND med1.BdmCoID = bdm.BdmCOID
		AND med1.BdmRecType = 'EMP'
		AND med1.BdmDedCode = 'MED1'
	LEFT JOIN dbo.U_dsi_Bdm_ELFSTDLTD misc1 WITH (NOLOCK)
		ON misc1.BdmEEID = bdm.BdmEEID
		AND misc1.BdmCoID = bdm.BdmCOID
		AND misc1.BdmRecType = 'EMP'
		AND misc1.BdmDedCode = 'MISC1'
	LEFT JOIN dbo.U_dsi_Bdm_ELFSTDLTD den1 WITH (NOLOCK)
		ON den1.BdmEEID = bdm.BdmEEID
		AND den1.BdmCoID = bdm.BdmCOID
		AND den1.BdmRecType = 'EMP'
		AND den1.BdmDedCode = 'DEN1'
	LEFT JOIN dbo.U_dsi_Bdm_ELFSTDLTD vis1 WITH (NOLOCK)
		ON vis1.BdmEEID = bdm.BdmEEID
		AND vis1.BdmCoID = bdm.BdmCOID
		AND vis1.BdmRecType = 'EMP'
		AND vis1.BdmDedCode = 'VIS1'
	LEFT JOIN dbo.U_dsi_Bdm_ELFSTDLTD fsamd WITH (NOLOCK)
		ON fsamd.BdmEEID = bdm.BdmEEID
		AND fsamd.BdmCoID = bdm.BdmCOID
		AND fsamd.BdmRecType = 'EMP'
		AND fsamd.BdmDedCode = 'FSAMD'
	LEFT JOIN dbo.U_dsi_Bdm_ELFSTDLTD fsadc WITH (NOLOCK)
		ON fsadc.BdmEEID = bdm.BdmEEID
		AND fsadc.BdmCoID = bdm.BdmCOID
		AND fsadc.BdmRecType = 'EMP'
		AND fsadc.BdmDedCode = 'FSADC'
	LEFT JOIN dbo.U_dsi_Bdm_ELFSTDLTD vlif2 WITH (NOLOCK)
		ON vlif2.BdmEEID = bdm.BdmEEID
		AND vlif2.BdmCoID = bdm.BdmCOID
		AND vlif2.BdmRecType = 'EMP'
		AND vlif2.BdmDedCode = 'VLIF2'
	LEFT JOIN dbo.U_dsi_Bdm_ELFSTDLTD slf2 WITH (NOLOCK)
		ON slf2.BdmEEID = bdm.BdmEEID
		AND slf2.BdmCoID = bdm.BdmCOID
		AND slf2.BdmRecType = 'EMP'
		AND slf2.BdmDedCode = 'SLF2'
	LEFT JOIN dbo.U_dsi_Bdm_ELFSTDLTD clf2 WITH (NOLOCK)
		ON clf2.BdmEEID = bdm.BdmEEID
		AND clf2.BdmCoID = bdm.BdmCOID
		AND clf2.BdmRecType = 'EMP'
		AND clf2.BdmDedCode = 'CLF2'
	LEFT JOIN dbo.U_dsi_Bdm_ELFSTDLTD add2 WITH (NOLOCK)
		ON add2.BdmEEID = bdm.BdmEEID
		AND add2.BdmCoID = bdm.BdmCOID
		AND add2.BdmRecType = 'EMP'
		AND add2.BdmDedCode = 'ADD2'
	LEFT JOIN dbo.U_dsi_Bdm_ELFSTDLTD sadd2 WITH (NOLOCK)
		ON sadd2.BdmEEID = bdm.BdmEEID
		AND sadd2.BdmCoID = bdm.BdmCOID
		AND sadd2.BdmRecType = 'EMP'
		AND sadd2.BdmDedCode = 'SADD2'
	LEFT JOIN dbo.U_dsi_Bdm_ELFSTDLTD cadd2 WITH (NOLOCK)
		ON cadd2.BdmEEID = bdm.BdmEEID
		AND cadd2.BdmCoID = bdm.BdmCOID
		AND cadd2.BdmRecType = 'EMP'
		AND cadd2.BdmDedCode = 'CADD2'
	LEFT JOIN dbo.U_dsi_Bdm_ELFSTDLTD vltd2 WITH (NOLOCK)
		ON add2.BdmEEID = bdm.BdmEEID
		AND vltd2.BdmCoID = bdm.BdmCOID
		AND vltd2.BdmRecType = 'EMP'
		AND vltd2.BdmDedCode = 'VLTD2'
	LEFT JOIN dbo.U_dsi_Bdm_ELFSTDLTD ltd2 WITH (NOLOCK)
		ON ltd2.BdmEEID = bdm.BdmEEID
		AND ltd2.BdmCoID = bdm.BdmCOID
		AND ltd2.BdmRecType = 'EMP'
		AND ltd2.BdmDedCode = 'LTD2'
	GROUP BY bdm.BdmEEID, bdm.BdmCoID
	OPTION (FORCE ORDER); 

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_ELFSTDLTD_CustomDataElements ON dbo.U_ELFSTDLTD_CustomDataElements (cdeEEID, cdeCOID);


    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_ELFSTDLTD_DrvTbl_D11
    ---------------------------------
    IF OBJECT_ID('U_ELFSTDLTD_DrvTbl_D11','U') IS NOT NULL
        DROP TABLE dbo.U_ELFSTDLTD_DrvTbl_D11;
    SELECT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EepSSN
        -- standard fields above and additional driver fields below
        ,drvSSN = eepSSN
        ,drvEmpNo = EecEmpNo
        ,drvNameFirst = EepNameFirst
        ,drvNameLast = EepNameLast
        ,drvNameMiddle = LEFT(EepNameMiddle,1)
        ,drvAddressLine1 = EepAddressLine1
        ,drvAddressLine2 = EepAddressLine2
        ,drvAddressCity = EepAddressCity
        ,drvAddressState = EepAddressState
        ,drvAddressZipCode = EepAddressZipCode
        ,drvProd3CoverageEffDate = EecDateOfLastHire
        ,drvElgibilityAmountDuration = PehCurHrsLst12Mths
		,drvservicceAmount = DATEDIFF(MONTH, EecDateOfOriginalHire, @EndDate)
        ,drvDateOfLastHire = EecDateOfLastHire
        ,drvHrsPerdayMonday = PehHoursPerDay
        ,drvHrsPerDayTuesday = PehHoursPerDay
        ,drvHrsPerDayWeds = PehHoursPerDay
        ,drvHrsPerDayThurs = PehHoursPerDay
        ,drvHrsPerDayFriday = PehHoursPerDay
        ,drvStateSUI = LEFT(RTRIM(LTRIM(EecStateSUI)), 2)
        ,drvEmplStatus = CASE WHEN EecEmplStatus = 'T' THEN 'T' ELSE 'A' END
        ,drvDateOfBirth = EepDateOfBirth
        ,drvFullTimeOrPartTime = CASE WHEN EecFullTimeOrPartTime = 'F' THEN '1' ELSE '2' END
        ,drvGender = EepGender
        ,drvDateOfTermination = CASE WHEN EecEmplStatus = 'T' THEN EecDateOfTermination END
        ,drvSubsidaryCodes = 
			CASE
		        WHEN CmpCompanyCode = 'C810' AND EecSalaryOrHourly = 'S' THEN 'C81S'
				WHEN CmpCompanyCode = 'C810' AND EecSalaryOrHourly = 'H' THEN 'C81H'
				WHEN CmpCompanyCode = 'C848' AND EecSalaryOrHourly = 'S' THEN 'C84S'
				WHEN CmpCompanyCode = 'C848' AND EecSalaryOrHourly = 'H' THEN 'C84H'
				WHEN CmpCompanyCode = 'C850' AND EecSalaryOrHourly = 'S' THEN 'C85S'
				WHEN CmpCompanyCode = 'C850' AND EecSalaryOrHourly = 'H' THEN 'C85H'
				WHEN CmpCompanyCode = 'C960' AND EecSalaryOrHourly = 'S' THEN 'C96S'
				WHEN CmpCompanyCode = 'C960' AND EecSalaryOrHourly = 'H' THEN 'C96H'
		    END
        ,drvDisabilityContactFirstName = hriNameFirst
        ,drvDisabilityContactLastName = hriNameLast
        ,drvDisabilityContactEmail = hriAddressEmail
        ,drvSalaryEffectiveDate = COALESCE((SELECT MAX(EjhJobEffDate) FROM dbo.EmpHJob WITH (NOLOCK) WHERE EjhEEID = xEEID AND EjhCoID = xCoID AND EjhIsRateChange = 'Y'), EecDateOfLastHire)
        ,drvEmployeeCustomDataElement1 = COALESCE(cdeEmployeeCustomDataElement1, 'MED1_0.00_MISC1_0.00_DEN1_0.00')
		,drvEmployeeCustomDataElement2 = COALESCE(cdeEmployeeCustomDataElement2, 'VIS1_0.00_FSAMD_0.00_FSADC_0.00')
		,drvEmployeeCustomDataElement3 = COALESCE(cdeEmployeeCustomDataElement3, 'VLIF2_0.00_SLF2_0.00_CLF2_0.00_ADD2_0.00')
		,drvEmployeeCustomDataElement4 = COALESCE(cdeEmployeeCustomDataElement4, 'SADD2_0.00_CADD2_0.00_VLTD2_0.00_LTD2_0.00')
    INTO dbo.U_ELFSTDLTD_DrvTbl_D11
    FROM dbo.U_ELFSTDLTD_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp Eec WITH (NOLOCK)
        ON Eec.EecEEID = xEEID 
        AND Eec.EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
	INNER JOIN dbo.Company WITH (NOLOCK)
		ON CmpCoID = xCoID
	INNER JOIN dbo.U_ELFSTDLTD_PearHist WITH (NOLOCK)
		ON PehEEID = xEEID
	LEFT JOIN dbo.U_ELFSTDLTD_HrInfo WITH (NOLOCK)
		ON hriEEID = xEEID
		AND hriCOID = xCOID
	LEFT JOIN U_ELFSTDLTD_CustomDataElements WITH (NOLOCK)
		ON cdeEEID = xEEID
		AND cdeCoID = xCOID
	OPTION (FORCE ORDER);

    ---------------------------------
    -- HEADER RECORD
    ---------------------------------
    IF OBJECT_ID('U_ELFSTDLTD_DrvTbl_H01','U') IS NOT NULL
        DROP TABLE dbo.U_ELFSTDLTD_DrvTbl_H01;
    SELECT DISTINCT
         drvNumberOfRecords = (SELECT COUNT(*) FROM dbo.U_ELFSTDLTD_DrvTbl_D11 WITH (NOLOCK))
        ,drvFileDate = GETDATE()
    INTO dbo.U_ELFSTDLTD_DrvTbl_H01;


END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwELFSTDLTD_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_ELFSTDLTD_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'ELFSTDLTD%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202006011'
       ,expStartPerControl     = '202006011'
       ,expLastEndPerControl   = '202006229'
       ,expEndPerControl       = '202006229'
WHERE expFormatCode = 'ELFSTDLTD';

**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwELFSTDLTD_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_ELFSTDLTD_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort
