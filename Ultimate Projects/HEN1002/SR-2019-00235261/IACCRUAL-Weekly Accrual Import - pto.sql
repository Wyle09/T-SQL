SET NOCOUNT ON;
IF OBJECT_ID('U_IACCRUAL_SavePath') IS NOT NULL DROP TABLE [dbo].[U_IACCRUAL_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_IACCRUAL_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'IACCRUAL' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwIACCRUAL_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwIACCRUAL_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_IACCRUAL') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_IACCRUAL];
GO
IF OBJECT_ID('U_IACCRUAL_Raw') IS NOT NULL DROP TABLE [dbo].[U_IACCRUAL_Raw];
GO
IF OBJECT_ID('U_IACCRUAL_Import') IS NOT NULL DROP TABLE [dbo].[U_IACCRUAL_Import];
GO
IF OBJECT_ID('U_IACCRUAL_File') IS NOT NULL DROP TABLE [dbo].[U_IACCRUAL_File];
GO
IF OBJECT_ID('U_IACCRUAL_EEList') IS NOT NULL DROP TABLE [dbo].[U_IACCRUAL_EEList];
GO
IF OBJECT_ID('U_IACCRUAL_DrvTbl_D10') IS NOT NULL DROP TABLE [dbo].[U_IACCRUAL_DrvTbl_D10];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'IACCRUAL';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'IACCRUAL';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'IACCRUAL';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'IACCRUAL';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'IACCRUAL';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhRespectZeroPayRate,AdhCreateTClockBatches,AdhThirdPartyPay) VALUES ('N','C','Y','0','','','N','','N','','013010','EMPEXPORT','CDE','IACCRUAL','Weekly Accrual Import - pto','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','2000','S','N','IACCRUALZ0','N','Jan 1 1900 12:00AM','C','N',NULL,'N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Employee Number"','1','(''DA''=''T|'')','IACCRUALZ0','50','H','01','1',NULL,'Employee Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Employee Name"','2','(''DA''=''T|'')','IACCRUALZ0','50','H','01','2',NULL,'Employee Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Service Annv Date"','3','(''DA''=''T|'')','IACCRUALZ0','50','H','01','3',NULL,'Service Annv Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Accrued Policy"','4','(''DA''=''T|'')','IACCRUALZ0','50','H','01','4',NULL,'Accrued Policy',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"File Run Date"','5','(''DA''=''T|'')','IACCRUALZ0','50','H','01','5',NULL,'File Run Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Action"','6','(''DA''=''T|'')','IACCRUALZ0','50','H','01','6',NULL,'Action',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Message"','7','(''DA''=''T|'')','IACCRUALZ0','50','H','01','7',NULL,'Message',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Hours Used in Service Anniv Year"','8','(''DA''=''T|'')','IACCRUALZ0','50','H','01','8',NULL,'Hours Used in Service Anniv Year',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Hours Available to use in SAY"','9','(''DA''=''T|'')','IACCRUALZ0','50','H','01','9',NULL,'Hours Available to use in SAY',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Accrued Balance"','10','(''DA''=''T'')','IACCRUALZ0','50','H','01','10',NULL,'Accrued Balance',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','1','(''UA''=''T|'')','IACCRUALZ0','50','D','10','1',NULL,'Employee Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpName"','2','(''UA''=''T|'')','IACCRUALZ0','50','D','10','2',NULL,'Employee Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvServiceAnnvDate"','3','(''UA''=''T|'')','IACCRUALZ0','50','D','10','3',NULL,'Service Annv Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAccruedPolicy"','4','(''UA''=''T|'')','IACCRUALZ0','50','D','10','4',NULL,'Accrued Policy',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFileRunDate"','5','(''UD101''=''T|'')','IACCRUALZ0','50','D','10','5',NULL,'File Run Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAction"','6','(''UA''=''T|'')','IACCRUALZ0','50','D','10','6',NULL,'Action',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMessage"','7','(''UA''=''T|'')','IACCRUALZ0','50','D','10','7',NULL,'Message',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvHoursUSEDInServiceAnnivYear"','8','(''UA''=''T|'')','IACCRUALZ0','50','D','10','8',NULL,'Hours Used in Service Anniv Year',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvHoursAvailableToUseInSAY"','9','(''UA''=''T|'')','IACCRUALZ0','50','D','10','9',NULL,'Hours Available to use in SAY',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAccruedBalance"','10','(''UA''=''T'')','IACCRUALZ0','50','D','10','10',NULL,'Accrued Balance',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
DECLARE @UDSERVER varchar(5) = (SELECT RTRIM(LEFT(@@SERVERNAME,PATINDEX('%[0-9]%',@@SERVERNAME)) + SUBSTRING(@@SERVERNAME,PATINDEX('%UP[0-9]%',@@SERVERNAME)+2,1)));
SELECT @UDSERVER = CASE WHEN @UDSERVER = 'EW21' THEN 'WP6' WHEN @UDSERVER = 'EW22' THEN 'WP7' ELSE @UDSERVER END;
DECLARE @UDCOCODE varchar(5) = (SELECT RTRIM(CmmCompanyCode) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('Kronos HGC WE 06.13.20.csv',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Weekly Accrual Import - pto','202001139','EMPEXPORT','IMPORT',NULL,'IACCRUAL',NULL,NULL,NULL,'202001139','Jan 13 2020  2:43PM','Jan 13 2020  2:43PM','202001131',NULL,'','','202001131',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Report Only (Do Not Update)','202001139','EMPEXPORT','TEST',NULL,'IACCRUAL',NULL,NULL,NULL,'202001139','Jan 13 2020  2:43PM','Jan 13 2020  2:43PM','202001131',NULL,'','','202001131',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Automated Scheduled Session','202001139','EMPEXPORT','SCHEDULED',NULL,'IACCRUAL',NULL,NULL,NULL,'202001139','Jan 13 2020  2:43PM','Jan 13 2020  2:43PM','202001131',NULL,'','','202001131',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('IACCRUAL','ArchivePath','V','\\us.saas\E1\Public\HEN1002\Imports\Accrual\archive\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('IACCRUAL','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('IACCRUAL','ExportPath','V','\\us.saas\E1\Public\HEN1002\Imports\Accrual\logs\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('IACCRUAL','ImportPath','V','\\us.saas\E1\Public\HEN1002\Imports\Accrual\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('IACCRUAL','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('IACCRUAL','UseFileName','V','N');
IF OBJECT_ID('U_IACCRUAL_SavePath') IS NOT NULL DROP TABLE [dbo].[U_IACCRUAL_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('IACCRUAL','D10','dbo.U_IACCRUAL_DrvTbl_D10 WITH (NOLOCK)', NULL);
IF OBJECT_ID('U_IACCRUAL_EEList') IS NULL
CREATE TABLE [dbo].[U_IACCRUAL_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_IACCRUAL_File') IS NULL
CREATE TABLE [dbo].[U_IACCRUAL_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(2000) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_IACCRUAL]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: Henley Enterprises, Inc.
Created By: Wyle Cordero
Business Analyst: Jackie Finn
Create Date: 04/22/2020
Service Request Number: 2019-00235261
Purpose: Weekly Accrual Import - pto
Revision History
----------------
Update By           Date            Request Num         Desc

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'IACCRUAL';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'IACCRUAL';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'IACCRUAL';
SELECT * FROM dbo.AscExp WHERE ExpFormatCode = 'IACCRUAL';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'IACCRUAL' ORDER BY RunID DESC;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'IACCRUAL', 'IMPORT';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'IACCRUAL', 'TEST';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'IACCRUAL', @AllObjects = 'Y', @IsWeb = 'N'
**********************************************************************************/
BEGIN
    --==================================================
    -- Declare Variables
    --==================================================
    DECLARE  @FormatCode VARCHAR(10)
            ,@ExportCode VARCHAR(10)
            ,@ImportPath VARCHAR(500)
            ,@FileName VARCHAR(500)
            ,@EnableStandardWebImport CHAR(1)
            ,@PayPeriodStartDate DATETIME;

    SET @FormatCode = 'IACCRUAL';
    SET @ExportCode = (SELECT ExportCode FROM dbo.U_dsi_Parameters (NOLOCK) WHERE FormatCode = @FormatCode);

    --Set directory and filename where import file is located
    SET @ImportPath = dbo.Dsi_fnVariable(@FormatCode,'ImportPath');
    SET @FileName = (SELECT expAscFileName FROM dbo.AscExp WHERE expFormatCode = @FormatCode AND expExportCode = @ExportCode);
    SET @EnableStandardWebImport = 'N'; --Enables Standard Web Import ('Y'), or BackOffice LOD Tables ('N')

    PRINT @EnableStandardWebImport
    PRINT @FileName
    PRINT @importPath

    --========================================
    -- Update Settings for Web/BackOffice
    --========================================
    IF (@EnableStandardWebImport = 'Y')
    BEGIN
        UPDATE dbo.U_dsi_Configuration SET CfgValue = NULL WHERE FormatCode = @FormatCode AND CfgName = 'ExportPath'; -- needed for web to work
        UPDATE dbo.U_dsi_Configuration SET CfgValue = 'Y' WHERE FormatCode = @FormatCode AND CfgName = 'UseFileName';
    END
    ELSE
    BEGIN
        UPDATE dbo.U_dsi_Configuration SET CfgValue = dbo.Dsi_fnVariable(@FormatCode,'ImportPath') + 'Logs\' WHERE FormatCode = @FormatCode AND CfgName = 'ExportPath';
        UPDATE dbo.U_dsi_Configuration SET CfgValue = 'N' WHERE FormatCode = @FormatCode AND CfgName = 'UseFileName';
    END;
    --==================================================
    -- Set FileName
    --==================================================
    IF (dbo.dsi_fnVariable(@FormatCode,'UseFileName') = 'N')
    BEGIN
        UPDATE dbo.U_dsi_Parameters
            SET ExportFile = CONCAT('ErrorRptPTO_', FORMAT(GETDATE(), 'yyyyMMdd_hhmmss'), '.csv') 
        WHERE FormatCode = @FormatCode;
    END;

    --==================================================
    -- Create Driver Table for Error Report
    --==================================================
    IF OBJECT_ID('U_IACCRUAL_DrvTbl_D10') IS NOT NULL
        DROP TABLE dbo.U_IACCRUAL_DrvTbl_D10;
    CREATE TABLE dbo.U_IACCRUAL_DrvTbl_D10 (
		drvInitialSort VARCHAR(255) NULL
		,drvEEID VARCHAR(255) NULL
        ,drvCoID VARCHAR(255) NULL   
        ,drvSurrogateKey VARCHAR(255) NULL
		,drvSystemID VARCHAR(12) NULL
		,drvPeriodStartDate VARCHAR(255) NULL
		,drvPeriodEndDate VARCHAR(255) NULL
		,drvAccrOption VARCHAR(255) NULL
		,drvAccrCode VARCHAR(255) NULL
		,drvHoursUSEDInServiceAnnivYear VARCHAR(255) NULL
		,drvHoursAvailableToUseInSAY VARCHAR(255) NULL
		,drvAccruedBalance VARCHAR(255) NULL
        ,drvImportType VARCHAR(255) NULL  
		,drvImported TINYINT NOT NULL DEFAULT ((0))          
		-- Fields below will go on the export
        ,drvEmpNo VARCHAR(255) NULL
        ,drvEmpName VARCHAR(255) NULL
		,drvServiceAnnvDate VARCHAR(255) NULL
        ,drvAccruedPolicy VARCHAR(255) NULL
		,drvFileRunDate DATE NULL
        ,drvAction VARCHAR(255) NULL
        ,drvMessage VARCHAR(MAX) NULL
        
    );

    --==========================================================
    -- Benefit Import Module (BIM) Code - Skills
    --==========================================================
    BEGIN TRY
        DELETE FROM dbo.U_dsi_BIM_Configuration WHERE FormatCode = @FormatCode;
        INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1) VALUES (@FormatCode,'RunID','ACCRUAL');
        INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1) VALUES (@FormatCode,'FilePath',@ImportPath);
        INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1) VALUES (@FormatCode,'MultipleFiles','Y'); -- Sweep Folder and Import Files
        INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1) VALUES (@FormatCode,'FileName','*Kronos*'); --File Name that contains 'Kronos'
        INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1,ParmValue2) VALUES (@FormatCode,'FileFormat','Delimited', ',');
        INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1) VALUES (@FormatCode,'FieldCount','11');
        INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1,ParmValue2) VALUES (@FormatCode,'KeyEEID','Field2','Employee#');
		INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1) VALUES (@FormatCode,'PayrollType','Non-Closed'); --Regular --PayGroup --Non-Closed --Non-Opened

        --For Web Validate Mode Only, then Copy Files Or Test session.  Otherwise Archive Files
        IF (dbo.dsi_BIM_fn_GetValidateModeSetting() = 'TRUE') OR @ExportCode = 'TEST' BEGIN
            INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1) VALUES (@FormatCode,'CopyFiles','Y');
        END
        ELSE BEGIN
			INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1) VALUES (@FormatCode,'ArchiveFiles','Y'); -- For BackOffice Archive.			
		END;

        EXEC dbo.dsi_BIM_sp_PopulateImportTable @FormatCode;

    END TRY
    BEGIN CATCH       
        INSERT INTO dbo.U_IACCRUAL_DrvTbl_D10 (drvMessage) -- Report SQL Error in Error Report File
        SELECT 'Error Processing File (BIM): ' + ISNULL(ERROR_MESSAGE(),'');  
        
        RETURN -- Stop Processing
    END CATCH

	-- Delete header row from the import table
	DELETE imp
	FROM dbo.U_IACCRUAL_Import imp
	WHERE Field1 = 'Company';

    --==================================================
    -- Build Driver Table - Skills
    --==================================================
    BEGIN TRY
        INSERT INTO dbo.U_IACCRUAL_DrvTbl_D10(drvInitialSort, drvEEID, drvCoID, drvSurrogateKey, drvPeriodStartDate, drvPeriodEndDate, drvAccrOption, drvAccrCode, drvHoursUSEDInServiceAnnivYear, drvHoursAvailableToUseInSAY, drvAccruedBalance, drvImportType, drvImported,
											  drvEmpNo, drvEmpName, drvServiceAnnvDate, drvAccruedPolicy, drvFileRunDate, drvAction, drvMessage)
        SELECT DISTINCT
			drvInitialSort = Field2
			,drvEEID = EEID
			,drvCoID = COID
            ,drvSurrogateKey = CONCAT(RTRIM(LTRIM(EEID)), RTRIM(LTRIM(COID)), RTRIM(LTRIM(EmployeeNo)))
			,drvPeriodStartDate = FORMAT(CAST(PayPeriodStartDate AS DATE), 'MM/dd/yyyy')
			,drvPeriodEndDate = FORMAT(CAST(PayPeriodEndDate AS DATE), 'MM/dd/yyyy') -- Target EacDateAccruedThru
			,drvAccrOption = AccAccrOption -- Target EacAccrOption
			,drvAccrCode = AccAccrCode -- Target EacAccrCode
			,drvHoursUSEDInServiceAnnivYear = CASE WHEN NULLIF(Field9, '') IS NOT NULL THEN FORMAT(CAST(Field9 AS DECIMAL(16,6)), 'N6') END-- Target EacAccrTakenCurBal
			,drvHoursAvailableToUseInSAY = CASE WHEN NULLIF(Field10, '') IS NOT NULL THEN FORMAT(CAST(Field10 AS DECIMAL(16,6)), 'N6') END -- Target EacAccrPendingCurBal
			,drvAccruedBalance = CASE WHEN NULLIF(Field11, '') IS NOT NULL THEN FORMAT(CAST(Field11 AS DECIMAL(16,6)), 'N6') END -- Target EacAccrAllowedCurBal
            ,drvImportType = 'ACCRUAL'
			,drvImported =
				CASE
					WHEN EecEEID IS NULL THEN 2 -- Employee Number not Found In UltiPro.
					WHEN AccAccrCode IS NULL THEN 2 -- Cannot Map Accrual Code.
					ELSE 0
				END 
            -- Below fields will be included in the export output.
            ,drvEmpNo = Field2
            ,drvEmpName = CONCAT(RTRIM(LTRIM(EepNameFirst)), SPACE(1), RTRIM(LTRIM(EepNameLast)))
            ,drvServiceAnnvDate = CASE WHEN NULLIF(Field4, '') IS NOT NULL THEN FORMAT(CAST(Field4 AS DATE), 'MM/dd/yyyy') END -- Target EacDateOfRollover
            ,drvAccruedPolicy = Field5
			,drvFileRunDate = GETDATE()
            ,drvAction = 
				CASE
					WHEN EecEEID IS NULL THEN 'REJECTED' -- Employee Number not Found In UltiPro.
					WHEN AccAccrCode IS NULL THEN 'REJECTED' -- Cannot Map Accrual Code.
					ELSE CASE WHEN EacAccrCode IS NOT NULL THEN 'UPDATE' ELSE 'ADD' END
				END
            ,drvMessage = 
				CASE
					WHEN EecEEID IS NULL THEN 'Employee Number not Found In UltiPro'
					WHEN AccAccrCode IS NULL THEN 'Cannot Map Accrual Code'
                END
        FROM dbo.U_IACCRUAL_Import
        LEFT JOIN dbo.EmpComp WITH (NOLOCK)
            ON EEID = EecEEID 
            AND COID = EecCoID
            AND (EecEmpNo = Field2
                 OR SUBSTRING(EecEmpNo, PATINDEX('%[^0]%', EecEmpNo +'.'), LEN(EecEmpNo)) = Field2)
        LEFT JOIN dbo.EmpPers WITH (NOLOCK)
            ON EEID = EepEEID
		LEFT JOIN dbo.AccrOpts WITH (NOLOCK)
			ON AccAccrOption =
				CASE
					WHEN Field5 LIKE '%Sick%' THEN 'SICK'
					WHEN Field5 LIKE '%Vacation%' THEN 'VAC'
				END
			AND AccAccrCode = 
				CASE
					WHEN Field5 LIKE '%Sick%' THEN 'SICK'
					WHEN Field5 LIKE '%Vacation%' THEN 'VAC'
				END	
		LEFT JOIN dbo.EmpAccr WITH (NOLOCK)
			ON EacEEID = EEID
			AND EacCoID = COID
			AND EacAccrOption = AccAccrOption
			AND EacAccrCode = AccAccrCode
        ;

		-- Update system ID
		UPDATE dbo.U_IACCRUAL_DrvTbl_D10
		SET drvSystemID = dbo.fn_GetTimedKey()
		WHERE drvImported = 0;

    END TRY
    BEGIN CATCH       
        INSERT INTO dbo.U_IACCRUAL_DrvTbl_D10 (drvMessage) -- Report SQL Error in Error Report File
        SELECT 'Error Processing Skills File: ' + ISNULL(ERROR_MESSAGE(),'');
    
        RETURN; -- Stop Processing
    END CATCH;

    --------------------------------
	-- Populate EmpAccr table
	--------------------------------
	IF @ExportCode <> 'TEST' BEGIN 
		INSERT INTO dbo.EmpAccr (EacEEID, EacCoID, EacDateOfRollover, EacAccrOption, EacAccrCode, EacAccrTakenCurBal, EacAccrPendingCurBal, EacAccrAllowedCurBal, EacDateAccruedThru, EacSystemID)
		SELECT DISTINCT
			EacEEID = drvEEID
			,EacCoID = drvCoID
			,EacDateOfRollover = CONVERT(DATETIME, drvServiceAnnvDate)
			,EacAccrOption = drvAccrOption
			,EacAccrCode = drvAccrCode
			,EacAccrTakenCurBal = CONVERT(DECIMAL(16, 6), drvHoursUSEDInServiceAnnivYear)
			,EacAccrPendingCurBal = CONVERT(DECIMAL(16, 6), drvHoursAvailableToUseInSAY)
			,EacAccrAllowedCurBal = CONVERT(DECIMAL(16, 6), drvAccruedBalance)
			,EacDateAccruedThru = CONVERT(DATETIME, drvPeriodEndDate)
			,EacSystemID = drvSystemID
		FROM dbo.U_IACCRUAL_DrvTbl_D10
		WHERE drvImported = 0
		AND drvAction = 'ADD';

		-- Update EmpAccr values for existing records.
		UPDATE eac
		SET
			EacAccrCode = drvAccrCode
			,EacAccrOption = drvAccrOption
			,EacDateOfRollover = CONVERT(DATETIME, drvServiceAnnvDate)
			,EacAccrTakenCurBal = CONVERT(DECIMAL(16, 6), drvHoursUSEDInServiceAnnivYear)
			,EacAccrPendingCurBal = CONVERT(DECIMAL(16, 6), drvHoursAvailableToUseInSAY)
			,EacAccrAllowedCurBal = CONVERT(DECIMAL(16, 6), drvAccruedBalance)
			,EacDateAccruedThru = CONVERT(DATETIME, drvPeriodEndDate)
			,EacSystemID = drvSystemID
		FROM dbo.EmpAccr eac
		INNER JOIN dbo.U_IACCRUAL_DrvTbl_D10
			ON drvEEID = EacEEID
			AND drvCoID = EacCoID
			AND drvAccrCode = EacAccrCode
		WHERE drvImported = 0
		AND drvAction = 'UPDATE';
	END;

    	--=======================
    	-- Report Successful
    	--=======================
    	UPDATE dbo.U_IACCRUAL_DrvTbl_D10
        	SET drvMessage = CASE WHEN @ExportCode = 'TEST' THEN 'Report Only - Do Not Update' ELSE 'Loaded Successfully' END
           	   ,drvImported = 1
    	WHERE drvImported = 0
		AND @ExportCode = 'TEST'
		OR EXISTS (SELECT 1 FROM dbo.EmpAccr WHERE EacEEID = drvEEID AND EacSystemID = drvSystemID);

    	--============================
    	-- Reject Remaining Records
    	--============================
    	UPDATE dbo.U_IACCRUAL_DrvTbl_D10
        	SET drvMessage = 'Record Rejected'
            	,drvAction = 'REJECTED'
            	,drvImported = 2
    	WHERE drvImported = 0;
    
END;

/******************************************************************
--Create the View
CREATE VIEW dbo.dsi_vwIACCRUAL_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_IACCRUAL_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID IN (SELECT AdhSystemID FROM dbo.AscDefH WHERE AdhFormatCode = 'IACCRUAL')
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET ExpLastStartPerControl = '201806011'
       ,ExpStartPerControl     = '201806011'
       ,ExpLastEndPerControl   = '201806019'
       ,ExpEndPerControl       = '201806019'
WHERE ExpFormatCode = 'IACCRUAL';
******************************************************************/
GO
CREATE VIEW dbo.dsi_vwIACCRUAL_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_IACCRUAL_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;
