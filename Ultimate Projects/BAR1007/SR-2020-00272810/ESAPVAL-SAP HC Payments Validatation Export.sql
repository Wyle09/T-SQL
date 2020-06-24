--======================
-- V1.0
--======================

SET NOCOUNT ON;
IF OBJECT_ID('U_ESAPVAL_SavePath') IS NOT NULL DROP TABLE [dbo].[U_ESAPVAL_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_ESAPVAL_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'ESAPVAL' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwESAPVAL_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwESAPVAL_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_ESAPVAL') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_ESAPVAL];
GO
IF OBJECT_ID('U_ESAPVAL_File') IS NOT NULL DROP TABLE [dbo].[U_ESAPVAL_File];
GO
IF OBJECT_ID('U_ESAPVAL_EEList') IS NOT NULL DROP TABLE [dbo].[U_ESAPVAL_EEList];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'ESAPVAL';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'ESAPVAL';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'ESAPVAL';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'ESAPVAL';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'ESAPVAL';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCreateTClockBatches,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhRespectZeroPayRate,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhThirdPartyPay) VALUES ('N','C','Y','0','',NULL,'','N','','N','','013010','EMPEXPORT','CDE','ESAPVAL','SAP HC Payments Validation Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','1000','N','S','N','ESAPVAL000Z0','N','Jan  1 1900 12:00AM','C','N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameLast"','1','(''UA''=''T,'')','ESAPVAL000Z0','50','D','10','1',NULL,'NameLast',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvNameFirst"','2','(''UA''=''T,'')','ESAPVAL000Z0','50','D','10','2',NULL,'NameFirst',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPernr"','3','(''UA''=''T,'')','ESAPVAL000Z0','50','D','10','3',NULL,'PERNR',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvVperio"','4','(''UA''=''T,'')','ESAPVAL000Z0','50','D','10','4',NULL,'VPERIO',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEarningcode"','5','(''UA''=''T,'')','ESAPVAL000Z0','50','D','10','5',NULL,'EarningCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvMacr2"','6','(''UA''=''T,'')','ESAPVAL000Z0','50','D','10','6',NULL,'MACR2',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvWaers"','7','(''UA''=''T'')','ESAPVAL000Z0','51','D','10','7',NULL,'WAERS',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'SAP HC Validation OnDemand','202004299','EMPEXPORT','ONDEMAND',NULL,'ESAPVAL',NULL,NULL,NULL,'202004299','Apr 29 2020  1:20PM','Apr 29 2020  1:20PM','202004291',NULL,'','','202004291',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Test Purposes Only','202004299','EMPEXPORT','TEST',NULL,'ESAPVAL',NULL,NULL,NULL,'202004299','Apr 29 2020  1:20PM','Apr 29 2020  1:20PM','202004291',NULL,'','','202004291',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Scheduled Session','202004299','EMPEXPORT','SCHEDULED',NULL,'ESAPVAL',NULL,NULL,NULL,'202004299','Apr 29 2020  1:20PM','Apr 29 2020  1:20PM','202004291',NULL,'','','202004291',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ESAPVAL','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ESAPVAL','ExportPath','V','\\us.saas\n0\data_exchange\BAR1007\Exports\HCPYI005\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ESAPVAL','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ESAPVAL','OnDemandPath','V','\\us.saas\n0\data_exchange\BAR1007\Exports\HCPYI005\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ESAPVAL','SubSort','C','drvSubSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ESAPVAL','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ESAPVAL','TestPath','V','\\us.saas\n1\Public\10484\Exports\HCPYI005\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ESAPVAL','UDESPath','V','\\us.saas\n0\data_exchange\BAR1007\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('ESAPVAL','UseFileName','V','N');
UPDATE dbo.U_dsi_Configuration SET CfgValue = '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\' WHERE FormatCode = 'ESAPVAL' AND CfgName = 'ExportPath' AND CfgValue IS NULL;
UPDATE dbo.U_dsi_Configuration SET CfgValue = svCfgValue FROM dbo.U_ESAPVAL_SavePath WHERE CfgName = svCfgName AND FormatCode = svFormatCode AND svCfgValue IS NOT NULL;
IF OBJECT_ID('U_ESAPVAL_SavePath') IS NOT NULL DROP TABLE [dbo].[U_ESAPVAL_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('ESAPVAL','D10','dbo.U_EYARDIDEM_DrvTbl_D10','NULLIF(drvPernr, '''') IS NULL OR NULLIF(drvMacr2, '''') IS NULL OR NULLIF(drvWaers, '''') IS NULL');
IF OBJECT_ID('U_ESAPVAL_EEList') IS NULL
CREATE TABLE [dbo].[U_ESAPVAL_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_ESAPVAL_File') IS NULL
CREATE TABLE [dbo].[U_ESAPVAL_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(1000) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_ESAPVAL]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: Barilla America

Created By: Wyle Cordero
Business Analyst: Gail Yates
Create Date: 04/29/2020
Service Request Number: SR-2020-00272810

Purpose: SAP HC Payments Validatation Export

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2020     SR-2020-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'ESAPVAL';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'ESAPVAL';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'ESAPVAL';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'ESAPVAL';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'ESAPVAL' ORDER BY RunID DESC;

-- I: drive:
UPDATE U_dsi_configuration
SET cfgvalue = dbo.dsi_fnVariable('ESAPVAL','TestPath') 
WHERE FormatCode = 'ESAPVAL'
AND cfgname IN ('ExportPath', 'OnDemandPath')

-- J: drive:
UPDATE U_dsi_configuration
SET cfgvalue = dbo.dsi_fnVariable('ESAPVAL','UDESpath') 
WHERE FormatCode = 'ESAPVAL'
AND CfgName IN ('ExportPath', 'OnDemandPath')

Job Ownership Scripts
---------------------
-- Set job owner to ssis_user for Production jobs
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 0;

-- Set job owner to self, to make changes in SQL Job Scheduler. Remember to re-run the above script to change ownership to ssis_user when complete
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 1;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'ESAPVAL', 'ONDEMAND';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'ESAPVAL', 'TEST';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'ESAPVAL', 'SCHEDULED';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'ESAPVAL', @AllObjects = 'Y', @IsWeb = 'N'
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
			,@PreviousMonthStartPerControl VARCHAR(9)
			,@PreviousMonthEndPerControl VARCHAR(9) ;

    -- Set FormatCode
    SELECT @FormatCode = 'ESAPVAL';

    -- Declare dates from Parameter file
    SELECT
         @StartPerControl = StartPerControl
        ,@EndPerControl   = EndPerControl
        ,@StartDate       = LEFT(StartPerControl,8)
        ,@EndDate         = DATEADD(S,-1,DATEADD(D,1,LEFT(EndPerControl,8)))
        ,@ExportCode      = ExportCode
		,@PreviousMonthStartPerControl = CONCAT(FORMAT(DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) - 1, 0), 'yyyyMMdd'), '1')
		,@PreviousMonthEndPerControl = CONCAT(FORMAT(DATEADD(DAY, -(DAY(GETDATE())), GETDATE()), 'yyyyMMdd'), '9')
    FROM dbo.U_dsi_Parameters WITH (NOLOCK)
    WHERE FormatCode = @FormatCode;

    --==========================================
    -- Clean EE List 
    -- Caution: Careful of cleaning EE List if including paycheck data
    --==========================================

    -- Cleans EE List of terms where EE active in another company (transfer), or active in more than one company
    DELETE FROM dbo.U_ESAPVAL_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_ESAPVAL_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_EYARDIDEM_DrvTbl_D10
    ---------------------------------
    IF OBJECT_ID('U_EYARDIDEM_DrvTbl_D10','U') IS NOT NULL
        DROP TABLE dbo.U_EYARDIDEM_DrvTbl_D10;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EepNameLast
        ,drvSubSort = EepNameFirst
        -- standard fields above and additional driver fields below
        ,drvNameLast = REPLACE(EepNameLast, ',', '')
        ,drvNameFirst = REPLACE(EepNameFirst, ',', '')
        ,drvPernr = EepUDField01
        ,drvVperio = LEFT(@PreviousMonthEndPerControl, 6)
        ,drvEarningcode = PehEarnCode
        ,drvMacr2 = UseSapEarnCode
        ,drvWaers = (SELECT TOP 1 CurCode FROM [ULTIPRO_SYSTEM].[dbo].[Currency] WITH (NOLOCK) WHERE CurCountryCode = EepAddressCountry)
    INTO dbo.U_EYARDIDEM_DrvTbl_D10
    FROM dbo.U_ESAPVAL_EEList WITH (NOLOCK)
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
	INNER JOIN (
		SELECT DISTINCT
			PehEEID = PehEEID
			,PehEarnCode
		FROM dbo.PayReg WITH (NOLOCK)
		INNER JOIN dbo.PearHist WITH (NOLOCK)
			ON PehGenNumber = PrgGenNumber
		WHERE PehPerControl BETWEEN @PreviousMonthStartPerControl AND @PreviousMonthEndPerControl
		GROUP BY PehEEID, PehEarnCode
		HAVING SUM(PehCurAmt) <> 0
	) peh
		ON PehEEID = xEEID
	INNER JOIN dbo.U_BARIL_SAPEarn WITH (NOLOCK)
		ON UseEarnCode = PehEarnCode

	UNION ALL -- Taxes

    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EepNameLast
        ,drvSubSort = EepNameFirst
        -- standard fields above and additional driver fields below
        ,drvNameLast = REPLACE(EepNameLast, ',', '')
        ,drvNameFirst = REPLACE(EepNameFirst, ',', '')
        ,drvPernr = EepUDField01
        ,drvVperio = LEFT(@PreviousMonthEndPerControl, 6)
        ,drvEarningcode = NULL
        ,drvMacr2 = 'SSN001'
        ,drvWaers = (SELECT TOP 1 CurCode FROM [ULTIPRO_SYSTEM].[dbo].[Currency] WITH (NOLOCK) WHERE CurCountryCode = EepAddressCountry)
    FROM dbo.U_ESAPVAL_EEList WITH (NOLOCK)
    JOIN dbo.EmpPers WITH (NOLOCK)
        ON EepEEID = xEEID
	INNER JOIN (
		SELECT DISTINCT
			PthEEID = PthEEID
		FROM dbo.PayReg WITH (NOLOCK)
		INNER JOIN dbo.PTaxHist WITH (NOLOCK)
			ON PthGenNumber = PrgGenNumber
		WHERE PthPerControl BETWEEN @PreviousMonthStartPerControl AND @PreviousMonthEndPerControl
		AND PthTaxCode IN ('USMEDEE', 'USSOCEE')
		GROUP BY PthEEID
		HAVING SUM(PthCurTaxAmt) <> 0
	) Pth
		ON PthEEID = xEEID
    ;

    --==========================================
    -- Set FileName
    --==========================================
    IF (dbo.dsi_fnVariable(@FormatCode,'UseFileName') = 'N')
    BEGIN
        UPDATE dbo.U_dsi_Parameters
            SET ExportFile = CASE WHEN dbo.dsi_fnVariable(@FormatCode,'Testing') = 'Y' THEN 'SAPHC_PAYROLL_VALIDATION_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.csv'
                                  WHEN @ExportCode LIKE '%TEST%' THEN 'SAPHC_PAYROLL_VALIDATION_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.csv'
                                  ELSE 'SAPHC_PAYROLL_VALIDATION_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.csv'
                             END
        WHERE FormatCode = @FormatCode;
    END

END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwESAPVAL_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_ESAPVAL_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'ESAPVAL%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202004221'
       ,expStartPerControl     = '202004221'
       ,expLastEndPerControl   = '202004299'
       ,expEndPerControl       = '202004299'
WHERE expFormatCode = 'ESAPVAL';



    --------JOB NAME: SAP HC Payments Validatation Export (ESAPVAL) - Monthly, Monday, 8:00am ET--------
    --Copy and paste this in environment to create job script

    BEGIN TRANSACTION
    DECLARE @ReturnCode INT, @JobName varchar(100), @dbName varchar(50)
    SELECT @ReturnCode = 0
    SELECT @JobName = RTRIM(REPLACE(DB_NAME(),'ULTIPRO_','')) + ' - SAP HC Payments Validatation Export (ESAPVAL) - Monthly, Monday, 8:00am ET'
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
    EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Update AscExp Start/End Date (ESAPVAL)', 
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

    SELECT @StartPerControl = CONVERT(char(8),GETDATE()-30,112) + ''1''; 
    SELECT @EndPerControl = CONVERT(char(8),GETDATE()-1,112) + ''9''; 
    SELECT @RunDate = GETDATE(); 

UPDATE dbo.AscExp
SET    expStartPerControl = @StartPerControl,
    expLastStartPerControl = @StartPerControl,
    expEndPerControl = @EndPerControl,
    expLastEndPerControl = @EndPerControl,
    expExported = @RunDate
WHERE expFormatCode = ''ESAPVAL''
  AND expExportCode = ''SCHEDULED'';',
            @database_name=@dbName,
            @flags=0
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

    -- Step 'Run SP'
    EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Create Export File (ESAPVAL)', 
            @step_id=2, 
            @cmdexec_success_code=0, 
            @on_success_action=1, 
            @on_success_step_id=0, 
            @on_fail_action=2, 
            @on_fail_step_id=0, 
            @retry_attempts=0, 
            @retry_interval=0, 
            @os_run_priority=0, @subsystem=N'TSQL', 
            @command=N'EXEC dbo.dsi_sp_TestSwitchbox_v2 ''ESAPVAL'', ''SCHEDULED'';', 
            @database_name=@dbName, 
            @flags=0
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
    EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
    IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
    EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Monthly, Monday, 8:00am ET',
            @enabled=1, 
            @freq_type=16, 
            @freq_interval=1,  
            @freq_subday_type=1, 
            @freq_subday_interval=0, 
            @freq_relative_interval=0,
            @freq_recurrence_factor=1,
            @active_start_date=20200429,
            @active_end_date=99991231,
            @active_start_time=080000,
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
CREATE VIEW dbo.dsi_vwESAPVAL_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_ESAPVAL_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort
