USE [Leadership360Lakehouse]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_FactAssessmentScore]    Script Date: 20-06-2026 13:02:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[usp_Load_FactAssessmentScore]
AS
BEGIN

    SET NOCOUNT ON;

    TRUNCATE TABLE gold.FactAssessmentScore;

    INSERT INTO gold.FactAssessmentScore
    (
        ParticipantSK,
        CompetencySK,
        AssessmentSK,
        DateSK,
        Score
    )
    SELECT

        dp.ParticipantSK,
        dc.CompetencySK,
        da.AssessmentSK,
        20241231,
        sr.Score

    FROM landing.SurveyResponse sr

    INNER JOIN silver.DimParticipant dp
        ON sr.ParticipantID = dp.ParticipantID

    INNER JOIN silver.DimCompetency dc
        ON sr.CompetencyID = dc.CompetencyID

    INNER JOIN silver.DimAssessment da
        ON sr.AssessmentID = da.AssessmentID;

END
GO


