SET NOCOUNT ON;
IF OBJECT_ID('U_EPRUDDIS_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EPRUDDIS_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EPRUDDIS_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EPRUDDIS' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEPRUDDIS_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEPRUDDIS_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EPRUDDIS') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EPRUDDIS];
GO
IF OBJECT_ID('U_EPRUDDIS_PEarHist') IS NOT NULL DROP TABLE [dbo].[U_EPRUDDIS_PEarHist];
GO
IF OBJECT_ID('U_EPRUDDIS_File') IS NOT NULL DROP TABLE [dbo].[U_EPRUDDIS_File];
GO
IF OBJECT_ID('U_EPRUDDIS_EEList') IS NOT NULL DROP TABLE [dbo].[U_EPRUDDIS_EEList];
GO
IF OBJECT_ID('U_EPRUDDIS_DrvTbl_H01') IS NOT NULL DROP TABLE [dbo].[U_EPRUDDIS_DrvTbl_H01];
GO
IF OBJECT_ID('U_EPRUDDIS_DrvTbl_D11') IS NOT NULL DROP TABLE [dbo].[U_EPRUDDIS_DrvTbl_D11];
GO
IF OBJECT_ID('U_EPRUDDIS_DedList') IS NOT NULL DROP TABLE [dbo].[U_EPRUDDIS_DedList];
GO
IF OBJECT_ID('U_dsi_BDM_EPRUDDIS') IS NOT NULL DROP TABLE [dbo].[U_dsi_BDM_EPRUDDIS];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EPRUDDIS';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EPRUDDIS';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EPRUDDIS';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EPRUDDIS';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EPRUDDIS';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCreateTClockBatches,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhRespectZeroPayRate,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhThirdPartyPay) VALUES ('N','C','Y','0','',NULL,'','N','','N','','013010','EMPEXPORT','CDE','EPRUDDIS','Prudential Disability Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','4000','N','S','N','EPRUDDIS00Z0','N','Jan  1 1900 12:00AM','C','N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"H"','1','(''DA''=''T~'')','EPRUDDIS00Z0','1','H','01','1',NULL,'Header Indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"70184"','2','(''DA''=''T~'')','EPRUDDIS00Z0','7','H','01','2',NULL,'Control Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"National Dentex Corporation"','3','(''DA''=''T~'')','EPRUDDIS00Z0','40','H','01','3',NULL,'Client Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFeedCreationDate"','4','(''UD112''=''T~'')','EPRUDDIS00Z0','8','H','01','4',NULL,'Feed Creation Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTotalNumberOfRecords"','5','(''UNT0''=''T~'')','EPRUDDIS00Z0','6','H','01','5',NULL,'Total Number of Records',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"F"','6','(''DA''=''T~'')','EPRUDDIS00Z0','1','H','01','6',NULL,'Feed Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"8.0"','7','(''DA''=''T'')','EPRUDDIS00Z0','6','H','01','7',NULL,'Feed Layout Version Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"70184"','1','(''DA''=''T~'')','EPRUDDIS00Z0','7','D','11','1',NULL,'Control Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSSN"','2','(''UA''=''T~'')','EPRUDDIS00Z0','9','D','11','2',NULL,'Social Security Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','3','(''UA''=''T~'')','EPRUDDIS00Z0','10','D','11','3',NULL,'Employee ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','4','(''UA''=''T~'')','EPRUDDIS00Z0','40','D','11','4',NULL,'Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','5','(''UA''=''T~'')','EPRUDDIS00Z0','40','D','11','5',NULL,'First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameMiddle"','6','(''UA''=''T~'')','EPRUDDIS00Z0','1','D','11','6',NULL,'Middle Initial',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine1"','7','(''UA''=''T~'')','EPRUDDIS00Z0','40','D','11','7',NULL,'Residence Address Line 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine2"','8','(''UA''=''T~'')','EPRUDDIS00Z0','40','D','11','8',NULL,'Residence Address Line 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddresscity"','9','(''UA''=''T~'')','EPRUDDIS00Z0','23','D','11','9',NULL,'Residence City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressState"','10','(''UA''=''T~'')','EPRUDDIS00Z0','2','D','11','10',NULL,'Residence State',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressZipCode"','11','(''UA''=''T~'')','EPRUDDIS00Z0','10','D','11','11',NULL,'Residence Zip Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','12','(''SS''=''T~'')','EPRUDDIS00Z0','40','D','11','12',NULL,'Residence Foreign Last Line',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','13','(''SS''=''T~'')','EPRUDDIS00Z0','40','D','11','13',NULL,'Mailing Address Line 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','14','(''SS''=''T~'')','EPRUDDIS00Z0','40','D','11','14',NULL,'Mailing Address Line 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','15','(''SS''=''T~'')','EPRUDDIS00Z0','23','D','11','15',NULL,'Mailing City',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','16','(''SS''=''T~'')','EPRUDDIS00Z0','2','D','11','16',NULL,'Mailing State',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','17','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','17',NULL,'Mailing Zip Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','18','(''SS''=''T~'')','EPRUDDIS00Z0','40','D','11','18',NULL,'Mailing Foreign Last Line',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPhoneHomeNumber"','19','(''UA''=''T~'')','EPRUDDIS00Z0','10','D','11','19',NULL,'Home Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPhoneBusinessNumber"','20','(''UA''=''T~'')','EPRUDDIS00Z0','10','D','11','20',NULL,'Work Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','21','(''SS''=''T~'')','EPRUDDIS00Z0','8','D','11','21',NULL,'Work Phone Extension',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCellPhone"','22','(''UA''=''T~'')','EPRUDDIS00Z0','10','D','11','22',NULL,'Cell Phone Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressEmail"','23','(''UA''=''T~'')','EPRUDDIS00Z0','50','D','11','23',NULL,'Employee Email',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfBirth"','24','(''UD112''=''T~'')','EPRUDDIS00Z0','8','D','11','24',NULL,'Date of Birth',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGender"','25','(''UA''=''T~'')','EPRUDDIS00Z0','1','D','11','25',NULL,'Gender',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMaritalStatus"','26','(''UA''=''T~'')','EPRUDDIS00Z0','5','D','11','26',NULL,'Marital Status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvJobTitle"','27','(''UA''=''T~'')','EPRUDDIS00Z0','40','D','11','27',NULL,'Job Title/Position',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFullTimeOrPartTime"','28','(''UA''=''T~'')','EPRUDDIS00Z0','10','D','11','28',NULL,'Employment Status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalary"','29','(''UNT2''=''T~'')','EPRUDDIS00Z0','10','D','11','29',NULL,'Salary',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalaryFrequency"','30','(''UA''=''T~'')','EPRUDDIS00Z0','5','D','11','30',NULL,'Salary Frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvYTDEarnings"','31','(''UNT2''=''T~'')','EPRUDDIS00Z0','10','D','11','31',NULL,'Year To Date Earnings',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEarningAsOfDate"','32','(''UD112''=''T~'')','EPRUDDIS00Z0','8','D','11','32',NULL,'Earnings As Of Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','33','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','33',NULL,'State Leave Earnings',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','34','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','34',NULL,'State Leave Earnings Frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','35','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','35',NULL,'Company Leave Earnings',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','36','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','36',NULL,'Company Leave Earnings Frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','37','(''SS''=''T~'')','EPRUDDIS00Z0','4','D','11','37',NULL,'Daily Hours',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfLastHire"','38','(''UD112''=''T~'')','EPRUDDIS00Z0','8','D','11','38',NULL,'Date of Hire',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','39','(''SS''=''T~'')','EPRUDDIS00Z0','8','D','11','39',NULL,'Last Day Worked',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfTermination"','40','(''UD112''=''T~'')','EPRUDDIS00Z0','8','D','11','40',NULL,'Employment Termination Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvWorkState"','41','(''UA''=''T~'')','EPRUDDIS00Z0','2','D','11','41',NULL,'Work State',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','42','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','42',NULL,'OSHA Job Classification',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStdBranchCode"','43','(''UA''=''T~'')','EPRUDDIS00Z0','5','D','11','43',NULL,'STD Branch Code (Core)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSTDCoverageEffectiveDateCore"','44','(''UD112''=''T~'')','EPRUDDIS00Z0','8','D','11','44',NULL,'STD Coverage Effective Date (Core)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSTDCoverageEndDateCore"','45','(''UD112''=''T~'')','EPRUDDIS00Z0','8','D','11','45',NULL,'STD Coverage End Date (Core)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvStdBranchCodeBuyUp"','46','(''UA''=''T~'')','EPRUDDIS00Z0','5','D','11','46',NULL,'STD Branch Code (Buy Up)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSTDCoverageEffectiveDateBuyUp"','47','(''UD112''=''T~'')','EPRUDDIS00Z0','8','D','11','47',NULL,'STD Coverage Effective Date (Buy Up)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSTDCoverageBuyUpEndDate"','48','(''UD112''=''T~'')','EPRUDDIS00Z0','8','D','11','48',NULL,'STD Coverage BuyUp End Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','49','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','49',NULL,'Statutory Branch Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','50','(''SS''=''T~'')','EPRUDDIS00Z0','3','D','11','50',NULL,'Statutory Coverage Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','51','(''SS''=''T~'')','EPRUDDIS00Z0','8','D','11','51',NULL,'Statutory Effective Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','52','(''SS''=''T~'')','EPRUDDIS00Z0','8','D','11','52',NULL,'Statutory Coverage End Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLTDBranchCodeCore"','53','(''UA''=''T~'')','EPRUDDIS00Z0','5','D','11','53',NULL,'LTD Branch Code (Core)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLTDCoverageEffectiveDateCore"','54','(''UD112''=''T~'')','EPRUDDIS00Z0','8','D','11','54',NULL,'LTD Coverage Effective Date (Core)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLTDCoverageEndDateCore"','55','(''UD112''=''T~'')','EPRUDDIS00Z0','8','D','11','55',NULL,'LTD Coverage End Date (Core)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLTDBranchCodeBuyUp"','56','(''UA''=''T~'')','EPRUDDIS00Z0','5','D','11','56',NULL,'LTD Branch Code (Buy Up)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLTDCoverageEffectiveDateBuyUp"','57','(''UD112''=''T~'')','EPRUDDIS00Z0','8','D','11','57',NULL,'LTD Coverage Effective Date (Buy Up)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvLTDCoverageEndDateBuyUp"','58','(''UD112''=''T~'')','EPRUDDIS00Z0','8','D','11','58',NULL,'LTD Coverage BuyUp End Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"0"','59','(''DA''=''T~'')','EPRUDDIS00Z0','10','D','11','59',NULL,'Flat Benefit Rate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','60','(''SS''=''T~'')','EPRUDDIS00Z0','255','D','11','60',NULL,'Comments',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','61','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','61',NULL,'W4 Filing Status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','62','(''SS''=''T~'')','EPRUDDIS00Z0','4','D','11','62',NULL,'W4 Number of Exemptions',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','63','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','63',NULL,'Additional Withholding amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','64','(''SS''=''T~'')','EPRUDDIS00Z0','2','D','11','64',NULL,'Withholding State',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','65','(''SS''=''T~'')','EPRUDDIS00Z0','2','D','11','65',NULL,'Withholding State 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','66','(''SS''=''T~'')','EPRUDDIS00Z0','2','D','11','66',NULL,'Withholding State 3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','67','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','67',NULL,'Work Location Zip Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','68','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','68',NULL,'Deduction 1 Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','69','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','69',NULL,'Deduction 1 Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','70','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','70',NULL,'Deduction 1 Frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','71','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','71',NULL,'Deduction 2 Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','72','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','72',NULL,'Deduction 2 Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','73','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','73',NULL,'Deduction 2 Frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','74','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','74',NULL,'Deduction 3 Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','75','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','75',NULL,'Deduction 3 Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','76','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','76',NULL,'Deduction 3 Frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','77','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','77',NULL,'Deduction 4 Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','78','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','78',NULL,'Deduction 4 Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','79','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','79',NULL,'Deduction 4 Frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','80','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','80',NULL,'Deduction 5 Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','81','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','81',NULL,'Deduction 5 Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','82','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','82',NULL,'Deduction 5 Frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','83','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','83',NULL,'Deduction 6 Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','84','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','84',NULL,'Deduction 6 Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','85','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','85',NULL,'Deduction 6 Frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','86','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','86',NULL,'Deduction 7 Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','87','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','87',NULL,'Deduction 7 Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','88','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','88',NULL,'Deduction 7 Frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','89','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','89',NULL,'Deduction 8 Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','90','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','90',NULL,'Deduction 8 Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','91','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','91',NULL,'Deduction 8 Frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','92','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','92',NULL,'Deduction 9 Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','93','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','93',NULL,'Deduction 9 Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','94','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','94',NULL,'Deduction 9 Frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','95','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','95',NULL,'Deduction 10 Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','96','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','96',NULL,'Deduction 10 Amount',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','97','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','97',NULL,'Deduction 10 Frequency',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvReportingCode1"','98','(''UA''=''T~'')','EPRUDDIS00Z0','50','D','11','98',NULL,'Reporting Code 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','99','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','99',NULL,'Reporting Code 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','100','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','100',NULL,'Reporting Code 3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','101','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','101',NULL,'Reporting Code 4',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','102','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','102',NULL,'Reporting Code 5',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','103','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','103',NULL,'Reporting Code 6',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','104','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','104',NULL,'Reporting Code 7',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','105','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','105',NULL,'Reporting Code 8',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','106','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','106',NULL,'Reporting Code 9',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','107','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','107',NULL,'Reporting Code 10',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','108','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','108',NULL,'Reporting Code 11',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','109','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','109',NULL,'Reporting Code 12',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','110','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','110',NULL,'Reporting Code 13',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','111','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','111',NULL,'Reporting Code 14',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','112','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','112',NULL,'Reporting Code 15',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','113','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','113',NULL,'Reporting Code 16',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','114','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','114',NULL,'Reporting Code 17',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','115','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','115',NULL,'Reporting Code 18',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','116','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','116',NULL,'Reporting Code 19',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','117','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','117',NULL,'Reporting Code 20',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','118','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','118',NULL,'Contact 1 Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','119','(''SS''=''T~'')','EPRUDDIS00Z0','40','D','11','119',NULL,'Contact 1 Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','120','(''SS''=''T~'')','EPRUDDIS00Z0','40','D','11','120',NULL,'Contact 1 First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','121','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','121',NULL,'Contact 1 Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','122','(''SS''=''T~'')','EPRUDDIS00Z0','8','D','11','122',NULL,'Contact 1 Phone Extension',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','123','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','123',NULL,'Contact 1 Email',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','124','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','124',NULL,'Contact 1 ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','125','(''SS''=''T~'')','EPRUDDIS00Z0','9','D','11','125',NULL,'Contact 1 SSN',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','126','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','126',NULL,'Contact 2 Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','127','(''SS''=''T~'')','EPRUDDIS00Z0','40','D','11','127',NULL,'Contact 2 Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','128','(''SS''=''T~'')','EPRUDDIS00Z0','40','D','11','128',NULL,'Contact 2 First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','129','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','129',NULL,'Contact 2 Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','130','(''SS''=''T~'')','EPRUDDIS00Z0','8','D','11','130',NULL,'Contact 2 Phone Extension',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','131','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','131',NULL,'Contact 2 Email',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','132','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','132',NULL,'Contact 2 ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','133','(''SS''=''T~'')','EPRUDDIS00Z0','9','D','11','133',NULL,'Contact 2 SSN',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','134','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','134',NULL,'Contact 3 Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','135','(''SS''=''T~'')','EPRUDDIS00Z0','40','D','11','135',NULL,'Contact 3 Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','136','(''SS''=''T~'')','EPRUDDIS00Z0','40','D','11','136',NULL,'Contact 3 First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','137','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','137',NULL,'Contact 3 Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','138','(''SS''=''T~'')','EPRUDDIS00Z0','8','D','11','138',NULL,'Contact 3 Phone Extension',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','139','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','139',NULL,'Contact 3 Email',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','140','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','140',NULL,'Contact 3 ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','141','(''SS''=''T~'')','EPRUDDIS00Z0','9','D','11','141',NULL,'Contact 3 SSN',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','142','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','142',NULL,'Contact 4 Type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','143','(''SS''=''T~'')','EPRUDDIS00Z0','40','D','11','143',NULL,'Contact 4 Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','144','(''SS''=''T~'')','EPRUDDIS00Z0','40','D','11','144',NULL,'Contact 4 First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','145','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','145',NULL,'Contact 4 Phone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','146','(''SS''=''T~'')','EPRUDDIS00Z0','8','D','11','146',NULL,'Contact 4 Phone Extension',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','147','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','147',NULL,'Contact 4 Email',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','148','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','148',NULL,'Contact 4 ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','149','(''SS''=''T~'')','EPRUDDIS00Z0','9','D','11','149',NULL,'Contact 4 SSN',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','150','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','150',NULL,'Type of Employment',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','151','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','151',NULL,'Sector of Employment',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','152','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','152',NULL,'FMLA Branch Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','153','(''SS''=''T~'')','EPRUDDIS00Z0','50','D','11','153',NULL,'FMLA Work Location Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','154','(''SS''=''T~'')','EPRUDDIS00Z0','1','D','11','154',NULL,'Key EE Indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','155','(''SS''=''T~'')','EPRUDDIS00Z0','1','D','11','155',NULL,'Standard Work Schedule',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','156','(''SS''=''T~'')','EPRUDDIS00Z0','6','D','11','156',NULL,'Hours worked in last 12 months',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','157','(''SS''=''T~'')','EPRUDDIS00Z0','6','D','11','157',NULL,'Hours worked since last file',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','158','(''SS''=''T~'')','EPRUDDIS00Z0','6','D','11','158',NULL,'Other Hours Worked in the last 12 months',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','159','(''SS''=''T~'')','EPRUDDIS00Z0','8','D','11','159',NULL,'As of Date for Hours worked in last 12 Months',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','160','(''SS''=''T~'')','EPRUDDIS00Z0','8','D','11','160',NULL,'Adjusted Date of Hire',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','161','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','161',NULL,'Shared Leave Relationship 1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','162','(''SS''=''T~'')','EPRUDDIS00Z0','9','D','11','162',NULL,'Shared Leave Relationship 1 SSN',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','163','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','163',NULL,'Shared Leave Relationship 1 EE ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','164','(''SS''=''T~'')','EPRUDDIS00Z0','40','D','11','164',NULL,'Shared Leave Relationship 1 Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','165','(''SS''=''T~'')','EPRUDDIS00Z0','40','D','11','165',NULL,'Shared Leave Relationship 1 First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','166','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','166',NULL,'Shared Leave Relationship 2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','167','(''SS''=''T~'')','EPRUDDIS00Z0','9','D','11','167',NULL,'Shared Leave Relationship 2 SSN',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','168','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','168',NULL,'Shared Leave Relationship 2 EE ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','169','(''SS''=''T~'')','EPRUDDIS00Z0','40','D','11','169',NULL,'Shared Leave Relationship 2 Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','170','(''SS''=''T~'')','EPRUDDIS00Z0','40','D','11','170',NULL,'Shared Leave Relationship 2 First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','171','(''SS''=''T~'')','EPRUDDIS00Z0','5','D','11','171',NULL,'Shared Leave Relationship 3',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','172','(''SS''=''T~'')','EPRUDDIS00Z0','9','D','11','172',NULL,'Shared Leave Relationship 3 SSN',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','173','(''SS''=''T~'')','EPRUDDIS00Z0','10','D','11','173',NULL,'Shared Leave Relationship 3 EE ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','174','(''SS''=''T~'')','EPRUDDIS00Z0','40','D','11','174',NULL,'Shared Leave Relationship 3 Last Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','175','(''SS''=''T'')','EPRUDDIS00Z0','40','D','11','175',NULL,'Shared Leave Relationship 3 First Name',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
DECLARE @UDSERVER varchar(5) = (SELECT RTRIM(LEFT(@@SERVERNAME,PATINDEX('%[0-9]%',@@SERVERNAME)) + SUBSTRING(@@SERVERNAME,PATINDEX('%UP[0-9]%',@@SERVERNAME)+2,1)));
SELECT @UDSERVER = CASE WHEN @UDSERVER = 'EW21' THEN 'WP6' WHEN @UDSERVER = 'EW22' THEN 'WP7' ELSE @UDSERVER END;
DECLARE @UDCOCODE varchar(5) = (SELECT RTRIM(CmmCompanyCode) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\EPRUDDIS_20200610.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Prudential OnDemand','202006109','EMPEXPORT','ONDMD_XOE',NULL,'EPRUDDIS',NULL,NULL,NULL,'202006109','Jun 10 2020  3:54PM','Jun 10 2020  3:54PM','202006101',NULL,'','','202006101',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\EPRUDDIS_20200610.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Prudential Scheduled','202006109','EMPEXPORT','SCHEDULED',NULL,'EPRUDDIS',NULL,NULL,NULL,'202006109','Jun 10 2020  3:54PM','Jun 10 2020  3:54PM','202006101',NULL,'','','202006101',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\EPRUDDIS_20200610.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Prudential Active OE','202006109','EMPEXPORT','AOE_XOE',NULL,'EPRUDDIS',NULL,NULL,NULL,'202006109','Jun 10 2020  3:54PM','Jun 10 2020  3:54PM','202006101',NULL,'','','202006101',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\EPRUDDIS_20200610.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Prudential Passive OE','202006109','EMPEXPORT','POE_XOE',NULL,'EPRUDDIS',NULL,NULL,NULL,'202006109','Jun 10 2020  3:54PM','Jun 10 2020  3:54PM','202006101',NULL,'','','202006101',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
UPDATE dbo.AscExp SET expAscFileName = CASE WHEN LEFT(@UDENV,2) IN ('NW','EW','WP') THEN REPLACE(REPLACE(expAscFileName,'[UDENV]',@UDENV),'[UDSERVER]',@UDSERVER) ELSE '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\EPRUDDIS_20200610.txt' END WHERE expFormatCode = 'EPRUDDIS';
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EPRUDDIS','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EPRUDDIS','ExportPath','V',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EPRUDDIS','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EPRUDDIS','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EPRUDDIS','UseFileName','V','Y');
UPDATE dbo.U_dsi_Configuration SET CfgValue = CASE WHEN CfgName = 'UseFileName' THEN 'Y' ELSE NULL END WHERE FormatCode = 'EPRUDDIS' AND CfgName IN ('UseFileName','ExportPath');
INSERT INTO dbo.CustomTemplates (CreationDate,Engine,EngineCode,IsActive,ModifiedDate) SELECT CreationDate = GETDATE(), Engine = AdhEngine, EngineCode = AdhFormatCode, IsActive = 1, ModifiedDate = GETDATE() FROM dbo.AscDefH WITH (NOLOCK) WHERE AdhFormatCode = 'EPRUDDIS' AND NOT EXISTS(SELECT 1 FROM dbo.CustomTemplates WHERE EngineCode = AdhFormatCode);
IF OBJECT_ID('U_EPRUDDIS_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EPRUDDIS_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EPRUDDIS','H01','dbo.U_EPRUDDIS_DrvTbl_H01',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EPRUDDIS','D11','dbo.U_EPRUDDIS_DrvTbl_D11',NULL);
IF OBJECT_ID('U_dsi_BDM_EPRUDDIS') IS NULL
CREATE TABLE [dbo].[U_dsi_BDM_EPRUDDIS] (
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
IF OBJECT_ID('U_EPRUDDIS_DedList') IS NULL
CREATE TABLE [dbo].[U_EPRUDDIS_DedList] (
    [DedCode] char(5) NOT NULL,
    [DedType] char(4) NOT NULL
);
IF OBJECT_ID('U_EPRUDDIS_DrvTbl_H01') IS NULL
CREATE TABLE [dbo].[U_EPRUDDIS_DrvTbl_H01] (
    [drvFeedCreationDate] varchar(1) NOT NULL,
    [drvTotalNumberOfRecords] varchar(1) NOT NULL
);
IF OBJECT_ID('U_EPRUDDIS_EEList') IS NULL
CREATE TABLE [dbo].[U_EPRUDDIS_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EPRUDDIS_File') IS NULL
CREATE TABLE [dbo].[U_EPRUDDIS_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(4000) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EPRUDDIS]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: National Dentex Corporation

Created By: Wyle Cordero
Business Analyst: Melissa Spence
Create Date: 06/10/2020
Service Request Number: SR-2020-00274112

Purpose: Prudential Disability Export

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2020     SR-2020-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EPRUDDIS';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EPRUDDIS';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EPRUDDIS';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EPRUDDIS';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EPRUDDIS' ORDER BY RunID DESC;

Job Ownership Scripts
---------------------
-- Set job owner to ssis_user for Production jobs
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 0;

-- Set job owner to self, to make changes in SQL Job Scheduler. Remember to re-run the above script to change ownership to ssis_user when complete
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 1;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EPRUDDIS', 'ONDMD_XOE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EPRUDDIS', 'POE_XOE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EPRUDDIS', 'AOE_XOE';

EXEC dbo.dsi_BDM_sp_ErrorCheck 'EPRUDDIS';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'EPRUDDIS', @AllObjects = 'Y', @IsWeb = 'Y'
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
    SELECT @FormatCode = 'EPRUDDIS';

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
    DELETE FROM dbo.U_EPRUDDIS_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_EPRUDDIS_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

	-- Exclude EecFullTimeOrPartTime = 'P'
	DELETE el
	FROM dbo.U_EPRUDDIS_EEList el
	INNER JOIN dbo.EmpComp 
		ON EecEEID = xEEID
		AND EecCoID = xCoID
		AND EecFullTimeOrPartTime = 'P'
	;

	-- TermsEffective Date of Termination within last 30 days
	DELETE el
	FROM dbo.U_EPRUDDIS_EEList el
	INNER JOIN dbo.EmpComp 
		ON EecEEID = xEEID
		AND EecCoID = xCoID
		AND EecEmplStatus = 'T'
		AND EecDateOfTermination < DATEADD(DAY, -30, @EndDate)
	;

    --==========================================
    -- Create Deduction List
    --==========================================
    DECLARE @DedList VARCHAR(MAX)
    SET @DedList = 'STD,BSTD,LTD,BLTD,LTDBE';

    IF OBJECT_ID('U_EPRUDDIS_DedList','U') IS NOT NULL
        DROP TABLE dbo.U_EPRUDDIS_DedList;
    SELECT DISTINCT
         DedCode = DedDedCode
        ,DedType = DedDedType
    INTO dbo.U_EPRUDDIS_DedList
    FROM dbo.fn_ListToTable(@DedList)
    JOIN dbo.DedCode WITH (NOLOCK)
        ON DedDedCode = Item;


    --==========================================
    -- BDM Section
    --==========================================
    DELETE FROM dbo.U_dsi_BDM_Configuration WHERE FormatCode = @FormatCode;

    -- Required parameters
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES(@FormatCode,'DedCodes', @DedList);
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES(@FormatCode,'StartDateTime',DATEADD(DAY, -30, @EndDate));
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES(@FormatCode,'EndDateTime',@EndDate);
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES(@FormatCode,'TermSelectionOption','AuditDate');

    -- Non-Required parameters
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'BuildConsolidatedTable','Standard');
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'FutureDatedStartDateDays','30');
    INSERT INTO dbo.U_dsi_BDM_Configuration VALUES (@FormatCode,'FutureDatedStopDateDays','30');
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

	DECLARE
		@YTDStartPerControl VARCHAR(9) = CONCAT(YEAR(@EndDate), '01011')
		,@PreviousYearStartPerControl VARCHAR(9) = CONCAT((YEAR(@EndDate) - 1), '01011')
		,@PreviousYearEndPerControl VARCHAR(9) = CONCAT((YEAR(@EndDate) - 1), '12319')

    -----------------------------
    -- Working Table - PEarHist
    -----------------------------
    IF OBJECT_ID('U_EPRUDDIS_PEarHist','U') IS NOT NULL
        DROP TABLE dbo.U_EPRUDDIS_PEarHist;
    SELECT DISTINCT
         PehEEID
        ,PehPayDate = MAX(PehPayDate)
        ,PehSalaryComm = CONVERT(DECIMAL(15,2), SUM(CASE WHEN PehEarnCode = 'COMM' THEN PehCurAmt ELSE 0.00 END))
        ,PehYTDEarnings = CONVERT(DECIMAL(15,2), SUM(CASE WHEN PehPerControl BETWEEN @YTDStartPerControl AND @EndPerControl THEN PehCurAmt ELSE 0.00 END))
    INTO dbo.U_EPRUDDIS_PEarHist
    FROM dbo.PayReg WITH (NOLOCK)
    JOIN dbo.PEarHist WITH (NOLOCK)
        ON PehGenNumber = PrgGenNumber
    WHERE PehPerControl BETWEEN @PreviousYearStartPerControl AND @EndPerControl
    GROUP BY PehEEID
    HAVING SUM(CASE WHEN PehPerControl BETWEEN @YTDStartPerControl AND @EndPerControl THEN PehCurAmt ELSE 0.00 END) <> 0.00
	OPTION (FORCE ORDER);

	-- Create Index
    CREATE CLUSTERED INDEX CDX_U_EPRUDDIS_PEarHist ON dbo.U_EPRUDDIS_PEarHist (PehEEID);


    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_EPRUDDIS_DrvTbl_D11
    ---------------------------------
    IF OBJECT_ID('U_EPRUDDIS_DrvTbl_D11','U') IS NOT NULL
        DROP TABLE dbo.U_EPRUDDIS_DrvTbl_D11;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = MAX(EepSSN)
        -- standard fields above and additional driver fields below
        ,drvSSN = MAX(eepSSN)
        ,drvEmpNo = MAX(EecEmpNo)
        ,drvNameLast = MAX(EepNameLast)
        ,drvNameFirst = MAX(EepNameFirst)
        ,drvNameMiddle = MAX(LEFT(EepNameMiddle,1))
        ,drvAddressLine1 = MAX(EepAddressLine1)
        ,drvAddressLine2 = MAX(EepAddressLine2)
        ,drvAddresscity = MAX(EepAddressCity) 
        ,drvAddressState = MAX(EepAddressState)
        ,drvAddressZipCode = MAX(CASE WHEN LEN(EepAddressZipCode) >= 9 THEN CONCAT(LEFT(RTRIM(LTRIM(EepAddressZipCode)), 5), '-', SUBSTRING(RTRIM(LTRIM(EepAddressZipCode)), 6, 4)) ELSE EepAddressZipCode END)
        ,drvPhoneHomeNumber = MAX(EepPhoneHomeNumber)
        ,drvPhoneBusinessNumber = MAX(EecPhoneBusinessNumber)
        ,drvCellPhone = MAX(efoPhoneNumber)
        ,drvAddressEmail = MAX(EepAddressEMail)
        ,drvDateOfBirth = MAX(EepDateOfBirth)
        ,drvGender = MAX(CASE WHEN EepGender IN ('M', 'F') THEN EepGender END)
        ,drvMaritalStatus = MAX(
			CASE eepMaritalStatus
				WHEN 'S' THEN '04001'
				WHEN 'M' THEN '04002'
				WHEN 'D' THEN '04004'
				WHEN 'W' THEN '04003'
			END)
        ,drvJobTitle = MAX(JbcDesc)
        ,drvFullTimeOrPartTime = MAX(EecFullTimeOrPartTime)
        ,drvSalary = MAX(CONVERT(DECIMAL(15,2),
			CASE EecSalaryOrHourly
				WHEN 'S' THEN (EecAnnSalary + PehSalaryComm)
				ELSE EecHourlyPayRate
			END
		))
        ,drvSalaryFrequency = MAX(CASE WHEN EecSalaryORHourly = 'S' THEN '13006' ELSE '13001' END)
        ,drvYTDEarnings = MAX(PehYTDEarnings)
        ,drvEarningAsOfDate = MAX(PehPayDate)
        ,drvDateOfLastHire = MAX(EecDateOfLastHire)
        ,drvDateOfTermination = MAX(CASE WHEN EecEmplStatus = 'T' THEN EecDateOfTermination END)
        ,drvWorkState = MAX(LEFT(RTRIM(LTRIM(EecStateSUI)), 2))
        ,drvStdBranchCode = MAX(CASE WHEN std.BdmDedCode IS NOT NULL THEN '00001' END)
        ,drvSTDCoverageEffectiveDateCore = MAX(std.BdmBenStartDate)
        ,drvSTDCoverageEndDateCore = MAX(std.BdmBenStopDate)
        ,drvStdBranchCodeBuyUp = MAX(CASE WHEN stdbu.BdmDedCode IS NOT NULL THEN 'A0002' END)
        ,drvSTDCoverageEffectiveDateBuyUp = MAX(stdbu.BdmBenStartDate)
        ,drvSTDCoverageBuyUpEndDate = MAX(stdbu.BdmBenStopDate)
        ,drvLTDBranchCodeCore = MAX(CASE WHEN ltd.BdmDedCode IS NOT NULL THEN '00001' END)
        ,drvLTDCoverageEffectiveDateCore = MAX(ltd.BdmBenStartDate)
        ,drvLTDCoverageEndDateCore = MAX(ltd.BdmBenStopDate)
        ,drvLTDBranchCodeBuyUp = MAX(CASE WHEN ltdbu.BdmDedCode IS NOT NULL THEN 'A0002' END)
        ,drvLTDCoverageEffectiveDateBuyUp = MAX(ltdbu.BdmBenStartDate)
        ,drvLTDCoverageEndDateBuyUp = MAX(ltdbu.BdmBenStopDate)
        ,drvReportingCode1 = MAX(CONCAT(RTRIM(LTRIM(EecOrgLvl1)), SPACE(1), org1.OrgDesc))
    INTO dbo.U_EPRUDDIS_DrvTbl_D11
    FROM dbo.U_EPRUDDIS_EEList WITH (NOLOCK)
    INNER JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    INNER JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
    INNER JOIN dbo.JobCode WITH (NOLOCK)
        ON JbcJobCode = EecJobCode
	INNER JOIN dbo.OrgLevel org1 WITH (NOLOCK)
		ON OrgCode = EecOrgLvl1 
		AND OrgLvl = 1
    INNER JOIN dbo.U_dsi_BDM_EPRUDDIS bdm WITH (NOLOCK)
        ON bdm.BdmEEID = xEEID 
        AND bdm.BdmCoID = xCoID
		AND bdm.BdmRecType = 'EMP'
	LEFT JOIN dbo.U_dsi_BDM_EPRUDDIS std WITH (NOLOCK)
		ON std.BdmEEID = bdm.BdmEEID
		AND std.BdmCoID = bdm.BdmCoID
		AND std.BdmRecType = bdm.BdmRecType
		AND std.BdmDedCode = 'STD'
	LEFT JOIN dbo.U_dsi_BDM_EPRUDDIS stdbu WITH (NOLOCK)
		ON stdbu.BdmEEID = bdm.BdmEEID
		AND stdbu.BdmCoID = bdm.BdmCoID
		AND stdbu.BdmRecType = bdm.BdmRecType
		AND stdbu.BdmDedCode = 'BSTD'
	LEFT JOIN dbo.U_dsi_BDM_EPRUDDIS ltd WITH (NOLOCK)
		ON ltd.BdmEEID = bdm.BdmEEID
		AND ltd.BdmCoID = bdm.BdmCoID
		AND ltd.BdmRecType = bdm.BdmRecType
		AND ltd.BdmDedCode = 'LTD'
	LEFT JOIN dbo.U_dsi_BDM_EPRUDDIS ltdbu WITH (NOLOCK)
		ON ltdbu.BdmEEID = bdm.BdmEEID
		AND ltdbu.BdmCoID = bdm.BdmCoID
		AND ltdbu.BdmRecType = bdm.BdmRecType
		AND ltdbu.BdmDedCode IN ('BLTD', 'LTDBE')
	LEFT JOIN (
		SELECT
			efoEEID
			,efoPhoneNumber
			,efoRowNo = ROW_NUMBER() OVER (PARTITION BY efoEEID ORDER BY efoEEID, efoPhoneNumber)
		FROM dbo.EmpMPhon WITH (NOLOCK)
		WHERE efoPhoneType = 'CEL'
		) efo
		ON efoEEID = xEEID
	AND efoRowNo = 1
	LEFT JOIN dbo.U_EPRUDDIS_PEarHist WITH (NOLOCK)
		ON PehEEID = xEEID 
	GROUP BY xEEID, xCoID
    OPTION (FORCE ORDER);

	-- Create Index
    CREATE CLUSTERED INDEX CDX_U_EPRUDDIS_DrvTbl_D11 ON dbo.U_EPRUDDIS_DrvTbl_D11 (drvInitialSort);

    ---------------------------------
    -- HEADER RECORD
    ---------------------------------
    IF OBJECT_ID('U_EPRUDDIS_DrvTbl_H01','U') IS NOT NULL
        DROP TABLE dbo.U_EPRUDDIS_DrvTbl_H01;
    SELECT DISTINCT
         drvFeedCreationDate = GETDATE()
        ,drvTotalNumberOfRecords = (SELECT COUNT(*) FROM dbo.U_EPRUDDIS_DrvTbl_D11 WITH (NOLOCK))
    INTO dbo.U_EPRUDDIS_DrvTbl_H01;

END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwEPRUDDIS_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_EPRUDDIS_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'EPRUDDIS%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202006031'
       ,expStartPerControl     = '202006031'
       ,expLastEndPerControl   = '202006109'
       ,expEndPerControl       = '202006109'
WHERE expFormatCode = 'EPRUDDIS';
**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwEPRUDDIS_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_EPRUDDIS_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort
