--===========================
-- V3.1
--===========================

SET NOCOUNT ON;
IF OBJECT_ID('U_E401JHCK_SavePath') IS NOT NULL DROP TABLE [dbo].[U_E401JHCK_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_E401JHCK_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'E401JHCK' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwE401JHCK_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwE401JHCK_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_E401JHCK') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_E401JHCK];
GO
IF OBJECT_ID('U_E401JHCK_TermsPlanNum') IS NOT NULL DROP TABLE [dbo].[U_E401JHCK_TermsPlanNum];
GO
IF OBJECT_ID('U_E401JHCK_PEarHist') IS NOT NULL DROP TABLE [dbo].[U_E401JHCK_PEarHist];
GO
IF OBJECT_ID('U_E401JHCK_PDedHist') IS NOT NULL DROP TABLE [dbo].[U_E401JHCK_PDedHist];
GO
IF OBJECT_ID('U_E401JHCK_PDedHist_Loans') IS NOT NULL DROP TABLE [dbo].[U_E401JHCK_PDedHist_Loans];
GO
IF OBJECT_ID('U_E401JHCK_File') IS NOT NULL DROP TABLE [dbo].[U_E401JHCK_File];
GO
IF OBJECT_ID('U_E401JHCK_EEList') IS NOT NULL DROP TABLE [dbo].[U_E401JHCK_EEList];
GO
IF OBJECT_ID('U_E401JHCK_401Codes') IS NOT NULL DROP TABLE [dbo].[U_E401JHCK_401Codes];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'E401JHCK';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'E401JHCK';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'E401JHCK';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'E401JHCK';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'E401JHCK';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhRecordSize,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhPreProcessSQL,AdhRespectZeroPayRate,AdhCreateTClockBatches,AdhThirdPartyPay) VALUES ('N','C','Y','0','','','N','','N','','013010','EMPEXPORT','CDE','E401JHCK','John Hancock 401K','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','4000','S','N','E401JHCK00Z0','N','Jan  1 1900 12:00AM','C','dbo.dsi_sp_Switchbox_v2','N',NULL,'N');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('1','E401JHCK00Z0','50','H','01','1',NULL,'comb.h10',NULL,NULL,'"comb.h10"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('2','E401JHCK00Z0','50','H','01','2',NULL,'Cont#',NULL,NULL,'"Cont# "','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('3','E401JHCK00Z0','50','H','01','3',NULL,'SSN#',NULL,NULL,'"SSN#"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('4','E401JHCK00Z0','50','H','01','4',NULL,'FirstName',NULL,NULL,'"FirstName"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('5','E401JHCK00Z0','50','H','01','5',NULL,'LastName',NULL,NULL,'"LastName"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('6','E401JHCK00Z0','50','H','01','6',NULL,'Initial',NULL,NULL,'"Initial"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('7','E401JHCK00Z0','50','H','01','7',NULL,'NamePrefix',NULL,NULL,'"NamePrefix"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('8','E401JHCK00Z0','50','H','01','8',NULL,'EEID#',NULL,NULL,'"EEID#"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('9','E401JHCK00Z0','50','H','01','9',NULL,'Address1',NULL,NULL,'"Address1"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('10','E401JHCK00Z0','50','H','01','10',NULL,'Address2',NULL,NULL,'"Address2"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('11','E401JHCK00Z0','50','H','01','11',NULL,'City',NULL,NULL,'"City"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('12','E401JHCK00Z0','50','H','01','12',NULL,'State',NULL,NULL,'"State"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('13','E401JHCK00Z0','50','H','01','13',NULL,'ZipCode',NULL,NULL,'"ZipCode"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('14','E401JHCK00Z0','50','H','01','14',NULL,'Country',NULL,NULL,'"Country"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('15','E401JHCK00Z0','50','H','01','15',NULL,'StateRes',NULL,NULL,'"StateRes"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('16','E401JHCK00Z0','50','H','01','16',NULL,'ERProvEmail',NULL,NULL,'"ERProvEmail"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('17','E401JHCK00Z0','50','H','01','17',NULL,'Division',NULL,NULL,'"Division"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('18','E401JHCK00Z0','50','H','01','18',NULL,'BirthDate',NULL,NULL,'"BirthDate"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('19','E401JHCK00Z0','50','H','01','19',NULL,'HireDate',NULL,NULL,'"HireDate"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('20','E401JHCK00Z0','50','H','01','20',NULL,'EmplStat',NULL,NULL,'"EmplStat"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('21','E401JHCK00Z0','50','H','01','21',NULL,'EmplStatDate',NULL,NULL,'"EmplStatDate"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('22','E401JHCK00Z0','50','H','01','22',NULL,'EligInd',NULL,NULL,'"EligInd"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('23','E401JHCK00Z0','50','H','01','23',NULL,'EligDate',NULL,NULL,'"EligDate"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('24','E401JHCK00Z0','50','H','01','24',NULL,'OptOutInd',NULL,NULL,'"OptOutInd"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('25','E401JHCK00Z0','50','H','01','25',NULL,'YTDHrs',NULL,NULL,'"YTDHrs"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('26','E401JHCK00Z0','50','H','01','26',NULL,'PlanYTDComp',NULL,NULL,'"PlanYTDComp"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('27','E401JHCK00Z0','50','H','01','27',NULL,'YTDHrsWkCompDt',NULL,NULL,'"YTDHrsWkCompDt"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('28','E401JHCK00Z0','50','H','01','28',NULL,'BaseSalary',NULL,NULL,'"BaseSalary"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('29','E401JHCK00Z0','50','H','01','29',NULL,'BfTxDefPct',NULL,NULL,'"BfTxDefPct"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('30','E401JHCK00Z0','50','H','01','30',NULL,'BfTxFltDoDef',NULL,NULL,'"BfTxFltDoDef"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('31','E401JHCK00Z0','50','H','01','31',NULL,'DesigRothPct',NULL,NULL,'"DesigRothPct"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('32','E401JHCK00Z0','50','H','01','32',NULL,'DesigRothAmt',NULL,NULL,'"DesigRothAmt"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('33','E401JHCK00Z0','50','H','01','33',NULL,'Trans#',NULL,NULL,'"Trans#"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('34','E401JHCK00Z0','50','H','01','34',NULL,'Date',NULL,NULL,'"Date"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('35','E401JHCK00Z0','50','H','01','35',NULL,'EEDEF',NULL,NULL,'"EEDEF"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('36','E401JHCK00Z0','50','H','01','36',NULL,'ERMAT',NULL,NULL,'"ERMAT"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('37','E401JHCK00Z0','50','H','01','37',NULL,'QMAC',NULL,NULL,'"QMAC"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('38','E401JHCK00Z0','50','H','01','38',NULL,'SHMAC',NULL,NULL,'"SHMAC"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('39','E401JHCK00Z0','50','H','01','39',NULL,'ERMC3',NULL,NULL,'"ERMC3"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('40','E401JHCK00Z0','50','H','01','40',NULL,'EEROT',NULL,NULL,'"EEROT"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('41','E401JHCK00Z0','50','H','01','41',NULL,'QNEC',NULL,NULL,'"QNEC"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('42','E401JHCK00Z0','50','H','01','42',NULL,'SHNEC',NULL,NULL,'"SHNEC"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('43','E401JHCK00Z0','50','H','01','43',NULL,'ERPS',NULL,NULL,'"ERPS"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('44','E401JHCK00Z0','50','H','01','44',NULL,'EERC',NULL,NULL,'"EERC"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('45','E401JHCK00Z0','50','H','01','45',NULL,'EEVND',NULL,NULL,'"EEVND"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('46','E401JHCK00Z0','50','H','01','46',NULL,'EEVD',NULL,NULL,'"EEVD"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('47','E401JHCK00Z0','50','H','01','47',NULL,'EEMAN',NULL,NULL,'"EEMAN"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('48','E401JHCK00Z0','50','H','01','48',NULL,'ERMP',NULL,NULL,'"ERMP"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('49','E401JHCK00Z0','50','H','01','49',NULL,'ERCON',NULL,NULL,'"ERCON"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('50','E401JHCK00Z0','50','H','01','50',NULL,'S/HGR',NULL,NULL,'"S/HGR"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('51','E401JHCK00Z0','50','H','01','51',NULL,'EEMT1',NULL,NULL,'"EEMT1"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('52','E401JHCK00Z0','50','H','01','52',NULL,'EEMT2',NULL,NULL,'"EEMT2"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('53','E401JHCK00Z0','50','H','01','53',NULL,'ERMT1',NULL,NULL,'"ERMT1"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('54','E401JHCK00Z0','50','H','01','54',NULL,'ERMT2',NULL,NULL,'"ERMT2"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('55','E401JHCK00Z0','50','H','01','55',NULL,'ERMT3',NULL,NULL,'"ERMT3"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('56','E401JHCK00Z0','50','H','01','56',NULL,'ERMT4',NULL,NULL,'"ERMT4"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('57','E401JHCK00Z0','50','H','01','57',NULL,'ERMT5',NULL,NULL,'"ERMT5"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('58','E401JHCK00Z0','50','H','01','58',NULL,'ERMT6',NULL,NULL,'"ERMT6"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('59','E401JHCK00Z0','50','H','01','59',NULL,'LoanID',NULL,NULL,'"LoanID"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('60','E401JHCK00Z0','50','H','01','60',NULL,'LoanAmt',NULL,NULL,'"LoanAmt"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('61','E401JHCK00Z0','50','H','01','61',NULL,'LoanID',NULL,NULL,'"LoanID"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('62','E401JHCK00Z0','50','H','01','62',NULL,'LoanAmt',NULL,NULL,'"LoanAmt"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('63','E401JHCK00Z0','50','H','01','63',NULL,'LoanID',NULL,NULL,'"LoanID"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('64','E401JHCK00Z0','50','H','01','64',NULL,'LoanAmt',NULL,NULL,'"LoanAmt"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('65','E401JHCK00Z0','50','H','01','65',NULL,'LoanID',NULL,NULL,'"LoanID"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('66','E401JHCK00Z0','50','H','01','66',NULL,'LoanAmt',NULL,NULL,'"LoanAmt"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('67','E401JHCK00Z0','50','H','01','67',NULL,'LoanID',NULL,NULL,'"LoanID"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('68','E401JHCK00Z0','50','H','01','68',NULL,'LoanAmt',NULL,NULL,'"LoanAmt"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('69','E401JHCK00Z0','50','H','01','69',NULL,'LoanID',NULL,NULL,'"LoanID"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('70','E401JHCK00Z0','50','H','01','70',NULL,'LoanAmt',NULL,NULL,'"LoanAmt"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('71','E401JHCK00Z0','50','H','01','71',NULL,'LoanID',NULL,NULL,'"LoanID"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('72','E401JHCK00Z0','50','H','01','72',NULL,'LoanAmt',NULL,NULL,'"LoanAmt"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('73','E401JHCK00Z0','50','H','01','73',NULL,'LoanID',NULL,NULL,'"LoanID"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('74','E401JHCK00Z0','50','H','01','74',NULL,'LoanAmt',NULL,NULL,'"LoanAmt"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('75','E401JHCK00Z0','50','H','01','75',NULL,'LoanID',NULL,NULL,'"LoanID"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('76','E401JHCK00Z0','50','H','01','76',NULL,'LoanAmt',NULL,NULL,'"LoanAmt"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('77','E401JHCK00Z0','50','H','01','77',NULL,'LoanID',NULL,NULL,'"LoanID"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('78','E401JHCK00Z0','50','H','01','78',NULL,'LoanAmt',NULL,NULL,'"LoanAmt"','(''DA''=''T'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('1','E401JHCK00Z0','50','D','11','1',NULL,'comb.h10',NULL,NULL,'"comb.d"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('2','E401JHCK00Z0','50','D','11','2',NULL,'Cont#',NULL,NULL,'"drvContNum"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('3','E401JHCK00Z0','50','D','11','3',NULL,'SSN#',NULL,NULL,'"drvSSN"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('4','E401JHCK00Z0','50','D','11','4',NULL,'FirstName',NULL,NULL,'"drvNameFirst"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('5','E401JHCK00Z0','50','D','11','5',NULL,'LastName',NULL,NULL,'"drvNameLast"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('6','E401JHCK00Z0','50','D','11','6',NULL,'Initial',NULL,NULL,'"drvMiddleInitial"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('7','E401JHCK00Z0','50','D','11','7',NULL,'NamePrefix',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('8','E401JHCK00Z0','50','D','11','8',NULL,'EEID#',NULL,NULL,'"drvEmpNo"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('9','E401JHCK00Z0','50','D','11','9',NULL,'Address1',NULL,NULL,'"drvAddressLine1"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('10','E401JHCK00Z0','50','D','11','10',NULL,'Address2',NULL,NULL,'"drvAddressLine2"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('11','E401JHCK00Z0','50','D','11','11',NULL,'City',NULL,NULL,'"drvAddressCity"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('12','E401JHCK00Z0','50','D','11','12',NULL,'State',NULL,NULL,'"drvAddressState"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('13','E401JHCK00Z0','50','D','11','13',NULL,'ZipCode',NULL,NULL,'"drvAddressZipCode"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('14','E401JHCK00Z0','50','D','11','14',NULL,'Country',NULL,NULL,'"drvAddressCountry"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('15','E401JHCK00Z0','50','D','11','15',NULL,'StateRes',NULL,NULL,'"drvStateSUI"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('16','E401JHCK00Z0','50','D','11','16',NULL,'ERProvEmail',NULL,NULL,'"drvAddressEmail"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('17','E401JHCK00Z0','50','D','11','17',NULL,'Division',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('18','E401JHCK00Z0','50','D','11','18',NULL,'BirthDate',NULL,NULL,'"drvDateOfBirth"','(''UDMDY''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('19','E401JHCK00Z0','50','D','11','19',NULL,'HireDate',NULL,NULL,'"drvDateOfOriginalHire"','(''UDMDY''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('20','E401JHCK00Z0','50','D','11','20',NULL,'EmplStat',NULL,NULL,'"drvEmplStatus"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('21','E401JHCK00Z0','50','D','11','21',NULL,'EmplStatDate',NULL,NULL,'"drvEmplStatusDate"','(''UDMDY''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('22','E401JHCK00Z0','50','D','11','22',NULL,'EligInd',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('23','E401JHCK00Z0','50','D','11','23',NULL,'EligDate',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('24','E401JHCK00Z0','50','D','11','24',NULL,'OptOutInd',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('25','E401JHCK00Z0','50','D','11','25',NULL,'YTDHrs',NULL,NULL,'"drvYTDHrs"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('26','E401JHCK00Z0','50','D','11','26',NULL,'PlanYTDComp',NULL,NULL,'"drvPlanYTDComp"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('27','E401JHCK00Z0','50','D','11','27',NULL,'YTDHrsWkCompDt',NULL,NULL,'"drvPrgPayDate"','(''UDMDY''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('28','E401JHCK00Z0','50','D','11','28',NULL,'BaseSalary',NULL,NULL,'"drvAnnSalary"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('29','E401JHCK00Z0','50','D','11','29',NULL,'BfTxDefPct',NULL,NULL,'"drvBfTxDefPct"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('30','E401JHCK00Z0','50','D','11','30',NULL,'BfTxFltDoDef',NULL,NULL,'"drvBfTxFltDoDef"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('31','E401JHCK00Z0','50','D','11','31',NULL,'DesigRothPct',NULL,NULL,'"drvDesigRothPct"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('32','E401JHCK00Z0','50','D','11','32',NULL,'DesigRothAmt',NULL,NULL,'"drvDesigRothAmt"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('33','E401JHCK00Z0','50','D','11','33',NULL,'Trans#',NULL,NULL,'"505"','(''DA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('34','E401JHCK00Z0','50','D','11','34',NULL,'Date',NULL,NULL,'"drvPayPeriodEndDate"','(''UDMDY''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('35','E401JHCK00Z0','50','D','11','35',NULL,'EEDEF',NULL,NULL,'"drvEEDEF"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('36','E401JHCK00Z0','50','D','11','36',NULL,'ERMAT',NULL,NULL,'"drvERMAT"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('37','E401JHCK00Z0','50','D','11','37',NULL,'QMAC',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('38','E401JHCK00Z0','50','D','11','38',NULL,'SHMAC',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('39','E401JHCK00Z0','50','D','11','39',NULL,'ERMC3',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('40','E401JHCK00Z0','50','D','11','40',NULL,'EEROT',NULL,NULL,'"drvEEROT"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('41','E401JHCK00Z0','50','D','11','41',NULL,'QNEC',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('42','E401JHCK00Z0','50','D','11','42',NULL,'SHNEC',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('43','E401JHCK00Z0','50','D','11','43',NULL,'ERPS',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('44','E401JHCK00Z0','50','D','11','44',NULL,'EERC',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('45','E401JHCK00Z0','50','D','11','45',NULL,'EEVND',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('46','E401JHCK00Z0','50','D','11','46',NULL,'EEVD',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('47','E401JHCK00Z0','50','D','11','47',NULL,'EEMAN',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('48','E401JHCK00Z0','50','D','11','48',NULL,'ERMP',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('49','E401JHCK00Z0','50','D','11','49',NULL,'ERCON',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('50','E401JHCK00Z0','50','D','11','50',NULL,'S/HGR',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('51','E401JHCK00Z0','50','D','11','51',NULL,'EEMT1',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('52','E401JHCK00Z0','50','D','11','52',NULL,'EEMT2',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('53','E401JHCK00Z0','50','D','11','53',NULL,'ERMT1',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('54','E401JHCK00Z0','50','D','11','54',NULL,'ERMT2',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('55','E401JHCK00Z0','50','D','11','55',NULL,'ERMT3',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('56','E401JHCK00Z0','50','D','11','56',NULL,'ERMT4',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('57','E401JHCK00Z0','50','D','11','57',NULL,'ERMT5',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('58','E401JHCK00Z0','50','D','11','58',NULL,'ERMT6',NULL,NULL,'""','(''SS''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('59','E401JHCK00Z0','50','D','11','59',NULL,'LoanID',NULL,NULL,'"drvLoanID1"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('60','E401JHCK00Z0','50','D','11','60',NULL,'LoanAmt',NULL,NULL,'"drvLoanAmt1"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('61','E401JHCK00Z0','50','D','11','61',NULL,'LoanID',NULL,NULL,'"drvLoanID2"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('62','E401JHCK00Z0','50','D','11','62',NULL,'LoanAmt',NULL,NULL,'"drvLoanAmt2"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('63','E401JHCK00Z0','50','D','11','63',NULL,'LoanID',NULL,NULL,'"drvLoanID3"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('64','E401JHCK00Z0','50','D','11','64',NULL,'LoanAmt',NULL,NULL,'"drvLoanAmt3"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('65','E401JHCK00Z0','50','D','11','65',NULL,'LoanID',NULL,NULL,'"drvLoanID4"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('66','E401JHCK00Z0','50','D','11','66',NULL,'LoanAmt',NULL,NULL,'"drvLoanAmt4"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('67','E401JHCK00Z0','50','D','11','67',NULL,'LoanID',NULL,NULL,'"drvLoanID5"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('68','E401JHCK00Z0','50','D','11','68',NULL,'LoanAmt',NULL,NULL,'"drvLoanAmt5"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('69','E401JHCK00Z0','50','D','11','69',NULL,'LoanID',NULL,NULL,'"drvLoanID6"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('70','E401JHCK00Z0','50','D','11','70',NULL,'LoanAmt',NULL,NULL,'"drvLoanAmt6"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('71','E401JHCK00Z0','50','D','11','71',NULL,'LoanID',NULL,NULL,'"drvLoanID7"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('72','E401JHCK00Z0','50','D','11','72',NULL,'LoanAmt',NULL,NULL,'"drvLoanAmt7"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('73','E401JHCK00Z0','50','D','11','73',NULL,'LoanID',NULL,NULL,'"drvLoanID8"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('74','E401JHCK00Z0','50','D','11','74',NULL,'LoanAmt',NULL,NULL,'"drvLoanAmt8"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('75','E401JHCK00Z0','50','D','11','75',NULL,'LoanID',NULL,NULL,'"drvLoanID9"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('76','E401JHCK00Z0','51','D','11','76',NULL,'LoanAmt',NULL,NULL,'"drvLoanAmt9"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('77','E401JHCK00Z0','52','D','11','77',NULL,'LoanID',NULL,NULL,'"drvLoanID10"','(''UA''=''T,'')');
INSERT INTO [dbo].[AscDefF] (AdfFieldNumber,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType,AdfExpression,AdfForCond) VALUES ('78','E401JHCK00Z0','53','D','11','78',NULL,'LoanAmt',NULL,NULL,'"drvLoanAmt10"','(''UA''=''T'')');
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
DECLARE @UDSERVER varchar(5) = (SELECT RTRIM(LEFT(@@SERVERNAME,PATINDEX('%[0-9]%',@@SERVERNAME)) + SUBSTRING(@@SERVERNAME,PATINDEX('%UP[0-9]%',@@SERVERNAME)+2,1)));
SELECT @UDSERVER = CASE WHEN @UDSERVER = 'EW21' THEN 'WP6' WHEN @UDSERVER = 'EW22' THEN 'WP7' ELSE @UDSERVER END;
DECLARE @UDCOCODE varchar(5) = (SELECT RTRIM(CmmCompanyCode) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expCOIDList,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\[UDCOCODE]_E401JHCK_20200507.txt',NULL,NULL,NULL,NULL,NULL,NULL,'JH 401K Plan1 83079','202005011','EMPEXPORT','P1_XOE',NULL,'E401JHCK',NULL,NULL,NULL,'202005011','Feb 11 2020 12:01PM','Feb 11 2020 12:01PM','202004231',NULL,'','','202004231',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL,NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expCOIDList,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\[UDCOCODE]_E401JHCK_20200507.txt',NULL,NULL,NULL,NULL,NULL,NULL,'JH 401K Plan2 60867','202005011','EMPEXPORT','P2_XOE',NULL,'E401JHCK',NULL,NULL,NULL,'202005011','Feb 11 2020 12:01PM','Feb 11 2020 12:01PM','202004231',NULL,'','','202004231',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL,NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expCOIDList,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\[UDCOCODE]_E401JHCK_20200507.txt',NULL,NULL,NULL,NULL,NULL,NULL,'JH 401K Plan3 108301','202005011','EMPEXPORT','P3_XOE',NULL,'E401JHCK',NULL,NULL,NULL,'202005011','Feb 11 2020 12:01PM','Feb 11 2020 12:01PM','202004231',NULL,'','','202004231',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL,NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expCOIDList,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\[UDCOCODE]_E401JHCK_20200507.txt',NULL,NULL,NULL,NULL,NULL,NULL,'JH 401K Plan1 83079 Sched','202005011','EMPEXPORT','SHCEDP1',NULL,'E401JHCK',NULL,NULL,NULL,'202005011','Feb 11 2020 12:01PM','Feb 11 2020 12:01PM','202004231',NULL,'','','202004231',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL,NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expCOIDList,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\[UDCOCODE]_E401JHCK_20200507.txt',NULL,NULL,NULL,NULL,NULL,NULL,'JH 401K Plan2 60867 Sched','202005011','EMPEXPORT','SHCEDP2',NULL,'E401JHCK',NULL,NULL,NULL,'202005011','Feb 11 2020 12:01PM','Feb 11 2020 12:01PM','202004231',NULL,'','','202004231',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL,NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expCOIDList,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\[UDCOCODE]_E401JHCK_20200507.txt',NULL,NULL,NULL,NULL,NULL,NULL,'JH 401K Plan3 108301 Sched','202005011','EMPEXPORT','SHCEDP3',NULL,'E401JHCK',NULL,NULL,NULL,'202005011','Feb 11 2020 12:01PM','Feb 11 2020 12:01PM','202004231',NULL,'','','202004231',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL,NULL);
UPDATE dbo.AscExp SET expAscFileName = CASE WHEN LEFT(@UDENV,2) IN ('NW','EW','WP') THEN REPLACE(REPLACE(REPLACE(expAscFileName,'[UDENV]',@UDENV),'[UDSERVER]',@UDSERVER),'[UDCOCODE]',@UDCOCODE) ELSE '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\' + @UDCOCODE + '_E401JHCK_20200507.txt' END WHERE expFormatCode = 'E401JHCK';
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('E401JHCK','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('E401JHCK','ExportPath','V',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('E401JHCK','InitialSort','C','InitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('E401JHCK','UDESPath','C','\\us.saas\n21\data_exchange\USP1000\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('E401JHCK','UseFileName','V','Y');
UPDATE dbo.U_dsi_Configuration SET CfgValue = CASE WHEN CfgName = 'UseFileName' THEN 'Y' ELSE NULL END WHERE FormatCode = 'E401JHCK' AND CfgName IN ('UseFileName','ExportPath');
INSERT INTO dbo.CustomTemplates (CreationDate,Engine,EngineCode,IsActive,ModifiedDate) SELECT CreationDate = GETDATE(), Engine = AdhEngine, EngineCode = AdhFormatCode, IsActive = 1, ModifiedDate = GETDATE() FROM dbo.AscDefH WITH (NOLOCK) WHERE AdhFormatCode = 'E401JHCK' AND NOT EXISTS(SELECT 1 FROM dbo.CustomTemplates WHERE EngineCode = AdhFormatCode);
IF OBJECT_ID('U_E401JHCK_SavePath') IS NOT NULL DROP TABLE [dbo].[U_E401JHCK_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('E401JHCK','D11','dbo.U_E401KCOD_drvTbl_D11',NULL);
IF OBJECT_ID('U_E401JHCK_401Codes') IS NULL
CREATE TABLE [dbo].[U_E401JHCK_401Codes] (
    [MapDedCodes] varchar(10) NULL,
    [MapDescription] varchar(100) NULL,
    [MapJhMoneyType] varchar(10) NULL,
    [MapPlanNum] varchar(10) NULL
);
IF OBJECT_ID('U_E401JHCK_EEList') IS NULL
CREATE TABLE [dbo].[U_E401JHCK_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_E401JHCK_File') IS NULL
CREATE TABLE [dbo].[U_E401JHCK_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(4000) NULL
);
IF OBJECT_ID('U_E401JHCK_PEarHist') IS NULL
CREATE TABLE [dbo].[U_E401JHCK_PEarHist] (
    [PehEEID] char(12) NOT NULL,
    [PehPayDate] datetime NULL,
    [PehEOM] date NULL,
    [PehCurAmt] varchar(30) NULL,
    [PehCurHrs] varchar(30) NULL,
    [PehCurAmtYTD] varchar(30) NULL,
    [PehCurHrsYTD] varchar(30) NULL
);
IF OBJECT_ID('U_E401JHCK_TermsPlanNum') IS NULL
CREATE TABLE [dbo].[U_E401JHCK_TermsPlanNum] (
    [TpnEEID] char(12) NOT NULL,
    [TpnCoID] char(5) NOT NULL,
    [TpnPlanType] varchar(1) NULL,
    [TpnPlanNum] varchar(10) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_E401JHCK]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: U.S. PT Management, LTD

Created By: Wyle Cordero
Business Analyst: Dian Turner
Create Date: 02/11/2020
Service Request Number: SR-2019-00253247

Purpose: John Hancock 401K

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2020     SR-2020-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'E401JHCK';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'E401JHCK';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'E401JHCK';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'E401JHCK';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'E401JHCK' ORDER BY RunID DESC;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'E401JHCK', 'P1_XOE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'E401JHCK', 'P2_XOE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'E401JHCK', 'P3_XOE';


EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'E401JHCK', @AllObjects = 'Y', @IsWeb = 'Y'
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
    SELECT @FormatCode = 'E401JHCK';

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

    -- INCLUDE employees with employee type in REG and PRN
    DELETE el
    FROM dbo.U_E401JHCK_EEList el
    INNER JOIN dbo.EmpComp
        ON EecEEID = xEEID
        AND EecCoID = xCoID
        AND EecEEType NOT IN ('REG', 'PRN')
    ;

    -- Include terminated employees within the last year.
    DELETE el
    FROM dbo.U_E401JHCK_EEList el
    INNER JOIN dbo.EmpComp
        ON EecEEID = xEEID
        AND EecCoID = xCoID
        AND EecEmplStatus = 'T'
        AND EecDateOfTermination < CONVERT(DATE, DATEADD(YEAR, -1, GETDATE()))
    ;

    --==========================================
    -- Build Working Tables
    --==========================================

    IF OBJECT_ID ('U_E401JHCK_401Codes') IS NOT NULL
        DROP TABLE dbo.U_E401JHCK_401Codes;
    CREATE TABLE dbo.U_E401JHCK_401Codes (
        MapDedCodes VARCHAR(10) NULL
        ,MapDescription VARCHAR(100) NULL
        ,MapJhMoneyType VARCHAR(10) NULL
        ,MapPlanNum VARCHAR(10) NULL
    );
 
    INSERT INTO dbo.U_E401JHCK_401Codes (MapDedCodes, MapDescription, MapJhMoneyType, MapPlanNum)
    VALUES 
        ('401K', 'Main Traditional %', 'EEDEF', '83079')
        ,('4FLAT', 'Main Traditional Flat $', 'EEDEF', '83079')
        ,('4ROTH', 'Main Roth %', 'EEROT', '83079')
        ,('4FROT', 'Main ROTH Flat $', 'EEROT', '83079')
        ,('401CU', 'Main Traditional Catch Up Flat $', 'EEDEF', '83079')
        ,('4RCU', 'Main ROTH Catch Up Flat $', 'EEROT', '83079')
        ,('4LN', 'Main Loan 1', '1', '83079')
        ,('4LN2', 'Main Loan 2', '2', '83079')
        ,('4LN3', 'Main Loan 3', '3', '83079')
        ,('4LN4', 'Main Loan 4', '4', '83079')
        ,('4LN5', 'Main Loan 5', '5', '83079')
        ,('4LN6', 'Main Loan 6', '6', '83079')
        ,('4LN7', 'Main Loan 7', '7', '83079')
        ,('4LN8', 'Main Loan 8', '8', '83079')
        ,('4LN9', 'Main Loan 9', '9', '83079')
        ,('4LN10', 'Main Loan 10', '10', '83079')
        ,('4K444', 'Gold Traditional %', 'EEDEF', '60867')
        ,('4F444', 'Gold Traditional Flat $', 'EEDEF', '60867')
        ,('444RP', 'Gold Roth %', 'EEROT', '60867')
        ,('444RF', 'Gold ROTH Flat $', 'EEROT', '60867')
        ,('4C444', 'Gold Traditional Catch Up Flat $', 'EEDEF', '60867')
        ,('GDRCU', 'Gold ROTH Catch Up Flat $', 'EEROT', '60867')
        ,('444L1', 'Gold Loan 1', '1', '60867')
        ,('444L2', 'Gold Loan 2', '2', '60867')
        ,('444L3', 'Gold Loan 3', '3', '60867')
        ,('444L4', 'Gold Loan 4', '4', '60867')
        ,('444L5', 'Gold Loan 5', '5', '60867')
        ,('444L6', 'Gold Loan 6', '6', '60867')
        ,('444L7', 'Gold Loan 7', '7', '60867')
        ,('444L8', 'Gold Loan 8', '8', '60867')
        ,('444L9', 'Gold Loan 9', '9', '60867')
        --,('444L1', 'Gold Loan 10', '10', '60867')
        ,('4KPLP', 'Platinum Traditional %', 'EEDEF', '108301')
        ,('4FPLP', 'Platinum Traditional Flat $', 'EEDEF', '108301')
        ,('4RPLP', 'Platinum Roth %', 'EEROT', '108301')
        ,('4RFPP', 'Platinum ROTH Flat $', 'EEROT', '108301')
        ,('4CPLP', 'Platinum Traditional Catch Up Flat $', 'EEDEF', '108301')
        ,('PLRCU', 'Platinum ROTH Catch Up Flat $', 'EEROT', '108301')
        ,('4LPLP', 'Platinum Loan 1', '1', '108301')
        ,('PLPL2', 'Platinum Loan 2', '2', '108301')
        ,('PLPL3', 'Platinum Loan 3', '3', '108301')
        ,('PLPL4', 'Platinum Loan 4', '4', '108301')
        ,('PLPL5', 'Platinum Loan 5', '5', '108301')
        ,('PLPL6', 'Platinum Loan 6', '6', '108301')
        ,('PLPL7', 'Platinum Loan 7', '7', '108301')
        ,('PLPL8', 'Platinum Loan 8', '8', '108301')
        ,('PLPL9', 'Platinum Loan 9', '9', '108301')
        ,('PLP10', 'Platinum Loan 10', '10', '108301')
    ;

    -----------------------------
    -- Working Table - PDedHist
    -----------------------------
    IF OBJECT_ID('U_E401JHCK_PDedHist','U') IS NOT NULL
        DROP TABLE dbo.U_E401JHCK_PDedHist;
    SELECT DISTINCT
         PdhEEID
         ,PdhCoID
         ,PdhPlanType = 
                CASE
                    WHEN MapPlanNum = '83079'  THEN '1'
                    WHEN MapPlanNum = '60867'  THEN '2'
                    WHEN MapPlanNum = '108301' THEN '3'
                END    
         ,PdhPlanNum = MapPlanNum
         ,PdhBfTxDefPct = MAX(CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), CASE WHEN PdhPerControl BETWEEN @StartPerControl AND @EndPerControl AND PdhDedCode IN ('401K', '4K444', '4kPLP', '401CU', '4C444', '4CPLP') THEN PdhEECalcRateOrPct * 100 END)))
         ,PdhBfTxFltDoDef = CONVERT(VARCHAR, SUM(CONVERT(DECIMAL(15,2), CASE WHEN PdhPerControl BETWEEN @StartPerControl AND @EndPerControl AND PdhDedCode IN ('4FLAT', '4F444', '4FPLP') THEN PdhEECurAmt ELSE 0.00 END)))
         ,PdhDesigRothPct = MAX(CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), CASE WHEN PdhPerControl BETWEEN @StartPerControl AND @EndPerControl AND PdhDedCode IN ('4ROTH', '444RP', '4RPLP') THEN PdhEECalcRateOrPct * 100 END)))
         ,PedDesigRothAmt = CONVERT(VARCHAR, SUM(CONVERT(DECIMAL(15,2), CASE WHEN PdhPerControl BETWEEN @StartPerControl AND @EndPerControl AND PdhDedCode IN ('4FROT', '444RF', '4RFPP') THEN PdhEECurAmt ELSE 0.00 END)))
         ,PdhEEDEFAmt = CONVERT(VARCHAR,SUM(CONVERT(DECIMAL(15,2),CASE WHEN PdhPerControl BETWEEN @StartPerControl AND @EndPerControl AND MapJhMoneyType = 'EEDEF' THEN PdhEECurAmt ELSE 0.00 END)))
         ,PdhEEROTAmt = CONVERT(VARCHAR,SUM(CONVERT(DECIMAL(15,2),CASE WHEN PdhPerControl BETWEEN @StartPerControl AND @EndPerControl AND MapJhMoneyType = 'EEROT' THEN PdhEECurAmt ELSE 0.00 END)))
        -- Current Payroll Amounts
        ,PdhEECurAmt    = CONVERT(VARCHAR,SUM(CONVERT(DECIMAL(15,2),CASE WHEN PdhPerControl BETWEEN @StartPerControl AND @EndPerControl THEN PdhEECurAmt ELSE 0.00 END)))
        ,PdhERCurAmt    = CONVERT(VARCHAR,SUM(CONVERT(DECIMAL(15,2),CASE WHEN PdhPerControl BETWEEN @StartPerControl AND @EndPerControl THEN PdhERCurAmt ELSE 0.00 END)))
        -- YTD Payroll Amounts
        ,PdhEECurAmtYTD = CONVERT(VARCHAR,SUM(CONVERT(DECIMAL(15,2),PdhEECurAmt)))
        ,PdhERCurAmtYTD = CONVERT(VARCHAR,SUM(CONVERT(DECIMAL(15,2),PdhERCurAmt)))
    INTO dbo.U_E401JHCK_PDedHist
    FROM dbo.PDedHist WITH (NOLOCK)
    JOIN dbo.U_E401JHCK_401Codes WITH (NOLOCK)
        ON MapDedCodes = pdhDedCode
    WHERE LEFT(PdhPerControl,4) = LEFT(@EndPerControl,4)
    AND PdhPerControl <= @EndPerControl
    GROUP BY PdhEEID, PdhCoID, MapPlanNum
	OPTION (FORCE ORDER);

    -----------------------------
    -- Working Table - PDedHist_Loans
    -----------------------------
    IF OBJECT_ID('U_E401JHCK_PDedHist_Loans','U') IS NOT NULL
        DROP TABLE dbo.U_E401JHCK_PDedHist_Loans;
    SELECT DISTINCT
         PdhlEEID = PdhEEId
         ,PdhlCoID = PdhCoID
		 ,PdhlDedCode = PdhDedCode
         ,PdhlPlanType = 
                CASE
                    WHEN MapPlanNum = '83079'  THEN '1'
                    WHEN MapPlanNum = '60867'  THEN '2'
                    WHEN MapPlanNum = '108301' THEN '3'
                END
		,PdhlLoanID = MapJhMoneyType
		,PdhlLoanAmt = CONVERT(VARCHAR, CONVERT(DECIMAL(15,2),(SUM(COALESCE(PdhEECurAmt, 0.00)))))
		,PdhlRowNo = ROW_NUMBER() OVER(PARTITION BY PdhEEID, PdhCoId, MapPlanNum ORDER BY 
                CASE
                    WHEN MapPlanNum = '83079'  THEN '1'
                    WHEN MapPlanNum = '60867'  THEN '2'
                    WHEN MapPlanNum = '108301' THEN '3'
                END
				,MapJhMoneyType
		)
    INTO dbo.U_E401JHCK_PDedHist_Loans
    FROM dbo.PDedHist WITH (NOLOCK)
    JOIN dbo.U_E401JHCK_401Codes WITH (NOLOCK)
        ON MapDedCodes = pdhDedCode
		AND MapDescription LIKE '%LOAN%'
	WHERE PdhPerControl BETWEEN @StartPerControl AND @EndPerControl
	GROUP BY PdhEEID, PdhCoID, PdhDedCode, MapPlanNum, MapJhMoneyType
	OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_E401JHCK_PDedHist_Loans ON dbo.U_E401JHCK_PDedHist_Loans (PdhlEEID, PdhlCoID, PdhlRowNo);			 


    -----------------------------
    -- Working Table - TermsPlanNum
    -----------------------------
    -- Need to get plan numbers for terminated employees within the last year that do not have any recent deductions.
    IF OBJECT_ID('U_E401JHCK_TermsPlanNum','U') IS NOT NULL
        DROP TABLE dbo.U_E401JHCK_TermsPlanNum;
    SELECT DISTINCT
        TpnEEID = EedEEID
        ,TpnCoID = EedCoID
        ,TpnPlanType = 
                CASE
                    WHEN MapPlanNum = '83079'  THEN '1'
                    WHEN MapPlanNum = '60867'  THEN '2'
                    WHEN MapPlanNum = '108301' THEN '3'
                END    
        ,TpnPlanNum = MapPlanNum
    INTO dbo.U_E401JHCK_TermsPlanNum
    FROM dbo.EmpDed WITH (NOLOCK)
    INNER JOIN dbo.U_E401JHCK_401Codes WITH (NOLOCK)
        ON MapDedCodes = EedDedCode
    INNER JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = EedEEID
        AND EecCoID = EedCoID
        AND EecEmplStatus = 'T'
        AND EecDateOfTermination >= CONVERT(DATE, DATEADD(YEAR, -1, @EndDate))
    WHERE NOT EXISTS (SELECT 1 FROM dbo.U_E401JHCK_PDedHist WITH (NOLOCK) WHERE PdhEEID = EedEEID AND PdhCoID = EedCoID)
    GROUP BY EedEEID, EedCoID, MapPlanNum
	OPTION (FORCE ORDER);


    -----------------------------
    -- Working Table - PEarHist
    -----------------------------
    IF OBJECT_ID('U_E401JHCK_PEarHist','U') IS NOT NULL
        DROP TABLE dbo.U_E401JHCK_PEarHist;
    SELECT DISTINCT
         PehEEID
        ,PehPayDate = MAX(CASE WHEN PehPerControl BETWEEN @StartPerControl AND @EndPerControl THEN PehPayDate END)
		,PehPeriodEndDate = MAX(CASE WHEN PehPerControl BETWEEN @StartPerControl AND @EndPerControl THEN PrgPeriodEndDate END)
        ,PehEOM = MAX(EOMONTH(PrgPeriodEndDate))
        -- Current Payroll Amount/Hours
        ,PehCurAmt = CONVERT(VARCHAR,SUM(CONVERT(DECIMAL(15,2), CASE WHEN PehPerControl BETWEEN @StartPerControl  AND @EndPerControl THEN PehCurAmt ELSE 0.00 END)))
        ,PehCurHrs = CONVERT(VARCHAR,SUM(CONVERT(DECIMAL(15,2), CASE WHEN PehPerControl BETWEEN @StartPerControl  AND @EndPerControl THEN PehCurHrs ELSE 0.00 END)))
      -- YTD Payroll Amount/Hours
		,PehPayDateYTD = MAX(PehPayDate)
        ,PehCurAmtYTD = CONVERT(VARCHAR,SUM(CONVERT(DECIMAL(15,2),CASE WHEN PehInclInDefComp = 'Y' THEN PehCurAmt ELSE 0.00 END)))
        ,PehCurHrsYTD = CONVERT(VARCHAR,SUM(CONVERT(DECIMAL(15,2), CASE WHEN PehInclInDefComp = 'Y' THEN PehCurHrs ELSE 0.00 END)))
    INTO dbo.U_E401JHCK_PEarHist
    FROM dbo.PayReg WITH (NOLOCK)
    JOIN dbo.PEarHist WITH (NOLOCK)
        ON PehGenNumber = PrgGenNumber
    WHERE LEFT(PehPerControl,4) = LEFT(@EndPerControl,4)
    AND PehPerControl <= @EndPerControl
    GROUP BY PehEEID
	OPTION (FORCE ORDER);

    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_E401KCOD_drvTbl_D11
    ---------------------------------
    IF OBJECT_ID('U_E401KCOD_drvTbl_D11','U') IS NOT NULL
        DROP TABLE dbo.U_E401KCOD_drvTbl_D11;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,InitialSort = eepSSN
        ,drvPlanType = COALESCE(PdhPlanType, TpnPlanType)
        -- standard fields above and additional driver fields below
        ,drvContNum = COALESCE(PdhPlanNum, TpnPlanNum)
        ,drvSSN = eepSSN
        ,drvNameFirst = REPLACE(EepNameFirst, ',', '')
        ,drvNameLast = REPLACE(EepNameLast, ',', '')
        ,drvMiddleInitial = ISNULL(Substring(EepNameMiddle,1,1),'')
        ,drvEmpNo = EecEmpNo
        ,drvAddressLine1 = REPLACE(EepAddressLine1, ',', '')
        ,drvAddressLine2 = REPLACE(EepAddressLine2, ',', '')
        ,drvAddressCity = REPLACE(EepAddressCity, ',', '')
        ,drvAddressState = EepAddressState
        ,drvAddressZipCode = EepAddressZipCode
        ,drvAddressCountry = EepAddressCountry
        ,drvStateSUI = Substring(EecStateSUI,1,2)
        ,drvAddressEmail = REPLACE(EepAddressEmailAlternate, ',', '')
        ,drvDateOfBirth = EepDateOfBirth
        ,drvDateOfOriginalHire = EecDateOfOriginalHire
        ,drvEmplStatus = CASE WHEN EecEmplStatus = 'T' THEN 'T' ELSE 'A' END
        ,drvEmplStatusDate = CASE WHEN EecEmplStatus = 'T' THEN EecDateOfTermination ELSE EecDateOfOriginalHire END
        ,drvYTDHrs = CASE WHEN PehCurHrsYTD <> '0.00' THEN PehCurHrsYTD END 
        ,drvPlanYTDComp = CASE WHEN PehCurAmtYTD <> '0.00' THEN PehCurAmtYTD END 
        ,drvPrgPayDate = PehPayDateYTD
        ,drvAnnSalary = EecAnnSalary
        ,drvBfTxDefPct = CASE WHEN PdhBfTxDefPct <> '0.00' THEN REPLACE(REPLACE(PdhBfTxDefPct, '.00', ''), IIF(PdhBfTxDefPct LIKE '%0', '0', ''), '') END 
        ,drvBfTxFltDoDef = CASE WHEN PdhBfTxFltDoDef <> '0.00' THEN PdhBfTxFltDoDef END 
        ,drvDesigRothPct = CASE WHEN PdhDesigRothPct <> '0.00' THEN REPLACE(REPLACE(PdhDesigRothPct, '.00', ''), IIF(PdhDesigRothPct LIKE '%0', '0', ''), '') END 
        ,drvDesigRothAmt = CASE WHEN PedDesigRothAmt <> '0.00' THEN PedDesigRothAmt END 
        ,drvPayPeriodEndDate = PehPeriodEndDate
        ,drvEEDEF = CASE WHEN PdhEEDEFAmt <> '0.00' THEN PdhEEDEFAmt END
        ,drvERMAT = CASE WHEN PdhERCurAmt <> '0.00' THEN PdhERCurAmt END
        ,drvEEROT = CASE WHEN PdhEEROTAmt <> '0.00' THEN PdhEEROTAmt END  
        ,drvLoanID1 = CASE WHEN l1.PdhlLoanAmt <> '0.00' THEN l1.PdhlLoanID END
        ,drvLoanAmt1 = CASE WHEN l1.PdhlLoanAmt <> '0.00' THEN l1.PdhlLoanAmt END 
        ,drvLoanID2 = CASE WHEN l2.PdhlLoanAmt <> '0.00' THEN l2.PdhlLoanID END
        ,drvLoanAmt2 = CASE WHEN l2.PdhlLoanAmt <> '0.00' THEN l2.PdhlLoanAmt END 
        ,drvLoanID3 = CASE WHEN l3.PdhlLoanAmt <> '0.00' THEN l3.PdhlLoanID END
        ,drvLoanAmt3 = CASE WHEN l3.PdhlLoanAmt <> '0.00' THEN l3.PdhlLoanAmt END 
        ,drvLoanID4 = CASE WHEN l4.PdhlLoanAmt <> '0.00' THEN l4.PdhlLoanID END
        ,drvLoanAmt4 = CASE WHEN l4.PdhlLoanAmt <> '0.00' THEN l4.PdhlLoanAmt END 
        ,drvLoanID5 = CASE WHEN l5.PdhlLoanAmt <> '0.00' THEN l5.PdhlLoanID END
        ,drvLoanAmt5 = CASE WHEN l5.PdhlLoanAmt <> '0.00' THEN l5.PdhlLoanAmt END 
        ,drvLoanID6 = CASE WHEN l6.PdhlLoanAmt <> '0.00' THEN l6.PdhlLoanID END
        ,drvLoanAmt6 = CASE WHEN l6.PdhlLoanAmt <> '0.00' THEN l6.PdhlLoanAmt END
        ,drvLoanID7 = CASE WHEN l7.PdhlLoanAmt <> '0.00' THEN l7.PdhlLoanID END
        ,drvLoanAmt7 = CASE WHEN l7.PdhlLoanAmt <> '0.00' THEN l7.PdhlLoanAmt END 
        ,drvLoanID8 = CASE WHEN l8.PdhlLoanAmt <> '0.00' THEN l8.PdhlLoanID END
        ,drvLoanAmt8 = CASE WHEN l8.PdhlLoanAmt <> '0.00' THEN l8.PdhlLoanAmt END 
        ,drvLoanID9 = CASE WHEN l9.PdhlLoanAmt <> '0.00' THEN l9.PdhlLoanID END
        ,drvLoanAmt9 = CASE WHEN l8.PdhlLoanAmt <> '0.00' THEN l9.PdhlLoanAmt END  
        ,drvLoanID10 = CASE WHEN l10.PdhlLoanAmt <> '0.00' THEN l10.PdhlLoanID END
        ,drvLoanAmt10 = CASE WHEN l10.PdhlLoanAmt <> '0.00' THEN l10.PdhlLoanAmt END 
    INTO dbo.U_E401KCOD_drvTbl_D11
    FROM dbo.U_E401JHCK_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    LEFT JOIN dbo.U_E401JHCK_PDedHist WITH (NOLOCK)
        ON PdhEEID = xEEID
        AND PdhCoID = xCoID
	LEFT JOIN dbo.U_E401JHCK_PDedHist_Loans l1 WITH (NOLOCK)
		ON l1.PdhlEEID = xEEID
		AND l1.PdhlCoID = xCoID
		AND l1.PdhlRowNo = 1
	LEFT JOIN dbo.U_E401JHCK_PDedHist_Loans l2 WITH (NOLOCK)
		ON l2.PdhlEEID = xEEID
		AND l2.PdhlCoID = xCoID
		AND l2.PdhlRowNo = 2
	LEFT JOIN dbo.U_E401JHCK_PDedHist_Loans l3 WITH (NOLOCK)
		ON l3.PdhlEEID = xEEID
		AND l3.PdhlCoID = xCoID
		AND l3.PdhlRowNo = 3
	LEFT JOIN dbo.U_E401JHCK_PDedHist_Loans l4 WITH (NOLOCK)
		ON l4.PdhlEEID = xEEID
		AND l4.PdhlCoID = xCoID
		AND l4.PdhlRowNo = 4
	LEFT JOIN dbo.U_E401JHCK_PDedHist_Loans l5 WITH (NOLOCK)
		ON l5.PdhlEEID = xEEID
		AND l5.PdhlCoID = xCoID
		AND l5.PdhlRowNo = 5
	LEFT JOIN dbo.U_E401JHCK_PDedHist_Loans l6 WITH (NOLOCK)
		ON l6.PdhlEEID = xEEID
		AND l6.PdhlCoID = xCoID
		AND l6.PdhlRowNo = 6
	LEFT JOIN dbo.U_E401JHCK_PDedHist_Loans l7 WITH (NOLOCK)
		ON l7.PdhlEEID = xEEID
		AND l7.PdhlCoID = xCoID
		AND l7.PdhlRowNo = 7
	LEFT JOIN dbo.U_E401JHCK_PDedHist_Loans l8 WITH (NOLOCK)
		ON l8.PdhlEEID = xEEID
		AND l8.PdhlCoID = xCoID
		AND l8.PdhlRowNo = 8
	LEFT JOIN dbo.U_E401JHCK_PDedHist_Loans l9 WITH (NOLOCK)
		ON l9.PdhlEEID = xEEID
		AND l9.PdhlCoID = xCoID
		AND l9.PdhlRowNo = 9
	LEFT JOIN dbo.U_E401JHCK_PDedHist_Loans l10 WITH (NOLOCK)
		ON l10.PdhlEEID = xEEID
		AND l10.PdhlCoID = xCoID
		AND l10.PdhlRowNo = 10
    LEFT JOIN dbo.U_E401JHCK_PEarHist WITH (NOLOCK)
        ON PehEEID = xEEID
    LEFT JOIN dbo.U_E401JHCK_TermsPlanNum WITH (NOLOCK)
        ON TpnEEID = xEEID
        AND TpnCoID = xCoID
    WHERE COALESCE(PdhPlanType, TpnPlanType) IS NOT NULL
	OPTION (FORCE ORDER);

    DELETE FROM dbo.U_E401KCOD_drvTbl_D11
    WHERE drvPlanType <> 
        CASE 
            WHEN @ExportCode LIKE '%P1%' THEN '1'
            WHEN @ExportCode LIKE '%P2%' THEN '2'
            WHEN @ExportCode LIKE '%P3%' THEN '3'
        END
    ;

    --==========================================
    -- Set FileName
    --==========================================
    IF (dbo.dsi_fnVariable(@FormatCode,'UseFileName') = 'N')
    BEGIN
        UPDATE dbo.U_dsi_Parameters
            SET ExportFile = CASE WHEN dbo.dsi_fnVariable(@FormatCode,'Testing') = 'Y' THEN 'TS_ TBD _ TBD _JohnHancock_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.csv'
                                  WHEN @ExportCode LIKE '%TEST%' THEN 'TS_ TBD _ TBD _JohnHancock_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.csv'
                                  ELSE 'AP_ TBD _TBD_JohnHancock_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.csv'
                             END
        WHERE FormatCode = @FormatCode;
    END

END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwE401JHCK_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_E401JHCK_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'E401JHCK%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202006121'
       ,expStartPerControl     = '202006121'
       ,expLastEndPerControl   = '202006121'
       ,expEndPerControl       = '202006121'
WHERE expFormatCode = 'E401JHCK';

**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwE401JHCK_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_E401JHCK_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort
