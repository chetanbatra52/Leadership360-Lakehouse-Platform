USE [Leadership360Lakehouse]
GO

/****** Object:  View [gold].[vw_RegionalPerformance]    Script Date: 20-06-2026 12:55:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [gold].[vw_RegionalPerformance]
AS

SELECT

    dp.Region,

    AVG(CAST(f.Score AS FLOAT)) AS AverageScore,

    COUNT(*) AS TotalResponses

FROM gold.FactAssessmentScore f

INNER JOIN silver.DimParticipant dp
    ON f.ParticipantSK = dp.ParticipantSK

GROUP BY dp.Region;
GO


