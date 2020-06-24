SET NOCOUNT ON;
IF OBJECT_ID('U_ECAREELG_SavePath') IS NOT NULL DROP TABLE [dbo].[U_ECAREELG_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_ECAREELG_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'ECAREELG' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwECAREELG_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwECAREELG_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_ECAREELG') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_ECAREELG];
GO
IF OBJECT_ID('U_ECAREELG_File') IS NOT NULL DROP TABLE [dbo].[U_ECAREELG_File];
GO
IF OBJECT_ID('U_ECAREELG_EEList') IS NOT NULL DROP TABLE [dbo].[U_ECAREELG_EEList];
GO
IF OBJECT_ID('U_ECAREELG_DrvTbl_T91') IS NOT NULL DROP TABLE [dbo].[U_ECAREELG_DrvTbl_T91];
GO
IF OBJECT_ID('U_ECAREELG_DrvTbl_H01') IS NOT NULL DROP TABLE [dbo].[U_ECAREELG_DrvTbl_H01];
GO
IF OBJECT_ID('U_ECAREELG_DrvTbl_D11') IS NOT NULL DROP TABLE [dbo].[U_ECAREELG_DrvTbl_D11];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'ECAREELG';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'ECAREELG';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'ECAREELG';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'ECAREELG';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'ECAREELG';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCreateTClockBatches,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhRespectZeroPayRate,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhThirdPartyPay) VALUES ('N','C','Y','0','',NULL,'','N','','N','','013010','EMPEXPORT','CDE','ECAREELG','Care.com Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','1000','N','S','N','ECAREELG00Z0','N','Jan  1 1900 12:00AM','C','N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HEADER RECORD"','1','(''DA''=''T,'')','ECAREELG00Z0','24','H','01','1',NULL,'Header Record Indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvFileName"','2','(''UA''=''T,'')','ECAREELG00Z0','80','H','01','2',NULL,'File Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"EMPLOYBRIDGE"','3','(''DA''=''T,'')','ECAREELG00Z0','10','H','01','3',NULL,'Partner ID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateTimeStamp"','4','(''UA''=''T'')','ECAREELG00Z0','14','H','01','4',NULL,'Date/Time Stamp',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','1','(''UA''=''T,'')','ECAREELG00Z0','40','D','11','1',NULL,'UniqueEligibility ID or UEID',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','2','(''UA''=''T,'')','ECAREELG00Z0','45','D','11','2',NULL,'First Name',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','3','(''UA''=''T'')','ECAREELG00Z0','45','D','11','3',NULL,'Last Name',NULL,NULL);
--INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvWorkState"','4','(''UA''=''T'')','ECAREELG00Z0','100','D','11','4',NULL,'Optional',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"TRAILER RECORD"','1','(''DA''=''T,'')','ECAREELG00Z0','24','T','91','1',NULL,'Trailer Record Indicator',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNumberOfRecords"','2','(''UNT0''=''T,'')','ECAREELG00Z0','10','T','91','2',NULL,'Number of records in File',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"CONTENTS OF THIS FILE ARE CONFIDENTIAL AND PROPRIETARY TO CARE.COM INC. AND EMPLOYBRIDGE"','3','(''DA''=''T'')','ECAREELG00Z0','84','T','91','3',NULL,'Confidentiality Notice',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Care.com Export OnDemand','202001019','EMPEXPORT','ONDEMAND',NULL,'ECAREELG',NULL,NULL,NULL,'202001019','Jan  1 2020 11:05AM','Jan  1 2020 11:05AM','202001011',NULL,'','','202001011',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Test Purposes Only','202001019','EMPEXPORT','TEST',NULL,'ECAREELG',NULL,NULL,NULL,'202001019','Jan  1 2020 11:05AM','Jan  1 2020 11:05AM','202001011',NULL,'','','202001011',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Scheduled Session','202001019','EMPEXPORT','SCHEDULED',NULL,'ECAREELG',NULL,NULL,NULL,'202001019','Jan  1 2020 11:05AM','Jan  1 2020 11:05AM','202001011',NULL,'','','202001011',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECAREELG','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECAREELG','ExportPath','V','\\us.saas\n0\data_exchange\EMP1013\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECAREELG','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECAREELG','MultFile','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECAREELG','OnDemandPath','V','\\us.saas\n0\data_exchange\EMP1013\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECAREELG','Testing','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECAREELG','TestPath','V','\\us.saas\n3\Public\EMP1013\Exports\Care\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECAREELG','UDESPath','C','\\us.saas\n0\data_exchange\EMP1013\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ECAREELG','UseFileName','V','N');
UPDATE dbo.U_dsi_Configuration SET CfgValue = '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\' WHERE FormatCode = 'ECAREELG' AND CfgName = 'ExportPath' AND CfgValue IS NULL;
UPDATE dbo.U_dsi_Configuration SET CfgValue = svCfgValue FROM dbo.U_ECAREELG_SavePath WHERE CfgName = svCfgName AND FormatCode = svFormatCode AND svCfgValue IS NOT NULL;
IF OBJECT_ID('U_ECAREELG_SavePath') IS NOT NULL DROP TABLE [dbo].[U_ECAREELG_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ECAREELG','H01','dbo.U_ECAREELG_DrvTbl_H01',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ECAREELG','D11','dbo.U_ECAREELG_DrvTbl_D11',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ECAREELG','T91','dbo.U_ECAREELG_DrvTbl_T91',NULL);
IF OBJECT_ID('U_ECAREELG_DrvTbl_D11') IS NULL
CREATE TABLE [dbo].[U_ECAREELG_DrvTbl_D11] (
    [drvEEID] char(12) NULL,
    [drvCoID] char(5) NULL,
    [drvInitialSort] varchar(1) NOT NULL,
    [drvEmpNo] char(9) NULL,
    [drvNameFirst] varchar(100) NULL,
    [drvNameLast] varchar(100) NULL,
    [drvWorkState] char(6) NULL
);
IF OBJECT_ID('U_ECAREELG_DrvTbl_H01') IS NULL
CREATE TABLE [dbo].[U_ECAREELG_DrvTbl_H01] (
    [drvFileName] varchar(1) NOT NULL,
    [drvDateTimeStamp] varchar(1) NOT NULL
);
IF OBJECT_ID('U_ECAREELG_DrvTbl_T91') IS NULL
CREATE TABLE [dbo].[U_ECAREELG_DrvTbl_T91] (
    [drvNumberOfRecords] varchar(1) NOT NULL
);
IF OBJECT_ID('U_ECAREELG_EEList') IS NULL
CREATE TABLE [dbo].[U_ECAREELG_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_ECAREELG_File') IS NULL
CREATE TABLE [dbo].[U_ECAREELG_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(1000) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_ECAREELG]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: EmployBridge, LLC

Created By: Wyle Cordero
Business Analyst: Melissa Spence
Create Date: 05/26/2020
Service Request Number: SR-2019-00261651

Purpose: Care.com Export

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2020     SR-2020-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'ECAREELG';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'ECAREELG';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'ECAREELG';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'ECAREELG';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'ECAREELG' ORDER BY RunID DESC;

Job Ownership Scripts
---------------------
-- Set job owner to ssis_user for Production jobs
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 0;

-- Set job owner to self, to make changes in SQL Job Scheduler. Remember to re-run the above script to change ownership to ssis_user when complete
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 1;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'ECAREELG', 'ONDEMAND';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'ECAREELG', 'TEST';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'ECAREELG', 'SCHEDULED';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'ECAREELG', @AllObjects = 'Y', @IsWeb = 'N'
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
    SELECT @FormatCode = 'ECAREELG';

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
    DELETE FROM dbo.U_ECAREELG_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_ECAREELG_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

	-- Exclude terminated employees 
	DELETE el
	FROM dbo.U_ECAREELG_EEList el
	INNER JOIN dbo.EmpComp
		ON EecEEID = xEEID
		AND EecCoID = xCoID
		AND EecEmplStatus = 'T'
	;

    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_ECAREELG_DrvTbl_D11
    ---------------------------------
    IF OBJECT_ID('U_ECAREELG_DrvTbl_D11','U') IS NOT NULL
        DROP TABLE dbo.U_ECAREELG_DrvTbl_D11;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EecEmpNo
        -- standard fields above and additional driver fields below
        ,drvEmpNo = EecEmpNo
        ,drvNameFirst = REPLACE(EepNameFirst, ',', '')
        ,drvNameLast = REPLACE(EepNameLast, ',', '')
        --,drvWorkState = LocAddressState
    INTO dbo.U_ECAREELG_DrvTbl_D11
    FROM dbo.U_ECAREELG_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
	INNER JOIN dbo.Location WITH (NOLOCK)
		ON LocCode = EecLocation
    OPTION (FORCE ORDER);

    --==========================================
    -- Set FileName
    --==========================================
    IF (dbo.dsi_fnVariable(@FormatCode,'UseFileName') = 'N')
    BEGIN
        UPDATE dbo.U_dsi_Parameters
            SET ExportFile = 
				CASE 
                    WHEN dbo.dsi_fnVariable(@FormatCode,'Testing') = 'Y' OR @ExportCode LIKE '%TEST%' THEN CONCAT('TEST_EMPLOYBRIDGE_CARE_EmployeeVerificationEMPLOYBRIDGEFeedProcessor_', FORMAT(GETDATE(), 'yyyyMMddhhmmss'), '.csv ')
                    ELSE CONCAT('EMPLOYBRIDGE_CARE_EmployeeVerificationEMPLOYBRIDGEFeedProcessor_', FORMAT(GETDATE(), 'yyyyMMddhhmmss'), '.csv ')
                END
        WHERE FormatCode = @FormatCode;
    END;

    ---------------------------------
    -- HEADER RECORD
    ---------------------------------
    IF OBJECT_ID('U_ECAREELG_DrvTbl_H01','U') IS NOT NULL
        DROP TABLE dbo.U_ECAREELG_DrvTbl_H01;
    SELECT DISTINCT
         drvFileName = (SELECT ExportFile FROM dbo.U_dsi_Parameters WITH (NOLOCK) WHERE FormatCode = @FormatCode)
        ,drvDateTimeStamp = FORMAT(GETDATE(), 'yyyyMMdd:hhmmss')
    INTO dbo.U_ECAREELG_DrvTbl_H01;
    ---------------------------------
    -- TRAILER RECORD
    ---------------------------------
    IF OBJECT_ID('U_ECAREELG_DrvTbl_T91','U') IS NOT NULL
        DROP TABLE dbo.U_ECAREELG_DrvTbl_T91;
    SELECT DISTINCT
         drvNumberOfRecords = (SELECT COUNT(*) FROM dbo.U_ECAREELG_DrvTbl_D11)
    INTO dbo.U_ECAREELG_DrvTbl_T91;


END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwECAREELG_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_ECAREELG_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'ECAREELG%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202006011'
       ,expStartPerControl     = '202006011'
       ,expLastEndPerControl   = '202006239'
       ,expEndPerControl       = '202006239'
WHERE expFormatCode = 'ECAREELG';



    --------JOB NAME: Care@Work Eligibility Export (ECAREELG) - Weekly, Friday, 9:00am ET--------
    --Copy and paste this in environment to create job script

    BEGIN TRANSACTION
    DECLARE @ReturnCode INT, @JobName varchar(100), @dbName varchar(50)
    SELECT @ReturnCode = 0
    SELECT @JobName = RTRIM(REPLACE(DB_NAME(),'ULTIPRO_','')) + ' - Care@Work Eligibility Export (ECAREELG) - Weekly, Friday, 9:00am ET'
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
    EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Update AscExp Start/End Date (ECAREELG)', 
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
WHERE expFormatCode = ''ECAREELG''
  AND expExportCode = ''SCHEDULED'';',
            @database_name=@dbName,
            @flags=0
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

    -- Step 'Run SP'
    EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Create Export File (ECAREELG)', 
            @step_id=2, 
            @cmdexec_success_code=0, 
            @on_success_action=1, 
            @on_success_step_id=0, 
            @on_fail_action=2, 
            @on_fail_step_id=0, 
            @retry_attempts=0, 
            @retry_interval=0, 
            @os_run_priority=0, @subsystem=N'TSQL', 
            @command=N'EXEC dbo.dsi_sp_TestSwitchbox_v2 ''ECAREELG'', ''SCHEDULED'';', 
            @database_name=@dbName, 
            @flags=0
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
    EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
    EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Weekly, Friday, 9:00am ET',
            @enabled=1, 
            @freq_type=8, 
            @freq_interval=4,  
            @freq_subday_type=1, 
            @freq_subday_interval=0, 
            @freq_relative_interval=0,
            @freq_recurrence_factor=1,
            @active_start_date=20200101,
            @active_end_date=99991231,
            @active_start_time=210000,
            @active_end_time=235959;
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;
    EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)';
    --IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback;
    --EXEC msdb..usg_set_job_owner @job_id = @jobId, @set_owner_to_self = 0;
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
CREATE VIEW dbo.dsi_vwECAREELG_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_ECAREELG_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort
