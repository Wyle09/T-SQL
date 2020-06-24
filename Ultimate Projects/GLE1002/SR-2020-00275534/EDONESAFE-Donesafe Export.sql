SET NOCOUNT ON;
IF OBJECT_ID('U_EDONESAFE_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EDONESAFE_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EDONESAFE_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EDONESAFE' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEDONESAFE_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEDONESAFE_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EDONESAFE') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EDONESAFE];
GO
IF OBJECT_ID('U_EDONESAFE_File') IS NOT NULL DROP TABLE [dbo].[U_EDONESAFE_File];
GO
IF OBJECT_ID('U_EDONESAFE_EEList') IS NOT NULL DROP TABLE [dbo].[U_EDONESAFE_EEList];
GO
IF OBJECT_ID('U_EDONESAFE_DrvTbl_D11') IS NOT NULL DROP TABLE [dbo].[U_EDONESAFE_DrvTbl_D11];
GO
IF OBJECT_ID('U_EDONESAFE_AuditFields') IS NOT NULL DROP TABLE [dbo].[U_EDONESAFE_AuditFields];
GO
IF OBJECT_ID('U_EDONESAFE_Audit') IS NOT NULL DROP TABLE [dbo].[U_EDONESAFE_Audit];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EDONESAFE';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EDONESAFE';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EDONESAFE';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EDONESAFE';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EDONESAFE';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCreateTClockBatches,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhRespectZeroPayRate,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhThirdPartyPay) VALUES ('N','C','Y','0','',NULL,'','N','','N','','013010','EMPEXPORT','CDE','EDONESAFE','Donesafe Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','2000','N','S','N','EDONESAFE0Z0','N','Jan  1 1900 12:00AM','C','N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"external_uuid"','1','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','1',NULL,'external_uuid',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"created_at"','2','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','2',NULL,'created_at',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"email"','3','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','3',NULL,'email',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"first_name"','4','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','4',NULL,'first_name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"last_name"','5','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','5',NULL,'last_name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"password"','6','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','6',NULL,'password',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"manager"','7','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','7',NULL,'manager',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"role"','8','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','8',NULL,'role',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"home_location"','9','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','9',NULL,'home_location',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"home_organization"','10','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','10',NULL,'home_organization',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"title"','11','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','11',NULL,'title',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"position"','12','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','12',NULL,'position',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"gender"','13','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','13',NULL,'gender',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"mobile"','14','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','14',NULL,'mobile',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"payroll_identifier"','15','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','15',NULL,'payroll_identifier',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"date_of_birth"','16','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','16',NULL,'date_of_birth',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"notifications"','17','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','17',NULL,'notifications',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"type"','18','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','18',NULL,'type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"address_line_1"','19','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','19',NULL,'address_line_1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"address_line_2"','20','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','20',NULL,'address_line_2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"suburb"','21','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','21',NULL,'suburb',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"state"','22','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','22',NULL,'state',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"postal_code"','23','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','23',NULL,'postal_code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"active"','24','(''DA''=''T,'')','EDONESAFE0Z0','50','H','01','24',NULL,'active',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"timezone"','25','(''DA''=''T'')','EDONESAFE0Z0','50','H','01','25',NULL,'timezone',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpno"','1','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','1',NULL,'external_uuid',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"blank"','2','(''SS''=''T,'')','EDONESAFE0Z0','50','D','11','2',NULL,'created_at',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressEmail"','3','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','3',NULL,'email',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','4','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','4',NULL,'first_name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','5','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','5',NULL,'last_name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPassword"','6','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','6',NULL,'password',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvManager"','7','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','7',NULL,'manager',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvUDField29"','8','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','8',NULL,'role',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvHomeLocation"','9','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','9',NULL,'home_location',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Glen Gery"','10','(''DA''=''T,'')','EDONESAFE0Z0','50','D','11','10',NULL,'home_organization',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"blank"','11','(''SS''=''T,'')','EDONESAFE0Z0','50','D','11','11',NULL,'title',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPosition"','12','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','12',NULL,'position',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGender"','13','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','13',NULL,'gender',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMobile"','14','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','14',NULL,'mobile',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPayrollIdentifier"','15','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','15',NULL,'payroll_identifier',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfBirth"','16','(''UD110''=''T,'')','EDONESAFE0Z0','50','D','11','16',NULL,'date_of_birth',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"blank"','17','(''SS''=''T,'')','EDONESAFE0Z0','50','D','11','17',NULL,'notifications',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"blank"','18','(''SS''=''T,'')','EDONESAFE0Z0','50','D','11','18',NULL,'type',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressLine1"','19','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','19',NULL,'address_line_1',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddresslIne2"','20','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','20',NULL,'address_line_2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressCity"','21','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','21',NULL,'suburb',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressState"','22','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','22',NULL,'state',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAddressZipCode"','23','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','23',NULL,'postal_code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEecEmplStatus"','24','(''UA''=''T,'')','EDONESAFE0Z0','50','D','11','24',NULL,'active',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTimeZone"','25','(''UA''=''T'')','EDONESAFE0Z0','50','D','11','25',NULL,'timezone',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
DECLARE @UDSERVER varchar(5) = (SELECT RTRIM(LEFT(@@SERVERNAME,PATINDEX('%[0-9]%',@@SERVERNAME)) + SUBSTRING(@@SERVERNAME,PATINDEX('%UP[0-9]%',@@SERVERNAME)+2,1)));
SELECT @UDSERVER = CASE WHEN @UDSERVER = 'EW21' THEN 'WP6' WHEN @UDSERVER = 'EW22' THEN 'WP7' ELSE @UDSERVER END;
DECLARE @UDCOCODE varchar(5) = (SELECT RTRIM(CmmCompanyCode) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\EDONESAFE_20200616.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Donesafe OnDemand','202006169','EMPEXPORT','ONDMD_XOE',NULL,'EDONESAFE',NULL,NULL,NULL,'202006169','Jun 16 2020  6:07PM','Jun 16 2020  6:07PM','202006161',NULL,'','','202006161',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\EDONESAFE_20200616.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Donesafe Scheduled','202006169','EMPEXPORT','SCHEDULED',NULL,'EDONESAFE',NULL,NULL,NULL,'202006169','Jun 16 2020  6:07PM','Jun 16 2020  6:07PM','202006161',NULL,'','','202006161',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
UPDATE dbo.AscExp SET expAscFileName = CASE WHEN LEFT(@UDENV,2) IN ('NW','EW','WP') THEN REPLACE(REPLACE(expAscFileName,'[UDENV]',@UDENV),'[UDSERVER]',@UDSERVER) ELSE '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\EDONESAFE_20200616.txt' END WHERE expFormatCode = 'EDONESAFE';
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EDONESAFE','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EDONESAFE','ExportPath','V',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EDONESAFE','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EDONESAFE','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EDONESAFE','UseFileName','V','Y');
UPDATE dbo.U_dsi_Configuration SET CfgValue = CASE WHEN CfgName = 'UseFileName' THEN 'Y' ELSE NULL END WHERE FormatCode = 'EDONESAFE' AND CfgName IN ('UseFileName','ExportPath');
INSERT INTO dbo.CustomTemplates (CreationDate,Engine,EngineCode,IsActive,ModifiedDate) SELECT CreationDate = GETDATE(), Engine = AdhEngine, EngineCode = AdhFormatCode, IsActive = 1, ModifiedDate = GETDATE() FROM dbo.AscDefH WITH (NOLOCK) WHERE AdhFormatCode = 'EDONESAFE' AND NOT EXISTS(SELECT 1 FROM dbo.CustomTemplates WHERE EngineCode = AdhFormatCode);
IF OBJECT_ID('U_EDONESAFE_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EDONESAFE_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EDONESAFE','D11','dbo.U_EDONESAFE_DrvTbl_D11',NULL);
IF OBJECT_ID('U_EDONESAFE_Audit') IS NULL
CREATE TABLE [dbo].[U_EDONESAFE_Audit] (
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
IF OBJECT_ID('U_EDONESAFE_AuditFields') IS NULL
CREATE TABLE [dbo].[U_EDONESAFE_AuditFields] (
    [aTableName] varchar(30) NULL,
    [aFieldName] varchar(30) NULL
);
IF OBJECT_ID('U_EDONESAFE_EEList') IS NULL
CREATE TABLE [dbo].[U_EDONESAFE_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EDONESAFE_File') IS NULL
CREATE TABLE [dbo].[U_EDONESAFE_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(2000) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EDONESAFE]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: Glen Gery Corporation

Created By: Wyle Cordero
Business Analyst: Josh Smith
Create Date: 06/16/2020
Service Request Number: SR-2020-00275534

Purpose: Donesafe Export

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2020     SR-2020-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EDONESAFE';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EDONESAFE';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EDONESAFE';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EDONESAFE';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EDONESAFE' ORDER BY RunID DESC;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EDONESAFE', 'ONDMD_XOE';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'EDONESAFE', @AllObjects = 'Y', @IsWeb = 'Y'
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
    SELECT @FormatCode = 'EDONESAFE';

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
    DELETE FROM dbo.U_EDONESAFE_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_EDONESAFE_EEList GROUP BY xEEID HAVING COUNT(1) > 1);


    --==========================================
    -- Audit Section
    --==========================================
    -- Get data from audit fields table. Add fields here if auditing
    IF OBJECT_ID('U_EDONESAFE_AuditFields','U') IS NOT NULL
        DROP TABLE dbo.U_EDONESAFE_AuditFields;
    CREATE TABLE dbo.U_EDONESAFE_AuditFields (aTableName varchar(30),aFieldName varchar(30));

    INSERT INTO dbo.U_EDONESAFE_AuditFields VALUES ('EmpComp','EecDateOfTermination');

    -- Create audit table based on fields defined above
    IF OBJECT_ID('U_EDONESAFE_Audit','U') IS NOT NULL
        DROP TABLE dbo.U_EDONESAFE_Audit;
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
    INTO dbo.U_EDONESAFE_Audit
    FROM dbo.vw_AuditData WITH (NOLOCK) 
    JOIN dbo.U_EDONESAFE_AuditFields WITH (NOLOCK) 
        ON audTableName = aTableName
        AND audFieldName = aFieldName
    WHERE audDateTime BETWEEN @StartDate AND @EndDate
    AND audAction <> 'DELETE';

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EDONESAFE_Audit ON dbo.U_EDONESAFE_Audit (audEEID,audKey2);


	-- Only allow recent terms keyed within the date range of interface.
	DELETE EEList 
	FROM dbo.U_EDONESAFE_EEList EEList 
	INNER JOIN dbo.EmpComp
	    ON xCoID = EecCoID
		AND xEEID = EecEEID
		AND EecEmplStatus = 'T'
	    AND NOT EXISTS (	
			SELECT 1 FROM dbo.U_EDONESAFE_Audit 
	        WHERE xCoID = audKey2 
			AND xEEID = audEEID 
			AND audRowNo = 1
			AND audFieldName = 'EecDateOfTermination' AND audNewValue IS NOT NULL
	);

    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_EDONESAFE_DrvTbl_D11
    ---------------------------------
    IF OBJECT_ID('U_EDONESAFE_DrvTbl_D11','U') IS NOT NULL
        DROP TABLE dbo.U_EDONESAFE_DrvTbl_D11;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvEmpno = EecEmpNo
        ,drvAddressEmail = EepAddressEMail
        ,drvNameFirst = REPLACE(EepNameFirst, ',', '')
        ,drvNameLast = REPLACE(EepNameLast, ',', '')
        ,drvPassword = CASE WHEN EecJobChangeReason IN ('100', '101') THEN 'DoneSafe' END
        ,drvManager = SupAddressEmail
        ,drvUDField29 = REPLACE(EecUDField29, ',', '')
        ,drvHomeLocation = REPLACE(LocDesc, ',', '')
        ,drvPosition = REPLACE(JbcDesc, ',', '')
        ,drvGender = EepGender
        ,drvMobile = efoPhoneNumber
        ,drvPayrollIdentifier = EecEmpNo
        ,drvDateOfBirth = EepDateOfBirth
        ,drvAddressLine1 = REPLACE(EepAddressLine1, ',', '')
        ,drvAddresslIne2 = REPLACE(EepAddressLine2, ',', '')
        ,drvAddressCity = REPLACE(EepAddressCity, ',', '')
        ,drvAddressState = EepAddressState
        ,drvAddressZipCode = EepAddressZipCode
        ,drvEecEmplStatus = CASE WHEN EecEmplStatus = 'T' THEN 'N' ELSE 'A' END
        ,drvTimeZone = ''
    INTO dbo.U_EDONESAFE_DrvTbl_D11
    FROM dbo.U_EDONESAFE_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
	INNER JOIN dbo.Location WITH (NOLOCK)
		ON LocCode = EecLocation
	INNER JOIN dbo.JobCode WITH (NOLOCK)
		ON JbcJobCode = EecJobCode
	LEFT JOIN (
		SELECT DISTINCT 
			SupEmpNo = EecEmpNo
			,SupEEID = EecEEID
			,SupCoID = EecCoID
			,SupAddressEmail = EepAddressEmail
			,SupRowNo = ROW_NUMBER() OVER(PARTITION BY EecEEID, EecCoID ORDER BY CASE WHEN EecEmplStatus = 'T' THEN 2 ELSE 1 END)
		FROM dbo.EmpComp WITH (NOLOCK)
		INNER JOIN dbo.EmpPers WITH (NOLOCK)
			ON EepEEID = EecEEID
	) sup
		ON SupEEID = EecSuperVisorID
		AND SupRowNo = 1
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
    OPTION (FORCE ORDER);


END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwEDONESAFE_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_EDONESAFE_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'EDONESAFE%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202006091'
       ,expStartPerControl     = '202006091'
       ,expLastEndPerControl   = '202006169'
       ,expEndPerControl       = '202006169'
WHERE expFormatCode = 'EDONESAFE';

**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwEDONESAFE_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_EDONESAFE_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort
