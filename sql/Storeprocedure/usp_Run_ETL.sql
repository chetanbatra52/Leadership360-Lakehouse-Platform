USE [Leadership360Lakehouse]
GO

/****** Object:  StoredProcedure [dbo].[usp_Run_ETL]    Script Date: 20-06-2026 13:05:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[usp_Run_ETL]
AS
BEGIN

    DECLARE @StartTime DATETIME = GETDATE();

    BEGIN TRY

        EXEC dbo.usp_Load_DimCompetency;

        EXEC dbo.usp_Load_DimAssessment;

        EXEC dbo.usp_Load_DimParticipant_Incremental;

        EXEC dbo.usp_Load_FactAssessmentScore;

        INSERT INTO audit.ETLExecutionLog
        (
            ProcedureName,
            StartTime,
            EndTime,
            Status
        )
        VALUES
        (
            'usp_Run_ETL',
            @StartTime,
            GETDATE(),
            'SUCCESS'
        );

    END TRY

    BEGIN CATCH

        INSERT INTO audit.ETLExecutionLog
        (
            ProcedureName,
            StartTime,
            EndTime,
            Status,
            ErrorMessage
        )
        VALUES
        (
            'usp_Run_ETL',
            @StartTime,
            GETDATE(),
            'FAILED',
            ERROR_MESSAGE()
        );

    END CATCH

END;
GO


