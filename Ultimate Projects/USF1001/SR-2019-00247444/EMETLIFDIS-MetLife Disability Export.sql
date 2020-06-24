SET NOCOUNT ON;
IF OBJECT_ID('U_EMETLIFDIS_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EMETLIFDIS_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EMETLIFDIS_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EMETLIFDIS' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEMETLIFDIS_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEMETLIFDIS_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EMETLIFDIS') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EMETLIFDIS];
GO
IF OBJECT_ID('U_EMETLIFDIS_File') IS NOT NULL DROP TABLE [dbo].[U_EMETLIFDIS_File];
GO
IF OBJECT_ID('U_EMETLIFDIS_EEList') IS NOT NULL DROP TABLE [dbo].[U_EMETLIFDIS_EEList];
GO
IF OBJECT_ID('U_EMETLIFDIS_DedList') IS NOT NULL DROP TABLE [dbo].[U_EMETLIFDIS_DedList];
GO
IF OBJECT_ID('U_EMETLIFDIS_AuditFields') IS NOT NULL DROP TABLE [dbo].[U_EMETLIFDIS_AuditFields];
GO
IF OBJECT_ID('U_EMETLIFDIS_Audit') IS NOT NULL DROP TABLE [dbo].[U_EMETLIFDIS_Audit];
GO
IF OBJECT_ID('U_dsi_BDM_EMETLIFDIS') IS NOT NULL DROP TABLE [dbo].[U_dsi_BDM_EMETLIFDIS];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EMETLIFDIS';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EMETLIFDIS';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EMETLIFDIS';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EMETLIFDIS';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EMETLIFDIS';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhRespectZeroPayRate,AdhCreateTClockBatches,AdhThirdPartyPay) VALUES ('N','C','Y','0','','','N','','N','','013010','EMPEXPORT','SDF','EMETLIFDIS','MetLife Disability Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','2000','S','N','EMETLIFDISZ0','N','Jan  1 1900 12:00AM','C','N',NULL,'N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRecordType"','1','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1',NULL,'Record Type (Transaction Code)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"5920083"','2','(''DA''=''F'')','EMETLIFDISZ0','7','D','10','2',NULL,'Customer Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeSSN"','3','(''UA''=''F'')','EMETLIFDISZ0','11','D','10','9',NULL,'Employee ID (typically SSN)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','4','(''SS''=''F'')','EMETLIFDISZ0','11','D','10','20',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMemberSSN"','5','(''UA''=''F'')','EMETLIFDISZ0','9','D','10','31',NULL,'Member Social Security Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','6','(''UA''=''F'')','EMETLIFDISZ0','20','D','10','40',NULL,'Member Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','7','(''UA''=''F'')','EMETLIFDISZ0','12','D','10','60',NULL,'Member First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameMiddle"','8','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','72',NULL,'Member Middle Initial',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfBirth"','9','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','73',NULL,'Member Birth Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMaritalStatus"','10','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','81',NULL,'Member Marital Status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGender"','11','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','82',NULL,'Member Sex',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRelationshipCode"','12','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','83',NULL,'Relationship Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','13','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','85',NULL,'Employee''s employment date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','14','(''SS''=''F'')','EMETLIFDISZ0','11','D','10','93',NULL,'Personnel Identification',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','15','(''SS''=''F'')','EMETLIFDISZ0','24','D','10','104',NULL,'Reserved Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','16','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','128',NULL,'Survivor Indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','17','(''SS''=''F'')','EMETLIFDISZ0','9','D','10','129',NULL,'Survivor SSN',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','18','(''SS''=''F'')','EMETLIFDISZ0','20','D','10','138',NULL,'Survivor Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','19','(''SS''=''F'')','EMETLIFDISZ0','12','D','10','158',NULL,'Survivor First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvForeingAddressIndicator"','20','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','170',NULL,'Foreign address Indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine2"','21','(''UA''=''F'')','EMETLIFDISZ0','32','D','10','171',NULL,'Care of Address',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine1"','22','(''UA''=''F'')','EMETLIFDISZ0','32','D','10','203',NULL,'Employee Mailing Address/Street Address 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressCity"','23','(''UA''=''F'')','EMETLIFDISZ0','21','D','10','235',NULL,'City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressState"','24','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','256',NULL,'State',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressZipCode"','25','(''UA''=''F'')','EMETLIFDISZ0','9','D','10','258',NULL,'Zip Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTypeCoverage1"','26','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','267',NULL,'Type Coverage-1 (First Coverage)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStartDate1"','27','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','269',NULL,'Coverage start date-1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStopDate1"','28','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','277',NULL,'Coverage stop date-1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupNumber1"','29','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','285',NULL,'Group Number-1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubdivision1"','30','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','292',NULL,'Subdivision-1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBranch1"','31','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','296',NULL,'Branch-1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','32','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','300',NULL,'Plan Code-1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStatusCode1"','33','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','302',NULL,'Status Code-1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMemberCoveredCode1"','34','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','303',NULL,'Members Covered Code-1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','35','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','304',NULL,'Cancel Reason-1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','36','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','306',NULL,'Dependent Class Indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','37','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','307',NULL,'Facility ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','38','(''SS''=''F'')','EMETLIFDISZ0','15','D','10','315',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','39','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','330',NULL,'Type Coverage-2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','40','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','332',NULL,'Coverage start date-2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','41','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','340',NULL,'Coverage stop date-2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','42','(''SS''=''F'')','EMETLIFDISZ0','7','D','10','348',NULL,'Group Number-2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','43','(''SS''=''F'')','EMETLIFDISZ0','4','D','10','355',NULL,'Subdivision-2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','44','(''SS''=''F'')','EMETLIFDISZ0','4','D','10','359',NULL,'Branch-2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','45','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','363',NULL,'Plan Code-2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','46','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','365',NULL,'Status Code-2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','47','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','366',NULL,'Members Covered Code-2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','48','(''SS''=''F'')','EMETLIFDISZ0','10','D','10','367',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"00000000"','49','(''DA''=''F'')','EMETLIFDISZ0','8','D','10','377',NULL,'Annual Benefit Amount– 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','50','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','385',NULL,'Salary Mode-2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','51','(''SS''=''F'')','EMETLIFDISZ0','7','D','10','386',NULL,'Salary-2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','52','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','393',NULL,'Type Coverage-3 (Third Coverage)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','53','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','395',NULL,'Coverage start date-3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','54','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','403',NULL,'Coverage stop date-3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','55','(''SS''=''F'')','EMETLIFDISZ0','7','D','10','411',NULL,'Group Number-3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','56','(''SS''=''F'')','EMETLIFDISZ0','4','D','10','418',NULL,'Subdivision-3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','57','(''SS''=''F'')','EMETLIFDISZ0','4','D','10','422',NULL,'Branch-3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','58','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','426',NULL,'Plan Code-3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','59','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','428',NULL,'Status Code-3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','60','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','429',NULL,'Members Covered Code-3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','61','(''SS''=''F'')','EMETLIFDISZ0','10','D','10','430',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','62','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','440',NULL,'Annual Benefit Amount– 3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','63','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','448',NULL,'Salary Mode-3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"0000000"','64','(''DA''=''F'')','EMETLIFDISZ0','7','D','10','449',NULL,'Salary-3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTypeCoverage4"','65','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','456',NULL,'Type Coverage- 4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStartDate4"','66','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','458',NULL,'Coverage start date-4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStopDate4"','67','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','466',NULL,'Coverage stop date-4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupNumber4"','68','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','474',NULL,'Group Number-4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupSubdivision4"','69','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','481',NULL,'Subdivision-4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBranch4"','70','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','485',NULL,'Branch-4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','71','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','489',NULL,'Plan Code-4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStatusCode4"','72','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','491',NULL,'Status Code-4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMemberCoveredCode4"','73','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','492',NULL,'Members Covered Code-4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','74','(''SS''=''F'')','EMETLIFDISZ0','10','D','10','493',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMonthlyBenefitAmount4"','75','(''UA''=''F'')','EMETLIFDISZ0','8','D','10','503',NULL,'Monthly Benefit Amount– 4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalaryMode4"','76','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','511',NULL,'Salary Mode-4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalary4"','77','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','512',NULL,'Salary-4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTypeCoverage5"','78','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','519',NULL,'Type Coverage-5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStartDate5"','79','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','521',NULL,'Coverage start date-5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStopDate5"','80','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','529',NULL,'Coverage stop date-5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupNumber5"','81','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','537',NULL,'Group Number-5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubdivision5"','82','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','544',NULL,'Subdivision-5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBrnach5"','83','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','548',NULL,'Branch-5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','84','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','552',NULL,'Plan Code-5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStatus5"','85','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','554',NULL,'Status Code-5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMemberCoveredCode5"','86','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','555',NULL,'Members Covered Code-5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','87','(''SS''=''F'')','EMETLIFDISZ0','10','D','10','556',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvWeeklyBenefitAmount5"','88','(''UA''=''F'')','EMETLIFDISZ0','8','D','10','566',NULL,'Weekly Benefit Amount– 5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalaryMode5"','89','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','574',NULL,'Salary Mode-5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalary5"','90','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','575',NULL,'Salary-5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','91','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','582',NULL,'Type Coverage 6',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','92','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','584',NULL,'Coverage start date-6',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','93','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','592',NULL,'Coverage stop date-6',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','94','(''SS''=''F'')','EMETLIFDISZ0','7','D','10','600',NULL,'Group Number-6',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','95','(''SS''=''F'')','EMETLIFDISZ0','4','D','10','607',NULL,'Subdivision-6',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','96','(''SS''=''F'')','EMETLIFDISZ0','4','D','10','611',NULL,'Branch-6',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','97','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','615',NULL,'Plan Code-6',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','98','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','617',NULL,'Status Code-6',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','99','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','618',NULL,'Members Covered Code-6',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','100','(''SS''=''F'')','EMETLIFDISZ0','10','D','10','619',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"00000000"','101','(''DA''=''F'')','EMETLIFDISZ0','8','D','10','629',NULL,'Annual Benefit Amount– 6',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','102','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','637',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTypeCoverage7"','103','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','645',NULL,'Type Coverage-7',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStartDate7"','104','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','647',NULL,'Coverage start date-7',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStopDate7"','105','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','655',NULL,'Coverage stop date-7',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupNumber7"','106','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','663',NULL,'Group Number-7',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubdivision7"','107','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','670',NULL,'Subdivision-7',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBranch7"','108','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','674',NULL,'Branch-7',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','109','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','678',NULL,'Plan Code-7',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStatusCode7"','110','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','680',NULL,'Status Code-7',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMembersCoveredCode7"','111','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','681',NULL,'Members Covered Code-7',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','112','(''SS''=''F'')','EMETLIFDISZ0','10','D','10','682',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAnnualBenefitAmount7"','113','(''UA''=''F'')','EMETLIFDISZ0','8','D','10','692',NULL,'Annual Benefit Amount– 7',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalaryMode7"','114','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','700',NULL,'Salary Mode-7',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalary7"','115','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','701',NULL,'Salary-7',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTypeCoverageCode8"','116','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','708',NULL,'Type Coverage- 8',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStartDate8"','117','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','710',NULL,'Coverage start date-8',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStopDate8"','118','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','718',NULL,'Coverage stop date-8',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupNumber8"','119','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','726',NULL,'Group Number-8',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubdivision8"','120','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','733',NULL,'Subdivision-8',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBranch8"','121','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','737',NULL,'Branch-8',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','122','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','741',NULL,'Plan Code-8',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStatusCode8"','123','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','743',NULL,'Status Code-8',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMembersCoveredCode8"','124','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','744',NULL,'Members Covered Code-8',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','125','(''SS''=''F'')','EMETLIFDISZ0','10','D','10','745',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAnnualBenefitAmount8"','126','(''UA''=''F'')','EMETLIFDISZ0','8','D','10','755',NULL,'Annual Benefit Amount– 8',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEligibilityUtility8"','127','(''UA''=''F'')','EMETLIFDISZ0','8','D','10','763',NULL,'Eligibility-Utility-3 – 8',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTypeCoverage9"','128','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','771',NULL,'Type Coverage-9',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStartDate9"','129','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','773',NULL,'Coverage start date-9',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStopDate9"','130','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','781',NULL,'Coverage stop date-9',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupNumber9"','131','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','789',NULL,'Group Number-9',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubdivision9"','132','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','796',NULL,'Subdivision-9',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBranch9"','133','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','800',NULL,'Branch-9',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','134','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','804',NULL,'Plan Code-9',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStatusCode9"','135','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','806',NULL,'Status Code-9',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMembersCoveredCode9"','136','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','807',NULL,'Members Covered Code-9',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','137','(''SS''=''F'')','EMETLIFDISZ0','10','D','10','808',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAnnualBenefitAmount9"','138','(''UA''=''F'')','EMETLIFDISZ0','8','D','10','818',NULL,'Annual Benefit Amount– 9',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEligibilityUtility9"','139','(''UA''=''F'')','EMETLIFDISZ0','8','D','10','826',NULL,'Eligibility-Utility-3 - 9',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTypeCoverageCode10"','140','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','834',NULL,'Type Coverage 10',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStartDate10"','141','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','836',NULL,'Coverage start date-10',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStopDate10"','142','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','844',NULL,'Coverage stop date-10',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupNumber10"','143','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','852',NULL,'Group Number-10',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubDivision10"','144','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','859',NULL,'Subdivision-10',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBranch10"','145','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','863',NULL,'Branch-10',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','146','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','867',NULL,'Plan Code-10',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStatusCode10"','147','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','869',NULL,'Status Code-10',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMembersCoveredCode10"','148','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','870',NULL,'Members Covered Code-10',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','149','(''SS''=''F'')','EMETLIFDISZ0','10','D','10','871',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAnnualBenefitAmount10"','150','(''UA''=''F'')','EMETLIFDISZ0','8','D','10','881',NULL,'Annual Benefit Amount– 10',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalaryMode10"','151','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','889',NULL,'Salary Mode-10',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalary10"','152','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','890',NULL,'Salary-10',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTypeCoverage11"','153','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','897',NULL,'Type Coverage 11',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStartDate11"','154','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','899',NULL,'Coverage start date-11',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStopDate11"','155','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','907',NULL,'Coverage stop date-11',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupNumber11"','156','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','915',NULL,'Group Number-11',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubdivision11"','157','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','922',NULL,'Subdivision-11',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBranch11"','158','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','926',NULL,'Branch-11',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','159','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','930',NULL,'Plan Code-11',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStatusCode11"','160','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','932',NULL,'Status Code-11',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMembersCoveredCode11"','161','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','933',NULL,'Members Covered Code-11',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','162','(''SS''=''F'')','EMETLIFDISZ0','10','D','10','934',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAnnualBenefitAmount11"','163','(''UA''=''F'')','EMETLIFDISZ0','8','D','10','944',NULL,'Annual Benefit Amount– 11',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEligibilityUtility11"','164','(''UA''=''F'')','EMETLIFDISZ0','8','D','10','952',NULL,'Eligibility-Utility-3 - 11',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTypeCoverage12"','165','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','960',NULL,'Type Coverage 12',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStartDate12"','166','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','962',NULL,'Coverage start date-12',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStopDate12"','167','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','970',NULL,'Coverage stop date-12',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupNumber12"','168','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','978',NULL,'Group Number-12',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubdivision12"','169','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','985',NULL,'Subdivision-12',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBranch12"','170','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','989',NULL,'Branch-12',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','171','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','993',NULL,'Plan Code-12',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStatusCode12"','172','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','995',NULL,'Status Code-12',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMembersCoveredCode12"','173','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','996',NULL,'Members Covered Code-12',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','174','(''SS''=''F'')','EMETLIFDISZ0','10','D','10','997',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAnnualBenefitAmount12"','175','(''UA''=''F'')','EMETLIFDISZ0','8','D','10','1007',NULL,'Annual Benefit Amount– 12',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','176','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','1015',NULL,'Eligibility-Utility-3 - 12',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','177','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','1023',NULL,'Type Coverage 13',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','178','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','1025',NULL,'Coverage start date-13',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','179','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','1033',NULL,'Coverage stop date-13',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','180','(''SS''=''F'')','EMETLIFDISZ0','7','D','10','1041',NULL,'Group Number-13',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','181','(''SS''=''F'')','EMETLIFDISZ0','4','D','10','1048',NULL,'Subdivision-13',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','182','(''SS''=''F'')','EMETLIFDISZ0','4','D','10','1052',NULL,'Branch-13',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','183','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','1056',NULL,'Plan Code-13',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','184','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','1058',NULL,'Status Code-13',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','185','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','1059',NULL,'Members Covered Code-13',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','186','(''SS''=''F'')','EMETLIFDISZ0','10','D','10','1060',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"00000000"','187','(''DA''=''F'')','EMETLIFDISZ0','8','D','10','1070',NULL,'Annual Benefit Amount– 13',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','188','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','1078',NULL,'Eligibility-Utility-3 - 13',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','189','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','1086',NULL,'Type Coverage 14',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','190','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','1088',NULL,'Coverage start date-14',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','191','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','1096',NULL,'Coverage stop date-14',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','192','(''SS''=''F'')','EMETLIFDISZ0','7','D','10','1104',NULL,'Group Number-14',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','193','(''SS''=''F'')','EMETLIFDISZ0','4','D','10','1111',NULL,'Subdivision-14',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','194','(''SS''=''F'')','EMETLIFDISZ0','4','D','10','1115',NULL,'Branch-14',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','195','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','1119',NULL,'Plan Code-14',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','196','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','1121',NULL,'Status Code-14',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','197','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','1122',NULL,'Members Covered Code-14',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','198','(''SS''=''F'')','EMETLIFDISZ0','10','D','10','1123',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"0000000000"','199','(''DA''=''F'')','EMETLIFDISZ0','8','D','10','1133',NULL,'Annual Benefit Amount– 14',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','200','(''SS''=''F'')','EMETLIFDISZ0','12','D','10','1141',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','201','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','1153',NULL,'Type Coverage 15',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','202','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','1155',NULL,'Coverage start date-15',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','203','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','1163',NULL,'Coverage stop date-15',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','204','(''SS''=''F'')','EMETLIFDISZ0','7','D','10','1171',NULL,'Group Number-15',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','205','(''SS''=''F'')','EMETLIFDISZ0','4','D','10','1178',NULL,'Subdivision-15',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','206','(''SS''=''F'')','EMETLIFDISZ0','4','D','10','1182',NULL,'Branch-15',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','207','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','1186',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','208','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','1188',NULL,'Status Code-15',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','209','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','1189',NULL,'Members Covered Code-15',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','210','(''SS''=''F'')','EMETLIFDISZ0','10','D','10','1190',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"00000000"','211','(''DA''=''F'')','EMETLIFDISZ0','8','D','10','1200',NULL,'Annual Benefit Amount– 15',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','212','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','1208',NULL,'Eligibility-Utility-3 - 15',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','213','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','1216',NULL,'Type Coverage 16',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','214','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','1218',NULL,'Coverage start date-16',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','215','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','1226',NULL,'Coverage stop date-16',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','216','(''SS''=''F'')','EMETLIFDISZ0','7','D','10','1234',NULL,'Group Number-16',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','217','(''SS''=''F'')','EMETLIFDISZ0','4','D','10','1241',NULL,'Subdivision-16',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','218','(''SS''=''F'')','EMETLIFDISZ0','4','D','10','1245',NULL,'Branch-16',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','219','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','1249',NULL,'Plan Code-16',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','220','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','1251',NULL,'Status Code-16',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','221','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','1252',NULL,'Members Covered Code-16',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','222','(''SS''=''F'')','EMETLIFDISZ0','10','D','10','1253',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"00000000"','223','(''DA''=''F'')','EMETLIFDISZ0','8','D','10','1263',NULL,'Annual Benefit Amount– 16',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','224','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','1271',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTypeCoverage17"','225','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','1279',NULL,'Type Coverage 17',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStartDate17"','226','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','1281',NULL,'Coverage start date-17',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStopDate17"','227','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','1289',NULL,'Coverage stop date-17',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupNumber17"','228','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','1297',NULL,'Group Number-17',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubdivision17"','229','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','1304',NULL,'Subdivision-17',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBranch17"','230','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','1308',NULL,'Branch-17',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','231','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','1312',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStatusCode17"','232','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1314',NULL,'Status Code – 17',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMembersCoveredCode17"','233','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1315',NULL,'Members Covered Code-17',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','234','(''SS''=''F'')','EMETLIFDISZ0','2','D','10','1316',NULL,'Cancel Reason – 17',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','235','(''SS''=''F'')','EMETLIFDISZ0','23','D','10','1318',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeStatusCode"','236','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1341',NULL,'Employee Status Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStatusCodeEffectiveDate"','237','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','1342',NULL,'Status Code Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','238','(''SS''=''F'')','EMETLIFDISZ0','10','D','10','1350',NULL,'Department Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"0005592349"','239','(''DA''=''F'')','EMETLIFDISZ0','10','D','10','1360',NULL,'Group ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"00001"','240','(''DA''=''F'')','EMETLIFDISZ0','5','D','10','1370',NULL,'Location ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"0000027171"','241','(''DA''=''F'')','EMETLIFDISZ0','10','D','10','1375',NULL,'Schedule ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"12"','242','(''DA''=''F'')','EMETLIFDISZ0','2','D','10','1385',NULL,'Pay Frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageCode18"','243','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','1387',NULL,'Coverage Code - 18',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStartDate18"','244','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','1389',NULL,'Coverage Start Date - 18',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStopDate18"','245','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','1397',NULL,'Coverage Stop Date - 18',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupNumber18"','246','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','1405',NULL,'Group Number - 18',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubCode18"','247','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','1412',NULL,'Subcode - 18',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBranch18"','248','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','1416',NULL,'Branch - 18',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStatusCode18"','249','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1420',NULL,'Status Code - 18',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMemebersCoveredCode18"','250','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1421',NULL,'Members Covered Code - 18',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEnrollmentStatus18"','251','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1422',NULL,'Enrollment Status - 18',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageCode19"','252','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','1423',NULL,'Coverage Code - 19',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStartDate19"','253','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','1425',NULL,'Coverage Start Date - 19',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStopDate19"','254','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','1433',NULL,'Coverage Stop Date - 19',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupNumber19"','255','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','1441',NULL,'Group Number - 19',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubcode19"','256','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','1448',NULL,'Subcode - 19',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBranch19"','257','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','1452',NULL,'Branch - 19',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMemebersCoveredCode19"','258','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1456',NULL,'Members Covered Code - 19',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEnrollmentStatus19"','259','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1457',NULL,'Enrollment Status - 19',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBenefitAmount19"','260','(''UA''=''F'')','EMETLIFDISZ0','8','D','10','1458',NULL,'Benefit Amount - 19',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvVoluntaryCancellationInd19"','261','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','1466',NULL,'Voluntary Cancellation Ind - 19',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','262','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','1468',NULL,'Taveover Indicator - 19',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','263','(''SS''=''F'')','EMETLIFDISZ0','9','D','10','1469',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageCode20"','264','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','1478',NULL,'Coverage Code - 20',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStartDate20"','265','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','1480',NULL,'Coverage Start Date - 20',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStopDate20"','266','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','1488',NULL,'Coverage Stop Date - 20',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupNumber20"','267','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','1496',NULL,'Group Number - 20',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubcode20"','268','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','1503',NULL,'Subcode - 20',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBranch20"','269','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','1507',NULL,'Branch - 20',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMembersCoveredCode20"','270','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1511',NULL,'Members Covered Code - 20',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEnrollmentStatus20"','271','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1512',NULL,'Enrollment Status - 20',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBenefitAmount20"','272','(''UA''=''F'')','EMETLIFDISZ0','8','D','10','1513',NULL,'Benefit Amount - 20',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvVoluntaryCancellationInd20"','273','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','1521',NULL,'Voluntary Cancellation Ind - 20',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','274','(''SS''=''F'')','EMETLIFDISZ0','8','D','10','1523',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','275','(''SS''=''F'')','EMETLIFDISZ0','45','D','10','1531',NULL,'Filler Coverage Code - 21',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','276','(''SS''=''F'')','EMETLIFDISZ0','37','D','10','1576',NULL,'Filler Coverage Code - 22',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageCode23"','277','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','1613',NULL,'Coverage Code - 23',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStartDate23"','278','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','1615',NULL,'Coverage Start Date - 23',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStopDate23"','279','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','1623',NULL,'Coverage Stop Date - 23',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupNumber23"','280','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','1631',NULL,'Group Number - 23',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubcode23"','281','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','1638',NULL,'Subcode - 23',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBranch23"','282','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','1642',NULL,'Branch - 23',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMembersCoveredCode23"','283','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1646',NULL,'Members Covered Code - 23',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEnrollmentStatus23"','284','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1647',NULL,'Enrollment Status - 23',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvVoluntaryCancellationInd23"','285','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','1648',NULL,'Voluntary Cancellation Ind - 23',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','286','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','1650',NULL,'Takeover Indicator - 23',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','287','(''SS''=''F'')','EMETLIFDISZ0','9','D','10','1651',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageCode24"','288','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','1660',NULL,'Coverage Code - 24',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStartDate24"','289','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','1662',NULL,'Coverage Start Date - 24',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStopDate24"','290','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','1670',NULL,'Coverage Stop Date - 24',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupNumber24"','291','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','1678',NULL,'Group Number - 24',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubCode24"','292','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','1685',NULL,'Subcode - 24',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBranch24"','293','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','1689',NULL,'Branch - 24',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMembersCoveredCode24"','294','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1693',NULL,'Members Covered Code - 24',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEnrollmentStatusInd24"','295','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1694',NULL,'Enrollment Status - 24',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvVoluntaryCancellationInd24"','296','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','1695',NULL,'Voluntary Cancellation Ind - 24',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','297','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','1697',NULL,'Takeover Indicator - 24',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','298','(''SS''=''F'')','EMETLIFDISZ0','9','D','10','1698',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','299','(''SS''=''F'')','EMETLIFDISZ0','45','D','10','1707',NULL,'Coverage Code - 25',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','300','(''SS''=''F'')','EMETLIFDISZ0','95','D','10','1752',NULL,'Coverage Code - 26',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','301','(''SS''=''F'')','EMETLIFDISZ0','54','D','10','1847',NULL,'Coverage Code - 27',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageCode28"','302','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','1901',NULL,'Coverage Code - 28',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStartDate28"','303','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','1903',NULL,'Coverage Start Date - 28',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStopDate28"','304','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','1911',NULL,'Coverage Stop Date - 28',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupNumber28"','305','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','1919',NULL,'Group Number - 28',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubCode28"','306','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','1926',NULL,'Subcode - 28',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBranch28"','307','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','1930',NULL,'Branch - 28',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMembersCoveredCode28"','308','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1934',NULL,'Members Covered Code - 28',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEnrollmentStatus28"','309','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1935',NULL,'Enrollment Status - 28',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBenefitAmount28"','310','(''UA''=''F'')','EMETLIFDISZ0','8','D','10','1936',NULL,'Benefit Amount - 28',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvVoluntaryCancellationInd28"','311','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','1944',NULL,'Voluntary Cancellation Ind - 28',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','312','(''SS''=''F'')','EMETLIFDISZ0','1','D','10','1946',NULL,'Takeover Indicator - 28',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','313','(''SS''=''F'')','EMETLIFDISZ0','9','D','10','1947',NULL,'Filler',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageCode29"','314','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','1956',NULL,'Coverage Code - 29',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStartDate29"','315','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','1958',NULL,'Coverage Start Date - 29',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageStopDate29"','316','(''UDMDY''=''F'')','EMETLIFDISZ0','8','D','10','1966',NULL,'Coverage Stop Date - 29',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupNumber29"','317','(''UA''=''F'')','EMETLIFDISZ0','7','D','10','1974',NULL,'Group Number - 29',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubCode29"','318','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','1981',NULL,'Subcode - 29',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBranch29"','319','(''UA''=''F'')','EMETLIFDISZ0','4','D','10','1985',NULL,'Branch - 29',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMemberCoveredCode29"','320','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1989',NULL,'Members Covered Code - 29',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEnrollementStatus29"','321','(''UA''=''F'')','EMETLIFDISZ0','1','D','10','1990',NULL,'Enrollment Status - 29',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBenefitAmount29"','322','(''UA''=''F'')','EMETLIFDISZ0','8','D','10','1991',NULL,'Benefit Amount - 29',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvVoluntaryCancellationInd29"','323','(''UA''=''F'')','EMETLIFDISZ0','2','D','10','1999',NULL,'Voluntary Cancellation Ind - 29',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MetLife Disability OnDemand','201912279','EMPEXPORT','ONDEMAND',NULL,'EMETLIFDIS',NULL,NULL,NULL,'201912279','Dec 27 2019  8:47AM','Dec 27 2019  8:47AM','201912271',NULL,'','','201912271',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MetLife Disability Test','201912279','EMPEXPORT','TEST',NULL,'EMETLIFDIS',NULL,NULL,NULL,'201912279','Dec 27 2019  8:47AM','Dec 27 2019  8:47AM','201912271',NULL,'','','201912271',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MetLife Disability Sched','201912279','EMPEXPORT','SCHEDULED',NULL,'EMETLIFDIS',NULL,NULL,NULL,'201912279','Dec 27 2019  8:47AM','Dec 27 2019  8:47AM','201912271',NULL,'','','201912271',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MetLife Disability Active OE','201912279','EMPEXPORT','OEACTIVE',NULL,'EMETLIFDIS',NULL,NULL,NULL,'201912279','Dec 27 2019  8:47AM','Dec 27 2019  8:47AM','201912271',NULL,'','','201912271',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MetLife Disability Passive OE','201912279','EMPEXPORT','OEPASSIVE',NULL,'EMETLIFDIS',NULL,NULL,NULL,'201912279','Dec 27 2019  8:47AM','Dec 27 2019  8:47AM','201912271',NULL,'','','201912271',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EMETLIFDIS','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EMETLIFDIS','ExportPath','V','\\us.saas\e0\data_exchange\USF1001\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EMETLIFDIS','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EMETLIFDIS','OEPath','V','\\us.saas\E4\Public\USF1001\Exports\Metlife\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EMETLIFDIS','OnDemandPath','V','\\us.saas\e0\data_exchange\USF1001\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EMETLIFDIS','SubSort','C','drvSubSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EMETLIFDIS','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EMETLIFDIS','TestPath','V','\\us.saas\E4\Public\USF1001\Exports\Metlife\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EMETLIFDIS','UDESPath','V','\\us.saas\e0\data_exchange\USF1001\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EMETLIFDIS','UseFileName','V','N');
UPDATE dbo.U_dsi_Configuration SET CfgValue = '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\' WHERE FormatCode = 'EMETLIFDIS' AND CfgName = 'ExportPath' AND CfgValue IS NULL;
UPDATE dbo.U_dsi_Configuration SET CfgValue = svCfgValue FROM dbo.U_EMETLIFDIS_SavePath WHERE CfgName = svCfgName AND FormatCode = svFormatCode AND svCfgValue IS NOT NULL;
IF OBJECT_ID('U_EMETLIFDIS_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EMETLIFDIS_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EMETLIFDIS','D10','dbo.U_EMETLIFDIS_DrvTbl_D10',NULL);
IF OBJECT_ID('U_dsi_BDM_EMETLIFDIS') IS NULL
CREATE TABLE [dbo].[U_dsi_BDM_EMETLIFDIS] (
    [BdmRecType] varchar(3) NOT NULL,
    [BdmCOID] char(5) NULL,
    [BdmEEID] char(12) NOT NULL,
    [BdmDepRecID] char(12) NULL,
    [BdmSystemID] char(12) NULL,
    [BdmRunID] varchar(32) NULL,
    [BdmDedRowStatus] varchar(256) NULL,
    [BdmRelationship] char(3) NULL,
    [BdmDateOfBirth] datetime NULL,
    [BdmDedCode] char(5) NULL,
    [BdmDedType] varchar(32) NULL,
    [BdmBenOption] char(6) NULL,
    [BdmBenStatus] char(1) NULL,
    [BdmBenStartDate] datetime NULL,
    [BdmBenStopDate] datetime NULL,
    [BdmBenStatusDate] datetime NULL,
    [BdmBenOptionDate] datetime NULL,
    [BdmChangeReason] char(6) NULL,
    [BdmStartDate] datetime NULL,
    [BdmStopDate] datetime NULL,
    [BdmIsCobraCovered] char(1) NULL,
    [BdmCobraReason] char(6) NULL,
    [BdmDateOfCOBRAEvent] datetime NULL,
    [BdmIsPQB] char(1) NULL,
    [BdmIsChildOldest] char(1) NULL,
    [BdmUSGField1] varchar(256) NULL,
    [BdmUSGField2] varchar(256) NULL,
    [BdmUSGDate1] datetime NULL,
    [BdmUSGDate2] datetime NULL,
    [BdmTVStartDate] datetime NULL,
    [BdmSessionID] varchar(32) NULL,
    [BdmEEAmt] money NULL,
    [BdmEECalcRateOrPct] decimal NULL,
    [BdmEEGoalAmt] money NULL,
    [BdmEEMemberOrCaseNo] char(40) NULL,
    [BdmERAmt] money NULL,
    [BdmNumSpouses] int NULL,
    [BdmNumChildren] int NULL,
    [BdmNumDomPartners] int NULL,
    [BdmNumDPChildren] int NULL
);
IF OBJECT_ID('U_EMETLIFDIS_Audit') IS NULL
CREATE TABLE [dbo].[U_EMETLIFDIS_Audit] (
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
IF OBJECT_ID('U_EMETLIFDIS_AuditFields') IS NULL
CREATE TABLE [dbo].[U_EMETLIFDIS_AuditFields] (
    [aTableName] varchar(30) NULL,
    [aFieldName] varchar(30) NULL
);
IF OBJECT_ID('U_EMETLIFDIS_DedList') IS NULL
CREATE TABLE [dbo].[U_EMETLIFDIS_DedList] (
    [DedCode] char(5) NOT NULL,
    [DedType] char(4) NOT NULL
);
IF OBJECT_ID('U_EMETLIFDIS_EEList') IS NULL
CREATE TABLE [dbo].[U_EMETLIFDIS_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EMETLIFDIS_File') IS NULL
CREATE TABLE [dbo].[U_EMETLIFDIS_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] char(2000) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EMETLIFDIS]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: US Fitness Holdings, LLC

Created By: Wyle Cordero
Business Analyst: Maribel Hernandez
Create Date: 12/27/2019
Service Request Number: SR-2019-00247444

Purpose: MetLife Disability Export

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2019     SR-2019-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EMETLIFDIS';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EMETLIFDIS';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EMETLIFDIS';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EMETLIFDIS';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EMETLIFDIS' ORDER BY RunID DESC;

-- I: drive:
UPDATE U_dsi_configuration
SET cfgvalue = dbo.dsi_fnVariable('EMETLIFDIS','TestPath') 
WHERE FormatCode = 'EMETLIFDIS'
AND cfgname IN ('ExportPath', 'OnDemandPath')

-- J: drive:
UPDATE U_dsi_configuration
SET cfgvalue = dbo.dsi_fnVariable('EMETLIFDIS','UDESpath') 
WHERE FormatCode = 'EMETLIFDIS'
AND CfgName IN ('ExportPath', 'OnDemandPath')

Job Ownership Scripts
---------------------
-- Set job owner to ssis_user for Production jobs
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 0;

-- Set job owner to self, to make changes in SQL Job Scheduler. Remember to re-run the above script to change ownership to ssis_user when complete
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 1;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EMETLIFDIS', 'ONDEMAND';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EMETLIFDIS', 'TEST';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EMETLIFDIS', 'OEPASSIVE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EMETLIFDIS', 'OEACTIVE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EMETLIFDIS', 'SCHEDULED';

EXEC dbo.dsi_BDM_sp_ErrorCheck 'EMETLIFDIS';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'EMETLIFDIS', @AllObjects = 'Y', @IsWeb = 'N'
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
    SELECT @FormatCode = 'EMETLIFDIS';

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
    DELETE FROM dbo.U_EMETLIFDIS_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_EMETLIFDIS_EEList GROUP BY xEEID HAVING COUNT(1) > 1);


    --==========================================
    -- Audit Section
    --==========================================
    -- Get data from audit fields table. Add fields here if auditing
    IF OBJECT_ID('U_EMETLIFDIS_AuditFields','U') IS NOT NULL
        DROP TABLE dbo.U_EMETLIFDIS_AuditFields;
    CREATE TABLE dbo.U_EMETLIFDIS_AuditFields (aTableName varchar(30),aFieldName varchar(30));

    INSERT INTO dbo.U_EMETLIFDIS_AuditFields VALUES ('EmpComp','EecDateOfTermination');
    INSERT INTO dbo.U_EMETLIFDIS_AuditFields VALUES ('EmpComp','EecEmplStatus');

    -- Create audit table based on fields defined above
    IF OBJECT_ID('U_EMETLIFDIS_Audit','U') IS NOT NULL
        DROP TABLE dbo.U_EMETLIFDIS_Audit;
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
    INTO dbo.U_EMETLIFDIS_Audit
    FROM dbo.vw_AuditData WITH (NOLOCK) 
    JOIN dbo.U_EMETLIFDIS_AuditFields WITH (NOLOCK) 
        ON audTableName = aTableName
        AND audFieldName = aFieldName
    WHERE audDateTime BETWEEN @StartDate AND @EndDate
    AND audAction <> 'DELETE';

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EMETLIFDIS_Audit ON dbo.U_EMETLIFDIS_Audit (audEEID,audKey2);

    -- Only allow recent terms keyed within the date range of interface.
    DELETE EEList 
    FROM dbo.U_EMETLIFDIS_EEList EEList 
    INNER JOIN dbo.EmpComp
        ON xCoID = EecCoID
        AND xEEID = EecEEID
        AND EecEmplStatus = 'T'
        AND NOT EXISTS (    SELECT 1 FROM dbo.U_EMETLIFDIS_Audit 
                            WHERE xCoID = audKey2 
                            AND xEEID = audEEID 
                            AND audRowNo = 1
                            AND audFieldName = 'EecDateOfTermination' AND audNewValue IS NOT NULL
                       );

    --==========================================
    -- Create Deduction List
    --==========================================
    DECLARE @DedList VARCHAR(MAX)
    SET @DedList = 'ADDH,ADDH2,ADDL,ADDL2,CANH,CANH2,CANH3,CANH4,CANL,CANL2,CANL3,CANL4,CRCH1,CRCH2,CREE1,CREE2,CRFA1,CRFA2,CRSP1,CRSP2,DENH,DENHR,DENL,DENLR,DENM,DENMR,HSPH1,HSPH2,HSPH3,HSPH4,HSPL1,HSPL2,HSPL3,HSPL4,LEGAL,LIFE1,LIFE2,LIFE3,LTD40,LTD50,LTD60,STD,VISH,VISHR,VISL,VISLR,VISM,VISMR';

    IF OBJECT_ID('U_EMETLIFDIS_DedList','U') IS NOT NULL
        DROP TABLE dbo.U_EMETLIFDIS_DedList;
    SELECT DISTINCT
         DedCode = DedDedCode
        ,DedType = DedDedType
    INTO dbo.U_EMETLIFDIS_DedList
    FROM dbo.fn_ListToTable(@DedList)
    JOIN dbo.DedCode WITH (NOLOCK)
        ON DedDedCode = Item;


    --==========================================
    -- BDM Section
    --==========================================
    DELETE FROM dbo.U_dsi_BDM_Configuration WHERE FormatCode = @FormatCode;

    -- Required parameters
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES(@FormatCode,'DedCodes', @DedList);
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'StartDateTime', @StartDate);
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'EndDateTime', @EndDate);
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'TermSelectionOption','AuditDate');

    -- Non-Required parameters
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'BuildConsolidatedTable','Standard');
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'FutureDatedStartDateDays','60');
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'FutureDatedStopDateDays','60');
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'CountDependents','Y');
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'RelationshipsSpouse','SPS');
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'RelationshipsChild','CHL,DCH,STC');

    -- Required OE parameters
    IF @ExportCode LIKE '%PASSIVE'
    BEGIN
        INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'OEType','PASSIVE');
    END;

    IF @ExportCode LIKE '%ACTIVE'
    BEGIN
        INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'OEType','ACTIVE');
    END;


    -- Run BDM Module
    EXEC dbo.dsi_BDM_sp_PopulateDeductionsTable @FormatCode;


    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_EMETLIFDIS_DrvTbl_D10
    ---------------------------------
    IF OBJECT_ID('U_EMETLIFDIS_DrvTbl_D10','U') IS NOT NULL
        DROP TABLE dbo.U_EMETLIFDIS_DrvTbl_D10;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvDepRecID = ''
        ,drvInitialSort = EecEmpNo
        ,drvSubSort = '1901-01-01'
        -- standard fields above and additional driver fields below
        ,drvRecordType = 'E'
        ,drvEmployeeSSN = MAX(eepSSN)
        ,drvMemberSSN = MAX(eepSSN)
        ,drvNameLast = MAX(EepNameLast)
        ,drvNameFirst = MAX(EepNameFirst)
        ,drvNameMiddle = MAX(LEFT(EepNameMiddle,1))
        ,drvDateOfBirth = MAX(EepDateOfBirth)
        ,drvMaritalStatus = 
            MAX(CASE EepMaritalStatus
                    WHEN 'M' THEN 'M'
                    WHEN 'Z' THEN 'U'
                    ELSE 'S'
                END)
        ,drvGender = MAX(EepGender)
        ,drvRelationshipCode = '00'
        ,drvDateOfLastHire = MAX(EecDateOfLastHire)
        ,drvForeingAddressIndicator = MAX(CASE WHEN EepAddressCountry <> 'USA' THEN 'F' ELSE 'D' END)
        ,drvAddressLine2 = MAX(EepAddressLine2)
        ,drvAddressLine1 = MAX(EepAddressLine1)
        ,drvAddressCity = MAX(EepAddressCity)
        ,drvAddressState = MAX(EepAddressState)
        ,drvAddressZipCode = MAX(EepAddressZipCode)
        ,drvTypeCoverage1 = MAX(CASE WHEN den.BdmDedCode IS NOT NULL THEN 'D' END)
        ,drvCoverageStartDate1 = MAX(CASE WHEN den.BdmBenStartDate > den.BdmTVStartDate THEN den.BdmBenStartDate ELSE den.BdmTVStartDate END)
        ,drvCoverageStopDate1 = MAX(den.BdmBenStopDate)
        ,drvGroupNumber1 = MAX(CASE WHEN den.BdmDedCode IS NOT NULL THEN '5920083' END)
        ,drvSubdivision1 = MAX(CASE WHEN den.BdmDedCode IS NOT NULL THEN '0006' END)
        ,drvBranch1 = 
            MAX(CASE WHEN den.BdmDedCode IS NOT NULL THEN 
                    CASE
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0003'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0004'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0009'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0010'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0015'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0016'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H001'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H002'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H007'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H008'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H013'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H014'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L005'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L006'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L011'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L012'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L017'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L018'
                        ELSE 'L018'
                    END
                END)
        ,drvStatusCode1 = MAX(CASE WHEN den.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvMemberCoveredCode1 = 
            MAX(CASE den.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvTypeCoverage4 = MAX(CASE WHEN ltd.BdmDedCode IS NOT NULL THEN 'LT' END)
        ,drvCoverageStartDate4 = MAX(CASE WHEN ltd.BdmBenStartDate > ltd.BdmTVStartDate THEN ltd.BdmBenStartDate ELSE ltd.BdmTVStartDate END)
        ,drvCoverageStopDate4 = MAX(ltd.BdmBenStopDate)
        ,drvGroupNumber4 = MAX(CASE WHEN ltd.BdmDedCode IS NOT NULL THEN '5920083' END)
        ,drvGroupSubdivision4 = MAX(CASE WHEN ltd.BdmDedCode IS NOT NULL THEN '0006' END)
        ,drvBranch4 = 
            MAX(CASE WHEN ltd.BdmDedCode IS NOT NULL THEN 
                    CASE
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0003'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0004'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0009'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0010'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0015'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0016'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H001'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H002'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H007'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H008'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H013'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H014'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L005'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L006'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L011'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L012'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L017'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L018'
                        ELSE 'L018'
                    END
                END)
        ,drvStatusCode4 = MAX(CASE WHEN ltd.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvMemberCoveredCode4 = -- MAX(CASE WHEN ltd.BdmDedCode IS NOT NULL THEN '1' END)
            MAX(CASE ltd.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvMonthlyBenefitAmount4 = MAX(CASE WHEN ltd.BdmDedCode IS NOT NULL AND ltd.BdmDedCode = EedDedCode THEN RIGHT(CONCAT('00000000', REPLACE(CONVERT(VARCHAR, CAST(EedBenAmt AS DECIMAL(15,0))), '.', '')), 8) END)
        ,drvSalaryMode4 = MAX(CASE WHEN ltd.BdmDedCode IS NOT NULL THEN 'A' END )
        ,drvSalary4 = MAX(CASE WHEN ltd.BdmDedCode IS NOT NULL THEN RIGHT(CONCAT('0000000', REPLACE(CONVERT(VARCHAR, CAST(EecAnnSalary AS DECIMAL(15,0))), '.', '')), 7) END)
        ,drvTypeCoverage5 = MAX(CASE WHEN std.BdmDedCode IS NOT NULL THEN 'AS' END)
        ,drvCoverageStartDate5 = MAX(CASE WHEN std.BdmBenStartDate > std.BdmTVStartDate THEN std.BdmBenStartDate ELSE std.BdmTVStartDate END)
        ,drvCoverageStopDate5 = MAX(std.BdmBenStopDate)
        ,drvGroupNumber5 = MAX(CASE WHEN std.BdmDedCode IS NOT NULL THEN '5920083' END)
        ,drvSubdivision5 = MAX(CASE WHEN std.BdmDedCode IS NOT NULL THEN '0006' END)
        ,drvBrnach5 = 
            MAX(CASE WHEN std.BdmDedCode IS NOT NULL THEN 
                    CASE
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0003'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0004'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0009'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0010'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0015'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0016'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H001'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H002'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H007'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H008'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H013'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H014'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L005'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L006'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L011'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L012'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L017'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L018'
                        ELSE 'L018'
                    END
                END)
        ,drvStatus5 = MAX(CASE WHEN std.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvMemberCoveredCode5 = -- MAX(CASE WHEN std.BdmDedCode IS NOT NULL THEN '1' END)
            MAX(CASE std.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvWeeklyBenefitAmount5 = MAX(CASE WHEN std.BdmDedCode IS NOT NULL AND std.BdmDedCode = EedDedCode THEN RIGHT(CONCAT('00000000', REPLACE(CONVERT(VARCHAR, CAST(EedBenAmt AS DECIMAL(15,0))), '.', '')), 8) END)
        ,drvSalaryMode5 = MAX(CASE WHEN std.BdmDedCode IS NOT NULL THEN 'A' END )
        ,drvSalary5 = MAX(CASE WHEN std.BdmDedCode IS NOT NULL THEN RIGHT(CONCAT('0000000', REPLACE(CONVERT(VARCHAR, CAST(EecAnnSalary AS DECIMAL(15,0))), '.', '')), 7) END)
        ,drvTypeCoverage7 = MAX(CASE WHEN life1.BdmDedCode IS NOT NULL THEN 'OP' END)
        ,drvCoverageStartDate7 = MAX(CASE WHEN life1.BdmBenStartDate > life1.BdmTVStartDate THEN life1.BdmBenStartDate ELSE life1.BdmTVStartDate END)
        ,drvCoverageStopDate7 = MAX(life1.BdmBenStopDate)
        ,drvGroupNumber7 = MAX(CASE WHEN life1.BdmDedCOde IS NOT NULL THEN '5920083' END)
        ,drvSubdivision7 = MAX(CASE WHEN life1.BdmDedCOde IS NOT NULL THEN'0006' END)
        ,drvBranch7 = 
            MAX(CASE WHEN life1.BdmDedCode IS NOT NULL THEN
                    CASE
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0003'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0004'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0009'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0010'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0015'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0016'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H001'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H002'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H007'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H008'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H013'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H014'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L005'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L006'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L011'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L012'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L017'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L018'    
                        ELSE 'L018'                      
                    END
                END)
        ,drvStatusCode7 = MAX(CASE WHEN life1.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvMembersCoveredCode7 = -- MAX(CASE WHEN life1.BdmDedCode IS NOT NULL THEN '1' END)
            MAX(CASE life1.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvAnnualBenefitAmount7 = MAX(CASE WHEN life1.BdmDedCode IS NOT NULL AND life1.BdmDedCode = EedDedCode THEN RIGHT(CONCAT('00000000', REPLACE(CONVERT(VARCHAR, CAST(EedBenAmt AS DECIMAL(15,0))), '.', '')), 8) END)
        ,drvSalaryMode7 = MAX(CASE WHEN life1.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvSalary7 = MAX(CASE WHEN life1.BdmDedCode IS NOT NULL THEN RIGHT(CONCAT('0000000', REPLACE(CONVERT(VARCHAR, CAST(EecAnnSalary AS DECIMAL(15,0))), '.', '')), 7) END)
        ,drvTypeCoverageCode8 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN 'LZ' END)
        ,drvCoverageStartDate8 = MAX(CASE WHEN life2.BdmBenStartDate > life2.BdmTVStartDate THEN life2.BdmBenStartDate ELSE life2.BdmTVStartDate END)
        ,drvCoverageStopDate8 = MAX(life2.BdmBenStopDate)
        ,drvGroupNumber8 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN '5920083' END)
        ,drvSubdivision8 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN '0006' END)
        ,drvBranch8 = 
            MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN 
                    CASE
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0003'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0004'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0009'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0010'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0015'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0016'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H001'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H002'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H007'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H008'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H013'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H014'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L005'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L006'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L011'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L012'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L017'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L018'
                        ELSE 'L018'
                    END
                END)
        ,drvStatusCode8 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvMembersCoveredCode8 = -- MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN '3' END)
            MAX(CASE life2.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvAnnualBenefitAmount8 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL AND life2.BdmDedCode = EedDedCode THEN RIGHT(CONCAT('00000000', REPLACE(CONVERT(VARCHAR, CAST(EedBenAmt AS DECIMAL(15,0))), '.', '')), 8) END)
        ,drvEligibilityUtility8 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvTypeCoverage9 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN 'LF' END)
        ,drvCoverageStartDate9 = MAX(CASE WHEN life3.BdmBenStartDate > life3.BdmTVStartDate THEN life3.BdmBenStartDate ELSE life3.BdmTVStartDate END)
        ,drvCoverageStopDate9 = MAX(life3.BdmBenStopDate)
        ,drvGroupNumber9 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN '5920083' END)
        ,drvSubdivision9 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN '0006' END)
        ,drvBranch9 = 
            MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN
                    CASE
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0003'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0004'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0009'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0010'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0015'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0016'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H001'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H002'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H007'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H008'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H013'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H014'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L005'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L006'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L011'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L012'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L017'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L018'
                        ELSE 'L018'
                    END
                END)
        ,drvStatusCode9 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvMembersCoveredCode9 = -- MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN '2' END)
            MAX(CASE life3.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvAnnualBenefitAmount9 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL AND life3.BdmDedCode = EedDedCode THEN RIGHT(CONCAT('00000000', REPLACE(CONVERT(VARCHAR, CAST(EedBenAmt AS DECIMAL(15,0))), '.', '')), 8) END)
        ,drvEligibilityUtility9 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvTypeCoverageCode10 = MAX(CASE WHEN life1.BdmDedCode IS NOT NULL THEN 'OD' END)
        ,drvCoverageStartDate10 = MAX(CASE WHEN life1.BdmBenStartDate > life1.BdmTVStartDate THEN life1.BdmBenStartDate ELSE life1.BdmTVStartDate END)
        ,drvCoverageStopDate10 = MAX(life1.BdmBenStopDate)
        ,drvGroupNumber10 = MAX(CASE WHEN life1.BdmDedCode IS NOT NULL THEN '5920083' END)
        ,drvSubdivision10 = MAX(CASE WHEN life1.BdmDedCode IS NOT NULL THEN '0006' END)
        ,drvBranch10 = 
            MAX(CASE WHEN life1.BdmDedCode IS NOT NULL THEN
                    CASE
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0003'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0004'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0009'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0010'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0015'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0016'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H001'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H002'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H007'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H008'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H013'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H014'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L005'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L006'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L011'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L012'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L017'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L018'
                        ELSE 'L018'
                    END
                END)
        ,drvStatusCode10 = MAX(CASE WHEN life1.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvMembersCoveredCode10 = -- MAX(CASE WHEN life1.BdmDedCode IS NOT NULL THEN '1' END)
            MAX(CASE life1.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvAnnualBenefitAmount10 = MAX(CASE WHEN life1.BdmDedCode IS NOT NULL AND life1.BdmDedCode = EedDedCode THEN RIGHT(CONCAT('00000000', REPLACE(CONVERT(VARCHAR, CAST(EedBenAmt AS DECIMAL(15,0))), '.', '')), 8) END)
        ,drvSalaryMode10 = MAX(CASE WHEN life1.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvSalary10 = MAX(CASE WHEN life1.BdmDedCode IS NOT NULL THEN RIGHT(CONCAT('0000000', REPLACE(CONVERT(VARCHAR, CAST(EecAnnSalary AS DECIMAL(15,0))), '.', '')), 7) END)
        ,drvTypeCoverage11 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN 'AE' END)
        ,drvCoverageStartDate11 = MAX(CASE WHEN life2.BdmBenStartDate > life2.BdmTVStartDate THEN life2.BdmBenStartDate ELSE life2.BdmTVStartDate END)
        ,drvCoverageStopDate11 = MAX(life2.BdmBenStopDate)
        ,drvGroupNumber11 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN '5920083' END)
        ,drvSubdivision11 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN '0006' END)
        ,drvBranch11 = 
            MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN 
                    CASE
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0003'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0004'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0009'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0010'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0015'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0016'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H001'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H002'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H007'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H008'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H013'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H014'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L005'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L006'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L011'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L012'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L017'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L018'
                        ELSE 'L018'
                    END
                END)
        ,drvStatusCode11 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvMembersCoveredCode11 = -- MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN '3' END)
            MAX(CASE life2.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvAnnualBenefitAmount11 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL AND life2.BdmDedCode = EedDedCode THEN RIGHT(CONCAT('00000000', REPLACE(CONVERT(VARCHAR, CAST(EedBenAmt AS DECIMAL(15,0))), '.', '')), 8) END)
        ,drvEligibilityUtility11 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvTypeCoverage12 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN 'AT' END)
        ,drvCoverageStartDate12 = MAX(CASE WHEN life3.BdmBenStartDate > life3.BdmTVStartDate THEN life3.BdmBenStartDate ELSE life3.BdmTVStartDate END)
        ,drvCoverageStopDate12 = MAX(life3.BdmBenStopDate)
        ,drvGroupNumber12 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN '5920083' END)
        ,drvSubdivision12 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN '0006' END)
        ,drvBranch12 = 
            MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN
                    CASE 
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0003'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0004'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0009'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0010'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0015'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0016'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H001'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H002'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H007'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H008'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H013'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H014'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L005'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L006'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L011'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L012'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L017'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L018'
                        ELSE 'L018'
                    END
                END)
        ,drvStatusCode12 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvMembersCoveredCode12 = -- MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN '2' END)
            MAX(CASE life3.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvAnnualBenefitAmount12 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL AND life3.BdmDedCode = EedDedCode THEN RIGHT(CONCAT('00000000', REPLACE(CONVERT(VARCHAR, CAST(EedBenAmt AS DECIMAL(15,0))), '.', '')), 8) END)
        ,drvTypeCoverage17 = MAX(CASE WHEN vis.BdmDedCode IS NOT NULL THEN 'VV' END)
        ,drvCoverageStartDate17 = MAX(CASE WHEN vis.BdmBenStartDate > vis.BdmTVStartDate THEN vis.BdmBenStartDate ELSE vis.BdmTVStartDate END)
        ,drvCoverageStopDate17 = MAX(vis.BdmBenStopDate)
        ,drvGroupNumber17 = MAX(CASE WHEN vis.BdmDedCode IS NOT NULL THEN '5920083' END)
        ,drvSubdivision17 = MAX(CASE WHEN vis.BdmDedCode IS NOT NULL THEN '0006' END)
        ,drvBranch17 = 
            MAX(CASE WHEN vis.BdmDedCode IS NOT NULL THEN 
                    CASE
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0003'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0004'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0009'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0010'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0015'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0016'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H001'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H002'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H007'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H008'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H013'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H014'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L005'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L006'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L011'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L012'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L017'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L018'
                        ELSE 'L018'
                    END
                END)
        ,drvStatusCode17 = MAX(CASE WHEN vis.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvMembersCoveredCode17 = 
            MAX(CASE vis.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvEmployeeStatusCode = 
            MAX(CASE
                    WHEN EecEmplStatus = 'T' AND EecTermReason = '203' THEN 'D'
                    WHEN EecEmplStatus = 'T' AND EecTermReason = '202' THEN 'R'
                    WHEN EecEmplStatus = 'T' THEN 'T'
                    ELSE CASE WHEN EecEmplStatus <> 'T' THEN 'A' END
                END)
        ,drvStatusCodeEffectiveDate = MAX(CASE WHEN EecEmplStatus = 'T' THEN EecDateOfTermination ELSE EecDateOfLastHire END)
        ,drvCoverageCode18 = MAX(CASE WHEN legal.BdmDedCode IS NOT NULL THEN 'LE' END)
        ,drvCoverageStartDate18 = MAX(CASE WHEN legal.BdmBenStartDate > legal.BdmTVStartDate THEN legal.BdmBenStartDate ELSE legal.BdmTVStartDate END)
        ,drvCoverageStopDate18 = MAX(legal.BdmBenStopDate)
        ,drvGroupNumber18 = MAX(CASE WHEN legal.BdmDedCode IS NOT NULL THEN '9158116' END)
        ,drvSubCode18 = MAX(CASE WHEN legal.BdmDedCode IS NOT NULL THEN '0002' END)
        ,drvBranch18 = MAX(CASE WHEN legal.BdmDedCode IS NOT NULL THEN '0001' END)
        ,drvStatusCode18 = MAX(CASE WHEN legal.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvMemebersCoveredCode18 = -- MAX(CASE WHEN legal.BdmDedCode IS NOT NULL THEN '1' END)
            MAX(CASE legal.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvEnrollmentStatus18 = MAX(CASE WHEN legal.BdmDedCode IS NOT NULL THEN 'P' ELSE 'E' END)
        ,drvCoverageCode19 = MAX(CASE WHEN ltc1.BdmDedCode IS NOT NULL THEN 'GE' END)
        ,drvCoverageStartDate19 = MAX(CASE WHEN ltc1.BdmBenStartDate > ltc1.BdmTVStartDate THEN ltc1.BdmBenStartDate ELSE ltc1.BdmTVStartDate END)
        ,drvCoverageStopDate19 = MAX(ltc1.BdmBenStopDate)
        ,drvGroupNumber19 = MAX(CASE WHEN ltc1.BdmDedCode IS NOT NULL THEN '0221959' END)
        ,drvSubcode19 = MAX(CASE WHEN ltc1.BdmDedCode IS NOT NULL THEN '0001' END)
        ,drvBranch19 = MAX(CASE WHEN ltc1.BdmDedCode IS NOT NULL THEN '0001' END)
        ,drvMemebersCoveredCode19 = -- MAX(CASE WHEN ltc1.BdmDedCode IS NOT NULL THEN '1' END)
            MAX(CASE ltc1.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvEnrollmentStatus19 = MAX(CASE WHEN ltc1.BdmDedCode IS NOT NULL THEN 'P' ELSE 'E' END)
        ,drvBenefitAmount19 = 
            MAX(CASE
                    WHEN ltc1.BdmDedCode = EedDedCode AND DedLongDesc LIKE '%High%' THEN '00020000'
                    WHEN ltc1.BdmDedCode = EedDedCode AND DedLongDesc LIKE '%Low%' THEN '00010000' 
                END)
        ,drvVoluntaryCancellationInd19 = MAX(CASE WHEN ltc1.BdmBenStopDate IS NOT NULL THEN 'CE' END)
        ,drvCoverageCode20 = MAX(CASE WHEN ltc2.BdmDedCode IS NOT NULL THEN 'GD' END)
        ,drvCoverageStartDate20 = MAX(CASE WHEN ltc2.BdmBenStartDate > ltc2.BdmTVStartDate THEN ltc2.BdmBenStartDate ELSE ltc2.BdmTVStartDate END)
        ,drvCoverageStopDate20 = MAX(ltc2.BdmBenStopDate)
        ,drvGroupNumber20 = MAX(CASE WHEN ltc2.BdmDedCode IS NOT NULL THEN '0221959' END)
        ,drvSubcode20 = MAX(CASE WHEN ltc2.BdmDedCode IS NOT NULL THEN '0001' END)
        ,drvBranch20 = MAX(CASE WHEN ltc2.BdmDedCode IS NOT NULL THEN '0001' END)
        ,drvMembersCoveredCode20 = -- MAX(CASE WHEN ltc2.BdmDedCode IS NOT NULL THEN '4' END)
            MAX(CASE ltc2.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvEnrollmentStatus20 = MAX(CASE WHEN ltc2.BdmDedCode IS NOT NULL THEN 'P' ELSE 'E' END)
        ,drvBenefitAmount20 = 
            MAX(CASE
                    WHEN ltc2.BdmDedCode = EedDedCode AND DedLongDesc LIKE '%High%' THEN '00020000'
                    WHEN ltc2.BdmDedCode = EedDedCode AND DedLongDesc LIKE '%Low%' THEN '00010000' 
                END)
        ,drvVoluntaryCancellationInd20 = MAX(CASE WHEN ltc2.BdmBenStopDate IS NOT NULL THEN 'CE' END)
        ,drvCoverageCode23 = MAX(CASE WHEN add1.BdmDedCode IS NOT NULL THEN 'AH' END)
        ,drvCoverageStartDate23 = MAX(CASE WHEN add1.BdmBenStartDate > add1.BdmTVStartDate THEN add1.BdmBenStartDate ELSE add1.BdmTVStartDate END)
        ,drvCoverageStopDate23 = MAX(add1.BdmBenStopDate)
        ,drvGroupNumber23 = MAX(CASE WHEN add1.BdmDedCode IS NOT NULL THEN '0221961' END)
        ,drvSubcode23 = MAX(CASE WHEN add1.BdmDedCode IS NOT NULL THEN '0001' END)
        ,drvBranch23 = 
            MAX(CASE 
                    WHEN add1.BdmDedCode = EedDedCode AND DedLongDesc LIKE '%High%' THEN '0001'
                    WHEN add1.BdmDedCode = EedDedCode AND DedLongDesc LIKE '%Low%' THEN '0003'
                END)
        ,drvMembersCoveredCode23 = -- MAX(CASE WHEN add1.BdmDedCode IS NOT NULL THEN '1' END)   
            MAX(CASE add1.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1' 
                END)                        
        ,drvEnrollmentStatus23 = MAX(CASE WHEN add1.BdmDedCode IS NOT NULL THEN 'P' ELSE 'E' END)     
        ,drvVoluntaryCancellationInd23 = MAX(CASE WHEN add1.BdmBenStopDate IS NOT NULL THEN 'CE' END)
        ,drvCoverageCode24 = MAX(CASE WHEN ot2.BdmDedCode IS NOT NULL THEN 'HH' END)
        ,drvCoverageStartDate24 = MAX(CASE WHEN ot2.BdmBenStartDate > ot2.BdmTVStartDate THEN ot2.BdmBenStartDate ELSE ot2.BdmTVStartDate END)
        ,drvCoverageStopDate24 = MAX(ot2.BdmBenStopDate)
        ,drvGroupNumber24 = MAX(CASE WHEN ot2.BdmDedCode IS NOT NULL THEN '0221962' END)
        ,drvSubCode24 = MAX(CASE WHEN ot2.BdmDedCode IS NOT NULL THEN '0001' END)
        ,drvBranch24 = 
            MAX(CASE 
                    WHEN ot2.BdmDedCode = EedDedCode AND DedLongDesc LIKE '%High%' THEN '0001'
                    WHEN ot2.BdmDedCode = EedDedCode AND DedLongDesc LIKE '%Low%' THEN '0003'
                END)
        ,drvMembersCoveredCode24 = -- MAX(CASE WHEN ot2.BdmDedCode IS NOT NULL THEN '1' END)     
            MAX(CASE ot2.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvEnrollmentStatusInd24 = MAX(CASE WHEN ot2.BdmDedCode IS NOT NULL THEN 'P' ELSE 'E' END)
        ,drvVoluntaryCancellationInd24 = MAX(CASE WHEN ot2.BdmBenStopDate IS NOT NULL THEN 'CE' END)
        ,drvCoverageCode28 = MAX(CASE WHEN drg.BdmDedCode IS NOT NULL THEN 'RE' END)    
        ,drvCoverageStartDate28 = MAX(CASE WHEN drg.BdmBenStartDate > drg.BdmTVStartDate THEN drg.BdmBenStartDate ELSE drg.BdmTVStartDate END)
        ,drvCoverageStopDate28 = MAX(drg.BdmBenStopDate)
        ,drvGroupNumber28 = MAX(CASE WHEN drg.BdmDedCode IS NOT NULL THEN '0221960' END)
        ,drvSubCode28 = MAX(CASE WHEN drg.BdmDedCode IS NOT NULL THEN '0001' END)
        ,drvBranch28 = MAX(CASE WHEN drg.BdmDedCode IS NOT NULL THEN '0001' END)
        ,drvMembersCoveredCode28 = -- MAX(CASE WHEN drg.BdmDedCode IS NOT NULL THEN '1' END)
            MAX(CASE drg.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvEnrollmentStatus28 = MAX(CASE WHEN drg.BdmDedCode IS NOT NULL THEN 'P' ELSE 'E' END)
        ,drvBenefitAmount28 = 
            MAX(CASE 
                    WHEN drg.BdmDedCode = EedDedCode AND DedLongDesc LIKE '%High%' THEN '00030000'
                    WHEN drg.BdmDedCode = EedDedCode AND DedLongDesc LIKE '%Low%' THEN '00015000' 
                END)
        ,drvVoluntaryCancellationInd28 = MAX(CASE WHEN drg.BdmBenStopDate IS NOT NULL THEN 'CE' END)
        ,drvCoverageCode29 = MAX(CASE WHEN drg2.BdmDedCode IS NOT NULL THEN 'RD' END)
        ,drvCoverageStartDate29 = MAX(CASE WHEN drg2.BdmBenStartDate > drg2.BdmTVStartDate THEN drg2.BdmBenStartDate ELSE drg2.BdmTVStartDate END)
        ,drvCoverageStopDate29 = MAX(drg2.BdmBenStopDate)
        ,drvGroupNumber29 = MAX(CASE WHEN drg2.BdmDedCode IS NOT NULL THEN '0221960' END)
        ,drvSubCode29 = MAX(CASE WHEN drg2.BdmDedCode IS NOT NULL THEN '0001' END)
        ,drvBranch29 = MAX(CASE WHEN drg2.BdmDedCode IS NOT NULL THEN '0001' END)
        ,drvMemberCoveredCode29 = -- MAX(CASE WHEN drg2.BdmDedCode IS NOT NULL THEN '1' END)
            MAX(CASE drg2.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvEnrollementStatus29 = MAX(CASE WHEN drg2.BdmDedCode IS NOT NULL THEN 'P' ELSE 'E' END)
        ,drvBenefitAmount29 = 
            MAX(CASE 
                    WHEN drg2.BdmDedCode = EedDedCode AND DedLongDesc LIKE '%High%' THEN '00030000' 
                    WHEN drg2.BdmDedCode = EedDedCode AND DedLongDesc LIKE '%Low%' THEN '00015000' 
                END)
        ,drvVoluntaryCancellationInd29 = MAX(CASE WHEN drg2.BdmBenStopDate IS NOT NULL THEN 'CE' END)
    INTO dbo.U_EMETLIFDIS_DrvTbl_D10
    FROM dbo.U_EMETLIFDIS_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    INNER JOIN dbo.U_dsi_BDM_EmpDeductions WITH (NOLOCK)
        ON EedEEID = xEEID
        AND EedCoID = xCoID
        AND EedFormatCode = @FormatCode
        AND EedValidForExport = 'Y'
    INNER JOIN dbo.U_dsi_BDM_EMETLIFDIS main WITH (NOLOCK)
        ON main.BdmEEID = xEEID
        AND main.BdmCoID = xCoID
        AND main.BdmRecType = 'EMP'
    INNER JOIN dbo.BenProg WITH (NOLOCK)
        ON CbpDedCode = main.BdmDedCode
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS den WITH (NOLOCK)
        ON den.BdmEEID = xEEID
        AND den.BdmCoID = xCoID
        AND den.BdmRecType = 'EMP'
        AND den.BdmDedType = 'DEN'
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS vis WITH (NOLOCK)
        ON vis.BdmEEID = xEEID
        AND vis.BdmCoID = xCoID
        AND vis.BdmRecType = 'EMP'
        AND vis.BdmDedType = 'VIS'
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS ltd WITH (NOLOCK)
        ON ltd.BdmEEID = xEEID
        AND ltd.BdmCoID = xCoID
        AND ltd.BdmRecType = 'EMP'
        AND ltd.BdmDedType = 'LTD'
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS std WITH (NOLOCK)
        ON std.BdmEEID = xEEID
        AND std.BdmCoID = xCoID
        AND std.BdmRecType = 'EMP'
        AND std.BdmDedType = 'STD'
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS life1 WITH (NOLOCK)
        ON life1.BdmEEID = xEEID
        AND life1.BdmCoID = xCoID
        AND life1.BdmRecType = 'EMP'
        AND life1.BdmDedCode = 'LIFE1'
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS life2 WITH (NOLOCK)
        ON life2.BdmEEID = xEEID
        AND life2.BdmCoID = xCoID
        AND life2.BdmRecType = 'EMP'
        AND life2.BdmDedCode = 'LIFE2'
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS life3 WITH (NOLOCK)
        ON life3.BdmEEID = xEEID
        AND life3.BdmCoID = xCoID
        AND life3.BdmRecType = 'EMP'
        AND life3.BdmDedCode = 'LIFE3'
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS legal WITH (NOLOCK)
        ON legal.BdmEEID = xEEID
        AND legal.BdmCoID = xCoID
        AND legal.BdmRecType = 'EMP'
        AND legal.BdmDedCode = 'LEGAL'
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS ltc1 WITH (NOLOCK)
        ON ltc1.BdmEEID = xEEID
        AND ltc1.BdmCoID = xCoID
        AND ltc1.BdmRecType = 'EMP'
        AND ltc1.BdmDedType = 'LTC'
        AND ltc1.BdmDedCode NOT IN ('CREE3', 'CRSP3')
    LEFT JOIN (    SELECT DISTINCT
                       BdmEEID
                       ,BdmCoID
                       ,BdmDedCode = MAX(BdmDedCode)
                       ,BdmBenOption = MAX(BdmBenOption)
                       ,BdmBenStartDate = MAX(BdmBenStartDate)
                       ,BdmTVStartDate = MAX(BdmTVStartDate)
                       ,BdmBenStopDate = MAX(BdmBenStopDate)
                    FROM dbo.U_dsi_BDM_EMETLIFDIS WITH (NOLOCK)
                    WHERE BdmDedType IN ('LTC', 'DRG')
                    AND BdmRecType = 'DEP'
                    AND BdmDedCode NOT IN ('CREE3', 'CRSP3')
                    GROUP BY BdmEEID, BdmCoID
              ) ltc2
        ON ltc2.BdmEEID = xEEID
        AND ltc2.BdmCoID = xCoID
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS add1 WITH (NOLOCK)
        ON add1.BdmEEID = xEEID
        AND add1.BdmCoID = xCoID
        AND add1.BdmRecType = 'EMP'
        AND add1.BdmDedType = 'ADD'
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS ot2 WITH (NOLOCK)
        ON ot2.BdmEEID = xEEID
        AND ot2.BdmCoID = xCoID
        AND ot2.BdmRecType = 'EMP'
        AND ot2.BdmDedType = 'OT2'
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS drg WITH (NOLOCK)
        ON drg.BdmEEID = xEEID
        AND drg.BdmCoID = xCoID
        AND drg.BdmRecType = 'EMP'
        AND drg.BdmDedType = 'DRG'
    LEFT JOIN (    SELECT DISTINCT
                       BdmEEID
                       ,BdmCoID
                       ,BdmDedCode = MAX(BdmDedCode)
                       ,BdmBenOption = MAX(BdmBenOption)
                       ,BdmBenStartDate = MAX(BdmBenStartDate)
                       ,BdmTVStartDate = MAX(BdmTVStartDate)
                       ,BdmBenStopDate = MAX(BdmBenStopDate)
                    FROM dbo.U_dsi_BDM_EMETLIFDIS WITH (NOLOCK)
                    WHERE BdmDedType = 'DRG'
                    AND BdmRecType = 'DEP'
                    GROUP BY BdmEEID, BdmCoID
              ) drg2
        ON drg2.BdmEEID = xEEID
        AND drg2.BdmCoID = xCoID
    GROUP BY xEEID, xCoID, EecEmpNo
    
    UNION

    -- Dependents data
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvDepRecID = main.BdmDepRecID
        ,drvInitialSort = EecEmpNo
        ,drvSubSort = MAX(ConDateOfBirth)
        -- standard fields above and additional driver fields below
        ,drvRecordType = 'D'
        ,drvEmployeeSSN = MAX(eepSSN)
        ,drvMemberSSN = MAX(ConSSN)
        ,drvNameLast = MAX(ConNameLast)
        ,drvNameFirst = MAX(ConNameFirst)
        ,drvNameMiddle = MAX(LEFT(ConNameMiddle,1))
        ,drvDateOfBirth = MAX(ConDateOfBirth)
        ,drvMaritalStatus = 'S'
        ,drvGender = MAX(ConGender)
        ,drvRelationshipCode = MAX(CASE WHEN main.BdmRelationship IN ('CHL', 'DCH', 'STC') THEN '02' ELSE '01' END)
        ,drvDateOfLastHire = NULL
        ,drvForeingAddressIndicator = MAX(CASE WHEN EepAddressCountry <> 'USA' THEN 'F' ELSE 'D' END)
        ,drvAddressLine2 = MAX(ConAddressLine2)
        ,drvAddressLine1 = MAX(ConAddressLine1)
        ,drvAddressCity = MAX(ConAddressCity)
        ,drvAddressState = MAX(ConAddressState)
        ,drvAddressZipCode = MAX(ConAddressZipCode)
        ,drvTypeCoverage1 = MAX(CASE WHEN den.BdmDedCode IS NOT NULL THEN 'D' END)
        ,drvCoverageStartDate1 = MAX(CASE WHEN den.BdmBenStartDate > den.BdmTVStartDate THEN den.BdmBenStartDate ELSE den.BdmTVStartDate END)
        ,drvCoverageStopDate1 = MAX(den.BdmBenStopDate)
        ,drvGroupNumber1 = MAX(CASE WHEN den.BdmDedCode IS NOT NULL THEN '5920083' END)
        ,drvSubdivision1 = MAX(CASE WHEN den.BdmDedCode IS NOT NULL THEN '0006' END)
        ,drvBranch1 = 
            MAX(CASE WHEN den.BdmDedCode IS NOT NULL THEN 
                    CASE
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0003'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0004'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0009'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0010'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0015'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0016'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H001'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H002'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H007'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H008'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H013'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H014'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L005'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L006'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L011'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L012'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L017'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L018'
                        ELSE 'L018'
                    END
                END)
        ,drvStatusCode1 = MAX(CASE WHEN den.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvMemberCoveredCode1 = 
            MAX(CASE den.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvTypeCoverage4 = NULL
        ,drvCoverageStartDate4 = NULL
        ,drvCoverageStopDate4 = NULL
        ,drvGroupNumber4 = NULL
        ,drvGroupSubdivision4 = NULL
        ,drvBranch4 = NULL
        ,drvStatusCode4 = NULL
        ,drvMemberCoveredCode4 = NULL
        ,drvMonthlyBenefitAmount4 = NULL
        ,drvSalaryMode4 = NULL
        ,drvSalary4 = NULL
        ,drvTypeCoverage5 = NULL
        ,drvCoverageStartDate5 = NULL
        ,drvCoverageStopDate5 = NULL
        ,drvGroupNumber5 = NULL
        ,drvSubdivision5 = NULL
        ,drvBrnach5 = NULL
        ,drvStatus5 = NULL
        ,drvMemberCoveredCode5 = NULL
        ,drvWeeklyBenefitAmount5 = NULL
        ,drvSalaryMode5 = NULL
        ,drvSalary5 = NULL
        ,drvTypeCoverage7 = NULL
        ,drvCoverageStartDate7 = NULL
        ,drvCoverageStopDate7 = NULL
        ,drvGroupNumber7 = NULL
        ,drvSubdivision7 = NULL
        ,drvBranch7 = NULL
        ,drvStatusCode7 = NULL
        ,drvMembersCoveredCode7 = NULL
        ,drvAnnualBenefitAmount7 = NULL
        ,drvSalaryMode7 = NULL
        ,drvSalary7 = NULL
        ,drvTypeCoverageCode8 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN 'LZ' END)
        ,drvCoverageStartDate8 = MAX(CASE WHEN life2.BdmBenStartDate > life2.BdmTVStartDate THEN life2.BdmBenStartDate ELSE life2.BdmTVStartDate END)
        ,drvCoverageStopDate8 = MAX(life2.BdmBenStopDate)
        ,drvGroupNumber8 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN '5920083' END)
        ,drvSubdivision8 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN '0006' END)
        ,drvBranch8 = 
            MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN 
                    CASE
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0003'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0004'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0009'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0010'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0015'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0016'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H001'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H002'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H007'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H008'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H013'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H014'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L005'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L006'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L011'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L012'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L017'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L018'
                        ELSE 'L018'
                    END
                END)
        ,drvStatusCode8 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvMembersCoveredCode8 = -- MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN '3' END)
            MAX(CASE life2.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvAnnualBenefitAmount8 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL AND life2.BdmDedCode = EedDedCode THEN RIGHT(CONCAT('00000000', REPLACE(CONVERT(VARCHAR, CAST(EedBenAmt AS DECIMAL(15,0))), '.', '')), 8) END)
        ,drvEligibilityUtility8 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvTypeCoverage9 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN 'LF' END)
        ,drvCoverageStartDate9 = MAX(CASE WHEN life3.BdmBenStartDate > life3.BdmTVStartDate THEN life3.BdmBenStartDate ELSE life3.BdmTVStartDate END)
        ,drvCoverageStopDate9 = MAX(life3.BdmBenStopDate)
        ,drvGroupNumber9 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN '5920083' END)
        ,drvSubdivision9 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN '0006' END)
        ,drvBranch9 = 
            MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN
                    CASE
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0003'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0004'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0009'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0010'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0015'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0016'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H001'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H002'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H007'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H008'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H013'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H014'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L005'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L006'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L011'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L012'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L017'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L018'
                        ELSE 'L018'
                    END
                END)
        ,drvStatusCode9 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvMembersCoveredCode9 = -- MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN '2' END)
            MAX(CASE life3.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' ELSE '1'
                END)
        ,drvAnnualBenefitAmount9 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL AND life3.BdmDedCode = EedDedCode THEN RIGHT(CONCAT('00000000', REPLACE(CONVERT(VARCHAR, CAST(EedBenAmt AS DECIMAL(15,0))), '.', '')), 8) END)
        ,drvEligibilityUtility9 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvTypeCoverageCode10 = NULL
        ,drvCoverageStartDate10 = NULL
        ,drvCoverageStopDate10 = NULL
        ,drvGroupNumber10 = NULL
        ,drvSubdivision10 = NULL
        ,drvBranch10 = NULL
        ,drvStatusCode10 = NULL
        ,drvMembersCoveredCode10 = NULL
        ,drvAnnualBenefitAmount10 = NULL
        ,drvSalaryMode10 = NULL
        ,drvSalary10 = NULL
        ,drvTypeCoverage11 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN 'AE' END)
        ,drvCoverageStartDate11 = MAX(CASE WHEN life2.BdmBenStartDate > life2.BdmTVStartDate THEN life2.BdmBenStartDate ELSE life2.BdmTVStartDate END)
        ,drvCoverageStopDate11 = MAX(life2.BdmBenStopDate)
        ,drvGroupNumber11 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN '5920083' END)
        ,drvSubdivision11 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN '0006' END)
        ,drvBranch11 = 
            MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN 
                    CASE
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0003'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0004'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0009'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0010'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0015'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0016'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H001'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H002'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H007'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H008'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H013'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H014'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L005'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L006'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L011'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L012'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L017'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L018'
                        ELSE 'L018'
                    END
                END)
        ,drvStatusCode11 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvMembersCoveredCode11 = -- MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN '3' END)
            MAX(CASE life2.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvAnnualBenefitAmount11 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL AND life2.BdmDedCode = EedDedCode THEN RIGHT(CONCAT('00000000', REPLACE(CONVERT(VARCHAR, CAST(EedBenAmt AS DECIMAL(15,0))), '.', '')), 8) END)
        ,drvEligibilityUtility11 = MAX(CASE WHEN life2.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvTypeCoverage12 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN 'AT' END)
        ,drvCoverageStartDate12 = MAX(CASE WHEN life3.BdmBenStartDate > life3.BdmTVStartDate THEN life3.BdmBenStartDate ELSE life3.BdmTVStartDate END)
        ,drvCoverageStopDate12 = MAX(life3.BdmBenStopDate)
        ,drvGroupNumber12 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN '5920083' END)
        ,drvSubdivision12 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN '0006' END)
        ,drvBranch12 = 
            MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN
                    CASE 
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0003'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0004'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0009'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0010'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0015'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0016'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H001'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H002'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H007'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H008'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H013'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H014'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L005'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L006'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L011'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L012'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L017'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L018'
                        ELSE 'L018'
                    END
                END)
        ,drvStatusCode12 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvMembersCoveredCode12 = -- MAX(CASE WHEN life3.BdmDedCode IS NOT NULL THEN '2' END)
            MAX(CASE life3.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvAnnualBenefitAmount12 = MAX(CASE WHEN life3.BdmDedCode IS NOT NULL AND life3.BdmDedCode = EedDedCode AND (EedBenAmt <> 0.00 OR NULLIF(EedBenAmt, '') IS NOT NULL) THEN RIGHT(CONCAT('00000000', REPLACE(CONVERT(VARCHAR, CAST(EedBenAmt AS DECIMAL(15,0))), '.', '')), 8) END)
        ,drvTypeCoverage17 = MAX(CASE WHEN vis.BdmDedCode IS NOT NULL THEN 'VV' END)
        ,drvCoverageStartDate17 = MAX(CASE WHEN vis.BdmBenStartDate > vis.BdmTVStartDate THEN vis.BdmBenStartDate ELSE vis.BdmTVStartDate END)
        ,drvCoverageStopDate17 = MAX(vis.BdmBenStopDate)
        ,drvGroupNumber17 = MAX(CASE WHEN vis.BdmDedCode IS NOT NULL THEN '5920083' END)
        ,drvSubdivision17 = MAX(CASE WHEN vis.BdmDedCode IS NOT NULL THEN '0006' END)
        ,drvBranch17 = 
            MAX(CASE WHEN vis.BdmDedCode IS NOT NULL THEN 
                    CASE
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0003'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0004'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0009'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0010'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN '0015'
                        WHEN den.BdmDedCode IN ('DENM', 'DENMR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN '0016'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H001'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H002'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H007'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H008'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'H013'
                        WHEN den.BdmDedCode IN ('DENH', 'DENHR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'H014'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L005'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD60' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L006'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L011'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD50' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L012'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISH', 'VISHR') THEN 'L017'
                        WHEN den.BdmDedCode IN ('DENL', 'DENLR') AND ltd.BdmDedCode = 'LTD40' AND vis.BdmDedCode IN ('VISL', 'VISLR') THEN 'L018'
                        ELSE 'L018'
                    END
                END)
        ,drvStatusCode17 = MAX(CASE WHEN vis.BdmDedCode IS NOT NULL THEN 'A' END)
        ,drvMembersCoveredCode17 = 
            MAX(CASE vis.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)
        ,drvEmployeeStatusCode = NULL
        ,drvStatusCodeEffectiveDate = NULL
        ,drvCoverageCode18 = NULL
        ,drvCoverageStartDate18 = NULL
        ,drvCoverageStopDate18 = NULL
        ,drvGroupNumber18 = NULL
        ,drvSubCode18 = NULL
        ,drvBranch18 = NULL
        ,drvStatusCode18 = NULL
        ,drvMemebersCoveredCode18 = NULL
        ,drvEnrollmentStatus18 = NULL
        ,drvCoverageCode19 = NULL
        ,drvCoverageStartDate19 = NULL
        ,drvCoverageStopDate19 = NULL
        ,drvGroupNumber19 = NULL
        ,drvSubcode19 = NULL
        ,drvBranch19 = NULL
        ,drvMemebersCoveredCode19 = NULL
        ,drvEnrollmentStatus19 = NULL
        ,drvBenefitAmount19 = NULL
        ,drvVoluntaryCancellationInd19 = NULL
        ,drvCoverageCode20 = NULL
        ,drvCoverageStartDate20 = NULL
        ,drvCoverageStopDate20 = NULL
        ,drvGroupNumber20 = NULL
        ,drvSubcode20 = NULL
        ,drvBranch20 = NULL
        ,drvMembersCoveredCode20 = NULL
        ,drvEnrollmentStatus20 = NULL
        ,drvBenefitAmount20 = NULL
        ,drvVoluntaryCancellationInd20 = NULL
        ,drvCoverageCode23 = MAX(CASE WHEN add1.BdmDedCode IS NOT NULL THEN 'AH' END)
        ,drvCoverageStartDate23 = MAX(CASE WHEN add1.BdmBenStartDate > add1.BdmTVStartDate THEN add1.BdmBenStartDate ELSE add1.BdmTVStartDate END)
        ,drvCoverageStopDate23 = MAX(add1.BdmBenStopDate)
        ,drvGroupNumber23 = MAX(CASE WHEN add1.BdmDedCode IS NOT NULL THEN '0221961' END)
        ,drvSubcode23 = MAX(CASE WHEN add1.BdmDedCode IS NOT NULL THEN '0001' END)
        ,drvBranch23 = 
            MAX(CASE 
                    WHEN add1.BdmDedCode = EedDedCode AND DedLongDesc LIKE '%High%' THEN '0001'
                    WHEN add1.BdmDedCode = EedDedCode AND DedLongDesc LIKE '%Low%' THEN '0003'
                END)
        ,drvMembersCoveredCode23 = -- MAX(CASE WHEN add1.BdmDedCode IS NOT NULL THEN '1' END)  
            MAX(CASE add1.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' ELSE '1'
                END)                         
        ,drvEnrollmentStatus23 = MAX(CASE WHEN add1.BdmDedCode IS NOT NULL THEN 'P' ELSE 'E' END)     
        ,drvVoluntaryCancellationInd23 = MAX(CASE WHEN add1.BdmBenStopDate IS NOT NULL THEN 'CE' END)
        ,drvCoverageCode24 = MAX(CASE WHEN ot2.BdmDedCode IS NOT NULL THEN 'HH' END)
        ,drvCoverageStartDate24 = MAX(CASE WHEN ot2.BdmBenStartDate > ot2.BdmTVStartDate THEN ot2.BdmBenStartDate ELSE ot2.BdmTVStartDate END)
        ,drvCoverageStopDate24 = MAX(ot2.BdmBenStopDate)
        ,drvGroupNumber24 = MAX(CASE WHEN ot2.BdmDedCode IS NOT NULL THEN '0221962' END)
        ,drvSubCode24 = MAX(CASE WHEN ot2.BdmDedCode IS NOT NULL THEN '0001' END)
        ,drvBranch24 = 
            MAX(CASE 
                    WHEN ot2.BdmDedCode = EedDedCode AND DedLongDesc LIKE '%High%' THEN '0001'
                    WHEN ot2.BdmDedCode = EedDedCode AND DedLongDesc LIKE '%Low%' THEN '0003'
                END)
        ,drvMembersCoveredCode24 = -- MAX(CASE WHEN ot2.BdmDedCode IS NOT NULL THEN '1' END) 
            MAX(CASE ot2.BdmBenOption
                    WHEN 'EE' THEN '1'
                    WHEN 'EESP' THEN '3'
                    WHEN 'EECH' THEN '2'
                    WHEN 'FAM' THEN '4' 
					ELSE '1'
                END)    
        ,drvEnrollmentStatusInd24 = MAX(CASE WHEN ot2.BdmDedCode IS NOT NULL THEN 'P' ELSE 'E' END)
        ,drvVoluntaryCancellationInd24 = MAX(CASE WHEN ot2.BdmBenStopDate IS NOT NULL THEN 'CE' END)
        ,drvCoverageCode28 = NULL    
        ,drvCoverageStartDate28 = NULL
        ,drvCoverageStopDate28 = NULL
        ,drvGroupNumber28 = NULL
        ,drvSubCode28 = NULL
        ,drvBranch28 = NULL
        ,drvMembersCoveredCode28 = NULL
        ,drvEnrollmentStatus28 = NULL
        ,drvBenefitAmount28 = NULL
        ,drvVoluntaryCancellationInd28 = NULL
        ,drvCoverageCode29 = NULL
        ,drvCoverageStartDate29 = NULL
        ,drvCoverageStopDate29 = NULL
        ,drvGroupNumber29 = NULL
        ,drvSubCode29 = NULL
        ,drvBranch29 = NULL
        ,drvMemberCoveredCode29 = NULL
        ,drvEnrollementStatus29 = NULL
        ,drvBenefitAmount29 = NULL
        ,drvVoluntaryCancellationInd29 = NULL
    FROM dbo.U_EMETLIFDIS_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    INNER JOIN dbo.U_dsi_BDM_EmpDeductions WITH (NOLOCK)
        ON EedEEID = xEEID
        AND EedCoID = xCoID
        AND EedFormatCode = @FormatCode
        AND EedValidForExport = 'Y'
    INNER JOIN dbo.U_dsi_BDM_EMETLIFDIS main WITH (NOLOCK)
        ON main.BdmEEID = xEEID
        AND main.BdmCoID = xCoID
        AND main.BdmRecType = 'DEP'
    INNER JOIN dbo.Contacts WITH (NOLOCK)
        ON ConSystemID = main.BdmDepRecID
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS den WITH (NOLOCK)
        ON den.BdmDepRecID = main.BdmDepRecID
        AND den.BdmDedType = 'DEN'
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS vis WITH (NOLOCK)
        ON vis.BdmDepRecID = main.BdmDepRecID
        AND vis.BdmDedType = 'VIS'
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS ltd WITH (NOLOCK)
        ON ltd.BdmDepRecID = main.BdmDepRecID
        AND ltd.BdmDedType = 'LTD'
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS std WITH (NOLOCK)
        ON std.BdmDepRecID = main.BdmDepRecID
        AND std.BdmDedType = 'STD'
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS life2 WITH (NOLOCK)
        ON life2.BdmDepRecID = main.BdmDepRecID
        AND life2.BdmDedType = 'LIFE2'
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS life3 WITH (NOLOCK)
        ON life3.BdmDepRecID = main.BdmDepRecID
        AND life3.BdmDedType = 'LIFE3'
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS add1 WITH (NOLOCK)
        ON add1.BdmDepRecID = main.BdmDepRecID
        AND add1.BdmDedType = 'ADD'
    LEFT JOIN dbo.U_dsi_BDM_EMETLIFDIS ot2 WITH (NOLOCK)
        ON ot2.BdmDepRecID = main.BdmDepRecID
        AND ot2.BdmDedType = 'OT2'
    GROUP BY xEEID, xCoID, EecEmpNo, main.BdmDepRecID
    OPTION (FORCE ORDER);


    --==========================================
    -- Set FileName
    --==========================================
    IF (dbo.dsi_fnVariable(@FormatCode,'UseFileName') = 'N')
    BEGIN
        UPDATE dbo.U_dsi_Parameters
            SET ExportFile = 'USFIT_elig.5920083.dat'
        WHERE FormatCode = @FormatCode;
    END

END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwEMETLIFDIS_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_EMETLIFDIS_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'EMETLIFDIS%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202001011'
       ,expStartPerControl     = '202001011'
       ,expLastEndPerControl   = '202005239'
       ,expEndPerControl       = '202005239'
WHERE expFormatCode = 'EMETLIFDIS';


    --------JOB NAME: MetLife Disability Export (EMETLIFDIS) - Weekly, Wednesday, 8:00am ET--------
    --Copy and paste this in environment to create job script

    BEGIN TRANSACTION
    DECLARE @ReturnCode INT, @JobName varchar(100), @dbName varchar(50)
    SELECT @ReturnCode = 0
    SELECT @JobName = RTRIM(REPLACE(DB_NAME(),'ULTIPRO_','')) + ' - MetLife Disability Export (EMETLIFDIS) - Weekly, Wednesday, 8:00am ET'
    SELECT @dbname = RTRIM(DB_NAME())

    -- Job Params
    IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
    BEGIN
    EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

    END

    DECLARE @jobId BINARY(16)
    EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=@JobName, 
            @enabled=0,
            @notify_level_eventlog=0, 
            @notify_level_email=0, 
            @notify_level_netsend=0, 
            @notify_level_page=0, 
            @delete_level=0, 
            @description=N'No description available.', 
            @category_name=N'[Uncategorized (Local)]', 
            @job_id = @jobId OUTPUT
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

    -- Step [Run]
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

    -- Step 'Update AscExp'
    EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Update AscExp Start/End Date (EMETLIFDIS)', 
            @step_id=1, 
            @cmdexec_success_code=0, 
            @on_success_action=3, 
            @on_success_step_id=0, 
            @on_fail_action=2, 
            @on_fail_step_id=0, 
            @retry_attempts=0, 
            @retry_interval=0, 
            @os_run_priority=0, @subsystem=N'TSQL', 
            @command=N'DECLARE @StartPerControl char(9), 
        @EndPerControl char(9), 
        @RunDate datetime; 

    SELECT @StartPerControl = CONVERT(char(8),GETDATE()-7,112) + ''1''; 
    SELECT @EndPerControl = CONVERT(char(8),GETDATE()-1,112) + ''9''; 
    SELECT @RunDate = GETDATE(); 

UPDATE dbo.AscExp
SET    expStartPerControl = @StartPerControl,
    expLastStartPerControl = @StartPerControl,
    expEndPerControl = @EndPerControl,
    expLastEndPerControl = @EndPerControl,
    expExported = @RunDate
WHERE expFormatCode = ''EMETLIFDIS''
  AND expExportCode = ''SCHEDULED'';',
            @database_name=@dbName,
            @flags=0
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

    -- Step 'Run SP'
    EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Create Export File (EMETLIFDIS)', 
            @step_id=2, 
            @cmdexec_success_code=0, 
            @on_success_action=1, 
            @on_success_step_id=0, 
            @on_fail_action=2, 
            @on_fail_step_id=0, 
            @retry_attempts=0, 
            @retry_interval=0, 
            @os_run_priority=0, @subsystem=N'TSQL', 
            @command=N'EXEC dbo.dsi_sp_TestSwitchbox_v2 ''EMETLIFDIS'', ''SCHEDULED'';', 
            @database_name=@dbName, 
            @flags=0
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
    EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
    EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Weekly, Wednesday, 8:00am ET',
            @enabled=1, 
            @freq_type=8, 
            @freq_interval=8,  
            @freq_subday_type=1, 
            @freq_subday_interval=0, 
            @freq_relative_interval=0,
            @freq_recurrence_factor=1,
            @active_start_date=20191227,
            @active_end_date=99991231,
            @active_start_time=080000,
            @active_end_time=235959;
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;
    EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)';
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;
    EXEC msdb..usg_set_job_owner @job_id = @jobId, @set_owner_to_self = 0;
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;
    COMMIT TRANSACTION
    GOTO EndSave;
    QuitWithRollback:
        IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION;
    EndSave:

    GO
    --------END JOB SCRIPT--------
**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwEMETLIFDIS_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_EMETLIFDIS_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort
