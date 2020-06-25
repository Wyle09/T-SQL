SET NOCOUNT ON;
IF OBJECT_ID('U_EUSBPATAX_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EUSBPATAX_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EUSBPATAX_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EUSBPATAX' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEUSBPATAX_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEUSBPATAX_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EUSBPATAX') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EUSBPATAX];
GO
IF OBJECT_ID('U_EUSBPATAX_PEarHist') IS NOT NULL DROP TABLE [dbo].[U_EUSBPATAX_PEarHist];
GO
IF OBJECT_ID('U_EUSBPATAX_File') IS NOT NULL DROP TABLE [dbo].[U_EUSBPATAX_File];
GO
IF OBJECT_ID('U_EUSBPATAX_EEList') IS NOT NULL DROP TABLE [dbo].[U_EUSBPATAX_EEList];
GO
IF OBJECT_ID('U_EUSBPATAX_drv_trlTaxCodes') IS NOT NULL DROP TABLE [dbo].[U_EUSBPATAX_drv_trlTaxCodes];
GO
IF OBJECT_ID('U_EUSBPATAX_drv_trlParticipant') IS NOT NULL DROP TABLE [dbo].[U_EUSBPATAX_drv_trlParticipant];
GO
IF OBJECT_ID('U_EUSBPATAX_drv_TaxCodes') IS NOT NULL DROP TABLE [dbo].[U_EUSBPATAX_drv_TaxCodes];
GO
IF OBJECT_ID('U_EUSBPATAX_drv_Participant') IS NOT NULL DROP TABLE [dbo].[U_EUSBPATAX_drv_Participant];
GO
IF OBJECT_ID('U_EUSBPATAX_drv_hdrTaxCodes_H04') IS NOT NULL DROP TABLE [dbo].[U_EUSBPATAX_drv_hdrTaxCodes_H04];
GO
IF OBJECT_ID('U_EUSBPATAX_drv_hdrTaxCodes_H03') IS NOT NULL DROP TABLE [dbo].[U_EUSBPATAX_drv_hdrTaxCodes_H03];
GO
IF OBJECT_ID('U_EUSBPATAX_drv_hdrParticipant_H02') IS NOT NULL DROP TABLE [dbo].[U_EUSBPATAX_drv_hdrParticipant_H02];
GO
IF OBJECT_ID('U_EUSBPATAX_drv_hdrParticipant_H01') IS NOT NULL DROP TABLE [dbo].[U_EUSBPATAX_drv_hdrParticipant_H01];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EUSBPATAX';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EUSBPATAX';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EUSBPATAX';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EUSBPATAX';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EUSBPATAX';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhRespectZeroPayRate,AdhCreateTClockBatches,AdhThirdPartyPay) VALUES ('N','C','Y','0','','','N','','N','','013010','EMPEXPORT','CDE','EUSBPATAX','UBS ESOP Participant & Tax Exports','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','19000','S','N','EUSBPATAX0Z0','N','Jan  1 1900 12:00AM','C','N',NULL,'N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDR"','1','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','01','1',NULL,'Record',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFileRunDate"','2','(''UD112''=''T|'')','EUSBPATAX0Z0','50','H','01','2',NULL,'File Run Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFileRunTime"','3','(''UA''=''T|'')','EUSBPATAX0Z0','50','H','01','3',NULL,'File Run Time',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AXTA"','4','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','01','4',NULL,'Ticker Symbol',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"375"','5','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','01','5',NULL,'Organization ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Optionee"','6','(''DA''=''T'')','EUSBPATAX0Z0','50','H','01','6',NULL,'Optionee LAY',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRowheader "','1','(''UA''=''T|'')','EUSBPATAX0Z0','50','H','02','1',NULL,'Row header',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PARTICIPANT_ID"','2','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','2',NULL,'PARTICIPANT_ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"TERMINATION_DATE"','3','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','3',NULL,'TERMINATION_DATE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"TERMINATION_ID"','4','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','4',NULL,'TERMINATION_ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"TERMINATION_ACTION"','5','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','5',NULL,'TERMINATION_ACTION',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SOC_SEC_NUMBER"','6','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','6',NULL,'SOC_SEC_NUMBER',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LAST_NAME"','7','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','7',NULL,'LAST_NAME',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FIRST_NAME"','8','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','8',NULL,'FIRST_NAME',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MIDDLE_NAME"','9','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','9',NULL,'MIDDLE_NAME',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"E-MAIL_ADDRESS"','10','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','10',NULL,'E-MAIL_ADDRESS',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ADDRESS_LINE_1"','11','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','11',NULL,'ADDRESS_LINE_1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ADDRESS_LINE_2"','12','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','12',NULL,'ADDRESS_LINE_2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ADDRESS_LINE_3"','13','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','13',NULL,'ADDRESS_LINE_3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"CITY"','14','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','14',NULL,'CITY',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"STATE"','15','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','15',NULL,'STATE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"POSTAL_CODE"','16','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','16',NULL,'POSTAL_CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"COUNTRY"','17','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','17',NULL,'COUNTRY',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SUBSIDIARY_CODE"','18','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','18',NULL,'SUBSIDIARY_CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCATION_CODE"','19','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','19',NULL,'LOCATION_CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"BIRTH_DATE"','20','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','20',NULL,'BIRTH_DATE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HIRE_DATE"','21','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','21',NULL,'HIRE_DATE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"BROKER_CODE"','22','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','22',NULL,'BROKER_CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YEAR-TO-DATE_TXBL_COMP"','23','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','23',NULL,'YEAR-TO-DATE_TXBL_COMP',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD_SUPPLEMENTAL_INCOME"','24','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','24',NULL,'YTD_SUPPLEMENTAL_INCOME',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"YTD_SOC_SEC"','25','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','25',NULL,'YTD_SOC_SEC',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PHONE_NUMBER"','26','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','26',NULL,'PHONE_NUMBER',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ENROLLED_IN_EXPRESS_OPTIONS"','27','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','27',NULL,'ENROLLED_IN_EXPRESS_OPTIONS',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ENROLLED_IN_EXPRESS_STOCK_PURCHASE"','28','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','28',NULL,'ENROLLED_IN_EXPRESS_STOCK_PURCHASE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EMPLOYEE_FLAG"','29','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','29',NULL,'EMPLOYEE_FLAG',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"COUNTRY_OF_RESIDENCE"','30','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','30',NULL,'COUNTRY_OF_RESIDENCE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"COST_CENTER_CODE"','31','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','31',NULL,'COST_CENTER_CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"USER_CODE_1"','32','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','32',NULL,'USER_CODE_1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"TAX_CODE"','33','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','33',NULL,'TAX_CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ALLOCATION_FOR_FIRST_TAX_CODE"','34','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','34',NULL,'ALLOCATION_FOR_FIRST_TAX_CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FED_WITH_TAXES_ON_EXER_NQ"','35','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','35',NULL,'FED_WITH_TAXES_ON_EXER_NQ',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FED_WITH_TAXES_ON_EXER_RSA"','36','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','36',NULL,'FED_WITH_TAXES_ON_EXER_RSA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FED_WITH_TAXES_ON_EXER_RSU"','37','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','37',NULL,'FED_WITH_TAXES_ON_EXER_RSU',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FED_WITH_TAXES_ON_EXER_CSOP_A"','38','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','38',NULL,'FED_WITH_TAXES_ON_EXER_CSOP_A',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FED_WITH_TAXES_ON_EXER_CSOP_U"','39','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','39',NULL,'FED_WITH_TAXES_ON_EXER_CSOP_U',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"STATE_WITH_TAXES_ON_EXER_NQ"','40','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','40',NULL,'STATE_WITH_TAXES_ON_EXER_NQ',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"STATE_WITH_TAXES_ON_EXER_RSA"','41','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','41',NULL,'STATE_WITH_TAXES_ON_EXER_RSA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"STATE_WITH_TAXES_ON_EXER_RSU"','42','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','42',NULL,'STATE_WITH_TAXES_ON_EXER_RSU',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"STATE_WITH_TAXES_ON_EXER_CSOP_A"','43','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','43',NULL,'STATE_WITH_TAXES_ON_EXER_CSOP_A',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"STATE_WITH_TAXES_ON_EXER_CSOP_U"','44','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','44',NULL,'STATE_WITH_TAXES_ON_EXER_CSOP_U',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_1_WITH_TAXES_ON_EXER_NQ"','45','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','45',NULL,'LOCAL_1_WITH_TAXES_ON_EXER_NQ',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_1_WITH_TAXES_ON_EXER_RSA"','46','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','46',NULL,'LOCAL_1_WITH_TAXES_ON_EXER_RSA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_1_WITH_TAXES_ON_EXER_RSU"','47','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','47',NULL,'LOCAL_1_WITH_TAXES_ON_EXER_RSU',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_1_WITH_TAXES_ON_EXER_CSOP_A"','48','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','48',NULL,'LOCAL_1_WITH_TAXES_ON_EXER_CSOP_A',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_1_WITH_TAXES_ON_EXER_CSOP_U"','49','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','49',NULL,'LOCAL_1_WITH_TAXES_ON_EXER_CSOP_U',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_2_WITH_TAXES_ON_EXER_NQ"','50','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','50',NULL,'LOCAL_2_WITH_TAXES_ON_EXER_NQ',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_2_WITH_TAXES_ON_EXER_RSA"','51','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','51',NULL,'LOCAL_2_WITH_TAXES_ON_EXER_RSA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_2_WITH_TAXES_ON_EXER_RSU"','52','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','52',NULL,'LOCAL_2_WITH_TAXES_ON_EXER_RSU',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_2_WITH_TAXES_ON_EXER_CSOP_A"','53','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','53',NULL,'LOCAL_2_WITH_TAXES_ON_EXER_CSOP_A',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_2_WITH_TAXES_ON_EXER_CSOP_U"','54','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','54',NULL,'LOCAL_2_WITH_TAXES_ON_EXER_CSOP_U',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SOC_SEC_WITH_TAXES_ON_EXER_NQ"','55','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','55',NULL,'SOC_SEC_WITH_TAXES_ON_EXER_NQ',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SOC_SEC_WITH_TAXES_ON_EXER_RSA"','56','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','56',NULL,'SOC_SEC_WITH_TAXES_ON_EXER_RSA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SOC_SEC_WITH_TAXES_ON_EXER_RSU"','57','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','57',NULL,'SOC_SEC_WITH_TAXES_ON_EXER_RSU',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SOC_SEC_WITH_TAXES_ON_EXER_CSOP_A"','58','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','58',NULL,'SOC_SEC_WITH_TAXES_ON_EXER_CSOP_A',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SOC_SEC_WITH_TAXES_ON_EXER_CSOP_U"','59','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','59',NULL,'SOC_SEC_WITH_TAXES_ON_EXER_CSOP_U',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MEDICARE_WITH_TAXES_ON_EXER_NQ"','60','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','60',NULL,'MEDICARE_WITH_TAXES_ON_EXER_NQ',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MEDICARE_WITH_TAXES_ON_EXER_RSA"','61','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','61',NULL,'MEDICARE_WITH_TAXES_ON_EXER_RSA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MEDICARE_WITH_TAXES_ON_EXER_RSU"','62','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','62',NULL,'MEDICARE_WITH_TAXES_ON_EXER_RSU',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MEDICARE_WITH_TAXES_ON_EXER_CSOP_A"','63','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','02','63',NULL,'MEDICARE_WITH_TAXES_ON_EXER_CSOP_A',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MEDICARE_WITH_TAXES_ON_EXER_CSOP_U"','64','(''DA''=''T'')','EUSBPATAX0Z0','50','H','02','64',NULL,'MEDICARE_WITH_TAXES_ON_EXER_CSOP_U',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDR"','1','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','03','1',NULL,'Record',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFileRundate"','2','(''UD112''=''T|'')','EUSBPATAX0Z0','50','H','03','2',NULL,'File Run Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFileRunTime"','3','(''UA''=''T|'')','EUSBPATAX0Z0','50','H','03','3',NULL,'File Run Time',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AXTA"','4','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','03','4',NULL,'Ticker Symbol',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"375"','5','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','03','5',NULL,'Organization ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"taxcode"','6','(''DA''=''T'')','EUSBPATAX0Z0','50','H','03','6',NULL,'taxcode LAY',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRowHeader"','1','(''UA''=''T|'')','EUSBPATAX0Z0','50','H','04','1',NULL,'Row header',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"CODE"','2','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','04','2',NULL,'CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"DESCRIPTION"','3','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','04','3',NULL,'DESCRIPTION',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FED_WTHLDNG_PCT"','4','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','04','4',NULL,'FED_WTHLDNG_PCT',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"STATE_WTHLDNG_PCT"','5','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','04','5',NULL,'STATE_WTHLDNG_PCT',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_1_WTHLDNG_PCT"','6','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','04','6',NULL,'LOCAL_1_WTHLDNG_PCT',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_2_WTHLDNG_PCT"','7','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','04','7',NULL,'LOCAL_2_WTHLDNG_PCT',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FED_SUPP_PCT"','8','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','04','8',NULL,'FED_SUPP_PCT',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"APPLY_SUPP_IND"','9','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','04','9',NULL,'APPLY_SUPP_IND',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"FED_SUPP_LIMIT"','10','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','04','10',NULL,'FED_SUPP_LIMIT',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_1_WITH_TAXES_ON_EXER_NQ"','11','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','04','11',NULL,'LOCAL_1_WITH_TAXES_ON_EXER_NQ',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_1_WITH_TAXES_ON_LAPSE_RSA"','12','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','04','12',NULL,'LOCAL_1_WITH_TAXES_ON_LAPSE_RSA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_2_WITH_TAXES_ON_EXER_NQ"','13','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','04','13',NULL,'LOCAL_2_WITH_TAXES_ON_EXER_NQ',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_2_WITH_TAXES_ON_LAPSE_RSA"','14','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','04','14',NULL,'LOCAL_2_WITH_TAXES_ON_LAPSE_RSA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_1_WITH_TAXES_ON_LAPSE_RSU"','15','(''DA''=''T|'')','EUSBPATAX0Z0','50','H','04','15',NULL,'LOCAL_1_WITH_TAXES_ON_LAPSE_RSU',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LOCAL_2_WITH_TAXES_ON_LAPSE_RSU"','16','(''DA''=''T'')','EUSBPATAX0Z0','50','H','04','16',NULL,'LOCAL_2_WITH_TAXES_ON_LAPSE_RSU',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"DAT"','1','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','1',NULL,'Row header',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvParticipantID"','2','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','2',NULL,'PARTICIPANT_ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTerminationDate"','3','(''UD112''=''T|'')','EUSBPATAX0Z0','50','D','10','3',NULL,'TERMINATION_DATE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTerminationID"','4','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','4',NULL,'TERMINATION_ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTerminationAction"','5','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','5',NULL,'TERMINATION_ACTION',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEepSSN"','6','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','6',NULL,'SOC_SEC_NUMBER',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','7','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','7',NULL,'LAST_NAME',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','8','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','8',NULL,'FIRST_NAME',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameMiddle"','9','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','9',NULL,'MIDDLE_NAME',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressEmail"','10','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','10',NULL,'E-MAIL_ADDRESS',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine1"','11','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','11',NULL,'ADDRESS_LINE_1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine2"','12','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','12',NULL,'ADDRESS_LINE_2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('""','13','(''SS''=''T|'')','EUSBPATAX0Z0','50','D','10','13',NULL,'ADDRESS_LINE_3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressCity"','14','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','14',NULL,'CITY',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressState"','15','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','15',NULL,'STATE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvaddressZipCode"','16','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','16',NULL,'POSTAL_CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCountry"','17','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','17',NULL,'COUNTRY',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSubsidiaryCode"','18','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','18',NULL,'SUBSIDIARY_CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocationCode"','19','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','19',NULL,'LOCATION_CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfBirth"','20','(''UD112''=''T|'')','EUSBPATAX0Z0','50','D','10','20',NULL,'BIRTH_DATE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','21','(''UD112''=''T|'')','EUSBPATAX0Z0','50','D','10','21',NULL,'HIRE_DATE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PW"','22','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','22',NULL,'BROKER_CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDTxblComp"','23','(''UNT2''=''T|'')','EUSBPATAX0Z0','50','D','10','23',NULL,'YEAR-TO-DATE_TXBL_COMP',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDSupplementalIncome"','24','(''UNT2''=''T|'')','EUSBPATAX0Z0','50','D','10','24',NULL,'YTD_SUPPLEMENTAL_INCOME',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDSocSec"','25','(''UNT2''=''T|'')','EUSBPATAX0Z0','50','D','10','25',NULL,'YTD_SOC_SEC',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('""','26','(''SS''=''T|'')','EUSBPATAX0Z0','50','D','10','26',NULL,'PHONE_NUMBER',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','27','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','27',NULL,'ENROLLED_IN_EXPRESS_OPTIONS',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','28','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','28',NULL,'ENROLLED_IN_EXPRESS_STOCK_PURCHASE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','29','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','29',NULL,'EMPLOYEE_FLAG',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressCountry"','30','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','30',NULL,'COUNTRY_OF_RESIDENCE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCostCenterCode"','31','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','31',NULL,'COST_CENTER_CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvUserCode1"','32','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','32',NULL,'USER_CODE_1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTaxCode"','33','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','33',NULL,'TAX_CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"100"','34','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','34',NULL,'ALLOCATION_FOR_FIRST_TAX_CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','35','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','35',NULL,'FED_WITH_TAXES_ON_EXER_NQ',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','36','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','36',NULL,'FED_WITH_TAXES_ON_EXER_RSA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','37','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','37',NULL,'FED_WITH_TAXES_ON_EXER_RSU',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','38','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','38',NULL,'FED_WITH_TAXES_ON_EXER_CSOP_A',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','39','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','39',NULL,'FED_WITH_TAXES_ON_EXER_CSOP_U',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','40','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','40',NULL,'STATE_WITH_TAXES_ON_EXER_NQ',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','41','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','41',NULL,'STATE_WITH_TAXES_ON_EXER_RSA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','42','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','42',NULL,'STATE_WITH_TAXES_ON_EXER_RSU',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','43','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','43',NULL,'STATE_WITH_TAXES_ON_EXER_CSOP_A',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','44','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','44',NULL,'STATE_WITH_TAXES_ON_EXER_CSOP_U',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','45','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','45',NULL,'LOCAL_1_WITH_TAXES_ON_EXER_NQ',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','46','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','46',NULL,'LOCAL_1_WITH_TAXES_ON_EXER_RSA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','47','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','47',NULL,'LOCAL_1_WITH_TAXES_ON_EXER_RSU',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','48','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','48',NULL,'LOCAL_1_WITH_TAXES_ON_EXER_CSOP_A',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','49','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','49',NULL,'LOCAL_1_WITH_TAXES_ON_EXER_CSOP_U',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','50','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','50',NULL,'LOCAL_2_WITH_TAXES_ON_EXER_NQ',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','51','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','51',NULL,'LOCAL_2_WITH_TAXES_ON_EXER_RSA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','52','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','52',NULL,'LOCAL_2_WITH_TAXES_ON_EXER_RSU',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','53','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','53',NULL,'LOCAL_2_WITH_TAXES_ON_EXER_CSOP_A',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"1"','54','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','10','54',NULL,'LOCAL_2_WITH_TAXES_ON_EXER_CSOP_U',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSocSecWithTaxesOnExerNq"','55','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','55',NULL,'SOC_SEC_WITH_TAXES_ON_EXER_NQ',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSocSecWithTaxesOnExerRsa"','56','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','56',NULL,'SOC_SEC_WITH_TAXES_ON_EXER_RSA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSocSecWithTaxesOnExerRsu"','57','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','57',NULL,'SOC_SEC_WITH_TAXES_ON_EXER_RSU',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSocSecWithTaxesOnExerCsopA"','58','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','58',NULL,'SOC_SEC_WITH_TAXES_ON_EXER_CSOP_A',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSocSecWithTaxesOnExerCsopU"','59','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','59',NULL,'SOC_SEC_WITH_TAXES_ON_EXER_CSOP_U',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMedicareWithTaxesOnExerNq"','60','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','60',NULL,'MEDICARE_WITH_TAXES_ON_EXER_NQ',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMedicareWithTaxesOnExerRsa"','61','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','61',NULL,'MEDICARE_WITH_TAXES_ON_EXER_RSA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMedicareWithTaxesOnExerRsu"','62','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','62',NULL,'MEDICARE_WITH_TAXES_ON_EXER_RSU',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMedicareWithTaxesOnExerCsopA"','63','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','10','63',NULL,'MEDICARE_WITH_TAXES_ON_EXER_CSOP_A',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMedicareWithTaxesOnExerCsopU"','64','(''UA''=''T'')','EUSBPATAX0Z0','50','D','10','64',NULL,'MEDICARE_WITH_TAXES_ON_EXER_CSOP_U',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"DAT"','1','(''DA''=''T|'')','EUSBPATAX0Z0','50','D','11','1',NULL,'Row header',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCode"','2','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','11','2',NULL,'CODE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDescription"','3','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','11','3',NULL,'DESCRIPTION',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFedWthldngPct"','4','(''UNT2''=''T|'')','EUSBPATAX0Z0','50','D','11','4',NULL,'FED_WTHLDNG_PCT',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStateWthldngPct"','5','(''UNT2''=''T|'')','EUSBPATAX0Z0','50','D','11','5',NULL,'STATE_WTHLDNG_PCT',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocal1WthldngPct"','6','(''UNT2''=''T|'')','EUSBPATAX0Z0','50','D','11','6',NULL,'LOCAL_1_WTHLDNG_PCT',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocal2WthldngPct"','7','(''UNT2''=''T|'')','EUSBPATAX0Z0','50','D','11','7',NULL,'LOCAL_2_WTHLDNG_PCT',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFedSuppPct"','8','(''UNT2''=''T|'')','EUSBPATAX0Z0','50','D','11','8',NULL,'FED_SUPP_PCT',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvApplySuppInd"','9','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','11','9',NULL,'APPLY_SUPP_IND',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFedSupLimit"','10','(''UNT0''=''T|'')','EUSBPATAX0Z0','50','D','11','10',NULL,'FED_SUPP_LIMIT',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocal1WithTaxesOnExerNq"','11','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','11','11',NULL,'LOCAL_1_WITH_TAXES_ON_EXER_NQ',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocal1WithTaxesOnLapseRsa"','12','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','11','12',NULL,'LOCAL_1_WITH_TAXES_ON_LAPSE_RSA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocal2WithTaxesOnExerNq"','13','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','11','13',NULL,'LOCAL_2_WITH_TAXES_ON_EXER_NQ',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocal2WithTaxesOnLapseRsa"','14','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','11','14',NULL,'LOCAL_2_WITH_TAXES_ON_LAPSE_RSA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocal1WithTaxesOnLapseRsu"','15','(''UA''=''T|'')','EUSBPATAX0Z0','50','D','11','15',NULL,'LOCAL_1_WITH_TAXES_ON_LAPSE_RSU',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLocal2WithTaxesOnLapseRsu"','16','(''UA''=''T'')','EUSBPATAX0Z0','50','D','11','16',NULL,'LOCAL_2_WITH_TAXES_ON_LAPSE_RSU',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"TRL"','1','(''DA''=''T|'')','EUSBPATAX0Z0','50','T','90','1',NULL,'Record',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFileRunDate"','2','(''UD112''=''T|'')','EUSBPATAX0Z0','50','T','90','2',NULL,'File Run Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFileRuntTime"','3','(''UA''=''T|'')','EUSBPATAX0Z0','50','T','90','3',NULL,'File Run Time',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AXTA"','4','(''DA''=''T|'')','EUSBPATAX0Z0','50','T','90','4',NULL,'Ticker Symbol',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"375"','5','(''DA''=''T|'')','EUSBPATAX0Z0','50','T','90','5',NULL,'Organization ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"optionee"','6','(''DA''=''T|'')','EUSBPATAX0Z0','50','T','90','6',NULL,'Optionee',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRecordCount"','7','(''UNT0''=''T'')','EUSBPATAX0Z0','50','T','90','7',NULL,'Record Count',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"TRL"','1','(''DA''=''T|'')','EUSBPATAX0Z0','50','T','91','1',NULL,'Record',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFileRunDate"','2','(''UD112''=''T|'')','EUSBPATAX0Z0','50','T','91','2',NULL,'File Run Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFileRunTime"','3','(''UA''=''T|'')','EUSBPATAX0Z0','50','T','91','3',NULL,'File Run Time',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"AXTA"','4','(''DA''=''T|'')','EUSBPATAX0Z0','50','T','91','4',NULL,'Ticker Symbol',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"375"','5','(''DA''=''T|'')','EUSBPATAX0Z0','50','T','91','5',NULL,'Organization ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"taxcode"','6','(''DA''=''T|'')','EUSBPATAX0Z0','50','T','91','6',NULL,'taxcode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvRecordCount"','7','(''UA''=''T'')','EUSBPATAX0Z0','50','T','91','7',NULL,'Record Count',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
DECLARE @UDSERVER varchar(5) = (SELECT RTRIM(LEFT(@@SERVERNAME,PATINDEX('%[0-9]%',@@SERVERNAME)) + SUBSTRING(@@SERVERNAME,PATINDEX('%UP[0-9]%',@@SERVERNAME)+2,1)));
SELECT @UDSERVER = CASE WHEN @UDSERVER = 'EW21' THEN 'WP6' WHEN @UDSERVER = 'EW22' THEN 'WP7' ELSE @UDSERVER END;
DECLARE @UDCOCODE varchar(5) = (SELECT RTRIM(CmmCompanyCode) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\[UDCOCODE]_EUSBPATAX_20200507.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'UBS ESOP Participant ODMD','201904109','EMPEXPORT','PONDMD_XOE',NULL,'EUSBPATAX',NULL,NULL,NULL,'201904109','Apr 10 2019  3:28PM','Apr 10 2019  3:28PM','201904101',NULL,'','','201904101',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\[UDCOCODE]_EUSBPATAX_20200507.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'UBS ESOP Participant SCHED','201904109','EMPEXPORT','PSCHED',NULL,'EUSBPATAX',NULL,NULL,NULL,'201904109','Apr 10 2019  3:28PM','Apr 10 2019  3:28PM','201904101',NULL,'','','201904101',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\[UDCOCODE]_EUSBPATAX_20200507.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'UBS ESOP TAX ODMD','201904109','EMPEXPORT','TONDMD_XOE',NULL,'EUSBPATAX',NULL,NULL,NULL,'201904109','Apr 10 2019  3:28PM','Apr 10 2019  3:28PM','201904101',NULL,'','','201904101',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\[UDCOCODE]_EUSBPATAX_20200507.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'UBS ESOP TAX SCHED','201904109','EMPEXPORT','TSCHED',NULL,'EUSBPATAX',NULL,NULL,NULL,'201904109','Apr 10 2019  3:28PM','Apr 10 2019  3:28PM','201904101',NULL,'','','201904101',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
UPDATE dbo.AscExp SET expAscFileName = CASE WHEN LEFT(@UDENV,2) IN ('NW','EW','WP') THEN REPLACE(REPLACE(REPLACE(expAscFileName,'[UDENV]',@UDENV),'[UDSERVER]',@UDSERVER),'[UDCOCODE]',@UDCOCODE) ELSE '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\' + @UDCOCODE + '_EUSBPATAX_20200507.txt' END WHERE expFormatCode = 'EUSBPATAX';
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EUSBPATAX','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EUSBPATAX','ExportPath','V',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EUSBPATAX','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EUSBPATAX','UDESPath','C','\\us.saas\E0\data_exchange\DUP1001\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EUSBPATAX','UseFileName','V','Y');
UPDATE dbo.U_dsi_Configuration SET CfgValue = CASE WHEN CfgName = 'UseFileName' THEN 'Y' ELSE NULL END WHERE FormatCode = 'EUSBPATAX' AND CfgName IN ('UseFileName','ExportPath');
INSERT INTO dbo.CustomTemplates (CreationDate,Engine,EngineCode,IsActive,ModifiedDate) SELECT CreationDate = GETDATE(), Engine = AdhEngine, EngineCode = AdhFormatCode, IsActive = 1, ModifiedDate = GETDATE() FROM dbo.AscDefH WITH (NOLOCK) WHERE AdhFormatCode = 'EUSBPATAX' AND NOT EXISTS(SELECT 1 FROM dbo.CustomTemplates WHERE EngineCode = AdhFormatCode);
IF OBJECT_ID('U_EUSBPATAX_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EUSBPATAX_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EUSBPATAX','H01','dbo.U_EUSBPATAX_drv_hdrParticipant_H01',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EUSBPATAX','H02','dbo.U_EUSBPATAX_drv_hdrParticipant_H02',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EUSBPATAX','H03','dbo.U_EUSBPATAX_drv_hdrTaxCodes_H03',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EUSBPATAX','H04','dbo.U_EUSBPATAX_drv_hdrTaxCodes_H04',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EUSBPATAX','D10','dbo.U_EUSBPATAX_drv_Participant',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EUSBPATAX','D11','dbo.U_EUSBPATAX_drv_TaxCodes',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EUSBPATAX','T90','dbo.U_EUSBPATAX_drv_trlParticipant',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EUSBPATAX','T91','dbo.U_EUSBPATAX_drv_trlTaxCodes',NULL);
IF OBJECT_ID('U_EUSBPATAX_DedList') IS NULL
CREATE TABLE [dbo].[U_EUSBPATAX_DedList] (
    [DedCode] char(5) NOT NULL,
    [DedType] char(4) NOT NULL
);
IF OBJECT_ID('U_EUSBPATAX_EEList') IS NULL
CREATE TABLE [dbo].[U_EUSBPATAX_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EUSBPATAX_File') IS NULL
CREATE TABLE [dbo].[U_EUSBPATAX_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(max) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EUSBPATAX]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: Axalta Coating Systems, LLC

Created By: Wyle Cordero
Business Analyst: Bridget Amsden
Create Date: 04/10/2019
Service Request Number: SR-2019-00227359

Purpose: USB ESOP Participant & Tax Exports

Revision History
----------------
Update By           Date            Request Num            Desc
Wyle Cordero        02/14/2020        SR-2020-00265433    Updates as per spec V1.10

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EUSBPATAX';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EUSBPATAX';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EUSBPATAX';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EUSBPATAX';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EUSBPATAX' ORDER BY RunID DESC;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EUSBPATAX', 'PONDMD_XOE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EUSBPATAX', 'TONDMD_XOE';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'EUSBPATAX', @AllObjects = 'Y', @IsWeb = 'Y'
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
    SELECT @FormatCode = 'EUSBPATAX';

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
    DELETE FROM dbo.U_EUSBPATAX_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_EUSBPATAX_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

    -- Exclude when EecUDField02 is not null or empty
    DELETE el
    FROM dbo.U_EUSBPATAX_EEList el
    INNER JOIN dbo.EmpComp
        ON EecEEID = xEEID
        AND EecCoID = xCoID
        AND NULLIF(EecUDField02, '') IS NULL
    ;

    -- Exclude EecType in ('EXP', 'INP')
    DELETE el
    FROM dbo.U_EUSBPATAX_EEList el
    INNER JOIN dbo.EmpComp
        ON EecEEID = xEEID
        AND EecCoID = xCoID
        AND EecEETYPE IN ('EXP', 'INP')
    ;

    -- Exclude if EecUDField21 <> 'Y'
    DELETE el
    FROM dbo.U_EUSBPATAX_EEList el
    INNER JOIN dbo.EmpComp
        ON EecEEID = xEEID
        AND EecCoID = xCoID
        AND (EecUDField21 <> 'Y'
             OR NULLIF(EecUDField21, '') IS NULL)
    ;

	-- Exclude terminated employees
	DELETE el
    FROM dbo.U_EUSBPATAX_EEList el
    INNER JOIN dbo.EmpComp
        ON EecEEID = xEEID
        AND EecCoID = xCoID
		AND EecEmplStatus = 'T'
	;

    --==========================================
    -- Build Working Tables
    --==========================================
    -----------------------------------------
    -- Working Table - PTaxHist
    -----------------------------------------

    IF OBJECT_ID('U_EUSBATAX_PtaxHist', 'U') IS NOT NULL
        DROP TABLE dbo.U_EUSBATAX_PtaxHist
    SELECT DISTINCT
        PthEEID = PrgEEID
        ,PthTypeOfTax
        ,PrgPayDate = MAX(PrgPayDate)
        -- YTD (Participants) file
        ,PthFitTaxYTD = SUM(CASE WHEN PthTypeOfTax = 'FIT' THEN ISNULL(PthCurTaxAmt,0.00) ELSE 0.00 END)
        ,PthSitTaxYTD = SUM(CASE WHEN PthTypeOfTax = 'SIT' THEN ISNULL(PthCurTaxAmt,0.00) ELSE 0.00 END)
        ,PthCurGrossWagesYTD = SUM(PthCurGrossWages)
        ,PthFitCurTaxableWagesYTD = SUM(CASE WHEN PthTypeOfTax = 'FIT' THEN ISNULL(PthCurTaxableWages, 0.00) ELSE 0.00 END)
        ,PthSitCurTaxableWagesYTD = SUM(CASE WHEN PthTypeOfTax = 'SIT' THEN ISNULL(PthCurTaxableWages, 0.00) ELSE 0.00 END)
        ,PthMedCurTaxableWagesYTD = SUM(CASE WHEN PthTaxCode = 'USMEDEE' THEN ISNULL(PthCurTaxableWages, 0.00) ELSE 0.00 END)
        ,PthSocCurTaxableWagesYTD = SUM(CASE WHEN PthTaxCode = 'USSOCEE' THEN ISNULL(PthCurTaxAmt, 0.00) ELSE 0.00 END)
        -- YTD (Taxcodes) file
        ,PthFitSupTaxPercentOverBaseYTD = MAX(CASE WHEN PthTypeOfTax = 'FIT' AND supamtifwagebaseisover = 0.00 THEN ISNULL(SupTaxPercentOverBase, 0.00) ELSE 0.00 END)
        ,PthFitSupSuppTaxPercentOverBaseYTD = MAX(CASE WHEN PthTypeOfTax = 'FIT' AND supamtifwagebaseisover <> 0.00 THEN ISNULL(SupTaxPercentOverBase,0.00) ELSE 0.00 END)
        ,PthFitSupamtifwagebaseisover = MAX(CASE WHEN PthTypeOfTax = 'FIT' AND supamtifwagebaseisover <> 0.00 THEN ISNULL(supamtifwagebaseisover, 0.00) ELSE 0.00 END)
        ,PthFitFedAndSuppMax = SUM(CASE WHEN PthTypeOfTax = 'FIT' THEN ISNULL(SupTaxPercentOverBase,0.00) + ISNULL(supamtifwagebaseisover, 0.00) ELSE 0.00 END)
        ,PthSitSupTaxPercentOverBaseYTD = MAX(CASE WHEN PthTypeOfTax = 'SIT' THEN ISNULL(SupTaxPercentOverBase,0.00) ELSE 0.00 END)
        ,PthCnfitSupTaxPercentOverBaseYTD = MAX(CASE WHEN PthTypeOfTax = 'CNFIT' AND supamtifwagebaseisover = 0.00 THEN ISNULL(SupTaxPercentOverBase,0.00) ELSE 0.00 END)
        ,PthPitSupTaxPercentOverBaseYTD = MAX(CASE WHEN PthTypeOfTax = 'PIT' THEN ISNULL(SupTaxPercentOverBase,0.00) ELSE 0.00 END)
        ,PthPASuiSupTaxPercentOverBaseYTD = MAX(CASE WHEN PthTypeOfTax = 'SUI' AND PthTaxCode = 'PASUIEE' THEN ISNULL(PthContributionRate,0.00) ELSE 0.00 END)
    INTO dbo.U_EUSBATAX_PtaxHist
    FROM dbo.U_EUSBPATAX_EEList WITH (NOLOCK)
	INNER JOIN dbo.PayReg WITH (NOLOCK)
		ON PrgEEID = xEEID
    INNER JOIN dbo.PTaxHist WITH (NOLOCK)
        ON PthGenNumber = PrgGenNumber
        AND PthTypeOfTax IN ('FIT', 'SIT', 'SOC', 'MED', 'SUI', 'CNFIT', 'PIT')
    LEFT JOIN dbo.dsi_vw_supptaxrates WITH (NOLOCK)
        ON PthTaxCode = SupTaxCode
    WHERE LEFT(PthPerControl,4) = LEFT(@EndPerControl,4)        
    AND PthPerControl <= @EndPerControl
    GROUP BY PrgEEID, PthTypeOfTax
    HAVING(SUM(PthCurTaxAmt) <> 0.00)
	OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EUSBATAX_PtaxHist ON dbo.U_EUSBATAX_PtaxHist (PthEEID, PrgPayDate);

	-- Multiple SIT taxes.
    ------------------------------------
    -- Working Table - PtaxHist_StateReciprocity
    ------------------------------------
    IF OBJECT_ID('U_EUSBATAX_PtaxHist_StateReciprocity', 'U') IS NOT NULL
        DROP TABLE dbo.U_EUSBATAX_PtaxHist_StateReciprocity
    SELECT DISTINCT
        PthEEID = PthEEID
        ,PthTypeOfTax
		,PthTaxCode
		,PthIsResidentTaxCode
		,PthIsWorkInTaxCode
        ,PthPayDate = MAX(PrgPayDate)
		,PthWorkInStatePct = MAX(CASE WHEN PthTypeOfTax = 'SIT' AND PthIsResidentTaxCode = 'N' AND PthIsWorkInTaxCode = 'Y' THEN SupTaxPercentOverBase ELSE 0.00 END)
		,PthResidentStatePct = MAX(CASE WHEN PthTypeOfTax = 'SIT' AND PthIsResidentTaxCode = 'Y' AND PthIsWorkInTaxCode = 'N' THEN SupTaxPercentOverBase ELSE 0.00 END)
		,PthStateReciprocity = 
			CASE 
				WHEN PthIsWorkInTaxCode = 'Y' AND PthIsResidentTaxCode = 'N' AND LEFT(RTRIM(LTRIM(PthTaxCode)), 2) = 'PA' AND EXISTS(
					SELECT 1 
					FROM dbo.PTaxHist sit WITH (NOLOCK) 
					WHERE sit.PthEEID = pth.PthEEID 
					AND LEFT(sit.PthPerControl,4) = LEFT(@EndPerControl,4) 
					AND sit.PthPerControl <= @EndPerControl
					AND sit.PthTypeOfTax = 'SIT'
					AND sit.PthIsEmployerTax = 'N'
					AND LEFT(RTRIM(LTRIM(sit.PthTaxCode)), 2)  IN ('NJ', 'MD', 'WV', 'VA', 'OH', 'IN')) THEN 'Y' ELSE 'N'
			END
		,PthSitStatePct = 00.000000
        ,PthMultipleSit = SPACE(1)
		,PthRowNo = ROW_NUMBER() OVER(PARTITION BY PthEEID ORDER BY CASE WHEN PthIsWorkInTaxCode = 'Y' THEN 1 ELSE 2 END)
    INTO dbo.U_EUSBATAX_PtaxHist_StateReciprocity
    FROM dbo.U_EUSBPATAX_EEList WITH (NOLOCK)
	INNER JOIN dbo.PayReg WITH (NOLOCK)
		ON PrgEEID = xEEID
    INNER JOIN dbo.PTaxHist pth WITH (NOLOCK)
        ON PthGenNumber = PrgGenNumber
        AND PthTypeOfTax = 'SIT'
		AND PthIsEmployerTax = 'N'
    LEFT JOIN dbo.dsi_vw_supptaxrates WITH (NOLOCK)
        ON PthTaxCode = SupTaxCode
    WHERE LEFT(PthPerControl,4) = LEFT(@EndPerControl,4)        
    AND PthPerControl <= @EndPerControl
    GROUP BY PthEEID, PthTypeOfTax, PthTaxCode, PthIsResidentTaxCode, PthIsWorkInTaxCode
    HAVING(SUM(PthCurTaxAmt) <> 0.00)
	OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EUSBATAX_StateReciprocity ON dbo.U_EUSBATAX_PtaxHist_StateReciprocity (PthEEID, PthRowNo, PthPayDate);
/*****************************************************************************************************************

Withhold the work in state income tax first.
Withhold the live in state next with a rate that is the net difference between the live in rate, minus the work in rate.
PA – work in and MA – live in
PA rate – 3.07% and MA rate – 5%
Withhold the work in state of 3.07% first then take the live in state, which is 1.93% (5%-3.07%).
There are exceptions to the rule.
Due to Reciprocal Agreements between states.
Katie Gillespie is a good example.
i.      Works in PA, Live in NJ

ii.      Allowed by R.A. to only withhold NJ taxes and not PA. 

iii.      So she would be straight NJ. 

Unemployment is always based on work in state location.  Very few exceptions.

*******************************************************************************************************************/

	UPDATE pth
		SET pth.PthMultipleSit = CASE WHEN r1.PthRowNo IS NOT NULL AND r2.PthRowNo IS NOT NULL THEN 'Y' ELSE 'N' END
	FROM dbo.U_EUSBATAX_PtaxHist_StateReciprocity pth
	LEFT JOIN dbo.U_EUSBATAX_PtaxHist_StateReciprocity r1
		ON r1.PthEEID = pth.PthEEID
		AND r1.PthRowNo = 1
	LEFT JOIN dbo.U_EUSBATAX_PtaxHist_StateReciprocity r2
		ON r2.PthEEID = pth.PthEEID
		AND r2.PthRowNo = 2

	UPDATE pth
		SET pth.PthSitStatePct = COALESCE(r2.PthResidentStatePct - r1.PthWorkInStatePct, 00.000000)
	FROM dbo.U_EUSBATAX_PtaxHist_StateReciprocity pth
	LEFT JOIN dbo.U_EUSBATAX_PtaxHist_StateReciprocity r1
		ON r1.PthEEID = pth.PthEEID
		AND r1.PthRowNo = 1
	LEFT JOIN dbo.U_EUSBATAX_PtaxHist_StateReciprocity r2
		ON r2.PthEEID = pth.PthEEID
		AND r2.PthRowNo = 2

    ------------------------------------
    -- Working Table - PtaxHist_Local
    ------------------------------------
    IF OBJECT_ID('U_EUSBATAX_PtaxHist_Local', 'U') IS NOT NULL
        DROP TABLE dbo.U_EUSBATAX_PtaxHist_Local
    SELECT DISTINCT
        PthEEID = PrgEEID
        ,PthLclTaxBatchID = ROW_NUMBER() OVER (PARTITION BY PrgEEID ORDER BY PrgEEID, PthMtcDateTimeCreated DESC)
        ,PthTaxCode
        ,PthMtcDateTimeCreated
        -- YTD
        ,PthLitTaxYTD = SUM(CASE WHEN PthIsEmployerTax = 'N' THEN ISNULL(PthCurTaxAmt,0.00) ELSE 0.00 END)
        ,PthLitSupTaxPercentOverBase = MAX(ISNULL(SupTaxPercentOverBase, 0.00))
    INTO dbo.U_EUSBATAX_PtaxHist_Local
    FROM dbo.U_EUSBPATAX_EEList WITH (NOLOCK)
	INNER JOIN dbo.PayReg WITH (NOLOCK)
		ON PrgEEID = xEEID
    INNER JOIN  dbo.PTaxHist WITH (NOLOCK)
        ON PrgGenNumber = PthGenNumber
    INNER JOIN dbo.EmpTax WITH (NOLOCK)
        ON PrgEEID = EetEEID
        AND PthCoID = EetCoID
        AND PthTaxCode = EetTaxCode
        AND PthTypeOfTax = 'LIT'
        AND LEFT(RTRIM(LTRIM(PthTaxCode )), 2) = 'PA'
    LEFT JOIN dbo.dsi_vw_supptaxrates WITH (NOLOCK)
        ON PthTaxCode = SupTaxCode
    WHERE LEFT(PthPerControl,4) = LEFT(@EndPerControl,4)
    AND PthPerControl <= @EndPerControl
    GROUP BY PrgEEID, PthTaxCode, PthMtcDateTimeCreated
    HAVING(SUM(PthCurTaxAmt) <> 0.00)
	OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EUSBATAX_PtaxHist_Local ON dbo.U_EUSBATAX_PtaxHist_Local (PthEEID, PthLclTaxBatchID);
    
    -----------------------------
    -- Working Table - PEarHist
    -----------------------------
    IF OBJECT_ID('U_EUSBPATAX_PEarHist','U') IS NOT NULL
        DROP TABLE dbo.U_EUSBPATAX_PEarHist;
    SELECT DISTINCT
         PehEEID
        -- YTD Payroll Amount/Hours
        ,PehCurAmntTSupWagesYTD = SUM(CASE WHEN PehIsSuppWages = 'Y' THEN ISNULL(PehCurAmt,0.00) ELSE 0.00 END)
    INTO dbo.U_EUSBPATAX_PEarHist
    FROM dbo.U_EUSBPATAX_EEList WITH (NOLOCK)
	INNER JOIN dbo.PayReg WITH (NOLOCK)
		ON PrgEEID = xEEID
    JOIN dbo.PEarHist WITH (NOLOCK)
        ON PehGenNumber = PrgGenNumber
    WHERE LEFT(PehPerControl,4) = LEFT(@EndPerControl,4)
    AND PehPerControl <= @EndPerControl
    GROUP BY PehEEID    
    HAVING SUM(PehCurAmt) <> 0.00
	OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EUSBPATAX_PEarHist ON dbo.U_EUSBPATAX_PEarHist (PehEEID);


    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_EUSBPATAX_drv_Participant
    ---------------------------------
    IF OBJECT_ID('U_EUSBPATAX_drv_Participant','U') IS NOT NULL
        DROP TABLE dbo.U_EUSBPATAX_drv_Participant;
    SELECT DISTINCT
        drvInitialSort = MAX(CONCAT(LEFT(RTRIM(LTRIM(EepNameFirst)), 1), LEFT(RTRIM(LTRIM(EepNameLast)), 1), RIGHT(RTRIM(LTRIM(EecUDField15)), 3)))
        ,drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvParticipantID = MAX(EecUDField15)
        ,drvTerminationDate = MAX(CASE WHEN EecEmplStatus = 'T' THEN EecDateOfTermination END)
        ,drvTerminationID = MAX(
			CASE 
                WHEN EecEmplStatus = 'T' AND EecTermReason = '203' THEN 'DEA'
                WHEN EecEmplStatus = 'T' AND EecTermReason = '202' THEN 'RET'
                WHEN EecEmplStatus = 'T' AND EecTermReason = 'DISLTD' THEN 'DIS'
                WHEN EecEmplStatus = 'T' AND EecTermReason = 'MTC' THEN 'MUT'
                WHEN EecEmplStatus = 'T' AND EecTermReason = 'MSC' THEN 'CAU'
                WHEN EecEmplStatus = 'T' AND EecTermType = 'I' THEN 'INV'                                    
                WHEN EecEmplStatus = 'T' AND EecTermReason NOT IN ('203', '202', 'DISLTD', 'MTC', 'MSC') THEN 'VOL'
            END)
        ,drvTerminationAction = MAX(
			CASE
                WHEN EecDateOfTermination IS NOT NULL THEN 'T'
                WHEN EecDateOfLastHire <> EecDateOfOriginalHire AND EecHireSource = 'REHIRE' OR EecJobChangeReason = '101' THEN 'R'
                ELSE NULL
            END)
        ,drvEepSSN = MAX(eepSSN)
        ,drvNameLast = MAX(EepNameLast)
        ,drvNameFirst = MAX(EepNameFirst)
        ,drvNameMiddle = MAX(EepNameMiddle)
        ,drvAddressEmail = MAX(EepAddressEMail)
        ,drvAddressLine1 = MAX(EepAddressLine1)
        ,drvAddressLine2 = MAX(EepAddressLine2)
        ,drvAddressCity = MAX(EepAddressCity)
        ,drvAddressState = MAX(EepAddressState)
        ,drvaddressZipCode = MAX(EepAddressZipCode)
        ,drvCountry = MAX(CASE WHEN LEN(EepAddressCountry) < 0 THEN 'USA' ELSE EepAddressCountry END)
        ,drvSubsidiaryCode = MAX(
            CASE CmpCompanyCode
                WHEN 'ACSCA' THEN '8701'
                WHEN 'ACSMA' THEN '8797'
                WHEN 'ACSUS' THEN '8700'
            END)                                 
        ,drvLocationCode = MAX(CASE WHEN CmpAddressCountry IN ('CAN', 'USA') THEN CmpAddressCountry END)
        ,drvDateOfBirth = MAX(EepDateOfBirth)
        ,drvDateOfLastHire = MAX(EecDateOfLastHire)
        ,drvYTDTxblComp = MAX(PthMedCurTaxableWagesYTD)
        ,drvYTDSupplementalIncome = MAX(PehCurAmntTSupWagesYTD)
        ,drvYTDSocSec = MAX(PthSocCurTaxableWagesYTD)
        ,drvAddressCountry = MAX(EepAddressCountry)
        ,drvCostCenterCode = MAX(CONCAT(RTRIM(EecOrgLvl1), RTRIM(EecOrgLvl2)))
        ,drvUserCode1 = MAX(
			CASE CmpCompanyCode
                WHEN 'ACSCA' THEN '8701'
                WHEN 'ACSMA' THEN '8797'
                WHEN 'ACSUS' THEN '8700'
            END)
        ,drvTaxCode = MAX(CONCAT(LEFT(RTRIM(LTRIM(EepNameFirst)), 1), LEFT(RTRIM(LTRIM(EepNameLast)), 1), RIGHT(RTRIM(LTRIM(EecUDField15)), 3)))
        ,drvSocSecWithTaxesOnExerNq = MAX(CASE WHEN EepAddressCountry = 'CAN' THEN '0' ELSE '1' END)
        ,drvSocSecWithTaxesOnExerRsa = MAX(CASE WHEN EepAddressCountry = 'CAN' THEN '0' ELSE '1' END)
        ,drvSocSecWithTaxesOnExerRsu = MAX(CASE WHEN EepAddressCountry = 'CAN' THEN '0' ELSE '1' END)
		,drvSocSecWithTaxesOnExerCsopA = MAX(CASE WHEN EepAddressCountry = 'CAN' THEN '0' ELSE '1' END)
		,drvSocSecWithTaxesOnExerCsopU = MAX(CASE WHEN EepAddressCountry = 'CAN' THEN '0' ELSE '1' END)
        ,drvMedicareWithTaxesOnExerNq = MAX(CASE WHEN EepAddressCountry = 'CAN' THEN '0' ELSE '1' END)
        ,drvMedicareWithTaxesOnExerRsa = MAX(CASE WHEN EepAddressCountry = 'CAN' THEN '0' ELSE '1' END)
		,drvMedicareWithTaxesOnExerRsu = MAX(CASE WHEN EepAddressCountry = 'CAN' THEN '0' ELSE '1' END)
		,drvMedicareWithTaxesOnExerCsopA = MAX(CASE WHEN EepAddressCountry = 'CAN' THEN '0' ELSE '1' END)
		,drvMedicareWithTaxesOnExerCsopU = MAX(CASE WHEN EepAddressCountry = 'CAN' THEN '0' ELSE '1' END)
    INTO dbo.U_EUSBPATAX_drv_Participant
    FROM dbo.U_EUSBPATAX_EEList WITH (NOLOCK)
    INNER JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    INNER JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    INNER JOIN dbo.Company WITH (NOLOCK)
        ON xCoID = CmpCoID
    LEFT JOIN dbo.U_EUSBATAX_PTaxHist FitSit WITH (NOLOCK)
        ON xEEID = PthEEID 
    LEFT JOIN dbo.U_EUSBPATAX_PEarHist Peh WITH (NOLOCK)
        ON xEEID = Peh.PehEEID
    LEFT JOIN (SELECT PthEEID, MAX(IIF(PthTaxCode IS NOT NULL, '0', '1')) AS PhillyLocalTax
                FROM dbo.U_EUSBATAX_PTaxHist_Local WITH (NOLOCK)
                GROUP BY PthEEID) AS Lcl
        ON xEEID = Lcl.PthEEID
    WHERE @ExportCode LIKE 'P%'
    GROUP BY xEEID, xCoID
	OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EUSBPATAX_drv_Participant ON dbo.U_EUSBPATAX_drv_Participant (drvInitialSort);

    ---------------------------------
    -- HEADER RECORD
    ---------------------------------
    IF OBJECT_ID('U_EUSBPATAX_drv_hdrParticipant_H01','U') IS NOT NULL
        DROP TABLE dbo.U_EUSBPATAX_drv_hdrParticipant_H01;
    SELECT DISTINCT
            drvFileRunDate = GETDATE()
        ,drvFileRunTime = FORMAT(GETDATE(), 'hh:mm:ss')
    INTO dbo.U_EUSBPATAX_drv_hdrParticipant_H01
    FROM dbo.U_EUSBPATAX_EEList WITH (NOLOCK)
    WHERE @ExportCode LIKE 'P%';

    ---------------------------------
    -- HEADER RECORD
    ---------------------------------
    IF OBJECT_ID('U_EUSBPATAX_drv_hdrParticipant_H02','U') IS NOT NULL
        DROP TABLE dbo.U_EUSBPATAX_drv_hdrParticipant_H02;
    SELECT DISTINCT
        drvRowHeader = 'LAY'
    INTO dbo.U_EUSBPATAX_drv_hdrParticipant_H02
    FROM dbo.U_EUSBPATAX_EEList WITH (NOLOCK)
    WHERE @ExportCode LIKE 'P%';

    ---------------------------------
    -- TRAILER RECORD
    ---------------------------------
    IF OBJECT_ID('U_EUSBPATAX_drv_trlParticipant','U') IS NOT NULL
        DROP TABLE dbo.U_EUSBPATAX_drv_trlParticipant;
    SELECT DISTINCT
            drvFileRunDate = GETDATE()
        ,drvFileRuntTime = FORMAT(GETDATE(), 'hh:mm:ss')
        ,drvRecordCount = (SELECT COUNT(*) FROM dbo.U_EUSBPATAX_drv_Participant)
    INTO dbo.U_EUSBPATAX_drv_trlParticipant
    FROM dbo.U_EUSBPATAX_EEList WITH (NOLOCK)
    WHERE @ExportCode LIKE 'P%';

    ---------------------------------
    -- DETAIL RECORD - U_EUSBPATAX_drv_TaxCodes
    ---------------------------------
    IF OBJECT_ID('U_EUSBPATAX_drv_TaxCodes','U') IS NOT NULL
        DROP TABLE dbo.U_EUSBPATAX_drv_TaxCodes;
    SELECT DISTINCT
        drvInitialSort = MAX(CONCAT(LEFT(RTRIM(LTRIM(EepNameFirst)), 1), LEFT(RTRIM(LTRIM(EepNameLast)), 1), RIGHT(RTRIM(LTRIM(EecUDField15)), 3)))
        ,drvEEID = xEEID
        ,drvCoID = xCoID
		,drvAddressCountry = MAX(EepAddressCountry)
        ,drvCode = MAX(CONCAT(LEFT(RTRIM(LTRIM(EepNameFirst)), 1), LEFT(RTRIM(LTRIM(EepNameLast)), 1), RIGHT(RTRIM(LTRIM(EecUDField15)), 3)))
        ,drvDescription = MAX(CONCAT(RTRIM(LTRIM(EepNameFirst)), SPACE(1), RTRIM(LTRIM(EepNameLast))))
        ,drvFedWthldngPct = MAX(COALESCE(
			CASE WHEN NULLIF(EecUDField01, '') IS NOT NULL AND ISNUMERIC(EecUDField01) = 1 THEN CONVERT(DECIMAL(15,2), EecUDField01) END,
			CASE WHEN EepAddressCountry <> 'CAN' THEN PthFitSupTaxPercentOverBaseYTD * 100 ELSE PthCnfitSupTaxPercentOverBaseYTD * 100 END))
        ,drvStateWthldngPct = COALESCE(MAX(
			CASE WHEN EepAddressCountry <> 'CAN' THEN 
				CASE
					--WHEN sit1.PthMultipleSit = 'Y' AND sit1.PthStateReciprocity = 'N' THEN sit1.PthSitStatePct * 100
					WHEN sit1.PthMultipleSit = 'Y' AND sit1.PthStateReciprocity = 'Y' THEN sit2.PthResidentStatePct * 100
					WHEN sit1.PthMultipleSit = 'Y' THEN sit2.PthWorkInStatePct * 100
					ELSE FitSit.PthSitSupTaxPercentOverBaseYTD * 100
				END
				ELSE FitSit.PthPitSupTaxPercentOverBaseYTD * 100
			END), 0.00)
        ,drvLocal1WthldngPct = MAX(CASE WHEN EepAddressCountry = 'CAN' THEN 49.50 ELSE FitSit.PthPASuiSupTaxPercentOverBaseYTD * 100 END)
        ,drvLocal2WthldngPct = MAX(ISNULL(Lcl.PthLitSupTaxPercentOverBase * 100, 0.00))
        ,drvFedSuppPct = MAX(FitSit.PthFitSupSuppTaxPercentOverBaseYTD * 100)
        ,drvApplySuppInd = MAX(CASE WHEN EepAddressCountry <> 'CAN' THEN '1' ELSE '0' END)
        ,drvFedSupLimit = MAX(FitSit.PthFitSupamtifwagebaseisover)
        ,drvLocal1WithTaxesOnExerNq = MAX(CASE WHEN EepAddressCountry = 'CAN' THEN '0' ELSE ISNULL(Sui.PaStateTax, '1') END)
        ,drvLocal1WithTaxesOnLapseRsa = MAX(CASE WHEN EepAddressCountry = 'CAN' THEN '0' ELSE ISNULL(Sui.PaStateTax, '1') END)
        ,drvLocal2WithTaxesOnExerNq = MAX(CASE WHEN EepAddressCountry = 'CAN' THEN '0' ELSE ISNULL(Lcl.PhillyLocalTax, '1') END)
        ,drvLocal2WithTaxesOnLapseRsa = MAX(CASE WHEN EepAddressCountry = 'CAN' THEN '0' ELSE ISNULL(Lcl.PhillyLocalTax, '1') END)
        ,drvLocal1WithTaxesOnLapseRsu = MAX(
			CASE	
				WHEN EepAddressCountry = 'CAN' THEN '0'
				WHEN Sui.PaStateTax = '0' THEN '1' 
				ELSE '0' 
			END)
        ,drvLocal2WithTaxesOnLapseRsu = MAX(
			CASE 
				WHEN EepAddressCountry = 'CAN' THEN '0'
				WHEN Lcl.PhillyLocalTax = '0' THEN '1' 
				ELSE '0' 
			END)
    INTO dbo.U_EUSBPATAX_drv_TaxCodes
    FROM dbo.U_EUSBPATAX_EEList WITH (NOLOCK)
    INNER JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    INNER JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID
        AND EecCoID = xCoID
    INNER JOIN dbo.Company WITH (NOLOCK)
        ON xCoID = CmpCoID
    LEFT JOIN dbo.U_EUSBATAX_PtaxHist FitSit WITH (NOLOCK)
        ON xEEID = FitSit.PthEEID
	LEFT JOIN dbo.U_EUSBATAX_PtaxHist_StateReciprocity sit1 WITH (NOLOCK)
		ON sit1.PthEEID = xEEID
		AND sit1.PthRowNo = 1
	LEFT JOIN dbo.U_EUSBATAX_PtaxHist_StateReciprocity sit2 WITH (NOLOCK)
		ON sit2.PthEEID = xEEID
		AND sit2.PthRowNo = 2
    LEFT JOIN (SELECT PthEEID, MAX(IIF(PthTypeOfTax = 'SUI', '0', '1')) AS PaStateTax
                FROM dbo.U_EUSBATAX_PtaxHist WITH (NOLOCK)
                WHERE PthTypeOfTax = 'SUI'
                GROUP BY PthEEID) As Sui
        ON xEEID = Sui.PthEEID
    LEFT JOIN (SELECT PthEEID, MAX(PthLitSupTaxPercentOverBase) AS PthLitSupTaxPercentOverBase, MAX(IIF(PthTaxCode IS NOT NULL, '0', '1')) AS PhillyLocalTax
                FROM dbo.U_EUSBATAX_PTaxHist_Local WITH (NOLOCK)
                GROUP BY PthEEID) AS Lcl
        ON xEEID = Lcl.PthEEID
    WHERE @ExportCode LIKE 'T%'
    GROUP BY xEEID, xCoID;

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EUSBPATAX_drv_TaxCodes ON dbo.U_EUSBPATAX_drv_TaxCodes (drvInitialSort);

    ---------------------------------
    -- HEADER RECORD
    ---------------------------------
    IF OBJECT_ID('U_EUSBPATAX_drv_hdrTaxCodes_H03','U') IS NOT NULL
        DROP TABLE dbo.U_EUSBPATAX_drv_hdrTaxCodes_H03;
    SELECT DISTINCT
        drvFileRundate = GETDATE()
        ,drvFileRunTime = FORMAT(GETDATE(), 'hh:mm:ss')
    INTO dbo.U_EUSBPATAX_drv_hdrTaxCodes_H03
    FROM dbo.U_EUSBPATAX_EEList WITH (NOLOCK)
    WHERE @ExportCode LIKE 'T%';

    ---------------------------------
    -- HEADER RECORD
    ---------------------------------
    IF OBJECT_ID('U_EUSBPATAX_drv_hdrTaxCodes_H04','U') IS NOT NULL
        DROP TABLE dbo.U_EUSBPATAX_drv_hdrTaxCodes_H04;
    SELECT DISTINCT
        drvRowHeader = 'LAY'
    INTO dbo.U_EUSBPATAX_drv_hdrTaxCodes_H04
    FROM dbo.U_EUSBPATAX_EEList WITH (NOLOCK)
    WHERE @ExportCode LIKE 'T%';

    ---------------------------------
    -- TRAILER RECORD
    ---------------------------------
    IF OBJECT_ID('U_EUSBPATAX_drv_trlTaxCodes','U') IS NOT NULL
        DROP TABLE dbo.U_EUSBPATAX_drv_trlTaxCodes;
    SELECT DISTINCT
		drvFileRunDate = GETDATE()
        ,drvFileRunTime = FORMAT(GETDATE(), 'hh:mm:ss')
        ,drvRecordCount = (SELECT COUNT(*) FROM dbo.U_EUSBPATAX_drv_TaxCodes)
    INTO dbo.U_EUSBPATAX_drv_trlTaxCodes
    FROM dbo.U_EUSBPATAX_EEList WITH (NOLOCK)
    WHERE @ExportCode LIKE 'T%';

END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwEUSBPATAX_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_EUSBPATAX_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'EUSBPATAX%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202006231'
       ,expStartPerControl     = '202006231'
       ,expLastEndPerControl   = '202006239'
       ,expEndPerControl       = '202006239'
WHERE expFormatCode = 'EUSBPATAX';

**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwEUSBPATAX_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_EUSBPATAX_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort
