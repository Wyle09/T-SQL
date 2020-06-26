SET NOCOUNT ON;
IF OBJECT_ID('dsi_vwEORCLDEMNH_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEORCLDEMNH_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EORCLDEMNH') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EORCLDEMNH];
GO
IF OBJECT_ID('U_EORCLDEMNH_Mappings_Locations') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_Mappings_Locations];
GO
IF OBJECT_ID('U_EORCLDEMNH_Mappings_BusinessUnits') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits];
GO
IF OBJECT_ID('U_EORCLDEMNH_File') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_File];
GO
IF OBJECT_ID('U_EORCLDEMNH_EEList') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_EEList];
GO
IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_WorkTerms_D26') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_drvTbl_NewHires_WorkTerms_D26];
GO
IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_WorkTerms_D16') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_drvTbl_NewHires_WorkTerms_D16];
GO
IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_WorkRelationship_D25') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_drvTbl_NewHires_WorkRelationship_D25];
GO
IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_WorkRelationship_D15') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_drvTbl_NewHires_WorkRelationship_D15];
GO
IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_Workder_D21') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_drvTbl_NewHires_Workder_D21];
GO
IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_Workder_D11') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_drvTbl_NewHires_Workder_D11];
GO
IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_PersonUserInformation_D22') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_drvTbl_NewHires_PersonUserInformation_D22];
GO
IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_PersonUserInformation_D12') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_drvTbl_NewHires_PersonUserInformation_D12];
GO
IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_PersonName_D23') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_drvTbl_NewHires_PersonName_D23];
GO
IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_PersonName_D13') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_drvTbl_NewHires_PersonName_D13];
GO
IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_PersonEmail_D24') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_drvTbl_NewHires_PersonEmail_D24];
GO
IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_PersonEmail_D14') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_drvTbl_NewHires_PersonEmail_D14];
GO
IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_AssignmentSupervisor_D28') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_drvTbl_NewHires_AssignmentSupervisor_D28];
GO
IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_AssignmentSupervisor_D18') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_drvTbl_NewHires_AssignmentSupervisor_D18];
GO
IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_Assignment_D27') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_drvTbl_NewHires_Assignment_D27];
GO
IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_Assignment_D17') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_drvTbl_NewHires_Assignment_D17];
GO
IF OBJECT_ID('U_EORCLDEMNH_AuditFields') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_AuditFields];
GO
IF OBJECT_ID('U_EORCLDEMNH_Audit') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMNH_Audit];
GO
IF OBJECT_ID('fn_OracleDefaultExpenseAccount') IS NOT NULL DROP FUNCTION fn_OracleDefaultExpenseAccount;
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EORCLDEMNH';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EORCLDEMNH';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EORCLDEMNH';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EORCLDEMNH';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EORCLDEMNH';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhRespectZeroPayRate,AdhCreateTClockBatches,AdhThirdPartyPay) VALUES ('N','C','Y','0','','','N','','N','','013010','EMPEXPORT','CDE','EORCLDEMNH','Oracle Demographic New Hires Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','2000','S','N','EORCLDEMNHZ0','N','Jan  1 1900 12:00AM','C','N',NULL,'N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MERGE"','1','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','11','1',NULL,'MERGE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Worker"','2','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','11','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDL_LOADER"','3','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','11','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSourceSystemID"','4','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','11','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','5','(''UD111''=''T|'')','EORCLDEMNHZ0','50','D','11','5',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','6','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','11','6',NULL,'PersonNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HIRE"','7','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','11','7',NULL,'HIRE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStartDate"','8','(''UD111''=''T|'')','EORCLDEMNHZ0','50','D','11','8',NULL,'StartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Global Data Elements"','9','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','11','9',NULL,'FLEX:PER_PERSONS_DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBankAccount"','10','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','11','10',NULL,'bankAccount(PER_PERSONS_DFF=Global Data Elements)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBankBranch"','11','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','11','11',NULL,'bankBranch(PER_PERSONS_DFF=Global Data Elements)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBankName"','12','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','11','12',NULL,'bankBranch(PER_PERSONS_DFF=Global Data Elements)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvIfsCode"','13','(''UA''=''T'')','EORCLDEMNHZ0','50','D','11','13',NULL,'ifscCode(PER_PERSONS_DFF=Global Data Elements)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MERGE"','1','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','12','1',NULL,'MERGE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonUserInformation"','2','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','12','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDL_LOADER"','3','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','12','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSourceSystemID"','4','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','12','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','5','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','12','5',NULL,'PersonNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvUserName"','6','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','12','6',NULL,'UserName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','7','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','12','7',NULL,'GeneratedUserAccountFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','8','(''DA''=''T'')','EORCLDEMNHZ0','50','D','12','8',NULL,'UsernameMatchingFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MERGE"','1','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','13','1',NULL,'MERGE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonName"','2','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','13','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDL_LOADER"','3','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','13','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSourceSystemID"','4','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','13','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','5','(''UD111''=''T|'')','EORCLDEMNHZ0','50','D','13','5',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','6','(''SS''=''T|'')','EORCLDEMNHZ0','50','D','13','6',NULL,'EffectiveEndDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonID"','7','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','13','7',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','8','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','13','8',NULL,'FirstName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','9','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','13','9',NULL,'LastName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvKnownAs"','10','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','13','10',NULL,'KnownAs',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"GLOBAL"','11','(''DA''=''T'')','EORCLDEMNHZ0','50','D','13','11',NULL,'NameType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MERGE"','1','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','14','1',NULL,'MERGE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonEmail"','2','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','14','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDL_LOADER"','3','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','14','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSourceSystemID"','4','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','14','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEecDateOfLastHire"','5','(''UD111''=''T|'')','EORCLDEMNHZ0','50','D','14','5',NULL,'DateFrom',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonID"','6','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','14','6',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work Email"','7','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','14','7',NULL,'EmailType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressEmail"','8','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','14','8',NULL,'EmailAddress',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','9','(''DA''=''T'')','EORCLDEMNHZ0','50','D','14','9',NULL,'PrimaryFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MERGE"','1','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','15','1',NULL,'MERGE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"WorkRelationship"','2','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','15','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDL_LOADER"','3','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','15','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSourceSystemID"','4','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','15','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonID"','5','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','15','5',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCompanyName"','6','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','15','6',NULL,'LegalEmployerName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','7','(''UD111''=''T|'')','EORCLDEMNHZ0','50','D','15','7',NULL,'DateStart',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','8','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','15','8',NULL,'PrimaryFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Employee"','9','(''DA''=''T'')','EORCLDEMNHZ0','50','D','15','9',NULL,'WorkerType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MERGE"','1','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','16','1',NULL,'MERGE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"WorkTerms"','2','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','16','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDL_LOADER"','3','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','16','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSourceSystemID"','4','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','16','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPeriodOfServiceID"','5','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','16','5',NULL,'PeriodOfServiceId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonID"','6','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','16','6',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HIRE"','7','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','16','7',NULL,'ActionCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Employee"','8','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','16','8',NULL,'PersonTypeCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBusinessUnitShortCode"','9','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','16','9',NULL,'BusinessUnitShortCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCompanyName"','10','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','16','10',NULL,'LegalEmployerName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvOrgLvl1Desc"','11','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','16','11',NULL,'DepartmentName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocation"','12','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','16','12',NULL,'LocationCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvJobCode"','13','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','16','13',NULL,'JobCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','14','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','16','14',NULL,'AssignmentId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','15','(''UD111''=''T|'')','EORCLDEMNHZ0','50','D','16','15',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfTermination"','16','(''UD111''=''T|'')','EORCLDEMNHZ0','50','D','16','16',NULL,'EffectiveEndDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','17','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','16','17',NULL,'EffectiveLatestChange',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','18','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','16','18',NULL,'EffectiveSequence',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalaryOrHourly"','19','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','16','19',NULL,'HourlySalariedCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFullTimeOrPartTime"','20','(''UA''=''T'')','EORCLDEMNHZ0','50','D','16','20',NULL,'FullPartTime',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MERGE"','1','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','17','1',NULL,'MERGE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Assignment"','2','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','17','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDL_LOADER"','3','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','17','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSourceSystemID"','4','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','17','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvWorkTermsAssignmentID"','5','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','17','5',NULL,'WorkTermsAssignmentId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPeriodOfServiceID"','6','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','17','6',NULL,'PeriodOfServiceId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonID"','7','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','17','7',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HIRE"','8','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','17','8',NULL,'ActionCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAssignmentName"','9','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','17','9',NULL,'AssignmentName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"E"','10','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','17','10',NULL,'AssignmentType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','11','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','17','11',NULL,'PrimaryAssignmentFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','12','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','17','12',NULL,'PrimaryFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"NEWHIRE"','13','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','17','13',NULL,'ReasonCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Employee"','14','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','17','14',NULL,'SystemPersonType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','15','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','17','15',NULL,'EffectiveSequence',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfOriginalHire"','16','(''UD111''=''T|'')','EORCLDEMNHZ0','50','D','17','16',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfTermination"','17','(''UD111''=''T|'')','EORCLDEMNHZ0','50','D','17','17',NULL,'EffectiveEndDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','18','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','17','18',NULL,'EffectiveLatestChange',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','19','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','17','19',NULL,'AssignmentNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCompanyName"','20','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','17','20',NULL,'LegalEmployerName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvJobCode"','21','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','17','21',NULL,'JobCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBusinessUnitShortCode"','22','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','17','22',NULL,'BusinessUnitShortCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvOrgLvl1Desc"','23','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','17','23',NULL,'DepartmentName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDefaulExpenseAccount"','24','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','17','24',NULL,'DefaultExpenseAccount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocDesc"','25','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','17','25',NULL,'LocationCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalaryOrHourly"','26','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','17','26',NULL,'HourlySalariedCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFullTImeOrPartTime"','27','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','17','27',NULL,'FullPartTime',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Global Data Elements"','28','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','17','28',NULL,'FLEX:PER_ASG_DF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvJobTitle"','29','(''UA''=''T'')','EORCLDEMNHZ0','50','D','17','29',NULL,'alternatejobtitle(PER_ASG_DF=Global Data Elements)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MERGE"','1','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','18','1',NULL,'MERGE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AssignmentSupervisor"','2','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','18','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDL_LOADER"','3','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','18','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSourceSystemId"','4','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','18','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAssignmentNumber"','5','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','18','5',NULL,'AssignmentNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','6','(''UD111''=''T|'')','EORCLDEMNHZ0','50','D','18','6',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfTermination"','7','(''UD111''=''T|'')','EORCLDEMNHZ0','50','D','18','7',NULL,'EffectiveEndDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvManagerType"','8','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','18','8',NULL,'ManagerType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','9','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','18','9',NULL,'PrimaryFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvManagerAssignmentNumber"','10','(''UA''=''T|'')','EORCLDEMNHZ0','50','D','18','10',NULL,'ManagerAssignmentNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvManagerPersonNumber"','11','(''UA''=''T'')','EORCLDEMNHZ0','50','D','18','11',NULL,'ManagerPersonNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"METADATA"','1','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','21','1',NULL,'METADATA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Worker"','2','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','21','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemOwner"','3','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','21','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemId"','4','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','21','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveStartDate"','5','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','21','5',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonNumber"','6','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','21','6',NULL,'PersonNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ActionCode"','7','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','21','7',NULL,'ActionCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"StartDate"','8','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','21','8',NULL,'StartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FLEX:PER_PERSONS_DFF"','9','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','21','9',NULL,'FLEX:PER_PERSONS_DFF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"bankAccount(PER_PERSONS_DFF=Global Data Elements)"','10','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','21','10',NULL,'bankAccount(PER_PERSONS_DFF=Global Data Elements)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"bankBranch(PER_PERSONS_DFF=Global Data Elements)"','11','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','21','11',NULL,'bankBranch(PER_PERSONS_DFF=Global Data Elements)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"bankName(PER_PERSONS_DFF=Global Data Elements)"','12','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','21','12',NULL,'bankName(PER_PERSONS_DFF=Global Data Elements)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ifscCode(PER_PERSONS_DFF=Global Data Elements)"','13','(''DA''=''T'')','EORCLDEMNHZ0','50','D','21','13',NULL,'ifscCode(PER_PERSONS_DFF=Global Data Elements)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"METADATA"','1','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','22','1',NULL,'METADATA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonUserInformation"','2','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','22','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemOwner"','3','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','22','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemId"','4','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','22','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonNumber"','5','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','22','5',NULL,'PersonNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"UserName"','6','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','22','6',NULL,'UserName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"GeneratedUserAccountFlag"','7','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','22','7',NULL,'GeneratedUserAccountFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"UsernameMatchingFlag"','8','(''DA''=''T'')','EORCLDEMNHZ0','50','D','22','8',NULL,'UsernameMatchingFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"METADATA"','1','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','23','1',NULL,'METADATA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonName"','2','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','23','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemOwner"','3','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','23','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemId"','4','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','23','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveStartDate"','5','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','23','5',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveEndDate"','6','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','23','6',NULL,'EffectiveEndDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonId(SourceSystemId)"','7','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','23','7',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FirstName"','8','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','23','8',NULL,'FirstName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LastName"','9','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','23','9',NULL,'LastName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"KnownAs"','10','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','23','10',NULL,'KnownAs',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"NameType"','11','(''DA''=''T'')','EORCLDEMNHZ0','50','D','23','11',NULL,'NameType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"METADATA"','1','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','24','1',NULL,'METADATA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonEmail"','2','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','24','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemOwner"','3','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','24','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemId"','4','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','24','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"DateFrom"','5','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','24','5',NULL,'DateFrom',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonId(SourceSystemId)"','6','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','24','6',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EmailType"','7','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','24','7',NULL,'EmailType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EmailAddress"','8','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','24','8',NULL,'EmailAddress',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PrimaryFlag"','9','(''DA''=''T'')','EORCLDEMNHZ0','50','D','24','9',NULL,'PrimaryFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"METADATA"','1','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','25','1',NULL,'METADATA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"WorkRelationship"','2','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','25','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemOwner"','3','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','25','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemId"','4','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','25','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonId(SourceSystemId)"','5','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','25','5',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LegalEmployerName"','6','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','25','6',NULL,'LegalEmployerName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"DateStart"','7','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','25','7',NULL,'DateStart',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PrimaryFlag"','8','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','25','8',NULL,'PrimaryFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"WorkerType"','9','(''DA''=''T'')','EORCLDEMNHZ0','50','D','25','9',NULL,'WorkerType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"METADATA"','1','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','1',NULL,'METADATA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"WorkTerms"','2','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemOwner"','3','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemId"','4','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PeriodOfServiceId(SourceSystemId)"','5','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','5',NULL,'PeriodOfServiceId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonId(SourceSystemId)"','6','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','6',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ActionCode"','7','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','7',NULL,'ActionCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonTypeCode"','8','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','8',NULL,'PersonTypeCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"BusinessUnitShortCode"','9','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','9',NULL,'BusinessUnitShortCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LegalEmployerName"','10','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','10',NULL,'LegalEmployerName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"DepartmentName"','11','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','11',NULL,'DepartmentName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LocationCode"','12','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','12',NULL,'LocationCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"JobCode"','13','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','13',NULL,'JobCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AssignmentId"','14','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','14',NULL,'AssignmentId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveStartDate"','15','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','15',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveEndDate"','16','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','16',NULL,'EffectiveEndDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveLatestChange"','17','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','17',NULL,'EffectiveLatestChange',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveSequence"','18','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','18',NULL,'EffectiveSequence',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HourlySalariedCode"','19','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','26','19',NULL,'HourlySalariedCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FullPartTime"','20','(''DA''=''T'')','EORCLDEMNHZ0','50','D','26','20',NULL,'FullPartTime',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"METADATA"','1','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','1',NULL,'METADATA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Assignment"','2','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemOwner"','3','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemId"','4','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"WorkTermsAssignmentId(SourceSystemId)"','5','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','5',NULL,'WorkTermsAssignmentId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PeriodOfServiceId(SourceSystemId)"','6','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','6',NULL,'PeriodOfServiceId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonId(SourceSystemId)"','7','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','7',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ActionCode"','8','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','8',NULL,'ActionCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AssignmentName"','9','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','9',NULL,'AssignmentName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AssignmentType"','10','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','10',NULL,'AssignmentType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PrimaryAssignmentFlag"','11','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','11',NULL,'PrimaryAssignmentFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PrimaryFlag"','12','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','12',NULL,'PrimaryFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ReasonCode"','13','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','13',NULL,'ReasonCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SystemPersonType"','14','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','14',NULL,'SystemPersonType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveSequence"','15','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','15',NULL,'EffectiveSequence',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveStartDate"','16','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','16',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveEndDate"','17','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','17',NULL,'EffectiveEndDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveLatestChange"','18','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','18',NULL,'EffectiveLatestChange',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AssignmentNumber"','19','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','19',NULL,'AssignmentNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LegalEmployerName"','20','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','20',NULL,'LegalEmployerName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"JobCode"','21','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','21',NULL,'JobCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"BusinessUnitShortCode"','22','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','22',NULL,'BusinessUnitShortCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"DepartmentName"','23','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','23',NULL,'DepartmentName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"DefaultExpenseAccount"','24','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','24',NULL,'DefaultExpenseAccount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LocationCode"','25','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','25',NULL,'LocationCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HourlySalariedCode"','26','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','26',NULL,'HourlySalariedCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FullPartTime"','27','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','27',NULL,'FullPartTime',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FLEX:PER_ASG_DF"','28','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','27','28',NULL,'FLEX:PER_ASG_DF',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"alternatejobtitle(PER_ASG_DF=Global Data Elements)"','29','(''DA''=''T'')','EORCLDEMNHZ0','50','D','27','29',NULL,'alternatejobtitle(PER_ASG_DF=Global Data Elements)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"METADATA"','1','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','28','1',NULL,'METADATA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AssignmentSupervisor"','2','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','28','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemOwner"','3','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','28','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemId"','4','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','28','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AssignmentNumber"','5','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','28','5',NULL,'AssignmentNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveStartDate"','6','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','28','6',NULL,'EffectiveStartDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EffectiveEndDate"','7','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','28','7',NULL,'EffectiveEndDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ManagerType"','8','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','28','8',NULL,'ManagerType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PrimaryFlag"','9','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','28','9',NULL,'PrimaryFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ManagerAssignmentNumber"','10','(''DA''=''T|'')','EORCLDEMNHZ0','50','D','28','10',NULL,'ManagerAssignmentNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ManagerPersonNumber"','11','(''DA''=''T'')','EORCLDEMNHZ0','50','D','28','11',NULL,'ManagerPersonNumber',NULL,NULL);
DECLARE @UDSERVER varchar(5) = (SELECT RTRIM(LEFT(@@SERVERNAME,PATINDEX('%[0-9]%',@@SERVERNAME)) + SUBSTRING(@@SERVERNAME,PATINDEX('%UP[0-9]%',@@SERVERNAME)+2,1)));
SELECT @UDSERVER = CASE WHEN @UDSERVER = 'EW21' THEN 'WP6' WHEN @UDSERVER = 'EW22' THEN 'WP7' ELSE @UDSERVER END;
DECLARE @UDCOCODE varchar(5) = (SELECT RTRIM(CmmCompanyCode) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\[UDCOCODE]_EORCLDEMNH_20200312.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'New Hires OnDemand','201908169','EMPEXPORT','ONDMD_XOE',NULL,'EORCLDEMNH',NULL,NULL,NULL,'201908169','Aug 16 2019 12:11PM','Aug 16 2019 12:11PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'WYLEC',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\[UDCOCODE]_EORCLDEMNH_20200312.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'New Hires Test','201908169','EMPEXPORT','TEST_XOE',NULL,'EORCLDEMNH',NULL,NULL,NULL,'201908169','Aug 16 2019 12:11PM','Aug 16 2019 12:11PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'WYLEC',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\[UDCOCODE]_EORCLDEMNH_20200312.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'New Hires FullFile','201908169','EMPEXPORT','FULL_XOE',NULL,'EORCLDEMNH',NULL,NULL,NULL,'201908169','Aug 16 2019 12:11PM','Aug 16 2019 12:11PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'WYLEC',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\[UDCOCODE]_EORCLDEMNH_20200312.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'New Hires Scheduled','201908169','EMPEXPORT','SCHEDULED',NULL,'EORCLDEMNH',NULL,NULL,NULL,'201908169','Aug 16 2019 12:11PM','Aug 16 2019 12:11PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'WYLEC',NULL);
--UPDATE dbo.AscExp SET expAscFileName = CASE WHEN LEFT(@UDENV,2) IN ('NW','EW','WP') THEN REPLACE(REPLACE(REPLACE(expAscFileName,'[UDENV]',@UDENV),'[UDSERVER]',@UDSERVER),'[UDCOCODE]',@UDCOCODE) ELSE '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\' + @UDCOCODE + '_EORCLDEMNH_20200312.txt' END WHERE expFormatCode = 'EORCLDEMNH';
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMNH','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMNH','MultFile','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMNH','SubSort','C','drvSubSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMNH','SubSort2','C','drvSubSort2');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMNH','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMNH','UseFileName','V','Y');
UPDATE dbo.U_dsi_Configuration SET CfgValue = CASE WHEN CfgName = 'UseFileName' THEN 'Y' ELSE NULL END WHERE FormatCode = 'EORCLDEMNH' AND CfgName IN ('UseFileName','ExportPath');
INSERT INTO dbo.CustomTemplates (CreationDate,Engine,EngineCode,IsActive,ModifiedDate) SELECT CreationDate = GETDATE(), Engine = AdhEngine, EngineCode = AdhFormatCode, IsActive = 1, ModifiedDate = GETDATE() FROM dbo.AscDefH WITH (NOLOCK) WHERE AdhFormatCode = 'EORCLDEMNH' AND NOT EXISTS(SELECT 1 FROM dbo.CustomTemplates WHERE EngineCode = AdhFormatCode);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMNH','D11','dbo.U_EORCLDEMNH_drvTbl_NewHires_Workder_D11',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMNH','D12','dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonUserInformation_D12',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMNH','D13','dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonName_D13',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMNH','D14','dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonEmail_D14',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMNH','D15','dbo.U_EORCLDEMNH_drvTbl_NewHires_WorkRelationship_D15',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMNH','D16','dbo.U_EORCLDEMNH_drvTbl_NewHires_WorkTerms_D16',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMNH','D17','dbo.U_EORCLDEMNH_drvTbl_NewHires_Assignment_D17',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMNH','D18','dbo.U_EORCLDEMNH_drvTbl_NewHires_AssignmentSupervisor_D18',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMNH','D21','dbo.U_EORCLDEMNH_drvTbl_NewHires_Workder_D21',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMNH','D22','dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonUserInformation_D22',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMNH','D23','dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonName_D23',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMNH','D24','dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonEmail_D24',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMNH','D25','dbo.U_EORCLDEMNH_drvTbl_NewHires_WorkRelationship_D25',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMNH','D26','dbo.U_EORCLDEMNH_drvTbl_NewHires_WorkTerms_D26',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMNH','D27','dbo.U_EORCLDEMNH_drvTbl_NewHires_Assignment_D27',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMNH','D28','dbo.U_EORCLDEMNH_drvTbl_NewHires_AssignmentSupervisor_D28',NULL);
IF OBJECT_ID('U_EORCLDEMNH_Audit') IS NULL
CREATE TABLE [dbo].[U_EORCLDEMNH_Audit] (
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
IF OBJECT_ID('U_EORCLDEMNH_AuditFields') IS NULL
CREATE TABLE [dbo].[U_EORCLDEMNH_AuditFields] (
    [aTableName] varchar(30) NULL,
    [aFieldName] varchar(30) NULL
);
IF OBJECT_ID('U_EORCLDEMNH_EEList') IS NULL
CREATE TABLE [dbo].[U_EORCLDEMNH_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EORCLDEMNH_File') IS NULL
CREATE TABLE [dbo].[U_EORCLDEMNH_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(2000) NULL
);
IF OBJECT_ID('U_EORCLDEMNH_Mappings_BusinessUnits') IS NULL
CREATE TABLE [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (
    [MapCompanyCode] varchar(10) NULL,
    [MapCompanyName] varchar(100) NULL,
    [MapBusinessUnit] varchar(100) NULL
);
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('101','R1 RCM Inc.','R1 US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('111','Rover 16, Inc.','R1 US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('121','R1 RCM India Private Limited','R1 India');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('131','Accretive Mauritius, Inc.','R1 US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('141','R1 RCM Global Private','R1 India');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('201','Project Links Parent, Inc.','R1 US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('211','Intermedix Holdings Inc.','R1 US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('221','Intermedix Midco, Inc.','R1 US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('261','Intermedix Staffing, Inc.','R1 US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('262','Med Media, Inc.','R1 US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('263','The Dezonia Group, Inc.','R1 US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('271','Optima (US) Ltd.','Optima US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('291','Intermedix Lietuva, UAB','LTH');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('231','Intermedix Corporation','R1 US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('232','Intermedix Analytics, LLC','R1 US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('241','Medical Consultants, Inc.','R1 US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('242','Intermedix Physician Services, LLC','R1 US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('251','Advanced Data Processing, Inc.','R1 US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('252','Intermedix Office Based, LLC','R1 US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('253','Practice Support Resources, LLC','R1 US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('254','Intermedix ARM, LLC','R1 US');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('281','The Optima Corporation Ltd.','Optima NZ');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('282','Optima (NZ) Ltd.','Optima NZ');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (MapCompanyCode,MapCompanyName,MapBusinessUnit) VALUES ('283','The Optima Corporation (International) Ltd.','Optima UK');
IF OBJECT_ID('U_EORCLDEMNH_Mappings_Locations') IS NULL
CREATE TABLE [dbo].[U_EORCLDEMNH_Mappings_Locations] (
    [MapUltiLocCode] varchar(15) NULL,
    [MapOracleLocCode] varchar(15) NULL
);
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('AKAN01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('AKRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ALBI01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ALBI02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ALBI03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ALBI04','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ALBI05','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ALCL01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ALFO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ALMO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ALPE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ALRE33','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ALRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ARFO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ARHE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ARRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('AZRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('AZTU01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('CAAR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('CAFR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('CALO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('CAPL01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('CART01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('CASA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('CORT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('COWH01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('CTRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('DCRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('DCWA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('DCWA02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('DERT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLBO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLCR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLDE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLFO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLFO02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLJA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLJA02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLJA03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLJA04','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLMI01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLMI02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLPA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLPA02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLPE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLPE02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLPE03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLPE04','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLPO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLTA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FLTA02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('GABL01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('GART01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('HIHO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('HIRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('IACE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('IART01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('IDBU01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('IDRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILAD01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILAN01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILAR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILAU01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILBO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILBO02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILCH01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILCH02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILCH03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILCH04','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILCH05','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILCH06','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILCH11','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILDE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILDE02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILEL01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILEL02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILEV01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILGA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILGL01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILGR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILHI01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILHI02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILHO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILHO02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILJO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILKA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILLA02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILLI01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILMA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILMO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILMT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILRE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILSC01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILSP01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILWA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ILWE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INAN01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INAV01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INBE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INBO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INBO02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INBR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INBR02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INCA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INEL01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INEV01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INFI01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INFI02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INGR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ININ01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ININ02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ININ03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ININ04','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ININ05','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ININ06','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ININ07','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ININ08','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ININ10','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ININ11','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INKO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INNO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INNO02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INNO03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INPL01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT05','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT09','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT10','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT14','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT20','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT21','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT22','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT23','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT24','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT26','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT27','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT32','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT34','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT35','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT39','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT40','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT42','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT46','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT50','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT54','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT60','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT62','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT67','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT68','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT77','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT91','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT93','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT96','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INRT97','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INSA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INWI01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INWI02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INWI03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('INZI01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSDE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSIN01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSMA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSPI01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSWA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSWI01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSWI02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSWI03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSWI04','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSWI05','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSWI06','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSWI07','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSWI08','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSWI09','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSWI10','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSWI11','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KSWI12','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KYLO02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KYLO03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KYRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KYRT02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('KYRT35','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('LART01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MART01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MDBA05','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MDBA08','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MDBE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MDEL05','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MDHA05','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MDRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MERT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIBA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIBI01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MICH01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIDE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIDO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIEA54','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIFA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIGR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIGR02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIGR03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIHA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIKA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIKA02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIKO03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MILA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MILI01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIMA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIMA02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MINO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIOS01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIPL01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIPO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIRO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MISA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MISA02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MISA19','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MISO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MISO02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIST01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MITA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MITR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIVA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIWA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIWA02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MIWA03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MNRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MOCA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MOKA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MORT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MORT02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MORT10','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MORT14','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('MSRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NCFA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NCRA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NCRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NCWI01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NDRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NERT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NHLE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NHRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NJCA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NJRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NJTR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NMDE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NMRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NVHE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NVME01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NVRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NYBR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NYRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OHCI01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OHGA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OHRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OHRT03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OHRT13','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OHRT17','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OHRT21','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OHRT25','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OHRT66','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OHRT82','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OKBA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OKBR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OKNO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OKOK01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OKOK02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OKOW01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OKRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OKSA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OKTU01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('OKTU02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ORRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ORRT02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('ORSP01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('PACH01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('PAME01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('PAPGH','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('PAPH01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('PART01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('PART37','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('PART42','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('PART46','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('SCRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('SDRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TNBR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TNKI01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TNLE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TNMC01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TNMU01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TNMU02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TNNA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TNNA02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TNNA03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TNRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TNSM01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TNSP01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TNWO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXAL01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXAU01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXAU02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXAU03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXAU04','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXAU05','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXAU06','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXAU07','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXAU08','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXAU09','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXAU10','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXAU11','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXAU12','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXAU13','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXBA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXBE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXBU01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXCE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXCY01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXDA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXFR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXHO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXKY01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXLO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXLO02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXLU01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXMA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXOD01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXPF01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXRO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXSM01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXWA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('TXWA02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTAM01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTCE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTDE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTFI01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTHE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTLA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTLA02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTLO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTMO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTMU01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTMU02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTMU03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTOG01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTOG02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTOR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTPA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTPR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTPR02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTRI01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTRI02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTRI03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTSA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTSA02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTSA03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTSA04','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTSA05','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTSA06','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTSO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTSP01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTST01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTST02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTTA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTTO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTTR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('UTWE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('VAAR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('VACH01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('VALE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('VART01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('VTRT02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WABR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WART01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIAP01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIAP02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIBR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIBR02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIBR03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WICH01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIEA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIFR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIFR02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIFR03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIGL01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIGL02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIMA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIME01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIME02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIME03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIMI01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIMI03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIMI04','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIMI05','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIMI06','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIMI07','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIMI08','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIMI09','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIMI10','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WINE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WINE02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIOS01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIOS02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIRA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIRA02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIRA03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIRA04','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIRH01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIRH02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIRH03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIST01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIST02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIST03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIST04','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WITO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIWA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIWA02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIWE01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIWE02','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIWE03','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WIWO01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WVRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WYEV01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('WYRT01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('GBRR01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NZLA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('NTL001','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('LTKA01','000');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('IND004','103');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('IND005','104');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('IND007','103');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('IND008','101');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('IND009','102');
INSERT INTO [dbo].[U_EORCLDEMNH_Mappings_Locations] (MapUltiLocCode,MapOracleLocCode) VALUES ('FRA001','000');
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EORCLDEMNH]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: R1 RCM Inc.

Created By: Wyle Cordero
Business Analyst: Dian Turner
Create Date: 08/16/2019
Service Request Number: SR-2019-00241875

Purpose: Oracle Demographic New Hires Export

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2019     SR-2019-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EORCLDEMNH';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EORCLDEMNH';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EORCLDEMNH';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EORCLDEMNH';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EORCLDEMNH' ORDER BY RunID DESC;

Job Ownership Scripts
---------------------
-- Set job owner to ssis_user for Production jobs
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 0;

-- Set job owner to self, to make changes in SQL Job Scheduler. Remember to re-run the above script to change ownership to ssis_user when complete
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 1;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EORCLDEMNH', 'ONDMD_XOE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EORCLDEMNH', 'TEST_XOE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EORCLDEMNH', 'FULL_XOE';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'EORCLDEMNH', @AllObjects = 'Y', @IsWeb = 'Y'
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
    SELECT @FormatCode = 'EORCLDEMNH';

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
    DELETE FROM dbo.U_EORCLDEMNH_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_EORCLDEMNH_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

    -- For Full File include all new hires that are active
    DELETE EEList
    FROM dbo.U_EORCLDEMNH_EEList EEList
    INNER JOIN dbo.EmpComp
        ON xEEID = EecEEId
        AND xCoID = EecCoID
        AND EecEmplStatus <> 'A'
        AND EecDateOfLastHire NOT BETWEEN @StartDate AND @EndDate
    WHERE @ExportCode = 'FULL_XOE';

    --==========================================
    -- Audit Section
    --==========================================
    -- Get data from audit fields table. Add fields here if auditing
    IF OBJECT_ID('U_EORCLDEMNH_AuditFields','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_AuditFields;
    CREATE TABLE dbo.U_EORCLDEMNH_AuditFields (aTableName varchar(30),aFieldName varchar(30));

    INSERT INTO dbo.U_EORCLDEMNH_AuditFields  (aTableName, aFieldName)
    VALUES ('EmpComp', 'EecEmplStatus')
    ;

    -- Create audit table based on fields defined above
    IF OBJECT_ID('U_EORCLDEMNH_Audit','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_Audit;
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
    INTO dbo.U_EORCLDEMNH_Audit
    FROM dbo.vw_AuditData WITH (NOLOCK) 
    JOIN dbo.U_EORCLDEMNH_AuditFields WITH (NOLOCK) 
        ON audTableName = aTableName
        AND audFieldName = aFieldName
    WHERE audDateTime BETWEEN @StartDate AND @EndDate
    AND audAction <> 'DELETE';

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EORCLDEMNH_Audit ON dbo.U_EORCLDEMNH_Audit (audEEID,audKey2);
    
    -- Changes Only, only include active employees.
    DELETE FROM dbo.U_EORCLDEMNH_EEList
    WHERE NOT EXISTS (SELECT 1 FROM dbo.U_EORCLDEMNH_Audit WHERE audEEID = xEEID AND audRowNo = 1 AND audOldValue IS NULL AND AudNewValue = 'A')
    AND @ExportCode <> 'FULL_XOE';

    -- Exclude any future hires.
    DELETE el
    FROM dbo.U_EORCLDEMNH_EEList el
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

-- Location's mapping is no longer being used, will keep just incase.
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
    -- DETAIL RECORD - U_EORCLDEMNH_drvTbl_NewHires_Workder_D11
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_Workder_D11','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_drvTbl_NewHires_Workder_D11;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvSubSort = '1A'
        ,drvSubSort2 = EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvSourceSystemID = CONCAT(EecEmpNo, '_PERSON')
        ,drvDateOfLastHire = EecDateOfLastHire
        ,drvEmpNo = EecEmpNo
        ,drvStartDate = EecDateOfLastHire
        ,drvBankAccount = BankAccountNumber
        ,drvBankBranch = BeneficiaryAddress3
        ,drvBankName = BankName
        ,drvIfsCode = SwiftCode
    INTO dbo.U_EORCLDEMNH_drvTbl_NewHires_Workder_D11
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    LEFT JOIN dbo.EmpGlobalBankInfo WITH (NOLOCK)
        ON xEEID = EEID
        AND xCoID = CoID
    OPTION (FORCE ORDER);

    ---------------------------------
    -- HEADER RECORD - U_EORCLDEMNH_drvTbl_NewHires_Workder_D21
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_Workder_D21','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_drvTbl_NewHires_Workder_D21;
    SELECT DISTINCT
        drvSubSort = '1'
        ,drvSubSort2 = ''
    INTO dbo.U_EORCLDEMNH_drvTbl_NewHires_Workder_D21
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK);

    ---------------------------------
    -- DETAIL RECORD - U_EORCLDEMNH_drvTbl_NewHires_PersonUserInformation_D12
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_PersonUserInformation_D12','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonUserInformation_D12;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvSubSort = '2A'
        ,drvSubSort2 = EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvSourceSystemID = CONCAT(EecEmpNo, '_PERSON_USER')
        ,drvEmpNo = EecEmpNo
        ,drvUserName = COALESCE(NULLIF(REPLACE(LEFT(LOWER(EepAddressEMail),CHARINDEX('@',LOWER(EepAddressEMail))),'@',''), ''), LOWER(CONCAT(LEFT(RTRIM(LTRIM(EepNameFirst)), 1), RTRIM(LTRIM(EepNameLast)))))
    INTO dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonUserInformation_D12
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    INNER JOIN dbo.EmpPers WITH (NOLOCK)
        ON xEEID = EepEEID
    OPTION (FORCE ORDER);

    ---------------------------------
    -- HEADER RECORD - U_EORCLDEMNH_drvTbl_NewHires_PersonUserInformation_D22
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_PersonUserInformation_D22','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonUserInformation_D22;
    SELECT DISTINCT
        drvSubSort = '2'
        ,drvSubSort2 = ''
    INTO dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonUserInformation_D22
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK);

    ---------------------------------
    -- DETAIL RECORD - U_EORCLDEMNH_drvTbl_NewHires_PersonName_D13
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_PersonName_D13','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonName_D13;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvSubSort = '3A'
        ,drvSubSort2 = EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvSourceSystemID = CONCAT(EecEmpNo, '_PERSON_NAME')
        ,drvDateOfLastHire = EecDateOfLastHire
        ,drvPersonID = CONCAT(EecEmpNo, '_PERSON')
        ,drvNameFirst = EepNameFirst
        ,drvNameLast = EepNameLast
        ,drvKnownAs = CASE
                          WHEN NULLIF(EepNameSuffix, '') IS NOT NULL AND EepNameSuffix <> 'Z' THEN CONCAT(EepNameLast, ', ', EepNameSuffix, ', ', EepNameFirst, ' ', LEFT(EepNameMiddle, 1))
                          WHEN  NULLIF(EepNameMiddle, '') IS NOT NULL THEN CONCAT(EepNameLast, ', ', EepNameFirst, ' ', LEFT(EepNameMiddle, 1))
                          ELSE CONCAT(EepNameLast, ', ', EepNameFirst)
                      END
    INTO dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonName_D13
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    OPTION (FORCE ORDER);

    ---------------------------------
    -- HEADER RECORD - U_EORCLDEMNH_drvTbl_NewHires_PersonUserInformation_D23
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_PersonName_D23','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonName_D23;
    SELECT DISTINCT
        drvSubSort = '3'
        ,drvSubSort2 = ''
    INTO dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonName_D23
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK);

    ---------------------------------
    -- DETAIL RECORD - U_EORCLDEMNH_drvTbl_NewHires_PersonEmail_D14
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_PersonEmail_D14','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonEmail_D14;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvSubSort = '4A'
        ,drvSubSort2 = EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvSourceSystemID = CONCAT(EecEmpNo, '_PERSON_EMAIL')
        ,drvEecDateOfLastHire = EecDateOfLastHire
        ,drvPersonID = CONCAT(EecEmpNo, '_PERSON')
        ,drvAddressEmail = COALESCE(NULLIF(EepAddressEMail, ''), LOWER(CONCAT(LEFT(RTRIM(LTRIM(EepNameFirst)), 1), RTRIM(LTRIM(EepNameLast)), '@r1rcm.com')))
    INTO dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonEmail_D14
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    OPTION (FORCE ORDER);

    ---------------------------------
    -- HEADER RECORD - U_EORCLDEMNH_drvTbl_NewHires_PersonEmail_D24
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_PersonEmail_D24','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonEmail_D24;
    SELECT DISTINCT
        drvSubSort = '4'
        ,drvSubSort2 = ''
    INTO dbo.U_EORCLDEMNH_drvTbl_NewHires_PersonEmail_D24
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK);

    ---------------------------------
    -- DETAIL RECORD - U_EORCLDEMNH_drvTbl_NewHires_WorkRelationship_D15
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_WorkRelationship_D15','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_drvTbl_NewHires_WorkRelationship_D15;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvSubSort = '5A'
        ,drvSubSort2 = EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvSourceSystemID = CONCAT(EecEmpNo, '_PERSON_WORKRELATIONSHIP')
        ,drvPersonID = CONCAT(EecEmpNo, '_PERSON')
        ,drvCompanyName = COALESCE(NULLIF(CmpCompanyDBAName, ''), CmpCompanyName) 
        ,drvDateOfLastHire = EecDateOfLastHire
    INTO dbo.U_EORCLDEMNH_drvTbl_NewHires_WorkRelationship_D15
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.Company WITH (NOLOCK)
        ON CmpCoID = xCoID
    LEFT JOIN [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] WITH (NOLOCK)
        ON CmpGLSegment = MapCompanyCode
    OPTION (FORCE ORDER);

    ---------------------------------
    -- HEADER RECORD - U_EORCLDEMNH_drvTbl_NewHires_WorkRelationship_D25
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_WorkRelationship_D25','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_drvTbl_NewHires_WorkRelationship_D25;
    SELECT DISTINCT
        drvSubSort = '5'
        ,drvSubSort2 = ''
    INTO dbo.U_EORCLDEMNH_drvTbl_NewHires_WorkRelationship_D25
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK);

    ---------------------------------
    -- DETAIL RECORD - U_EORCLDEMNH_drvTbl_NewHires_WorkTerms_D16
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_WorkTerms_D16','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_drvTbl_NewHires_WorkTerms_D16;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvSubSort = '6A'
        ,drvSubSort2 = EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvSourceSystemID = CONCAT(EecEmpNo, '_WORKTERMS')
        ,drvPeriodOfServiceID = CONCAT(EecEmpNo, '_PERSON_WORKRELATIONSHIP')
        ,drvPersonID = CONCAT(EecEmpNo, '_PERSON')
        ,drvBusinessUnitShortCode = MapbusinessUnit
        ,drvCompanyName = COALESCE(NULLIF(CmpCompanyDBAName, ''), CmpCompanyName)
        ,drvOrgLvl1Desc = Org1.OrgDesc
        ,drvLocation = '' -- CASE WHEN LocAddressCountry IN ('USA', 'NZL', 'LTU') THEN '000' ELSE COALESCE(NULLIF(RTRIM(LTRIM(LocGLAcctNo)), ''), '000') END
        ,drvJobCode = '' -- COALESCE(NULLIF(JbcDesc, ''), 'Not Applicable')
        ,drvEmpNo = EecEmpNo
        ,drvDateOfLastHire = EecDateOfLastHire
        ,drvDateOfTermination = CASE 
                                    WHEN EecEmplStatus = 'T' AND @ExportCode <> 'FULL_XOE' THEN EecDateOfTermination 
                                    WHEN @ExportCode = 'FULL_XOE' THEN @EndDate 
                                END
        ,drvSalaryOrHourly = CASE WHEN EecSalaryOrHourly = 'S' THEN 'Salaried' ELSE 'Hourly' END
        ,drvFullTimeOrPartTime = CASE WHEN EecFullTimeOrPartTime = 'F' THEN 'Full Time' ELSE 'Part Time' END
    INTO dbo.U_EORCLDEMNH_drvTbl_NewHires_WorkTerms_D16
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.Company WITH (NOLOCK)
        ON CmpCoID = xCoID
    JOIN dbo.JobCode WITH (NOLOCK)
        ON JbcJobCode = EecJobCode
    LEFT JOIN [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] WITH (NOLOCK)
        ON CmpGLSegment = MapCompanyCode
    LEFT JOIN dbo.OrgLevel Org1 WITH (NOLOCK)
        ON EecOrgLvl1 = Org1.OrgCode
        AND Org1.OrgLvl = 1
    LEFT JOIN dbo.[location] WITH (NOLOCK)
        ON EecLoCation = LocCode
    
    UNION
    -- Will need to add an additional line for each employee where the startdate will be 
    -- the originaldate of hire + 1 and the end date will be NULL. This is needed
    -- do to an oracle bug, this only implies to the full file.

    SELECT DISTINCT
        drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvSubSort = '6A'
        ,drvSubSort2 = EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvSourceSystemID = CONCAT(EecEmpNo, '_WORKTERMS')
        ,drvPeriodOfServiceID = CONCAT(EecEmpNo, '_PERSON_WORKRELATIONSHIP')
        ,drvPersonID = CONCAT(EecEmpNo, '_PERSON')
        ,drvBusinessUnitShortCode = MapbusinessUnit
        ,drvCompanyName = COALESCE(NULLIF(CmpCompanyDBAName, ''), CmpCompanyName)
        ,drvOrgLvl1Desc = Org1.OrgDesc
        ,drvLocation = '' -- CASE WHEN LocAddressCountry IN ('USA', 'NZL', 'LTU') THEN '000' ELSE COALESCE(NULLIF(RTRIM(LTRIM(LocGLAcctNo)), ''), '000') END
        ,drvJobCode = '' -- COALESCE(NULLIF(JbcDesc, ''), 'Not Applicable')
        ,drvEmpNo = EecEmpNo
        ,drvDateOfLastHire = DATEADD(DAY, 1, @EndDate)
        ,drvDateOfTermination = NULL
        ,drvSalaryOrHourly = CASE WHEN EecSalaryOrHourly = 'S' THEN 'Salaried' ELSE 'Hourly' END
        ,drvFullTimeOrPartTime = CASE WHEN EecFullTimeOrPartTime = 'F' THEN 'Full Time' ELSE 'Part Time' END
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.Company WITH (NOLOCK)
        ON CmpCoID = xCoID
    JOIN dbo.JobCode WITH (NOLOCK)
        ON JbcJobCode = EecJobCode
    LEFT JOIN [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] WITH (NOLOCK)
        ON CmpGLSegment = MapCompanyCode
    LEFT JOIN dbo.OrgLevel Org1 WITH (NOLOCK)
        ON EecOrgLvl1 = Org1.OrgCode
        AND Org1.OrgLvl = 1
    LEFT JOIN dbo.[location] WITH (NOLOCK)
        ON EecLoCation = LocCode
    WHERE @ExportCode = 'FULL_XOE'
    OPTION (FORCE ORDER);

    ---------------------------------
    -- HEADER RECORD - U_EORCLDEMNH_drvTbl_NewHires_WorkTerms_D26
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_WorkTerms_D26','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_drvTbl_NewHires_WorkTerms_D26;
    SELECT DISTINCT
        drvSubSort = '6'
        ,drvSubSort2 = ''
    INTO dbo.U_EORCLDEMNH_drvTbl_NewHires_WorkTerms_D26
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK);

    ---------------------------------
    -- DETAIL RECORD - U_EORCLDEMNH_drvTbl_NewHires_Assignment_D17
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_Assignment_D17','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_drvTbl_NewHires_Assignment_D17;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvSubSort = '7A'
        ,drvSubSort2 = EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvSourceSystemID = CONCAT(EecEmpNo, '_PERSON_ASSIGNMENT')
        ,drvWorkTermsAssignmentID = CONCAT(EecEmpNo, '_WORKTERMS')
        ,drvPeriodOfServiceID = CONCAT(EecEmpNo, '_PERSON_WORKRELATIONSHIP')
        ,drvPersonID = CONCAT(EecEmpNo, '_PERSON')
        ,drvAssignmentName = CASE WHEN (EecJobChangeReason NOT IN ('100', '101') OR EecEmplStatus <> 'T') THEN 'E1' END
        ,drvDateOfOriginalHire = EecDateOfLastHire
        ,drvDateOfTermination = CASE 
                                    WHEN EecEmplStatus = 'T' AND @ExportCode <> 'FULL_XOE' THEN EecDateOfTermination 
                                    WHEN @ExportCode = 'FULL_XOE' THEN @EndDate
                                END
        ,drvEmpNo = EecEmpNo
        ,drvCompanyName = COALESCE(NULLIF(CmpCompanyDBAName, ''), CmpCompanyName)
        ,drvJobCode = '' -- COALESCE(NULLIF(JbcDesc, ''), 'Not Applicable')
        ,drvBusinessUnitShortCode = MapbusinessUnit
        ,drvOrgLvl1Desc = Org1.OrgDesc
        ,drvDefaulExpenseAccount = dbo.fn_OracleDefaultExpenseAccount(CmpGLSegment, LocAddressCountry, EecOrgLvl1, EecOrgLvl2, EecEmplStatus, LocGLAcctNo)
        ,drvLocDesc = ''-- CASE WHEN LocAddressCountry IN ('USA', 'NZL', 'LTU') THEN '000' ELSE COALESCE(NULLIF(RTRIM(LTRIM(LocGLAcctNo)), ''), '000') END
        ,drvSalaryOrHourly = CASE WHEN EecSalaryOrHourly = 'S' THEN 'Salaried' ELSE 'Hourly' END
        ,drvFullTImeOrPartTime = CASE WHEN EecFullTimeOrPartTime = 'F' THEN 'Full Time' ELSE 'Part Time' END
        ,drvJobTitle = COALESCE(NULLIF(JbcDesc, ''), 'Not Applicable')
    INTO dbo.U_EORCLDEMNH_drvTbl_NewHires_Assignment_D17
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK)
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
    
    UNION

    -- Will need to add an additional line for each employee where the startdate will be 
    -- the originaldate of hire + 1 and the end date will be blank. This is needed
    -- do to an oracle bug, this only implies to the full file.
    SELECT DISTINCT
        drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvSubSort = '7A'
        ,drvSubSort2 = EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvSourceSystemID = CONCAT(EecEmpNo, '_PERSON_ASSIGNMENT')
        ,drvWorkTermsAssignmentID = CONCAT(EecEmpNo, '_WORKTERMS')
        ,drvPeriodOfServiceID = CONCAT(EecEmpNo, '_PERSON_WORKRELATIONSHIP')
        ,drvPersonID = CONCAT(EecEmpNo, '_PERSON')
        ,drvAssignmentName = CASE WHEN (EecJobChangeReason NOT IN ('100', '101') OR EecEmplStatus <> 'T') THEN 'E1' END
        ,drvDateOfOriginalHire = DATEADD(DAY, 1, @EndDate)
        ,drvDateOfTermination = NULL
        ,drvEmpNo = EecEmpNo
        ,drvCompanyName = COALESCE(NULLIF(CmpCompanyDBAName, ''), CmpCompanyName)
        ,drvJobCode = '' --  COALESCE(NULLIF(JbcDesc, ''), 'Not Applicable')
        ,drvBusinessUnitShortCode = MapbusinessUnit
        ,drvOrgLvl1Desc = Org1.OrgDesc
        ,drvDefaulExpenseAccount = dbo.fn_OracleDefaultExpenseAccount(CmpGLSegment, LocAddressCountry, EecOrgLvl1, EecOrgLvl2, EecEmplStatus, LocGLAcctNo)
        ,drvLocDesc = '' -- CASE WHEN LocAddressCountry IN ('USA', 'NZL', 'LTU') THEN '000' ELSE COALESCE(NULLIF(RTRIM(LTRIM(LocGLAcctNo)), ''), '000') END
        ,drvSalaryOrHourly = CASE WHEN EecSalaryOrHourly = 'S' THEN 'Salaried' ELSE 'Hourly' END
        ,drvFullTImeOrPartTime = CASE WHEN EecFullTimeOrPartTime = 'F' THEN 'Full Time' ELSE 'Part Time' END
        ,drvJobTitle = COALESCE(NULLIF(JbcDesc, ''), 'Not Applicable')
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK)
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
    WHERE @ExportCode = 'FULL_XOE'
	OPTION (FORCE ORDER);

    ---------------------------------
    -- HEADER RECORD - U_EORCLDEMNH_drvTbl_NewHires_Assignment_D27
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_Assignment_D27','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_drvTbl_NewHires_Assignment_D27;
    SELECT DISTINCT
        drvSubSort = '7'
        ,drvSubSort2 = ''
    INTO dbo.U_EORCLDEMNH_drvTbl_NewHires_Assignment_D27
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK);

    ---------------------------------
    -- DETAIL RECORD - U_EORCLDEMNH_drvTbl_NewHires_AssignmentSupervisor_D18
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_AssignmentSupervisor_D18','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_drvTbl_NewHires_AssignmentSupervisor_D18;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvSubSort = '8A'
        ,drvSubSort2 = ee.EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvSourceSystemID = CONCAT(Ee.EecEmpNo, '_MGR_ASG')
        ,drvAssignmentNumber = CONCAT('E', RTRIM(LTRIM(ee.EecEmpNo)))
        ,drvDateOfLastHire = ee.EecDateOfLastHire
        ,drvDateOfTermination = CASE WHEN Ee.EecEmplStatus = 'T' THEN Ee.EecDateOfTermination END
		,drvManagerType = 'LINE_MANAGER' -- JbcDesc
        ,drvManagerAssignmentNumber = CASE WHEN es.EecEmpNo IS NOT NULL THEN CONCAT('E', RTRIM(LTRIM(Es.EecEmpNo))) END
        ,drvManagerPersonNumber = Es.EecEmpNo
    INTO dbo.U_EORCLDEMNH_drvTbl_NewHires_AssignmentSupervisor_D18
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp EE WITH (NOLOCK)
        ON Ee.EecEEID = xEEID 
        AND Ee.EecCoID = xCoID
    INNER JOIN EmpComp Es WITH (NOLOCK)
        ON Ee.EecSupervisorID = Es.EecEEID
        AND Es.EecEmplStatus = 'A'
		AND Es.EecEmpNo IS NOT NULL
    OPTION (FORCE ORDER);

    ---------------------------------
    -- HEADER RECORD - U_EORCLDEMNH_drvTbl_NewHires_AssignmentSupervisor_D28
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMNH_drvTbl_NewHires_AssignmentSupervisor_D28','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMNH_drvTbl_NewHires_AssignmentSupervisor_D28;
    SELECT DISTINCT
        drvSubSort = '8'
        ,drvSubSort2 = ''
    INTO dbo.U_EORCLDEMNH_drvTbl_NewHires_AssignmentSupervisor_D28
    FROM dbo.U_EORCLDEMNH_EEList WITH (NOLOCK);


END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwEORCLDEMNH_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_EORCLDEMNH_File (NOLOCK)
    ORDER BY SubSort, SubSort2;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'EORCLDEMNH%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202005061'
       ,expStartPerControl     = '202005061'
       ,expLastEndPerControl   = '202005069'
       ,expEndPerControl       = '202005069'
WHERE expFormatCode = 'EORCLDEMNH';
**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwEORCLDEMNH_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_EORCLDEMNH_File (NOLOCK)
    ORDER BY SubSort, SubSort2;

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