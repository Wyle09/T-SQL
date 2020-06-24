SET NOCOUNT ON;
IF OBJECT_ID('U_EKRONOV2_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EKRONOV2_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EKRONOV2_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EKRONOV2' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_sp_BuildDriverTables_EKRONOV2') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EKRONOV2];
GO
IF OBJECT_ID('dsi_vwEKRONOV2_Export') IS NOT NULL DROP VIEW dbo.dsi_vwEKRONOV2_Export;
GO
IF OBJECT_ID('dsi_sp_AfterCollect_EKRONOV2') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_AfterCollect_EKRONOV2];
GO
IF OBJECT_ID('U_EKRONOV2_File') IS NOT NULL DROP TABLE [dbo].[U_EKRONOV2_File];
GO
IF OBJECT_ID('U_EKRONOV2_EEList') IS NOT NULL DROP TABLE [dbo].[U_EKRONOV2_EEList];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EKRONOV2';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EKRONOV2';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EKRONOV2';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EKRONOV2';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EKRONOV2';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhRespectZeroPayRate,AdhCreateTClockBatches,AdhThirdPartyPay) VALUES ('N','C','Y','0','','','N','','N','','013010','EMPEXPORT','SDF','EKRONOV2','Kronos Demographic V2 Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','500','S','N','EKRONOV200Z0','N','Jan  1 1900 12:00AM','C','N',NULL,'N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Employee ID"','1','(''DA''=''T,'')','EKRONOV200Z0','11','H','01','1',NULL,'Employee ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"First name"','2','(''DA''=''T,'')','EKRONOV200Z0','10','H','01','2',NULL,'First name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Last name"','3','(''DA''=''T,'')','EKRONOV200Z0','9','H','01','3',NULL,'Last name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Hire date"','4','(''DA''=''T,'')','EKRONOV200Z0','9','H','01','4',NULL,'Hire date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Division"','5','(''DA''=''T,'')','EKRONOV200Z0','10','H','01','5',NULL,'Division',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Workplace"','6','(''DA''=''T,'')','EKRONOV200Z0','15','H','01','6',NULL,'Workplace',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Shift"','7','(''DA''=''T,'')','EKRONOV200Z0','7','H','01','7',NULL,'Shift',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Project"','8','(''DA''=''T,'')','EKRONOV200Z0','8','H','01','8',NULL,'Project',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Job"','9','(''DA''=''T,'')','EKRONOV200Z0','7','H','01','9',NULL,'Job',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Supervisor Name"','10','(''DA''=''T,'')','EKRONOV200Z0','15','H','01','10',NULL,'Supervisor Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Direct Supervisor ID"','11','(''DA''=''T,'')','EKRONOV200Z0','50','H','01','11',NULL,'Direct Supervisor ID',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Employment status"','12','(''DA''=''T,'')','EKRONOV200Z0','17','H','01','12',NULL,'Employment status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Status date"','13','(''DA''=''T,'')','EKRONOV200Z0','11','H','01','13',NULL,'Status date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Hourly rate"','14','(''DA''=''T,'')','EKRONOV200Z0','11','H','01','14',NULL,'Hourly rate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Salary date"','15','(''DA''=''T,'')','EKRONOV200Z0','11','H','01','15',NULL,'Salary date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Termination date"','16','(''DA''=''T,'')','EKRONOV200Z0','16','H','01','16',NULL,'Termination date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Manager Name"','17','(''DA''=''T,'')','EKRONOV200Z0','16','H','01','17',NULL,'Manager Name',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Manager ID"','18','(''DA''=''T,'')','EKRONOV200Z0','16','H','01','18',NULL,'Manager ID',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Primary e-mail"','19','(''DA''=''T,'')','EKRONOV200Z0','16','H','01','19',NULL,'Primary e-mail',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Pay group"','20','(''DA''=''T,'')','EKRONOV200Z0','16','H','01','20',NULL,'Pay group',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Other Rate 1"','21','(''DA''=''T'')','EKRONOV200Z0','16','H','01','21',NULL,'Other Rate 1',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvempno"','1','(''UA''=''T,'')','EKRONOV200Z0','5','D','10','1',NULL,'Employee ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvnamefirst"','2','(''UA''=''T,'')','EKRONOV200Z0','50','D','10','2',NULL,'First name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvnamelast"','3','(''UA''=''T,'')','EKRONOV200Z0','50','D','10','3',NULL,'Last name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDOLH"','4','(''UD126''=''T,'')','EKRONOV200Z0','10','D','10','4',NULL,'Hire date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDivision"','5','(''UA''=''T,'')','EKRONOV200Z0','50','D','10','5',NULL,'Division',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvWorkPlace"','6','(''UA''=''T,'')','EKRONOV200Z0','50','D','10','6',NULL,'Workplace',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvShift"','7','(''UA''=''T,'')','EKRONOV200Z0','50','D','10','7',NULL,'Shift',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"spaces"','8','(''SS''=''T,'')','EKRONOV200Z0','1','D','10','8',NULL,'Project',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvJobCode"','9','(''UA''=''T,'')','EKRONOV200Z0','100','D','10','9',NULL,'Job',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSupName"','10','(''UA''=''T,'')','EKRONOV200Z0','100','D','10','10',NULL,'Supervisor Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSupervisorID"','11','(''UA''=''T,'')','EKRONOV200Z0','50','D','10','11',NULL,'Direct Supervisor ID',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvemplstatus"','12','(''UA''=''T,'')','EKRONOV200Z0','30','D','10','12',NULL,'Employment status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvemplstatusdate"','13','(''UD126''=''T,'')','EKRONOV200Z0','10','D','10','13',NULL,'Status date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvhourlyrate"','14','(''UNT2''=''T,'')','EKRONOV200Z0','16','D','10','14',NULL,'Hourly rate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSalarydate"','15','(''UD126''=''T,'')','EKRONOV200Z0','10','D','10','15',NULL,'Salary date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvdateofterm"','16','(''UD126''=''T,'')','EKRONOV200Z0','10','D','10','16',NULL,'Termination date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvManagerName"','17','(''UA''=''T,'')','EKRONOV200Z0','100','D','10','17',NULL,'Manager Name',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvManagerID"','18','(''UA''=''T,'')','EKRONOV200Z0','50','D','10','18',NULL,'Manager ID',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressEmail"','19','(''UA''=''T,'')','EKRONOV200Z0','50','D','10','19',NULL,'Primary e-mail',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPayGroup"','20','(''UA''=''T,'')','EKRONOV200Z0','50','D','10','20',NULL,'Pay group',NULL,NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvOtherRate1"','21','(''UA''=''T'')','EKRONOV200Z0','50','D','10','21',NULL,'Other Rate 1',NULL,NULL); -- (WC SR-2019-00243713)
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Kronos OnDemand','201509151','EMPEXPORT','ONDEMAND','Sep 15 2015 10:49AM','EKRONOV2',NULL,NULL,NULL,'201509151','Sep 15 2015 12:00AM','Dec 30 1899 12:00AM','201509151','438','eecPayGroup','PMSK','201509151',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Kronos Active Employees Only','201509151','EMPEXPORT','ACTIVE','Sep 15 2015 10:49AM','EKRONOV2',NULL,NULL,NULL,'201509151','Sep 15 2015 12:00AM','Dec 30 1899 12:00AM','201509151','438','eecPayGroup','PMSK','201509151',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Kronos Test Only','201509151','EMPEXPORT','TEST','Sep 15 2015 10:49AM','EKRONOV2',NULL,NULL,NULL,'201509151','Sep 15 2015 12:00AM','Dec 30 1899 12:00AM','201509151','438','eecPayGroup','PMSK','201509151',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Kronos Scheduled','201409089','EMPEXPORT','SCHEDULED','Sep 30 2014 12:00AM','EKRONOV2',NULL,NULL,NULL,'201409089','Sep  8 2014 12:00AM','Dec 30 1899 12:00AM','201409081',NULL,'eecPayGroup','PMSK','201409081',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL); -- (WC SR-2019-00243713)
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EKRONOV2','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EKRONOV2','ExportPath','V','\\ca.saas\t0\data_exchange\PHA5000\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EKRONOV2','TestPath','V','\\ca.saas\t1\Public\PHA5000\Exports\Kronos\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EKRONOV2','Testing','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EKRONOV2','UseFileName','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EKRONOV2','IsUTF8','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EKRONOV2','UDESPath','V','\\ca.saas\t0\data_exchange\PHA5000\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EKRONOV2','UTF8Path','V','\\ca.saas\t1\Public\PHA5000\Exports\Kronos\UTF8\');
UPDATE dbo.U_dsi_Configuration SET CfgValue = '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\' WHERE FormatCode = 'EKRONOV2' AND CfgName = 'ExportPath' AND CfgValue IS NULL;
UPDATE dbo.U_dsi_Configuration SET CfgValue = svCfgValue FROM dbo.U_EKRONOV2_SavePath WHERE CfgName = svCfgName AND FormatCode = svFormatCode AND svCfgValue IS NOT NULL;
IF OBJECT_ID('U_EKRONOV2_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EKRONOV2_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EKRONOV2','D10','U_EKRONOV2_DrvTbl',NULL);
IF OBJECT_ID('U_EKRONOV2_EEList') IS NULL
CREATE TABLE [dbo].[U_EKRONOV2_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EKRONOV2_File') IS NULL
CREATE TABLE [dbo].[U_EKRONOV2_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(20) NOT NULL,
    [SubSort] varchar(32) NOT NULL,
    [Data] char(500) NULL
);
GO
CREATE procedure [dbo].[dsi_sp_AfterCollect_EKRONOV2]

as
/***********************************************************************************************
Created By:        Bernadette Bukiri
Create Date:    09/29/2014
SR:2014-00050614

Purpose:    BCP for French Translations
                

Revision History
-----------------
Update By            Date            CP Num            Desc            
Bernadette Bukiri   4/10/15                         


*************************************************************************************************/

Declare
    @cmd VarChar(1000),
    @DatabaseName VarChar(50),
    @QueryInfo    VarChar(1000),
    @ExportPath VarChar(500),
    @FileName VarChar(100),
    @exportcode varchar(110),
    @formatcode varchar(10),
    @servername varchar(32)
Set @DatabaseName = rtrim(db_name())
Set @servername = '"' + rtrim(@@SERVERNAME) + '"'

select @FormatCode = rtrim(FormatCode),
       @FileName = CASE 
				       WHEN dbo.dsi_fnVariable(@FormatCode,'Testing') = 'Y' OR @ExportCode = 'TEST' THEN CONCAT('TEST_Kronos_employee_', FORMAT(GETDATE(), 'yyyyMMdd'), '.csv')
					   ELSE CONCAT('Kronos_employee_', FORMAT(GETDATE(), 'yyyyMMdd'), '.csv')
				   END,
       @ExportPath =  ltrim(rtrim(IsNull(dbo.dsi_fnVariable('EKRONOV2', 'ExportPath'),''))),
       @cmd=''
from u_dsi_parameters (NOLOCK)where formatcode ='EKRONOV2'


Set    @QueryInfo  = '"Select top 2000000 Data From '+@DatabaseName+'..U_EKRONOV2_File with (nolock) '+
                  'Order by substring(RecordSet,2,2), InitialSort, subsort "'
                  
Set @cmd =        'bcp ' + @QueryInfo +  ' QueryOut "' + @ExportPath +
                  @FileName + '"' + 
                  ' -S"' + RTRIM(@@SERVERNAME) + '" -T -w -C1252';
                  




print @cmd
EXEC master.dbo.xp_cmdshell @cmd, NO_OUTPUT

        
-- Drop the view so that the framework does not create a file

--If Exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dsi_vwEKRONOV2_Export]') and OBJECTPROPERTY(id, N'IsView') = 1)
--Drop View [dbo].[dsi_vwEKRONOV2_Export]

--After the bcp statement above is executed, execute the command line function below.  This will kick-off the UTF-8 conversion.

--Set   @CMD = ''
--WAITFOR DELAY '00:00:02'

--Select  @CMD = '"' + @ExportPath + 'UTF8FileConversion\CPConverter.exe"'
--Exec master.dbo.xp_cmdshell @CMD, NO_OUTPUT
--Print @CMD

/****************
dsi_sp_testswitchbox 'EKRONOV2', 'SCHEDULED'
******************/

-- select * from u_dsi_configuration where formatcode='EKRONOV2'

-- EXEC master.dbo.xp_cmdshell '"\\ca.saas\t1\Public\PHA5000\Exports\Kronos\UTF8FileConversion\CPConverter.exe"'
GO
/************************************************************
Client: Pharmascience
Created By: Bernadette Bukiri
Business Analyst: Fernando Guiterrez
Create Date: 09/08/2014
ChangePoint Request Number: SR-2014-00050614

Purpose: Kronos Demographic Export  
Execute Export: dsi_sp_testswitchbox 'EKRONOV2', 'SCHEDULED'

Revision History
-----------------
Update By            Date            CP Num				Desc            
Bernadette Bukiri	 10/03/14        V 1.5				update orglvl1 to orgdesc
Bernadette Bukiri	 10/09/14        V1.6				updated Sup name to Sup Empno
Bernadette Bukiri	 03/04/15							deployed to Prod and schedule enabled
Bernadette Bukiri	 04/10/15							converted the aftercollect to remove the converter and update BCP to allow French Translations 
Wyle Cordero		 08/13/2019      SR-2019-00243713	Adding / updating multiple fields.
Wyle Cordero		04/21/2020		SR-2020-00273197	Previous SR was closed, completing testing.

SELECT * FROM U_Dsi_Configuration WHERE FormatCode = 'EKRONOV2'
SELECT * FROM U_Dsi_SqlClauses WHERE FormatCode = 'EKRONOV2'
SELECT * FROM U_Dsi_Parameters WHERE FormatCode = 'EKRONOV2'
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EKRONOV2' ORDER BY RunID DESC;

EXEC dbo.dsi_sp_TestSwitchbox_v2 'EKRONOV2', 'ONDEMAND'
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EKRONOV2', 'ACTIVE' -- (WC SR-2019-00243713)
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EKRONOV2', 'TEST' -- (WC SR-2019-00243713)

'\\ca.saas\t1\Public\PHA5000\Exports\'
'\\ca.saas\t0\data_exchange\PHA5000\Kronos\ '
Update u_dsi_configuration set cfgvalue = '\\ca.saas\t0\data_exchange\PHA5000\Kronos\' WHERE FormatCode = 'EKRONOV2' and cfgname = 'Exportpath'
************************************************************/ 
CREATE               procedure [dbo].[dsi_sp_BuildDriverTables_EKRONOV2]
@systemid char(12)
as

Declare @Formatcode varchar(12),
    @Exportcode varchar(12),
    @StartDate datetime,
    @EndDate datetime,
    @StartPerControl varchar(9),
    @EndPerControl varchar(9)

-- Declare dates from Parameter file
SELECT @StartDate = case when exportcode <> 'SCHEDULED'  then cast(substring(StartPerControl,1,8) as datetime) else getdate()-1 end
    , @EndDate = case when exportcode <> 'SCHEDULED'  then dateadd(second,-1,(cast(substring(EndPerControl,1,8) as datetime)+1) ) else getdate() end
    , @StartPerControl = case when exportcode <> 'SCHEDULED'  then StartPerControl else convert(varchar,getdate()-1,112)+'1' end
    , @EndPerControl = case when exportcode <> 'SCHEDULED'  then EndPerControl else  convert(varchar,getdate(),112)+'9' end
    , @Formatcode = Formatcode
    , @Exportcode = Exportcode
FROM dbo.U_dsi_Parameters with (nolock)
    where FormatCode = 'EKRONOV2'

--Clean up EE List
Delete from dbo.U_EKRONOV2_EELIST
where not exists (Select 1 from EmpComp where EecEEID = xEEID and EecCoID = xCOID and EecSalaryOrHourly = 'H')

DELETE EEList -- (WC SR-2019-00243713)
FROM dbo.U_EKRONOV2_EELIST EEList
INNER JOIN dbo.EmpComp
    ON xEEID = EecEEID
	AND xCoID = EecCoID
INNER JOIN dbo.Company 
    ON xCoID = CmpCoID
	AND CmpCompanyCode <> 'PMS'
;

---Build driver table Select * from dbo.U_EKRONOV2_DrvTbl

if object_id('U_EKRONOV2_DrvTbl') is not null
    drop table dbo.U_EKRONOV2_DrvTbl
select distinct    
    drvempno= substring(ec.EecEmpNo,2,5)
    ,drvnamefirst= REPLACE(ee.eepnamefirst, ',', '')
    ,drvnamelast= REPLACE(ee.eepnamelast, ',', '')
    ,drvDOLH=ec.EecDateOfLastHire
    ,drvDivision = REPLACE(Job_Division, ',', '') -- (WC SR-2019-00243713)
    ,drvWorkPlace = Employment_WorkPlace -- (WC SR-2019-00243713)
	,drvShift = Ec.EecUDField01 -- (WC SR-2019-00243713)
    ,drvJobCode = REPLACE(CONCAT(ec.EecJobCode, '-', RTRIM(LTRIM(Ejb.JbcDesc))), ',', '') -- (WC SR-2019-00243713)
    ,drvSupName = REPLACE(CONCAT(RTRIM(LTRIM(Sup.EepNameFirst)), ' ', RTRIM(LTRIM(Sup.EepNameLast))), ',', '') -- (WC SR-2019-00243713)
	,drvSupervisorID = SUBSTRING(es.EecEmpNo, 2, 5) -- (WC SR-2019-00243713)
    ,drvemplstatus=case ec.eecemplstatus
                        when 'T' then 'Terminated'
                        else 'Active' end -- (WC SR-2019-00243713)
    ,drvemplstatusdate=ec.EecEmplStatusStartDate
    ,drvhourlyrate=ec.EecHourlyPayRate
    ,drvSalarydate=case when sal.ejheeid is not null then salarydate  else ec.EecDateOfLastHire end
    ,drvdateofterm=ec.EecDateOfTermination
    ,drveeid=xeeid
    ,drvcoid=xcoid
    ,drvconsystemid=convert(varchar(12),'1')
	,drvManagerName = REPLACE(CONCAT(RTRIM(LTRIM(Mngr.EepNameFirst)), ' ', RTRIM(LTRIM(Mngr.EepNameLast))), ',', '') -- (WC SR-2019-00243713) 
	,drvManagerID = SUBSTRING(sm.EecEmpNo, 2, 5) -- (WC SR-2019-00243713)
	,drvAddressEmail = Ee.EepAddressEmail -- (WC SR-2019-00243713)
	,drvPayGroup = Ec.EecPayGroup -- (WC SR-2019-00243713)
	,drvOtherRate1 = Ec.EecOtherRate1 -- (WC SR-2019-00243713)
into dbo.U_EKRONOV2_DrvTbl
FROM    dbo.U_EKRONOV2_EELIST with (nolock)
JOIN     dbo.EmpComp ec with (nolock)
    on xeeid = ec.eeceeid
    and xcoid = ec.eeccoid
    and (eecemplstatus <> 'T' OR (eecemplstatus= 'T' and EecDateOfTermination>='08/31/2014'))
JOIN    EmpPers ee with (nolock)
    ON  ee.Eepeeid = xEEID
Left JOIN dbo.EmpPers SUP with (nolock)
    ON  sup.eepEEID = ec.EecSupervisorID
left JOIN dbo.EmpComp es with (nolock) 
    ON es.EecEEID = ec.eecsupervisorid 
left join (Select MAX(ejhjobeffdate) as salarydate, EjhEEID,ejhcoid from EmpHJob where EjhIsRateChange = 'Y' group by EjhEEID,ejhcoid) Sal
   on sal.EjhEEID = xeeid
   and sal.EjhCoID = xcoid
left join (Select MAX(ejhjobeffdate) as orgdate, EjhEEID,ejhcoid from EmpHJob join empcomp on eeceeid = ejheeid  and eeccoid = ejhcoid where EjhIsOrgChange = 'Y' and ejhorglvl2 <> eecorglvl2 group by EjhEEID,ejhcoid) org
   on org.EjhEEID = xeeid
   and org.EjhCoID = xcoid
LEFT JOIN [dbo].[fn_MP_CustomFields_JobCode_Export] (NULL, NULL, NULL, NULL) JbConfig
    ON ec.EecJobCode = JbConfig.JbcJobCode
LEFT JOIN [dbo].[fn_MP_CustomFields_EmpComp_Export] (NULL, NULL, NULL, NULL) EeConfig
    ON xCoID = EeConfig.EecCoID
	AND xEEID = EeConfig.EecEEID
LEFT JOIN dbo.EmpComp sm WITH (NOLOCK)
   ON es.EecSupervisorID = sm.EecEEID
LEFT JOIN dbo.EmpPers Mngr WITH (NOLOCK)
    ON sm.EecEEID = Mngr.EepEEID
INNER JOIN dbo.JobCode Ejb WITH (NOLOCK) 
    ON Ec.EecJobCode = Ejb.JbcJobCode

-- The client wants the option to only include active employees only.
-- Created an "ACTIVE" export session
DELETE DrvTbl -- (WC SR-2019-00243713) 
FROM dbo.U_EKRONOV2_DrvTbl DrvTbl
WHERE drvemplstatus = 'Terminated'
AND @ExportCode = 'ACTIVE'

-- (WC SR-2019-00243713)
-- Set FileName
IF (dbo.dsi_fnVariable(@FormatCode,'UseFileName') = 'N') BEGIN
	UPDATE dbo.U_dsi_Parameters
		SET ExportFile = CASE 
							 WHEN dbo.dsi_fnVariable(@FormatCode,'Testing') = 'Y' OR @ExportCode = 'TEST' THEN CONCAT('TEST_Kronos_employee_', FORMAT(GETDATE(), 'yyyyMMdd'), '.csv') 
							 ELSE CONCAT('Kronos_employee_', FORMAT(GETDATE(), 'yyyyMMdd'), '.csv') 
						 END
END;


/*
dsi_sp_testswitchbox 'EKRONOV2', 'SCHEDULED'
dsi_sp_testswitchbox 'EKRONOV2', 'ZAP'

--Alter the View
create View dbo.dsi_vwEKRONOV2_Export as
         select top 20000000 Data from dbo.U_EKRONOV2_File with (nolock)
         order by substring(RecordSet,2,2), InitialSort, subsort
Select * from dbo.dsi_vwEKRONOV2_Export
--Testing
exec sp_geteeid ' '
select * from U_EKRONOV2_drvTbl
select * from U_EKRONOV2_drvTbl where drveeid =''
select * from U_EKRONOV2_file

--Check out ascdeff
select * from ascdeff
where adfheadersystemid like '%EKRONOV2%'
order by adfsetnumber, adffieldnumber

--Update Dates
update ascexp
    set explaststartpercontrol    ='202003011'
        , expstartpercontrol    ='202003011'
        , explastendpercontrol    ='202004219'
        , expendpercontrol        ='202004219'
where EXPformatcode ='EKRONOV2' and expexportcode <> 'ZAP'

select * from u_dsi_configuration where formatcode = 'EKRONOV2'
select * from u_dsi_parameters where formatcode ='EKRONOV2'
select * from u_dsi_sqlclauses where formatcode = 'EKRONOV2'

Insert into u_dsi_configuration (formatcode,cfgname,cfgtype,cfgvalue)
values ('EKRONOV2','CVExportPath','V','\\ca.saas\t1\Public\PHA5000\Exports\archive\')

*/
GO 
CREATE VIEW dbo.dsi_vwEKRONOV2_Export AS
	SELECT TOP 200000000 Data FROM dbo.U_EKRONOV2_File WITH (NOLOCK)
	ORDER BY RIGHT(RecordSet,2), InitialSort

