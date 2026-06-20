USE [Leadership360Lakehouse]
GO

/****** Object:  View [gold].[vw_CompetencyPerformance]    Script Date: 20-06-2026 12:54:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [gold].[vw_CompetencyPerformance]
AS

SELECT

    dc.CompetencyName,

    AVG(CAST(f.Score AS FLOAT)) AS AverageScore,

    COUNT(*) AS TotalResponses

FROM gold.FactAssessmentScore f

INNER JOIN silver.DimCompetency dc
    ON f.CompetencySK = dc.CompetencySK

GROUP BY dc.CompetencyName;
GO


