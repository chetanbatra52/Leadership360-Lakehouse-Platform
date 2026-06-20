USE [Leadership360Lakehouse]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_DimAssessment]    Script Date: 20-06-2026 12:59:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[usp_Load_DimAssessment]
AS
BEGIN

    SET NOCOUNT ON;

    TRUNCATE TABLE silver.DimAssessment;

    INSERT INTO silver.DimAssessment
    (
        AssessmentID,
        AssessmentName,
        AssessmentType,
        AssessmentDate
    )
    SELECT
        AssessmentID,
        AssessmentName,
        AssessmentType,
        AssessmentDate
    FROM landing.Assessment;

END
GO


