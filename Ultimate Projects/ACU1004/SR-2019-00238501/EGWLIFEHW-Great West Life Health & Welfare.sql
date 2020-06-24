SET NOCOUNT ON;
IF OBJECT_ID('U_EGWLIFEHW_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EGWLIFEHW_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EGWLIFEHW_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EGWLIFEHW' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEGWLIFEHW_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEGWLIFEHW_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EGWLIFEHW') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EGWLIFEHW];
GO
IF OBJECT_ID('U_EGWLIFEHW_File') IS NOT NULL DROP TABLE [dbo].[U_EGWLIFEHW_File];
GO
IF OBJECT_ID('U_EGWLIFEHW_EEList') IS NOT NULL DROP TABLE [dbo].[U_EGWLIFEHW_EEList];
GO
IF OBJECT_ID('U_EGWLIFEHW_DrvTbl_Emps_D10') IS NOT NULL DROP TABLE [dbo].[U_EGWLIFEHW_DrvTbl_Emps_D10];
GO
IF OBJECT_ID('U_EGWLIFEHW_DrvTbl_Deps_D11') IS NOT NULL DROP TABLE [dbo].[U_EGWLIFEHW_DrvTbl_Deps_D11];
GO
IF OBJECT_ID('U_EGWLIFEHW_DedList') IS NOT NULL DROP TABLE [dbo].[U_EGWLIFEHW_DedList];
GO
IF OBJECT_ID('U_EGWLIFEHW_AuditFields') IS NOT NULL DROP TABLE [dbo].[U_EGWLIFEHW_AuditFields];
GO
IF OBJECT_ID('U_EGWLIFEHW_Audit') IS NOT NULL DROP TABLE [dbo].[U_EGWLIFEHW_Audit];
GO
IF OBJECT_ID('U_dsi_BDM_EGWLIFEHW') IS NOT NULL DROP TABLE [dbo].[U_dsi_BDM_EGWLIFEHW];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EGWLIFEHW';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EGWLIFEHW';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EGWLIFEHW';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EGWLIFEHW';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EGWLIFEHW';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCreateTClockBatches,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhRespectZeroPayRate,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhThirdPartyPay) VALUES ('N','C','Y','0','',NULL,'','N','','N','','013010','EMPEXPORT','SDF','EGWLIFEHW','Great West Life Health & Welfare','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','1000','N','S','N','EGWLIFEHW0Z0','N','Jan  1 1900 12:00AM','C','N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','1','(''SS''=''F'')','EGWLIFEHW0Z0','8','D','10','1',NULL,'Great-West Life use only – file name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"P"','2','(''DA''=''F'')','EGWLIFEHW0Z0','1','D','10','9',NULL,'Record type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupPolicyNumber"','3','(''UN0''=''F'')','EGWLIFEHW0Z0','10','D','10','10',NULL,'Group policy number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','4','(''UA''=''F'')','EGWLIFEHW0Z0','10','D','10','20',NULL,'Participant identifier',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonType"','5','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','10','30',NULL,'Person type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTransactionType"','6','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','10','32',NULL,'Transaction type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEffectiveDate"','7','(''UD126''=''F'')','EGWLIFEHW0Z0','10','D','10','34',NULL,'Effective date (or change date)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDivision"','8','(''UA''=''F'')','EGWLIFEHW0Z0','3','D','10','44',NULL,'Division',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBenefitClass"','9','(''UN0''=''F'')','EGWLIFEHW0Z0','3','D','10','47',NULL,'Benefit class',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAdministrativeClass"','10','(''UA''=''F'')','EGWLIFEHW0Z0','3','D','10','50',NULL,'Administrative class',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRetirementDate"','11','(''UD126''=''F'')','EGWLIFEHW0Z0','10','D','10','53',NULL,'Retirement date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTerminationClauseIndicator"','12','(''UA''=''F'')','EGWLIFEHW0Z0','1','D','10','63',NULL,'Termination clause indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','13','(''UA''=''F'')','EGWLIFEHW0Z0','20','D','10','64',NULL,'Last name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','14','(''UA''=''F'')','EGWLIFEHW0Z0','40','D','10','84',NULL,'First name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameMiddle"','15','(''UA''=''F'')','EGWLIFEHW0Z0','1','D','10','124',NULL,'Middle initial',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGender"','16','(''UA''=''F'')','EGWLIFEHW0Z0','1','D','10','125',NULL,'Gender code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfBirth"','17','(''UD126''=''F'')','EGWLIFEHW0Z0','10','D','10','126',NULL,'Birth date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','18','(''SS''=''F'')','EGWLIFEHW0Z0','10','D','10','136',NULL,'Deceased date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLanguageCode"','19','(''UA''=''F'')','EGWLIFEHW0Z0','1','D','10','146',NULL,'Language code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMailingAddress"','20','(''UA''=''F'')','EGWLIFEHW0Z0','40','D','10','147',NULL,'Mailing street Address',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressCity"','21','(''UA''=''F'')','EGWLIFEHW0Z0','30','D','10','187',NULL,'Mailing city',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressState"','22','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','10','217',NULL,'Mailing prov./State code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressZipCode"','23','(''UA''=''F'')','EGWLIFEHW0Z0','10','D','10','219',NULL,'Postal/Zip code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressCountry"','24','(''UA''=''F'')','EGWLIFEHW0Z0','20','D','10','229',NULL,'Foreign country',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvWaitingPeriodStartDate"','25','(''UD126''=''F'')','EGWLIFEHW0Z0','10','D','10','249',NULL,'Waiting period start date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvWaitingAppliedIndicator"','26','(''UA''=''F'')','EGWLIFEHW0Z0','1','D','10','259',NULL,'Waiting applied indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStateSUI"','27','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','10','260',NULL,'Employment prov./state',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressState2"','28','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','10','262',NULL,'Residence prov./state',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','29','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','10','264',NULL,'Smoker indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','30','(''SS''=''F'')','EGWLIFEHW0Z0','20','D','10','265',NULL,'Business location',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvOrgLvl3"','31','(''UA''=''F'')','EGWLIFEHW0Z0','13','D','10','285',NULL,'Cost centre',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTaxExeptIndicator"','32','(''UA''=''F'')','EGWLIFEHW0Z0','1','D','10','298',NULL,'Tax-exempt indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDependentIndicator"','33','(''UA''=''F'')','EGWLIFEHW0Z0','1','D','10','299',NULL,'Dependant indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','34','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','10','300',NULL,'Spouse indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','35','(''SS''=''F'')','EGWLIFEHW0Z0','2','D','10','301',NULL,'Eligible dep. count',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','36','(''SS''=''F'')','EGWLIFEHW0Z0','5','D','10','303',NULL,'Bank transit ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','37','(''SS''=''F'')','EGWLIFEHW0Z0','3','D','10','308',NULL,'Bank number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','38','(''SS''=''F'')','EGWLIFEHW0Z0','12','D','10','311',NULL,'Bank account number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAnnSalary"','39','(''UN02''=''F'')','EGWLIFEHW0Z0','15','D','10','323',NULL,'Earnings amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"A"','40','(''DA''=''F'')','EGWLIFEHW0Z0','2','D','10','338',NULL,'Earnings frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','41','(''SS''=''F'')','EGWLIFEHW0Z0','28','D','10','340',NULL,'Drug card misc. description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','42','(''SS''=''F'')','EGWLIFEHW0Z0','2','D','10','368',NULL,'Dependant relationship code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','43','(''SS''=''F'')','EGWLIFEHW0Z0','2','D','10','370',NULL,'Spouse health COB code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','44','(''SS''=''F'')','EGWLIFEHW0Z0','2','D','10','372',NULL,'Spouse dental COB code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','45','(''SS''=''F'')','EGWLIFEHW0Z0','2','D','10','374',NULL,'Spouse vision COB code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','46','(''SS''=''F'')','EGWLIFEHW0Z0','2','D','10','376',NULL,'Spouse drug COB code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','47','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','10','378',NULL,'Dependant coverage',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','48','(''SS''=''F'')','EGWLIFEHW0Z0','34','D','10','379',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBenefitID1"','49','(''UA''=''F'')','EGWLIFEHW0Z0','5','D','10','413',NULL,'Benefit ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonType1"','50','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','10','418',NULL,'Person type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeBenefitStatus1"','51','(''UA''=''F'')','EGWLIFEHW0Z0','8','D','10','420',NULL,'Employee benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDependantBenefitStatus1"','52','(''UA''=''F'')','EGWLIFEHW0Z0','8','D','10','428',NULL,'Dependant benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','53','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','10','436',NULL,'Volume type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','54','(''SS''=''F'')','EGWLIFEHW0Z0','15','D','10','437',NULL,'Volume amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBenefitId2"','55','(''UA''=''F'')','EGWLIFEHW0Z0','5','D','10','452',NULL,'Benefit ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonType2"','56','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','10','457',NULL,'Person type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeBenefitStatus2"','57','(''UA''=''F'')','EGWLIFEHW0Z0','8','D','10','459',NULL,'Employee benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDependantBenefitStatus2"','58','(''UA''=''F'')','EGWLIFEHW0Z0','8','D','10','467',NULL,'Dependant benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','59','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','10','475',NULL,'Volume type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','60','(''SS''=''F'')','EGWLIFEHW0Z0','15','D','10','476',NULL,'Volume amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBenefitId3"','61','(''UA''=''F'')','EGWLIFEHW0Z0','5','D','10','491',NULL,'Benefit ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonType3"','62','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','10','496',NULL,'Person type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeBenefitStatus3"','63','(''UA''=''F'')','EGWLIFEHW0Z0','8','D','10','498',NULL,'Employee benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDependantBenefitStatus3"','64','(''UA''=''F'')','EGWLIFEHW0Z0','8','D','10','506',NULL,'Dependant benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','65','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','10','514',NULL,'Volume type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','66','(''SS''=''F'')','EGWLIFEHW0Z0','15','D','10','515',NULL,'Volume amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBenefitId4"','67','(''UA''=''F'')','EGWLIFEHW0Z0','5','D','10','530',NULL,'Benefit ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonType4"','68','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','10','535',NULL,'Person type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeBenefitStatus4"','69','(''UA''=''F'')','EGWLIFEHW0Z0','8','D','10','537',NULL,'Employee benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDependantBenefitStatus4"','70','(''UA''=''F'')','EGWLIFEHW0Z0','8','D','10','545',NULL,'Dependant benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','71','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','10','553',NULL,'Volume type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','72','(''SS''=''F'')','EGWLIFEHW0Z0','15','D','10','554',NULL,'Volume amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBenefitId5"','73','(''UA''=''F'')','EGWLIFEHW0Z0','5','D','10','569',NULL,'Benefit ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonType5"','74','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','10','574',NULL,'Person type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeBenefitStatus5"','75','(''UA''=''F'')','EGWLIFEHW0Z0','8','D','10','576',NULL,'Employee benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDependantBenefitStatus5"','76','(''UA''=''F'')','EGWLIFEHW0Z0','8','D','10','584',NULL,'Dependant benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','77','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','10','592',NULL,'Volume type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','78','(''SS''=''F'')','EGWLIFEHW0Z0','15','D','10','593',NULL,'Volume amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBenefitId6"','79','(''UA''=''F'')','EGWLIFEHW0Z0','5','D','10','608',NULL,'Benefit ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonType6"','80','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','10','613',NULL,'Person type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeBenefitStatus6"','81','(''UA''=''F'')','EGWLIFEHW0Z0','8','D','10','615',NULL,'Employee benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDependantBenefitStatus6"','82','(''UA''=''F'')','EGWLIFEHW0Z0','8','D','10','623',NULL,'Dependant benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','83','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','10','631',NULL,'Volume type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','84','(''SS''=''F'')','EGWLIFEHW0Z0','15','D','10','632',NULL,'Volume amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','85','(''SS''=''F'')','EGWLIFEHW0Z0','596','D','10','647',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','1','(''SS''=''F'')','EGWLIFEHW0Z0','8','D','11','1',NULL,'Great-West Life use only – file name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"D"','2','(''DA''=''F'')','EGWLIFEHW0Z0','1','D','11','9',NULL,'Record type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupPolicyNumber"','3','(''UN0''=''F'')','EGWLIFEHW0Z0','10','D','11','10',NULL,'Group policy number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','4','(''UA''=''F'')','EGWLIFEHW0Z0','10','D','11','20',NULL,'Participant identifier',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonType"','5','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','11','30',NULL,'Person type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTransactionType"','6','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','11','32',NULL,'Transaction type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEffectiveDate"','7','(''UD126''=''F'')','EGWLIFEHW0Z0','10','D','11','34',NULL,'Effective date (or change date)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDivision"','8','(''UA''=''F'')','EGWLIFEHW0Z0','3','D','11','44',NULL,'Division',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBenefitClass"','9','(''UN0''=''F'')','EGWLIFEHW0Z0','3','D','11','47',NULL,'Benefit class',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','10','(''SS''=''F'')','EGWLIFEHW0Z0','3','D','11','50',NULL,'Administrative class',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','11','(''SS''=''F'')','EGWLIFEHW0Z0','10','D','11','53',NULL,'Retirement date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','12','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','11','63',NULL,'Termination clause indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','13','(''UA''=''F'')','EGWLIFEHW0Z0','20','D','11','64',NULL,'Last name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','14','(''UA''=''F'')','EGWLIFEHW0Z0','40','D','11','84',NULL,'First name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameMiddle"','15','(''UA''=''F'')','EGWLIFEHW0Z0','1','D','11','124',NULL,'Middle initial',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGender"','16','(''UA''=''F'')','EGWLIFEHW0Z0','1','D','11','125',NULL,'Gender code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfBirth"','17','(''UD126''=''F'')','EGWLIFEHW0Z0','10','D','11','126',NULL,'Birth date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','18','(''SS''=''F'')','EGWLIFEHW0Z0','10','D','11','136',NULL,'Deceased date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLanguageCode"','19','(''UA''=''F'')','EGWLIFEHW0Z0','1','D','11','146',NULL,'Language code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','20','(''SS''=''F'')','EGWLIFEHW0Z0','40','D','11','147',NULL,'Mailing street Address',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','21','(''SS''=''F'')','EGWLIFEHW0Z0','30','D','11','187',NULL,'Mailing city',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','22','(''SS''=''F'')','EGWLIFEHW0Z0','2','D','11','217',NULL,'Mailing prov./State code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','23','(''SS''=''F'')','EGWLIFEHW0Z0','10','D','11','219',NULL,'Postal/Zip code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','24','(''SS''=''F'')','EGWLIFEHW0Z0','20','D','11','229',NULL,'Foreign country',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','25','(''SS''=''F'')','EGWLIFEHW0Z0','10','D','11','249',NULL,'Waiting period start date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','26','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','11','259',NULL,'Waiting applied indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','27','(''SS''=''F'')','EGWLIFEHW0Z0','2','D','11','260',NULL,'Employment prov./state',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressState"','28','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','11','262',NULL,'Residence prov./state',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','29','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','11','264',NULL,'Smoker indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','30','(''SS''=''F'')','EGWLIFEHW0Z0','20','D','11','265',NULL,'Business location',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','31','(''SS''=''F'')','EGWLIFEHW0Z0','13','D','11','285',NULL,'Cost centre',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','32','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','11','298',NULL,'Tax-exempt indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','33','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','11','299',NULL,'Dependant indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','34','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','11','300',NULL,'Spouse indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','35','(''SS''=''F'')','EGWLIFEHW0Z0','2','D','11','301',NULL,'Eligible dep. count',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','36','(''SS''=''F'')','EGWLIFEHW0Z0','5','D','11','303',NULL,'Bank transit ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','37','(''SS''=''F'')','EGWLIFEHW0Z0','3','D','11','308',NULL,'Bank number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','38','(''SS''=''F'')','EGWLIFEHW0Z0','12','D','11','311',NULL,'Bank account number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','39','(''SS''=''F'')','EGWLIFEHW0Z0','15','D','11','323',NULL,'Earnings amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','40','(''SS''=''F'')','EGWLIFEHW0Z0','2','D','11','338',NULL,'Earnings frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','41','(''SS''=''F'')','EGWLIFEHW0Z0','28','D','11','340',NULL,'Drug card misc. description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDependentRelationShip"','42','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','11','368',NULL,'Dependant relationship code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSpouseHealthCobCode"','43','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','11','370',NULL,'Spouse health COB code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSppuseDentalCobCode"','44','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','11','372',NULL,'Spouse dental COB code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSpouseVisionCobCode"','45','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','11','374',NULL,'Spouse vision COB code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSppuseDrugCobCode"','46','(''UA''=''F'')','EGWLIFEHW0Z0','2','D','11','376',NULL,'Spouse drug COB code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDependantCoverage"','47','(''UA''=''F'')','EGWLIFEHW0Z0','1','D','11','378',NULL,'Dependant coverage',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','48','(''SS''=''F'')','EGWLIFEHW0Z0','34','D','11','379',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBenefitID1"','49','(''UA''=''F'')','EGWLIFEHW0Z0','5','D','11','413',NULL,'Benefit ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','50','(''SS''=''F'')','EGWLIFEHW0Z0','2','D','11','418',NULL,'Person type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','51','(''SS''=''F'')','EGWLIFEHW0Z0','8','D','11','420',NULL,'Employee benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDependantBenefitStatus1"','52','(''UA''=''F'')','EGWLIFEHW0Z0','8','D','11','428',NULL,'Dependant benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','53','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','11','436',NULL,'Volume type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','54','(''SS''=''F'')','EGWLIFEHW0Z0','15','D','11','437',NULL,'Volume amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBenefitID2"','55','(''UA''=''F'')','EGWLIFEHW0Z0','5','D','11','452',NULL,'Benefit ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','56','(''SS''=''F'')','EGWLIFEHW0Z0','2','D','11','457',NULL,'Person type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','57','(''SS''=''F'')','EGWLIFEHW0Z0','8','D','11','459',NULL,'Employee benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDependantBenefitStatus2"','58','(''UA''=''F'')','EGWLIFEHW0Z0','8','D','11','467',NULL,'Dependant benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','59','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','11','475',NULL,'Volume type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','60','(''SS''=''F'')','EGWLIFEHW0Z0','15','D','11','476',NULL,'Volume amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBenefitID3"','61','(''UA''=''F'')','EGWLIFEHW0Z0','5','D','11','491',NULL,'Benefit ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','62','(''SS''=''F'')','EGWLIFEHW0Z0','2','D','11','496',NULL,'Person type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','63','(''SS''=''F'')','EGWLIFEHW0Z0','8','D','11','498',NULL,'Employee benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDependantBenefitStatus3"','64','(''UA''=''F'')','EGWLIFEHW0Z0','8','D','11','506',NULL,'Dependant benefit status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','65','(''SS''=''F'')','EGWLIFEHW0Z0','1','D','11','514',NULL,'Volume type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','66','(''SS''=''F'')','EGWLIFEHW0Z0','15','D','11','515',NULL,'Volume amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','67','(''SS''=''F'')','EGWLIFEHW0Z0','712','D','11','530',NULL,'Filler',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Great West OnDemand','201910289','EMPEXPORT','ONDMD_XOE',NULL,'EGWLIFEHW',NULL,NULL,NULL,'202004179','Oct 28 2019 11:13AM','Oct 28 2019 11:13AM','202004171',NULL,'','','201910281',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Great West Active OE','201910289','EMPEXPORT','AOE_XOE',NULL,'EGWLIFEHW',NULL,NULL,NULL,'201910289','Oct 28 2019 11:13AM','Oct 28 2019 11:13AM','201910281',NULL,'','','201910281',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Great West Passive OE','201910289','EMPEXPORT','POE_XOE',NULL,'EGWLIFEHW',NULL,NULL,NULL,'201910289','Oct 28 2019 11:13AM','Oct 28 2019 11:13AM','201910281',NULL,'','','201910281',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Great West Scheduled','201910289','EMPEXPORT','SCHEDULED',NULL,'EGWLIFEHW',NULL,NULL,NULL,'201910289','Oct 28 2019 11:13AM','Oct 28 2019 11:13AM','201910281',NULL,'','','201910281',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EGWLIFEHW','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EGWLIFEHW','ExportPath','V',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EGWLIFEHW','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EGWLIFEHW','MultFile','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EGWLIFEHW','SubSort','C','drvSubSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EGWLIFEHW','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EGWLIFEHW','UseFileName','V','Y');
IF OBJECT_ID('U_EGWLIFEHW_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EGWLIFEHW_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EGWLIFEHW','D10','dbo.U_EGWLIFEHW_DrvTbl_Emps_D10',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EGWLIFEHW','D11','dbo.U_EGWLIFEHW_DrvTbl_Deps_D11',NULL);
IF OBJECT_ID('U_EGWLIFEHW_AuditFields') IS NULL
CREATE TABLE [dbo].[U_EGWLIFEHW_AuditFields] (
    [aTableName] varchar(30) NULL,
    [aFieldName] varchar(30) NULL
);
IF OBJECT_ID('U_EGWLIFEHW_DedList') IS NULL
CREATE TABLE [dbo].[U_EGWLIFEHW_DedList] (
    [DedCode] char(5) NOT NULL,
    [DedType] char(4) NOT NULL
);
IF OBJECT_ID('U_EGWLIFEHW_EEList') IS NULL
CREATE TABLE [dbo].[U_EGWLIFEHW_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EGWLIFEHW_File') IS NULL
CREATE TABLE [dbo].[U_EGWLIFEHW_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] char(1000) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EGWLIFEHW]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: Acuren Inspection, Inc.

Created By: Wyle Cordero
Business Analyst: Jackie Finn
Create Date: 10/28/2019
Service Request Number: SR-2019-00238501

Purpose: Great West Life Health & Welfare

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2019     SR-2019-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EGWLIFEHW';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EGWLIFEHW';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EGWLIFEHW';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EGWLIFEHW';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EGWLIFEHW' ORDER BY RunID DESC;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EGWLIFEHW', 'ONDMD_XOE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EGWLIFEHW', 'POE_XOE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EGWLIFEHW', 'AOE_XOE';

EXEC dbo.dsi_BDM_sp_ErrorCheck 'EGWLIFEHW';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'EGWLIFEHW', @AllObjects = 'Y', @IsWeb = 'N'
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
    SELECT @FormatCode = 'EGWLIFEHW';

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
    DELETE FROM dbo.U_EGWLIFEHW_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_EGWLIFEHW_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

	-- Exclude employees if they do not have a deduction and PCF Employment_CanadaBenefitClass IS NULL.
	DELETE el
	FROM dbo.U_EGWLIFEHW_EEList el
	INNER JOIN [dbo].[fn_MP_CustomFields_EmpComp_Export] (NULL, NULL, NULL, NULL) Pcf
		ON Pcf.EecEEID = xEEID
		AND Pcf.EecCoID = xCoID
		AND Employment_CanadaLifeBenefitEligible <> 'Yes'
	;


    --==========================================
    -- Audit Section
    --==========================================
    -- Get data from audit fields table. Add fields here if auditing
    IF OBJECT_ID('U_EGWLIFEHW_AuditFields','U') IS NOT NULL
        DROP TABLE dbo.U_EGWLIFEHW_AuditFields;
    CREATE TABLE dbo.U_EGWLIFEHW_AuditFields (aTableName varchar(30),aFieldName varchar(30));

    INSERT INTO dbo.U_EGWLIFEHW_AuditFields VALUES ('EmpComp','EecDateOfLastHire');
    INSERT INTO dbo.U_EGWLIFEHW_AuditFields VALUES ('EmpComp','EecDateOfTermination');
	INSERT INTO dbo.U_EGWLIFEHW_AuditFields VALUES ('EmpComp','EecJobChangeReason');
	INSERT INTO dbo.U_EGWLIFEHW_AuditFields VALUES ('EmpPers','EepAddressState');
    INSERT INTO dbo.U_EGWLIFEHW_AuditFields VALUES ('EmphJob','EjhFullTimeOrPartTime');
    INSERT INTO dbo.U_EGWLIFEHW_AuditFields VALUES ('EmphJob','EjhLocation');
	INSERT INTO dbo.U_EGWLIFEHW_AuditFields VALUES ('EmpDed','EedBenOption');

    -- Create audit table based on fields defined above
    IF OBJECT_ID('U_EGWLIFEHW_Audit','U') IS NOT NULL
        DROP TABLE dbo.U_EGWLIFEHW_Audit;
    SELECT 
        audEEID  = audKey1Value
        ,audKey2 = audKey2Value
        ,audKey3 = audKey3Value
		,AudKey4 = AudUniqueKey
        ,audTableName
        ,audFieldName
        ,audAction
        ,audDateTime
        ,audOldValue
        ,audNewValue
        ,audRowNo = ROW_NUMBER() OVER (PARTITION BY audKey1Value, audKey2Value, audKey3Value, audFieldName ORDER BY audDateTime DESC)
    INTO dbo.U_EGWLIFEHW_Audit
    FROM dbo.vw_AuditData WITH (NOLOCK) 
    JOIN dbo.U_EGWLIFEHW_AuditFields WITH (NOLOCK) 
        ON audTableName = aTableName
        AND audFieldName = aFieldName
    WHERE audDateTime BETWEEN @StartDate AND @EndDate
    AND audAction <> 'DELETE'
	AND audNewValue = 
		CASE 
			WHEN audTableName = 'EmpDed' AND audKey3Value IN ('C9006', 'C9008', 'C9011') THEN audNewValue
			WHEN audFieldName = 'EecJobChangeReason' AND audNewValue IN ('100', '101') THEN audFieldName
			ELSE CASE WHEN audFieldName NOT IN ('EedBenOption', 'EecJobChangeReason') THEN audNewValue END
		END
	AND EXISTS (SELECT 1 FROM dbo.U_EGWLIFEHW_EEList WHERE audKey1Value = xEEID)
	;

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EGWLIFEHW_Audit ON dbo.U_EGWLIFEHW_Audit (audEEID,audKey2);

	-- Need to insert changes for pcf field in audit.
	INSERT INTO dbo.U_EGWLIFEHW_Audit (audEEID, audKey2, audKey3, audKey4, audTableName, audFieldName, audAction, audDateTime, audOldValue, audNewValue, audRowNo)
	SELECT 
		audEEID = standardprimarykeystring1
    	,audKey2 = standardprimarykeystring2
   		,audKey3 = ''
   		,audKey4 = ''
		,audTableName = 'fn_MP_CustomFields_EmpComp_Export'
		,audFieldName = '_BCanadaBenefitClass'
		,audAction = 'MANUAL'
   		,audDateTime = MetaFieldValue.Created
   		,audOldValue = NULL
		,audNewValue = StringValue
		,audRowNo = ROW_NUMBER() OVER (PARTITION BY standardprimarykeystring1, standardprimarykeystring2 ORDER BY MetaFieldValue.Created DESC)
	FROM dbo.MetaObject WITH (NOLOCK)
	JOIN dbo.MetaFieldValue WITH (NOLOCK)
   		ON ObjectId = ID
	WHERE MetaFieldValue.Created BETWEEN @StartDate AND @EndDate
   	AND ClassUniqueID = 'SEmployment'
   	AND FieldUniqueID = '_BCanadaBenefitClass';


    --==========================================
    -- Create Deduction List
    --==========================================
    DECLARE @DedList VARCHAR(MAX)
    SET @DedList = 'C9006,C9008,C9011';

    IF OBJECT_ID('U_EGWLIFEHW_DedList','U') IS NOT NULL
        DROP TABLE dbo.U_EGWLIFEHW_DedList;
    SELECT DISTINCT
         DedCode = DedDedCode
        ,DedType = DedDedType
    INTO dbo.U_EGWLIFEHW_DedList
    FROM dbo.fn_ListToTable(@DedList)
    JOIN dbo.DedCode WITH (NOLOCK)
        ON DedDedCode = Item;


    --==========================================
    -- BDM Section
    --==========================================
    DELETE FROM dbo.U_dsi_BDM_Configuration WHERE FormatCode = @FormatCode;

    -- Required parameters
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES(@FormatCode,'DedCodes', @DedList);
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES(@FormatCode,'StartDateTime',@StartDate);
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES(@FormatCode,'EndDateTime',@EndDate);
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES(@FormatCode,'TermSelectionOption','AuditDate');

    -- Non-Required parameters
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'BuildConsolidatedTable','Standard');
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'CountDependents','Y');
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'RelationshipsSpouse','SPS');
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'RelationshipsChild','CHL,STC');

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

	-- Only allow recent terms keyed within the date range of interface.
	DELETE EEList 
	FROM dbo.U_EGWLIFEHW_EEList EEList 
	INNER JOIN dbo.EmpComp
	    ON xCoID = EecCoID
		AND xEEID = EecEEID
		AND EecEmplStatus = 'T'
	AND NOT EXISTS (
		SELECT 1 FROM dbo.U_EGWLIFEHW_Audit 
		WHERE xCoID = audKey2 
		AND xEEID = audEEID 
		AND audRowNo = 1
		AND audFieldName = 'EecDateOfTermination' AND audNewValue IS NOT NULL
		AND audDateTime BETWEEN @StartDate AND @EndDate
	);

	--==========================
	-- Working Tables
	--==========================

	--===============================
	-- Working Table -- Eligible
	--===============================
    IF OBJECT_ID('U_EGWLIFEHW_Eligible','U') IS NOT NULL
        DROP TABLE dbo.U_EGWLIFEHW_Eligible;
	SELECT DISTINCT
		ElgEEID
		,ElgCoID
	INTO dbo.U_EGWLIFEHW_Eligible
	FROM (
		SELECT 
			ElgEEID = xEEID
			,ElgCoID = xCOID
		FROM dbo.U_EGWLIFEHW_EEList El WITH (NOLOCK)
		INNER JOIN dbo.EmpComp 
			ON xEEID = EecEEID
			AND xCoID = EecCoID
			AND EecJobChangeReason = '100'
			AND EecDateOfOriginalHire + 75 >= @EndDate

		UNION

		SELECT 
			ElgEEID = xEEID
			,ElgCoID = xCOID
		FROM dbo.U_EGWLIFEHW_EEList El WITH (NOLOCK)
		INNER JOIN [dbo].[fn_MP_CustomFields_EmpComp_Export] (NULL, NULL, NULL, NULL) Pcf
			ON Pcf.EecEEID = xEEID
			AND Pcf.EecCoID = xCoID
			AND Employment_CanadaLifeWaitingPeriod = 'N'

		UNION 

		SELECT 
			ElgEEID = xEEID
			,ElgCoID = xCOID
		FROM dbo.U_EGWLIFEHW_EEList El WITH (NOLOCK)
		INNER JOIN [dbo].[fn_MP_CustomFields_EmpComp_Export] (NULL, NULL, NULL, NULL) Pcf
			ON Pcf.EecEEID = xEEID
			AND Pcf.EecCoID = xCoID
			AND Employment_CanadaLifeBenefitsRetiree = 'Y'
		) elg

	-- Create Index
	CREATE CLUSTERED INDEX CDX_U_EGWLIFEHW_Eligible ON dbo.U_EGWLIFEHW_Eligible (ElgEEID, ElgCoID);

	-- Delete employees that are not eligible based on the business rules.
	DELETE el
	FROM dbo.U_EGWLIFEHW_EEList el
	WHERE NOT EXISTS (SELECT 1 FROM dbo.U_EGWLIFEHW_Eligible WHERE ElgEEID = xEEID AND ElgCoID = xCoID);

	--===============================
	-- Working Table -- EffDates
	--===============================
    IF OBJECT_ID('U_EGWLIFEHW_EffDates','U') IS NOT NULL
        DROP TABLE dbo.U_EGWLIFEHW_EffDates;
	SELECT DISTINCT 
		EffEEID
		,EffCoID
		,EffDate = MAX(EffDate)
	INTO dbo.U_EGWLIFEHW_EffDates 
	FROM 
		(
			 SELECT
				 EffEEID = xEEID
				 ,EffCoID = xCoID
				 ,EffDate = AudDateTime
			 FROM dbo.U_EGWLIFEHW_EEList WITH (NOLOCK)
			 INNER JOIN dbo.U_EGWLIFEHW_Audit WITH (NOLOCK)
				 ON xEEID = AudEEId
				 AND xCoID = AudKey2
				 AND AudTableName IN ('EmpPers', 'fn_MP_CustomFields_EmpComp_Export')
				 AND AudRowNo = 1
				 AND AudNewValue IS NOT NULL

			UNION ALL

			SELECT
				EffEEID = xEEID
				,EffCoID = xCoID
				,EffDate = EjhJobEffDate
			FROM dbo.U_EGWLIFEHW_EEList WITH (NOLOCK)
			INNER JOIN dbo.U_EGWLIFEHW_Audit WITH (NOLOCK)
				ON xEEID = AudEEId
				AND xCoID = AudKey2
				AND AudTableName = 'EmpHJob'
				AND AudRowNo = 1
				AND AudNewValue IS NOT NULL
			INNER JOIN dbo.EmpHJob Ejh WITH (NOLOCK)
				ON xEEID = EjhEEID
				AND xCoID = EjhCoID
				AND AudKey4 = Ejh.AuditKey
        
			UNION ALL

			SELECT 
				EffEEID = xEEID
				,EffCoID = xCoID
				,EffDate = 
					CASE
						WHEN BdmBenStartDate > BdmTvStartDate THEN BdmBenStartDate
						WHEN BdmBenStartDate < BdmTvStartDate THEN BdmTvStartDate
						WHEN EecJobChangeReason = '101' THEN EecDateOfLastHire
						WHEN EecEmplStatus = 'T' AND EXISTS (SELECT 1 FROM dbo.U_EGWLIFEHW_Audit WITH (NOLOCK) WHERE audEEID = xEEID AND audKey2 = xCoID AND audFieldName = 'EecDateOfTermination' AND audRowNo = 1) THEN EecDateOfTermination
						WHEN BdmBenStopDate IS NOT NULL THEN BdmBenStopDate
						ELSE EecDateOfLastHire
					END
			FROM dbo.U_EGWLIFEHW_EEList WITH (NOLOCK)
			INNER JOIN dbo.EmpComp WITH (NOLOCK)
				ON xEEID = EecEEID
				AND xCoID = EecCoID
			LEFT JOIN dbo.U_dsi_BDM_EGWLIFEHW WITH (NOLOCK)
				ON xEEID = BdmEEID
				AND xCoID = BdmCoID
		) Eff2
	INNER JOIN dbo.U_EGWLIFEHW_EEList
		ON xEEID = EffEEID
		AND xCoID = EffCoID
	GROUP BY EffEEID, EffCoID;

	-- Create Index
	CREATE CLUSTERED INDEX CDX_U_EGWLIFEHW_EffDates ON dbo.U_EGWLIFEHW_EffDates (EffEEID, EffCoID);

	-----------------------
	-- Working Table Policy
	-----------------------
	IF OBJECT_ID('U_EGWLIFEHW_Policy','U') IS NOT NULL
        DROP TABLE dbo.U_EGWLIFEHW_Policy;
	SELECT DISTINCT 
		PlcEEID = xEEID
		,PlcCoID = xCOID
		,PlcPolicyNumber = 
			CASE
				WHEN NULLIF(Employment_CanadaBenefitClass, '') IS NOT NULL THEN 55350
				WHEN EXISTS (SELECT 1 FROM dbo.U_dsi_BDM_EGWLIFEHW WITH (NOLOCK) WHERE BdmEEID = xEEID AND BdmCOID = xCOID AND BdmRecType = 'EMP') THEN 138578
			END
	INTO dbo.U_EGWLIFEHW_Policy
	FROM dbo.U_EGWLIFEHW_EEList WITH (NOLOCK)
	LEFT JOIN [dbo].[fn_MP_CustomFields_EmpComp_Export] (NULL, NULL, NULL, NULL) Pcf
		ON Pcf.EecEEID = xEEID
		AND Pcf.EecCoID = xCOID
		AND NULLIF(Employment_CanadaBenefitClass, '') IS NOT NULL
	;

	-- Create Index
	CREATE CLUSTERED INDEX CDX_U_EGWLIFEHW_Policy ON dbo.U_EGWLIFEHW_Policy (PlcEEID, PlcCoID);

    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_EGWLIFEHW_DrvTbl_Emps_D10
    ---------------------------------
    IF OBJECT_ID('U_EGWLIFEHW_DrvTbl_Emps_D10','U') IS NOT NULL
        DROP TABLE dbo.U_EGWLIFEHW_DrvTbl_Emps_D10;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = MAX(EecEmpNo + 'A')
        ,drvSubSort = '1901-01-01'
        -- standard fields above and additional driver fields below
        ,drvGroupPolicyNumber = PlcPolicyNumber
        ,drvEmpNo = MAX(RIGHT(CONCAT('0000000000', EecEmpNo), 10))
        ,drvPersonType = MAX(CASE WHEN EecTermReason = '16' THEN 'RP' ELSE 'PT' END)
        ,drvTransactionType = MAX(CASE WHEN EecEmplStatus = 'T' OR BdmBenStopDate IS NOT NULL THEN 'T' END)
        ,drvEffectiveDate = MAX(EffDate)
        ,drvDivision = MAX(Employment_CanadaLifeBenefitDivision)
        ,drvBenefitClass = MAX(Employment_CanadaBenefitClass)
        ,drvAdministrativeClass = MAX(COALESCE(
			CASE WHEN EecFullTimeOrPartTime = 'PT' AND EecDateofLastHire < '06/01/2014' THEN '007' ELSE '001' END
		    ,CASE WHEN BdmDedCode IS NOT NULL AND EecFullTimeOrPartTime = 'PT' AND EecDateofLastHire < 06/01/2014 THEN '007' ELSE '001' END))
        ,drvRetirementDate = MAX(CASE WHEN EecTermReason = '208' THEN EecDateOfTermination END)
		,drvTerminationClauseIndicator = MAX(CASE WHEN EecEmplStatus = 'T' OR BdmBenStopDate IS NOT NULL THEN 'T' END)
        ,drvNameLast = MAX(EepNameLast)
        ,drvNameFirst = MAX(EepNameFirst)
        ,drvNameMiddle = MAX(LEFT(EepNameMiddle,1))
        ,drvGender = MAX(EepGender)
        ,drvDateOfBirth = MAX(EepDateOfBirth)
        ,drvLanguageCode = MAX(
			CASE 
				WHEN EecLanguageCode = 'EN' THEN 'E'
				WHEN EecLanguageCode = 'FR' THEN 'F'
			END)
        ,drvMailingAddress = MAX(CONCAT(RTRIM(LTRIM(EepAddressline1)), ' ', RTRIM(LTRIM(EepAddressline2))))
        ,drvAddressCity = MAX(EepAddressCity)
        ,drvAddressState = MAX(EepAddressState)
        ,drvAddressZipCode = MAX(CONCAT(LEFT(RTRIM(LTRIM(EepAddressZipCode)), 3), ' ', SUBSTRING(RTRIM(LTRIM(EepAddressZipCode)), 4, 6)))
        ,drvAddressCountry = '' -- MAX(CASE WHEN EepAddressCountry <> 'CAN' THEN EepAddressCountry END)
        ,drvWaitingPeriodStartDate = MAX(CASE WHEN EecJobChangeReason = '101' AND EecDateOfLastHire <> EecDateOfOriginalHire THEN EecDateOfLastHire ELSE EecDateOfOriginalHire END)
        ,drvWaitingAppliedIndicator = '' -- No employees with this config field.
        ,drvStateSUI = MAX(EepAddressState)
        ,drvAddressState2 = MAX(EepAddressState)
        ,drvOrgLvl3 = MAX(EecOrgLvl3)
        ,drvTaxExeptIndicator = MAX(Employment_TaxExempt)
        ,drvDependentIndicator = MAX(COALESCE(ConIndicator, 'N'))
        ,drvAnnSalary = MAX(CONVERT(VARCHAR, CAST(ROUND(EecAnnSalary, -3) AS INT)))
        ,drvBenefitID1 = 'HCARE'
        ,drvPersonType1 = MAX(IIF(EecEmplStatus <> 'T', 'PT', ''))
        ,drvEmployeeBenefitStatus1 = MAX(
			CASE 
				WHEN (EecEmplStatus = 'L' AND EecLeaveReason NOT IN ('100','103','201','400','500')) OR EecEmplStatus = 'T' THEN 'TERM'
				WHEN Employment_CanadaLifeBenefitStatus = 'Waived' THEN 'Waived' 
				ELSE 'IN-FORCE'
			END)
        ,drvDependantBenefitStatus1 = MAX(
			CASE WHEN ConIndicator = 'Y' THEN 
				CASE WHEN Employment_CanadaLifeBenefitStatus = 'Waived' THEN 'Waived' ELSE 'IN-FORCE' END
			END)
        ,drvBenefitId2 = MAX(
			CASE 
				WHEN PlcPolicyNumber = 55350 THEN 'DENT' 
				WHEN PlcPolicyNumber = 138578 THEN 'WI' 
			END)
        ,drvPersonType2 = MAX(CASE WHEN PlcPolicyNumber IN (55350, 138578) THEN IIF(EecEmplStatus <> 'T', 'PT', '') END)
        ,drvEmployeeBenefitStatus2 = MAX(
			CASE 
				WHEN (EecEmplStatus = 'L' AND EecLeaveReason NOT IN ('100','103','201','400','500')) OR EecEmplStatus = 'T' THEN 'TERM'
				WHEN Employment_CanadaLifeBenefitStatus = 'Waived' THEN 'Waived'
				ELSE 'IN-FORCE'
			END)
        ,drvDependantBenefitStatus2 = MAX(
			CASE WHEN ConIndicator = 'Y' THEN 
				CASE WHEN Employment_CanadaLifeBenefitStatus = 'Waived' THEN 'Waived' ELSE 'IN-FORCE' END
			END)
        ,drvBenefitId3 = MAX(CASE WHEN PlcPolicyNumber = 138578 THEN 'BLIFE' END)
        ,drvPersonType3 =  MAX(CASE WHEN PlcPolicyNumber = 138578 THEN  IIF(EecEmplStatus <> 'T', 'PT', '') END)
        ,drvEmployeeBenefitStatus3 = MAX(
			CASE WHEN PlcPolicyNumber = 138578 THEN
				CASE 
					WHEN (EecEmplStatus = 'L' AND EecLeaveReason NOT IN ('100','103','201','400','500')) OR EecEmplStatus = 'T' THEN 'TERM'
					WHEN Employment_CanadaLifeBenefitStatus = 'Waived' THEN 'Waived' 
					ELSE 'IN-FORCE'
				END
			END)
        ,drvDependantBenefitStatus3 = ''
        ,drvBenefitId4 = MAX(CASE WHEN PlcPolicyNumber = 138578 THEN 'AD&D' END)
        ,drvPersonType4 = MAX(CASE WHEN PlcPolicyNumber = 138578 THEN  IIF(EecEmplStatus <> 'T', 'PT', '') END)
        ,drvEmployeeBenefitStatus4 = MAX(
			CASE WHEN PlcPolicyNumber = 138578 THEN 
				CASE 
					WHEN EecEmplStatus = 'L' AND EecLeaveReason NOT IN ('100','103','201','400','500') THEN 'TERM'
					WHEN Employment_CanadaLifeBenefitStatus = 'Waived' THEN 'Waived'
					ELSE 'IN-FORCE'
				END
			END)
        ,drvDependantBenefitStatus4 = ''
        ,drvBenefitId5 = MAX(CASE WHEN PlcPolicyNumber = 138578 THEN 'LTD' END)
        ,drvPersonType5 = MAX(CASE WHEN PlcPolicyNumber = 138578 THEN IIF(EecEmplStatus <> 'T', 'PT', '') END)
        ,drvEmployeeBenefitStatus5 = MAX(
			CASE WHEN PlcPolicyNumber = 138578 THEN 
				CASE 
					WHEN EecEmplStatus = 'L' AND EecLeaveReason NOT IN ('100','103','201','400','500') THEN 'TERM'
					WHEN Employment_CanadaLifeBenefitStatus = 'Waived' THEN 'Waived' 
					ELSE 'IN-FORCE'
				END
			END)
        ,drvDependantBenefitStatus5 = ''
        ,drvBenefitId6 = MAX(CASE WHEN PlcPolicyNumber = 138578 THEN 'CNTCT' END)
        ,drvPersonType6 = MAX(CASE WHEN PlcPolicyNumber = 138578 THEN IIF(EecEmplStatus <> 'T', 'PT', '') END)
        ,drvEmployeeBenefitStatus6 = MAX(
			CASE WHEN PlcPolicyNumber = 138578 THEN 
				CASE 
					WHEN EecEmplStatus = 'L' AND EecLeaveReason NOT IN ('100','103','201','400','500') THEN 'TERM'
					WHEN Employment_CanadaLifeBenefitStatus = 'Waived' THEN 'Waived' 
					ELSE 'IN-FORCE'
				END
			END)
        ,drvDependantBenefitStatus6 = ''
    INTO dbo.U_EGWLIFEHW_DrvTbl_Emps_D10
    FROM dbo.U_EGWLIFEHW_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp Ec WITH (NOLOCK)
        ON Ec.EecEEID = xEEID 
        AND Ec.EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
	INNER JOIN dbo.U_EGWLIFEHW_EffDates  WITH (NOLOCK)
		ON xEEID = EffEEID
		AND xCoID = EffCoID
	INNER JOIN dbo.U_EGWLIFEHW_Policy WITH (NOLOCK)
		ON PlcEEID = xEEID
		AND PlcCoID = xCOID
		AND PlcPolicyNumber IS NOT NULL
    LEFT JOIN dbo.U_dsi_BDM_EGWLIFEHW WITH (NOLOCK)
        ON BdmEEID = xEEID 
        AND BdmCoID = xCoID
		AND BdmRecType = 'EMP'
	LEFT JOIN [dbo].[fn_MP_CustomFields_EmpComp_Export] (NULL, NULL, NULL, NULL) Pcf
		ON xEEID = Pcf.EecEEID
		AND xCoID = Pcf.EecCoID
	LEFT JOIN (SELECT 
	               ConEEID
				   ,ConIndicator = MAX(CASE WHEN ConRelationShip IN ('SPS','CHL','STC') THEN 'Y' END)
			   FROM dbo.Contacts WITH (NOLOCK)
			   WHERE ConRelationShip IN ('SPS','CHL','STC')
			   GROUP BY ConEEID
			  ) Con
		ON xEEID = ConEEID
	GROUP BY xEEID, xCoID, PlcPolicyNumber
	OPTION (FORCE ORDER);

    ---------------------------------
    -- DETAIL RECORD - U_EGWLIFEHW_DrvTbl_Deps_D11
    ---------------------------------
    IF OBJECT_ID('U_EGWLIFEHW_DrvTbl_Deps_D11','U') IS NOT NULL
        DROP TABLE dbo.U_EGWLIFEHW_DrvTbl_Deps_D11;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvDepRecID = ConSystemID
        ,drvInitialSort = MAX(EecEmpNo + 'B')
        ,drvSubSort = MAX(ConDateOfBirth)
        -- standard fields above and additional driver fields below
        ,drvGroupPolicyNumber = PlcPolicyNumber
        ,drvEmpNo = MAX(RIGHT(CONCAT('0000000000', EecEmpNo), 10))
        ,drvPersonType = ''
        ,drvTransactionType = MAX(CASE WHEN EecEmplStatus = 'T' OR BdmBenStopDate IS NOT NULL THEN 'T' END)
        ,drvEffectiveDate = MAX(CASE WHEN EecEmplStatus = 'T' THEN EecDateOfTermination ELSE EffDate END)
        ,drvDivision = MAX(Employment_CanadaLifeBenefitDivision)
        ,drvBenefitClass = MAX(Employment_CanadaBenefitClass)
        ,drvNameLast = MAX(ConNameLast)
        ,drvNameFirst = MAX(ConNameFirst)
        ,drvNameMiddle = MAX(LEFT(ConNameMiddle,1))
        ,drvGender = MAX(ConGender)
        ,drvDateOfBirth = MAX(ConDateOfBirth)
        ,drvLanguageCode = 
			MAX(CASE 
		            WHEN EecLanguageCode = 'EN' THEN 'E'
					WHEN EecLanguageCode = 'FR' THEN 'F'
				END)
        ,drvAddressState = MAX(ConAddressState)
        ,drvDependentRelationShip = MAX(
			CASE 
		        WHEN ConRelationship = 'SPS' THEN 'SP'
				WHEN ConRelationship IN ('STC','CHL') AND ConIsStudent = 'Y' AND ConIsDisabled = 'N' THEN 'ST'
				ELSE CASE WHEN ConIsDisabled = 'Y' THEN 'DD' ELSE 'CH' END
			END)
        ,drvSpouseHealthCobCode = MAX(CASE WHEN ConRelationship = 'SPS' THEN Employment_CanadaLifeHealthCare END)
        ,drvSppuseDentalCobCode = MAX(CASE WHEN ConRelationship = 'SPS' THEN Employment_CanadaLifeDentalCare END)
        ,drvSpouseVisionCobCode = MAX(CASE WHEN ConRelationship = 'SPS' THEN Employment_CanadaLifeVisionCare END)
        ,drvSppuseDrugCobCode = MAX(CASE WHEN ConRelationship = 'SPS' THEN Employment_CanadaLifeHealthCare END)
        ,drvDependantCoverage = MAX(CASE WHEN Employment_DependentIndicator = 'Yes' THEN 'B' END)
        ,drvBenefitID1 = MAX(CASE WHEN PlcPolicyNumber IN (55350, 138578) THEN 'HCARE' END)
        ,drvDependantBenefitStatus1 = MAX(
			CASE WHEN PlcPolicyNumber IN (55350, 138578) THEN
				CASE 
					WHEN Employment_CanadaLifeBenefitStatus = 'Waived' THEN 'Waived' 
					ELSE 'IN-FORCE' 
				END
			END)
        ,drvBenefitID2 = MAX(CASE WHEN PlcPolicyNumber = 55350 THEN 'DENT' END)
        ,drvDependantBenefitStatus2 = MAX(
			CASE WHEN PlcPolicyNumber = 55350 THEN
				CASE 
					WHEN Employment_CanadaLifeBenefitStatus = 'Waived' THEN 'Waived' 
					ELSE 'IN-FORCE' 
				END
			END)
        ,drvBenefitID3 = ''
        ,drvDependantBenefitStatus3 = ''
    INTO dbo.U_EGWLIFEHW_DrvTbl_Deps_D11
    FROM dbo.U_EGWLIFEHW_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp Ec WITH (NOLOCK)
        ON Ec.EecEEID = xEEID 
        AND Ec.EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
	INNER JOIN dbo.Contacts WITH (NOLOCK)
		ON xEEID = ConEEID
		AND ConRelationship IN ('SPS','CHL','STC')
	INNER JOIN dbo.U_EGWLIFEHW_EffDates  WITH (NOLOCK)
		ON xEEID = EffEEID
		AND xCoID = EffCoID
	INNER JOIN dbo.U_EGWLIFEHW_Policy WITH (NOLOCK)
		ON PlcEEID = xEEID
		AND PlcCoID = xCOID
    LEFT JOIN dbo.U_dsi_BDM_EGWLIFEHW WITH (NOLOCK)
        ON ConSystemID = BdmDepRecID
	LEFT JOIN [dbo].[fn_MP_CustomFields_EmpComp_Export] (NULL, NULL, NULL, NULL) Pcf
		ON xEEID = Pcf.EecEEID
		AND xCoID = Pcf.EecCoID
		AND NULLIF(Employment_CanadaBenefitClass, '') IS NOT NULL
	GROUP BY xEEID, xCoID, ConSystemID, PlcPolicyNumber
	OPTION (FORCE ORDER);

END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwEGWLIFEHW_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_EGWLIFEHW_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'EGWLIFEHW%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202004229'
       ,expStartPerControl     = '202004229'
       ,expLastEndPerControl   = '202004299'
       ,expEndPerControl       = '202004299'
WHERE expFormatCode = 'EGWLIFEHW';

**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwEGWLIFEHW_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_EGWLIFEHW_File WITH (NOLOCK)
    ORDER BY InitialSort, SubSort
