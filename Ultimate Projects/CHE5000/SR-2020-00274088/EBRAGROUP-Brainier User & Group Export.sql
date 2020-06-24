SET NOCOUNT ON;
IF OBJECT_ID('U_EBRAGROUP_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EBRAGROUP_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EBRAGROUP_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EBRAGROUP' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEBRAGROUP_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEBRAGROUP_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EBRAGROUP') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EBRAGROUP];
GO
IF OBJECT_ID('U_EBRAGROUP_File') IS NOT NULL DROP TABLE [dbo].[U_EBRAGROUP_File];
GO
IF OBJECT_ID('U_EBRAGROUP_EEList') IS NOT NULL DROP TABLE [dbo].[U_EBRAGROUP_EEList];
GO
IF OBJECT_ID('U_EBRAGROUP_DrvTbl_D11') IS NOT NULL DROP TABLE [dbo].[U_EBRAGROUP_DrvTbl_D11];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EBRAGROUP';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EBRAGROUP';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EBRAGROUP';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EBRAGROUP';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EBRAGROUP';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCreateTClockBatches,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhRespectZeroPayRate,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhThirdPartyPay) VALUES ('N','C','Y','0','',NULL,'','N','','N','','013010','EMPEXPORT','CDE','EBRAGROUP','Brainier User & Group Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','1000','N','S','N','EBRAGROUP0Z0','N','Jan  1 1900 12:00AM','C','N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"groupCode"','1','(''DA''=''Q,'')','EBRAGROUP0Z0','50','H','01','1',NULL,'groupCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"groupName"','2','(''DA''=''Q,'')','EBRAGROUP0Z0','50','H','01','2',NULL,'groupName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"groupStatus"','3','(''DA''=''Q,'')','EBRAGROUP0Z0','50','H','01','3',NULL,'groupStatus',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"groupType code"','4','(''DA''=''Q,'')','EBRAGROUP0Z0','50','H','01','4',NULL,'groupType code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"s"','5','(''DA''=''Q'')','EBRAGROUP0Z0','50','H','01','5',NULL,'parentGroupCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupCode"','1','(''UA''=''Q,'')','EBRAGROUP0Z0','50','D','11','1',NULL,'groupCode',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupName"','2','(''UA''=''Q,'')','EBRAGROUP0Z0','50','D','11','2',NULL,'groupName',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupStatus"','3','(''UA''=''Q,'')','EBRAGROUP0Z0','50','D','11','3',NULL,'groupStatus',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGroupTypeCode"','4','(''UA''=''Q,'')','EBRAGROUP0Z0','50','D','11','4',NULL,'groupType code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvParentGroupCode"','5','(''UA''=''Q'')','EBRAGROUP0Z0','50','D','11','5',NULL,'parentGroupCode',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
DECLARE @UDSERVER varchar(5) = (SELECT RTRIM(LEFT(@@SERVERNAME,PATINDEX('%[0-9]%',@@SERVERNAME)) + SUBSTRING(@@SERVERNAME,PATINDEX('%UP[0-9]%',@@SERVERNAME)+2,1)));
SELECT @UDSERVER = CASE WHEN @UDSERVER = 'EW21' THEN 'WP6' WHEN @UDSERVER = 'EW22' THEN 'WP7' ELSE @UDSERVER END;
DECLARE @UDCOCODE varchar(5) = (SELECT RTRIM(CmmCompanyCode) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\EBRAGROUP_20200604.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Brainier Group OnDemand','202006049','EMPEXPORT','GROUP_XOE',NULL,'EBRAGROUP',NULL,NULL,NULL,'202006049','Jun  4 2020  5:20PM','Jun  4 2020  5:20PM','202006041',NULL,'','','202006041',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('\\us.saas\[UDENV]\[UDSERVER]\Downloads\V10\Exports\[UDCOCODE]\EmployeeHistoryExport\EBRAGROUP_20200604.txt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Brainier Group Scheduled','202006049','EMPEXPORT','GROUPSCHED',NULL,'EBRAGROUP',NULL,NULL,NULL,'202006049','Jun  4 2020  5:20PM','Jun  4 2020  5:20PM','202006041',NULL,'','','202006041',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
UPDATE dbo.AscExp SET expAscFileName = CASE WHEN LEFT(@UDENV,2) IN ('NW','EW','WP') THEN REPLACE(REPLACE(expAscFileName,'[UDENV]',@UDENV),'[UDSERVER]',@UDSERVER) ELSE '\\us.saas\' + LEFT(@UDENV,2) + '\Public\' + @ARNUM + '\Exports\EBRAGROUP_20200604.txt' END WHERE expFormatCode = 'EBRAGROUP';
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBRAGROUP','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBRAGROUP','ExportPath','V',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBRAGROUP','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBRAGROUP','SubSort','C','drvSubSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBRAGROUP','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBRAGROUP','UseFileName','V','Y');
UPDATE dbo.U_dsi_Configuration SET CfgValue = CASE WHEN CfgName = 'UseFileName' THEN 'Y' ELSE NULL END WHERE FormatCode = 'EBRAGROUP' AND CfgName IN ('UseFileName','ExportPath');
INSERT INTO dbo.CustomTemplates (CreationDate,Engine,EngineCode,IsActive,ModifiedDate) SELECT CreationDate = GETDATE(), Engine = AdhEngine, EngineCode = AdhFormatCode, IsActive = 1, ModifiedDate = GETDATE() FROM dbo.AscDefH WITH (NOLOCK) WHERE AdhFormatCode = 'EBRAGROUP' AND NOT EXISTS(SELECT 1 FROM dbo.CustomTemplates WHERE EngineCode = AdhFormatCode);
IF OBJECT_ID('U_EBRAGROUP_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EBRAGROUP_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EBRAGROUP','D11','dbo.U_EBRAGROUP_DrvTbl_D11',NULL);
IF OBJECT_ID('U_EBRAGROUP_EEList') IS NULL
CREATE TABLE [dbo].[U_EBRAGROUP_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EBRAGROUP_File') IS NULL
CREATE TABLE [dbo].[U_EBRAGROUP_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(1000) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EBRAGROUP]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: Chemtrade Logistics Inc

Created By: Wyle Cordero
Business Analyst: Josh Smith
Create Date: 06/04/2020
Service Request Number: SR-2020-00274088

Purpose: Brainier User & Group Export

Revision History
----------------
Update By           Date           Request Num        Desc
XXXX                XX/XX/2020     SR-2020-000XXXXX   XXXXX

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EBRAGROUP';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EBRAGROUP';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EBRAGROUP';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EBRAGROUP';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EBRAGROUP' ORDER BY RunID DESC;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EBRAGROUP', 'GROUP_XOE';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'EBRAGROUP', @AllObjects = 'Y', @IsWeb = 'Y'
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
    SELECT @FormatCode = 'EBRAGROUP';

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
    DELETE FROM dbo.U_EBRAGROUP_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_EBRAGROUP_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

	-- Include Effective Date of Termination within last 30 days.
	DELETE el
	FROM dbo.U_EBRAGROUP_EEList el
	INNER JOIN dbo.EmpComp
		ON EecEEID = xEEID
		AND EecCoID = xCoID
		AND EecEmplStatus = 'T'
		AND EecDateOfTermination < DATEADD(DAY, -30, @EndDate)
	;

	--==================================
	-- Working Table - Groups
	--==================================
    IF OBJECT_ID('U_EBRAGROUP_Groups','U') IS NOT NULL
        DROP TABLE dbo.U_EBRAGROUP_Groups;
	CREATE TABLE dbo.U_EBRAGROUP_Groups (
		GroupCode VARCHAR(100)
		,GroupName VARCHAR(100)
		,GroupStatus VARCHAR(100)
		,GroupTypeCode VARCHAR(100)
		,ParentGroupCode VARCHAR(100)
		,InitialSort VARCHAR(100)
		,SubSort VARCHAR(100)
	);

	-- Record 1
	INSERT INTO dbo.U_EBRAGROUP_Groups (GroupCode, GroupName, GroupStatus, GroupTypeCode, ParentGroupCode, InitialSort, SubSort)
	SELECT DISTINCT 
		GroupCode = CmpCompanyCode
		,GroupName = CmpCompanyName
		,GroupStatus = 'Active'
		,GroupTypeCode = 'CO'
		,ParentGroupCode = ''
		,InitialSort = '01'
		,SubSort = RIGHT(CONCAT('000', CONVERT(VARCHAR, DENSE_RANK() OVER (ORDER BY CmpCompanyCode))), 3)
	FROM dbo.U_EBRAGROUP_EEList WITH (NOLOCK)
	INNER JOIN dbo.Company WITH (NOLOCK)
		ON CmpCoID = xCoID
	OPTION (FORCE ORDER);

	-- Record 2
	INSERT INTO dbo.U_EBRAGROUP_Groups (GroupCode, GroupName, GroupStatus, GroupTypeCode, ParentGroupCode, InitialSort, SubSort)
	SELECT DISTINCT 
		GroupCode = 'EXTERNAL'
		,GroupName = 'EXTERNAL'
		,GroupStatus = 'Active'
		,GroupTypeCode = 'EXT'
		,ParentGroupCode = 'CO'
		,InitialSort = '02'
		,SubSort = '001'
	FROM dbo.U_EBRAGROUP_EEList WITH (NOLOCK);

	-- Record 3
	INSERT INTO dbo.U_EBRAGROUP_Groups (GroupCode, GroupName, GroupStatus, GroupTypeCode, ParentGroupCode, InitialSort, SubSort)
	SELECT DISTINCT 
		GroupCode = 'INTERNAL'
		,GroupName = 'INTERNAL'
		,GroupStatus = 'Active'
		,GroupTypeCode = 'INT'
		,ParentGroupCode = 'CO'
		,InitialSort = '03'
		,SubSort = '001'
	FROM dbo.U_EBRAGROUP_EEList WITH (NOLOCK);

	-- Record 4
	INSERT INTO dbo.U_EBRAGROUP_Groups (GroupCode, GroupName, GroupStatus, GroupTypeCode, ParentGroupCode, InitialSort, SubSort)
	SELECT DISTINCT 
		GroupCode = LocCode
		,GroupName = LocDesc
		,GroupStatus = CASE WHEN OrgStatus = 'I' THEN 'InActive' ELSE 'Active' END
		,GroupTypeCode = 'LOC'
		,ParentGroupCode = 'INT'
		,InitialSort = '04'
		,SubSort = RIGHT(CONCAT('000', CONVERT(VARCHAR, DENSE_RANK() OVER (ORDER BY LocCode))), 3)
	FROM dbo.U_EBRAGROUP_EEList WITH (NOLOCK)
	INNER JOIN dbo.EmpComp WITH (NOLOCK)
		ON EecEEID = xEEID
		AND EecCoID = xCoID
	INNER JOIN dbo.Location WITH (NOLOCK)
		ON LocCode = EecLocation
	INNER JOIN dbo.OrgLevel WITH (NOLOCK)
		ON OrgCode = EecOrgLvl1
		AND OrgLvl = 1
	OPTION (FORCE ORDER);

	-- Record 5
	INSERT INTO dbo.U_EBRAGROUP_Groups (GroupCode, GroupName, GroupStatus, GroupTypeCode, ParentGroupCode, InitialSort, SubSort)
	SELECT DISTINCT 
		GroupCode = JbcJobFamily
		,GroupName = CodDesc
		,GroupStatus = CASE WHEN LocIsInActive = 'Y' THEN 'InActive' ELSE 'Active' END
		,GroupTypeCode = 'JOBFAMILY'
		,ParentGroupCode = 'INT'
		,InitialSort = '05'
		,SubSort = RIGHT(CONCAT('000', CONVERT(VARCHAR, DENSE_RANK() OVER (ORDER BY JbcJobFamily))), 3)
	FROM dbo.U_EBRAGROUP_EEList WITH (NOLOCK)
	INNER JOIN dbo.EmpComp WITH (NOLOCK)
		ON EecEEID = xEEID
		AND EecCoID = xCoID
	INNER JOIN dbo.JobCode WITH (NOLOCK)
		ON JbcJobCode = EecJobCode
	INNER JOIN dbo.Location WITH (NOLOCK)
		ON LocCode = EecLocation
	INNER JOIN dbo.Codes WITH (NOLOCK)
		ON CodCode = JbcJobFamily
		AND CodTable = 'JOBFAMILY'
	OPTION (FORCE ORDER);

	-- Record 6
	INSERT INTO dbo.U_EBRAGROUP_Groups (GroupCode, GroupName, GroupStatus, GroupTypeCode, ParentGroupCode, InitialSort, SubSort)
	SELECT DISTINCT 
		GroupCode = OrgCode
		,GroupName = OrgDesc
		,GroupStatus = CASE WHEN OrgStatus = 'I' THEN 'InActive' ELSE 'Active' END
		,GroupTypeCode = 'DEPT'
		,ParentGroupCode = 'INT'
		,InitialSort = '06'
		,SubSort = RIGHT(CONCAT('000', CONVERT(VARCHAR, DENSE_RANK() OVER (ORDER BY OrgCode))), 3)
	FROM dbo.U_EBRAGROUP_EEList WITH (NOLOCK)
	INNER JOIN dbo.EmpComp WITH (NOLOCK)
		ON EecEEID = xEEID
		AND EecCoID = xCoID
	INNER JOIN dbo.OrgLevel WITH (NOLOCK)
		ON OrgCode = EecOrgLvl2
		AND OrgLvl = 2
	OPTION (FORCE ORDER);

	-- Record 7
	INSERT INTO dbo.U_EBRAGROUP_Groups (GroupCode, GroupName, GroupStatus, GroupTypeCode, ParentGroupCode, InitialSort, SubSort)
	SELECT DISTINCT 
		GroupCode = OrgCode
		,GroupName = OrgDesc
		,GroupStatus = CASE WHEN OrgStatus = 'I' THEN 'InActive' ELSE 'Active' END
		,GroupTypeCode = 'DIV'
		,ParentGroupCode = 'INT'
		,InitialSort = '07'
		,SubSort = RIGHT(CONCAT('000', CONVERT(VARCHAR, DENSE_RANK() OVER (ORDER BY OrgCode))), 3)
	FROM dbo.U_EBRAGROUP_EEList WITH (NOLOCK)
	INNER JOIN dbo.EmpComp WITH (NOLOCK)
		ON EecEEID = xEEID
		AND EecCoID = xCoID
	INNER JOIN dbo.OrgLevel WITH (NOLOCK)
		ON OrgCode = EecOrgLvl1
		AND OrgLvl = 1
	OPTION (FORCE ORDER);

	-- Record 8
	INSERT INTO dbo.U_EBRAGROUP_Groups (GroupCode, GroupName, GroupStatus, GroupTypeCode, ParentGroupCode, InitialSort, SubSort)
	SELECT DISTINCT 
		GroupCode = JbcJobCode
		,GroupName = JbcDesc
		,GroupStatus = CASE WHEN JbcStatus = 'I' THEN 'InActive' ELSE 'Active' END
		,GroupTypeCode = 'JOB'
		,ParentGroupCode = 'INT'
		,InitialSort = '08'
		,SubSort = RIGHT(CONCAT('000', CONVERT(VARCHAR, DENSE_RANK() OVER (ORDER BY JbcJobCode))), 3)
	FROM dbo.U_EBRAGROUP_EEList WITH (NOLOCK)
	INNER JOIN dbo.EmpComp WITH (NOLOCK)
		ON EecEEID = xEEID
		AND EecCoID = xCoID
	INNER JOIN dbo.JobCode WITH (NOLOCK)
		ON JbcJobCode = EecJobCode
	OPTION (FORCE ORDER);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EBRAGROUP_Groups ON dbo.U_EBRAGROUP_Groups (InitialSort, SubSort);


    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_EBRAGROUP_DrvTbl_D11
    ---------------------------------
    IF OBJECT_ID('U_EBRAGROUP_DrvTbl_D11','U') IS NOT NULL
        DROP TABLE dbo.U_EBRAGROUP_DrvTbl_D11;
    SELECT DISTINCT
        drvInitialSort = InitialSort
		,drvSubSort = SubSort
        -- standard fields above and additional driver fields below
        ,drvGroupCode = GroupCode
        ,drvGroupName = GroupName
        ,drvGroupStatus = GroupStatus
        ,drvGroupTypeCode = GroupTypeCode
        ,drvParentGroupCode = ParentGroupCode
    INTO dbo.U_EBRAGROUP_DrvTbl_D11
    FROM dbo.U_EBRAGROUP_Groups WITH (NOLOCK);

    -- Create Index
    CREATE CLUSTERED INDEX CDX_U_EBRAGROUP_DrvTbl_D11 ON dbo.U_EBRAGROUP_DrvTbl_D11 (drvInitialSort, drvSubSort);


END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwEBRAGROUP_Export AS
    SELECT TOP 20000000 Data FROM dbo.U_EBRAGROUP_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'EBRAGROUP%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '202005281'
       ,expStartPerControl     = '202005281'
       ,expLastEndPerControl   = '202006049'
       ,expEndPerControl       = '202006049'
WHERE expFormatCode = 'EBRAGROUP';

**********************************************************************************/
GO
CREATE VIEW dbo.dsi_vwEBRAGROUP_Export AS 
    SELECT TOP 200000000 Data FROM dbo.U_EBRAGROUP_File WITH (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort