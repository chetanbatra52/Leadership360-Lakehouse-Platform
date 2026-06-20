USE [Leadership360Lakehouse]
GO

/****** Object:  View [gold].[vw_ExecutiveSummary]    Script Date: 20-06-2026 12:54:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [gold].[vw_ExecutiveSummary]
AS

SELECT

    (SELECT COUNT(*) FROM silver.DimParticipant) AS TotalParticipants,

    (SELECT COUNT(*) FROM silver.DimCompetency) AS TotalCompetencies,

    (SELECT COUNT(*) FROM silver.DimAssessment) AS TotalAssessments,

    (SELECT AVG(CAST(Score AS FLOAT))
     FROM gold.FactAssessmentScore) AS AverageScore;
GO


