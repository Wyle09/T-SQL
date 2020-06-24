SET NOCOUNT ON;
IF OBJECT_ID('U_ESWRKSYTD_SavePath') IS NOT NULL DROP TABLE [dbo].[U_ESWRKSYTD_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_ESWRKSYTD_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'ESWRKSYTD' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwESWRKSYTD_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwESWRKSYTD_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_ESWRKSYTD') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_ESWRKSYTD];
GO
IF OBJECT_ID('U_ESWRKSYTD_PEarHist') IS NOT NULL DROP TABLE [dbo].[U_ESWRKSYTD_PEarHist];
GO
IF OBJECT_ID('U_ESWRKSYTD_File') IS NOT NULL DROP TABLE [dbo].[U_ESWRKSYTD_File];
GO
IF OBJECT_ID('U_ESWRKSYTD_EEList') IS NOT NULL DROP TABLE [dbo].[U_ESWRKSYTD_EEList];
GO
IF OBJECT_ID('U_ESWRKSYTD_DrvTbl_D11') IS NOT NULL DROP TABLE [dbo].[U_ESWRKSYTD_DrvTbl_D11];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'ESWRKSYTD';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'ESWRKSYTD';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'ESWRKSYTD';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'ESWRKSYTD';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'ESWRKSYTD';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCreateTClockBatches,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhRespectZeroPayRate,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhThirdPartyPay) VALUES ('N','C','Y','0','',NULL,'','N','','N','','013010','EMPEXPORT','CDE','ESWRKSYTD','Shareworks Demo & YTD Taxes Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','2000','N','S','N','ESWRKSYTD0Z0','N','Jan  1 1900 12:00AM','C','N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Participant Number"','1','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','1',NULL,'Participant Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Social Security Number"','2','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','2',NULL,'Social Security Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"First Name"','3','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','3',NULL,'First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Middle Name"','4','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','4',NULL,'Middle Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Last Name/ Corporation Name"','5','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','5',NULL,'Last Name/ Corporation Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Is A Corporate Entity?"','6','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','6',NULL,'Is A Corporate Entity?',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Date of Hire"','7','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','7',NULL,'Date of Hire',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Date of Birth"','8','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','8',NULL,'Date of Birth',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Home Phone"','9','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','9',NULL,'Home Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work Phone"','10','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','10',NULL,'Work Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Work Extension"','11','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','11',NULL,'Work Extension',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Personal Email"','12','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','12',NULL,'Personal Email',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Company Email"','13','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','13',NULL,'Company Email',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Home Address: Suite"','14','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','14',NULL,'Home Address: Suite',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Home Address: Street"','15','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','15',NULL,'Home Address: Street',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Home Address: City"','16','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','16',NULL,'Home Address: City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Home Address: State/Province"','17','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','17',NULL,'Home Address: State/Province',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Home Address: Country"','18','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','18',NULL,'Home Address: Country',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Home Address: Postal/Zip Code"','19','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','19',NULL,'Home Address: Postal/Zip Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Termination Date"','20','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','20',NULL,'Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Status: Active/Terminated"','21','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','21',NULL,'Status: Active/Terminated',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Termination Reason/Type"','22','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','22',NULL,'Termination Reason/Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Local Tax Jurisdiction"','23','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','23',NULL,'Local Tax Jurisdiction',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Local Tax Jurisdiction Rate"','24','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','24',NULL,'Local Tax Jurisdiction Rate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FICA Social Security- Release"','25','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','25',NULL,'FICA Social Security- Release',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SDI - Release"','26','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','26',NULL,'SDI - Release',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Federal - Release"','27','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','27',NULL,'Federal - Release',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Income YTD - Release"','28','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','28',NULL,'Income YTD - Release',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FICA Social Security- Exercise"','29','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','29',NULL,'FICA Social Security- Exercise',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SDI - Exercise"','30','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','30',NULL,'SDI - Exercise',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Federal - Exercise"','31','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','31',NULL,'Federal - Exercise',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Income YTD - Exercise"','32','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','32',NULL,'Income YTD - Exercise',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Custom Data Fields / Employee Groups"','33','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','33',NULL,'Custom Data Fields / Employee Groups',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Custom Data Fields / Employee Groups"','34','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','34',NULL,'Custom Data Fields / Employee Groups',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Custom Data Fields / Employee Groups"','35','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','35',NULL,'Custom Data Fields / Employee Groups',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Custom Data Fields / Employee Groups"','36','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','36',NULL,'Custom Data Fields / Employee Groups',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Custom Data Fields / Employee Groups"','37','(''DA''=''T,'')','ESWRKSYTD0Z0','50','H','01','37',NULL,'Custom Data Fields / Employee Groups',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Custom Data Fields / Employee Groups"','38','(''DA''=''T'')','ESWRKSYTD0Z0','50','H','01','38',NULL,'Custom Data Fields / Employee Groups',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','1','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','1',NULL,'Participant Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSSN"','2','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','2',NULL,'Social Security Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','3','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','3',NULL,'First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameMiddle"','4','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','4',NULL,'Middle Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','5','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','5',NULL,'Last Name/ Corporation Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"False"','6','(''DA''=''T,'')','ESWRKSYTD0Z0','50','D','11','6',NULL,'Is A Corporate Entity?',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfOriginalHire"','7','(''UD105''=''T,'')','ESWRKSYTD0Z0','50','D','11','7',NULL,'Date of Hire',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfBirth"','8','(''UD105''=''T,'')','ESWRKSYTD0Z0','50','D','11','8',NULL,'Date of Birth',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPhoneHomeNumber"','9','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','9',NULL,'Home Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPhoneBusinessNumber"','10','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','10',NULL,'Work Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPhoneBusinessExt"','11','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','11',NULL,'Work Extension',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressEmailAlternate"','12','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','12',NULL,'Personal Email',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressEmail"','13','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','13',NULL,'Company Email',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine1"','14','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','14',NULL,'Home Address: Suite',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine2"','15','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','15',NULL,'Home Address: Street',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressCity"','16','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','16',NULL,'Home Address: City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressState"','17','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','17',NULL,'Home Address: State/Province',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressCountry"','18','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','18',NULL,'Home Address: Country',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressZipCode"','19','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','19',NULL,'Home Address: Postal/Zip Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfTermination"','20','(''UD105''=''T,'')','ESWRKSYTD0Z0','50','D','11','20',NULL,'Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmplStatus"','21','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','21',NULL,'Status: Active/Terminated',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTerminationReasonType"','22','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','22',NULL,'Termination Reason/Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocalTaxJurisdiction"','23','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','23',NULL,'Local Tax Jurisdiction',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocalTaxJurisdictionRate"','24','(''UNT2''=''T,'')','ESWRKSYTD0Z0','50','D','11','24',NULL,'Local Tax Jurisdiction Rate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFicaSocialSecurityRelease"','25','(''UNT2''=''T,'')','ESWRKSYTD0Z0','50','D','11','25',NULL,'FICA Social Security- Release',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSdiRelease"','26','(''UNT2''=''T,'')','ESWRKSYTD0Z0','50','D','11','26',NULL,'SDI - Release',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFederalRelease"','27','(''UNT2''=''T,'')','ESWRKSYTD0Z0','50','D','11','27',NULL,'Federal - Release',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvIncomeYTDRelease"','28','(''UNT2''=''T,'')','ESWRKSYTD0Z0','50','D','11','28',NULL,'Income YTD - Release',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFicaSocialSecurityExercise"','29','(''UNT2''=''T,'')','ESWRKSYTD0Z0','50','D','11','29',NULL,'FICA Social Security- Exercise',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSdiExercise"','30','(''UNT2''=''T,'')','ESWRKSYTD0Z0','50','D','11','30',NULL,'SDI - Exercise',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFederalExercise"','31','(''UNT2''=''T,'')','ESWRKSYTD0Z0','50','D','11','31',NULL,'Federal - Exercise',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvIncomeYTDExercise"','32','(''UNT2''=''T,'')','ESWRKSYTD0Z0','50','D','11','32',NULL,'Income YTD - Exercise',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvOrgLvl1"','33','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','33',NULL,'Custom Data Fields / Employee Groups',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvOrgLvl2"','34','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','34',NULL,'Custom Data Fields / Employee Groups',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvOrgLvl3"','35','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','35',NULL,'Custom Data Fields / Employee Groups',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvProject"','36','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','36',NULL,'Custom Data Fields / Employee Groups',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvUDField07"','37','(''UA''=''T,'')','ESWRKSYTD0Z0','50','D','11','37',NULL,'Custom Data Fields / Employee Groups',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvUDField09"','38','(''UA''=''T'')','ESWRKSYTD0Z0','50','D','11','38',NULL,'Custom Data Fields / Employee Groups',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
DECLARE @UDSERVER varchar(5) = (SELECT RTRIM(LEFT(@@SERVERNAME,PATINDEX('%[0-9]%',@@SERVERNAME)) + SUBSTRING(@@SERVERNAME,PATINDEX('%UP[0-9]%',@@SERVERNAME)+2,1)));
SELECT @UDSERVER = CASE WHEN @UDSERVER = 'EW21' THEN 'WP6' WHEN @UDSERVER = 'EW22' THEN 'WP7' ELSE @UDSERVER END;
DECLARE @UDCOCODE varchar(5) = (SELECT RTRIM(CmmCompanyCode) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\ESWRKSYTD_20200430.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Shareworks OnDemand','202004309','EMPEXPORT','ONDMD_XOE',NULL,'ESWRKSYTD',NULL,NULL,NULL,'202004309','Apr 30 2020  3:21PM','Apr 30 2020  3:21PM','202004301',NULL,'EecEEType','REG','202004301',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\ESWRKSYTD_20200430.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Shareworks Scheduled','202004309','EMPEXPORT','SCHEDULED',NULL,'ESWRKSYTD',NULL,NULL,NULL,'202004309','Apr 30 2020  3:21PM','Apr 30 2020  3:21PM','202004301',NULL,'EecEEType','REG','202004301',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
UPDATE dbo.AscExp SET expAscFileName = CASE WHEN LEFT(@UDENV,2) IN ('NW','EW','WP') THEN REPLACE(REPLACE(expAscFileName,'[UDENV]',@UDENV),'[UDSERVER]',@UDSERVER) ELSE '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\ESWRKSYTD_20200430.txt' END WHERE expFormatCode = 'ESWRKSYTD';
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ESWRKSYTD','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ESWRKSYTD','ExportPath','V',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ESWRKSYTD','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ESWRKSYTD','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ESWRKSYTD','UseFileName','V','Y');
UPDATE dbo.U_dsi_Configuration SET CfgValue = CASE WHEN CfgName = 'UseFileName' THEN 'Y' ELSE NULL END WHERE FormatCode = 'ESWRKSYTD' AND CfgName IN ('UseFileName','ExportPath');
INSERT INTO dbo.CustomTemplates (CreationDate,Engine,EngineCode,IsActive,ModifiedDate) SELECT CreationDate = GETDATE(), Engine = AdhEngine, EngineCode = AdhFormatCode, IsActive = 1, ModifiedDate = GETDATE() FROM dbo.AscDefH WITH (NOLOCK) WHERE AdhFormatCode = 'ESWRKSYTD' AND NOT EXISTS(SELECT 1 FROM dbo.CustomTemplates WHERE EngineCode = AdhFormatCode);
IF OBJECT_ID('U_ESWRKSYTD_SavePath') IS NOT NULL DROP TABLE [dbo].[U_ESWRKSYTD_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ESWRKSYTD','D11','dbo.U_ESWRKSYTD_DrvTbl_D11',NULL);
IF OBJECT_ID('U_ESWRKSYTD_EEList') IS NULL
CREATE TABLE [dbo].[U_ESWRKSYTD_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_ESWRKSYTD_File') IS NULL
CREATE TABLE [dbo].[U_ESWRKSYTD_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(2000) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_ESWRKSYTD]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: Sidewalk Labs

Created By: Wyle Cordero
Business Analyst: Jackie Finn
Create Date: 04/30/2020
Service Request Number: SR-2019-00251293

Purpose: Shareworks Demo & YTD Taxes Export 

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2020     SR-2020-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'ESWRKSYTD';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'ESWRKSYTD';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'ESWRKSYTD';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'ESWRKSYTD';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'ESWRKSYTD' ORDER BY RunID DESC;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'ESWRKSYTD', 'ONDMD_XOE';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'ESWRKSYTD', @AllObjects = 'Y', @IsWeb = 'Y'
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
    SELECT @FormatCode = 'ESWRKSYTD';

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
    DELETE FROM dbo.U_ESWRKSYTD_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_ESWRKSYTD_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

	-- Include WHERE EepUDField08 =’Y’
	DELETE el
	FROM dbo.U_ESWRKSYTD_EEList el
	INNER JOIN dbo.EmpPers
		ON EepEEID = xEEID
		AND EepUDField08 <> 'Y'
	;

    -----------------------------
    -- Working Table - PEarHist
    -----------------------------
    IF OBJECT_ID('U_ESWRKSYTD_PEarHist','U') IS NOT NULL
        DROP TABLE dbo.U_ESWRKSYTD_PEarHist;
    SELECT DISTINCT
         PehEEID
        ,PehPayDate = MAX(PrgPayDate)
		,PehSuppWagesYTD = SUM(CASE WHEN PehIsSuppWages = 'Y' THEN PehCurAmt ELSE 0.00 END)
    INTO dbo.U_ESWRKSYTD_PEarHist
    FROM dbo.PayReg WITH (NOLOCK)
    JOIN dbo.PEarHist WITH (NOLOCK)
        ON PehGenNumber = PrgGenNumber
    WHERE LEFT(PehPerControl,4) = LEFT(@EndPerControl,4)
    AND PehPerControl <= @EndPerControl
    GROUP BY PehEEID
    HAVING SUM(PehCurAmt) <> 0.00;

	CREATE CLUSTERED INDEX CDX_U_ESWRKSYTD_PEarHist ON dbo.U_ESWRKSYTD_PEarHist (PehEEID, PehPayDate); 

    -----------------------------
    -- Working Table - PtaxHist
    -----------------------------
    IF OBJECT_ID('U_ESWRKSYTD_PTaxHist','U') IS NOT NULL
        DROP TABLE dbo.U_ESWRKSYTD_PtaxHist;
    SELECT DISTINCT
         PthEEID
        ,PthPayDate = MAX(PrgPayDate)
		,PthLocalTaxJurisdiction = MAX(CASE WHEN PthTypeOfTax = 'LIT' THEN LEFT(RTRIM(LTRIM(PthTaxCode)), 2) END)
		,PthCurTaxAmtYTD_LIT = SUM(CASE WHEN PthTypeOfTax = 'LIT' THEN PthCurTaxAmt ELSE 0.00 END)
		,PthCurTaxAmtYTD_USSOCER = SUM(CASE WHEN PthTaxCode = 'USSOCER' THEN PthCurTaxAmt ELSE 0.00 END)
		,PthCurTaxAmtYTD_SUISDI = SUM(CASE WHEN PthTypeOfTax IN ('SUI', 'SDI') THEN PthCurTaxAmt ELSE 0.00 END)
		,PthCurTaxableWagesYTD_USMEDER = SUM(CASE WHEN PthTaxCode = 'USMEDER' THEN PthCurTaxableWages ELSE 0.00 END)
    INTO dbo.U_ESWRKSYTD_PTaxHist
    FROM dbo.PayReg WITH (NOLOCK)
    JOIN dbo.PtaxHist WITH (NOLOCK)
        ON PthGenNumber = PrgGenNumber
    WHERE LEFT(PthPerControl,4) = LEFT(@EndPerControl,4)
    AND PthPerControl <= @EndPerControl
    GROUP BY PthEEID
    HAVING SUM(PthCurTaxAmt) <> 0.00;

	CREATE CLUSTERED INDEX CDX_U_ESWRKSYTD_PtaxHist ON dbo.U_ESWRKSYTD_PtaxHist (PthEEID, PthPayDate); 

    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_ESWRKSYTD_DrvTbl_D11
    ---------------------------------
    IF OBJECT_ID('U_ESWRKSYTD_DrvTbl_D11','U') IS NOT NULL
        DROP TABLE dbo.U_ESWRKSYTD_DrvTbl_D11;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvEmpNo = EecEmpNo
        ,drvSSN = eepSSN
        ,drvNameFirst = REPLACE(EepNameFirst, ',', '')
        ,drvNameMiddle = LEFT(EepNameMiddle,1)
        ,drvNameLast = REPLACE(EepNameLast, ',', '')
        ,drvDateOfOriginalHire = EecDateOfOriginalHire
        ,drvDateOfBirth = EepDateOfBirth
        ,drvPhoneHomeNumber = EepPhoneHomeNumber
        ,drvPhoneBusinessNumber = EecPhoneBusinessNumber
        ,drvPhoneBusinessExt = EecPhoneBusinessExt
        ,drvAddressEmailAlternate = EepAddressEMail
        ,drvAddressEmail = REPLACE(EepAddressEMail, '.', '')
        ,drvAddressLine1 = REPLACE(EepAddressLine1, ',', '')
        ,drvAddressLine2 = REPLACE(EepAddressLine2, ',', '')
        ,drvAddressCity = REPLACE(EepAddressCity, ',', '')
        ,drvAddressState = EepAddressState
        ,drvAddressCountry = EepAddressCountry
        ,drvAddressZipCode = EepAddressZipCode
        ,drvDateOfTermination = CASE WHEN EecEmplStatus = 'T' THEN EecDateOfTermination END
        ,drvEmplStatus = CASE WHEN EecEmplStatus = 'T' THEN 'T' ELSE 'A' END
        ,drvTerminationReasonType = REPLACE(CASE WHEN EecEmplStatus = 'T' THEN TchDesc END, ',', '')
        ,drvLocalTaxJurisdiction = PthLocalTaxJurisdiction
        ,drvLocalTaxJurisdictionRate = PthCurTaxAmtYTD_LIT
        ,drvFicaSocialSecurityRelease = PthCurTaxAmtYTD_USSOCER
        ,drvSdiRelease = PthCurTaxAmtYTD_SUISDI
        ,drvFederalRelease = PehSuppWagesYTD
        ,drvIncomeYTDRelease = PthCurTaxableWagesYTD_USMEDER
        ,drvFicaSocialSecurityExercise = PthCurTaxableWagesYTD_USMEDER
        ,drvSdiExercise = PthCurTaxAmtYTD_SUISDI
        ,drvFederalExercise = PehSuppWagesYTD
        ,drvIncomeYTDExercise = PthCurTaxableWagesYTD_USMEDER
        ,drvOrgLvl1 = EecOrgLvl1
        ,drvOrgLvl2 = EecOrgLvl2
        ,drvOrgLvl3 = EecOrgLvl3
        ,drvProject = EecProject
        ,drvUDField07 = EepUDField07
        ,drvUDField09 = EepUDField09
    INTO dbo.U_ESWRKSYTD_DrvTbl_D11
    FROM dbo.U_ESWRKSYTD_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
	INNER JOIN dbo.U_ESWRKSYTD_PEarHist WITH (NOLOCK)
		ON PehEEID = xEEID
	INNER JOIN dbo.U_ESWRKSYTD_PTaxHist WITH (NOLOCK)
		ON PthEEID = xEEID
	LEFT JOIN dbo.TrmReasn WITH (NOLOCK)
		ON TchCode = EecTermReason
    ;

END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwESWRKSYTD_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_ESWRKSYTD_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'ESWRKSYTD%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202004231'
       ,expStartPerControl     = '202004231'
       ,expLastEndPerControl   = '202004309'
       ,expEndPerControl       = '202004309'
WHERE expFormatCode = 'ESWRKSYTD';

**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwESWRKSYTD_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_ESWRKSYTD_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort
