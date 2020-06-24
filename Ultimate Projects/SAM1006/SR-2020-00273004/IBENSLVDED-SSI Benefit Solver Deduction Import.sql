SET NOCOUNT ON;
IF OBJECT_ID('U_IBENSLVDED_SavePath') IS NOT NULL DROP TABLE [dbo].[U_IBENSLVDED_SavePath];
SELECT FormatCode svFormatCode, CfgName svCfgName, CfgValue svCfgValue INTO dbo.U_IBENSLVDED_SavePath FROM dbo.U_dsi_Configuration WITH (NOLOCK) WHERE FormatCode = 'IBENSLVDED' AND CfgName LIKE '%Path';
IF OBJECT_ID('dsi_vwIBENSLVDED_Export') IS NOT NULL DROP VIEW [dbo].[dsi_vwIBENSLVDED_Export];
GO
IF OBJECT_ID('dsi_sp_BuildDriverTables_IBENSLVDED') IS NOT NULL DROP PROCEDURE [dbo].[dsi_sp_BuildDriverTables_IBENSLVDED];
GO
IF OBJECT_ID('U_IBENSLVDED_Raw') IS NOT NULL DROP TABLE [dbo].[U_IBENSLVDED_Raw];
GO
IF OBJECT_ID('U_IBENSLVDED_Import') IS NOT NULL DROP TABLE [dbo].[U_IBENSLVDED_Import];
GO
IF OBJECT_ID('U_IBENSLVDED_File') IS NOT NULL DROP TABLE [dbo].[U_IBENSLVDED_File];
GO
IF OBJECT_ID('U_IBENSLVDED_EEList') IS NOT NULL DROP TABLE [dbo].[U_IBENSLVDED_EEList];
GO
IF OBJECT_ID('U_IBENSLVDED_drvTbl') IS NOT NULL DROP TABLE [dbo].[U_IBENSLVDED_drvTbl];
GO
DELETE [dbo].[U_dsi_SQLClauses] FROM [dbo].[U_dsi_SQLClauses] WHERE FormatCode = 'IBENSLVDED';
DELETE [dbo].[U_dsi_Configuration] FROM [dbo].[U_dsi_Configuration] WHERE FormatCode = 'IBENSLVDED';
DELETE [dbo].[AscImp] FROM [dbo].[AscImp] WHERE impFormatCode = 'IBENSLVDED';
DELETE [dbo].[AscExp] FROM [dbo].[AscExp] WHERE expFormatCode = 'IBENSLVDED';
DELETE [dbo].[AscDefF] FROM [dbo].[AscDefF] JOIN AscDefH ON AdfHeaderSystemID = AdhSystemID WHERE AdhFormatCode = 'IBENSLVDED';
DELETE [dbo].[AscDefH] FROM [dbo].[AscDefH] WHERE AdhFormatCode = 'IBENSLVDED';
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhRespectZeroPayRate,AdhCreateTClockBatches,AdhThirdPartyPay) VALUES ('N',NULL,'Y','0',NULL,NULL,'N',NULL,'N','E','013010','BENEFITIMP','SDF','IBENSLVDED','SSI Benefit Solver Deduction Import','N','I','FORM_ASCIIIMPORTBENEFITS','N','N',dbo.fn_GetTimedKey(),'D',NULL,NULL,'S','N','IBENSLVDEDZ1','N',NULL,'N','N',NULL,'N');
INSERT INTO [dbo].[AscDefH] (AdhAccrCodesUsed,AdhAggregateAtLevel,AdhAuditStaticFields,AdhChildTable,AdhClientTableList,AdhCustomDLLFileName,AdhDedCodesUsed,AdhDelimiter,AdhEarnCodesUsed,AdhEEIdentifier,AdhEndOfRecord,AdhEngine,AdhFileFormat,AdhFormatCode,AdhFormatName,AdhFundCodesUsed,AdhImportExport,AdhInputFormName,AdhIsAuditFormat,AdhIsSQLExport,AdhModifyStamp,AdhOutputMediaType,AdhPreProcessSQL,AdhRecordSize,AdhSortBy,AdhSysFormat,AdhSystemID,AdhTaxCodesUsed,AdhYearStartFixedDate,AdhYearStartOption,AdhRespectZeroPayRate,AdhCreateTClockBatches,AdhThirdPartyPay) VALUES ('N','C','Y','0','','','N','','N','','013010','EMPEXPORT','CDE','IBENSLVDED','SSI Benefit Solver Deduction Import','N','E','FORM_EMPEXPORT','N','C',dbo.fn_GetTimedKey(),'D','dbo.dsi_sp_Switchbox_v2','2000','S','N','IBENSLVDEDZ0','N','Jan  1 1900 12:00AM','C','N',NULL,'N');
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"CO CODE"','1','(''DA''=''T,'')','IBENSLVDEDZ0','30','H','01','1',NULL,'Employee Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"File Number #"','2','(''DA''=''T,'')','IBENSLVDEDZ0','30','H','01','2',NULL,'Social Security Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Ded Code"','3','(''DA''=''T,'')','IBENSLVDEDZ0','30','H','01','3',NULL,'Deduction Plan Code',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Amount"','4','(''DA''=''T,'')','IBENSLVDEDZ0','30','H','01','4',NULL,'Benefit Status',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Pay Date"','5','(''DA''=''T,'')','IBENSLVDEDZ0','30','H','01','5',NULL,'Benefit Status Start Date',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"Message"','6','(''DA''=''T'')','IBENSLVDEDZ0','30','H','01','22',NULL,'Error',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"iCoCode"','1','(''UA''=''T,'')','IBENSLVDEDZ0','50','D','11','2',NULL,'Employee Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvEmpNo"','2','(''UA''=''T,'')','IBENSLVDEDZ0','50','D','11','2',NULL,'Employee Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvDedCode"','3','(''UA''=''T,'')','IBENSLVDEDZ0','50','D','11','2',NULL,'Employee Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvAmt"','4','(''UA''=''T,'')','IBENSLVDEDZ0','50','D','11','2',NULL,'Employee Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"drvPayDate"','5','(''UA''=''T,'')','IBENSLVDEDZ0','50','D','11','2',NULL,'Employee Number',NULL,NULL);
INSERT INTO [dbo].[AscDefF] (AdfExpression,AdfFieldNumber,AdfForCond,AdfHeaderSystemID,AdfLen,AdfRecType,AdfSetNumber,AdfStartPos,AdfTableName,AdfTargetField,AdfVariableName,AdfVariableType) VALUES ('"DrvError"','22','(''UA''=''T'')','IBENSLVDEDZ0','500','D','11','22',NULL,'Error',NULL,NULL);
DECLARE @UDENV varchar(3) = (SELECT CASE WHEN LEFT(@@SERVERNAME,3) IN ('WP1','WP2','WP3','WP4','WP5') THEN 'WP' ELSE LEFT(@@SERVERNAME,3) END);
DECLARE @ARNUM varchar(12) = (SELECT RTRIM(CmmContractNo) FROM dbo.CompMast);
DECLARE @UDSERVER varchar(5) = (SELECT RTRIM(LEFT(@@SERVERNAME,PATINDEX('%[0-9]%',@@SERVERNAME)) + SUBSTRING(@@SERVERNAME,PATINDEX('%UP[0-9]%',@@SERVERNAME)+2,1)));
SELECT @UDSERVER = CASE WHEN @UDSERVER = 'EW21' THEN 'WP6' WHEN @UDSERVER = 'EW22' THEN 'WP7' ELSE @UDSERVER END;
DECLARE @UDCOCODE varchar(5) = (SELECT RTRIM(CmmCompanyCode) FROM dbo.CompMast);
INSERT INTO [dbo].[AscExp] (expAscFileName,expAsOfDate,expCOID,expCOIDAllCompanies,expCOIDList,expDateOrPerControl,expDateTimeRangeEnd,expDateTimeRangeStart,expDesc,expEndPerControl,expEngine,expExportCode,expExported,expFormatCode,expGLCodeTypes,expGLCodeTypesAll,expGroupBy,expLastEndPerControl,expLastPayDate,expLastPeriodEndDate,expLastStartPerControl,expNoOfRecords,expSelectByField,expSelectByList,expStartPerControl,expSystemID,expTaxCalcGroupID,expUser,expIEXSystemID) VALUES ('SSI-Bi-Weekly Sample Payroll Output - Copy.csv',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'SSI Benefit Solver OnDemand','201701019','EMPEXPORT','IMPORT','May 26 2020 12:05PM','IBENSLVDED',NULL,NULL,NULL,'201701019','Jan  1 2017 12:00AM','Dec 30 1899 12:00AM','201701011','17','','','201701011',dbo.fn_GetTimedKey(),NULL,'ULTI',NULL);
INSERT INTO [dbo].[AscImp] (impCOID,impDateAccruedThru,impDateOfRollover,impDatePendingMoved,impDesc,impEEIdentifier,impEngine,impExceptions,impFormatCode,impImportCode,impImported,impPayPeriodID,impPosted,impReset,impSessionType,impSource,impSystemID,impUser,impValid,impVerified) VALUES ('QB1Z7',NULL,NULL,NULL,'SSI Benefit Solver Import','E','BENEFITIMP','0','IBENSLVDED','IBENSLVDED',NULL,NULL,'May  1 2020 11:23AM','May 26 2020 12:15PM',NULL,'VALIDATE / POST / RESET ONLY (DO NOT CLICK IMPORT)',dbo.fn_GetTimedKey(),'ULTI','0','May 26 2020 12:05PM');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('IBENSLVDED','ArchivePath','V','\\us.saas\nz\Public\SAM1006\Import\SSI\BenefitsSolver\archive\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('IBENSLVDED','EEList','V','Y');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('IBENSLVDED','ExportPath','V','\\us.saas\nz\Public\SAM1006\Import\SSI\BenefitsSolver\logs\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('IBENSLVDED','ImportPath','V','\\us.saas\nz\Public\SAM1006\Import\SSI\BenefitsSolver\');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('IBENSLVDED','InitialSort','C','DrvEmpNo');
INSERT INTO [dbo].[U_dsi_Configuration] (FormatCode,CfgName,CfgType,CfgValue) VALUES ('IBENSLVDED','UseFileName','V','N');
IF OBJECT_ID('U_IBENSLVDED_SavePath') IS NOT NULL DROP TABLE [dbo].[U_IBENSLVDED_SavePath];
GO
INSERT INTO [dbo].[U_dsi_SQLClauses] (FormatCode,RecordSet,FromClause,WhereClause) VALUES ('IBENSLVDED','D11','dbo.U_IBENSLVDED_drvTbl',NULL);
IF OBJECT_ID('U_IBENSLVDED_drvTbl') IS NULL
CREATE TABLE [dbo].[U_IBENSLVDED_drvTbl] (
    [drvSurrogateKey] varchar(50) NULL,
    [drvEmployeeName] varchar(100) NULL,
    [drvCompanyCode] varchar(50) NULL,
    [drvEmployeeNumber] varchar(50) NULL,
    [DrvEmpNo] char(9) NULL,
    [DrvSSN] char(9) NULL,
    [DrvBenStat] char(1) NULL,
    [DrvBenStatStart] datetime NULL,
    [DrvBenStart] datetime NULL,
    [DrvBenStop] datetime NULL,
    [DrvDedStart] datetime NULL,
    [DrvDedStop] datetime NULL,
    [DrvChangRsn] char(5) NULL,
    [DrvDedCode] char(6) NULL,
    [DrvAmt] money NULL,
    [DrvPayDate] char(10) NULL,
    [iTypeIdentifier] char(1) NULL,
    [idedearnstatus] char(1) NULL,
    [iPendingUpdateID] char(20) NULL,
    [iCoCode] char(5) NULL,
    [iEecCoID] char(5) NULL,
    [iEecEEID] char(12) NULL,
    [DrvError] varchar(500) NULL DEFAULT (NULL),
    [DrvEarnExists] bit NULL,
    [drvAction] varchar(50) NULL,
    [drvImported] tinyint NOT NULL DEFAULT ((0)),
    [drvEEID] varchar(12) NULL,
    [drvCOID] varchar(5) NULL,
    [drvImportType] varchar(50) NULL,
    [drvPeriodStartDate] varchar(20) NULL,
    [drvPendingUpdateID] char(20) NULL,
    [drvInitialSort] varchar(50) NULL,
    [irecno] int IDENTITY(1,1) NOT NULL
);
IF OBJECT_ID('U_IBENSLVDED_EEList') IS NULL
CREATE TABLE [dbo].[U_IBENSLVDED_EEList] (
    [xCOID] char(5) NULL,
    [xEEID] char(12) NULL
);
IF OBJECT_ID('U_IBENSLVDED_File') IS NULL
CREATE TABLE [dbo].[U_IBENSLVDED_File] (
    [RecordSet] char(3) NOT NULL,
    [InitialSort] varchar(100) NOT NULL,
    [SubSort] varchar(100) NOT NULL,
    [SubSort2] varchar(100) NULL,
    [SubSort3] varchar(100) NULL,
    [Data] varchar(500) NULL
);
IF OBJECT_ID('U_IBENSLVDED_Import') IS NULL
CREATE TABLE [dbo].[U_IBENSLVDED_Import] (
    [RowNo] int NOT NULL,
    [FileName] varchar(max) NULL,
    [EEID] char(12) NULL,
    [COID] char(5) NULL,
    [RunID] varchar(50) NULL,
    [Error] varchar(250) NULL,
    [PayPeriodStartDate] datetime NULL,
    [PayPeriodEndDate] datetime NULL,
    [PriorPayPeriodStartDate] datetime NULL,
    [PriorPayPeriodEndDate] datetime NULL,
    [NextPayPeriodStartDate] datetime NULL,
    [NextPayPeriodEndDate] datetime NULL,
    [CompanyCode] varchar(100) NULL,
    [EmployeeNo] varchar(10) NULL,
    [EmployeeName] varchar(250) NULL,
    [Field1] varchar(max) NULL,
    [Field2] varchar(max) NULL,
    [Field3] varchar(max) NULL,
    [Field4] varchar(max) NULL,
    [Field5] varchar(max) NULL,
    [UDField1] varchar(250) NULL,
    [UDField2] varchar(250) NULL,
    [UDField3] varchar(250) NULL,
    [UDField4] varchar(250) NULL,
    [UDField5] varchar(250) NULL
);
IF OBJECT_ID('U_IBENSLVDED_Raw') IS NULL
CREATE TABLE [dbo].[U_IBENSLVDED_Raw] (
    [Field1] varchar(max) NULL,
    [Field2] varchar(max) NULL,
    [Field3] varchar(max) NULL,
    [Field4] varchar(max) NULL,
    [Field5] varchar(max) NULL,
    [RowNo] int IDENTITY(1,1) NOT NULL,
    [RunID] varchar(50) NULL,
    [FileName] varchar(max) NULL
);
GO
CREATE PROCEDURE [dbo].[dsi_sp_BuildDriverTables_IBENSLVDED]
     @SystemID  VARCHAR(15) = NULL

AS

/************************************************************
Client Name: Samsung Electronics

Created By: Mike Fitzpatrick
Business Analyst: Lindsay Wright
Create Date: 12/20/2019
Service Request Number: SR-2017-00254623

Purpose: Beneifts Solver Changes Import

Revision History
-----------------
Update By       Date        CP Num              Desc
Wyle Cordero	04/23/2020	SR-2020-00273004	Creating import for Company SSI based of exiting import.


SELECT * FROM U_dsi_Configuration WHERE FormatCode = 'IBENSLVDED'
SELECT * FROM U_dsi_Parameters WHERE FormatCode = 'IBENSLVDED';
SELECT * FROM U_dsi_SqlClauses WHERE FormatCode = 'IBENSLVDED';
SELECT * FROM dbo.U_dsi_InterfaceActivityLog WHERE FormatCode = 'IBENSLVDED' ORDER BY RunID DESC;

EXEC dbo.dsi_sp_TestSwitchbox_v2 'IBENSLVDED', 'IMPORT';

EXEC dbo._dsi_usp_ExportRipOut @FormatCode = 'IBENSLVDED', @AllObjects = 'Y', @IsWeb = 'N';
************************************************************/
begin

    --========================================
    -- Declare Variables
    --========================================
    DECLARE  @FormatCode VARCHAR(10)
            ,@ImportPath VARCHAR(1000)
            ,@FileName VARCHAR(1000)
            ,@ExportCode VARCHAR(12)
            ,@EnableStandardWebImport CHAR(1);

    SET @FormatCode = 'IBENSLVDED';
    --SELECT dbo.dsi_fnVariable(@FormatCode,'UseFileName')
    SET @ExportCode = (SELECT ExportCode FROM dbo.U_dsi_Parameters (NOLOCK) WHERE FormatCode = @FormatCode);
    --Set directory and filename where import file is located
    SET @ImportPath = dbo.Dsi_fnVariable(@FormatCode,'ImportPath');
    SET @FileName = (SELECT expAscFileName FROM dbo.AscExp WHERE expFormatCode = @FormatCode AND expExportCode = @ExportCode);

    --==================================================
    -- Set FileName
    --==================================================
    UPDATE dbo.U_dsi_Parameters
    SET ExportFile = CONCAT('BenefitSolver_SSI_LogFile_', FORMAT(GETDATE(), 'yyyyMMdd'), '.csv')
    WHERE FormatCode = @FormatCode;

    -----------
    -- Check to see if import filename is not NULL AND if the file exists
    -----------
    if object_id('U_IBENSLVDED_drvTbl') IS NULL
    BEGIN
        --drop table dbo.U_IBENSLVDED_drvTbl;
        create table dbo.U_IBENSLVDED_drvTbl(
            drvSurrogateKey VARCHAR(50) NULL,
            drvEmployeeName VARCHAR(100) NULL,
            drvCompanyCode VARCHAR(50) NULL,
            drvEmployeeNumber VARCHAR(50) NULL,
            DrvEmpNo         char(9),
            DrvSSN           char(9),
            DrvBenStat       char(1),
            DrvBenStatStart  datetime,
            DrvBenStart      datetime,
            DrvBenStop       datetime,
            DrvDedStart      datetime,
            DrvDedStop       datetime,
            DrvChangRsn      char(5),
            DrvDedCode       char(6),
            DrvAmt           money,
            DrvPayDate       Char(10),
            iTypeIdentifier  char(1),
            idedearnstatus   char(1),
            iPendingUpdateID char(20),
            iCoCode          char(5),
            iEecCoID         char(5),
            iEecEEID         char(12),
            DrvError         varchar(500) DEFAULT NULL,
            DrvEarnExists    bit,
            drvAction         VARCHAR(50) NULL,
            drvImported         TINYINT DEFAULT 0 NOT NULL,
            drvEEID             VARCHAR(12) NULL,
            drvCOID             VARCHAR(5) NULL,
            drvImportType     VARCHAR(50) NULL,
            drvPeriodStartDate VARCHAR(20) NULL,
            drvPendingUpdateID CHAR(20) NULL,
            drvInitialSort     VARCHAR(50) NULL,
            irecno           int IDENTITY(1,1)
        );
    END
    ELSE
    BEGIN
        DELETE FROM dbo.U_IBENSLVDED_drvTbl;
    END

    --========================================
    -- Benefit Import Module (BIM) Code
    --========================================
    BEGIN TRY
        DELETE FROM dbo.U_dsi_BIM_Configuration WHERE FormatCode = @FormatCode;
        INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1) VALUES (@FormatCode,'RunID','DEDUCTION');
        INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1) VALUES (@FormatCode,'FilePath',@ImportPath);
        INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1) VALUES (@FormatCode,'FileName',@FileName);
		INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1) VALUES (@FormatCode,'ArchiveFiles','Y');
        INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1,ParmValue2) VALUES (@FormatCode,'FileFormat','Delimited', ',');
        INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1) VALUES (@FormatCode,'FieldCount','5');
        INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1,ParmValue2) VALUES (@FormatCode,'KeyEEID','Field2','Employee#');
		INSERT INTO dbo.U_dsi_BIM_Configuration (FormatCode,ParmName,ParmValue1) VALUES (@FormatCode,'PayrollType','Regular'); --Regular --PayGroup --Non-Closed --Non-Opened

        EXEC dbo.dsi_BIM_sp_PopulateImportTable @FormatCode;

        ----------------------------------------------------------

        -- Remove Header Record - Only Retain Details
        ----------------------------------------------------------
        DELETE FROM dbo.U_IBENSLVDED_Import WHERE RunID = 'DEDUCTION' AND ISNULL(Field1,'') IN ('CO CODE') AND ISNULL(Error,'') = '';
    END TRY
    BEGIN CATCH
       -- Report SQL Error in Error Report File
       INSERT INTO dbo.U_IBENSLVDED_drvTbl (drvError)
       SELECT 'Error Processing Delimited File (BIM): ' + ISNULL(ERROR_MESSAGE(),'');

       -- Stop Processing
       RETURN;
    END CATCH;

    --========================================
    -- Build Driver Table - Error Report
    --========================================
    BEGIN TRY
        --Move Staging data to Import Table
        INSERT INTO dbo.U_IBENSLVDED_drvTbl(drvSurrogateKey,drvEmployeeName,drvEmployeeNumber,DrvEmpNo,DrvSSN,
                                            DrvBenStat,DrvBenStatStart,DrvBenStart,DrvBenStop,DrvDedStart,
                                            DrvDedStop,DrvChangRsn,DrvDedCode,DrvAmt,DrvPayDate,iTypeIdentifier,
                                            idedearnstatus,iPendingUpdateID,drvPendingUpdateID,iCoCode,iEecCoID,iEecEEID,
                                            DrvEarnExists,drvAction,drvError,drvImported,drvEEID,drvCOID,
                                            drvImportType,drvPeriodStartDate,drvInitialSort)
        SELECT
            drvSurrogateKey = RTRIM(EecEEID) + RTRIM(EecCOID) + RTRIM(DedDedCode),
            drvEmployeeName = RTRIM(EepNameFirst) + SPACE(1) + EepNameLast,
            drvEmployeeNumber = NULLIF(Field2,''),
            DrvEmpNo         = right('00000000'+ Field2,8),
            DrvSSN           = '',
            DrvBenStat       = 'A',
            DrvBenStatStart  = NULL,
            DrvBenStart      = NULL,
            DrvBenStop       = NULL,
            DrvDedStart      = NULL,
            DrvDedStop       = NULL,
            DrvChangRsn      = NULL,
            --DrvDedCode       = dbo.dsi_BDM_fn_ParseSubField(RawData,',',3),
            --DrvAmt           = dbo.dsi_BDM_fn_ParseSubField(RawData,',',4),
            DrvDedCode       = Field3,
            DrvAmt           = Field4,
            DrvPayDate         = Convert(varchar,Field5,101),
            iTypeIdentifier  = '',
            idedearnstatus   = '',
            iPendingUpdateID = 'IBEN' + dbo.fn_GetTimedKey(),
            drvPendingUpdateID = 'IBEN' + dbo.fn_GetTimedKey(),
            iCoCode          = Field1,
            iEecCoID         = '',
            iEecEEID         = '',
            --DrvError         = '',
            DrvEarnExists    = 0,
            drvAction = CASE WHEN EecEEID IS NULL THEN 'REJECTED' -- Unable to match [Employee Number] in file
                                WHEN EecEmplStatus = 'T' THEN 'REJECTED' -- Terminated Employee
                                WHEN RunID = 'DEDUCTION' AND DedDedCode IS NULL THEN 'REJECTED' --[Deduction Code] Not Setup in UltiPro
                                -- Process Stops for Deductions
                                WHEN CONVERT(MONEY,Field4) = 0.00 THEN
                                    CASE WHEN EedDedCode IS NOT NULL THEN 'STOP'
                                            ELSE 'REJECTED' -- No Benefit Plan for Employee to Stop
                                    END
                                -- Process Add/Change/Restarts
                                WHEN EedDedCode IS NOT NULL THEN
                                    CASE WHEN COALESCE(EedStopDate,EedBenStopDate) IS NOT NULL THEN 'RESTART'
                                            ELSE 'CHANGE'
                                    END
                                ELSE 'ADD'
                            END,
            drvError = CASE WHEN EecEEID IS NULL THEN 'Record Rejected: Unable to match [Employee Number] in file to Employee in UltiPro.'
                                WHEN EecCOID IS NULL THEN 'Record Rejected: Unable to match [Company Code] in file to Employee in UltiPro.'
                                WHEN EepHomeCOID NOT IN ('QB1Z7', 'QB224') THEN 'Record Rejected: Home Company Code not in QB1Z7, QB224.'
                                --WHEN EecEmplStatus = 'T' THEN 'Record Rejected: Terminated Employee - Do Not Process.'
                                WHEN RunID = 'DEDUCTION' AND DedDedCode IS NULL THEN 'Record Rejected: [Deduction Code] Not Setup in UltiPro.'
                                WHEN RunID = 'DEDUCTION' AND EedDedCode IS NULL AND CONVERT(MONEY,Field4) = 0.00 THEN 'Record Rejected: No Deduction/Benefit Plan to STOP for Employee in UltiPro.'
                        END,
            drvImported = CASE -- 0 = Initial Load, 1 = Imported/Updated, 2 = Rejected
                                WHEN EecEEID IS NULL THEN 2 -- Unable to match [Employee Number] in file
                                WHEN EecCOID IS NULL THEN 2 -- Unable to match [Company Code] in file
                                --WHEN EecEmplStatus = 'T' THEN 2 -- Terminated Employee
                                WHEN RunID = 'DEDUCTION' AND DedDedCode IS NULL THEN 2 -- [Deduction Code] Not Setup in UltiPro
                                WHEN RunID = 'DEDUCTION' AND EedDedCode IS NULL AND CONVERT(MONEY,Field4) = 0.00 THEN 2 -- No Benefit Plan for Employee to Stop
                                ELSE 0
                            END,
            drvEEID = EecEEID,
            drvCOID = EecCOID,
            drvImportType = RunID,
            drvPeriodStartDate = CONVERT(VARCHAR(10),PayPeriodStartDate,101),
            drvInitialSort = ISNULL(Field1,'')
        FROM dbo.U_IBENSLVDED_Import WITH (NOLOCK)
        LEFT JOIN dbo.Company WITH (NOLOCK)
            ON CmpCompanyCode = Field1
        LEFT JOIN dbo.EmpComp WITH (NOLOCK)
			ON EecEEID = EEID
            AND EecCOID = COID
            --AND EecEmpNo = Field2
        LEFT JOIN dbo.EmpPers WITH (NOLOCK)
            ON eepEEID = EecEEID
        LEFT JOIN dbo.DedCode WITH (NOLOCK)
            ON DedDedCode = Field3
        LEFT JOIN dbo.EmpDed WITH (NOLOCK)
            ON EedEEID = EecEEID
            AND EedCoID = EecCOID
            AND EedDedCode = DedDedCode
		WHERE NULLIF(Field2, '') IS NOT NULL
		OPTION (FORCE ORDER);

       INSERT INTO dbo.U_IBENSLVDED_drvTbl (drvError)
       SELECT 'Update 1';

    END TRY
    BEGIN CATCH
       -- Report SQL Error in Error Report File
       INSERT INTO dbo.U_IBENSLVDED_drvTbl (drvError)
       SELECT 'Error Processing File: ' + ISNULL(ERROR_MESSAGE(),'');

       -- Stop Processing
       RETURN;
    END CATCH;

    --============================================
    -- Update PendingUpdateID for Valid Records
    --============================================
    --UPDATE dbo.U_IBENSLVDED_drvTbl
    --SET drvPendingUpdateID = LEFT('IBENSLVDED' + dbo.fn_GetTimedKey(),20)
    --WHERE drvImported = 0;

    /***************************
    PERFORM EMPLOYEE VALIDATIONS
    ****************************/
    UPDATE dbo.U_IBENSLVDED_drvTbl
    SET
        iEecEEID        = EecEEID,
        iEecCoID        = EecCoID,
        DrvEEID        = EecEEID,
        DrvCoID        = EecCoID,
        DrvSSN            = eepssn,
        iCoCode         = cmpCompanyCode,
        iTypeIdentifier = CASE WHEN DrvDedCode IN ('UEHER', 'UEDOM') THEN 'E'
                               ELSE 'D'
                          END,
        --DrvError        = CONVERT(CHAR(200),CASE WHEN isNULL(eepssn,'') = '' THEN 'Employee SSN Missing;' ELSE SPACE(0) END +
        --                                    CASE WHEN eepEEID IS NULL THEN 'Employee EmpNo invalid;'ELSE SPACE(0) END)
        DrvError        = CONVERT(CHAR(200),CASE WHEN eepEEID IS NULL THEN 'Employee EmpNo: ' + drvempno + ' invalid;' ELSE SPACE(0) END)
    FROM dbo.U_IBENSLVDED_drvTbl WITH (NOLOCK)
    LEFT JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = drvEEID
        AND EecCoID = drvCOID
       --ON EecEmpNo = drvempno
       --AND EecCoID = 'QAWT1'
    LEFT JOIN dbo.EmpPers WITH (NOLOCK)
        ON eepeeid = eeceeid
    LEFT JOIN dbo.Company WITH (NOLOCK)
        ON EecCoID = cmpCoID
	OPTION (FORCE ORDER);

    --IGNORE Invalid Ded codes
    Update dbo.U_IBENSLVDED_drvTbl
    set DrvError = 'Deduction code not valid;'
    WHERE isnull(DrvError,'') = '' and isnull(drvDedCode,'') = ''

    -- Check whether earning exists
    UPDATE dbo.U_IBENSLVDED_drvTbl
    SET DrvEarnExists = 1
    FROM dbo.U_IBENSLVDED_drvTbl WITH (NOLOCK)
    JOIN dbo.EmpEarn WITH (NOLOCK)
    ON EeeEEID = iEecEEID
       AND EeeCoID = iEecCOID
       AND EeeEarnCode = DrvDedCode
    WHERE iTypeIdentifier = 'E';

       INSERT INTO dbo.U_IBENSLVDED_drvTbl (drvError)
       SELECT 'Update 2';
    

    UPDATE dbo.U_IBENSLVDED_drvTbl
    SET DrvBenStart     = CASE --NEED START DATE TO BE FIRST DAY OF CURRENT PAY PERIOD
                               WHEN ISNULL(DedIsBenefit,'N') = 'N' THEN '01/01/1900'
                               WHEN EedDedCode IS NULL THEN PgrPeriodStartDate
                               ELSE '12/30/1899'
                          END,
        DrvDedStart     = CASE --NEED START DATE TO BE FIRST DAY OF CURRENT PAY PERIOD
                               WHEN EedDedCode IS NULL THEN PgrPeriodStartDate
                               WHEN DrvBenStat <> 'T' THEN PgrPeriodStartDate
                               ELSE '12/30/1899'
                          END,
        DrvBenStatStart = CASE WHEN ISNULL(DedIsBenefit,'N') = 'N' THEN '01/01/1900'
                               WHEN DrvBenStat = 'T' THEN DATEADD(DD,-1,PgrPeriodStartDate)
                               ELSE GETDATE()
                          END,
        DrvDedStop      = CASE WHEN DrvBenStat = 'T' THEN DATEADD(DD,-1,PgrPeriodStartDate)
                               ELSE '01/01/1900'
                          END,
        DrvBenStop      = CASE WHEN ISNULL(DedIsBenefit,'N') = 'N' THEN '01/01/1900'
                               WHEN DrvBenStat = 'T' THEN DATEADD(DD,-1,PgrPeriodStartDate)
                               ELSE '01/01/1900'
                          END,
        DrvChangRsn     = CASE WHEN EedDedCode IS NULL THEN '400'
                               WHEN DrvBenStat = 'T' THEN '401'
                               ELSE '402'
                          END,
        DrvError        = LTRIM(RTRIM(DrvError)) + CASE WHEN DrvBenStat = 'T' AND EedDedCode IS NULL THEN 'Stop sent for Ded Code that does not exist;' ELSE '' END
    FROM dbo.U_IBENSLVDED_drvTbl
    LEFT JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = iEecEEID
       AND EecCoID = iEecCoID
    LEFT JOIN dbo.EmpDed WITH (NOLOCK)
        ON EedEEID = iEecEEID
       AND EedCoID = iEecCoID
       AND EedDedCode = DrvDedCode
    LEFT JOIN dbo.PayGroup WITH (NOLOCK)
        ON PgrPayGroup = EecPayGroup
    LEFT JOIN dbo.DedCode WITH (NOLOCK)
        ON DedDedCode = DrvDedCode
    WHERE iTypeIdentifier = 'D'
	OPTION (FORCE ORDER);

    INSERT INTO dbo.U_IBENSLVDED_drvTbl (drvError)
       SELECT 'Update 3';

    /***************************
    PERFORM EARNING/EARNING GROUP VALIDATIONS
    ****************************/
    UPDATE dbo.U_IBENSLVDED_drvTbl
    SET DrvError = RTRIM(DrvError) + CASE WHEN ErnEarnCode IS NULL THEN 'Earning code invalid;' ELSE SPACE(0) END +
                                     CASE WHEN CepEarnCode IS NULL THEN 'Earning code not in employee Earning Group;' ELSE SPACE(0) END
    FROM dbo.U_IBENSLVDED_drvTbl WITH (NOLOCK)
    JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = iEecEEID
       AND EecCoID = iEecCoID
    LEFT JOIN dbo.EarnCode WITH (NOLOCK)
        ON ErnEarnCode = DrvDedCode
    LEFT JOIN dbo.EarnProg WITH (NOLOCK)
        ON CepEarnGroupCode = EecEarnGroupCode
       AND CepEarnCode = ErnEarnCode
    WHERE iTypeIdentifier = 'E'
	OPTION (FORCE ORDER);

           INSERT INTO dbo.U_IBENSLVDED_drvTbl (drvError)
       SELECT 'Update 4';

    -- Set start/stop dates for earnings
    UPDATE dbo.U_IBENSLVDED_drvTbl
    SET DrvDedStart = CASE --NEED START DATE TO BE FIRST DAY OF CURRENT PAY PERIOD
                           WHEN EeeEarnCode IS NULL THEN PgrPeriodStartDate
                           WHEN DrvBenStat <> 'T' THEN PgrPeriodStartDate
                      END,
        DrvDedStop  = CASE --WHEN DrvDedCode = 'HSAER' THEN DATEADD(DD,1,PgrPeriodStartDate)
                           WHEN DrvBenStat = 'T' THEN DATEADD(DD,-1,PgrPeriodStartDate)
                      END,
        DrvError = LTRIM(RTRIM(DrvError)) + CASE WHEN DrvBenStat = 'T' AND EeeEarnCode IS NULL THEN 'Stop sent for Earning Code that does not exist;' ELSE '' END
    FROM dbo.U_IBENSLVDED_drvTbl
    LEFT JOIN dbo.EmpComp WITH (NOLOCK)
        ON EecEEID = iEecEEID
       AND EecCoID = iEecCoID
    LEFT JOIN dbo.EmpEarn WITH (NOLOCK)
        ON EeeCoID = iEecCoID
       AND EeeEEID = iEecEEID
       AND EeeEarnCode = DrvDedCode
    LEFT JOIN dbo.PayGroup WITH (NOLOCK)
        ON PgrPayGroup = EecPayGroup
    WHERE iTypeIdentifier = 'E'
	OPTION (FORCE ORDER);

       INSERT INTO dbo.U_IBENSLVDED_drvTbl (drvError)
       SELECT 'Update 5';

    --======================================================
    -- Populate LOD Tables (BackOffice Validation/Posting)
    --======================================================
    BEGIN TRY
        --=========================================
        -- Populate Lod Control Table (LodCntrl)
        --=========================================
        INSERT INTO dbo.LodCntrl (CntCoID,CntEEID,CntPendingEffDate,CntPendingImportType,CntPendingSource,CntPendingStatus,CntPendingUpdateID,CntSessionID)
        SELECT
            CntCoID = drvCOID
            ,CntEEID = drvEEID
            ,CntPendingEffDate = CONVERT(CHAR(10),GETDATE(),101)
            ,CntPendingImportType = 'P'
            ,CntPendingSource = 'C'
            ,CntPendingStatus = 'A'
            ,CntPendingUpdateID = drvPendingUpdateID
            ,CntSessionID = @FormatCode
        FROM dbo.U_IBENSLVDED_drvTbl
        WHERE drvImported = 0 AND drvImportType = 'DEDUCTION'
             AND DrvError = ''
             AND iTypeIdentifier = 'D'
 
        --===============================================
        -- Populate Lod Employee Comp Table (LodEComp)
        --===============================================
        INSERT INTO dbo.LodEComp (EecEEID,EecCOID,EecEmpNo,EecCompanyCode,EecPendingEffDate,EecPendingTransType,EecPendingUpdateID,EecSessionID)
        SELECT
            EecEEID = drvEEID
            ,EecCOID = drvCOID
            ,EecEmpNo = EecEmpNo
            ,EecCompanyCode = CmpCompanyCode
            ,EecPendingEffDate = CONVERT(CHAR(10),GETDATE(),101)
            ,EecPendingTransType = 'U'
            ,EecPendingUpdateID = drvPendingUpdateID
            ,EecSessionID = @FormatCode
        FROM dbo.U_IBENSLVDED_drvTbl WITH (NOLOCK)
        JOIN dbo.EmpComp WITH (NOLOCK)
            ON EecEEID = drvEEID
            AND EecCOID = drvCOID
        JOIN dbo.Company WITH (NOLOCK)
            ON CmpCOID = drvCOID
        WHERE drvImported = 0 AND drvImportType = 'DEDUCTION'
             AND DrvError = ''
             AND iTypeIdentifier = 'D'

        --------------------------------------------------------------
        -- Populate Lod Deduction Table (LodEDed) for Deductions
        --------------------------------------------------------------
        INSERT INTO dbo.LodEDed (EedEEID,EedCOID,EedDedCode,EedEEAmt,EedEEGoalAmt,EedBenStartDate,EedBenStatusDate,EedEEEligDate,EedBenStopDate,EedStartDate,EedStopDate
            ,EedBenStatus,EedChangeReason,EedPendingEffDate,EedPendingTransType,EedInclInAddlChk,EedInclInManlChk,EedPendingUpdateID)    --EedEECalcRule
        SELECT DISTINCT 
            EedEEID = drvEEID
            ,EedCOID = drvCOID
            ,EedDedCode = DrvDedCode
            ,EedEEAmt = CASE WHEN DrvChangRsn = '401' THEN 0
                            ELSE DrvAmt
                        END
            ,EedEEGoalAmt = 0
            ,EedBenStartDate = DrvBenStart
            ,EedBenStatusDate = DrvBenStatStart
            ,EedEEEligDate       = CASE WHEN DrvBenStart = '01/01/1900' THEN '01/01/1900'
                                        ELSE ed.EedEEEligDate
                                   END
            ,EedBenStopDate = DrvBenStop
            ,EedStartDate = CASE WHEN drvAction IN ('ADD','RESTART') THEN CONVERT(DATETIME,DrvDedStart)
                                 ELSE '12/30/1899'
                            END
            ,EedStopDate = CASE WHEN DrvChangRsn = '401' THEN DrvDedStop
                                ELSE '01/01/1900'
                           END
            ,EedBenStatus = DrvBenStat
            ,EedChangeReason     = DrvChangRsn
            ,EedPendingEffDate = CONVERT(CHAR(10),GETDATE(),101)
            ,EedPendingTransType = CASE WHEN drvAction = 'ADD' THEN 'A'
                                        ELSE 'U'
                                   END
            ,EedInclInAddlChk = DedInclInAddlChk
            ,EedInclInManlChk = DedInclInManlChk
            ,EedPendingUpdateID = drvPendingUpdateID
            --,EedEECalcRule = DedEECalcRule    -- This may need to be set if existing records don't match Deduction/Benefit Plan Calc Rule (i.e., changing from Option Rate Schedule to Flat Amount)
        FROM dbo.U_IBENSLVDED_drvTbl WITH (NOLOCK)
        JOIN dbo.DedCode WITH (NOLOCK)
            ON DedDedCode = drvDedCode
        LEFT JOIN dbo.EmpDed ed WITH (NOLOCK)
            ON ed.EedEEID = iEecEEID
           AND ed.EedCoID = iEecCoID
           AND ed.EedDedCode = DrvDedCode
        WHERE drvImported = 0 AND drvImportType = 'DEDUCTION'
             AND DrvError = ''
             AND iTypeIdentifier = 'D'
		OPTION (FORCE ORDER);

    INSERT INTO dbo.U_IBENSLVDED_drvTbl (drvError)
       SELECT 'Update 7';

       INSERT INTO dbo.U_IBENSLVDED_drvTbl (drvError)
       SELECT 'Update 8';

    END TRY
    BEGIN CATCH
       -- Report SQL Error in Error Report File
       INSERT INTO dbo.U_IBENSLVDED_drvTbl (drvError)
       SELECT 'Error Loading Deductions for Validation/Posting: ' + ISNULL(ERROR_MESSAGE(),'');

       -- Stop Processing
       RETURN;
    END CATCH;

    --=======================
    -- Report Successful
    --=======================
    UPDATE dbo.u_IBENSLVDED_drvTbl
    SET drvError = 'Imported Successfully'
       ,drvImported = 1
    WHERE drvImported = 0
    AND EXISTS (SELECT 1 FROM dbo.LodEDed WHERE EedPendingUpdateID = drvPendingUpdateID);

           INSERT INTO dbo.U_IBENSLVDED_drvTbl (drvError)
       SELECT 'Update 9';

    -- Update existing earn codes
    UPDATE dbo.EmpEarn
    SET  EEEAmt             = DrvAmt
        ,EeeDatetimeChanged = GETDATE()
        ,EeeStartDate       = COALESCE(DrvDedStart,EeeStartDate)
        ,EeeStopDate        = COALESCE(DrvDedStop,EeeStopDate)
    FROM dbo.U_IBENSLVDED_drvTbl
    WHERE EeeEEID = iEecEEID
      AND EeeCoID = iEecCoID
      AND EeeEarnCode = DrvDedCode
      AND DrvError = ''
      AND iTypeIdentifier = 'E'
      AND DrvEarnExists = 1
      AND (EEEAmt <> DrvAmt
           OR ISNULL(EeeStartDate,'') <> ISNULL(DrvDedStart,'')
           OR ISNULL(EeeStopDate,'') <> ISNULL(DrvDedStop,''));


                  INSERT INTO dbo.U_IBENSLVDED_drvTbl (drvError)
       SELECT 'Update 10';

    --=======================
    -- Report Successful
    --=======================
    UPDATE dbo.U_IBENSLVDED_drvTbl
    SET  drvError = 'Imported Successfully'
       ,drvImported = 1
    FROM dbo.EmpEarn
    WHERE EeeEEID = iEecEEID
      AND EeeCoID = iEecCoID
      AND EeeEarnCode = DrvDedCode
      AND DrvError = ''
      AND iTypeIdentifier = 'E'
      AND DrvEarnExists = 1
      AND (EEEAmt = DrvAmt
           OR ISNULL(EeeStartDate,'') = ISNULL(DrvDedStart,'')
           OR ISNULL(EeeStopDate,'') = ISNULL(DrvDedStop,''));

       INSERT INTO dbo.U_IBENSLVDED_drvTbl (drvError)
       SELECT 'Update 11';

    --Load new earnings records
    --declares for earnings
    DECLARE @TmpEEID char(12);
    DECLARE @TmpCoID char(5);
    DECLARE @TmpEarnCode char(5);
    DECLARE @TmpErnAmt money;
    DECLARE @TmpStartDate datetime;
    DECLARE @TmpStopDate datetime;

    -- Select Records to Process from Import Table.
    DECLARE LoadRecords CURSOR FOR
        SELECT
            iEecEEID,
            iEecCoID,
            DrvDedCode,
            DrvAmt,
            DrvDedStart,
            DrvDedStop
        FROM dbo.U_IBENSLVDED_drvTbl WITH (NOLOCK)
        WHERE DrvError = ''
          AND iTypeIdentifier = 'E'
          AND DrvEarnExists = 0;

    OPEN LoadRecords;
    FETCH NEXT FROM LoadRecords
    INTO @TmpEEID, @TmpCoID, @TmpEarnCode, @TmpErnAmt, @TmpStartDate, @TmpStopDate;

    WHILE (@@FETCH_STATUS = 0)
    BEGIN
        INSERT INTO dbo.EmpEarn (
            EeeEEID,
            EeeCoID,
            EeeEarnCode,
            Eee1099rDistCode1,
            Eee1099rDistCode2,
            EEEAmt,
            EeeBlockFIT,
            EeeBlockLIT,
            EeeBlockSIT,
            EeeCalcSequence,
            EeeDatetimeCreated,
            EeeDatetimeChanged,
            EeeDisplayInPDE,
            EeeGLExpAcct,
            EeeIsActive,
            EeeIsSuppWages,
            EeeFiscalYTDAmt,
            EeeFiscalYTDHrs,
            EeeLstAmt,
            EeeLstHrs,
            EeeMTDHrs,
            EeePromptForAddlCheck,
            EeeQTDAmt,
            EeeQTDHrs,
            EeeSkipForMassUpdate,
            EeeStartDate,
            EeeStopDate,
            EeeYTDAmt,
            EeeYTDHrs,
            EeeYTDLimitAmt,
            EeeSystemID
        )
        SELECT
            @TmpEEID,
            @TmpCoID,
            @TmpEarnCode,
            Ern1099rDistCode1,
            Ern1099rDistCode2,
            IsNULL(@TmpErnAmt,0),
            ErnBlockFIT,
            ErnBlockLIT,
            ErnBlockSIT,
            ErnCalcSequence,
            GETDATE(),
            GETDATE(),
            ErnDisplayInPDE,
            ErnGlExpAcct,
            ErnIsActive,
            ErnIsSuppWages,
            0,
            0,
            0,
            0,
            0,
            ErnPromptForAddlCheck,
            0,
            0,
            'N',
            @TmpStartDate,
            @TmpStopDate,
            0,
            0,
            0,
            dbo.fn_GetTimedKey()
        FROM dbo.EarnCode
        WHERE ErnEarnCode = @TmpEarnCode;

        EXEC dbo.sp_usg_AddoffSettingDeductions @TmpEEID, @TmpCoID;

        FETCH NEXT FROM LoadRecords
        INTO @TmpEEID, @TmpCoID, @TmpEarnCode, @TmpErnAmt, @TmpStartDate, @TmpStopDate;
END

CLOSE LoadRecords;
DEALLOCATE LoadRecords;

       INSERT INTO dbo.U_IBENSLVDED_drvTbl (drvError)
       SELECT 'Update 12';

    --=======================
    -- Report Successful
    --=======================
    UPDATE dbo.U_IBENSLVDED_drvTbl
    SET  drvError = 'Imported Successfully'
       ,drvImported = 1
    WHERE DrvError = ''
        AND iTypeIdentifier = 'E'
        AND DrvEarnExists = 0;

       INSERT INTO dbo.U_IBENSLVDED_drvTbl (drvError)
       SELECT 'Update 13';

    --============================
    -- Reject Remaining Records
    --============================
    UPDATE dbo.u_IBENSLVDED_drvTbl
    SET drvError = 'Record Rejected'
       ,drvAction = 'REJECTED'
       ,drvImported = 2
    WHERE drvImported = 0;

           INSERT INTO dbo.U_IBENSLVDED_drvTbl (drvError)
       SELECT 'Update 14';

    --Set
    UPDATE dbo.u_IBENSLVDED_drvTbl
    SET drvError = 'Record Rejected'
    WHERE drvAction = 'REJECTED' AND (drvError IS NULL OR drvError = '');

           INSERT INTO dbo.U_IBENSLVDED_drvTbl (drvError)
       SELECT 'Update 15';

	DELETE drv
	FROM dbo.U_IBENSLVDED_drvTbl drv
	WHERE NULLIF(drvEmpNo, '') IS NULL;

--Skipping point if file name is blank or does not exist
CreateLogAndErrorFiles:

/*

--Alter the View
 CREATE  View dbo.dsi_vwIBENSLVDED_Export as
         select top 20000000 Data from dbo.U_IBENSLVDED_File WITH (NOLOCK)
         order by substring(RecordSet,2,2), InitialSort, subsort

*/

END
GO
 CREATE  View dbo.dsi_vwIBENSLVDED_Export as
        select top 20000000 Data from dbo.U_IBENSLVDED_File WITH (NOLOCK)
        order by substring(RecordSet,2,2), InitialSort, subsort
