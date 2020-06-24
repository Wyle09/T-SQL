SET NOCOUNT ON;
IF OBJECT_ID('U_EBENSLVCON_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EBENSLVCON_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_EBENSLVCON_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'EBENSLVCON' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwEBENSLVCON_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwEBENSLVCON_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_EBENSLVCON') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EBENSLVCON];
GO
IF OBJECT_ID('U_EBENSLVCON_Trailer') IS NOT NULL DROP TABLE [dbo].[U_EBENSLVCON_Trailer];
GO
IF OBJECT_ID('U_EBENSLVCON_PDedHist') IS NOT NULL DROP TABLE [dbo].[U_EBENSLVCON_PDedHist];
GO
IF OBJECT_ID('U_EBENSLVCON_File') IS NOT NULL DROP TABLE [dbo].[U_EBENSLVCON_File];
GO
IF OBJECT_ID('U_EBENSLVCON_EEList') IS NOT NULL DROP TABLE [dbo].[U_EBENSLVCON_EEList];
GO
IF OBJECT_ID('U_EBENSLVCON_drvTbl') IS NOT NULL DROP TABLE [dbo].[U_EBENSLVCON_drvTbl];
GO
IF OBJECT_ID('U_EBENSLVCON_DedList') IS NOT NULL DROP TABLE [dbo].[U_EBENSLVCON_DedList];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'EBENSLVCON';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'EBENSLVCON';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'EBENSLVCON';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'EBENSLVCON';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'EBENSLVCON';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhRespectZeroPayRate,AdhCreateTClockBatches,AdhThirdPartyPay) VALUES ('N','C','Y','0','','','N','','N','','013010','EMPEXPORT','CDE','EBENSLVCON','SSI Benefit Solver Payroll Contributions Export','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','150','S','N','EBENSLVCONZ0','N','Jan  1 1900 12:00AM','C','N',NULL,'N');
/*01*/ INSERT INTO dbo.CustomTemplates (Engine,EngineCode) SELECT Engine = AdhEngine, EngineCode = AdhFormatCode FROM dbo.AscDefH WITH (NOLOCK) WHERE AdhFormatCode = 'EBENSLVCON' AND AdhEngine = 'EMPEXPORT' AND NOT EXISTS(SELECT 1 FROM dbo.CustomTemplates WHERE EngineCode = AdhFormatCode AND Engine = AdhEngine); /* Insert field into CustomTemplates table */
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"CO CODE"','1','(''DA''=''T,'')','EBENSLVCONZ0','50','H','01','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Employee Number"','2','(''DA''=''T,'')','EBENSLVCONZ0','50','H','01','2',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Code"','3','(''DA''=''T,'')','EBENSLVCONZ0','50','H','01','3',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Amount"','4','(''DA''=''T,'')','EBENSLVCONZ0','50','H','01','4',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Pay Date"','5','(''DA''=''T'')','EBENSLVCONZ0','50','H','01','5',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCoCode"','1','(''UA''=''T,'')','EBENSLVCONZ0','50','D','10','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','2','(''UA''=''T,'')','EBENSLVCONZ0','50','D','10','2',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvCode"','3','(''UA''=''T,'')','EBENSLVCONZ0','50','D','10','3',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAmt"','4','(''UNT2''=''T,'')','EBENSLVCONZ0','50','D','10','4',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPayDate"','5','(''UD101''=''T'')','EBENSLVCONZ0','50','D','10','5',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvGrandTotal"','1','(''UA''=''T,'')','EBENSLVCONZ0','50','T','90','1',NULL,NULL,NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvTotAmt"','2','(''UNT2''=''T'')','EBENSLVCONZ0','50','T','90','2',NULL,NULL,NULL,NULL);
/*01*/ DECLARE @COUNTRY char(2) = (SELECT CASE WHEN LEFT(@@SERVERNAME,1) = 'T' THEN 'ca' ELSE 'us' END);
/*02*/ DECLARE @SERVER varchar(6) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' WHEN LEFT(@@SERVERNAME,2) IN ('NW','EW','WP') THEN LEFT(@@SERVERNAME,3) ELSE LEFT(@@SERVERNAME,2) END);
/*03*/ SET @SERVER = CASE WHEN LEFT(@@SERVERNAME,2) IN ('NZ','EZ') THEN @SERVER + '\' + LEFT(@@SERVERNAME,3) ELSE @SERVER END;
/*04*/ DECLARE @UDARNUM varchar(10) = (SELECT LTRIM(RTRIM(CmmContractNo)) FROM dbo.CompMast);
/*05*/ DECLARE @ENVIRONMENT varchar(7) = (SELECT CASE WHEN SUBSTRING(@@SERVERNAME,3,1) = 'D' THEN @UDARNUM WHEN SUBSTRING(@@SERVERNAME,4,1) = 'D' THEN LEFT(@@SERVERNAME,3) + 'Z' ELSE RTRIM(LEFT(@@SERVERNAME,PATINDEX('%[0-9]%',@@SERVERNAME)) + SUBSTRING(@@SERVERNAME,PATINDEX('%UP[0-9]%',@@SERVERNAME)+2,1)) END);
/*06*/ SET @ENVIRONMENT = CASE WHEN @ENVIRONMENT = 'EW21' THEN 'WP6' WHEN @ENVIRONMENT = 'EW22' THEN 'WP7' ELSE @ENVIRONMENT END;
/*07*/ DECLARE @COCODE varchar(5) = (SELECT RTRIM(CmmCompanyCode) FROM dbo.CompMast);
/*08*/ DECLARE @FILENAME varchar(1000) = 'EBENSLVCON_20200424.txt';
/*09*/ DECLARE @FILEPATH varchar(1000) = '\\' + @COUNTRY + '.saas\' + @SERVER + '\' + @ENVIRONMENT + '\Downloads\V10\Exports\' + @COCODE + '\EmployeeHistoryExport\';
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('File Name is Auto Generated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'SSI Benefit Solver OnDemand','202004159','EMPEXPORT','ONDMD_XOE',NULL,'EBENSLVCON',NULL,NULL,NULL,'202004159','Apr 15 2020  3:23PM','Apr 15 2020  3:23PM','202004151',NULL,'EecPayGroup','ROAKB,SSI1B,SSI2B','202004151',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBENSLVCON','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBENSLVCON','ExportPath','V',NULL);
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBENSLVCON','InitialSort','C','drvInitialSort');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBENSLVCON','SubSort','C','drvEmpNo');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBENSLVCON','Testing','V','N');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('EBENSLVCON','UseFileName','V','Y');
/*01*/ UPDATE dbo.U_dsi_Configuration SET CfgValue = NULL WHERE FormatCode = 'EBENSLVCON' AND CfgName LIKE '%Path' AND CfgType = 'V'; /* Set paths to NULL for Web Exports */
/*02*/ UPDATE dbo.U_dsi_Configuration SET CfgValue = 'Y'  WHERE FormatCode = 'EBENSLVCON' AND CfgName = 'UseFileName'; /* Set UseFileName to 'Y' for Web Exports */
IF OBJECT_ID('U_EBENSLVCON_SavePath') IS NOT NULL DROP TABLE [dbo].[U_EBENSLVCON_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EBENSLVCON','H01','None',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EBENSLVCON','D10','dbo.U_EBENSLVCON_drvTbl',NULL);
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('EBENSLVCON','T90','dbo.U_EBENSLVCON_Trailer',NULL);
IF OBJECT_ID('U_EBENSLVCON_DedList') IS NULL
CREATE TABLE [dbo].[U_EBENSLVCON_DedList] (
    [DedCode] char(5) NOT NULL,
    [DedType] char(4) NOT NULL
);
IF OBJECT_ID('U_EBENSLVCON_EEList') IS NULL
CREATE TABLE [dbo].[U_EBENSLVCON_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_EBENSLVCON_File') IS NULL
CREATE TABLE [dbo].[U_EBENSLVCON_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(150) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_EBENSLVCON]
    @SystemID char(12)
AS
SET NOCOUNT ON;
/**********************************************************************************
Client Name: Samsung Electronics

Created By: Wyle Cordero
Business Analyst: Lindsay Wright
Create Date: 04/24/2020
Service Request Number: SR-2020-00273005

Notes: Copied from SR-2019-00254623

Purpose: BenifitSolver Payroll Deduction Export

Revision History
----------------
Update By           Date           Request Num        Desc

SELECT * FROM dbo.U_dsi_Configuration WHERE FormatCode = 'EBENSLVCON';
SELECT * FROM dbo.U_dsi_SqlClauses WHERE FormatCode = 'EBENSLVCON';
SELECT * FROM dbo.U_dsi_Parameters WHERE FormatCode = 'EBENSLVCON';
SELECT ExpFormatCode, ExpExportCode, ExpStartPerControl, ExpEndPerControl,* FROM dbo.AscExp WHERE expFormatCode = 'EBENSLVCON';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'EBENSLVCON' ORDER BY RunID DESC;

Execute Export
--------------
EXEC dbo.dsi_sp_TestSwitchbox_v2 'EBENSLVCON', 'ONDMD_XOE';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'EBENSLVCON', @AllObjects = 'Y', @IsWeb = 'Y'
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
    SELECT @FormatCode = 'EBENSLVCON';

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
    DELETE FROM dbo.U_EBENSLVCON_EEList
    WHERE xCoID <> dbo.dsi_BDM_fn_GetCurrentCOID(xEEID)
    AND xEEID IN (SELECT xEEID FROM dbo.U_EBENSLVCON_EEList GROUP BY xEEID HAVING COUNT(1) > 1);

    --==========================================
    -- Create Deduction List
    --==========================================
    DECLARE @DedList VARCHAR(MAX)
    SET @DedList = 'UDCMP,UDCMT,UDDEN,UDDPT,UDFDC,UDFLM,UDFMD,UDMDP,UDMED,UDPRK,UDPRP,UDVAD,UDVIS,UDVPD,UDVTC,UDVTE,UDVTS,UEHER,UEDOM'

    IF OBJECT_ID('U_EBENSLVCON_DedList','U') IS NOT NULL
        DROP TABLE dbo.U_EBENSLVCON_DedList;
    SELECT DISTINCT
         DedCode = DedDedCode
        ,DedType = DedDedType
    INTO dbo.U_EBENSLVCON_DedList
    FROM dbo.fn_ListToTable(@DedList)
    JOIN dbo.DedCode WITH (NOLOCK)
        ON DedDedCode = Item;

    --==========================================
    -- Build Working Tables
    --==========================================

    -----------------------------
    -- Working Table - PDedHist
    -----------------------------
    IF OBJECT_ID('U_EBENSLVCON_PDedHist','U') IS NOT NULL
        DROP TABLE dbo.U_EBENSLVCON_PDedHist;
    SELECT DISTINCT
        PdhEEID
        ,PdhDedCode
        ,PdhPerControl = MAX(LEFT(PdhPerControl,8))
        ,PdhPayDate = MAX(PrgPayDate)
        -- Current Payroll Amounts
        ,PdhEECurAmt = SUM(COALESCE(PdhEECurAmt, 0.00))
    INTO dbo.U_EBENSLVCON_PDedHist
    FROM dbo.U_EBENSLVCON_EEList WITH (NOLOCK)
    JOIN dbo.PDedHist WITH (NOLOCK)
        ON pdheeid = xeeid
        AND pdhcoid = xcoid
    JOIN dbo.U_EBENSLVCON_DedList WITH (NOLOCK)
        ON DedCode = PdhDedCode
    JOIN dbo.PayReg WITH (NOLOCK)
        ON PdhGenNumber = PrgGenNumber
    WHERE PdhPerControl BETWEEN @StartPerControl AND @EndPerControl
    GROUP BY PdhEEID, PdhDedCode
    ;

    --==========================================
    -- Build Driver Tables
    --==========================================
    ---------------------------------
    -- DETAIL RECORD - U_EBENSLVCON_drvTbl - Deduction Records
    ---------------------------------
    IF OBJECT_ID('U_EBENSLVCON_drvTbl','U') IS NOT NULL
        DROP TABLE dbo.U_EBENSLVCON_drvTbl;
    SELECT DISTINCT
         drvInitialSort = EecEmpNo
        ,drvEEID = xEEID
        ,drvCoID = xCoID
        -- standard fields above and additional driver fields below
        ,drvCoCode = CmpCompanyCode
        ,drvEmpNo = EecEmpNo
        ,drvCode = PdhDedCode
        ,drvAmt = PdhEECurAmt
        ,drvPayDate = PdhPayDate
    INTO dbo.U_EBENSLVCON_drvTbl
    FROM dbo.U_EBENSLVCON_EEList WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = xEEID 
        AND EecCoID = xCoID
    INNER JOIN dbo.Company WITH (NOLOCK)
        ON CmpCOID = xCOID
    JOIN dbo.U_EBENSLVCON_PDedHist WITH (NOLOCK)
        ON pdheeid = xeeid
    ;

    ---------------------------------
    -- TRAILER RECORD
    ---------------------------------
    IF OBJECT_ID('U_EBENSLVCON_Trailer','U') IS NOT NULL
        DROP TABLE dbo.U_EBENSLVCON_Trailer;
    SELECT DISTINCT
         drvGrandTotal = 'Total'
        ,drvTotAmt = (SELECT SUM(drvAmt) FROM dbo.U_EBENSLVCON_drvTbl)
    INTO dbo.U_EBENSLVCON_Trailer
    ;

END;
/**********************************************************************************

--Alter the View
ALTER VIEW dbo.dsi_vwEBENSLVCON_Export AS
    SELECT TOP 20000000 Data
    FROM dbo.U_EBENSLVCON_File (NOLOCK)
    ORDER BY RIGHT(RecordSet,2), InitialSort, SubSort;

--Check out AscDefF
SELECT * FROM dbo.AscDefF
WHERE AdfHeaderSystemID LIKE 'EBENSLVCON%'
ORDER BY AdfSetNumber, AdfFieldNumber;

--Update Dates
UPDATE dbo.AscExp
    SET expLastStartPerControl = '201911271'
       ,expStartPerControl     = '201911271'
       ,expLastEndPerControl   = '201911279'
       ,expEndPerControl       = '201911279'
WHERE expFormatCode = 'EBENSLVCON';

**********************************************************************************/
GO
Create View dbo.dsi_vwEBENSLVCON_Export as
    select top 200000000 Data from dbo.U_EBENSLVCON_File with (nolock)
    order by substring(RecordSet,2,2), InitialSort, SubSort
