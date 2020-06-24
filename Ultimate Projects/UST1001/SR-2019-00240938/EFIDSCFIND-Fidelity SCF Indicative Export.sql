SET NOCOUNT ON;
IF OBJECT_ID('U_EFIDSCFIND_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EFIDSCFIND_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EFIDSCFIND_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EFIDSCFIND' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEFidScfInd_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEFidScfInd_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EFidScfInd') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EFidScfInd];
GO
IF OBJECT_ID('U_EFidScfInd_Transfer10x') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_Transfer10x];
GO
IF OBJECT_ID('U_EFidScfInd_Transfer') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_Transfer];
GO
IF OBJECT_ID('U_EFidScfInd_HU27_Data') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_HU27_Data];
GO
IF OBJECT_ID('U_EFidScfInd_HU27_D12') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_HU27_D12];
GO
IF OBJECT_ID('U_EFidScfInd_HU26_D15') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_HU26_D15];
GO
IF OBJECT_ID('U_EFidScfInd_HU20_Data') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_HU20_Data];
GO
IF OBJECT_ID('U_EFidScfInd_HU20_D14') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_HU20_D14];
GO
IF OBJECT_ID('U_EFidScfInd_HU10_Data') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_HU10_Data];
GO
IF OBJECT_ID('U_EFidScfInd_HU10_D13') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_HU10_D13];
GO
IF OBJECT_ID('U_EFidScfInd_HU_Data') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_HU_Data];
GO
IF OBJECT_ID('U_EFidScfInd_HU_D12') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_HU_D12];
GO
IF OBJECT_ID('U_EFidScfInd_H02') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_H02];
GO
IF OBJECT_ID('U_EFidScfInd_H01') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_H01];
GO
IF OBJECT_ID('U_EFidScfInd_Future_terms') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_Future_terms];
GO
IF OBJECT_ID('U_EFidScfInd_Future_Hires') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_Future_Hires];
GO
IF OBJECT_ID('U_EFidScfInd_File') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_File];
GO
IF OBJECT_ID('U_EFidScfInd_EEList2') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_EEList2];
GO
IF OBJECT_ID('U_EFidScfInd_EEList') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_EEList];
GO
IF OBJECT_ID('U_EFidScfInd_EEAudit') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_EEAudit];
GO
IF OBJECT_ID('U_EFidScfInd_EC_Data') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_EC_Data];
GO
IF OBJECT_ID('U_EFidScfInd_EC_D11') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_EC_D11];
GO
IF OBJECT_ID('U_EFidScfInd_BS_Data') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_BS_Data];
GO
IF OBJECT_ID('U_EFidScfInd_BS_D09') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_BS_D09];
GO
IF OBJECT_ID('U_EFidScfInd_BG_Data') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_BG_Data];
GO
IF OBJECT_ID('U_EFidScfInd_BG_D10') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_BG_D10];
GO
IF OBJECT_ID('U_EFidScfInd_Audit') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_Audit];
GO
IF OBJECT_ID('U_EFidScfInd_04_D07') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_04_D07];
GO
IF OBJECT_ID('U_EFidScfInd_03_Data') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_03_Data];
GO
IF OBJECT_ID('U_EFidScfInd_03_D06') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_03_D06];
GO
IF OBJECT_ID('U_EFidScfInd_02E_Data') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_02E_Data];
GO
IF OBJECT_ID('U_EFidScfInd_02E_D05') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_02E_D05];
GO
IF OBJECT_ID('U_EFidScfInd_02D_Data') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_02D_Data];
GO
IF OBJECT_ID('U_EFidScfInd_02D_D04') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_02D_D04];
GO
IF OBJECT_ID('U_EFidScfInd_01_Data') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_01_Data];
GO
IF OBJECT_ID('U_EFidScfInd_01_D03') IS NOT NULL DROP TABLE [dbo].[U_EFidScfInd_01_D03];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EFIDSCFIND';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EFIDSCFIND';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EFIDSCFIND';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EFIDSCFIND';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EFIDSCFIND';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhRespectZeroPayRate,AdhCreateTClockBatches,AdhThirdPartyPay) VALUES ('N','C','Y','0',NULL,NULL,'N',NULL,'N',NULL,'013010','EMPEXPORT','SDF','EFidScfInd','Fidelity SCF Indicative Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dsi_sp_SwitchBox','80','S','N','EFidScfIndZ0','N',NULL,'C','N',NULL,'N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTest_File_Identifier_01"','1','(''UA''=''F'')','EFidScfIndZ0','7','H','01','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller_02"','2','(''UA''=''F'')','EFidScfIndZ0','73','H','01','8',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPLAN_NUMBER_1"','1','(''UA''=''F'')','EFidScfIndZ0','5','H','02','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRECORD_IDENTIFIER_2"','2','(''UA''=''F'')','EFidScfIndZ0','3','H','02','6',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_3"','3','(''UA''=''F'')','EFidScfIndZ0','1','H','02','9',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTYPE_OF_ACCOUNT_4"','4','(''UA''=''F'')','EFidScfIndZ0','15','H','02','10',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRESERVED_5"','5','(''UA''=''F'')','EFidScfIndZ0','6','H','02','25',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCLIENT_NAME_6"','6','(''UA''=''F'')','EFidScfIndZ0','25','H','02','31',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCHANGES_ONLY_FILE_INDICATOR_7"','7','(''UA''=''F'')','EFidScfIndZ0','1','H','02','56',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRESERVED_8"','8','(''UA''=''F'')','EFidScfIndZ0','9','H','02','57',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRESERVED_9"','9','(''UA''=''F'')','EFidScfIndZ0','7','H','02','66',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_10"','10','(''UA''=''F'')','EFidScfIndZ0','8','H','02','73',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPLAN_NUMBER_1"','1','(''UA''=''F'')','EFidScfIndZ0','5','D','03','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBATCH_GROUP_ID_2"','2','(''UA''=''F'')','EFidScfIndZ0','4','D','03','6',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_3"','3','(''UA''=''F'')','EFidScfIndZ0','3','D','03','10',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSOCIAL_SECURITY_NUMBER_4"','4','(''UA''=''F'')','EFidScfIndZ0','11','D','03','13',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEMPLOYEE_ID_5"','5','(''UA''=''F'')','EFidScfIndZ0','1','D','03','24',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_6"','6','(''UA''=''F'')','EFidScfIndZ0','5','D','03','25',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRECORD_IDENTIFIER_7"','7','(''UA''=''F'')','EFidScfIndZ0','2','D','03','30',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLAST_NAME_8"','8','(''UA''=''F'')','EFidScfIndZ0','20','D','03','32',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFIRST_NAME_MIDDLE_INITIAL_9"','9','(''UA''=''F'')','EFidScfIndZ0','15','D','03','52',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRESERVED_10"','10','(''UA''=''F'')','EFidScfIndZ0','9','D','03','67',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMARITAL_STATUS_11"','11','(''UA''=''F'')','EFidScfIndZ0','1','D','03','76',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGENDER_12"','12','(''UA''=''F'')','EFidScfIndZ0','1','D','03','77',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSPECIAL_TAX_TYPE_ID_13"','13','(''UA''=''F'')','EFidScfIndZ0','1','D','03','78',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_14"','14','(''UA''=''F'')','EFidScfIndZ0','1','D','03','79',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBENE_QDRO_PAYEE_15"','15','(''UA''=''F'')','EFidScfIndZ0','1','D','03','80',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPLAN_NUMBER_1"','1','(''UA''=''F'')','EFidScfIndZ0','5','D','04','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBATCH_GROUP_ID_2"','2','(''UA''=''F'')','EFidScfIndZ0','4','D','04','6',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_3"','3','(''UA''=''F'')','EFidScfIndZ0','3','D','04','10',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSOCIAL_SECURITY_NUMBER_4"','4','(''UA''=''F'')','EFidScfIndZ0','11','D','04','13',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEMPLOYEE_ID_5"','5','(''UA''=''F'')','EFidScfIndZ0','1','D','04','24',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_6"','6','(''UA''=''F'')','EFidScfIndZ0','5','D','04','25',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRECORD_IDENTIFIER_7"','7','(''UA''=''F'')','EFidScfIndZ0','2','D','04','30',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFIELD_TYPE_8"','8','(''UA''=''F'')','EFidScfIndZ0','1','D','04','32',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_9"','9','(''UA''=''F'')','EFidScfIndZ0','4','D','04','33',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvHIRE_DATE_10"','10','(''UA''=''F'')','EFidScfIndZ0','8','D','04','37',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPARTICIPATION_DATE_11"','11','(''UA''=''F'')','EFidScfIndZ0','8','D','04','45',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvVESTING_DATE_12"','12','(''UA''=''F'')','EFidScfIndZ0','8','D','04','53',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBIRTH_DATE_13"','13','(''UA''=''F'')','EFidScfIndZ0','8','D','04','61',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTERMINATION_DATE_14"','14','(''UA''=''F'')','EFidScfIndZ0','8','D','04','69',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDATE_SWITCH_15"','15','(''UA''=''F'')','EFidScfIndZ0','1','D','04','77',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRESERVED_16"','16','(''UA''=''F'')','EFidScfIndZ0','1','D','04','78',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_17"','17','(''UA''=''F'')','EFidScfIndZ0','1','D','04','79',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvASSOCIATION_INDICATOR_18"','18','(''UA''=''F'')','EFidScfIndZ0','1','D','04','80',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPLAN_NUMBER_1"','1','(''UA''=''F'')','EFidScfIndZ0','5','D','05','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBATCH_GROUP_ID_2"','2','(''UA''=''F'')','EFidScfIndZ0','4','D','05','6',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_3"','3','(''UA''=''F'')','EFidScfIndZ0','3','D','05','10',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSOCIAL_SECURITY_NUMBER_4"','4','(''UA''=''F'')','EFidScfIndZ0','11','D','05','13',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEMPLOYEE_ID_5"','5','(''UA''=''F'')','EFidScfIndZ0','1','D','05','24',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_6"','6','(''UA''=''F'')','EFidScfIndZ0','5','D','05','25',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRECORD_IDENTIFIER_7"','7','(''UA''=''F'')','EFidScfIndZ0','2','D','05','30',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFIELD_TYPE_8"','8','(''UA''=''F'')','EFidScfIndZ0','1','D','05','32',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployee_Number_9"','9','(''UA''=''F'')','EFidScfIndZ0','11','D','05','33',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvReserved_10"','10','(''UA''=''F'')','EFidScfIndZ0','1','D','05','44',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvReserved_11"','11','(''UA''=''F'')','EFidScfIndZ0','2','D','05','45',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvReserved_12"','12','(''UA''=''F'')','EFidScfIndZ0','12','D','05','47',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller_13"','13','(''UA''=''F'')','EFidScfIndZ0','22','D','05','59',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPLAN_NUMBER_1"','1','(''UA''=''F'')','EFidScfIndZ0','5','D','06','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBATCH_GROUP_ID_2"','2','(''UA''=''F'')','EFidScfIndZ0','4','D','06','6',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_3"','3','(''UA''=''F'')','EFidScfIndZ0','3','D','06','10',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSOCIAL_SECURITY_NUMBER_4"','4','(''UA''=''F'')','EFidScfIndZ0','11','D','06','13',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEMPLOYEE_ID_5"','5','(''UA''=''F'')','EFidScfIndZ0','1','D','06','24',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_6"','6','(''UA''=''F'')','EFidScfIndZ0','5','D','06','25',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRECORD_IDENTIFIER_7"','7','(''UA''=''F'')','EFidScfIndZ0','2','D','06','30',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFIELD_TYPE_8"','8','(''UA''=''F'')','EFidScfIndZ0','1','D','06','32',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvADDRESS_LINE_NUMBER_9"','9','(''UA''=''F'')','EFidScfIndZ0','2','D','06','33',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvADDRESS_10"','10','(''UA''=''F'')','EFidScfIndZ0','32','D','06','35',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_11"','11','(''UA''=''F'')','EFidScfIndZ0','10','D','06','67',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMAILING_INDICATOR_12"','12','(''UA''=''F'')','EFidScfIndZ0','1','D','06','77',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvADDRESS_CHANGE_SOURCE_13"','13','(''UA''=''F'')','EFidScfIndZ0','1','D','06','78',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvOMIT_STATEMENT_INDICATOR_14"','14','(''UA''=''F'')','EFidScfIndZ0','1','D','06','79',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvASSOCIATION_INDICATOR_15"','15','(''UA''=''F'')','EFidScfIndZ0','1','D','06','80',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPLAN_NUMBER_1"','1','(''UA''=''F'')','EFidScfIndZ0','5','D','07','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBATCH_GROUP_ID_2"','2','(''UA''=''F'')','EFidScfIndZ0','4','D','07','6',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_3"','3','(''UA''=''F'')','EFidScfIndZ0','3','D','07','10',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSOCIAL_SECURITY_NUMBER_4"','4','(''UA''=''F'')','EFidScfIndZ0','11','D','07','13',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEMPLOYEE_ID_5"','5','(''UA''=''F'')','EFidScfIndZ0','1','D','07','24',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_6"','6','(''UA''=''F'')','EFidScfIndZ0','5','D','07','25',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRECORD_IDENTIFIER_7"','7','(''UA''=''F'')','EFidScfIndZ0','2','D','07','30',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFIELD_TYPE_8"','8','(''UA''=''F'')','EFidScfIndZ0','1','D','07','32',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCITY_9"','9','(''UA''=''F'')','EFidScfIndZ0','20','D','07','33',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSTATE_10"','10','(''UA''=''F'')','EFidScfIndZ0','2','D','07','53',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_11"','11','(''UA''=''F'')','EFidScfIndZ0','8','D','07','55',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvZIP_CODE_12"','12','(''UA''=''F'')','EFidScfIndZ0','5','D','07','63',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvZIP_4_CODE_13"','13','(''UA''=''F'')','EFidScfIndZ0','4','D','07','68',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_14"','14','(''UA''=''F'')','EFidScfIndZ0','5','D','07','72',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMAILING_INDICATOR_15"','15','(''UA''=''F'')','EFidScfIndZ0','1','D','07','77',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvADDRESS_CHANGE_SOURCE_16"','16','(''UA''=''F'')','EFidScfIndZ0','1','D','07','78',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvOMIT_STATEMENT_INDICATOR_17"','17','(''UA''=''F'')','EFidScfIndZ0','1','D','07','79',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvASSOCIATION_INDICATOR_18"','18','(''UA''=''F'')','EFidScfIndZ0','1','D','07','80',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller_1"','1','(''UA''=''F'')','EFidScfIndZ0','12','D','09','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSocial_Security_Number_2"','2','(''UA''=''F'')','EFidScfIndZ0','11','D','09','13',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller_3"','3','(''UA''=''F'')','EFidScfIndZ0','6','D','09','24',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRecord_Identifier_4"','4','(''UA''=''F'')','EFidScfIndZ0','2','D','09','30',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvScheduled_Amount_5"','5','(''UA''=''F'')','EFidScfIndZ0','13','D','09','32',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvScheduled_Amount_Effective_date_6"','6','(''UA''=''F'')','EFidScfIndZ0','8','D','09','45',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvType_Code_7"','7','(''UA''=''F'')','EFidScfIndZ0','2','D','09','53',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller_8"','8','(''UA''=''F'')','EFidScfIndZ0','26','D','09','55',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPLAN_NUMBER_1"','1','(''UA''=''F'')','EFidScfIndZ0','5','D','10','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBATCH_GROUP_ID_2"','2','(''UA''=''F'')','EFidScfIndZ0','4','D','10','6',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_3"','3','(''UA''=''F'')','EFidScfIndZ0','3','D','10','10',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSOCIAL_SECURITY_NUMBER_4"','4','(''UA''=''F'')','EFidScfIndZ0','11','D','10','13',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEMPLOYEE_ID_5"','5','(''UA''=''F'')','EFidScfIndZ0','1','D','10','24',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_6"','6','(''UA''=''F'')','EFidScfIndZ0','5','D','10','25',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRECORD_IDENTIFIER_7"','7','(''UA''=''F'')','EFidScfIndZ0','2','D','10','30',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEVENT_SEQUENCE_NUMBER_8"','8','(''UA''=''F'')','EFidScfIndZ0','2','D','10','32',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEVENT_EFFECTIVE_DATE_9"','9','(''UA''=''F'')','EFidScfIndZ0','8','D','10','34',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEVENT_CODE_10"','10','(''UA''=''F'')','EFidScfIndZ0','3','D','10','42',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEVENT_REASON_CODE_11"','11','(''UA''=''F'')','EFidScfIndZ0','3','D','10','45',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRETIREMENT_IDENTIFICATION_CODE_12"','12','(''UA''=''F'')','EFidScfIndZ0','10','D','10','48',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_13"','13','(''UA''=''F'')','EFidScfIndZ0','22','D','10','58',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRESERVED_14"','14','(''UA''=''F'')','EFidScfIndZ0','1','D','10','80',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_1"','1','(''UA''=''F'')','EFidScfIndZ0','12','D','11','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSOCIAL_SECURITY_NUMBER_2"','2','(''UA''=''F'')','EFidScfIndZ0','11','D','11','13',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_3"','3','(''UA''=''F'')','EFidScfIndZ0','6','D','11','24',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRECORD_IDENTIFIER_4"','4','(''UA''=''F'')','EFidScfIndZ0','2','D','11','30',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCODE_VALUE_5"','5','(''UA''=''F'')','EFidScfIndZ0','12','D','11','32',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCODE_TYPE_6"','6','(''UA''=''F'')','EFidScfIndZ0','3','D','11','44',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEFFECTIVE_DATE_7"','7','(''UA''=''F'')','EFidScfIndZ0','8','D','11','47',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_8"','8','(''UA''=''F'')','EFidScfIndZ0','25','D','11','55',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvUSAGE_INDICATOR_9"','9','(''UA''=''F'')','EFidScfIndZ0','1','D','11','80',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPLAN_NUMBER_1"','1','(''UA''=''F'')','EFidScfIndZ0','5','D','12','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_2"','2','(''UA''=''F'')','EFidScfIndZ0','7','D','12','6',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSOCIAL_SECURITY_NUMBER_3"','3','(''UA''=''F'')','EFidScfIndZ0','11','D','12','13',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEMPLOYEE_ID_4"','4','(''UA''=''F'')','EFidScfIndZ0','1','D','12','24',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_5"','5','(''UA''=''F'')','EFidScfIndZ0','5','D','12','25',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRECORD_IDENTIFIER_6"','6','(''UA''=''F'')','EFidScfIndZ0','2','D','12','30',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOCATION_SEQUENCE_NUMBER_7"','7','(''UA''=''F'')','EFidScfIndZ0','2','D','12','32',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOCATION_CODE_8"','8','(''UA''=''F'')','EFidScfIndZ0','12','D','12','34',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOCATION_TYPE_CODE_9"','9','(''UA''=''F'')','EFidScfIndZ0','2','D','12','46',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOCATION_EFFECTIVE_DATE_10"','10','(''UA''=''F'')','EFidScfIndZ0','8','D','12','48',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_11"','11','(''UA''=''F'')','EFidScfIndZ0','25','D','12','56',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPLAN_NUMBER_1"','1','(''UA''=''F'')','EFidScfIndZ0','5','D','13','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_2"','2','(''UA''=''F'')','EFidScfIndZ0','7','D','13','6',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSOCIAL_SECURITY_NUMBER_3"','3','(''UA''=''F'')','EFidScfIndZ0','11','D','13','13',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEMPLOYEE_ID_4"','4','(''UA''=''F'')','EFidScfIndZ0','1','D','13','24',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_5"','5','(''UA''=''F'')','EFidScfIndZ0','5','D','13','25',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRECORD_IDENTIFIER_6"','6','(''UA''=''F'')','EFidScfIndZ0','2','D','13','30',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOCATION_SEQUENCE_NUMBER_7"','7','(''UA''=''F'')','EFidScfIndZ0','2','D','13','32',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOCATION_CODE_8"','8','(''UA''=''F'')','EFidScfIndZ0','12','D','13','34',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOCATION_TYPE_CODE_9"','9','(''UA''=''F'')','EFidScfIndZ0','2','D','13','46',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOCATION_EFFECTIVE_DATE_10"','10','(''UA''=''F'')','EFidScfIndZ0','8','D','13','48',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_11"','11','(''UA''=''F'')','EFidScfIndZ0','25','D','13','56',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPLAN_NUMBER_1"','1','(''UA''=''F'')','EFidScfIndZ0','5','D','14','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_2"','2','(''UA''=''F'')','EFidScfIndZ0','7','D','14','6',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSOCIAL_SECURITY_NUMBER_3"','3','(''UA''=''F'')','EFidScfIndZ0','11','D','14','13',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEMPLOYEE_ID_4"','4','(''UA''=''F'')','EFidScfIndZ0','1','D','14','24',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_5"','5','(''UA''=''F'')','EFidScfIndZ0','5','D','14','25',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRECORD_IDENTIFIER_6"','6','(''UA''=''F'')','EFidScfIndZ0','2','D','14','30',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOCATION_SEQUENCE_NUMBER_7"','7','(''UA''=''F'')','EFidScfIndZ0','2','D','14','32',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOCATION_CODE_8"','8','(''UA''=''F'')','EFidScfIndZ0','12','D','14','34',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOCATION_TYPE_CODE_9"','9','(''UA''=''F'')','EFidScfIndZ0','2','D','14','46',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOCATION_EFFECTIVE_DATE_10"','10','(''UA''=''F'')','EFidScfIndZ0','8','D','14','48',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_11"','11','(''UA''=''F'')','EFidScfIndZ0','25','D','14','56',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPLAN_NUMBER_1"','1','(''UA''=''F'')','EFidScfIndZ0','5','D','15','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_2"','2','(''UA''=''F'')','EFidScfIndZ0','7','D','15','6',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSOCIAL_SECURITY_NUMBER_3"','3','(''UA''=''F'')','EFidScfIndZ0','11','D','15','13',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEMPLOYEE_ID_4"','4','(''UA''=''F'')','EFidScfIndZ0','1','D','15','24',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_5"','5','(''UA''=''F'')','EFidScfIndZ0','5','D','15','25',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRECORD_IDENTIFIER_6"','6','(''UA''=''F'')','EFidScfIndZ0','2','D','15','30',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOCATION_SEQUENCE_NUMBER_7"','7','(''UA''=''F'')','EFidScfIndZ0','2','D','15','32',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOCATION_CODE_8"','8','(''UA''=''F'')','EFidScfIndZ0','12','D','15','34',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOCATION_TYPE_CODE_9"','9','(''UA''=''F'')','EFidScfIndZ0','2','D','15','46',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOCATION_EFFECTIVE_DATE_10"','10','(''UA''=''F'')','EFidScfIndZ0','8','D','15','48',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFILLER_11"','11','(''UA''=''F'')','EFidScfIndZ0','25','D','15','56',NULL,NULL,NULL,NULL);

INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPlanNumber"','1','(''UA''=''F'')','EFidScfIndZ0','5','D','16','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','2','(''SS''=''F'')','EFidScfIndZ0','7','D','16','6',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSSN"','3','(''UA''=''F'')','EFidScfIndZ0','11','D','16','13',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','4','(''SS''=''F'')','EFidScfIndZ0','6','D','16','24',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"07"','5','(''DA''=''F'')','EFidScfIndZ0','2','D','16','30',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','6','(''DA''=''F'')','EFidScfIndZ0','1','D','16','32',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','7','(''DA''=''F'')','EFidScfIndZ0','2','D','16','33',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drv5CharacterAlpha"','8','(''UA''=''F'')','EFidScfIndZ0','5','D','16','35',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','9','(''SS''=''F'')','EFidScfIndZ0','41','D','16','40',NULL,NULL,NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Clear Prior Export Error -66','201112319','EMPEXPORT','ZAP','Jul 16 2018  9:46AM','EFidScfInd',NULL,NULL,NULL,'201112319','Jul  5 2011  3:10PM','Dec 30 1899 12:00AM','201101011','-99','','','200812151',dbo.fn_GetTimedKey(),NULL,'ULTI_UST',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Automated Export File Create','201511299','EMPEXPORT','Scheduled','Jan 26 2020  1:00AM','EFidScfInd',NULL,NULL,NULL,'202001269','Nov 29 2015 12:00AM','Dec 30 1899 12:00AM','202001201','150','','','201511231',dbo.fn_GetTimedKey(),NULL,'TTOMPKINS',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('',NULL,NULL,NULL,'M6SIV,M6S5A,GRPSV,GRPR1',NULL,NULL,NULL,'Create Test Export File','201807151','EMPEXPORT','Test','Jul 16 2018  9:54AM','EFidScfInd',NULL,NULL,NULL,'201807151','Jul 15 2018 12:00AM','Dec 30 1899 12:00AM','201807091','151','','','201807091',dbo.fn_GetTimedKey(),NULL,'TTOMPKINS',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('',NULL,NULL,NULL,'GRPW4,ZIGBC,GRO3H,GRNVI,IXX94,GRO1V,GROC8,LEOAB,M6SIV,M6S5A,GRPSV,GRPR1,GROEC,GROVR,GROVQ,GRPPE,GRP87,GRP2M,GRP2J,GRO8Z,GRNRG,GRO9D',NULL,NULL,NULL,'Create On Demand Export File','201811031','EMPEXPORT','On_Demand','Nov  6 2019 10:09AM','EFidScfInd',NULL,NULL,NULL,'201811031','Nov  3 2018 12:00AM','Dec 30 1899 12:00AM','201810281','77','','','201810281',dbo.fn_GetTimedKey(),NULL,'TTOMPKINS',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EFidScfInd','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EFidScfInd','ExportPath','V','\\us.saas\e0\data_exchange\UST1001\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EFidScfInd','InitialSort','C','SSN');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EFidScfInd','SubSort','C','SORT2');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EFidScfInd','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EFidScfInd','UseFileName','V','Y');
UPDATE dbo.U_dsi_Configuration SET CfgValue = '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\' WHERE FormatCode = 'EFIDSCFIND' AND CfgName = 'ExportPath' AND CfgValue IS NULL;
UPDATE dbo.U_dsi_Configuration SET CfgValue = svCfgValue FROM dbo.U_EFIDSCFIND_SavePath WHERE CfgName = svCfgName AND FormatCode = svFormatCode AND svCfgValue IS NOT NULL;
IF OBJECT_ID('U_EFIDSCFIND_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EFIDSCFIND_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EFidScfInd','H01','dbo.U_EFidScfInd_H01',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EFidScfInd','H02','dbo.U_EFidScfInd_H02',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EFidScfInd','D03','dbo.U_EFidScfInd_01_D03',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EFidScfInd','D04','dbo.U_EFidScfInd_02D_D04',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EFidScfInd','D05','dbo.U_EFidScfInd_02E_D05',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EFidScfInd','D06','dbo.U_EFidScfInd_03_D06',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EFidScfInd','D07','dbo.U_EFidScfInd_04_D07',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EFidScfInd','D09','dbo.U_EFidScfInd_BS_D09',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EFidScfInd','D10','dbo.U_EFidScfInd_BG_D10',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EFidScfInd','D11','dbo.U_EFidScfInd_EC_D11',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EFidScfInd','D12','dbo.U_EFidScfInd_HU27_D12',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EFidScfInd','D13','dbo.U_EFidScfInd_HU10_D13',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EFidScfInd','D14','dbo.U_EFidScfInd_HU20_D14',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EFidScfInd','D15','dbo.U_EFidScfInd_HU26_D15',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EFidScfInd','D16','dbo.U_EFidScfInd_07Y_D16',NULL); -- (WC SR-2019-00240938)
IF OBJECT_ID('U_EFidScfInd_01_D03') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_01_D03] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [SORT2] char(32) NULL,
    [drvPLAN_NUMBER_1] varchar(5) NOT NULL,
    [drvBATCH_GROUP_ID_2] varchar(1) NOT NULL,
    [drvFILLER_3] varchar(1) NOT NULL,
    [drvSOCIAL_SECURITY_NUMBER_4] char(11) NULL,
    [drvEMPLOYEE_ID_5] varchar(1) NOT NULL,
    [drvFILLER_6] varchar(1) NOT NULL,
    [drvRECORD_IDENTIFIER_7] varchar(2) NOT NULL,
    [drvLAST_NAME_8] varchar(131) NULL,
    [drvFIRST_NAME_MIDDLE_INITIAL_9] varchar(102) NULL,
    [drvRESERVED_10] varchar(9) NULL,
    [drvMARITAL_STATUS_11] varchar(1) NOT NULL,
    [drvGENDER_12] char(1) NULL,
    [drvSPECIAL_TAX_TYPE_ID_13] varchar(1) NOT NULL,
    [drvFILLER_14] varchar(1) NOT NULL,
    [drvBENE_QDRO_PAYEE_15] varchar(1) NOT NULL
);
IF OBJECT_ID('U_EFidScfInd_01_Data') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_01_Data] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL
);
IF OBJECT_ID('U_EFidScfInd_02D_D04') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_02D_D04] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [SORT2] char(32) NULL,
    [drvPLAN_NUMBER_1] varchar(5) NOT NULL,
    [drvBATCH_GROUP_ID_2] varchar(1) NOT NULL,
    [drvFILLER_3] varchar(1) NOT NULL,
    [drvSOCIAL_SECURITY_NUMBER_4] char(11) NULL,
    [drvEMPLOYEE_ID_5] varchar(1) NOT NULL,
    [drvFILLER_6] varchar(1) NOT NULL,
    [drvRECORD_IDENTIFIER_7] varchar(2) NOT NULL,
    [drvFIELD_TYPE_8] varchar(1) NOT NULL,
    [drvFILLER_9] varchar(1) NOT NULL,
    [drvHIRE_DATE_10] varchar(8) NULL,
    [drvPARTICIPATION_DATE_11] varchar(8) NULL,
    [drvVESTING_DATE_12] varchar(8) NULL,
    [drvBIRTH_DATE_13] varchar(8000) NULL,
    [drvTERMINATION_DATE_14] varchar(8) NULL,
    [drvDATE_SWITCH_15] varchar(1) NOT NULL,
    [drvRESERVED_16] varchar(1) NOT NULL,
    [drvFILLER_17] varchar(1) NOT NULL,
    [drvASSOCIATION_INDICATOR_18] varchar(1) NOT NULL
);
IF OBJECT_ID('U_EFidScfInd_02D_Data') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_02D_Data] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL
);
IF OBJECT_ID('U_EFidScfInd_02E_D05') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_02E_D05] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [SORT2] char(32) NULL,
    [drvPLAN_NUMBER_1] varchar(5) NOT NULL,
    [drvBATCH_GROUP_ID_2] varchar(1) NOT NULL,
    [drvFILLER_3] varchar(1) NOT NULL,
    [drvSOCIAL_SECURITY_NUMBER_4] char(11) NULL,
    [drvEMPLOYEE_ID_5] varchar(1) NOT NULL,
    [drvFILLER_6] varchar(1) NOT NULL,
    [drvRECORD_IDENTIFIER_7] varchar(2) NOT NULL,
    [drvFIELD_TYPE_8] varchar(1) NOT NULL,
    [drvEmployee_Number_9] varchar(9) NULL,
    [drvReserved_10] varchar(1) NOT NULL,
    [drvReserved_11] varchar(1) NOT NULL,
    [drvReserved_12] varchar(1) NOT NULL,
    [drvFiller_13] varchar(1) NOT NULL
);
IF OBJECT_ID('U_EFidScfInd_02E_Data') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_02E_Data] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL
);
IF OBJECT_ID('U_EFidScfInd_03_D06') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_03_D06] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [SORT2] char(32) NULL,
    [drvPLAN_NUMBER_1] varchar(5) NOT NULL,
    [drvBATCH_GROUP_ID_2] varchar(1) NOT NULL,
    [drvFILLER_3] varchar(1) NOT NULL,
    [drvSOCIAL_SECURITY_NUMBER_4] char(11) NULL,
    [drvEMPLOYEE_ID_5] varchar(1) NOT NULL,
    [drvFILLER_6] varchar(1) NOT NULL,
    [drvRECORD_IDENTIFIER_7] varchar(2) NOT NULL,
    [drvFIELD_TYPE_8] varchar(1) NOT NULL,
    [drvADDRESS_LINE_NUMBER_9] varchar(2) NOT NULL,
    [drvADDRESS_10] varchar(255) NULL,
    [drvFILLER_11] varchar(1) NOT NULL,
    [drvMAILING_INDICATOR_12] varchar(1) NOT NULL,
    [drvADDRESS_CHANGE_SOURCE_13] varchar(1) NOT NULL,
    [drvOMIT_STATEMENT_INDICATOR_14] varchar(1) NOT NULL,
    [drvASSOCIATION_INDICATOR_15] varchar(1) NOT NULL
);
IF OBJECT_ID('U_EFidScfInd_03_Data') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_03_Data] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL
);
IF OBJECT_ID('U_EFidScfInd_04_D07') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_04_D07] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [SORT2] char(32) NULL,
    [drvPLAN_NUMBER_1] varchar(5) NOT NULL,
    [drvBATCH_GROUP_ID_2] varchar(1) NOT NULL,
    [drvFILLER_3] varchar(1) NOT NULL,
    [drvSOCIAL_SECURITY_NUMBER_4] char(11) NULL,
    [drvEMPLOYEE_ID_5] varchar(1) NOT NULL,
    [drvFILLER_6] varchar(1) NOT NULL,
    [drvRECORD_IDENTIFIER_7] varchar(2) NOT NULL,
    [drvFIELD_TYPE_8] varchar(1) NOT NULL,
    [drvCITY_9] varchar(255) NULL,
    [drvSTATE_10] varchar(255) NULL,
    [drvFILLER_11] varchar(1) NOT NULL,
    [drvZIP_CODE_12] varchar(5) NULL,
    [drvZIP_4_CODE_13] varchar(4) NULL,
    [drvFILLER_14] varchar(1) NOT NULL,
    [drvMAILING_INDICATOR_15] varchar(1) NOT NULL,
    [drvADDRESS_CHANGE_SOURCE_16] varchar(1) NOT NULL,
    [drvOMIT_STATEMENT_INDICATOR_17] varchar(1) NOT NULL,
    [drvASSOCIATION_INDICATOR_18] varchar(1) NOT NULL
);
IF OBJECT_ID('U_EFidScfInd_Audit') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_Audit] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [StartDate] datetime NULL,
    [EndDate] datetime NULL,
    [AudFieldName] varchar(128) NOT NULL,
    [AudDateTime] datetime NOT NULL,
    [AudAction] varchar(6) NOT NULL,
    [AudOldValue] varchar(2000) NOT NULL,
    [AudNewValue] varchar(2000) NULL
);
IF OBJECT_ID('U_EFidScfInd_BG_D10') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_BG_D10] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [SORT2] char(32) NULL,
    [drvPLAN_NUMBER_1] varchar(5) NOT NULL,
    [drvBATCH_GROUP_ID_2] varchar(1) NOT NULL,
    [drvFILLER_3] varchar(1) NOT NULL,
    [drvSOCIAL_SECURITY_NUMBER_4] char(11) NULL,
    [drvEMPLOYEE_ID_5] varchar(1) NOT NULL,
    [drvFILLER_6] varchar(1) NOT NULL,
    [drvRECORD_IDENTIFIER_7] varchar(2) NOT NULL,
    [drvEVENT_SEQUENCE_NUMBER_8] varchar(2) NOT NULL,
    [drvEVENT_EFFECTIVE_DATE_9] varchar(8000) NULL,
    [drvEVENT_CODE_10] varchar(3) NULL,
    [drvEVENT_REASON_CODE_11] varchar(3) NOT NULL,
    [drvRETIREMENT_IDENTIFICATION_CODE_12] varchar(6) NOT NULL,
    [drvFILLER_13] varchar(1) NOT NULL,
    [drvRESERVED_14] varchar(1) NOT NULL
);
IF OBJECT_ID('U_EFidScfInd_BG_Data') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_BG_Data] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [ChangeType] varchar(22) NULL
);
IF OBJECT_ID('U_EFidScfInd_BS_D09') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_BS_D09] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [SORT2] char(32) NULL,
    [drvFiller_1] varchar(1) NOT NULL,
    [drvSOCIAL_SECURITY_NUMBER_2] char(11) NULL,
    [drvFILLER_3] varchar(1) NOT NULL,
    [drvRECORD_IDENTIFIER_4] varchar(2) NOT NULL,
    [drvScheduled_Amount_5] varchar(24) NULL,
    [drvScheduled_Amount_Effective_Date_6] varchar(8000) NULL,
    [drvType_Code_7] varchar(1) NOT NULL,
    [drvFiller_8] varchar(1) NOT NULL
);
IF OBJECT_ID('U_EFidScfInd_BS_Data') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_BS_Data] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [ChangeTYpe] varchar(22) NULL
);
IF OBJECT_ID('U_EFidScfInd_EC_D11') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_EC_D11] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [SORT2] char(32) NULL,
    [drvFILLER_1] varchar(1) NOT NULL,
    [drvSOCIAL_SECURITY_NUMBER_2] char(11) NULL,
    [drvFILLER_3] varchar(1) NOT NULL,
    [drvRECORD_IDENTIFIER_4] varchar(2) NOT NULL,
    [drvCODE_VALUE_5] varchar(2000) NULL,
    [drvCODE_TYPE_6] varchar(3) NULL,
    [drvEFFECTIVE_DATE_7] varchar(8000) NULL,
    [drvFILLER_8] varchar(1) NOT NULL,
    [drvUSAGE_INDICATOR_9] varchar(1) NOT NULL
);
IF OBJECT_ID('U_EFidScfInd_EC_Data') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_EC_Data] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [ChangeType] varchar(22) NULL,
    [AudDateTime] datetime NULL,
    [AudNewValue] varchar(2000) NULL,
    [AudOldValue] varchar(2000) NULL
);
IF OBJECT_ID('U_EFidScfInd_EEAudit') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_EEAudit] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [AudDateTime] datetime NULL,
    [AudOldValue] varchar(2000) NULL,
    [AudNewValue] varchar(2000) NULL,
    [ChangeType] varchar(22) NULL
);
IF OBJECT_ID('U_EFidScfInd_EEList') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EFidScfInd_EEList2') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_EEList2] (
    [xEEID] char(12) NULL,
    [xCOID] char(5) NULL,
    [SSN] char(11) NULL
);
IF OBJECT_ID('U_EFidScfInd_File') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(20) NOT NULL,
    [SubSort] varchar(32) NOT NULL,
    [Data] char(80) NULL
);
IF OBJECT_ID('U_EFidScfInd_Future_Hires') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_Future_Hires] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [AudDateTime] datetime NULL,
    [AudOldValue] varchar(2000) NULL,
    [AudNewValue] varchar(2000) NULL,
    [ChangeType] varchar(22) NULL,
    [EecDateOfLastHire] datetime NULL
);
IF OBJECT_ID('U_EFidScfInd_Future_terms') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_Future_terms] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [AudDateTime] datetime NULL,
    [AudOldValue] varchar(2000) NULL,
    [AudNewValue] varchar(2000) NULL,
    [ChangeType] varchar(22) NULL,
    [eecdateoftermination] datetime NULL
);
IF OBJECT_ID('U_EFidScfInd_H01') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_H01] (
    [drvTest_File_Identifier_01] varchar(7) NOT NULL,
    [drvFiller_02] varchar(1) NOT NULL
);
IF OBJECT_ID('U_EFidScfInd_H02') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_H02] (
    [drvPLAN_NUMBER_1] varchar(5) NOT NULL,
    [drvRECORD_IDENTIFIER_2] varchar(3) NOT NULL,
    [drvFILLER_3] varchar(1) NOT NULL,
    [drvTYPE_OF_ACCOUNT_4] varchar(7) NOT NULL,
    [drvRESERVED_5] varchar(1) NOT NULL,
    [drvCLIENT_NAME_6] varchar(6) NOT NULL,
    [drvCHANGES_ONLY_FILE_INDICATOR_7] varchar(1) NOT NULL,
    [drvRESERVED_8] varchar(1) NOT NULL,
    [drvRESERVED_9] varchar(1) NOT NULL,
    [drvFILLER_10] varchar(1) NOT NULL
);
IF OBJECT_ID('U_EFidScfInd_HU_D12') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_HU_D12] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [SORT2] char(32) NULL,
    [drvPLAN_NUMBER_1] varchar(5) NOT NULL,
    [drvFILLER_2] varchar(1) NOT NULL,
    [drvSOCIAL_SECURITY_NUMBER_3] char(11) NULL,
    [drvEMPLOYEE_ID_4] varchar(1) NOT NULL,
    [drvFILLER_5] varchar(1) NOT NULL,
    [drvRECORD_IDENTIFIER_6] varchar(2) NOT NULL,
    [drvLOCATION_SEQUENCE_NUMBER_7] varchar(1) NOT NULL,
    [drvLOCATION_CODE_8] varchar(4) NOT NULL,
    [drvLOCATION_TYPE_CODE_9] varchar(2) NOT NULL,
    [drvLOCATION_EFFECTIVE_DATE_10] varchar(8000) NULL,
    [drvFILLER_11] varchar(1) NOT NULL
);
IF OBJECT_ID('U_EFidScfInd_HU_Data') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_HU_Data] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL
);
IF OBJECT_ID('U_EFidScfInd_HU10_D13') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_HU10_D13] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [SORT2] char(32) NULL,
    [drvPLAN_NUMBER_1] varchar(5) NOT NULL,
    [drvFILLER_2] varchar(1) NOT NULL,
    [drvSOCIAL_SECURITY_NUMBER_3] char(11) NULL,
    [drvEMPLOYEE_ID_4] varchar(1) NOT NULL,
    [drvFILLER_5] varchar(1) NOT NULL,
    [drvRECORD_IDENTIFIER_6] varchar(2) NOT NULL,
    [drvLOCATION_SEQUENCE_NUMBER_7] varchar(1) NOT NULL,
    [drvLOCATION_CODE_8] varchar(6) NULL,
    [drvLOCATION_TYPE_CODE_9] varchar(2) NOT NULL,
    [drvLOCATION_EFFECTIVE_DATE_10] varchar(8000) NULL,
    [drvFILLER_11] varchar(1) NOT NULL
);
IF OBJECT_ID('U_EFidScfInd_HU10_Data') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_HU10_Data] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [CostCenter] varchar(6) NULL,
    [Transfer_CompanyCode] char(5) NULL,
    [ChangeType] varchar(22) NULL
);
IF OBJECT_ID('U_EFidScfInd_HU20_D14') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_HU20_D14] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [SORT2] char(32) NULL,
    [drvPLAN_NUMBER_1] varchar(5) NOT NULL,
    [drvFILLER_2] varchar(1) NOT NULL,
    [drvSOCIAL_SECURITY_NUMBER_3] char(11) NULL,
    [drvEMPLOYEE_ID_4] varchar(1) NOT NULL,
    [drvFILLER_5] varchar(1) NOT NULL,
    [drvRECORD_IDENTIFIER_6] varchar(2) NOT NULL,
    [drvLOCATION_SEQUENCE_NUMBER_7] varchar(1) NOT NULL,
    [drvLOCATION_CODE_8] char(2) NULL,
    [drvLOCATION_TYPE_CODE_9] varchar(2) NOT NULL,
    [drvLOCATION_EFFECTIVE_DATE_10] varchar(8000) NULL,
    [drvFILLER_11] varchar(1) NOT NULL
);
IF OBJECT_ID('U_EFidScfInd_HU20_Data') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_HU20_Data] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [CostCenter] varchar(6) NULL,
    [Transfer_CompanyCode] char(5) NULL,
    [ChangeType] varchar(22) NULL
);
IF OBJECT_ID('U_EFidScfInd_HU26_D15') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_HU26_D15] (
    [EEID] char(12) NOT NULL,
    [COID] char(5) NOT NULL,
    [SSN] char(11) NULL,
    [SORT2] char(32) NULL,
    [drvPLAN_NUMBER_1] varchar(5) NOT NULL,
    [drvFILLER_2] varchar(1) NOT NULL,
    [drvSOCIAL_SECURITY_NUMBER_3] char(11) NULL,
    [drvEMPLOYEE_ID_4] varchar(1) NOT NULL,
    [drvFILLER_5] varchar(1) NOT NULL,
    [drvRECORD_IDENTIFIER_6] varchar(2) NOT NULL,
    [drvLOCATION_SEQUENCE_NUMBER_7] varchar(1) NOT NULL,
    [drvLOCATION_CODE_8] varchar(3) NULL,
    [drvLOCATION_TYPE_CODE_9] varchar(2) NOT NULL,
    [drvLOCATION_EFFECTIVE_DATE_10] varchar(8000) NULL,
    [drvFILLER_11] varchar(1) NOT NULL
);
IF OBJECT_ID('U_EFidScfInd_HU27_D12') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_HU27_D12] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [SORT2] char(32) NULL,
    [drvPLAN_NUMBER_1] varchar(5) NOT NULL,
    [drvFILLER_2] varchar(1) NOT NULL,
    [drvSOCIAL_SECURITY_NUMBER_3] char(11) NULL,
    [drvEMPLOYEE_ID_4] varchar(1) NOT NULL,
    [drvFILLER_5] varchar(1) NOT NULL,
    [drvRECORD_IDENTIFIER_6] varchar(2) NOT NULL,
    [drvLOCATION_SEQUENCE_NUMBER_7] varchar(1) NOT NULL,
    [drvLOCATION_CODE_8] varchar(4) NOT NULL,
    [drvLOCATION_TYPE_CODE_9] varchar(2) NOT NULL,
    [drvLOCATION_EFFECTIVE_DATE_10] varchar(8000) NULL,
    [drvFILLER_11] varchar(1) NOT NULL
);
IF OBJECT_ID('U_EFidScfInd_HU27_Data') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_HU27_Data] (
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [SSN] char(11) NULL,
    [ChangeType] varchar(22) NULL
);
IF OBJECT_ID('U_EFidScfInd_Transfer') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_Transfer] (
    [EEID] char(12) NULL
);
IF OBJECT_ID('U_EFidScfInd_Transfer10x') IS NULL
CREATE TABLE [dbo].[U_EFidScfInd_Transfer10x] (
    [EEID] char(12) NULL,
    [CompanyCode] char(5) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EFidScfInd]
                @SystemID CHAR(12) = NULL
AS

BEGIN
/* ------------------------------------------------------------------------------------------------------

EXPORT NAME: Fidelity SCF Indicative Export
CREATED FOR: Altria Client Services Inc. (F/K/A UST Inc.)
CREATED BY: Jim Sibley
CREATE DATE: 6/17/2011
CP#: CS-2011-41419
BUSINESS ANALYST: Gail Yates
PROJECT MANAGER: Sandy Kerwin
EXPORT FORMATCODE: EFidScfInd
EXPORT FILE NAME: scf02730ab.txt

EXEC dbo.dsi_sp_TestSwitchbox 'EFidScfInd', 'ZAP'
EXEC dbo.dsi_sp_TestSwitchbox 'EFidScfInd', 'On_Demand'
EXEC dbo.dsi_sp_TestSwitchbox 'EFidScfInd', 'Test'
EXEC dbo.dsi_sp_TestSwitchbox 'EFidScfInd', 'Scheduled' --Weekly, Sunday 1 AM

MODIFICATION LOG(Original SOW V1.2):
08/01/2011    - Jim Sibley                - 41419        - Updated to SOW V1.3
08/04/2011  - Jim Sibley                - 41419        - Changed file name.
09/01/2011  - Jim Sibley                - 41419        - Updated to SOW V1.4
09/21/2011    - Jim Sibley                - 41419        - Updated to SOW V1.5
10/06/2011  - Jim Sibley                - 41419        - Updated to SOW V1.6
10/06/2011    - Jim Sibley                - 41419        - Updated to SOW V1.7
11/02/2011    - Jim Sibley                - 41419        - Corrected Salary changes from not appearing on file.
01/23/2012  - Tracie Sawade                - 49186        - Added new plan for union = TEAM SOW V1.9
06/15/2012  - Jim Sibley                - 54577        - Updated to SOW V2.0
06/28/2012    - Jim Sibley                - 54577        - Corrected New Hires not appearing with all records.
07/10/2012  - Jim sibley                - 54577        - Corrected Employee Type Filter to add more types.
09/17/2013 - Andrew Zoorob                          - Added program logic for TRB to be included everywhere TRI is
09/30/2013 - Andrew Zoorob              -13361      -Exlude future dated terms 
09/24/2014 - GS                          SF 4236856 - WHEN EEC.EecEEType in ('001','012') THEN 'F' - added the 012
07/09/2018 - RH                            SF# 11824341 -    Corrected Change type segment in BG10 data so that all valid changes are reported (incorrectly searching for the max aud value)
01/28/2020 - Wyle Cordero               SR-2019-00240938    - Updates as per spec V2.06
---------------------------------------------------------------------------------------------------------*/
/* Records created by Export

SELECT * FROM dbo.U_EFidScfInd_EEList
SELECT * FROM dbo.U_EFidScfInd_Audit
SELECT * FROM dbo.U_EFidScfInd_EEAudit
SELECT * FROM dbo.U_EFidScfInd_01_D03
SELECT * FROM dbo.U_EFidScfInd_02D_D04
SELECT * FROM dbo.U_EFidScfInd_02E_D05
SELECT * FROM dbo.U_EFidScfInd_03_D06
SELECT * FROM dbo.U_EFidScfInd_04_D07
SELECT * FROM dbo.U_EFidScfInd_BS_D09
SELECT * FROM dbo.U_EFidScfInd_BG_D10
SELECT * FROM dbo.U_EFidScfInd_EC_D11
SELECT * FROM dbo.U_EFidScfInd_HU27_D12
SELECT * FROM dbo.U_EFidScfInd_HU10_D13
SELECT * FROM dbo.U_EFidScfInd_HU20_D14
SELECT * FROM dbo.U_EFidScfInd_HU26_D15

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EFidScfInd';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EFidScfInd';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EFidScfInd';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EFidScfInd';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EFidScfInd' ORDER BY RunID DESC;

*/
/*
    Change Type is determined from Audit and SOW Page 15.
    Record Name and Change_Type value:
        01_D03 - 'Address Change', 'Hire','Rehire','Full Time','UDField22'
        02D_D04 - 'Date of Birth', 'Hire','Rehire','Full Time','UDField22'
        02E_D05 - 'Social Security Number', 'Hire','Rehire'
                  ,'Full Time','UDField22'
        03_D06 - 'Address Change', 'Hire','Rehire','Full Time','UDField22'
        04_D07 - 'Address Change', 'Hire','Rehire','Full Time','UDField22'
        BS_D09 - 'Annual Salary', 'Hire','Rehire','Full Time','UDField22'
        BG_D10 - 'Death','Return from Leave','Termination','Leave of Absence'
        EC_D11 - 'Hire','Rehire','Full Time','UDField22'
                 ,'EecEEType','EecSalaryorHourly','EecPayPeriod'
        HU_D12 - 'Hire','Rehire','Full Time','UDField22'
        HU10_D13 - 'Hire','Rehire',Transfers to Company 1010S,1010A,1054S,1054A
        HU20_D14 - 'Hire','Rehire',WorkStateChange
        HU26_D15 - 'Hire','Rehire',Transfer to Company 1010S,1010A,1054S,1054A
*/
/* Customer View
    ALTER View [dbo].[dsi_vwEFidScfInd_Export] 
    AS
    SELECT TOP 2000000 Data
    FROM dbo.U_EFidScfInd_File WITH (NOLOCK)
    ORDER BY 
        CASE
            WHEN LEFT(RecordSet,3) = 'H01' THEN 1
            WHEN LEFT(RecordSet,3) = 'H02' THEN 2
            ELSE 3
        END
        ,InitialSort        
        ,RIGHT(RecordSet,2)
        ,SubSort
*/

/***********************
	SELECT * FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EFidScfInd'
	SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EFidScfInd' ORDER BY RunID DESC;

	--Update Dates
	UPDATE dbo.AscExp
		SET expLastStartPerControl = '201904011'
		   ,expStartPerControl     = '201904011'
		   ,expLastEndPerControl   = '202004279'
		   ,expEndPerControl       = '202004279'
	WHERE expFormatCode = 'EFidScfInd';

*************************/


--
-- SET VARIABLES FOR FIELDS IN U_DSI_PARAMETERS
--
DECLARE @EndPercontrol VARCHAR(9)
        ,@ExportCode VARCHAR(10)
        ,@StartDate DATETIME
        ,@EndDate DATETIME
        ,@StartPercontrol VARCHAR(9)
        ,@FormatCode VARCHAR(10)
SELECT  @StartPercontrol = StartPercontrol
        ,@EndPercontrol = EndPercontrol
        ,@StartDate = CAST(LEFT(@StartPerControl,8) AS DATETIME)
        ,@EndDate = CAST(LEFT(@EndPerControl,8) AS DATETIME)
        ,@ExportCode = ExportCode
        ,@FormatCode = FormatCode
FROM    U_Dsi_Parameters WITH (NOLOCK)
WHERE   FormatCode = 'EFidScfInd'

/* ---------------------------------------------------------------------------------------------------
    Load Date variables. Set Start and End to Beginning and End of day.
------------------------------------------------------------------------------------------------------*/
SET @StartDate = CONVERT(CHAR(8),@StartDate,112)
SET @EndDATE = DATEADD(ss,-1,DATEADD(dd,+1,CONVERT(CHAR(8),@EndDate,112)))

DECLARE @ExportDate DATETIME
SET @ExportDate = GETDATE()

DECLARE @ExportTime CHAR(8)
SET @ExportTime = CONVERT(CHAR(8),@ExportDate,14)  --hh:mm:ss  zero filled

DECLARE @ExportFile VARCHAR(200)
SET @ExportFile = 
    'scf02730ab.txt'

/* ---------------------------------------------------------------------------------------------------
    Remove Company Transfers:  
    JobChangeReason = ‘TRO’ should be ignored
------------------------------------------------------------------------------------------------------*/
DELETE EE
FROM dbo.U_EFidScfInd_EEList EE
    JOIN dbo.EmpComp EEC WITH (NOLOCK)
        ON EE.xEEID = EEC.EecEEID AND EE.xCOID = EEC.EecCOID
WHERE EEC.EecJobChangeReason = 'TRO'

/* --------------------------------------------------------------------------------------------------------
    Use Audit to determine if any of the fields used in the export have 
    changed including New Hires, Rehires and Terms.
----------------------------------------------------------------------------------------------------------- */
DECLARE @FieldList VARCHAR(MAX), @TableList VARCHAR(MAX)  -- Audited columns.
SET @TableList = 'EmpPers,EmpComp'
SET @FieldList = 
    'EecEmplStatus,EepNameMiddle,EecWCState'
    + ',EepDateDeceased,EepNameLast,EepNameFirst,EepMaritalStatus,EepGender,EepDateOfBirth,EepSSN'
    + ',EepAddressLine1,EepAddressLine2,EepAddressCity,EepAddressState,EepAddressZipCode'
    + ',EecAnnSalary,EecFullTimeOrPartTime,EecSalaryorHourly,EecPayPeriod,EecEEType,EecUDField22'
    + ',EecUDField16,EepUDField12,EecUDField21' -- (WC SR-2019-00240938)

If  EXISTS(    SELECT * FROM Sys.Objects 
            WHERE Object_Id = Object_Id(N'[dbo].[U_EFidScfInd_Audit]') 
                  AND Type = 'u'    )
    DROP TABLE dbo.U_EFidScfInd_Audit

SELECT     
    EEID = EE.xEEID
    ,COID = EE.xCOID
    ,StartDate = @StartDate
    ,EndDate = @EndDate
    ,AudFieldName = AUD.AudFieldName
    ,AudDateTime = AUD.AudDateTime
    ,AudAction = AUD.AudAction
    ,AudOldValue = ISNULL(AUD.AudOldValue,'')
    ,AudNewValue = AUD.AudNewValue

INTO dbo.U_EFidScfInd_Audit

FROM dbo.U_EFidScfInd_EEList EE WITH (NOLOCK)

    JOIN vw_AuditeeData AUD WITH (NOLOCK)
        ON     EE.xEEID = AUD.AudKey1Value
            AND EE.xCOID = 
                CASE 
                    WHEN AUD.AudTableName = 'EmpComp' THEN AUD.AudKey2Value 
                    ELSE EE.xCOID  -- Ignore COID for EmpPers records.
                END 

WHERE 
    AUD.AudTableName IN(SELECT item FROM dbo.Fn_ListToTable(@TableList))
    AND AUD.AudFieldName IN(SELECT item FROM dbo.fn_ListToTable(@FieldList))
    AND AUD.AudDateTime BETWEEN @StartDate AND @EndDate

/* --------------------------------------------------------------------------------------------------------
    Load _Transfer with employees who exist in companies other then the company
    found in audit. For changes in EmplStatus only.
----------------------------------------------------------------------------------------------------------- */
If  EXISTS(    SELECT * FROM Sys.Objects 
            WHERE Object_Id = Object_Id(N'[dbo].[U_EFidScfInd_Transfer]') 
                  AND Type = 'u'    )
    DROP TABLE dbo.U_EFidScfInd_Transfer

SELECT 
    EEID

INTO dbo.U_EFidScfInd_Transfer

FROM dbo.U_EFidScfInd_Audit AUD WITH (NOLOCK)

    JOIN dbo.EmpComp EEC WITH (NOLOCK)
        ON AUD.EEID = EEC.EecEEID AND AUD.COID <> EEC.EecCOID

WHERE AUD.AudFieldName = 'EecEmplStatus'

GROUP BY EEID

/* --------------------------------------------------------------------------------------------------------
    Load EEAudit from Audit.
    Group all Audit changes by the ChangeType column. Possible values are:

        'Hire'
        'Termination'
        'Rehire'
        'Leave Of Absence'
        'Return From Leave'
        'Death'
        'Name' - Last Name, First Name, Marital Status, Gender.
        'Date of Birth' 
        'Social Security Number'
        'Address Change' - Address 1, 2, City, State, Zip
        'Annual Salary'
        ,'EecEEType','EecSalaryorHourly','EecPayPeriod'
        'Full Time' - Change to full time EEType = 001
        'UDField22'
-----------------------------------------------------------------------------------------------------------*/
If  EXISTS(    SELECT * FROM Sys.Objects 
            WHERE Object_Id = Object_Id(N'[dbo].[U_EFidScfInd_EEAudit]') 
                  AND Type = 'u'    )
    DROP TABLE dbo.U_EFidScfInd_EEAudit

SELECT 
    EEID = EE.xEEID
    ,COID = MAX(EE.xCOID)
    ,AudDateTime = MAX(AUD.AudDateTime)
    ,AudOldValue = MAX(AUD.AudOldValue)
    ,AudNewValue = MAX(AUD.AudNewValue)
    ,ChangeType = 
        CASE  --Reproduce in Group By
            WHEN AUD.AudFieldName = 'EecWCState' THEN 'Work State'
            WHEN AUD.AudFieldName = 'EecEmplStatus' THEN
                CASE
                    WHEN ISNULL(AUD.AudOldValue,'') = '' 
                        AND ExistingEE.EEID IS NULL    THEN 'Hire'
                    WHEN AUD.AudNewValue = 'R' THEN 'Retire'
                    WHEN AUD.AudOldValue <> 'T' 
                         AND AUD.AudNewValue = 'T' THEN 'Termination'
                    WHEN AUD.AudOldValue = 'T'
                         AND AUD.AudNewValue = 'A' THEN 'Rehire'
                    WHEN AUD.AudOldValue <> 'L'
                         AND AUD.AudNewValue = 'L' THEN 'Leave Of Absence'
                    WHEN AUD.AudOldValue = 'L'
                         AND AUD.AudNewValue <> 'L' THEN 'Return From Leave'
                END
            WHEN AUD.AudFieldName = 'EepDateDeceased' THEN 'Death'
            WHEN AUD.AudAction = 'UPDATE' THEN 
                CASE
                    WHEN AUD.AudFieldName IN('EepNameFirst','EepNameMiddle','EepNameLast','EepMaritalStatus','EepGender')
                            THEN 'Name'
                    WHEN AUD.AudFieldName = 'EepDateOfBirth' THEN 'Date of Birth' 
                    WHEN AUD.AudFieldName = 'EepSSN' THEN 'Social Security Number'
                    WHEN AUD.AudFieldName IN('EepAddressLine1','EepAddressLine2','EepAddressCity'
                                             ,'EepAddressState','EepAddressZipCode')
                            THEN 'Address Change'
                    WHEN AUD.AudFieldName = 'EecAnnSalary' THEN 'Annual Salary'
                    WHEN AUD.AudFieldName = 'EecSalaryorHourly' THEN 'EecSalaryorHourly'
                    WHEN AUD.AudFieldName = 'EecPayPeriod' THEN 'EecPayPeriod'
                    WHEN AUD.AudFieldName = 'EecEEType'
                         AND AUD.AudOldValue = '001'
                         AND AUD.AudNewValue  <> '001' THEN 'EecEEType'
                    WHEN AUD.AudFieldName = 'EecEEType'
                         AND AUD.AudOldValue <> '001'
                         AND AUD.AudNewValue = '001' THEN 'Full Time'
                    WHEN AUD.AudFieldName = 'EecUDField22' 
                         AND ISNULL(AUD.AudOldValue,'N') <> 'Y'
                         AND AUD.AudNewValue = 'Y' THEN 'UDField22'
                    WHEN aud.AudFieldName = 'EecUDField16' AND NULLIF(aud.AudNewValue, '') IS NOT NULL THEN 'UDField16' -- (WC SR-2019-00240938)
					 WHEN aud.AudFieldName = 'EecUDField21' AND NULLIF(aud.AudNewValue, '') IS NOT NULL THEN 'UDField21' -- (WC SR-2019-00240938)
                END
        END
            
INTO dbo.U_EFidScfInd_EEAudit

FROM dbo.U_EFidScfInd_EEList EE WITH (NOLOCK)

    JOIN dbo.U_EFidScfInd_Audit AUD WITH (NOLOCK)
        ON     EE.xEEID = AUD.EEID
            AND EE.xCOID = AUD.COID

    LEFT OUTER JOIN dbo.U_EFidScfInd_Transfer ExistingEE
        ON EE.xEEID = ExistingEE.EEID

GROUP BY
    EE.xEEID
    ,    CASE  --Reproduce in Group By
            WHEN AUD.AudFieldName = 'EecWCState' THEN 'Work State'    
            WHEN AUD.AudFieldName = 'EecEmplStatus' THEN
                CASE
                    WHEN ISNULL(AUD.AudOldValue,'') = '' 
                        AND ExistingEE.EEID IS NULL    THEN 'Hire'
                    WHEN AUD.AudNewValue = 'R' THEN 'Retire'
                    WHEN AUD.AudOldValue <> 'T' 
                         AND AUD.AudNewValue = 'T' THEN 'Termination'
                    WHEN AUD.AudOldValue = 'T'
                         AND AUD.AudNewValue = 'A' THEN 'Rehire'
                    WHEN AUD.AudOldValue <> 'L'
                         AND AUD.AudNewValue = 'L' THEN 'Leave Of Absence'
                    WHEN AUD.AudOldValue = 'L'
                         AND AUD.AudNewValue <> 'L' THEN 'Return From Leave'
                END
            WHEN AUD.AudFieldName = 'EepDateDeceased' THEN 'Death'
            WHEN AUD.AudAction = 'UPDATE' THEN 
                CASE
                    WHEN AUD.AudFieldName IN('EepNameFirst','EepNameMiddle','EepNameLast','EepMaritalStatus','EepGender')
                            THEN 'Name'
                    WHEN AUD.AudFieldName = 'EepDateOfBirth' THEN 'Date of Birth' 
                    WHEN AUD.AudFieldName = 'EepSSN' THEN 'Social Security Number'
                    WHEN AUD.AudFieldName IN('EepAddressLine1','EepAddressLine2','EepAddressCity'
                                             ,'EepAddressState','EepAddressZipCode')
                            THEN 'Address Change'
                    WHEN AUD.AudFieldName = 'EecAnnSalary' THEN 'Annual Salary'
                    WHEN AUD.AudFieldName = 'EecSalaryorHourly' THEN 'EecSalaryorHourly'
                    WHEN AUD.AudFieldName = 'EecPayPeriod' THEN 'EecPayPeriod'
                    WHEN AUD.AudFieldName = 'EecEEType'
                         AND AUD.AudOldValue = '001'
                         AND AUD.AudNewValue  <> '001' THEN 'EecEEType'
                    WHEN AUD.AudFieldName = 'EecEEType'
                         AND AUD.AudOldValue <> '001'
                         AND AUD.AudNewValue = '001' THEN 'Full Time'
                    WHEN AUD.AudFieldName = 'EecUDField22' 
                         AND ISNULL(AUD.AudOldValue,'N') <> 'Y'
                         AND AUD.AudNewValue = 'Y' THEN 'UDField22'
                    WHEN aud.AudFieldName = 'EecUDField16' AND NULLIF(aud.AudNewValue, '') IS NOT NULL THEN 'UDField16' -- (WC SR-2019-00240938)
					WHEN aud.AudFieldName = 'EecUDField21' AND NULLIF(aud.AudNewValue, '') IS NOT NULL THEN 'UDField21' -- (WC SR-2019-00240938)
                END
        END

/* ---------------------------------------------------------------------------------------------------
    Clean-up the Audit table.
    Removed Audit records that don't have a qualified change.
------------------------------------------------------------------------------------------------------*/
DELETE AUD
FROM dbo.U_EFidScfInd_EEAudit AUD
WHERE AUD.ChangeType IS NULL

/* ---------------------------------------------------------------------------------------------------
    Load _Transfer10x with Company to Company transfer into compay 1010S, 1010A, 1054S, 1054A.
------------------------------------------------------------------------------------------------------*/
If  EXISTS(    SELECT * FROM Sys.Objects 
            WHERE Object_Id = Object_Id(N'[dbo].[U_EFidScfInd_Transfer10x]') 
                  AND Type = 'u'    )
    DROP TABLE dbo.U_EFidScfInd_Transfer10x

SELECT     
    EEID = EE.xEEID
    ,CompanyCode = MAX(CMP.CmpCompanyCode)

INTO dbo.U_EFidScfInd_Transfer10x

FROM dbo.U_EFidScfInd_EEList EE WITH (NOLOCK)

    JOIN dbo.U_EFidScfInd_Audit AUD WITH (NOLOCK)
        ON     EE.xEEID = AUD.EEID
            AND EE.xCOID = AUD.COID

    JOIN dbo.Company CMP WITH (NOLOCK)
        ON EE.xCOID = CMP.CmpCOID

WHERE
    AUD.AudFieldName = 'EecEmplStatus'
    AND AUD.AudOldValue = 'T'
    AND AUD.AudNewValue = 'A'
    AND CMP.CmpCompanyCode IN('1010S','1010A','1054S','1054A')

GROUP BY 
    EE.xEEID

/* ---------------------------------------------------------------------------------------------------
    Remove Company Transfers:  
    JobChangeReason = ‘TRI’ should be reported if EecUDField22 changes to 'Y'
------------------------------------------------------------------------------------------------------*/
DELETE EE

--select ee.*
FROM dbo.U_EFidScfInd_EEList EE
    
    JOIN dbo.EmpComp EEC WITH (NOLOCK)
        ON EE.xEEID = EEC.EecEEID AND EE.xCOID = EEC.EecCOID
        
    LEFT OUTER
    JOIN dbo.U_EFidScfInd_EEAudit AUD WITH (NOLOCK)
        ON EE.xEEID = AUD.EEID AND EE.xCOID = AUD.COID
            AND AUD.ChangeType = 'UDField22'

WHERE
    EEC.EecJobChangeReason = 'TRI' OR EEC.EecJobChangeReason = 'TRB'
    AND AUD.EEID IS NULL

/*-----------------------------------------------------------------------------------
    Future Dated New Hires will be moved to the table _Future_Hires and not 
    be processed in the export being created. 
-------------------------------------------------------------------------------------*/
If  NOT EXISTS(    SELECT * FROM Sys.Objects 
            WHERE Object_Id = Object_Id(N'[dbo].[U_EFidScfInd_Future_Hires]') 
                  AND Type = 'u'    )
BEGIN
    --DROP TABLE dbo.U_EFidScfInd_Future_Hires
    CREATE TABLE dbo.U_EFidScfInd_Future_Hires
        (EEID CHAR(12), COID CHAR(5), AudDateTime DATETIME, AudOldValue VARCHAR(2000) 
         ,AudNewValue VARCHAR(2000) , ChangeType VARCHAR(22), EecDateOfLastHire DATETIME)
END

INSERT INTO dbo.U_EFidScfInd_Future_Hires
SELECT 
    AUD.EEID, AUD.COID, AUD.AudDateTime, AUD.AudOldValue, AUD.AudNewValue
    ,AUD.ChangeType, EEC.EecDateOfLastHire
--select * from u_efidscfind_future_Hires
FROM dbo.U_EFidScfInd_EEAudit AUD WITH (NOLOCK)

    JOIN dbo.EmpComp EEC WITH (NOLOCK)
        ON AUD.EEID = EEC.EecEEID AND AUD.COID = EEC.EecCOID

WHERE Aud.ChangeType = 'HIRE'
    AND EEC.EecDateOfLastHire > @EndDate
    AND EEC.EecEEID + EEC.EecCOID
        NOT IN(SELECT EEID+COID FROM dbo.U_EFidScfInd_Future_Hires)

--
-- Removed Furtures from _AUD.
--
DELETE AUD
FROM dbo.U_EFidScfInd_EEAudit AUD
WHERE AUD.EEID + AUD.COID IN(SELECT EEID+COID FROM dbo.U_EFidScfInd_Future_Hires)

--
-- Add Future Dates Records that are now within the Begin/End dates being
-- run into the _Audit table.
--
INSERT INTO dbo.U_EFidScfInd_EEAudit
SELECT FutAud.EEID, FutAud.COID, FutAud.AudDateTime, FutAud.AudOldValue
    ,FutAud.AudNewValue, FutAud.ChangeType

FROM dbo.U_EFidScfInd_Future_Hires FutAud
    
    LEFT OUTER
    JOIN dbo.U_EFidScfInd_EEAudit AUD WITH (NOLOCK)
        ON FutAud.EEID = AUD.EEID 
            AND FUTAud.COID = AUD.COID
            AND AUD.ChangeType = 'HIRE'

WHERE FutAud.EecDateOfLastHire BETWEEN @StartDate AND @EndDate
    AND AUD.EEID IS NULL
    
/*-----------------------------------------------------------------------------------
    Future Dated Terms will be moved to the table _Future_Terms and not 
    be processed in the export being created. 
-------------------------------------------------------------------------------------*/
If  NOT EXISTS(    SELECT * FROM Sys.Objects 
            WHERE Object_Id = Object_Id(N'[dbo].[U_EFidScfInd_Future_terms]') 
                  AND Type = 'u'    )
BEGIN
    --DROP TABLE dbo.U_EFidScfInd_Future_terms
    CREATE TABLE dbo.U_EFidScfInd_Future_terms
        (EEID CHAR(12), COID CHAR(5), AudDateTime DATETIME, AudOldValue VARCHAR(2000) 
         ,AudNewValue VARCHAR(2000) , ChangeType VARCHAR(22), eecdateoftermination DATETIME)
END

INSERT INTO dbo.U_EFidScfInd_Future_terms
SELECT 
    AUD.EEID, AUD.COID, AUD.AudDateTime, AUD.AudOldValue, AUD.AudNewValue
    ,AUD.ChangeType, EEC.eecdateoftermination
--select * from u_efidscfind_future_Hires
FROM dbo.U_EFidScfInd_EEAudit AUD WITH (NOLOCK)

    JOIN dbo.EmpComp EEC WITH (NOLOCK)
        ON AUD.EEID = EEC.EecEEID AND AUD.COID = EEC.EecCOID

WHERE Aud.ChangeType = 'termination'
    AND EEC.eecdateoftermination > @EndDate
    AND EEC.EecEEID + EEC.EecCOID
        NOT IN(SELECT EEID+COID FROM dbo.U_EFidScfInd_Future_terms)

--
-- Removed Furtures from _AUD.
--
DELETE AUD
FROM dbo.U_EFidScfInd_EEAudit AUD
WHERE AUD.EEID + AUD.COID IN(SELECT EEID+COID FROM dbo.U_EFidScfInd_Future_terms)

--
-- Add Future Dates Records that are now within the Begin/End dates being
-- run into the _Audit table.
--
INSERT INTO dbo.U_EFidScfInd_EEAudit
SELECT FutAud.EEID, FutAud.COID, FutAud.AudDateTime, FutAud.AudOldValue
    ,FutAud.AudNewValue, FutAud.ChangeType

FROM dbo.U_EFidScfInd_Future_terms FutAud
    
    LEFT OUTER
    JOIN dbo.U_EFidScfInd_EEAudit AUD WITH (NOLOCK)
        ON FutAud.EEID = AUD.EEID 
            AND FUTAud.COID = AUD.COID
            AND AUD.ChangeType = 'Termination'

WHERE FutAud.eecdateoftermination BETWEEN @StartDate AND @EndDate
    AND AUD.EEID IS NULL

/* --------------------------------------------------------------------------------------------------------
    Load Qualified Employees into _EEList2 table.

    A record should be on the file if:  
    •    A change has been keyed into any of the fields included in the file,
        including New Hires, Rehires and Terms. 
    •    And the employee is in Company Code ('1010S','1054A','1054S')
    •    And 
    (The employee type is in ('001') And Local Union Code not in ('UFW')
    OR
    Employee User Defined Field 22 = 'Y')
    
----------------------------------------------------------------------------------------------------------- */
DECLARE @CompanyList VARCHAR(MAX), @ExcludeUnionList VARCHAR(MAX)
DECLARE @PriorYearMonth CHAR(6)

SET @CompanyList = '1010S,1054S' -- (WC SR-2019-00240938)
SET @ExcludeUnionList = 'UFW'
SET @PriorYearMonth = --YYYYMM of Prior Month of export run.
    STR(DATEPART(yy,DATEADD(mm,-1,@ExportDate)),4,0)
    + dbo.fn_PadZero(DATEPART(mm,DATEADD(mm,-1,@ExportDate)),2,0)

IF  EXISTS(    SELECT * FROM Sys.Objects 
            WHERE Object_Id = Object_Id(N'[dbo].[U_EFidScfInd_EEList2]') 
                  AND Type = 'u'    )
    DROP TABLE dbo.U_EFidScfInd_EEList2

SELECT
    xEEID = EE.xEEID
    ,xCOID = EE.xCOID
    ,SSN = MAX(EEP.EepSSN)

INTO dbo.U_EFidScfInd_EEList2

FROM dbo.U_EFidScfInd_EEList EE

    JOIN dbo.EmpPers EEP WITH (NOLOCK)
        ON EE.xEEID = EEP.EepEEID

    JOIN dbo.EmpComp EEC WITH (NOLOCK)
        ON EE.xEEID = EEC.EecEEID AND EE.xCOID = EEC.EecCOID

    JOIN dbo.Company CMP WITH (NOLOCK)
        ON EE.xCOID = CMP.CmpCOID

    JOIN (    SELECT EEID, COID
            FROM dbo.U_EFidScfInd_EEAudit 
            GROUP BY EEID, COID ) AUD
        ON EE.xEEID = AUD.EEID AND EE.xCOID = AUD.COID

WHERE 
    CMP.CmpCompanyCode IN(SELECT Item FROM dbo.fn_ListToTable(@CompanyList))
    AND (    (    EEC.EecEEType IN('001','002','012', '005', '009', '011', '007', '003') -- (WC SR-2019-00240938)
                AND ISNULL(EEC.EecUnionLocal,'')
                    NOT IN(SELECT Item FROM dbo.fn_ListToTable(@ExcludeUnionList))
            )
          OR
              (    ISNULL(EEC.EecUdField22,'')  = 'Y'    )
        )

GROUP BY
    EE.xEEID
    ,EE.xCOID

/* ---------------------------------------------------------------------------------------------------
    2nd Clean-up the Audit table.
    Remove Audit Records for employees Transfered with TRI.
    Remove employees not eligible for reporting.
------------------------------------------------------------------------------------------------------*/
DELETE AUD
FROM dbo.U_EFidScfInd_EEAudit AUD
    LEFT OUTER 
    JOIN dbo.U_EFidScfInd_EEList2 EE WITH (NOLOCK)
        ON AUD.EEID = EE.xEEID AND AUD.COID = EE.xCOID
WHERE 
    EE.xEEID IS NULL
    OR AUD.ChangeType IS NULL

/* ---------------------------------------------------------------------------------------------------
    H01.
    Test Header.
    Load Header into driver U_EFidScfInd_H01. Only used with Session is TEST.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_H01]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_H01

IF @ExportCode = 'TEST'
BEGIN
    SELECT 
        drvTest_File_Identifier_01 = 'TESTEDT'
        ,drvFiller_02 = ''    
    INTO dbo.U_EFidScfInd_H01

END

ELSE

BEGIN
    SELECT TOP 0
        drvTest_File_Identifier_01 = 'TESTEDT'
        ,drvFiller_02 = ''
    INTO dbo.U_EFidScfInd_H01
END

/* ---------------------------------------------------------------------------------------------------
    H02.
    Load Header into driver U_EFidScfInd_H02. 
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_H02]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_H02
    
SELECT
    drvPLAN_NUMBER_1 = '23514' 
    ,drvRECORD_IDENTIFIER_2 = 'THR' 
    ,drvFILLER_3 = ''
    ,drvTYPE_OF_ACCOUNT_4 = 'PENSION' 
    ,drvRESERVED_5 = ''
    ,drvCLIENT_NAME_6 = 'ALTRIA' 
    ,drvCHANGES_ONLY_FILE_INDICATOR_7 = 'Y' 
    ,drvRESERVED_8 = ''
    ,drvRESERVED_9 = ''
    ,drvFILLER_10 = ''

INTO dbo.U_EFidScfInd_H02

/* ---------------------------------------------------------------------------------------------------
    Load 01_Data with the employees that get an 01 record.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_01_Data]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_01_Data

SELECT
    EEID = EE.xEEID
    ,COID = EE.xCOID
    ,SSN = MAX(EE.SSN)
    
INTO dbo.U_EFidScfInd_01_Data

FROM dbo.U_EFidScfInd_EEList2 EE WITH (NOLOCK)

    JOIN dbo.U_EFidScfInd_EEAudit AUD WITH (NOLOCK)
        ON EE.xEEID = AUD.EEID AND EE.xCOID = AUD.COID
    
WHERE AUD.ChangeType IN('Hire','Rehire','Name','Full Time','UDField22')
    
GROUP BY 
    EE.xEEID
    ,EE.xCOID

/* ---------------------------------------------------------------------------------------------------
    Record 01.
    Load Employees into driver U_EFidScfInd_01_D03.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_01_D03]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_01_D03

SELECT 
    EEID = Data.EEID
    ,COID = Data.COID
    ,SSN = Data.SSN
    ,SORT2 = CAST('' AS CHAR(32))
    ,drvPLAN_NUMBER_1 = case when eecunionlocal = 'TEAM' then '23511' else '23514' end
    ,drvBATCH_GROUP_ID_2 = '' 
    ,drvFILLER_3 = '' 
    ,drvSOCIAL_SECURITY_NUMBER_4 = dbo.fn_SSNDash(Data.SSN)
    ,drvEMPLOYEE_ID_5 = '' 
    ,drvFILLER_6 = '' 
    ,drvRECORD_IDENTIFIER_7 = '01' 
    ,drvLAST_NAME_8 = 
        RTRIM(UPPER(EEP.EepNAMELAST))
        + CASE 
            WHEN ISNULL(EEP.EepNAMESUFFIX,'Z') <> 'Z' THEN 
                    ' ' + UPPER(EEP.EepNameSuffix)
            ELSE ''
          END
    ,drvFIRST_NAME_MIDDLE_INITIAL_9 = 
        RTRIM(UPPER(EEP.EepNAMEFIRST))
        + CASE
            WHEN ISNULL(EEP.EepNameMiddle,'') <> '' THEN 
                ' ' + UPPER(LEFT(EEP.EepNAMEMIDDLE,1))
            ELSE ''
          END
    ,drvRESERVED_10 = REPLICATE('0',9)
    ,drvMARITAL_STATUS_11 = 
        CASE
            WHEN EEP.EepMARITALSTATUS = 'M' THEN 'M'
            WHEN EEP.EepMARITALSTATUS IN('S','D','W') THEN 'S' 
            ELSE ''
        END
    ,drvGENDER_12 = EEP.EepGENDER 
    ,drvSPECIAL_TAX_TYPE_ID_13 = '' 
    ,drvFILLER_14 = '' 
    ,drvBENE_QDRO_PAYEE_15 = ''                                                                                     

INTO dbo.U_EFidScfInd_01_D03

FROM dbo.U_EFidScfInd_01_Data Data WITH (NOLOCK)

    JOIN dbo.EmpPers EEP WITH (NOLOCK)
        ON Data.EEID = EEP.EepEEID
    Join empcomp with (nolock)
        on eeceeid = data.eeid and eeccoid = data.coid

/* ---------------------------------------------------------------------------------------------------
    Load 02D_Data with the employees that get a 02D record.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_02D_Data]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_02D_Data

SELECT
    EEID = EE.xEEID
    ,COID = EE.xCOID
    ,SSN = MAX(EE.SSN)

INTO dbo.U_EFidScfInd_02D_Data

FROM dbo.U_EFidScfInd_EEList2 EE WITH (NOLOCK)

    JOIN dbo.U_EFidScfInd_EEAudit AUD WITH (NOLOCK)
        ON EE.xEEID = AUD.EEID AND EE.xCOID = AUD.COID
    
WHERE AUD.ChangeType IN('Hire','Rehire','Full Time','UDField22','Date of Birth')
    
GROUP BY 
    EE.xEEID
    ,EE.xCOID

/* ---------------------------------------------------------------------------------------------------
    Record 02D.
    Load Employees into driver U_EFidScfInd_02D_D04.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_02D_D04]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_02D_D04

SELECT 
    EEID = Data.EEID
    ,COID = Data.COID
    ,SSN = Data.SSN
    ,SORT2 = CAST('' AS CHAR(32))
    ,drvPLAN_NUMBER_1 = case when eecunionlocal = 'TEAM' then '23511' else '23514' end 
    ,drvBATCH_GROUP_ID_2 = '' 
    ,drvFILLER_3 = '' 
    ,drvSOCIAL_SECURITY_NUMBER_4 = dbo.fn_SSNDash(Data.SSN) 
    ,drvEMPLOYEE_ID_5 = '' 
    ,drvFILLER_6 = '' 
    ,drvRECORD_IDENTIFIER_7 = '02' 
    ,drvFIELD_TYPE_8 = 'D' 
    ,drvFILLER_9 = '' 
    ,drvHIRE_DATE_10 = REPLICATE('0',8)
    ,drvPARTICIPATION_DATE_11 = REPLICATE('0',8)
    ,drvVESTING_DATE_12 = REPLICATE('0',8) 
    ,drvBIRTH_DATE_13 = REPLACE(CONVERT(CHAR(10),EEP.EEPDATEOFBIRTH,101),'/','')
    ,drvTERMINATION_DATE_14 = REPLICATE('0',8)
    ,drvDATE_SWITCH_15 = '' 
    ,drvRESERVED_16 = '' 
    ,drvFILLER_17 = '' 
    ,drvASSOCIATION_INDICATOR_18 = '' 

INTO dbo.U_EFidScfInd_02D_D04

FROM dbo.U_EFidScfInd_02D_Data Data WITH (NOLOCK)

    JOIN dbo.EmpPers EEP WITH (NOLOCK)
        ON Data.EEID = EEP.EepEEID
    Join empcomp with (nolock)
        on eeceeid = data.eeid and eeccoid = data.coid

/* ---------------------------------------------------------------------------------------------------
    Load 02E_Data with the employees that get a 02E record.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_02E_Data]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_02E_Data

SELECT
    EEID = EE.xEEID
    ,COID = EE.xCOID
    ,SSN = MAX(EE.SSN)

INTO dbo.U_EFidScfInd_02E_Data

FROM dbo.U_EFidScfInd_EEList2 EE WITH (NOLOCK)

    JOIN dbo.U_EFidScfInd_EEAudit AUD WITH (NOLOCK)
        ON EE.xEEID = AUD.EEID AND EE.xCOID = AUD.COID
    
WHERE AUD.ChangeType IN('Hire','Rehire','Full Time','UDField22','Social Security Number')
    
GROUP BY 
    EE.xEEID
    ,EE.xCOID
    
/* ---------------------------------------------------------------------------------------------------
    Record 02E.
    Load Employees into driver U_EFidScfInd_02E_D05.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_02E_D05]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_02E_D05

SELECT 
    EEID = Data.EEID
    ,COID = Data.COID
    ,SSN = Data.SSN
    ,SORT2 = CAST('' AS CHAR(32))
    ,drvPLAN_NUMBER_1 = case when eecunionlocal = 'TEAM' then '23511' else '23514' end
    ,drvBATCH_GROUP_ID_2 = '' 
    ,drvFILLER_3 = '' 
    ,drvSOCIAL_SECURITY_NUMBER_4 = dbo.fn_SSNDash(Data.SSN) 
    ,drvEMPLOYEE_ID_5 = '' 
    ,drvFILLER_6 = '' 
    ,drvRECORD_IDENTIFIER_7 = '02' 
    ,drvFIELD_TYPE_8 = 'E' 
    ,drvEmployee_Number_9 = LTRIM(EEC.EecEmpNo)
    ,drvReserved_10 = ''
    ,drvReserved_11 = ''
    ,drvReserved_12 = ''
    ,drvFiller_13 = ''

INTO dbo.U_EFidScfInd_02E_D05

FROM dbo.U_EFidScfInd_02E_Data Data WITH (NOLOCK)

    JOIN dbo.EmpComp EEC WITH (NOLOCK)
        ON Data.EEID = EEC.EecEEID AND Data.COID = EEC.EecCOID

/* ---------------------------------------------------------------------------------------------------
    Load 03_Data with the employees that get a 03,04,05 record.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_03_Data]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_03_Data

SELECT
    EEID = EE.xEEID
    ,COID = EE.xCOID
    ,SSN = MAX(EE.SSN)

INTO dbo.U_EFidScfInd_03_Data

FROM dbo.U_EFidScfInd_EEList2 EE WITH (NOLOCK)

    JOIN dbo.U_EFidScfInd_EEAudit AUD WITH (NOLOCK)
        ON EE.xEEID = AUD.EEID AND EE.xCOID = AUD.COID
    
WHERE AUD.ChangeType IN('Hire','Rehire','Full Time','UDField22','Address Change')
    
GROUP BY 
    EE.xEEID
    ,EE.xCOID

/* ---------------------------------------------------------------------------------------------------
    Record 03.
    Load Employees into driver U_EFidScfInd_03_D06.
    Each employee gets 3 records for Address1, 2 and a blank record.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_03_D06]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_03_D06

SELECT 
    EEID = Data.EEID
    ,COID = Data.COID
    ,SSN = Data.SSN
    ,SORT2 = CAST('1' AS CHAR(32))
    ,drvPLAN_NUMBER_1 = case when eecunionlocal = 'TEAM' then '23511' else '23514' end
    ,drvBATCH_GROUP_ID_2 = '' 
    ,drvFILLER_3 = '' 
    ,drvSOCIAL_SECURITY_NUMBER_4 = dbo.fn_SSNDash(Data.SSN) 
    ,drvEMPLOYEE_ID_5 = '' 
    ,drvFILLER_6 = '' 
    ,drvRECORD_IDENTIFIER_7 = '03' 
    ,drvFIELD_TYPE_8 = 'P' 
    ,drvADDRESS_LINE_NUMBER_9 = '01'
    ,drvADDRESS_10 = UPPER(EEP.EepAddressLine1)
    ,drvFILLER_11 = ''
    ,drvMAILING_INDICATOR_12 = 'Y'
    ,drvADDRESS_CHANGE_SOURCE_13 = '' 
    ,drvOMIT_STATEMENT_INDICATOR_14 = ''
    ,drvASSOCIATION_INDICATOR_15 = ''

INTO dbo.U_EFidScfInd_03_D06

FROM dbo.U_EFidScfInd_03_Data Data WITH (NOLOCK)

    JOIN dbo.EmpPers EEP WITH (NOLOCK)
        ON Data.EEID = EEP.EepEEID
    Join empcomp with (nolock)
        on eeceeid = data.eeid and eeccoid = data.coid

UNION ALL

SELECT
    EEID = Data.EEID
    ,COID = Data.COID
    ,SSN = Data.SSN
    ,SORT2 = CAST('2' AS CHAR(32))
    ,drvPLAN_NUMBER_1 = case when eecunionlocal = 'TEAM' then '23511' else '23514' end
    ,drvBATCH_GROUP_ID_2 = '' 
    ,drvFILLER_3 = '' 
    ,drvSOCIAL_SECURITY_NUMBER_4 = dbo.fn_SSNDash(Data.SSN) 
    ,drvEMPLOYEE_ID_5 = '' 
    ,drvFILLER_6 = '' 
    ,drvRECORD_IDENTIFIER_7 = '03' 
    ,drvFIELD_TYPE_8 = 'P' 
    ,drvADDRESS_LINE_NUMBER_9 = '02'
    ,drvADDRESS_10 = UPPER(EEP.EepAddressLine2)
    ,drvFILLER_11 = ''
    ,drvMAILING_INDICATOR_12 = 'Y'
    ,drvADDRESS_CHANGE_SOURCE_13 = '' 
    ,drvOMIT_STATEMENT_INDICATOR_14 = ''
    ,drvASSOCIATION_INDICATOR_15 = ''

FROM dbo.U_EFidScfInd_03_Data Data WITH (NOLOCK)

    JOIN dbo.EmpPers EEP WITH (NOLOCK)
        ON Data.EEID = EEP.EepEEID
    Join empcomp with (nolock)
        on eeceeid = data.eeid and eeccoid = data.coid

UNION ALL

SELECT
    EEID = Data.EEID
    ,COID = Data.COID
    ,SSN = Data.SSN
    ,SORT2 = CAST('3' AS CHAR(32))
    ,drvPLAN_NUMBER_1 = case when eecunionlocal = 'TEAM' then '23511' else '23514' end 
    ,drvBATCH_GROUP_ID_2 = '' 
    ,drvFILLER_3 = '' 
    ,drvSOCIAL_SECURITY_NUMBER_4 = dbo.fn_SSNDash(Data.SSN) 
    ,drvEMPLOYEE_ID_5 = '' 
    ,drvFILLER_6 = '' 
    ,drvRECORD_IDENTIFIER_7 = '03' 
    ,drvFIELD_TYPE_8 = 'P' 
    ,drvADDRESS_LINE_NUMBER_9 = '03'
    ,drvADDRESS_10 = ''
    ,drvFILLER_11 = ''
    ,drvMAILING_INDICATOR_12 = 'Y'
    ,drvADDRESS_CHANGE_SOURCE_13 = '' 
    ,drvOMIT_STATEMENT_INDICATOR_14 = ''
    ,drvASSOCIATION_INDICATOR_15 = ''

FROM dbo.U_EFidScfInd_03_Data Data WITH (NOLOCK)
join empcomp with (nolock)
    on eeceeid = data.eeid and eeccoid = data.coid

/* ---------------------------------------------------------------------------------------------------
    Record 04.
    Load Employees into driver U_EFidScfInd_04_D07.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_04_D07]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_04_D07

SELECT 
    EEID = Data.EEID
    ,COID = Data.COID
    ,SSN = Data.SSN
    ,SORT2 = CAST('' AS CHAR(32))
    ,drvPLAN_NUMBER_1 = case when eecunionlocal = 'TEAM' then '23511' else '23514' end 
    ,drvBATCH_GROUP_ID_2 = '' 
    ,drvFILLER_3 = '' 
    ,drvSOCIAL_SECURITY_NUMBER_4 = dbo.fn_SSNDash(Data.SSN) 
    ,drvEMPLOYEE_ID_5 = '' 
    ,drvFILLER_6 = '' 
    ,drvRECORD_IDENTIFIER_7 = '04' 
    ,drvFIELD_TYPE_8 = 'P' 
    ,drvCITY_9 = UPPER(EEP.EepAddressCity)
    ,drvSTATE_10 = EEP.EepAddressState
    ,drvFILLER_11 = ''
    ,drvZIP_CODE_12 = LEFT(EEP.EepAddressZipCode,5)
    ,drvZIP_4_CODE_13 = SUBSTRING(EEP.EepAddressZipCode,6,4)
    ,drvFILLER_14 = ''
    ,drvMAILING_INDICATOR_15 = 'Y'
    ,drvADDRESS_CHANGE_SOURCE_16 = ''
    ,drvOMIT_STATEMENT_INDICATOR_17 = '' 
    ,drvASSOCIATION_INDICATOR_18 = ''

INTO dbo.U_EFidScfInd_04_D07

FROM dbo.U_EFidScfInd_03_Data Data WITH (NOLOCK)

    JOIN dbo.EmpPers EEP WITH (NOLOCK)
        ON Data.EEID = EEP.EepEEID
    Join empcomp with (nolock)
        on eeceeid = data.eeid and eeccoid = data.coid

/* ---------------------------------------------------------------------------------------------------
    Record 05.
    Not Used.
------------------------------------------------------------------------------------------------------*/

/* ---------------------------------------------------------------------------------------------------
    Load BS_Data with the employees that get a BS Record.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_BS_Data]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_BS_Data

SELECT
    EEID = EE.xEEID
    ,COID = EE.xCOID
    ,SSN = MAX(EE.SSN)
    ,ChangeTYpe = MAX(AUD.ChangeTYpe)

INTO dbo.U_EFidScfInd_BS_Data

FROM dbo.U_EFidScfInd_EEList2 EE WITH (NOLOCK)

    JOIN dbo.U_EFidScfInd_EEAudit AUD WITH (NOLOCK)
        ON EE.xEEID = AUD.EEID AND EE.xCOID = AUD.COID
    
WHERE AUD.ChangeType IN('Hire','Rehire','Full Time','UDField22','Annual Salary')
    
GROUP BY 
    EE.xEEID
    ,EE.xCOID

/* ---------------------------------------------------------------------------------------------------
    Record BS.
    Load Employees into driver U_EFidScfInd_BS_D09.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_BS_D09]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_BS_D09

SELECT 
    EEID = Data.EEID
    ,COID = Data.COID
    ,SSN = Data.SSN
    ,SORT2 = CAST('' AS CHAR(32))
    ,drvFiller_1 = ''
    ,drvSOCIAL_SECURITY_NUMBER_2 = dbo.fn_SSNDash(Data.SSN) 
    ,drvFILLER_3 = '' 
    ,drvRECORD_IDENTIFIER_4 = 'BS' 
    ,drvScheduled_Amount_5 = dbo.dsi_fnNegOPunch(EEC.EecAnnSalary,13,2)
    ,drvScheduled_Amount_Effective_Date_6 = 
        REPLACE(CONVERT(CHAR(10),EJH.MaxJobEffDate,101),'/','')
    ,drvType_Code_7 = ''
    ,drvFiller_8 = ''

INTO dbo.U_EFidScfInd_BS_D09

FROM dbo.U_EFidScfInd_BS_Data Data WITH (NOLOCK)

    JOIN dbo.EmpComp EEC WITH (NOLOCK)
        ON Data.EEID = EEC.EecEEID AND Data.COID = EEC.EecCOID

    LEFT OUTER
    JOIN (    SELECT EjhEEID, EjhCOID
                ,MaxJobEffDate = MAX(EjhJobEffDate)
            FROM dbo.EmpHJob EJH WITH (NOLOCK)    
            WHERE 
                EjhIsRateChange = 'Y'
                AND EjhEEID + EjhCOID 
                    + CONVERT(CHAR(8),EjhJobEffDate,112) 
                    + CONVERT(CHAR(19),EjhDateTimeCreated,120)
                IN 
                (SELECT EjhEEID + EjhCOID 
                        + CONVERT(CHAR(8),MAX(EjhJobEffDate),112) 
                        + CONVERT(CHAR(19),MAX(EjhDateTimeCreated),120)
                 FROM dbo.EmpHJob WITH (NOLOCK)
                 WHERE EjhJobEffDate <= @EndDate
                 GROUP BY EjhEEID, EjhCOID)  
            GROUP BY EjhEEID, EjhCOID    ) EJH
        ON Data.EEID = EJH.EjhEEID AND Data.COID = EJH.EjhCOID

/* ---------------------------------------------------------------------------------------------------
    Load BG_Data with the employees that get a BG Record.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_BG_Data]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_BG_Data

SELECT
    EEID = EE.xEEID
    ,COID = EE.xCOID
    ,SSN = MAX(EE.SSN)
    --,ChangeType = AUD.ChangeType --RH: MAX(AUD.ChangeType)
    ,ChangeType = MAX(AUD.ChangeType) --RH: restored per case# 11824341

INTO dbo.U_EFidScfInd_BG_Data

FROM dbo.U_EFidScfInd_EEList2 EE WITH (NOLOCK)

    JOIN dbo.U_EFidScfInd_EEAudit AUD WITH (NOLOCK)
        ON EE.xEEID = AUD.EEID AND EE.xCOID = AUD.COID
    
WHERE AUD.ChangeType 
    IN('Hire','Rehire','Full Time','UDField22'
        ,'Death'
        ,'Return from Leave','Termination','Leave Of Absence'
        ,'UDField16') -- (WC SR-2019-00240938)
    
GROUP BY 
    EE.xEEID
    ,EE.xCOID
    ,AUD.ChangeType

/* ---------------------------------------------------------------------------------------------------
    Record BG.
    Load Employees into driver U_EFidScfInd_BG_D10.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_BG_D10]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_BG_D10

SELECT 
    EEID = Data.EEID
    ,COID = Data.COID
    ,SSN = Data.SSN
    ,SORT2 = CAST('' AS CHAR(32))
    ,drvPLAN_NUMBER_1 = case when eecunionlocal = 'TEAM' then '23511' else '23514' end
    ,drvBATCH_GROUP_ID_2 = '' 
    ,drvFILLER_3 = '' 
    ,drvSOCIAL_SECURITY_NUMBER_4 = dbo.fn_SSNDash(Data.SSN)
    ,drvEMPLOYEE_ID_5 = '' 
    ,drvFILLER_6 = '' 
    ,drvRECORD_IDENTIFIER_7 = 'BG' 
    ,drvEVENT_SEQUENCE_NUMBER_8 = '01' 
    ,drvEVENT_EFFECTIVE_DATE_9 = 
        CASE
            WHEN Data.ChangeType IN('Hire','Rehire') THEN
                REPLACE(CONVERT(CHAR(10),EEC.EecDateOfLastHire,101),'/','')
            WHEN Data.ChangeType = 'Termination' THEN
                REPLACE(CONVERT(CHAR(10),EEC.EecDateOfTermination,101),'/','')
            WHEN Data.ChangeType = 'Leave of Absence' THEN 
                REPLACE(CONVERT(CHAR(10),EshLOA.MaxStatusStartDate,101),'/','')
            WHEN Data.ChangeType = 'Return From Leave' THEN 
                REPLACE(CONVERT(CHAR(10),DATEADD(dd,-1,EshLOA.MaxStatusStopDate),101),'/','') 
            WHEN Data.ChangeType = 'UDField16' AND eec.EecEEType = '003' AND NULLIF(eec.EecUnionLocal, '') IS NOT NULL THEN REPLACE(CONVERT(CHAR(10),EEC.EecUdField16,101),'/','') -- (WC SR-2019-00240938)
        END
    ,drvEVENT_CODE_10 = 
        CASE
            WHEN Data.ChangeType = 'Hire' THEN 'HIR'
            WHEN Data.ChangeType = 'Rehire' THEN 'REH'
            WHEN Data.ChangeType = 'Termination' THEN
                CASE
                    WHEN EEC.EecTermReason IN('800','810','820') THEN 'DTH'
                    ELSE 'TER'
                END
            WHEN Data.ChangeType = 'Leave of Absence' THEN 'LOA'
--???Await customer SOW changes for Item 10.            
            WHEN Data.ChangeType = 'Return From Leave' THEN 'RFL'
			WHEN Data.ChangeType = 'UDField16' AND eec.EecEEType = '003' AND NULLIF(eec.EecUnionLocal, '') IS NULL THEN 'DTA' -- (WC SR-2019-00240938)
        END
    ,drvEVENT_REASON_CODE_11 = 
        CASE
            WHEN Data.ChangeType = 'Termination'
                 AND EEC.EecTermReason IN('900','910','920','930','940','950', '960', '970') -- (WC SR-2019-00240938)
                            THEN 'RET'
            WHEN Data.ChangeType = 'Leave of Absence' THEN 
                CASE
                    WHEN EEC.EecLeaveReason IN('LLTD','1130','1140') THEN 'LTD'
                     WHEN EEC.EecLeaveReason = 'SEVPP' THEN 'PMU'
                     WHEN EEC.EecLeaveReason IN('LSTD','LSTD3') THEN 'STD'
                     WHEN EEC.EecLeaveReason IN('LWC','LWCFML','LWCUP') THEN 'WC'
                     WHEN EEC.EecLeaveReason IN('300','LMIL') THEN 'LTM'
                    WHEN LCH.LchType = 'SEV' 
                         AND EEC.EecLeaveReason NOT IN('SEVPP','SEVNEW') THEN 'SEV'
                    ELSE ''
                END
            WHEN Data.ChangeType = 'Retire' THEN 'LOF'
			WHEN Data.ChangeType = 'UDField16' AND eec.EecEEType = '003' AND NULLIF(eec.EecUnionLocal, '') IS NULL THEN 'CHG' -- (WC SR-2019-00240938)
            ELSE ''
        END        
--????? Awit customer SOW Changes for Item 11.
    ,drvRETIREMENT_IDENTIFICATION_CODE_12 = 
		CASE -- (WC SR-2019-00240938)
	        WHEN Data.ChangeType IN ('HIRE', 'Rehire') AND eec.EecEEType IN ('003', '005', '009', '007', '011') AND NULLIF(eec.EecUnionLocal, '') IS NULL THEN 'N999'
	        ELSE CASE WHEN Data.ChangeType IN ('HIRE', 'Rehire', 'UDField16') THEN 'WINE' ELSE '' END
	    END
        --CASE
        --    WHEN Data.ChangeType IN('Hire','Rehire') THEN
        --            CASE
        --                WHEN ISNULL(EEC.EecUnionLocal,'') = 'TEAM' THEN 'SALDEF'
        --                ELSE 'WINE'
        --            END
        --    ELSE ''
        --END
    ,drvFILLER_13 = '' 
    ,drvRESERVED_14 = '' 

INTO dbo.U_EFidScfInd_BG_D10

FROM dbo.U_EFidScfInd_BG_Data Data WITH (NOLOCK)

    JOIN dbo.EmpComp EEC WITH (NOLOCK)
        ON Data.EEID = EEC.EecEEID AND Data.COID = EEC.EecCOID

    LEFT OUTER
    JOIN dbo.LoaReasn LCH WITH (NOLOCK)
        ON EEC.EecLeaveReason = LCH.LchCode

    LEFT OUTER
    JOIN (    SELECT EshEEID, EshCOID
                ,MaxStatusStartDate = MAX(EshStatusStartDate)
                ,MaxStatusStopDate = MAX(EshStatusStopDate)
            FROM dbo.EmpHStat WITH (NOLOCK)    
            WHERE 
                EshEEID + EshCOID 
                    + CONVERT(CHAR(19),EshStatusStartdate,120) 
                IN 
                (SELECT EshEEID + EshCOID 
                        + CONVERT(CHAR(19),MAX(EshStatusStartDate),120) 
                 FROM dbo.EmpHStat WITH (NOLOCK)
                 WHERE ISNULL(EshStatusStopDate,'01/01/1900') <= @EndDate
                        AND EshEmplStatus = 'L'
                 GROUP BY EshEEID, EshCOID)  
            GROUP BY EshEEID, EshCOID    ) EshLOA
        ON Data.EEID = EshLOA.EshEEID AND Data.COID = EshLOA.EshCOID

/* ---------------------------------------------------------------------------------------------------
    Load EC_Data with the employees that get a EC Record.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_EC_Data]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_EC_Data

SELECT
    EEID = EE.xEEID
    ,COID = EE.xCOID
    ,SSN = MAX(EE.SSN)
    ,ChangeType = MAX(AUD.ChangeType)
    ,AudDateTime = MAX(AUD.AudDateTime)
    ,AudNewValue = MAX(AUD.AudNewValue)
    ,AudOldValue = MAX(AUD.AudOldValue)

INTO dbo.U_EFidScfInd_EC_Data

FROM dbo.U_EFidScfInd_EEList2 EE WITH (NOLOCK)

    JOIN dbo.U_EFidScfInd_EEAudit AUD WITH (NOLOCK)
        ON EE.xEEID = AUD.EEID AND EE.xCOID = AUD.COID
    
WHERE AUD.ChangeType 
    IN('UDField22','Hire','Rehire'
        ,'EecEEType','EecSalaryorHourly','EecPayPeriod', 'UDField16', 'UDField12', 'UDField21')
    
GROUP BY 
    EE.xEEID
    ,EE.xCOID

/* ---------------------------------------------------------------------------------------------------
    Record EC.
    Load Employees into driver U_EFidScfInd_EC_D11.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_EC_D11]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_EC_D11

SELECT 
    EEID = Data.EEID
    ,COID = Data.COID
    ,SSN = Data.SSN
    ,SORT2 = CAST('1' AS CHAR(32))
    ,drvFILLER_1 = '' 
    ,drvSOCIAL_SECURITY_NUMBER_2 = dbo.fn_SSNDash(Data.SSN)
    ,drvFILLER_3 = '' 
    ,drvRECORD_IDENTIFIER_4 = 'EC' 
    ,drvCODE_VALUE_5 = 
		CASE -- (WC SR-2019-00240938)
			WHEN EecEEType = '003' AND Peh1000Hrs = 'Y' THEN 
				CASE
					WHEN eec.EecJobChangeReason = '100' THEN 'N'
					WHEN eec.EecJobChangeReason <> '100' THEN 'Y'
					WHEN Data.audOldValue = '001' AND Data.AudNewValue = '003' THEN 'Y'
					WHEN eec.EecEEType = '003' AND EecJobChangeReason = '101' AND EecUDField23 = 'Y' THEN 'Y'
					ELSE 'N'
				END

	        WHEN Data.ChangeType IN('HIRE','Rehire') AND eec.EecEEType IN ('003', '005', '009', '007', '011') AND NULLIF(eec.EecUnionLocal, '') IS NULL THEN 'T'
			WHEN Data.ChangeType IN('HIRE','Rehire') AND eec.EecEEType IN ('001', '002', '012') AND NULLIF(eec.EecUnionLocal, '') IS NULL THEN 'F'
			WHEN Data.ChangeType = 'UDField12' AND eec.EecEEType = '003' AND NULLIF(eec.EecUnionLocal, '') IS NULL THEN 'P'
			WHEN Data.ChangeType = 'EecEEType' AND Data.AudNewValue IN ('001', '002', '012') THEN 'F'
			WHEN Data.ChangeType = 'EecEEType' AND Data.AudNewValue IN ('003', '005', '011') THEN 'P'
			WHEN Data.ChangeType = 'EecSalaryorHourly' THEN Data.AudNewValue
            WHEN Data.ChangeType = 'EecPayPeriod' THEN Data.AudNewValue
			WHEN Data.ChangeType IN('HIRE','Rehire', 'UDFIeld12') AND eec.EecEEType IN ('001', '002', '012', '003') AND NULLIF(eec.EecUnionLocal, '') IS NULL THEN 'R'
			WHEN Data.ChangeType = 'UDField21' AND eec.EecFullTimeOrPartTime = 'P' THEN eec.EecUDField21
	    END
    --    CASE
    --        WHEN Data.ChangeType IN('HIRE','Rehire') THEN
    --            CASE
    --                WHEN EEC.EecEEType in ('001','012') THEN 'F'    --9/24/14 GS SF 4236856    --Reg FT
    --                WHEN EEC.EecEEType = '002' THEN 'E'        --Reg PT
    --                WHEN EEC.EecEEType IN('003','005','011') THEN 'P'    --FT Temp
    --            END
    --        WHEN Data.ChangeType = 'EecEEType' 
    --             AND Data.AudOldValue IN('001','002')
    --             AND Data.AudNewValue IN('003','005','011') THEN 'T'
    --        WHEN Data.ChangeType = 'EecEEType' 
    --             AND Data.AudOldValue IN('003','005','011')
    --             AND Data.AudNewValue IN('001','002') THEN 'R' 
    --        WHEN Data.ChangeType = 'EecEEType' THEN
    --            CASE
    --                WHEN Data.AudNewValue = '001' THEN 'F'
    --                WHEN Data.AudNewValue = '002' THEN 'E'
    --                WHEN Data.AudNewValue IN('003','005','011') THEN 'P'
    --            END
    --        WHEN Data.ChangeType = 'EecSalaryorHourly' THEN Data.AudNewValue
    --        WHEN Data.ChangeType = 'EecPayPeriod' THEN Data.AudNewValue
    --    END            
    ,drvCODE_TYPE_6 = 
        CASE
            WHEN Data.ChangeType IN('HIRE','Rehire') THEN '104'
            WHEN Data.ChangeType = 'EecEEType' THEN '104'
            WHEN Data.ChangeType = 'EecSalaryOrHourly' THEN '105'
			WHEN Data.ChangeType = 'EecPayPeriod' THEN '106'
            WHEN Data.ChangeType = 'EecEEType' AND Data.AudOldValue IN('001','002') AND Data.AudNewValue IN('003','005','011') THEN '107'
			WHEN  Data.ChangeType = 'EecEEType' AND Data.AudOldValue = '001' AND Data.AudNewValue = '003' THEN '113' -- (WC SR-2019-00240938)
			WHEN EecEEType = '003' AND Peh1000Hrs = 'Y' THEN '113' -- (WC SR-2019-00240938)
			WHEN EecEEType = '003' AND EecJobChangeReason = '100' THEN '113' -- (WC SR-2019-00240938)
			WHEN Data.ChangeType = 'UDField21' AND eec.EecFullTimeOrPartTime = 'P' THEN '113' -- (WC SR-2019-00240938)
        END
    ,drvEFFECTIVE_DATE_7 = REPLACE(CONVERT(CHAR(10),Data.AudDateTime,101),'/','')
    ,drvFILLER_8 = '' 
    ,drvUSAGE_INDICATOR_9 = ''                                                                                                                                                                                                                                                                                                                                                                     

INTO dbo.U_EFidScfInd_EC_D11

FROM dbo.U_EFidScfInd_EC_Data Data

    JOIN dbo.EmpComp EEC WITH (NOLOCK) ON Data.EEID = EEC.EecEEID AND Data.COID = EEC.EecCOID
LEFT JOIN ( -- (WC SR-2019-00240938)
	SELECT DISTINCT 
		PehEEID
		,PehCurHrs = SUM(CASE WHEN PehInclInDefCompHrs = 'Y' THEN PehCurHrs ELSE 0.00 END)
		,Peh1000Hrs = CASE WHEN SUM(CASE WHEN PehInclInDefCompHrs = 'Y' THEN PehCurHrs ELSE 0.00 END) >= 1000 THEN 'Y' ELSE 'N' END
	FROM dbo.PEarHist WITH (NOLOCK)
	WHERE PehPerControl BETWEEN CONCAT(YEAR(@EndDate), '01011') AND @EndPerControl
	GROUP BY PehEEID
) peh 
	ON PehEEID = DATA.EEID

UNION ALL

SELECT 
    EEID = Data.EEID
    ,COID = Data.COID
    ,SSN = Data.SSN
    ,SORT2 = CAST('2' AS CHAR(32))
    ,drvFILLER_1 = '' 
    ,drvSOCIAL_SECURITY_NUMBER_2 = dbo.fn_SSNDash(Data.SSN)
    ,drvFILLER_3 = '' 
    ,drvRECORD_IDENTIFIER_4 = 'EC' 
    ,drvCODE_VALUE_5 = EEC.EecSalaryorHourly
    ,drvCODE_TYPE_6 = '105'
    ,drvEFFECTIVE_DATE_7 = REPLACE(CONVERT(CHAR(10),Data.AudDateTime,101),'/','')
    ,drvFILLER_8 = '' 
    ,drvUSAGE_INDICATOR_9 = ''                                                                                                                                                                                                                                                                                                                                                                     

FROM dbo.U_EFidScfInd_EC_Data Data

    JOIN dbo.EmpComp EEC WITH (NOLOCK) ON Data.EEID = EEC.EecEEID AND Data.COID = EEC.EecCOID

WHERE Data.ChangeType IN('HIRE','Rehire')

UNION ALL

SELECT 
    EEID = Data.EEID
    ,COID = Data.COID
    ,SSN = Data.SSN
    ,SORT2 = CAST('3' AS CHAR(32))
    ,drvFILLER_1 = '' 
    ,drvSOCIAL_SECURITY_NUMBER_2 = dbo.fn_SSNDash(Data.SSN)
    ,drvFILLER_3 = '' 
    ,drvRECORD_IDENTIFIER_4 = 'EC' 
    ,drvCODE_VALUE_5 = EEC.EecPayPeriod
    ,drvCODE_TYPE_6 = '106'
    ,drvEFFECTIVE_DATE_7 = REPLACE(CONVERT(CHAR(10),Data.AudDateTime,101),'/','')
    ,drvFILLER_8 = '' 
    ,drvUSAGE_INDICATOR_9 = ''                                                                                                                                                                                                                                                                                                                                                                     

FROM dbo.U_EFidScfInd_EC_Data Data

    JOIN dbo.EmpComp EEC WITH (NOLOCK) ON Data.EEID = EEC.EecEEID AND Data.COID = EEC.EecCOID

WHERE Data.ChangeType IN('HIRE','Rehire')

UNION ALL

SELECT 
    EEID = Data.EEID
    ,COID = Data.COID
    ,SSN = Data.SSN
    ,SORT2 = CAST('4' AS CHAR(32))
    ,drvFILLER_1 = '' 
    ,drvSOCIAL_SECURITY_NUMBER_2 = dbo.fn_SSNDash(Data.SSN)
    ,drvFILLER_3 = '' 
    ,drvRECORD_IDENTIFIER_4 = 'EC' 
    ,drvCODE_VALUE_5 = 
        CASE
            WHEN EEC.EecEEType IN('003','005','011') THEN 'T'
            ELSE 'R'
        END
    ,drvCODE_TYPE_6 = '107'
    ,drvEFFECTIVE_DATE_7 = REPLACE(CONVERT(CHAR(10),Data.AudDateTime,101),'/','')
    ,drvFILLER_8 = '' 
    ,drvUSAGE_INDICATOR_9 = ''                                                                                                                                                                                                                                                                                                                                                                     

FROM dbo.U_EFidScfInd_EC_Data Data

    JOIN dbo.EmpComp EEC WITH (NOLOCK) ON Data.EEID = EEC.EecEEID AND Data.COID = EEC.EecCOID

WHERE Data.ChangeType IN('HIRE','Rehire')

/* ---------------------------------------------------------------------------------------------------
    Load HU27_Data with the employees that get a HU27 Record.
    Hire,Rehire,FullTime,UDField22 changes.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_HU27_Data]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_HU27_Data

SELECT
    EEID = EE.xEEID
    ,COID = EE.xCOID
    ,SSN = MAX(EE.SSN)
    ,ChangeType = MAX(AUD.ChangeType)

INTO dbo.U_EFidScfInd_HU27_Data

FROM dbo.U_EFidScfInd_EEList2 EE WITH (NOLOCK)

    JOIN dbo.U_EFidScfInd_EEAudit AUD WITH (NOLOCK)
        ON EE.xEEID = AUD.EEID AND EE.xCOID = AUD.COID

WHERE AUD.ChangeType 
    IN('Hire','Rehire','Full Time','UDField22')
    
GROUP BY 
    EE.xEEID
    ,EE.xCOID

/* ---------------------------------------------------------------------------------------------------
    Record HU27.
    Load Employees into driver U_EFidScfInd_HU27_D12.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_HU27_D12]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_HU27_D12

SELECT 
    EEID = Data.EEID
    ,COID = Data.COID
    ,SSN = Data.SSN
    ,SORT2 = CAST('' AS CHAR(32))
    ,drvPLAN_NUMBER_1 = case when eecunionlocal = 'TEAM' then '23511' else '23514' end
    ,drvFILLER_2 = '' 
    ,drvSOCIAL_SECURITY_NUMBER_3 = dbo.fn_SSNDash(Data.SSN) 
    ,drvEMPLOYEE_ID_4 = '' 
    ,drvFILLER_5 = '' 
    ,drvRECORD_IDENTIFIER_6 = 'HU' 
    ,drvLOCATION_SEQUENCE_NUMBER_7 ='' 
    ,drvLOCATION_CODE_8 = 'SMWE' 
    ,drvLOCATION_TYPE_CODE_9 = '27' 
    ,drvLOCATION_EFFECTIVE_DATE_10 = 
        REPLACE(CONVERT(CHAR(10),EEC.EecDateofLasthire,101),'/','')
    ,drvFILLER_11 = '' 

INTO dbo.U_EFidScfInd_HU27_D12

FROM dbo.U_EFidScfInd_HU27_Data Data

    JOIN dbo.EmpComp EEC WITH (NOLOCK)
        ON Data.EEID = EEC.EecEEID AND Data.COID = EEC.EecCOID

/* ---------------------------------------------------------------------------------------------------
    Load HU10_Data with the employees that get a HU10 Record.
    Hire,Rehire,FT/PT(EecFullTimeOrPartTime),Hourly/Salary(EecSalaryorHourly) Changes.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_HU10_Data]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_HU10_Data

SELECT
    EEID = EE.xEEID
    ,COID = EE.xCOID
    ,SSN = MAX(EE.SSN)
    ,CostCenter =
		CASE -- (WC SR-2019-00240938)
	        WHEN cmp.CmpCompanyCode = '1010S' THEN 
				CASE
					WHEN eec.EecEEType <> '002' AND eec.EecSalaryOrHourly = 'S' AND eec.EecFullTimeOrPartTime = 'F' THEN 'SM0001' 
					WHEN eec.EecEEType <> '002' AND eec.EecSalaryOrHourly = 'H' AND eec.EecFullTimeOrPartTime = 'F' THEN 'SM0002'
					WHEN eec.EecEEType <> '002' AND eec.EecSalaryOrHourly = 'H' AND eec.EecFullTimeOrPartTime = 'P' THEN 'SM0003'
					WHEN eec.EecEEType = '002' THEN 'SM0003'
				END
			WHEN cmp.CmpCompanyCode = '1010S' AND eec.EecEEType <> '002' THEN  
				CASE
					WHEN eec.EecSalaryOrHourly = 'S' AND eec.EecFullTimeOrPartTime = 'F' THEN 'SM1' 
					WHEN eec.EecSalaryOrHourly = 'H' AND eec.EecFullTimeOrPartTime = 'F' THEN 'SM2'
					WHEN eec.EecSalaryOrHourly = 'H' AND eec.EecFullTimeOrPartTime = 'P' THEN 'SM3'
				END
	        WHEN cmp.CmpCompanyCode = '1054S' THEN 
				CASE
					WHEN eec.EecSalaryOrHourly = 'S' AND eec.EecFullTimeOrPartTime = 'F' THEN 'SL0001' 
					WHEN eec.EecSalaryOrHourly = 'H' AND eec.EecFullTimeOrPartTime = 'F' THEN 'SL0002'
					WHEN eec.EecSalaryOrHourly = 'H' AND eec.EecFullTimeOrPartTime = 'P' THEN 'SL0003'
				END
			WHEN cmp.CmpCompanyCode = '1054S' AND eec.EecEEType <> '002' THEN  
				CASE
					WHEN eec.EecSalaryOrHourly = 'S' AND eec.EecFullTimeOrPartTime = 'F' THEN 'SL1' 
				END 					  
	    END 
        --CASE 
        --    WHEN CMP.CmpCompanyCode = '1010S' 
        --         AND EEC.EecSalaryorHourly = 'S' 
        --         AND EEC.EecEEType IN('001','012') THEN 'SM0001' 
        --    WHEN Cmp.CmpCompanyCode IN('1054S')
        --         AND EEC.EecSalaryorHourly = 'S'
        --         AND EEC.EecEEType IN('001','012') THEN 'SL0001'
        --    WHEN Cmp.CmpCompanyCode IN('1010S')
        --         AND EEC.EecSalaryorHourly = 'H'
        --         AND EEC.EecEEType IN('001','012') THEN 'SM0002'
        --    WHEN Cmp.CmpCompanyCode IN('1054S')
        --         AND EEC.EecSalaryorHourly = 'H'
        --         AND EEC.EecEEType IN('001','012') THEN 'SL0002'
        --    WHEN Cmp.CmpCompanyCode IN('1010S')
        --         AND EEC.EecSalaryorHourly = 'H'
        --         AND EEC.EecEEType IN('002') THEN 'SM0003'
        --    WHEN Cmp.CmpCompanyCode IN('1054S')
        --         AND EEC.EecSalaryorHourly = 'H'
        --         AND EEC.EecEEType IN('002') THEN 'SL0003'
        --END
    ,Transfer_CompanyCode = MAX(TRANF.CompanyCode)
    ,ChangeType = MAX(AUD.ChangeType)

INTO dbo.U_EFidScfInd_HU10_Data

FROM dbo.U_EFidScfInd_EEList2 EE WITH (NOLOCK)

    JOIN dbo.Company CMP WITH (NOLOCK)
        ON EE.xCOID = CMP.CmpCOID

    JOIN dbo.EmpComp EEC WITH (NOLOCK)
        ON EE.xEEID = EEC.EecEEID AND EE.xCOID = EEC.EecCOID

    JOIN dbo.U_EFidScfInd_EEAudit AUD WITH (NOLOCK)
        ON EE.xEEID = AUD.EEID AND EE.xCOID = AUD.COID

    LEFT OUTER JOIN dbo.U_EFidScfInd_Transfer10x TRANF WITH (NOLOCK)
        ON EE.xEEID = TRANF.EEID

WHERE 
    AUD.ChangeType IN('Hire','Rehire','EecFullTimeOrPartTime','EecSalaryorHourly')
    OR TRANF.EEID IS NOT NULL  --Transfers
    
GROUP BY 
    Cmp.CmpCompanyCode
    ,EEC.EecSalaryOrHourly
    ,EEC.EecEETYpe
    ,EE.xEEID
    ,EE.xCOID
	,eec.EecFullTimeOrPartTime
    
/* ---------------------------------------------------------------------------------------------------
    Record HU10.
    Load Employees into driver U_EFidScfInd_HU10_D13.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_HU10_D13]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_HU10_D13

SELECT 
    EEID = Data.EEID
    ,COID = Data.COID
    ,SSN = Data.SSN
    ,SORT2 = CAST('' AS CHAR(32))
    ,drvPLAN_NUMBER_1 = case when eecunionlocal = 'TEAM' then '23511' else '23514' end
    ,drvFILLER_2 = '' 
    ,drvSOCIAL_SECURITY_NUMBER_3 = dbo.fn_SSNDash(Data.SSN) 
    ,drvEMPLOYEE_ID_4 = '' 
    ,drvFILLER_5 = '' 
    ,drvRECORD_IDENTIFIER_6 = 'HU' 
    ,drvLOCATION_SEQUENCE_NUMBER_7 ='' 
    ,drvLOCATION_CODE_8 = Data.CostCenter
    ,drvLOCATION_TYPE_CODE_9 = '10' 
    ,drvLOCATION_EFFECTIVE_DATE_10 = 
        REPLACE(CONVERT(CHAR(10),EEC.EecDateofLasthire,101),'/','')
    ,drvFILLER_11 = '' 

INTO dbo.U_EFidScfInd_HU10_D13

FROM dbo.U_EFidScfInd_HU10_Data Data

    JOIN dbo.EmpComp EEC WITH (NOLOCK)
        ON Data.EEID = EEC.EecEEID AND Data.COID = EEC.EecCOID

/* ---------------------------------------------------------------------------------------------------
    Load HU20_Data with the employees that get a HU20 Record.
    Hire,Rehire,Work State Changes.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_HU20_Data]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_HU20_Data

SELECT
    EEID = EE.xEEID
    ,COID = EE.xCOID
    ,SSN = MAX(EE.SSN)
    ,CostCenter = 
		CASE -- (WC SR-2019-00240938)
	        WHEN cmp.CmpCompanyCode = '1010S' THEN 
				CASE
					WHEN eec.EecEEType <> '002' AND eec.EecSalaryOrHourly = 'S' AND eec.EecFullTimeOrPartTime = 'F' THEN 'SM0001' 
					WHEN eec.EecEEType <> '002' AND eec.EecSalaryOrHourly = 'H' AND eec.EecFullTimeOrPartTime = 'F' THEN 'SM0002'
					WHEN eec.EecEEType <> '002' AND eec.EecSalaryOrHourly = 'H' AND eec.EecFullTimeOrPartTime = 'P' THEN 'SM0003'
					WHEN eec.EecEEType = '002' THEN 'SM0003'
				END
			WHEN cmp.CmpCompanyCode = '1010S' AND eec.EecEEType <> '002' THEN  
				CASE
					WHEN eec.EecSalaryOrHourly = 'S' AND eec.EecFullTimeOrPartTime = 'F' THEN 'SM1' 
					WHEN eec.EecSalaryOrHourly = 'H' AND eec.EecFullTimeOrPartTime = 'F' THEN 'SM2'
					WHEN eec.EecSalaryOrHourly = 'H' AND eec.EecFullTimeOrPartTime = 'P' THEN 'SM3'
				END
	        WHEN cmp.CmpCompanyCode = '1054S' THEN 
				CASE
					WHEN eec.EecSalaryOrHourly = 'S' AND eec.EecFullTimeOrPartTime = 'F' THEN 'SL0001' 
					WHEN eec.EecSalaryOrHourly = 'H' AND eec.EecFullTimeOrPartTime = 'F' THEN 'SL0002'
					WHEN eec.EecSalaryOrHourly = 'H' AND eec.EecFullTimeOrPartTime = 'P' THEN 'SL0003'
				END
			WHEN cmp.CmpCompanyCode = '1054S' AND eec.EecEEType <> '002' THEN  
				CASE
					WHEN eec.EecSalaryOrHourly = 'S' AND eec.EecFullTimeOrPartTime = 'F' THEN 'SL1' 
				END 					  
	    END 
        --CASE 
        --    WHEN CMP.CmpCompanyCode = '1010S' 
        --         AND EEC.EecSalaryorHourly = 'S' 
        --         AND EEC.EecEEType IN('001','012') THEN 'SM0001' 
        --    WHEN Cmp.CmpCompanyCode IN('1054S','1054A')
        --         AND EEC.EecSalaryorHourly = 'S'
        --         AND EEC.EecEEType IN('001','012') THEN 'SL0001'
        --    WHEN Cmp.CmpCompanyCode IN('1010S')
        --         AND EEC.EecSalaryorHourly = 'H'
        --         AND EEC.EecEEType IN('001','012') THEN 'SM0002'
        --    WHEN Cmp.CmpCompanyCode IN('1054S','1054A')
        --         AND EEC.EecSalaryorHourly = 'H'
        --         AND EEC.EecEEType IN('001','012') THEN 'SL0002'
        --    WHEN Cmp.CmpCompanyCode IN('1010S')
        --         AND EEC.EecSalaryorHourly = 'H'
        --         AND EEC.EecEEType IN('002') THEN 'SM0003'
        --    WHEN Cmp.CmpCompanyCode IN('1054S','1054A')
        --         AND EEC.EecSalaryorHourly = 'H'
        --         AND EEC.EecEEType IN('002') THEN 'SL0003'
        --END
    ,Transfer_CompanyCode = MAX(TRANF.CompanyCode)
    ,ChangeType = MAX(AUD.ChangeType)

INTO dbo.U_EFidScfInd_HU20_Data

FROM dbo.U_EFidScfInd_EEList2 EE WITH (NOLOCK)

    JOIN dbo.Company CMP WITH (NOLOCK)
        ON EE.xCOID = CMP.CmpCOID

    JOIN dbo.EmpComp EEC WITH (NOLOCK)
        ON EE.xEEID = EEC.EecEEID AND EE.xCOID = EEC.EecCOID

    JOIN dbo.U_EFidScfInd_EEAudit AUD WITH (NOLOCK)
        ON EE.xEEID = AUD.EEID AND EE.xCOID = AUD.COID

    LEFT OUTER JOIN dbo.U_EFidScfInd_Transfer10x TRANF WITH (NOLOCK)
        ON EE.xEEID = TRANF.EEID

WHERE 
    AUD.ChangeType IN('Hire','Rehire','Work State')
    OR TRANF.EEID IS NOT NULL
    
GROUP BY 
    Cmp.CmpCompanyCode
    ,EEC.EecSalaryOrHourly
    ,EEC.EecEETYpe
    ,EE.xEEID
    ,EE.xCOID
	,eec.EecFullTimeOrPartTime
    
/* ---------------------------------------------------------------------------------------------------
    Record HU20.
    Load Employees into driver U_EFidScfInd_HU20_D14.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_HU20_D14]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_HU20_D14

SELECT 
    EEID = Data.EEID
    ,COID = Data.COID
    ,SSN = Data.SSN
    ,SORT2 = CAST('' AS CHAR(32))
    ,drvPLAN_NUMBER_1 = case when eecunionlocal = 'TEAM' then '23511' else '23514' end
    ,drvFILLER_2 = '' 
    ,drvSOCIAL_SECURITY_NUMBER_3 = dbo.fn_SSNDash(Data.SSN) 
    ,drvEMPLOYEE_ID_4 = '' 
    ,drvFILLER_5 = '' 
    ,drvRECORD_IDENTIFIER_6 = 'HU' 
    ,drvLOCATION_SEQUENCE_NUMBER_7 ='' 
    ,drvLOCATION_CODE_8 = EEC.EecWCState
    ,drvLOCATION_TYPE_CODE_9 = '20' 
    ,drvLOCATION_EFFECTIVE_DATE_10 = 
        REPLACE(CONVERT(CHAR(10),EEC.EecDateofLasthire,101),'/','')
    ,drvFILLER_11 = '' 

INTO dbo.U_EFidScfInd_HU20_D14

FROM dbo.U_EFidScfInd_HU20_Data Data

    JOIN dbo.EmpComp EEC WITH (NOLOCK)
        ON Data.EEID = EEC.EecEEID AND Data.COID = EEC.EecCOID

/* ---------------------------------------------------------------------------------------------------
    Record HU26.
    Load Employees into driver U_EFidScfInd_HU26_D15.
    Same Filter as HU10.
------------------------------------------------------------------------------------------------------*/
IF  EXISTS ( SELECT * FROM sys.objects 
             WHERE object_id = OBJECT_ID(N'[dbo].[U_EFidScfInd_HU26_D15]') 
             AND TYPE = 'U'    )
    DROP TABLE dbo.U_EFidScfInd_HU26_D15

SELECT 
    EEID = EEC.EecEEID
    ,COID = EEC.EecCOID
    ,SSN = Data.SSN
    ,SORT2 = CAST('' AS CHAR(32))
    ,drvPLAN_NUMBER_1 = case when eecunionlocal = 'TEAM' then '23511' else '23514' end
    ,drvFILLER_2 = '' 
    ,drvSOCIAL_SECURITY_NUMBER_3 = dbo.fn_SSNDash(Data.SSN) 
    ,drvEMPLOYEE_ID_4 = '' 
    ,drvFILLER_5 = '' 
    ,drvRECORD_IDENTIFIER_6 = 'HU' 
    ,drvLOCATION_SEQUENCE_NUMBER_7 ='' 
    ,drvLOCATION_CODE_8 = 
        CASE 
            WHEN CMP.CmpCompanyCode = '1010S' 
                 AND EEC.EecSalaryorHourly = 'S' 
                 AND EEC.EecEEType IN('001','012') THEN 'SM1' 
            WHEN Cmp.CmpCompanyCode IN('1054S','1054A')
                 AND EEC.EecSalaryorHourly = 'S'
                 AND EEC.EecEEType IN('001','012') THEN 'SL1'
            WHEN Cmp.CmpCompanyCode IN('1010S')
                 AND EEC.EecSalaryorHourly = 'H'
                 AND EEC.EecEEType IN('001','012') THEN 'SM2'
            WHEN Cmp.CmpCompanyCode IN('1054S','1054A')
                 AND EEC.EecSalaryorHourly = 'H'
                 AND EEC.EecEEType IN('001','012') THEN 'SL2'
            WHEN Cmp.CmpCompanyCode IN('1010S')
                 AND EEC.EecSalaryorHourly = 'H'
                 AND EEC.EecEEType IN('002') THEN 'SM3'
            WHEN Cmp.CmpCompanyCode IN('1054S','1054A')
                 AND EEC.EecSalaryorHourly = 'H'
                 AND EEC.EecEEType IN('002') THEN 'SL3'
        END
    ,drvLOCATION_TYPE_CODE_9 = '26' 
    ,drvLOCATION_EFFECTIVE_DATE_10 = 
        REPLACE(CONVERT(CHAR(10),EEC.EecDateofLasthire,101),'/','')
    ,drvFILLER_11 = '' 

INTO dbo.U_EFidScfInd_HU26_D15

FROM dbo.U_EFidScfInd_HU10_Data Data

    JOIN dbo.Company CMP WITH (NOLOCK)
        ON Data.COID = CMP.CmpCOID
        
    JOIN dbo.EmpComp EEC WITH (NOLOCK)
        ON Data.EEID = EEC.EecEEID AND Data.COID = EEC.EecCOID

/*********************************
	Record INDICATIVE RECORD 07Y
**********************************/

IF OBJECT_ID ('U_EFidScfInd_07Y_D16') IS NOT NULL -- (WC SR-2019-00240938)
	DROP TABLE dbo.U_EFidScfInd_07Y_D16;
SELECT DISTINCT 
	drvEEID = eec.EecEEID
	,drvCoID = eec.EecCoID
	,SSN = Data.SSN
	,Sort2 = CAST('' AS CHAR(32))
	,drvPlanNumber = CASE WHEN eecunionlocal = 'TEAM' THEN '23511' ELSE '23514' END
	,drvSSN = Data.SSN
	,drv5CharacterAlpha = CASE WHEN eecunionlocal = 'TEAM' THEN 'TEAM' ELSE 'NON' END
INTO dbo.U_EFidScfInd_07Y_D16
FROM dbo.U_EFidScfInd_HU10_Data Data
INNER JOIN dbo.EmpComp eec WITH (NOLOCK)
	ON eec.EecEEID = data.EEID
	AND eec.EecCoID = data.CoID

/* ---------------------------------------------------------------------------------------------------
  Force Filename.
------------------------------------------------------------------------------------------------------*/
UPDATE dbo.U_Dsi_Parameters
SET ExportFile = @ExportFile
WHERE FormatCode = @FormatCode


END
GO
Create View dbo.dsi_vwEFidScfInd_Export as
        select top 2000000 Data from dbo.U_EFidScfInd_File with (nolock)
        order by substring(RecordSet,2,2), InitialSort