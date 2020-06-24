SET NOCOUNT ON;
IF OBJECT_ID('U_EHARTFRDCN_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EHARTFRDCN_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EHARTFRDCN_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EHARTFRDCN' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEHARTFRDCN_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEHARTFRDCN_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EHARTFRDCN') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EHARTFRDCN];
GO
IF OBJECT_ID('U_EHARTFRDCN_File') IS NOT NULL DROP TABLE [dbo].[U_EHARTFRDCN_File];
GO
IF OBJECT_ID('U_EHARTFRDCN_EEList') IS NOT NULL DROP TABLE [dbo].[U_EHARTFRDCN_EEList];
GO
IF OBJECT_ID('U_EHARTFRDCN_DrvTbl_T91') IS NOT NULL DROP TABLE [dbo].[U_EHARTFRDCN_DrvTbl_T91];
GO
IF OBJECT_ID('U_EHARTFRDCN_DrvTbl_H01') IS NOT NULL DROP TABLE [dbo].[U_EHARTFRDCN_DrvTbl_H01];
GO
IF OBJECT_ID('U_EHARTFRDCN_DrvTbl_D11') IS NOT NULL DROP TABLE [dbo].[U_EHARTFRDCN_DrvTbl_D11];
GO
IF OBJECT_ID('U_EHARTFRDCN_DedList') IS NOT NULL DROP TABLE [dbo].[U_EHARTFRDCN_DedList];
GO
IF OBJECT_ID('U_EHARTFRDCN_AuditFields') IS NOT NULL DROP TABLE [dbo].[U_EHARTFRDCN_AuditFields];
GO
IF OBJECT_ID('U_EHARTFRDCN_Audit') IS NOT NULL DROP TABLE [dbo].[U_EHARTFRDCN_Audit];
GO
IF OBJECT_ID('U_dsi_BDM_EHARTFRDCN') IS NOT NULL DROP TABLE [dbo].[U_dsi_BDM_EHARTFRDCN];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EHARTFRDCN';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EHARTFRDCN';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EHARTFRDCN';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EHARTFRDCN';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EHARTFRDCN';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCreateTClockBatches,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhRespectZeroPayRate,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhThirdPartyPay) VALUES ('N','C','Y','0','',NULL,'','N','','N','','013010','EMPEXPORT','CDE','EHARTFRDCN','Hartford Census Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','5000','N','S','N','EHARTFRDCNZ0','N','Jan  1 1900 12:00AM','C','N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~HDR~"','1','(''DA''=''T|'')','EHARTFRDCNZ0','5','H','01','1',NULL,'Section code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','2','(''DA''=''T|'')','EHARTFRDCNZ0','3','H','01','2',NULL,'Customer Count',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFileName"','3','(''UA''=''T|'')','EHARTFRDCNZ0','30','H','01','3',NULL,'File Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateFileCreated"','4','(''UA''=''T|'')','EHARTFRDCNZ0','20','H','01','4',NULL,'Date File Created',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Thomas, Judy &Tucker, P.A."','5','(''DA''=''T|'')','EHARTFRDCNZ0','20','H','01','5',NULL,'Customer Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"002.00"','6','(''DA''=''T'')','EHARTFRDCNZ0','6','H','01','6',NULL,'File Version Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~PII~"','1','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','1',NULL,'Section code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1367088"','2','(''DA''=''T|'')','EHARTFRDCNZ0','10','D','11','2',NULL,'Customer Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTransactionCode"','3','(''UA''=''T|'')','EHARTFRDCNZ0','1','D','11','3',NULL,'Transaction Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEepSSN"','4','(''UA''=''T|'')','EHARTFRDCNZ0','9','D','11','4',NULL,'Employee SSN',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','5','(''UA''=''T|'')','EHARTFRDCNZ0','15','D','11','5',NULL,'Employee ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvConSSN"','6','(''UA''=''T|'')','EHARTFRDCNZ0','9','D','11','6',NULL,'Dependent  SSN/Dependent ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRelationshipCode"','7','(''UA''=''T|'')','EHARTFRDCNZ0','2','D','11','7',NULL,'Relationship Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLastName"','8','(''UA''=''T|'')','EHARTFRDCNZ0','30','D','11','8',NULL,'Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFirstName"','9','(''UA''=''T|'')','EHARTFRDCNZ0','30','D','11','9',NULL,'First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameMiddle"','10','(''UA''=''T|'')','EHARTFRDCNZ0','1','D','11','10',NULL,'Middle Initial',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNamePrefix"','11','(''UA''=''T|'')','EHARTFRDCNZ0','10','D','11','11',NULL,'Name Prefix',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameSuffix"','12','(''UA''=''T|'')','EHARTFRDCNZ0','10','D','11','12',NULL,'Name Suffix',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfBirth"','13','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','13',NULL,'Date of Birth',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMaritalStatus"','14','(''UA''=''T|'')','EHARTFRDCNZ0','1','D','11','14',NULL,'Marital Status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGender"','15','(''UA''=''T|'')','EHARTFRDCNZ0','1','D','11','15',NULL,'Gender',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','16','(''SS''=''T|'')','EHARTFRDCNZ0','1','D','11','16',NULL,'Employee Smoker Status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~ECI~"','17','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','17',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine1"','18','(''UA''=''T|'')','EHARTFRDCNZ0','40','D','11','18',NULL,'Member Mailing Address 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine2"','19','(''UA''=''T|'')','EHARTFRDCNZ0','40','D','11','19',NULL,'Member Mailing Address 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressCity"','20','(''UA''=''T|'')','EHARTFRDCNZ0','30','D','11','20',NULL,'Member Mailing Address City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressState"','21','(''UA''=''T|'')','EHARTFRDCNZ0','2','D','11','21',NULL,'Member Mailing Address State',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressZipCode"','22','(''UA''=''T|'')','EHARTFRDCNZ0','10','D','11','22',NULL,'Member Mailing Address Zip Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"840"','23','(''DA''=''T|'')','EHARTFRDCNZ0','3','D','11','23',NULL,'Member Mailing Address Country Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','24','(''SS''=''T|'')','EHARTFRDCNZ0','2','D','11','24',NULL,'Member Mailing Address Province Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','25','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','25',NULL,'Member Mailing Address Province Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPhoneHomeNumber"','26','(''UA''=''T|'')','EHARTFRDCNZ0','10','D','11','26',NULL,'Employee Home Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeCellPhone"','27','(''UA''=''T|'')','EHARTFRDCNZ0','10','D','11','27',NULL,'Employee Cell Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressEmailAlternate"','28','(''UA''=''T|'')','EHARTFRDCNZ0','50','D','11','28',NULL,'Employee Personal E-mail Address',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressEmail"','29','(''UA''=''T|'')','EHARTFRDCNZ0','50','D','11','29',NULL,'Employee Work E-mail Address',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStateSUI"','30','(''UA''=''T|'')','EHARTFRDCNZ0','2','D','11','30',NULL,'Employee Work State Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','31','(''SS''=''T|'')','EHARTFRDCNZ0','40','D','11','31',NULL,'Employee Work Address 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','32','(''SS''=''T|'')','EHARTFRDCNZ0','40','D','11','32',NULL,'Employee Work Address 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','33','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','33',NULL,'Employee Work Address City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','34','(''SS''=''T|'')','EHARTFRDCNZ0','2','D','11','34',NULL,'Employee Work Address State',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','35','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','35',NULL,'Employee Work Address Zip Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeWorkAddressCountryCode"','36','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','36',NULL,'Employee Work Address Country Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPhoneBusinessNumber"','37','(''UA''=''T|'')','EHARTFRDCNZ0','10','D','11','37',NULL,'Employee Work Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~ERC~"','38','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','38',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSupervisorLastName"','39','(''UA''=''T|'')','EHARTFRDCNZ0','30','D','11','39',NULL,'Supervisor Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSupervisorFirstName"','40','(''UA''=''T|'')','EHARTFRDCNZ0','30','D','11','40',NULL,'Supervisor First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','41','(''SS''=''T|'')','EHARTFRDCNZ0','20','D','11','41',NULL,'Supervisor ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSupervisorWorkPhoneNumber"','42','(''UA''=''T|'')','EHARTFRDCNZ0','10','D','11','42',NULL,'Supervisor Work Phone Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSupervisorEmailAddress"','43','(''UA''=''T|'')','EHARTFRDCNZ0','50','D','11','43',NULL,'Supervisor Email Address',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','44','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','44',NULL,'HR Manager Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','45','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','45',NULL,'HR Manager First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','46','(''SS''=''T|'')','EHARTFRDCNZ0','20','D','11','46',NULL,'HR Manager ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','47','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','47',NULL,'HR Manager Work Phone Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','48','(''SS''=''T|'')','EHARTFRDCNZ0','50','D','11','48',NULL,'HR Manager Email Address',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','49','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','49',NULL,'ER Contact Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','50','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','50',NULL,'ER Contact First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','51','(''SS''=''T|'')','EHARTFRDCNZ0','20','D','11','51',NULL,'ER ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','52','(''SS''=''T|'')','EHARTFRDCNZ0','50','D','11','52',NULL,'ER Contact Email Address',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~EMI~"','53','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','53',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeStatusCode"','54','(''UA''=''T|'')','EHARTFRDCNZ0','1','D','11','54',NULL,'Employee Status Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeStatusEffectiveDate"','55','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','55',NULL,'Employee Status Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','56','(''SS''=''T|'')','EHARTFRDCNZ0','8','D','11','56',NULL,'Employee Service Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','57','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','57',NULL,'Most Recent Hire Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfOriginalHire"','58','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','58',NULL,'Original Hire Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','59','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','59',NULL,'Employee Termination Reason Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','60','(''SS''=''T|'')','EHARTFRDCNZ0','35','D','11','60',NULL,'Employee Termination Description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','61','(''SS''=''T|'')','EHARTFRDCNZ0','8','D','11','61',NULL,'Last Day Worked',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFullTimeOrPartTime"','62','(''UA''=''T|'')','EHARTFRDCNZ0','2','D','11','62',NULL,'Employment Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvExemptNonExempt"','63','(''UA''=''T|'')','EHARTFRDCNZ0','1','D','11','63',NULL,'Exempt/Non-Exempt',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSheduledWorkHrs"','64','(''UA''=''T|'')','EHARTFRDCNZ0','4','D','11','64',NULL,'Scheduled Hours Per Week',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAnnSalary"','65','(''UA''=''T|'')','EHARTFRDCNZ0','9','D','11','65',NULL,'Benefit Salary Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalaryBasis"','66','(''UA''=''T|'')','EHARTFRDCNZ0','1','D','11','66',NULL,'Salary Basis',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','67','(''SS''=''T|'')','EHARTFRDCNZ0','12','D','11','67',NULL,'Additional Salary Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','68','(''SS''=''T|'')','EHARTFRDCNZ0','2','D','11','68',NULL,'Additional Salary/Wage Basis',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalaryEffectiveDate"','69','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','69',NULL,'Salary Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','70','(''SS''=''T|'')','EHARTFRDCNZ0','9','D','11','70',NULL,'Commission Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','71','(''SS''=''T|'')','EHARTFRDCNZ0','9','D','11','71',NULL,'Bonus',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','72','(''SS''=''T|'')','EHARTFRDCNZ0','1','D','11','72',NULL,'Payroll Basis',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','73','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','73',NULL,'Pay Grade Level',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPayPeriod"','74','(''UA''=''T|'')','EHARTFRDCNZ0','2','D','11','74',NULL,'Pay Period Frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','75','(''SS''=''T|'')','EHARTFRDCNZ0','8','D','11','75',NULL,'Pay Period Begin Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','76','(''SS''=''T|'')','EHARTFRDCNZ0','8','D','11','76',NULL,'Pay Period End Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvJobTitle"','77','(''UA''=''T|'')','EHARTFRDCNZ0','25','D','11','77',NULL,'Job Title',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','78','(''SS''=''T|'')','EHARTFRDCNZ0','1','D','11','78',NULL,'Job Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','79','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','79',NULL,'Payroll Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','80','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','80',NULL,'Company Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','81','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','81',NULL,'Department Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','82','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','82',NULL,'Division Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','83','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','83',NULL,'Location Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','84','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','84',NULL,'Region Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','85','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','85',NULL,'Account Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','86','(''SS''=''T|'')','EHARTFRDCNZ0','1','D','11','86',NULL,'Union Indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','87','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','87',NULL,'Union Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','88','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','88',NULL,'Medical Carrier',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','89','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','89',NULL,'Mental Health Carrier',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~CSF~"','90','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','90',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','91','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','91',NULL,'Client-Specific Field #1 Name Last 8 Week Earnings',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','92','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','92',NULL,'Client-Specific Field #1 Value Last 8 Week Earning',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','93','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','93',NULL,'Client-Specific Field #2 Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','94','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','94',NULL,'Client-Specific Field #2 Value',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','95','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','95',NULL,'Client-Specific Field #3 Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','96','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','96',NULL,'Client-Specific Field #3 Value',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','97','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','97',NULL,'Client-Specific Field#4 Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','98','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','98',NULL,'Client-Specific Field #4 Value',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','99','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','99',NULL,'Client-Specific Field #5 Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','100','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','100',NULL,'Client-Specific Field #5 Value',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','101','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','101',NULL,'Client-Specific Field #6 Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','102','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','102',NULL,'Client-Specific Field #6 Value',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','103','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','103',NULL,'Client-Specific Field #7 Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','104','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','104',NULL,'Client-Specific Field #7 Value',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','105','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','105',NULL,'Client-Specific Field #8 Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','106','(''SS''=''T|'')','EHARTFRDCNZ0','30','D','11','106',NULL,'Client-Specific Field #8 Value',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~NST~"','107','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','107',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageEffectiveDateNST"','108','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','108',NULL,'Coverage Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageTerminationDateNST"','109','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','109',NULL,'Coverage Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','110','(''SS''=''T|'')','EHARTFRDCNZ0','9','D','11','110',NULL,'STD Covered Salary',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','111','(''SS''=''T|'')','EHARTFRDCNZ0','5','D','11','111',NULL,'STD Coverage Plan Option',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','112','(''SS''=''T|'')','EHARTFRDCNZ0','5','D','11','112',NULL,'STD Requested Coverage Plan Option',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPlanSummaryNST"','113','(''UA''=''T|'')','EHARTFRDCNZ0','7','D','11','113',NULL,'Plan Summary',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeGroupIDNST"','114','(''UA''=''T|'')','EHARTFRDCNZ0','5','D','11','114',NULL,'Employee Group ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeClassCodeNST"','115','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','115',NULL,'Employee Class Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~LTD~"','116','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','116',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageEffectiveDateLTD"','117','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','117',NULL,'Coverage Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageTerminationDateLTD"','118','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','118',NULL,'Coverage Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','119','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','119',NULL,'Coverage Termination Reason Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','120','(''SS''=''T|'')','EHARTFRDCNZ0','35','D','11','120',NULL,'Coverage Termination Description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','121','(''SS''=''T|'')','EHARTFRDCNZ0','9','D','11','121',NULL,'LTD Covered Salary',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLTDCoveragePlanOptionLTD"','122','(''UA''=''T|'')','EHARTFRDCNZ0','5','D','11','122',NULL,'LTD Coverage Plan Option',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','123','(''SS''=''T|'')','EHARTFRDCNZ0','5','D','11','123',NULL,'LTD Requested Coverage Plan Option',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPlanSummaryLTD"','124','(''UA''=''T|'')','EHARTFRDCNZ0','7','D','11','124',NULL,'Plan Summary',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeGroupIDLTD"','125','(''UA''=''T|'')','EHARTFRDCNZ0','5','D','11','125',NULL,'Employee Group ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeClassCodeLTD"','126','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','126',NULL,'Employee Class Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~RPL~"','127','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','127',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Ampler QSR"','128','(''DA''=''T|'')','EHARTFRDCNZ0','20','D','11','128',NULL,'Reporting Level 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','129','(''SS''=''T|'')','EHARTFRDCNZ0','20','D','11','129',NULL,'Reporting Level 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','130','(''SS''=''T|'')','EHARTFRDCNZ0','20','D','11','130',NULL,'Reporting Level 3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','131','(''SS''=''T|'')','EHARTFRDCNZ0','20','D','11','131',NULL,'Reporting Level 4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','132','(''SS''=''T|'')','EHARTFRDCNZ0','20','D','11','132',NULL,'Reporting Level 5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','133','(''SS''=''T|'')','EHARTFRDCNZ0','20','D','11','133',NULL,'Reporting Level 6',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','134','(''SS''=''T|'')','EHARTFRDCNZ0','20','D','11','134',NULL,'Reporting Level 7',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','135','(''SS''=''T|'')','EHARTFRDCNZ0','20','D','11','135',NULL,'Reporting Level 8',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','136','(''SS''=''T|'')','EHARTFRDCNZ0','20','D','11','136',NULL,'Reporting Level 9',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','137','(''SS''=''T|'')','EHARTFRDCNZ0','20','D','11','137',NULL,'Reporting Level 10',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','138','(''SS''=''T|'')','EHARTFRDCNZ0','20','D','11','138',NULL,'Reporting Level 11',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','139','(''SS''=''T|'')','EHARTFRDCNZ0','20','D','11','139',NULL,'Reporting Level 12',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~BLF~"','140','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','140',NULL,'Basic Life Plan',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageEffectiveDateBLF"','141','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','141',NULL,'Coverage Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageTerminationDateBLF"','142','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','142',NULL,'Coverage Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','143','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','143',NULL,'Coverage Termination Reason Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','144','(''SS''=''T|'')','EHARTFRDCNZ0','35','D','11','144',NULL,'Coverage Termination Description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBasicLifeMultipleSalaryFaceAmountBLF"','145','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','145',NULL,'Basic Life Multiple of Salary Face Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','146','(''SS''=''T|'')','EHARTFRDCNZ0','11','D','11','146',NULL,'Basic Life Face Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','147','(''SS''=''T|'')','EHARTFRDCNZ0','3','D','11','147',NULL,'Basic Life Multiple of Salary Requested Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','148','(''SS''=''T|'')','EHARTFRDCNZ0','11','D','11','148',NULL,'Basic Life Requested Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeGroupIDBLF"','149','(''UA''=''T|'')','EHARTFRDCNZ0','5','D','11','149',NULL,'Employee Group ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeClassCodeBLF"','150','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','150',NULL,'Employee Class Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~BAD~"','151','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','151',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageEffectiveDateBAD"','152','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','152',NULL,'Coverage Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageTerminationDateBAD"','153','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','153',NULL,'Coverage Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','154','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','154',NULL,'Coverage Termination Reason Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','155','(''SS''=''T|'')','EHARTFRDCNZ0','35','D','11','155',NULL,'Coverage Termination Description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvBasicADDFaceAmountBAD"','156','(''UA''=''T|'')','EHARTFRDCNZ0','11','D','11','156',NULL,'Basic AD&D Face Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','157','(''SS''=''T|'')','EHARTFRDCNZ0','11','D','11','157',NULL,'Basic AD&D Requested Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeGroupIDBAD"','158','(''UA''=''T|'')','EHARTFRDCNZ0','5','D','11','158',NULL,'Employee Group ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeClassCodeBAD"','159','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','159',NULL,'Employee Class Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~LIF~"','160','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','160',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageEffectiveDateLIF"','161','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','161',NULL,'Coverage Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageTerminationDateLIF"','162','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','162',NULL,'Coverage Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','163','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','163',NULL,'Coverage Termination Reason Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','164','(''SS''=''T|'')','EHARTFRDCNZ0','35','D','11','164',NULL,'Coverage Termination Description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSuppLifeSalaryFaceAmountLIF"','165','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','165',NULL,'Supplemental Life Multiple of Salary Face Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','166','(''SS''=''T|'')','EHARTFRDCNZ0','11','D','11','166',NULL,'Supplemental Life Face Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','167','(''SS''=''T|'')','EHARTFRDCNZ0','3','D','11','167',NULL,'Supplemental Life  Multiple of Salary Requested Am',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','168','(''SS''=''T|'')','EHARTFRDCNZ0','11','D','11','168',NULL,'Supplemental Life Requested Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeGroupILIF"','169','(''UA''=''T|'')','EHARTFRDCNZ0','5','D','11','169',NULL,'Employee Group ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeClassCodeLIF"','170','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','170',NULL,'Employee Class Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~ADD~"','171','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','171',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageEffectiveDateADD"','172','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','172',NULL,'Coverage Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageTerminationDateADD"','173','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','173',NULL,'Coverage Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','174','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','174',NULL,'Coverage Termination Reason Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','175','(''SS''=''T|'')','EHARTFRDCNZ0','35','D','11','175',NULL,'Coverage Termination Description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSuppSalaryFaceAmountADD"','176','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','176',NULL,'Supplemental AD&D Multiple of Salary Face Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','177','(''SS''=''T|'')','EHARTFRDCNZ0','11','D','11','177',NULL,'Supplemental AD&D Face Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','178','(''SS''=''T|'')','EHARTFRDCNZ0','3','D','11','178',NULL,'Supplemental AD&D Multiple of Salary Requested Amo',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','179','(''SS''=''T|'')','EHARTFRDCNZ0','11','D','11','179',NULL,'Supplemental AD&D Requested Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeGroupIDADD"','180','(''UA''=''T|'')','EHARTFRDCNZ0','5','D','11','180',NULL,'Employee Group ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeClassCodeADD"','181','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','181',NULL,'Employee Class Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~SPL~"','182','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','182',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageEffectiveDateSPL"','183','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','183',NULL,'Coverage Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageTerminationDateSPL"','184','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','184',NULL,'Coverage Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','185','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','185',NULL,'Coverage Termination Reason Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','186','(''SS''=''T|'')','EHARTFRDCNZ0','35','D','11','186',NULL,'Coverage Termination Description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSpouseSuppFaceAmountSPL"','187','(''UA''=''T|'')','EHARTFRDCNZ0','11','D','11','187',NULL,'Spouse Supplemental Life Face Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','188','(''SS''=''T|'')','EHARTFRDCNZ0','11','D','11','188',NULL,'Spouse Supplemental Life Requested Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeGroupIDSPL"','189','(''UA''=''T|'')','EHARTFRDCNZ0','5','D','11','189',NULL,'Employee Group ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeClassSPL"','190','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','190',NULL,'Employee Class',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~DPL~"','191','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','191',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageEffectiveDateDPL"','192','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','192',NULL,'Coverage Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageTerminationDateDPL"','193','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','193',NULL,'Coverage Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','194','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','194',NULL,'Coverage Termination Reason Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','195','(''SS''=''T|'')','EHARTFRDCNZ0','35','D','11','195',NULL,'Coverage Termination Description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDependentSuppFaceAmountDPL"','196','(''UA''=''T|'')','EHARTFRDCNZ0','11','D','11','196',NULL,'Dependent/Child Supplemental Life Face Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','197','(''SS''=''T|'')','EHARTFRDCNZ0','11','D','11','197',NULL,'Dependent/Child Supplemental Life Requested Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeGroupIDDPL"','198','(''UA''=''T|'')','EHARTFRDCNZ0','5','D','11','198',NULL,'Employee Group ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeClassDPL"','199','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','199',NULL,'Employee Class',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~SAD~"','200','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','200',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageEffectiveDateSAD"','201','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','201',NULL,'Coverage Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageTerminationDateSAD"','202','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','202',NULL,'Coverage Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','203','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','203',NULL,'Coverage Termination Reason Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','204','(''SS''=''T|'')','EHARTFRDCNZ0','35','D','11','204',NULL,'Coverage Termination Description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSpouseSuppFaceAmountSAD"','205','(''UA''=''T|'')','EHARTFRDCNZ0','11','D','11','205',NULL,'Spouse Supplemental AD&D Face Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','206','(''SS''=''T|'')','EHARTFRDCNZ0','11','D','11','206',NULL,'Spouse Supplemental AD&D Requested Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeGroupIDSAD"','207','(''UA''=''T|'')','EHARTFRDCNZ0','5','D','11','207',NULL,'Employee Group ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeClassSAD"','208','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','208',NULL,'Employee Class',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~DCA~"','209','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','209',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageEffectiveDateDCA"','210','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','210',NULL,'Coverage Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageTerminationDCA"','211','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','211',NULL,'Coverage Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','212','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','212',NULL,'Coverage Termination Reason Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','213','(''SS''=''T|'')','EHARTFRDCNZ0','35','D','11','213',NULL,'Coverage Termination Description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDependentSuppFaceAmountDCA"','214','(''UA''=''T|'')','EHARTFRDCNZ0','11','D','11','214',NULL,'Dependent/Child Supplemental AD&D Face Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','215','(''SS''=''T|'')','EHARTFRDCNZ0','11','D','11','215',NULL,'Dependent/Child Supplemental AD&D Requested Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeGroupIDDCA"','216','(''UA''=''T|'')','EHARTFRDCNZ0','5','D','11','216',NULL,'Employee Group ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeClassDCA"','217','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','217',NULL,'Employee Class',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~VCI~"','218','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','218',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageEffectiveDateVCI"','219','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','219',NULL,'Coverage Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageTerminationDateVCI"','220','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','220',NULL,'Coverage Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','221','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','221',NULL,'Coverage Termination Reason Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','222','(''SS''=''T|'')','EHARTFRDCNZ0','35','D','11','222',NULL,'Coverage Termination Description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCIBenefitAmountVCI"','223','(''UA''=''T|'')','EHARTFRDCNZ0','11','D','11','223',NULL,'CI Benefit Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageTierVCI"','224','(''UA''=''T|'')','EHARTFRDCNZ0','1','D','11','224',NULL,'Coverage Tier',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPlanNumberVCI"','225','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','225',NULL,'Plan Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeGroupIDVCI"','226','(''UA''=''T|'')','EHARTFRDCNZ0','5','D','11','226',NULL,'Employee Group ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeClassVCI"','227','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','227',NULL,'Employee Class',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~VAC~"','228','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','228',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageEffectiveDateVAC"','229','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','229',NULL,'Coverage Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageTerminationDateVAC"','230','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','230',NULL,'Coverage Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','231','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','231',NULL,'Coverage Termination Reason Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','232','(''SS''=''T|'')','EHARTFRDCNZ0','35','D','11','232',NULL,'Coverage Termination Description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageTierVAC"','233','(''UA''=''T|'')','EHARTFRDCNZ0','1','D','11','233',NULL,'Coverage Tier',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPlanOptionVAC"','234','(''UA''=''T|'')','EHARTFRDCNZ0','50','D','11','234',NULL,'Plan Option',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPlanNumberVAC"','235','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','235',NULL,'Plan Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeGroupIDVAC"','236','(''UA''=''T|'')','EHARTFRDCNZ0','5','D','11','236',NULL,'Employee Group ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeClassVAC"','237','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','237',NULL,'Employee Class',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~HIP~"','238','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','238',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageEffectiveDateHIP"','239','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','239',NULL,'Coverage Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageTerminationDateHIP"','240','(''UD112''=''T|'')','EHARTFRDCNZ0','8','D','11','240',NULL,'Coverage Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','241','(''SS''=''T|'')','EHARTFRDCNZ0','10','D','11','241',NULL,'Coverage Termination Reason Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','242','(''SS''=''T|'')','EHARTFRDCNZ0','35','D','11','242',NULL,'Coverage Termination Description',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoverageTierHIP"','243','(''UA''=''T|'')','EHARTFRDCNZ0','1','D','11','243',NULL,'Coverage Tier',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPlanOptionHIP"','244','(''UA''=''T|'')','EHARTFRDCNZ0','50','D','11','244',NULL,'Plan Option',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPlanNumberHIP"','245','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','245',NULL,'Plan Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeGroupIDHIP"','246','(''UA''=''T|'')','EHARTFRDCNZ0','5','D','11','246',NULL,'Employee Group ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmployeeClassHIP"','247','(''UA''=''T|'')','EHARTFRDCNZ0','3','D','11','247',NULL,'Employee Class',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~LMS~"','248','(''DA''=''T|'')','EHARTFRDCNZ0','5','D','11','248',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','249','(''DA''=''T|'')','EHARTFRDCNZ0','1','D','11','249',NULL,'Leave Management Services Indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','250','(''SS''=''T|'')','EHARTFRDCNZ0','1','D','11','250',NULL,'Employee Covered by FML 50/75 Rule',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"N"','251','(''DA''=''T|'')','EHARTFRDCNZ0','1','D','11','251',NULL,'Key Employee Indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','252','(''SS''=''T|'')','EHARTFRDCNZ0','1','D','11','252',NULL,'Forced Eligibility',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','253','(''SS''=''T|'')','EHARTFRDCNZ0','5','D','11','253',NULL,'Leave Management Option',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLast12MonthsHours"','254','(''UA''=''T|'')','EHARTFRDCNZ0','6','D','11','254',NULL,'Last 12 Months Hours',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','255','(''SS''=''T|'')','EHARTFRDCNZ0','6','D','11','255',NULL,'Last 12 Months Paid Hours',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','256','(''SS''=''T|'')','EHARTFRDCNZ0','7','D','11','256',NULL,'Actual Hours Worked',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','257','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','257',NULL,'Usage Time',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','258','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','258',NULL,'Regulation Period Basis',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCumulativeHoursEndDate"','259','(''UA112''=''T|'')','EHARTFRDCNZ0','8','D','11','259',NULL,'Cumulative Hours End Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCumulativeHoursNumberOfWeeks"','260','(''UA''=''T|'')','EHARTFRDCNZ0','2','D','11','260',NULL,'Cumulative Hours Number of Weeks',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','261','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','261',NULL,'Sick Leave Hours Remaining',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','262','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','262',NULL,'Vacation Hours Remaining',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','263','(''SS''=''T|'')','EHARTFRDCNZ0','3','D','11','263',NULL,'Work Schedule Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','264','(''SS''=''T|'')','EHARTFRDCNZ0','8','D','11','264',NULL,'Work Schedule From Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','265','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','265',NULL,'Work schedule - Hours Monday',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','266','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','266',NULL,'Work Schedule - Hours Tuesday',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','267','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','267',NULL,'Work Schedule - Hours Wednesday',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','268','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','268',NULL,'Work Schedule - Hours Thursday',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','269','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','269',NULL,'Work Schedule - Hours Friday',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','270','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','270',NULL,'Work Schedule - Hours Saturday',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','271','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','271',NULL,'Work Schedule - Hours Sunday',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','272','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','272',NULL,'Number of Days in Repeating Work Schedule',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','273','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','273',NULL,'Repeating Schedule - Day 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','274','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','274',NULL,'Repeating Schedule - Day 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','275','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','275',NULL,'Repeating Schedule - Day 3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','276','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','276',NULL,'Repeating Schedule - Day 4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','277','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','277',NULL,'Repeating Schedule - Day 5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','278','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','278',NULL,'Repeating Schedule - Day 6',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','279','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','279',NULL,'Repeating Schedule - Day 7',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','280','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','280',NULL,'Repeating Schedule - Day 8',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','281','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','281',NULL,'Repeating Schedule - Day 9',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','282','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','282',NULL,'Repeating Schedule - Day 10',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','283','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','283',NULL,'Repeating Schedule - Day 11',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','284','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','284',NULL,'Repeating Schedule - Day 12',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','285','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','285',NULL,'Repeating Schedule - Day 13',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','286','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','286',NULL,'Repeating Schedule - Day 14',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','287','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','287',NULL,'Repeating Schedule - Day 15',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','288','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','288',NULL,'Repeating Schedule - Day 16',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','289','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','289',NULL,'Repeating Schedule - Day 17',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','290','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','290',NULL,'Repeating Schedule - Day 18',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','291','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','291',NULL,'Repeating Schedule - Day 19',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','292','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','292',NULL,'Repeating Schedule - Day 20',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','293','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','293',NULL,'Repeating Schedule - Day 21',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','294','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','294',NULL,'Repeating Schedule - Day 22',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','295','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','295',NULL,'Repeating Schedule - Day 23',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','296','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','296',NULL,'Repeating Schedule - Day 24',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','297','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','297',NULL,'Repeating Schedule - Day 25',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','298','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','298',NULL,'Repeating Schedule - Day 26',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','299','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','299',NULL,'Repeating Schedule - Day 27',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','300','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','300',NULL,'Repeating Schedule - Day 28',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','301','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','301',NULL,'Repeating Schedule - Day 29',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','302','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','302',NULL,'Repeating Schedule - Day 30',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','303','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','303',NULL,'Repeating Schedule - Day 31',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','304','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','304',NULL,'Repeating Schedule - Day 32',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','305','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','305',NULL,'Repeating Schedule - Day 33',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','306','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','306',NULL,'Repeating Schedule - Day 34',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','307','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','307',NULL,'Repeating Schedule - Day 35',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','308','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','308',NULL,'Repeating Schedule - Day 36',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','309','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','309',NULL,'Repeating Schedule - Day 37',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','310','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','310',NULL,'Repeating Schedule - Day 38',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','311','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','311',NULL,'Repeating Schedule - Day 39',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','312','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','312',NULL,'Repeating Schedule - Day 40',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','313','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','313',NULL,'Repeating Schedule - Day 41',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','314','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','314',NULL,'Repeating Schedule - Day 42',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','315','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','315',NULL,'Repeating Schedule - Day 43',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','316','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','316',NULL,'Repeating Schedule - Day 44',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','317','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','317',NULL,'Repeating Schedule - Day 45',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','318','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','318',NULL,'Repeating Schedule - Day 46',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','319','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','319',NULL,'Repeating Schedule - Day 47',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','320','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','320',NULL,'Repeating Schedule - Day 48',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','321','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','321',NULL,'Repeating Schedule - Day 49',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','322','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','322',NULL,'Repeating Schedule - Day 50',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','323','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','323',NULL,'Repeating Schedule - Day 51',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','324','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','324',NULL,'Repeating Schedule - Day 52',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','325','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','325',NULL,'Repeating Schedule - Day 53',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','326','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','326',NULL,'Repeating Schedule - Day 54',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','327','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','327',NULL,'Repeating Schedule - Day 55',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','328','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','328',NULL,'Repeating Schedule - Day 56',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','329','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','329',NULL,'Repeating Schedule - Day 57',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','330','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','330',NULL,'Repeating Schedule - Day 58',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','331','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','331',NULL,'Repeating Schedule - Day 59',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','332','(''SS''=''T|'')','EHARTFRDCNZ0','4','D','11','332',NULL,'Repeating Schedule - Day 60',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','333','(''SS''=''T|'')','EHARTFRDCNZ0','2','D','11','333',NULL,'Flight Crew',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','334','(''SS''=''T'')','EHARTFRDCNZ0','1','D','11','334',NULL,'FMLA Radius',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"~FTR~"','1','(''DA''=''T|'')','EHARTFRDCNZ0','5','T','91','1',NULL,'Section Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRecordCount"','2','(''UNT0''=''T'')','EHARTFRDCNZ0','7','T','91','2',NULL,'Record Count',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,'FI1AR,NL11C,XK1SB,346BU,IBK8G,YIY9X,GE1JW',NULL,NULL,NULL,'Hartford Census OnDemand','202004019','EMPEXPORT','ONDEMAND',NULL,'EHARTFRDCN',NULL,NULL,NULL,'202004019','Apr  1 2020  8:32AM','Apr  1 2020  8:32AM','202004011',NULL,'','','202004011',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,'FI1AR,NL11C,XK1SB,346BU,IBK8G,YIY9X,GE1JW',NULL,NULL,NULL,'Test Purposes Only','202004019','EMPEXPORT','TEST',NULL,'EHARTFRDCN',NULL,NULL,NULL,'202004019','Apr  1 2020  8:32AM','Apr  1 2020  8:32AM','202004011',NULL,'','','202004011',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,'FI1AR,NL11C,XK1SB,346BU,IBK8G,YIY9X,GE1JW',NULL,NULL,NULL,'Scheduled Session','202004019','EMPEXPORT','SCHEDULED',NULL,'EHARTFRDCN',NULL,NULL,NULL,'202004019','Apr  1 2020  8:32AM','Apr  1 2020  8:32AM','202004011',NULL,'','','202004011',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,'FI1AR,NL11C,XK1SB,346BU,IBK8G,YIY9X,GE1JW',NULL,NULL,NULL,'Active Open Enrollment Export','202004019','EMPEXPORT','OEACTIVE',NULL,'EHARTFRDCN',NULL,NULL,NULL,'202004019','Apr  1 2020  8:32AM','Apr  1 2020  8:32AM','202004011',NULL,'','','202004011',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,'FI1AR,NL11C,XK1SB,346BU,IBK8G,YIY9X,GE1JW',NULL,NULL,NULL,'Passive Open Enrollment Export','202004019','EMPEXPORT','OEPASSIVE',NULL,'EHARTFRDCN',NULL,NULL,NULL,'202004019','Apr  1 2020  8:32AM','Apr  1 2020  8:32AM','202004011',NULL,'','','202004011',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EHARTFRDCN','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EHARTFRDCN','ExportPath','V','\\us.saas\e0\data_exchange\THO1018\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EHARTFRDCN','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EHARTFRDCN','MultFile','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EHARTFRDCN','OEPath','V','\\us.saas\e4\Public\THO1018\Exports\HartFord\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EHARTFRDCN','OnDemandPath','V','\\us.saas\e0\data_exchange\THO1018\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EHARTFRDCN','SubSort','C','drvSubSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EHARTFRDCN','Testing','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EHARTFRDCN','TestPath','V','\\us.saas\e4\Public\THO1018\Exports\HartFord\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EHARTFRDCN','UDESPath','V','\\us.saas\e0\data_exchange\THO1018\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EHARTFRDCN','UseFileName','V','N');
UPDATE dbo.U_dsi_Configuration SET CfgValue = '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\' WHERE FormatCode = 'EHARTFRDCN' AND CfgName = 'ExportPath' AND CfgValue IS NULL;
UPDATE dbo.U_dsi_Configuration SET CfgValue = svCfgValue FROM dbo.U_EHARTFRDCN_SavePath WHERE CfgName = svCfgName AND FormatCode = svFormatCode AND svCfgValue IS NOT NULL;
IF OBJECT_ID('U_EHARTFRDCN_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EHARTFRDCN_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EHARTFRDCN','H01','dbo.U_EHARTFRDCN_DrvTbl_H01',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EHARTFRDCN','D11','dbo.U_EHARTFRDCN_DrvTbl_D11',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EHARTFRDCN','T91','dbo.U_EHARTFRDCN_DrvTbl_T91',NULL);
IF OBJECT_ID('U_dsi_BDM_EHARTFRDCN') IS NULL
CREATE TABLE [dbo].[U_dsi_BDM_EHARTFRDCN] (
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
IF OBJECT_ID('U_EHARTFRDCN_Audit') IS NULL
CREATE TABLE [dbo].[U_EHARTFRDCN_Audit] (
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
IF OBJECT_ID('U_EHARTFRDCN_AuditFields') IS NULL
CREATE TABLE [dbo].[U_EHARTFRDCN_AuditFields] (
    [aTableName] varchar(30) NULL,
    [aFieldName] varchar(30) NULL
);
IF OBJECT_ID('U_EHARTFRDCN_DedList') IS NULL
CREATE TABLE [dbo].[U_EHARTFRDCN_DedList] (
    [DedCode] char(5) NOT NULL,
    [DedType] char(4) NOT NULL
);
IF OBJECT_ID('U_EHARTFRDCN_EEList') IS NULL
CREATE TABLE [dbo].[U_EHARTFRDCN_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EHARTFRDCN_File') IS NULL
CREATE TABLE [dbo].[U_EHARTFRDCN_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(max) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EHARTFRDCN]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: Thomas, Judy &Tucker, P.A.

Created By: Wyle Cordero
Business Analyst: Jackie Finn
Create Date: 04/01/2020
Service Request Number: SR-2019-00260591

Purpose: Hartford Census Export

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2020     SR-2020-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EHARTFRDCN';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EHARTFRDCN';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EHARTFRDCN';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EHARTFRDCN';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EHARTFRDCN' ORDER BY RunID DESC;

-- I: drive:
UPDATE U_dsi_configuration
SET cfgvalue = dbo.dsi_fnVariable('EHARTFRDCN','TestPath') 
WHERE FormatCode = 'EHARTFRDCN'
AND cfgname IN ('ExportPath', 'OnDemandPath')

-- J: drive:
UPDATE U_dsi_configuration
SET cfgvalue = dbo.dsi_fnVariable('EHARTFRDCN','UDESpath') 
WHERE FormatCode = 'EHARTFRDCN'
AND CfgName IN ('ExportPath', 'OnDemandPath')

Job Ownership Scripts
---------------------
-- Set job owner to ssis_user for Production jobs
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 0;

-- Set job owner to self, to make changes in SQL Job Scheduler. Remember to re-run the above script to change ownership to ssis_user when complete
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 1;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EHARTFRDCN', 'ONDEMAND';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EHARTFRDCN', 'TEST';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EHARTFRDCN', 'OEPASSIVE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EHARTFRDCN', 'OEACTIVE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EHARTFRDCN', 'SCHEDULED';

EXEC dbo.dsi_BDM_sp_ErrorCheck 'EHARTFRDCN';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'EHARTFRDCN', @AllObjects = 'Y', @IsWeb = 'N'
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
            ,@EndPerControl     VARCHAR(9)
			,@Last12MonthsPerControl VARCHAR(9);

    -- Set FormatCode
    SELECT @FormatCode = 'EHARTFRDCN';

    -- Declare dates from Parameter file
    SELECT
         @StartPerControl = StartPerControl
        ,@EndPerControl   = EndPerControl
        ,@StartDate       = LEFT(StartPerControl,8)
        ,@EndDate         = DATEADD(S,-1,DATEADD(D,1,LEFT(EndPerControl,8)))
        ,@ExportCode      = ExportCode
    FROM dbo.U_dsi_Parameters WITH (NOLOCK)
    WHERE FormatCode = @FormatCode;

	SET @Last12MonthsPerControl = CONCAT(FORMAT(DATEADD(MONTH, -12, @EndDate), 'yyyyMMdd'), '1')

    --==========================================
    -- Clean EE List 
    -- Caution: Careful of cleaning EE List if including paycheck data
    --==========================================

    -- Cleans EE List of terms where EE active in another company (transfer), or active in more than one company
    DELETE FROM dbo.U_EHARTFRDCN_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_EHARTFRDCN_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

	-- Exlcude Part Time Employees
	DELETE el
	FROM dbo.U_EHARTFRDCN_EEList el
	INNER JOIN dbo.Empcomp 
		ON EecEEID = xEEID 
		AND EecCOID = xCoID
		AND EecFullTimeOrPartTime = 'P'
	;


    --==========================================
    -- Audit Section
    --==========================================
    -- Get data from audit fields table. Add fields here if auditing
    IF OBJECT_ID('U_EHARTFRDCN_AuditFields','U') IS NOT NULL
        DROP TABLE dbo.U_EHARTFRDCN_AuditFields;
    CREATE TABLE dbo.U_EHARTFRDCN_AuditFields (aTableName varchar(30),aFieldName varchar(30));

    INSERT INTO dbo.U_EHARTFRDCN_AuditFields VALUES ('EmpComp','EecDateOfTermination');

    -- Create audit table based on fields defined above
    IF OBJECT_ID('U_EHARTFRDCN_Audit','U') IS NOT NULL
        DROP TABLE dbo.U_EHARTFRDCN_Audit;
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
    INTO dbo.U_EHARTFRDCN_Audit
    FROM dbo.vw_AuditData WITH (NOLOCK) 
    JOIN dbo.U_EHARTFRDCN_AuditFields WITH (NOLOCK) 
        ON audTableName = aTableName
        AND audFieldName = aFieldName
    WHERE audDateTime BETWEEN @StartDate AND @EndDate
    AND audAction <> 'DELETE'
	AND EXISTS (SELECT 1 FROM dbo.U_EHARTFRDCN_EEList WHERE xEEID = audKey1Value);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EHARTFRDCN_Audit ON dbo.U_EHARTFRDCN_Audit (audEEID,audKey2);

	-- Only allow recent terms keyed within the date range of interface.
	DELETE EEList 
	FROM dbo.U_EHARTFRDCN_EEList EEList 
	INNER JOIN dbo.EmpComp
	    ON xCoID = EecCoID
		AND xEEID = EecEEID
		AND EecEmplStatus = 'T'
	    AND NOT EXISTS (	
			SELECT 1 FROM dbo.U_EHARTFRDCN_Audit 
	        WHERE xCoID = audKey2 
			AND xEEID = audEEID 
			AND audRowNo = 1
			AND audFieldName = 'EecDateOfTermination' 
			AND audNewValue IS NOT NULL
			AND CONVERT(DATETIME, audNewValue) <= @EndDate -- No future term dates.
		);

    --==========================================
    -- Create Deduction List
    --==========================================
    DECLARE @DedList VARCHAR(MAX)
    SET @DedList = 'AACC2,BADD,ACRT2,ERLTD,GHI2,CADD2,CLF2,ADD2,VLIF2,VLTD2,SADD2,SLF2,BLIFE,STD1,CRT1,CRT2,CRT3,CRT4';

    IF OBJECT_ID('U_EHARTFRDCN_DedList','U') IS NOT NULL
        DROP TABLE dbo.U_EHARTFRDCN_DedList;
    SELECT DISTINCT
         DedCode = DedDedCode
        ,DedType = DedDedType
    INTO dbo.U_EHARTFRDCN_DedList
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
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'RelationshipsSpouse','SPS');
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'RelationshipsChild','CHL,STC');

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

    -- Calculated benefits amounts. dbo.U_dsi_bdm_BenCalculationAmounts
    EXEC dbo.dsi_bdm_sp_CalculateBenefitAmounts @FormatCode;

	-- Get benefits amount from BenCalculationAmounts table.
	UPDATE bdm
		SET BdmUSGField1 = ISNULL(BcaBenAmtCalc, BcaBenAmt)
	FROM dbo.U_dsi_BDM_EHARTFRDCN bdm
	INNER JOIN dbo.U_dsi_bdm_BenCalculationAmounts
		ON BcaEEID = BdmEEID
		AND BcaCoID = BdmCoID
		AND ISNULL(BdmDepRecID, '') = ISNULL(BdmDepRecID, '')
		AND BcaDedCode = BdmDedCode
		AND BcaFormatCode = 'EHARTFRDCN'
	;

	-- Update Benefit options, client is not linking the proper option.
	UPDATE main SET
		main.BdmBenOption = 
			CASE 
				WHEN (emp.BdmDedCode IS NOT NULL AND chl.BdmDedCode IS NOT NULL AND sps.BdmDedCode IS NOT NULL) THEN 'FAM'
				WHEN (emp.BdmDedCode IS NOT NULL AND chl.BdmDedCode IS NOT NULL) THEN 'EECH'
				WHEN (emp.BdmDedCode IS NOT NULL AND sps.BdmDedCode IS NOT NULL) THEN 'EESP'
				ELSE 'EE'
			END
	FROM dbo.U_dsi_bdm_EHARTFRDCN main
	INNER JOIN dbo.U_dsi_bdm_EHARTFRDCN emp
		ON emp.BdmEEID = main.BdmEEID
		AND emp.BdmCoID = main.BdmCoID
		AND emp.BdmDedCode = main.BdmDedCode
		AND emp.BdmRecType = 'EMP'
	LEFT JOIN dbo.U_dsi_bdm_EHARTFRDCN chl
		ON chl.BdmEEID = main.BdmEEID
		AND chl.BdmCoID = main.BdmCoID
		AND chl.BdmDedCode = main.BdmDedCode
		AND chl.BdmRelationship IN ('CHL', 'STC')
	LEFT JOIN dbo.U_dsi_bdm_EHARTFRDCN sps
		ON sps.BdmEEID = main.BdmEEID
		AND sps.BdmCoID = main.BdmCoID
		AND sps.BdmDedCode = main.BdmDedCode
		AND sps.BdmRelationship IN ('SPS')
	;

	--================================
	-- Working Tables
	--================================
	----------------------------------
	-- Working Table - U_EHARTFRDCN_Supervisor
	----------------------------------
    IF OBJECT_ID('U_EHARTFRDCN_Supervisor','U') IS NOT NULL
        DROP TABLE dbo.U_EHARTFRDCN_Supervisor;
	SELECT DISTINCT
		SupEmpEEID = emp.EecEEID
		,SupEmpCoID = emp.EecCoID
		,SupNameLast = EepNameLast
		,SupNameFirst = EepNameFirst
		,SupPhoneBusinessNumber = sup.EecPhoneBusinessNumber
		,SupAddressEmail = EepAddressEmail
	INTO dbo.U_EHARTFRDCN_Supervisor
	FROM dbo.U_EHARTFRDCN_EEList WITH (NOLOCK)
	INNER JOIN dbo.EmpComp emp WITH (NOLOCK)
		ON emp.EecEEID = xEEID
		AND emp.EecCoID = xCoID
	INNER JOIN dbo.EmpComp sup WITH (NOLOCK)
		ON sup.EecEEID = emp.EecSupervisorID
		AND sup.EecEmplStatus = 'A'
	INNER JOIN dbo.EmpPers WITH (NOLOCK)
		ON EepEEID = sup.EecEEID
	;

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EHARTFRDCN_Supervisor ON dbo.U_EHARTFRDCN_Supervisor (SupEmpEEID, SupEmpCoID);

	----------------------------------
	-- Working Table - U_EHARTFRDCN_PearHist
	----------------------------------
    IF OBJECT_ID('U_EHARTFRDCN_PEarHist','U') IS NOT NULL
        DROP TABLE dbo.U_EHARTFRDCN_PEarHist;
	SELECT DISTINCT
		PehEEID
		,PehPayDate = MAX(PehPayDate)
		,PehLast12MonthsHours = SUM(PehCurHrs)
		,PehNumberOfWeeks = DATEDIFF(WEEK, MIN(PehPayDate), MAX(PehPayDate))
	INTO dbo.U_EHARTFRDCN_PEarHist
	FROM dbo.PEarHist WITH (NOLOCK)
	WHERE PehEarnCode IN ('REG', 'OVTME', 'SREG', 'MGREG')
	AND PehPerControl BETWEEN @Last12MonthsPerControl AND @EndPerControl
	GROUP BY PehEEID
	HAVING SUM(PehCurHrs) <> 0.00;

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EHARTFRDCN_PEarHist ON dbo.U_EHARTFRDCN_PEarHist (PehEEID);


    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_EHARTFRDCN_DrvTbl_D11
    ---------------------------------
    IF OBJECT_ID('U_EHARTFRDCN_DrvTbl_D11','U') IS NOT NULL
        DROP TABLE dbo.U_EHARTFRDCN_DrvTbl_D11;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvDepRecID = main.BdmDepRecId
        ,drvInitialSort = MAX(EepSSN)
        ,drvSubSort = MAX(
			CASE
				WHEN main.BdmRecType = 'EMP' THEN '0'
				WHEN main.BdmRelationship = 'SPS' THEN '1'
				ELSE '2'
			END)
        -- standard fields above and additional driver fields below
        ,drvTransactionCode = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN 'E' ELSE 'D' END)
        ,drvEepSSN = MAX(eepSSN)
        ,drvEmpNo = MAX(EecEmpNo)
        ,drvConSSN = MAX(CASE WHEN main.BdmRecType = 'DEP' THEN ConSSN END)
        ,drvRelationshipCode = MAX(
			CASE 
				WHEN main.BdmRecType = 'DEP' AND main.BdmRelationship = 'SPS' THEN 'SP' 
				WHEN main.BdmRecType = 'DEP' AND main.BdmRelationship IN ('CHL', 'STC') THEN 'CH'
			END)
        ,drvLastName = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN EepNameLast ELSE ConNameLast END)
        ,drvFirstName = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN EepNameFirst ELSE ConNameFirst END)
        ,drvNameMiddle = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN LEFT(EepNameMiddle,1) ELSE LEFT(ConNameMiddle,1) END)
        ,drvNamePrefix = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN EepNamePrefix END) 
        ,drvNameSuffix = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN EepNameSuffix ELSE ConNameSuffix END)
        ,drvDateOfBirth = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN EepDateOfBirth ELSE ConDateOfBirth END)
        ,drvMaritalStatus = MAX(
			CASE WHEN main.BdmRecType = 'EMP' THEN 
				CASE eepMaritalStatus 
					WHEN 'S' THEN 'I'
					WHEN 'M' THEN 'M'
					WHEN 'D' THEN 'S'
					ELSE 'I'
				END
			END)
        ,drvGender = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN EepGender ELSE ConGender END)
        ,drvAddressLine1 = MAX(EepAddressLine1)
        ,drvAddressLine2 = MAX(EepAddressLine2)
        ,drvAddressCity = MAX(EepAddressCity)
        ,drvAddressState = MAX(EepAddressState)
        ,drvAddressZipCode = MAX(EepAddressZipCode)
        ,drvPhoneHomeNumber = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN EepPhoneHomeNumber END)
        ,drvEmployeeCellPhone = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN EfoPhoneNumber END)
        ,drvAddressEmailAlternate = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN EepAddressEMailAlternate END)
        ,drvAddressEmail = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN EepAddressEMail END)
        ,drvStateSUI = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN LEFT(RTRIM(LTRIM(EecStateSUI)), 2) END)
        ,drvEmployeeWorkAddressCountryCode = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN '840' END)
		,drvPhoneBusinessNumber = MAX(EecPhoneBusinessNumber)
        ,drvSupervisorLastName = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN SupNameLast END)
        ,drvSupervisorFirstName = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN SupNameFirst END)
        ,drvSupervisorWorkPhoneNumber = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN SupPhoneBusinessNumber END)
        ,drvSupervisorEmailAddress = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN SupAddressEmail END)
        ,drvEmployeeStatusCode = MAX(
			CASE WHEN main.BdmRecType = 'EMP' THEN
				CASE 
					WHEN EecEmplStatus = 'L' THEN 'L'
					WHEN EecEmplStatus = 'T' THEN 
						CASE
							WHEN EecTermReason = '203' THEN 'D'
							WHEN EecTermReason = '202' THEN 'R'
							ELSE 'T'
						END
					ELSE 'A'
				END
			END)
        ,drvEmployeeStatusEffectiveDate = MAX(
			CASE WHEN main.BdmRecType = 'EMP' THEN
				CASE 
					WHEN EecEmplStatus = 'L' THEN EecEmplStatusStartDate
					WHEN EecEmplStatus = 'T' THEN EecDateOfTermination
					ELSE EecDateOfLastHire
				END
			END)
        ,drvDateOfLastHire = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN EecDateOfLastHire END)
        ,drvDateOfOriginalHire = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN EecDateOfOriginalHire END)
        ,drvFullTimeOrPartTime = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN EecFullTimeOrPartTime END)
        ,drvExemptNonExempt = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN IIF(EecSalaryOrHourly = 'S', 'E', 'N') END)
        ,drvSheduledWorkHrs = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), (EecScheduledWorkHrs / 2))), '.', '') END)
        ,drvAnnSalary = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), EecAnnSalary)), '.', '') END)
        ,drvSalaryBasis = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN 'A' END)
        ,drvSalaryEffectiveDate = CASE WHEN main.BdmRecType = 'EMP' THEN COALESCE((SELECT MAX(EjhJobEffDate) FROM dbo.EmpHJob WITH (NOLOCK) WHERE EjhEEID = xEEID AND EjhCoID = xCoID AND EjhIsRateChange = 'Y'), MAX(EecDateOfLastHire)) END
        ,drvPayPeriod = MAX(CASE WHEN main.BdmRecType = 'EMP' THEN EecPayPeriod END)
        ,drvJobTitle =  MAX(CASE WHEN main.BdmRecType = 'EMP' THEN JbcDesc END)
        ,drvCoverageEffectiveDateNST = MAX(CASE WHEN nst.BdmRecType = 'EMP' THEN nst.BdmBenStartDate END)
        ,drvCoverageTerminationDateNST = MAX(CASE WHEN nst.BdmRecType = 'EMP' THEN nst.BdmBenStopDate END)
        ,drvPlanSummaryNST = MAX(CASE WHEN nst.BdmRecType = 'EMP' THEN '1A1' END)
        ,drvEmployeeGroupIDNST = MAX(
			CASE WHEN nst.BdmRecType = 'EMP' THEN 
				CASE
					WHEN CmpCompanyCode = 'AO' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '12'
					WHEN CmpCompanyCode = 'AB' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '9'
					WHEN CmpCompanyCode = 'AG' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '24'
					WHEN CmpCompanyCode = 'AI' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '25'
					WHEN CmpCompanyCode = 'AC' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '15'
					WHEN CmpCompanyCode IN ('AP', 'AL') AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '18'
				END
			END)
        ,drvEmployeeClassCodeNST = MAX(CASE WHEN nst.BdmRecType = 'EMP' THEN '1' END)
        ,drvCoverageEffectiveDateLTD = MAX(CASE WHEN ltd.BdmRecType = 'EMP' THEN ltd.BdmBenStartDate END)
        ,drvCoverageTerminationDateLTD =  MAX(CASE WHEN ltd.BdmRecType = 'EMP' THEN ltd.BdmBenStopDate END)
		,drvLTDCoveragePlanOptionLTD = MAX(CASE WHEN ltd.BdmRecType = 'EMP' THEN '60' END)
        ,drvPlanSummaryLTD = MAX(CASE WHEN ltd.BdmRecType = 'EMP' THEN '1B1' END)
        ,drvEmployeeGroupIDLTD = MAX(
			CASE WHEN ltd.BdmRecType = 'EMP' THEN 
				CASE
					WHEN CmpCompanyCode = 'AO' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '11'
					WHEN CmpCompanyCode = 'AB' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '8'
					WHEN CmpCompanyCode = 'AG' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '20'
					WHEN CmpCompanyCode = 'AI' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '23'
					WHEN CmpCompanyCode = 'AC' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '14'
					WHEN CmpCompanyCode IN ('AP', 'AL') AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '17'
				END
			END)
        ,drvEmployeeClassCodeLTD = MAX(CASE WHEN ltd.BdmRecType = 'EMP' THEN '1' END)
        ,drvCoverageEffectiveDateBLF = MAX(CASE WHEN blf.BdmRecType = 'EMP' THEN blf.BdmBenStartDate END)
        ,drvCoverageTerminationDateBLF = MAX(CASE WHEN blf.BdmRecType = 'EMP' THEN blf.BdmBenStopDate END)
		,drvBasicLifeMultipleSalaryFaceAmountBLF = MAX(CASE WHEN blf.BdmRecType = 'EMP' THEN REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), blf.BdmUSGField1)), '.', '') END)
        ,drvEmployeeGroupIDBLF = MAX(
			CASE WHEN blf.BdmRecType = 'EMP' THEN 
				CASE
					WHEN CmpCompanyCode = 'AO' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '10'
					WHEN CmpCompanyCode = 'AB' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '7'
					WHEN CmpCompanyCode = 'AG' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '19'
					WHEN CmpCompanyCode = 'AI' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '22'
					WHEN CmpCompanyCode = 'AC' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '13'
					WHEN CmpCompanyCode IN ('AP', 'AL') AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '16'
				END
			END)
        ,drvEmployeeClassCodeBLF = MAX(
			CASE WHEN blf.BdmRecType = 'EMP' THEN
				CASE
					WHEN EecFullTimeOrPartTime = 'F' AND EecJobCode IN ('TB07', 'TB05', 'TB14', '0008', 'MIT', 'MITHRLY', '9050', '0005', 'TB06', '0004', '0003') THEN '2'
					WHEN EecFullTimeOrPartTime = 'F' THEN '1'
				END
			END)
        ,drvCoverageEffectiveDateBAD = MAX(CASE WHEN bad.BdmRecType = 'EMP' THEN bad.BdmBenStartDate END)
        ,drvCoverageTerminationDateBAD = MAX(CASE WHEN bad.BdmRecType = 'EMP' THEN bad.BdmBenStopDate END)
        ,drvBasicADDFaceAmountBAD = MAX(CASE WHEN bad.BdmRecType = 'EMP' THEN REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), bad.BdmUSGField1)), '.', '') END)
        ,drvEmployeeGroupIDBAD = MAX(
			CASE WHEN bad.BdmRecType = 'EMP' THEN 
				CASE
					WHEN CmpCompanyCode = 'AO' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '10'
					WHEN CmpCompanyCode = 'AB' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '7'
					WHEN CmpCompanyCode = 'AG' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '19'
					WHEN CmpCompanyCode = 'AI' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '22'
					WHEN CmpCompanyCode = 'AC' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '13'
					WHEN CmpCompanyCode IN ('AP', 'AL') AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '16'
				END
			END)
        ,drvEmployeeClassCodeBAD = MAX(
			CASE WHEN bad.BdmRecType = 'EMP' THEN
				CASE
					WHEN EecFullTimeOrPartTime = 'F' AND EecJobCode IN ('TB07', 'TB05', 'TB14', '0008', 'MIT', 'MITHRLY', '9050', '0005', 'TB06', '0004', '0003') THEN '2'
					WHEN EecFullTimeOrPartTime = 'F' THEN '1'
				END
			END)
        ,drvCoverageEffectiveDateLIF = MAX(CASE WHEN lif.BdmRecType = 'EMP' THEN lif.BdmBenStartDate END)
        ,drvCoverageTerminationDateLIF = MAX(CASE WHEN lif.BdmRecType = 'EMP' THEN lif.BdmBenStopDate END)
        ,drvSuppLifeSalaryFaceAmountLIF = MAX(CASE WHEN lif.BdmRecType = 'EMP' THEN REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), lif.BdmUSGField1)), '.', '') END)
        ,drvEmployeeGroupILIF = MAX(
			CASE WHEN lif.BdmRecType = 'EMP' THEN 
				CASE
					WHEN CmpCompanyCode = 'AO' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '10'
					WHEN CmpCompanyCode = 'AB' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '7'
					WHEN CmpCompanyCode = 'AG' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '19'
					WHEN CmpCompanyCode = 'AI' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '22'
					WHEN CmpCompanyCode = 'AC' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '13'
					WHEN CmpCompanyCode IN ('AP', 'AL') AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '16'
				END
			END)
        ,drvEmployeeClassCodeLIF = MAX(
			CASE WHEN lif.BdmRecType = 'EMP' THEN
				CASE
					WHEN EecFullTimeOrPartTime = 'F' AND EecJobCode IN ('TB07', 'TB05', 'TB14', '0008', 'MIT', 'MITHRLY', '9050', '0005', 'TB06', '0004', '0003') THEN '2'
					WHEN EecFullTimeOrPartTime = 'F' THEN '1'
				END
			END)
        ,drvCoverageEffectiveDateADD = MAX(CASE WHEN add2.BdmRecType = 'EMP' THEN add2.BdmBenStartDate END)
        ,drvCoverageTerminationDateADD = MAX(CASE WHEN add2.BdmRecType = 'EMP' THEN add2.BdmBenStopDate END)
        ,drvSuppSalaryFaceAmountADD = MAX(CASE WHEN add2.BdmRecType = 'EMP' THEN REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), add2.BdmUSGField1)), '.', '') END)
        ,drvEmployeeGroupIDADD = MAX(
			CASE WHEN add2.BdmRecType = 'EMP' THEN 
				CASE
					WHEN CmpCompanyCode = 'AO' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '10'
					WHEN CmpCompanyCode = 'AB' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '7'
					WHEN CmpCompanyCode = 'AG' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '19'
					WHEN CmpCompanyCode = 'AI' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '22'
					WHEN CmpCompanyCode = 'AC' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '13'
					WHEN CmpCompanyCode IN ('AP', 'AL') AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '16'
				END
			END)
        ,drvEmployeeClassCodeADD = MAX(
			CASE WHEN add2.BdmRecType = 'EMP' THEN
				CASE
					--WHEN EecFullTimeOrPartTime = 'F' AND EecJobCode IN ('TB07', 'TB05', 'TB14', '0008', 'MIT', 'MITHRLY', '9050', '0005', 'TB06', '0004', '0003') THEN '2'
					WHEN EecFullTimeOrPartTime = 'F' THEN '1'
				END
			END)
        ,drvCoverageEffectiveDateSPL = MAX(CASE WHEN spl.BdmRecType = 'DEP' THEN spl.BdmBenStartDate END)
        ,drvCoverageTerminationDateSPL = MAX(CASE WHEN spl.BdmRecType = 'DEP' THEN spl.BdmBenStopDate END)
        ,drvSpouseSuppFaceAmountSPL = MAX(CASE WHEN spl.BdmRecType = 'DEP' THEN REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), spl.BdmUSGField1)), '.', '') END)
        ,drvEmployeeGroupIDSPL = MAX(
			CASE WHEN spl.BdmRecType = 'DEP' THEN 
				CASE
					WHEN CmpCompanyCode = 'AO' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '10'
					WHEN CmpCompanyCode = 'AB' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '7'
					WHEN CmpCompanyCode = 'AG' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '19'
					WHEN CmpCompanyCode = 'AI' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '22'
					WHEN CmpCompanyCode = 'AC' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '13'
					WHEN CmpCompanyCode IN ('AP', 'AL') AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '16'
				END
			END)
        ,drvEmployeeClassSPL = MAX(CASE WHEN spl.BdmRecType = 'DEP' THEN '1' END)
        ,drvCoverageEffectiveDateDPL = MAX(CASE WHEN dpl.BdmRecType = 'DEP' THEN dpl.BdmBenStartDate END)
        ,drvCoverageTerminationDateDPL = MAX(CASE WHEN dpl.BdmRecType = 'DEP' THEN dpl.BdmBenStopDate END)
        ,drvDependentSuppFaceAmountDPL = MAX(CASE WHEN dpl.BdmRecType = 'DEP' THEN REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), dpl.BdmUSGField1)), '.', '') END)
        ,drvEmployeeGroupIDDPL = MAX(
			CASE WHEN dpl.BdmRecType = 'DEP' THEN 
				CASE
					WHEN CmpCompanyCode = 'AO' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '10'
					WHEN CmpCompanyCode = 'AB' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '7'
					WHEN CmpCompanyCode = 'AG' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '19'
					WHEN CmpCompanyCode = 'AI' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '22'
					WHEN CmpCompanyCode = 'AC' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '13'
					WHEN CmpCompanyCode IN ('AP', 'AL') AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '16'
				END
			END)
        ,drvEmployeeClassDPL = MAX(CASE WHEN dpl.BdmRecType = 'DEP' THEN '1' END)
        ,drvCoverageEffectiveDateSAD = MAX(CASE WHEN sad.BdmRecType = 'DEP' THEN sad.BdmBenStartDate END)
        ,drvCoverageTerminationDateSAD = MAX(CASE WHEN sad.BdmRecType = 'DEP' THEN sad.BdmBenStopDate END)
        ,drvSpouseSuppFaceAmountSAD = MAX(CASE WHEN sad.BdmRecType = 'DEP' THEN REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), sad.BdmUSGField1)), '.', '') END)
        ,drvEmployeeGroupIDSAD = MAX(
			CASE WHEN sad.BdmRecType = 'DEP' THEN 
				CASE
					WHEN CmpCompanyCode = 'AO' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '10'
					WHEN CmpCompanyCode = 'AB' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '7'
					WHEN CmpCompanyCode = 'AG' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '19'
					WHEN CmpCompanyCode = 'AI' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '22'
					WHEN CmpCompanyCode = 'AC' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '13'
					WHEN CmpCompanyCode IN ('AP', 'AL') AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '16'
				END
			END)
        ,drvEmployeeClassSAD = MAX(CASE WHEN sad.BdmRecType = 'DEP' THEN '1' END)
        ,drvCoverageEffectiveDateDCA = MAX(CASE WHEN dca.BdmRecType = 'DEP' THEN dca.BdmBenStartDate END)
        ,drvCoverageTerminationDCA = MAX(CASE WHEN dca.BdmRecType = 'DEP' THEN dca.BdmBenStopDate END)
        ,drvDependentSuppFaceAmountDCA = MAX(CASE WHEN dca.BdmRecType = 'DEP' THEN REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), dca.BdmUSGField1)), '.', '') END)
        ,drvEmployeeGroupIDDCA = MAX(
			CASE WHEN dca.BdmRecType = 'DEP' THEN 
				CASE
					WHEN CmpCompanyCode = 'AO' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '10'
					WHEN CmpCompanyCode = 'AB' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '7'
					WHEN CmpCompanyCode = 'AG' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '19'
					WHEN CmpCompanyCode = 'AI' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '22'
					WHEN CmpCompanyCode = 'AC' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '13'
					WHEN CmpCompanyCode IN ('AP', 'AL') AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '16'
				END
			END)
        ,drvEmployeeClassDCA = MAX(CASE WHEN dca.BdmRecType = 'DEP' THEN '1' END)
        ,drvCoverageEffectiveDateVCI = MAX(vci.BdmBenStartDate)
        ,drvCoverageTerminationDateVCI = MAX(vci.BdmBenStopDate)
        ,drvCIBenefitAmountVCI = MAX(REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), vci.BdmUSGField1)), '.', ''))
        ,drvCoverageTierVCI = MAX(
			CASE
				WHEN vci.BdmBenOption = 'EE' THEN '1'
				WHEN vci.BdmBenOption = 'FAM' THEN '2'
				WHEN vci.BdmBenOption = 'EESP' THEN '3'
				WHEN vci.BdmBenOption = 'EECH' THEN '4'
			END)
        ,drvPlanNumberVCI = MAX(CASE WHEN vci.BdmDedCode IS NOT NULL THEN '1' END)
        ,drvEmployeeGroupIDVCI = MAX(
			CASE WHEN vci.BdmDedCode IS NOT NULL THEN 
				CASE
					WHEN CmpCompanyCode = 'AO' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '2'
					WHEN CmpCompanyCode = 'AB' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '1'
					WHEN CmpCompanyCode = 'AG' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '5'
					WHEN CmpCompanyCode = 'AI' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '6'
					WHEN CmpCompanyCode = 'AC' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '3'
					WHEN CmpCompanyCode IN ('AP', 'AL') AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '4'
				END
			END)
        ,drvEmployeeClassVCI = MAX(CASE WHEN vci.BdmDedCode IS NOT NULL THEN '1' END)
        ,drvCoverageEffectiveDateVAC = MAX(vac.BdmBenStartDate)
        ,drvCoverageTerminationDateVAC = MAX(vac.BdmBenStopDate)
        ,drvCoverageTierVAC = MAX(
			CASE
				WHEN vac.BdmBenOption = 'EE' THEN '1'
				WHEN vac.BdmBenOption = 'FAM' THEN '2'
				WHEN vac.BdmBenOption = 'EESP' THEN '3'
				WHEN vac.BdmBenOption = 'EECH' THEN '4'
			END)
        ,drvPlanOptionVAC = MAX(CASE WHEN vac.BdmDedCode IS NOT NULL THEN 'PLAN 2' END)
        ,drvPlanNumberVAC = MAX(CASE WHEN vac.BdmDedCode IS NOT NULL THEN '1' END)
        ,drvEmployeeGroupIDVAC = MAX(
			CASE WHEN vac.BdmDedCode IS NOT NULL THEN 
				CASE
					WHEN CmpCompanyCode = 'AO' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '2'
					WHEN CmpCompanyCode = 'AB' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '1'
					WHEN CmpCompanyCode = 'AG' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '5'
					WHEN CmpCompanyCode = 'AI' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '6'
					WHEN CmpCompanyCode = 'AC' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '3'
					WHEN CmpCompanyCode IN ('AP', 'AL') AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '4'
				END
			END)
        ,drvEmployeeClassVAC = MAX(CASE WHEN vac.BdmDedCode IS NOT NULL THEN '1' END)
        ,drvCoverageEffectiveDateHIP = MAX(hip.BdmBenStartDate)
        ,drvCoverageTerminationDateHIP = MAX(hip.BdmBenStopDate)
        ,drvCoverageTierHIP = MAX(
			CASE
				WHEN hip.BdmBenOption = 'EE' THEN '1'
				WHEN hip.BdmBenOption = 'FAM' THEN '2'
				WHEN hip.BdmBenOption = 'EESP' THEN '3'
				WHEN hip.BdmBenOption = 'EECH' THEN '4'
			END)
        ,drvPlanOptionHIP =  MAX(CASE WHEN hip.BdmDedCode IS NOT NULL THEN 'MID PLAN' END)
        ,drvPlanNumberHIP = MAX(CASE WHEN hip.BdmDedCode IS NOT NULL THEN '1' END)
        ,drvEmployeeGroupIDHIP = MAX(
			CASE WHEN hip.BdmDedCode IS NOT NULL THEN 
				CASE
					WHEN CmpCompanyCode = 'AO' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '2'
					WHEN CmpCompanyCode = 'AB' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '1'
					WHEN CmpCompanyCode = 'AG' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '5'
					WHEN CmpCompanyCode = 'AI' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '6'
					WHEN CmpCompanyCode = 'AC' AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '3'
					WHEN CmpCompanyCode IN ('AP', 'AL') AND EecDedGroupCode IN('HRLY', 'SLRY') AND EecFullTimeOrPartTime = 'F' THEN '4'
				END
			END)
        ,drvEmployeeClassHIP = MAX(CASE WHEN hip.BdmDedCode IS NOT NULL THEN '1' END)
        ,drvLast12MonthsHours = MAX(REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), PehLast12MonthsHours)), '.', '') )
		,drvCumulativeHoursEndDate = MAX(COALESCE(PehPayDate, GETDATE()))
        ,drvCumulativeHoursNumberOfWeeks = MAX(CONVERT(VARCHAR, CASE WHEN PehNumberOfWeeks = 0 THEN 1 ELSE PehNumberOfWeeks END))
    INTO dbo.U_EHARTFRDCN_DrvTbl_D11
    FROM dbo.U_EHARTFRDCN_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
	INNER JOIN dbo.Company WITH (NOLOCK)
		ON CmpCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    JOIN dbo.JobCode WITH (NOLOCK)
        ON JbcJobCode = EecJobCode
    JOIN dbo.U_dsi_BDM_EHARTFRDCN main WITH (NOLOCK)
        ON main.BdmEEID = xEEID 
        AND main.BdmCoID = xCoID
	LEFT JOIN dbo.Contacts WITH (NOLOCK)
		ON ConsystemID = main.BdmDepRecID
    LEFT JOIN dbo.U_dsi_BDM_EHARTFRDCN nst WITH (NOLOCK)
        ON nst.BdmEEID = xEEID 
        AND nst.BdmCoID = xCoID
		AND ISNULL(nst.BdmDepRecID, '') = ISNULL(main.BdmDepRecID, '')
		AND nst.BdmDedCode = 'STD1'
    LEFT JOIN dbo.U_dsi_BDM_EHARTFRDCN ltd WITH (NOLOCK)
        ON ltd.BdmEEID = xEEID 
        AND ltd.BdmCoID = xCoID
		AND ISNULL(ltd.BdmDepRecID, '') = ISNULL(main.BdmDepRecID, '')
		AND ltd.BdmDedCode IN ('VLTD2', 'ERLTD')
    LEFT JOIN dbo.U_dsi_BDM_EHARTFRDCN blf WITH (NOLOCK)
        ON blf.BdmEEID = xEEID 
        AND blf.BdmCoID = xCoID
		AND ISNULL(blf.BdmDepRecID, '') = ISNULL(main.BdmDepRecID, '')
		AND blf.BdmDedCode = 'BLIFE'
    LEFT JOIN dbo.U_dsi_BDM_EHARTFRDCN bad WITH (NOLOCK)
        ON bad.BdmEEID = xEEID 
        AND bad.BdmCoID = xCoID
		AND ISNULL(bad.BdmDepRecID, '') = ISNULL(main.BdmDepRecID, '')
		AND bad.BdmDedCode = 'BLIFE'
    LEFT JOIN dbo.U_dsi_BDM_EHARTFRDCN lif WITH (NOLOCK)
        ON lif.BdmEEID = xEEID 
        AND lif.BdmCoID = xCoID
		AND ISNULL(lif.BdmDepRecID, '') = ISNULL(main.BdmDepRecID, '')
		AND lif.BdmDedCode = 'BLIFE'
    LEFT JOIN dbo.U_dsi_BDM_EHARTFRDCN add2 WITH (NOLOCK)
        ON add2.BdmEEID = xEEID 
        AND add2.BdmCoID = xCoID
		AND ISNULL(add2.BdmDepRecID, '') = ISNULL(main.BdmDepRecID, '')
		AND add2.BdmDedCode = 'BLIFE'
    LEFT JOIN dbo.U_dsi_BDM_EHARTFRDCN spl WITH (NOLOCK)
        ON spl.BdmEEID = xEEID 
        AND spl.BdmCoID = xCoID
		AND ISNULL(spl.BdmDepRecID, '') = ISNULL(main.BdmDepRecID, '')
		AND spl.BdmDedCode = 'SLF2'
    LEFT JOIN dbo.U_dsi_BDM_EHARTFRDCN dpl WITH (NOLOCK)
        ON dpl.BdmEEID = xEEID 
        AND dpl.BdmCoID = xCoID
		AND ISNULL(dpl.BdmDepRecID, '') = ISNULL(main.BdmDepRecID, '')
		AND dpl.BdmDedCode = 'CLF2'
    LEFT JOIN dbo.U_dsi_BDM_EHARTFRDCN sad WITH (NOLOCK)
        ON sad.BdmEEID = xEEID 
        AND sad.BdmCoID = xCoID
		AND ISNULL(sad.BdmDepRecID, '') = ISNULL(main.BdmDepRecID, '')
		AND sad.BdmDedCode = 'SLF2'
    LEFT JOIN dbo.U_dsi_BDM_EHARTFRDCN dca WITH (NOLOCK)
        ON dca.BdmEEID = xEEID 
        AND dca.BdmCoID = xCoID
		AND ISNULL(dca.BdmDepRecID, '') = ISNULL(main.BdmDepRecID, '')
		AND dca.BdmDedCode = 'CLF2'
    LEFT JOIN dbo.U_dsi_BDM_EHARTFRDCN vci WITH (NOLOCK)
        ON vci.BdmEEID = xEEID 
        AND vci.BdmCoID = xCoID
		AND ISNULL(vci.BdmDepRecID, '') = ISNULL(main.BdmDepRecID, '')
		AND vci.BdmDedCode IN ('CRT1', 'CRT2', 'CRT3', 'CRT4')
    LEFT JOIN dbo.U_dsi_BDM_EHARTFRDCN vac WITH (NOLOCK)
        ON vac.BdmEEID = xEEID 
        AND vac.BdmCoID = xCoID
		AND ISNULL(vac.BdmDepRecID, '') = ISNULL(main.BdmDepRecID, '')
		AND vac.BdmDedCode = 'AACC2'
    LEFT JOIN dbo.U_dsi_BDM_EHARTFRDCN hip WITH (NOLOCK)
        ON hip.BdmEEID = xEEID 
        AND hip.BdmCoID = xCoID
		AND ISNULL(hip.BdmDepRecID, '') = ISNULL(main.BdmDepRecID, '')
		AND hip.BdmDedCode = 'GHI2'
	LEFT JOIN dbo.EmpMPhon WITH (NOLOCK)
		ON EfoEEID = xEEID 
		AND EfoPhoneType = 'CEL'
	LEFT JOIN dbo.U_EHARTFRDCN_Supervisor WITH (NOLOCK)
		ON supEmpEEID = xEEID
		AND supEmpCoID = xCoID
	LEFT JOIN dbo.U_EHARTFRDCN_PEarHist WITH (NOLOCK)
		ON PehEEID = xEEID
	GROUP BY xEEID, xCoID, main.BdmDepRecID, main.BdmRecType
	OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EHARTFRDCN_DrvTblD11 ON dbo.U_EHARTFRDCN_DrvTbl_D11 (drvEEID, drvCoID, drvDepRecID);

    --==========================================
    -- Set FileName
    --==========================================
    IF (dbo.dsi_fnVariable(@FormatCode,'UseFileName') = 'N')
    BEGIN
        UPDATE dbo.U_dsi_Parameters
            SET ExportFile = CASE WHEN dbo.dsi_fnVariable(@FormatCode,'Testing') = 'Y' THEN 'Test_ThomasJudy&Tucker_UltimateSoftware_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.txt'
                                  WHEN @ExportCode LIKE '%TEST%' THEN 'Test_ThomasJudy&Tucker_UltimateSoftware_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.txt'
                                  WHEN @ExportCode LIKE 'OE%' THEN 'ThomasJudy&Tucker _UltimateSoftware_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.txt'
                                  ELSE 'ThomasJudy&Tucker _UltimateSoftware_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.txt'
                             END
        WHERE FormatCode = @FormatCode;
    END

    ---------------------------------
    -- HEADER RECORD
    ---------------------------------
    IF OBJECT_ID('U_EHARTFRDCN_DrvTbl_H01','U') IS NOT NULL
        DROP TABLE dbo.U_EHARTFRDCN_DrvTbl_H01;
    SELECT
         drvFileName = (SELECT ExportFile FROM dbo.U_dsi_Parameters WITH (NOLOCK) WHERE FormatCode = @FormatCode)
        ,drvDateFileCreated = FORMAT(GETDATE(), 'yyyyMMdd hh:mm:ss tt')
    INTO dbo.U_EHARTFRDCN_DrvTbl_H01
    ;

    ---------------------------------
    -- TRAILER RECORD
    ---------------------------------
    IF OBJECT_ID('U_EHARTFRDCN_DrvTbl_T91','U') IS NOT NULL
        DROP TABLE dbo.U_EHARTFRDCN_DrvTbl_T91;
    SELECT
         drvRecordCount = (SELECT COUNT(*) FROM dbo.U_EHARTFRDCN_DrvTbl_D11 WITH (NOLOCK))
    INTO dbo.U_EHARTFRDCN_DrvTbl_T91
    ;

END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwEHARTFRDCN_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_EHARTFRDCN_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'EHARTFRDCN%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202006011'
       ,expStartPerControl     = '202006011'
       ,expLastEndPerControl   = '202006239'
       ,expEndPerControl       = '202006239'
WHERE expFormatCode = 'EHARTFRDCN';



    --------JOB NAME: Hartford Census Export (EHARTFRDCN) - Weekly, Saturday, 6:00am ET--------
    --Copy and paste this in environment to create job script

    BEGIN TRANSACTION
    DECLARE @ReturnCode INT, @JobName varchar(100), @dbName varchar(50)
    SELECT @ReturnCode = 0
    SELECT @JobName = RTRIM(REPLACE(DB_NAME(),'ULTIPRO_','')) + ' - Hartford Census Export (EHARTFRDCN) - Weekly, Saturday, 6:00am ET'
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
    EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Update AscExp Start/End Date (EHARTFRDCN)', 
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
WHERE expFormatCode = ''EHARTFRDCN''
  AND expExportCode = ''SCHEDULED'';',
            @database_name=@dbName,
            @flags=0
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

    -- Step 'Run SP'
    EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Create Export File (EHARTFRDCN)', 
            @step_id=2, 
            @cmdexec_success_code=0, 
            @on_success_action=1, 
            @on_success_step_id=0, 
            @on_fail_action=2, 
            @on_fail_step_id=0, 
            @retry_attempts=0, 
            @retry_interval=0, 
            @os_run_priority=0, @subsystem=N'TSQL', 
            @command=N'EXEC dbo.dsi_sp_TestSwitchbox_v2 ''EHARTFRDCN'', ''SCHEDULED'';', 
            @database_name=@dbName, 
            @flags=0
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
    EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
    EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Weekly, Saturday, 6:00am ET',
            @enabled=1, 
            @freq_type=8, 
            @freq_interval=64,  
            @freq_subday_type=1, 
            @freq_subday_interval=0, 
            @freq_relative_interval=0,
            @freq_recurrence_factor=1,
            @active_start_date=20200401,
            @active_end_date=99991231,
            @active_start_time=060000,
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
CREATE VIEW dbo.dsi_vwEHARTFRDCN_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_EHARTFRDCN_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort
