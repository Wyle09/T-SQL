--====================
-- V1.0
--====================

SET NOCOUNT ON;
IF OBJECT_ID('U_EVANSFFD_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EVANSFFD_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EVANSFFD_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EVANSFFD' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEVANSFFD_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEVANSFFD_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EVANSFFD') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EVANSFFD];
GO
IF OBJECT_ID('U_EVANSFFD_File') IS NOT NULL DROP TABLE [dbo].[U_EVANSFFD_File];
GO
IF OBJECT_ID('U_EVANSFFD_EEList') IS NOT NULL DROP TABLE [dbo].[U_EVANSFFD_EEList];
GO
IF OBJECT_ID('U_EVANSFFD_AuditFields') IS NOT NULL DROP TABLE [dbo].[U_EVANSFFD_AuditFields];
GO
IF OBJECT_ID('U_EVANSFFD_Audit') IS NOT NULL DROP TABLE [dbo].[U_EVANSFFD_Audit];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EVANSFFD';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EVANSFFD';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EVANSFFD';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EVANSFFD';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EVANSFFD';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhRespectZeroPayRate,AdhCreateTClockBatches,AdhThirdPartyPay) VALUES ('N','C','Y','0','','N','N','','N','','013010','EMPEXPORT','CDE','EVANSFFD','VanguardSFF Demographic Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_SwitchBox','8000','S','N','401KRON20D0','N','Jan  1 1900 12:00AM','C','N','','N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dhvHeaderZeroes"','1','(''UA''=''F'')','401KRON20D0','11','H','01','1','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dhvHeaderIndicator"','2','(''UA''=''F'')','401KRON20D0','3','H','01','12','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dhvFormat"','3','(''UA''=''F'')','401KRON20D0','8','H','01','15','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dhvPlanNumber"','4','(''UA''=''F'')','401KRON20D0','6','H','01','23','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dhvDate"','5','(''UA''=''F'')','401KRON20D0','8','H','01','29','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dhvTime"','6','(''UA''=''F'')','401KRON20D0','6','H','01','37','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dhvFiller1"','7','(''UA''=''F'')','401KRON20D0','7','H','01','43','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dhvFiller2"','8','(''UA''=''F'')','401KRON20D0','31','H','01','50','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPlanId"','1','(''UA''=''F'')','401KRON20D0','6','D','02','1','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSSN"','2','(''UA''=''F'')','401KRON20D0','9','D','02','7','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRecordType"','3','(''UA''=''F'')','401KRON20D0','3','D','02','16','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller1"','4','(''UA''=''F'')','401KRON20D0','22','D','02','19','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvName"','5','(''UA''=''F'')','401KRON20D0','30','D','02','41','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStatus"','6','(''UA''=''F'')','401KRON20D0','2','D','02','71','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddress1"','7','(''UA''=''F'')','401KRON20D0','30','D','02','73','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddress2"','8','(''UA''=''F'')','401KRON20D0','30','D','02','103','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressCity"','9','(''UA''=''F'')','401KRON20D0','18','D','02','133','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dvrState"','10','(''UA''=''F'')','401KRON20D0','3','D','02','151','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvZipCode"','11','(''UA''=''F'')','401KRON20D0','9','D','02','154','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvForeignFlag"','12','(''UA''=''F'')','401KRON20D0','1','D','02','163','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','13','(''UA''=''F'')','401KRON20D0','13','D','02','167','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDepartment"','14','(''UA''=''F'')','401KRON20D0','4','D','02','177','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRegion"','15','(''UA''=''F'')','401KRON20D0','10','D','02','181','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBirthDate"','16','(''UA''=''F'')','401KRON20D0','8','D','02','191','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmploymentDate"','17','(''UA''=''F'')','401KRON20D0','8','D','02','199','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller2"','18','(''UA''=''F'')','401KRON20D0','8','D','02','207','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller3"','19','(''UA''=''F'')','401KRON20D0','8','D','02','215','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvVestingDate"','20','(''UA''=''F'')','401KRON20D0','8','D','02','223','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller4"','21','(''UA''=''F'')','401KRON20D0','8','D','02','231','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTermDate"','22','(''UA''=''F'')','401KRON20D0','8','D','02','239','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTerminationReason"','23','(''UA''=''F'')','401KRON20D0','1','D','02','247','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvKitIndicator"','24','(''UA''=''F'')','401KRON20D0','1','D','02','248','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRehireDate"','25','(''UA''=''F'')','401KRON20D0','8','D','02','249','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller5"','26','(''UA''=''F'')','401KRON20D0','4','D','02','257','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller6"','27','(''UA''=''F'')','401KRON20D0','1','D','02','261','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLoanAmortization"','28','(''UA''=''F'')','401KRON20D0','2','D','02','262','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller7"','29','(''UA''=''F'')','401KRON20D0','34','D','02','264','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPayrollCodeOne"','30','(''UA''=''F'')','401KRON20D0','10','D','02','298','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPayrollCodeTwo"','31','(''UA''=''F'')','401KRON20D0','10','D','02','308','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller8"','32','(''UA''=''F'')','401KRON20D0','1','D','02','318','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEffectiveDate"','33','(''UA''=''F'')','401KRON20D0','8','D','02','319','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller9"','34','(''UA''=''F'')','401KRON20D0','24','D','02','327','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller10"','35','(''UA''=''F'')','401KRON20D0','8','D','02','351','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvChangeType"','36','(''UA''=''F'')','401KRON20D0','1','D','02','359','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller11"','37','(''UA''=''F'')','401KRON20D0','10','D','02','360','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller12"','38','(''UA''=''F'')','401KRON20D0','3','D','02','370','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller13"','39','(''UA''=''F'')','401KRON20D0','10','D','02','373','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller14"','40','(''UA''=''F'')','401KRON20D0','186','D','02','383','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOAType"','41','(''UA''=''F'')','401KRON20D0','1','D','02','569','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOABeginDate"','42','(''UA''=''F'')','401KRON20D0','8','D','02','570','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLOAEndDate"','43','(''UA''=''F'')','401KRON20D0','8','D','02','578','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller15"','44','(''UA''=''F'')','401KRON20D0','315','D','02','586','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPlanId"','1','(''UA''=''F'')','401KRON20D0','6','D','03','1','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSSN"','2','(''UA''=''F'')','401KRON20D0','9','D','03','7','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRecordType"','3','(''UA''=''F'')','401KRON20D0','3','D','03','16','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller0"','4','(''UA''=''F'')','401KRON20D0','22','D','03','19','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSourceCode"','5','(''UA''=''F'')','401KRON20D0','4','D','03','41','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvProcessCode"','6','(''UA''=''F'')','401KRON20D0','4','D','03','45','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFrequency"','7','(''UA''=''F'')','401KRON20D0','2','D','03','49','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCompensationCode"','8','(''UA''=''F'')','401KRON20D0','2','D','03','51','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStartDate"','9','(''UA''=''F'')','401KRON20D0','8','D','03','53','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEndDate"','10','(''UA''=''F'')','401KRON20D0','8','D','03','61','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalary"','11','(''UA''=''F'')','401KRON20D0','15','D','03','69','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller1"','12','(''UA''=''F'')','401KRON20D0','7','D','03','83','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller2"','13','(''UA''=''F'')','401KRON20D0','101','D','03','100','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPlanId"','1','(''UA''=''F'')','401KRON20D0','6','D','04','1','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSSN"','2','(''UA''=''F'')','401KRON20D0','9','D','04','7','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRecordType"','3','(''UA''=''F'')','401KRON20D0','3','D','04','16','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller1"','4','(''UA''=''F'')','401KRON20D0','22','D','04','19','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvWorkEmail"','5','(''UA''=''F'')','401KRON20D0','41','D','04','140','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFiller2"','6','(''UA''=''F'')','401KRON20D0','181','D','04','320','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dtvTrailerNines"','1','(''UA''=''F'')','401KRON20D0','11','T','05','1','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dtvTrailerIndicator"','2','(''UA''=''F'')','401KRON20D0','4','T','05','12','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dtvPlanNumber"','3','(''UA''=''F'')','401KRON20D0','6','T','05','16','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dtvDate"','4','(''UA''=''F'')','401KRON20D0','8','T','05','22','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dtvTime"','5','(''UA''=''F'')','401KRON20D0','6','T','05','30','','','','');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"dtvRecordCount"','6','(''UA''=''F'')','401KRON20D0','10','T','05','36','','','','');
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('No filename needed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'VanguardSFF Demo ONDEMAND','201812149','EMPEXPORT','ONDEMAND','Jun 21 2019 12:06PM','EVANSFFD',NULL,NULL,NULL,'201812149','Dec 14 2018 12:00AM','Dec 30 1899 12:00AM','201812141','5104','','','201812141',dbo.fn_GetTimedKey(),NULL,'BMAYNARD',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('No filename needed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'VanguardSFF Demo SCHEDULED','202006049','EMPEXPORT','SCHEDULED','Jun  4 2020 11:00PM','EVANSFFD',NULL,NULL,NULL,'202006049','Jul 25 2012  3:02PM','Jul 25 2012  3:02PM','202005281','4666','','','202005281',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('No filename needed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Unlock Export Session','201207259','EMPEXPORT','ZAP','Aug 11 2014 11:54PM','EVANSFFD',NULL,NULL,NULL,'201207259','Jul 25 2012  3:02PM','Jul 25 2012  3:02PM','201207251','-99','','','201207251',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFD','EEList','V','Y');
--INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFD','ExportPath','V','\\us.saas\n0\data_exchange\WES1012\Exports\UDES\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFD','ExportPath','V','\\us.saas\ez\Public\10393\Exports_Test\Vanguard\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFD','InitialSort','C','drvSSN');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFD','SubSort','C',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFD','Testing','V','N');
--INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFD','TESTPath','V','\\us.saas\n1\public\10393\exports\Vanguard\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFD','TESTPath','V','\\us.saas\ez\Public\10393\Exports_Test\Vanguard\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFD','UDESPath','V','\\us.saas\n0\data_exchange\WES1012\exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EVANSFFD','UseFileName','V','N');
UPDATE dbo.U_dsi_Configuration SET CfgValue = svCfgValue FROM dbo.U_EVANSFFD_SavePath WHERE CfgName = svCfgName AND FormatCode = svFormatCode AND svCfgValue IS NOT NULL;
IF OBJECT_ID('U_EVANSFFD_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EVANSFFD_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EVANSFFD','H01','u_dsi_drv_DemoGraphic_Headertbl','');
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EVANSFFD','D02','u_dsi_drv_DemoGraphic_RecordAtbl','');
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EVANSFFD','D03','u_dsi_drv_DemoGraphic_RecordKtbl','');
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EVANSFFD','D04','u_dsi_drv_DemoGraphic_RecordXtbl','');
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EVANSFFD','T05','u_dsi_drv_DemoGraphic_Trailertbl','');
IF OBJECT_ID('U_EVANSFFD_Audit') IS NULL
CREATE TABLE [dbo].[U_EVANSFFD_Audit] (
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
IF OBJECT_ID('U_EVANSFFD_AuditFields') IS NULL
CREATE TABLE [dbo].[U_EVANSFFD_AuditFields] (
    [aTableName] varchar(30) NULL,
    [aFieldName] varchar(30) NULL
);
IF OBJECT_ID('U_EVANSFFD_EEList') IS NULL
CREATE TABLE [dbo].[U_EVANSFFD_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EVANSFFD_File') IS NULL
CREATE TABLE [dbo].[U_EVANSFFD_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(50) NOT NULL,
    [SubSort] varchar(50) NOT NULL,
    [SubSort2] varchar(50) NULL,
    [SubSort3] varchar(50) NULL,
    [Data] varchar(8000) NULL
);
GO
 CREATE proc [dbo].[dsi_sp_BuildDriverTables_EVANSFFD] 
(@SystemID varchar(15))
AS

/*------------------------------------------------------------------------------------
Revision History
-----------------
Update By            Date            SF Num            Desc
Spencer Williams    06/03/2015        05416493        Updating drvName to report '' when EepNameSuffix is 'Z'
Emy Rogers            06/14/2017        SR-2017-00161137    Update LOA Records
DHernandez            08.18.17        SF09508016        Changed Reference date from GetDate() to @EndDate.
DHernandez            08.18.17        SF09508016        Corrected logic to report on terminations based on employee status.
JKurth                09/27/17        SF09669954        Updated WHERE logic to look back 21 days for EecDateOfTermination
JKurth                06/20/2019        N/A                Updated  LoanAmortization and PayrollCodeOne to account for biweekly vs weekly pay periods
Wyle Cordero		06/17/2020		  SR-2020-00270504	Update logic for alternate vesting date

EXEC dbo.dsi_sp_TestSwitchbox_v2 'EVANSFFD', 'ONDEMAND';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EVANSFFD', 'SCHEDULED';

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EVANSFFD';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EVANSFFD';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EVANSFFD';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EVANSFFD';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EVANSFFD' ORDER BY RunID DESC;
*/------------------------------------------------------------------------------------

if exists (select null from sys.tables where name='u_dsi_drv_DemoGraphic_Headertbl')
    drop table dbo.u_dsi_drv_DemoGraphic_Headertbl
if exists (select null from sys.tables where name='u_dsi_drv_DemoGraphic_RecordAtbl')
    drop table dbo.u_dsi_drv_DemoGraphic_RecordAtbl
if exists (select null from sys.tables where name='u_dsi_drv_DemoGraphic_RecordKtbl')
    drop table dbo.u_dsi_drv_DemoGraphic_RecordKtbl
if exists (select null from sys.tables where name='u_dsi_drv_DemoGraphic_RecordXtbl')
    drop table dbo.u_dsi_drv_DemoGraphic_RecordXtbl
if exists (select null from sys.tables where name='u_dsi_drv_DemoGraphic_Trailertbl')
    drop table dbo.u_dsi_drv_DemoGraphic_Trailertbl



DECLARE @startdate varchar(12),
        @enddate varchar (12),
        @startpercontrol char(9),
        @endpercontrol char(9),
        @date varchar (8),
        @time varchar(6),
        @formatcode varchar(12),
        @exportcode varchar(12),
        @count int

IF (SELECT FormatCode FROM U_dsi_Parameters WHERE SystemID = @SystemID) = 'EVANSFFD' 
BEGIN
SELECT @StartDate = case when exportcode ='ONDEMAND' then cast(substring(StartPerControl,1,8) as datetime) else CONVERT (VARCHAR (10),dateadd (dd,-7,getdate()),112) end
    , @EndDate = case when exportcode in ('ONDEMAND') then cast(substring(EndPerControl,1,8) as datetime) else CONVERT (VARCHAR(10),getdate(),112) end
    , @StartPerControl = case when exportcode in ('ONDEMAND') then StartPerControl else convert(varchar,dateadd (dd,-7,getdate()),112)+'1' end
    , @EndPerControl = case when exportcode in ('ONDEMAND') then EndPerControl else  convert(varchar,getdate(),112)+'9' end
    , @Formatcode = Formatcode
    , @Exportcode = Exportcode
FROM dbo.U_dsi_Parameters with (nolock)
    where FormatCode = 'EVANSFFD'
END

select @date=CONVERT(varchar(10),getdate(),112),@time=right (replace(replace(replace(replace(CONVERT (varchar(20),getdate(),121),' ',''),':',''),'-',''),'.',''),6)

    --==========================================
    -- Audit Section
    --==========================================
    -- Get data from audit fields table. Add fields here if auditing
    IF OBJECT_ID('U_EVANSFFD_AuditFields','U') IS NOT NULL
        DROP TABLE dbo.U_EVANSFFD_AuditFields;
    CREATE TABLE dbo.U_EVANSFFD_AuditFields (aTableName varchar(30),aFieldName varchar(30));

    INSERT INTO dbo.U_EVANSFFD_AuditFields VALUES ('EmpComp','EecEmplStatus ');

    -- Create audit table based on fields defined above
    IF OBJECT_ID('U_EVANSFFD_Audit','U') IS NOT NULL
        DROP TABLE dbo.U_EVANSFFD_Audit;
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
    INTO dbo.U_EVANSFFD_Audit
    FROM dbo.U_EVANSFFD_EEList WITH (NOLOCK)
    JOIN dbo.vw_AuditData WITH (NOLOCK) 
        ON audKey1Value = xEEID
    JOIN dbo.U_EVANSFFD_AuditFields WITH (NOLOCK) 
        ON audTableName = aTableName
        AND audFieldName = aFieldName
    WHERE audDateTime BETWEEN @StartDate AND @EndDate
    AND audAction <> 'DELETE'
    AND ISNULL(audNewValue,'') <> ''
    AND audOldValue='L';
--select * FROM  DBO.U_EVANSFFD_EEList where xCOID='055PB'

select '00000000000' dhvHeaderZeroes
,'HDR' dhvHeaderIndicator
,'SFF' dhvFormat
,'091509' dhvPlanNumber
,@date dhvDate
,@Time dhvTime
,'' dhvFiller1
,'' dhvFiller2
into dbo.u_dsi_drv_DemoGraphic_Headertbl


select distinct '091509' drvPlanID
,eepssn drvSSN
,'A' drvRecordType
,SPACE(22) drvFiller1
,upper(ltrim(rtrim(EepNameLast)))+case coalesce(ltrim(rtrim(EepNameSuffix)),'') when '' then '' when 'JR' then ' JR.' when 'Z' then '' else ' '+ upper(ltrim(rtrim(EepNameSuffix))) end +', '+upper(ltrim(rtrim(EepNameFirst)))+' '+upper(LEFT(coalesce(ltrim(rtrim(eepnamemiddle)),''),1))+'.' drvName --S. Williams SF#05416493 6/3/15
,SPACE(2) drvStatus
,upper(EepAddressLine1)drvAddress1
,case eepaddressCountry when 'USA' then upper(EepAddressLine2) else UPPER (eepaddressCity)+' '+EepAddressZipCode end drvAddress2
,case eepaddressCountry when 'USA' then upper(EepAddressCity) else UPPER (eepAddressCountry) end drvAddressCity
,case eepAddressCountry when 'USA' then upper(EepAddressState) else '' end [dvrState]
,case eepAddressCountry when 'USA' then upper(EepAddressZipCode) else '' end [drvZipCode]
,case eepAddressCountry when 'USA' then '' else '1' end [drvForeignFlag]
,EecEmpNo drvEmpNo
,'' [drvDepartment]
,'' [drvRegion]
,convert (varchar (10),EepDateOfBirth,112) [drvBirthDate]
,convert (varchar (10),EecDateOfOriginalHire,112) [drvEmploymentDate]
,'' drvFiller2
,'' drvFiller3
,CASE 
	WHEN EecUDField06 IS NOT NULL THEN convert (varchar(10),EecUDField06,112) 
	WHEN EecDateOfOriginalHire = EecDateOfLastHire THEN FORMAT(EecDateOfLastHire, 'yyyyMMdd')
END

[drvVestingDate] -- (WC SR-SR-2020-00270504)
,'' drvFiller4
--,case when EecDateOfLastHire=EecDateOfOriginalHire then CONVERT(varchar(10),eecDateofTermination,112) else '' end [drvTermDate]
,case when EecEmplStatus='T' then CONVERT(varchar(10),eecDateofTermination,112) else '' end [drvTermDate] -- DH 8.18.17 SF09508016 Corrected logic to report on terminations based on employee status.
--,EecTermReason
,case when EecEmplStatus='T' and EecTermReason='202' then '4' when EecEmplStatus='T' and EecTermReason='209' then '5' when
EecEmplStatus='T' and EecTermReason='203' then '6' when EecEmplStatus='T' and EecTermReason not in ('202','209','203') then '0'
else '' end [drvTerminationReason]
,case eecEmpLstatus when 'T' then '2' else '' end [drvKitIndicator]
,case when EecDateOfOriginalHire<>EecDateOfLastHire then convert (varchar(10),EecDateOfLastHire,112) else NULL end [drvRehireDate]
,'' drvFiller5
,'' drvFiller6
,case eecpayperiod when 'B' then '6' else '7' end [drvLoanAmortization] --JKurth
,'' drvFiller7
,case eecpayperiod when 'B' then 'B' else 'W' end [drvPayrollCodeOne] --Jkurth
,'' [drvPayrollCodeTwo]
,'' drvFiller8
,CONVERT (varchar(10),eecDateofLastHire,112) [drvEffectiveDate]
,'' drvFiller9
,'' drvFiller10
,'1' [drvChangeType]
,'' drvFiller11
,'' drvFiller12
,'' drvFiller13
,'' drvFiller14
,CASE WHEN EecEmplStatus='L' OR audNewValue IS NOT NULL THEN case when eshemplStatusReason='300' then 'M' when eshemplStatusReason<>'300' then 'O' else '' end  ELSE '' END [drvLOAType]
,CASE WHEN EecEmplStatus='L' OR audNewValue IS NOT NULL THEN convert (varchar(10),EshStatusStartDate,112) ELSE '' END [drvLOABeginDate] 
, CASE WHEN EecEmplStatus='L' OR audNewValue IS NOT NULL THEN convert (varchar(10),EshStatusStopDate,112) ELSE '' END [drvLOAEndDate]
,'' drvFiller15
into dbo.u_dsi_drv_DemoGraphic_RecordAtbl
from dbo.U_EVANSFFD_EEList with (nolock)
    join EmpComp with (nolock) on xEEID=EecEEID --and eepHomeCoID=EecCoID
    join EmpPers ON eepEEID=xEEID --and EecCoID=xCOID
    LEFT JOIN dbo.U_EVANSFFD_Audit WITH (NOLOCK) on audEEID=xEEID and audKey2=xCOID
    --join Company on EecCoID =CmpCoID
    left join (select EshEEID, EshStatusStartDate, EshStatusStopDate, EshEmplStatus, eshemplStatusReason from EmpHStat a where EshEmplStatus='L'
        and eshstatusstartdate=(select max(eshstatusstartdate) from EmpHStat b where EshEmplStatus='L' and a.EshEEID = b.EshEEID and a.EshCOID = b.EshCOID)) x on eepEEID=x.EshEEID ---and eepHomeCoID=x.EshCoID
    where EecEEType<>'CON' AND DATEDIFF(YY,eepDateofBirth,GETDATE())>18
    and EecCoID<>'055PB'
    and (EecEmplStatus<>'T'  or (EecEmplStatus='T' and EecDateOfTermination > convert (varchar (10),DATEADD (DD,-21, @EndDate),126))) -- DHernandez 08.18.17 SF09508016 Changed Reference date from GetDate() to @EndDate.
    and eecEEID not in ('6VV6QV0000K0','7X3YEI0000K0') 
order by eepSSN


select '091509' drvPlanID
,eepSSN drvSSN
,'K' drvRecordType
,'' drvFiller0
,'AA' drvSourceCode
,'VMAP' drvProcessCode
,'01' drvFrequency
,'LP' drvCompensationCode
,convert(char(4),YEAR(getdate()))+'0101' drvStartDate
,convert(char(4),YEAR(getdate()))+'1231' drvEndDate
,right('0000000000000'+ replace (convert(varchar(20),EecAnnSalary),'.',''),13)+'+' drvSalary
,'' drvFiller1
,'' drvFiller2
into dbo.u_dsi_drv_DemoGraphic_RecordKtbl
from emppers with (nolock)
    join EmpComp with (nolock) on eepEEID=EecEEID and eepHomeCoID=EecCoID
    join Company with (nolock) on EecCoID =CmpCoID
    --join (select EshEEID, EshCoID, MAX(EshStatusStartDate)EshStatusStartDate from EmpHStat group by EshEEID, EshCoID) x on eepEEID=x.EshEEID and eepHomeCoID=x.EshCoID
    where EecEEType<>'CON' AND DATEDIFF(YY,eepDateofBirth,GETDATE())>18
    and CmpCoID<>'055PB'
    and (EecEmplStatus<>'T'  or (EecEmplStatus='T' and EecDateOfTermination > convert (varchar (10),DATEADD (DD,-14, GETDATE()),126))) 
    and eecEEID not in ('6VV6QV0000K0','7X3YEI0000K0') 
order by eepSSN



select '091509' drvPlanID
,eepSSN drvSSN
,'X' drvRecordType
,'' drvFiller1
,UPPER (ltrim(rtrim(eepAddressEMail))) drvWorkEmail
,'' drvFiller2
into dbo.u_dsi_drv_DemoGraphic_RecordXtbl
from emppers
    join EmpComp on eepEEID=EecEEID and eepHomeCoID=EecCoID
    join Company on EecCoID =CmpCoID
    --join (select EshEEID, EshCoID, MAX(EshStatusStartDate)EshStatusStartDate from EmpHStat group by EshEEID, EshCoID) x on eepEEID=x.EshEEID and eepHomeCoID=x.EshCoID
    where EecEEType<>'CON' AND DATEDIFF(YY,eepDateofBirth,GETDATE())>18 and coalesce (eepAddressEMail,'')<>''
    and CmpCoID<>'055PB'
    and (EecEmplStatus<>'T'  or (EecEmplStatus='T' and EecDateOfTermination> convert (varchar (10),DATEADD (DD,-14, GETDATE()),126))) ---between @startdate and @enddate
    and eecEEID not in ('6VV6QV0000K0','7X3YEI0000K0') 
order by eepSSN

set @count=(select COUNT(*) from u_dsi_drv_DemoGraphic_RecordXtbl) + (select COUNT(*) from u_dsi_drv_DemoGraphic_RecordKtbl)+ (select COUNT(*) from u_dsi_drv_DemoGraphic_RecordAtbl) 

select '99999999999' dtvTrailerNines
,'TRLR' dtvTrailerIndicator
,'091509' dtvPlanNumber
,@date dtvDate
,@time dtvTime
,right('0000000000'+convert (varchar (10),@count),10) dtvRecordCount
into dbo.u_dsi_drv_DemoGraphic_Trailertbl


update U_dsi_Parameters set ExportFile='091509_Vanguard_Demographic_'+@date
where SystemID=@SystemID
GO
Create View dbo.dsi_vwEVANSFFD_Export as
        select top 2000000 Data from dbo.U_EVANSFFD_File with (nolock)
        order by substring(RecordSet,2,2), InitialSort