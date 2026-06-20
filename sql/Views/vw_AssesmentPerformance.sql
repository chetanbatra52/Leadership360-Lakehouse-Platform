USE [Leadership360Lakehouse]
GO

/****** Object:  View [gold].[vw_AssessmentPerformance]    Script Date: 20-06-2026 12:52:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [gold].[vw_AssessmentPerformance]
AS

SELECT

    da.AssessmentName,

    AVG(CAST(f.Score AS FLOAT)) AS AverageScore,

    COUNT(*) AS TotalResponses

FROM gold.FactAssessmentScore f

INNER JOIN silver.DimAssessment da
    ON f.AssessmentSK = da.AssessmentSK

GROUP BY da.AssessmentName;
GO


