SET NOCOUNT ON;
IF OBJECT_ID('U_EORCLDEMTM_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMTM_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EORCLDEMTM_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EORCLDEMTM' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEORCLDEMTM_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEORCLDEMTM_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EORCLDEMTM') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EORCLDEMTM];
GO
IF OBJECT_ID('U_EORCLDEMTM_File') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMTM_File];
GO
IF OBJECT_ID('U_EORCLDEMTM_EEList') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMTM_EEList];
GO
IF OBJECT_ID('U_EORCLDEMTM_AuditFields') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMTM_AuditFields];
GO
IF OBJECT_ID('U_EORCLDEMTM_Audit') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMTM_Audit];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EORCLDEMTM';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EORCLDEMTM';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EORCLDEMTM';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EORCLDEMTM';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EORCLDEMTM';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCreateTClockBatches,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhRespectZeroPayRate,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhThirdPartyPay) VALUES ('N','C','Y','0','',NULL,'','N','','N','','013010','EMPEXPORT','CDE','EORCLDEMTM','Oracle Demographic Terminations Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','1000','N','S','N','EORCLDEMTMZ0','N','Jan  1 1900 12:00AM','C','N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"METADATA"','1','(''DA''=''T|'')','EORCLDEMTMZ0','50','H','01','1',NULL,'METADATA',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"WorkRelationship"','2','(''DA''=''T|'')','EORCLDEMTMZ0','50','H','01','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemOwner"','3','(''DA''=''T|'')','EORCLDEMTMZ0','50','H','01','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"SourceSystemId"','4','(''DA''=''T|'')','EORCLDEMTMZ0','50','H','01','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonId(SourceSystemId)"','5','(''DA''=''T|'')','EORCLDEMTMZ0','50','H','01','5',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"LegalEmployerName"','6','(''DA''=''T|'')','EORCLDEMTMZ0','50','H','01','6',NULL,'LegalEmployerName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"PersonNumber"','7','(''DA''=''T|'')','EORCLDEMTMZ0','50','H','01','7',NULL,'PersonNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"WorkerType"','8','(''DA''=''T|'')','EORCLDEMTMZ0','50','H','01','8',NULL,'WorkerType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"TerminateWorkRelationshipFlag"','9','(''DA''=''T|'')','EORCLDEMTMZ0','50','H','01','9',NULL,'TerminateWorkRelationshipFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ActualTerminationDate"','10','(''DA''=''T|'')','EORCLDEMTMZ0','50','H','01','10',NULL,'ActualTerminationDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ActionCode"','11','(''DA''=''T|'')','EORCLDEMTMZ0','50','H','01','11',NULL,'ActionCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"ReasonCode"','12','(''DA''=''T'')','EORCLDEMTMZ0','50','H','01','12',NULL,'ReasonCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"MERGE"','1','(''DA''=''T|'')','EORCLDEMTMZ0','50','D','11','1',NULL,'MERGE',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"WorkRelationship"','2','(''DA''=''T|'')','EORCLDEMTMZ0','50','D','11','2',NULL,'Metadata Section',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"HDL_LOADER"','3','(''DA''=''T|'')','EORCLDEMTMZ0','50','D','11','3',NULL,'SourceSystemOwner',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvSourceID"','4','(''UA''=''T|'')','EORCLDEMTMZ0','50','D','11','4',NULL,'SourceSystemId',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPersonID"','5','(''UA''=''T|'')','EORCLDEMTMZ0','50','D','11','5',NULL,'PersonId(SourceSystemId)',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCompanyName"','6','(''UA''=''T|'')','EORCLDEMTMZ0','50','D','11','6',NULL,'LegalEmployerName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','7','(''UA''=''T|'')','EORCLDEMTMZ0','50','D','11','7',NULL,'PersonNumber',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"E"','8','(''DA''=''T|'')','EORCLDEMTMZ0','50','D','11','8',NULL,'WorkerType',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Y"','9','(''DA''=''T|'')','EORCLDEMTMZ0','50','D','11','9',NULL,'TerminateWorkRelationshipFlag',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDateOfTermination"','10','(''UD111''=''T|'')','EORCLDEMTMZ0','50','D','11','10',NULL,'ActualTerminationDate',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"RESIGNATION"','11','(''DA''=''T|'')','EORCLDEMTMZ0','50','D','11','11',NULL,'ActionCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"RESIGN_PERSONAL"','12','(''DA''=''T'')','EORCLDEMTMZ0','50','D','11','12',NULL,'ReasonCode',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Terminations OnDemand','201908169','EMPEXPORT','ONDMD_XOE',NULL,'EORCLDEMTM',NULL,NULL,NULL,'201908169','Aug 16 2019 12:26PM','Aug 16 2019 12:26PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'WYLEC',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Terminations Test','201908169','EMPEXPORT','TEST_XOE',NULL,'EORCLDEMTM',NULL,NULL,NULL,'201908169','Aug 16 2019 12:26PM','Aug 16 2019 12:26PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'WYLEC',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Terminations FullFile','201908169','EMPEXPORT','FULL_XOE',NULL,'EORCLDEMTM',NULL,NULL,NULL,'201908169','Aug 16 2019 12:26PM','Aug 16 2019 12:26PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'WYLEC',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Terminations Scheduled','201908169','EMPEXPORT','SCHEDULED',NULL,'EORCLDEMTM',NULL,NULL,NULL,'201908169','Aug 16 2019 12:26PM','Aug 16 2019 12:26PM','201908161',NULL,'','','201908161',dbo.fn_GetTimedKey(),NULL,'WYLEC',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMTM','EEList','V','Y');
--INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMTM','ExportPath','V','\\US.SAAS\Ez\Public\ACC1011\Exports\Oracle\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMTM','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMTM','MultFile','V','N');
--INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMTM','OnDemandPath','V','\\US.SAAS\Ez\Public\ACC1011\Exports\Oracle\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMTM','SubSort','C','drvSubSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMTM','Testing','V','N');
--INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMTM','TestPath','V','\\US.SAAS\Ez\Public\ACC1011\Exports\Oracle\');
--INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMTM','UDESPath','C','\\us.saas\n0\data_exchange\ACC1011\Exports\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EORCLDEMTM','UseFileName','V','Y');
UPDATE dbo.U_dsi_Configuration SET CfgValue = '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\' WHERE FormatCode = 'EORCLDEMTM' AND CfgName = 'ExportPath' AND CfgValue IS NULL;
UPDATE dbo.U_dsi_Configuration SET CfgValue = svCfgValue FROM dbo.U_EORCLDEMTM_SavePath WHERE CfgName = svCfgName AND FormatCode = svFormatCode AND svCfgValue IS NOT NULL;
IF OBJECT_ID('U_EORCLDEMTM_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EORCLDEMTM_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EORCLDEMTM','D11','dbo.U_EORCLDEMTM_drvTbl_Terminations_WorkRelationship_D11',NULL);
IF OBJECT_ID('U_EORCLDEMTM_Audit') IS NULL
CREATE TABLE [dbo].[U_EORCLDEMTM_Audit] (
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
IF OBJECT_ID('U_EORCLDEMTM_AuditFields') IS NULL
CREATE TABLE [dbo].[U_EORCLDEMTM_AuditFields] (
    [aTableName] varchar(30) NULL,
    [aFieldName] varchar(30) NULL
);
IF OBJECT_ID('U_EORCLDEMTM_EEList') IS NULL
CREATE TABLE [dbo].[U_EORCLDEMTM_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EORCLDEMTM_File') IS NULL
CREATE TABLE [dbo].[U_EORCLDEMTM_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(1000) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EORCLDEMTM]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: R1 RCM Inc.

Created By: Wyle Cordero
Business Analyst: Dian Turner
Create Date: 08/16/2019
Service Request Number: SR-2019-00241875

Purpose: Oracle Demographic Terminations Export

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2019     SR-2019-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EORCLDEMTM';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EORCLDEMTM';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EORCLDEMTM';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EORCLDEMTM';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EORCLDEMTM' ORDER BY RunID DESC;

Job Ownership Scripts
---------------------
-- Set job owner to ssis_user for Production jobs
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 0;

-- Set job owner to self, to make changes in SQL Job Scheduler. Remember to re-run the above script to change ownership to ssis_user when complete
EXEC msdb..usg_set_job_owner @job_name = '', @set_owner_to_self = 1;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EORCLDEMTM', 'ONDMD_XOE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EORCLDEMTM', 'TEST_XOE';
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EORCLDEMTM', 'FULL_XOE';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'EORCLDEMTM', @AllObjects = 'Y', @IsWeb = 'Y'
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
    SELECT @FormatCode = 'EORCLDEMTM';

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
    DELETE FROM dbo.U_EORCLDEMTM_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_EORCLDEMTM_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

	-- Full File, include all terms only.
    DELETE EEList
	FROM dbo.U_EORCLDEMTM_EEList EELIST
	INNER JOIN dbo.EmpComp
	    ON xEEID = EecEEId
		AND xCoID = EecCoID
		AND EecEmplStatus <> 'T'
	WHERE @ExportCode = 'FULL_XOE'

	-- Exclude any future hires.
	DELETE el
	FROM dbo.U_EORCLDEMTM_EEList el
	INNER JOIN dbo.EmpComp
		ON EecEEID = xEEID
		AND EecCoID = xCoID
		AND EecDateOfLastHire > @EndDate
	;


    --==========================================
    -- Audit Section
    --==========================================
    -- Get data from audit fields table. Add fields here if auditing
    IF OBJECT_ID('U_EORCLDEMTM_AuditFields','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMTM_AuditFields;
    CREATE TABLE dbo.U_EORCLDEMTM_AuditFields (aTableName varchar(30),aFieldName varchar(30));

	INSERT INTO dbo.U_EORCLDEMTM_AuditFields (aTableName, aFieldName)
	VALUES ('EmpComp', 'EecEmplStatus')
	       ,('EmpComp', 'EecDateOfTermination')

    -- Create audit table based on fields defined above
    IF OBJECT_ID('U_EORCLDEMTM_Audit','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMTM_Audit;
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
    INTO dbo.U_EORCLDEMTM_Audit
    FROM dbo.vw_AuditData WITH (NOLOCK) 
    JOIN dbo.U_EORCLDEMTM_AuditFields WITH (NOLOCK) 
        ON audTableName = aTableName
        AND audFieldName = aFieldName
    WHERE audDateTime BETWEEN @StartDate AND @EndDate
    AND audAction <> 'DELETE';

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EORCLDEMTM_Audit ON dbo.U_EORCLDEMTM_Audit (audEEID,audKey2);

    --================
    -- Changes Only
    --================
	-- include recent recent terms only.
    DELETE FROM dbo.U_EORCLDEMTM_EEList
    WHERE NOT EXISTS (SELECT 1 FROM dbo.U_EORCLDEMTM_Audit WHERE audEEID = xEEID AND audRowNo = 1 AND AudNewValue = 'T')
	AND @ExportCode <> 'FULL_XOE';

/***********************************************************************************************************************************
-- Importing appendix files provided by the client for mapping purposes.
-- Run the scripts below if the files need to imported again.

--===================================
-- Mappings Business Units:
--====================================
CREATE TABLE [ULTIPRO_RRCM].[dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] (
    [MapCompanyCode] VARCHAR(10)
    ,[MapCompanyName] VARCHAR(100)
    ,[MapBusinessUnit] VARCHAR(100)
)
BULK INSERT [ULTIPRO_RRCM].[dbo].[U_EORCLDEMNH_Mappings_BusinessUnits]
FROM '\\US.SAAS\Ez\Public\ACC1011\Exports\Oracle\Appendix\Business Unit Mappings.csv'
    WITH
    (
        FIELDTERMINATOR = '|'
        ,ROWTERMINATOR = '\n'
        ,FIRSTROW = 2
    )
-- DROP TABLE [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits]

-- Location's mapping is no longer being used, will keep just incase.
--===================================
-- Mappings Business Locations:
--====================================
CREATE TABLE [ULTIPRO_RRCM].[dbo].[U_EORCLDEMNH_Mappings_Locations] (
    [MapUltiLocCode] VARCHAR(15)
    ,[MapOracleLocCode] VARCHAR(15)
)
BULK INSERT [ULTIPRO_RRCM].[dbo].[U_EORCLDEMNH_Mappings_Locations]
FROM '\\US.SAAS\Ez\Public\ACC1011\Exports\Oracle\Appendix\Location Code Mappings.csv'
    WITH
    (
        FIELDTERMINATOR = '|'
        ,ROWTERMINATOR = '\n'
        ,FIRSTROW = 2
    )
-- DROP TABLE [dbo].[U_EORCLDEMNH_Mappings_Locations]

***********************************************************************************************************************************/

    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_EORCLDEMTM_drvTbl_Terminations_WorkRelationship_D11
    ---------------------------------
    IF OBJECT_ID('U_EORCLDEMTM_drvTbl_Terminations_WorkRelationship_D11','U') IS NOT NULL
        DROP TABLE dbo.U_EORCLDEMTM_drvTbl_Terminations_WorkRelationship_D11;
    SELECT DISTINCT
         drvEEID = xEEID
        ,drvCoID = xCoID
        ,drvInitialSort = EecEmpNo
        ,drvSubSort = ''
        -- standard fields above and additional driver fields below
        ,drvSourceID = CONCAT(RTRIM(LTRIM(EecEmpNo)), '_PERSON_WORKRELATIONSHIP')
        ,drvPersonID = CONCAT(EecEmpNo, '_PERSON')
        ,drvCompanyName = COALESCE(NULLIF(CmpCompanyDBAName, ''), CmpCompanyName)
		,drvEmpNo = EecEmpNo
        ,drvDateOfTermination = CASE WHEN EecEmplStatus = 'T' THEN EecDateOfTermination END
    INTO dbo.U_EORCLDEMTM_drvTbl_Terminations_WorkRelationship_D11
    FROM dbo.U_EORCLDEMTM_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    JOIN dbo.Company WITH (NOLOCK)
        ON CmpCoID = xCoID
	LEFT JOIN [dbo].[U_EORCLDEMNH_Mappings_BusinessUnits] WITH (NOLOCK)
		ON CmpGLSegment = MapCompanyCode
    ;

    --==========================================
    -- Set FileName
    --==========================================
    --IF (dbo.dsi_fnVariable(@FormatCode,'UseFileName') = 'N')
    --BEGIN
    --    UPDATE dbo.U_dsi_Parameters
    --        SET ExportFile = CASE WHEN dbo.dsi_fnVariable(@FormatCode,'Testing') = 'Y' THEN 'Oracle_Terminations_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.csv'
    --                              WHEN @ExportCode LIKE '%TEST%' THEN 'Oracle_Terminations_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.csv'
    --                              ELSE 'Oracle_Terminations_' + CONVERT(VARCHAR(8),GETDATE(),112) + '.csv'
    --                         END
    --    WHERE FormatCode = @FormatCode;
    --END

END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwEORCLDEMTM_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_EORCLDEMTM_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'EORCLDEMTM%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '201908091'
       ,expStartPerControl     = '201908091'
       ,expLastEndPerControl   = '201908169'
       ,expEndPerControl       = '201908169'
WHERE expFormatCode = 'EORCLDEMTM';

**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwEORCLDEMTM_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_EORCLDEMTM_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort