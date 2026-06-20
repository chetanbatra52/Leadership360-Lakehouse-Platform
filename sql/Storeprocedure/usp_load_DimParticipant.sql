USE [Leadership360Lakehouse]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_DimParticipant]    Script Date: 20-06-2026 13:00:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[usp_Load_DimParticipant]
AS
BEGIN

    SET NOCOUNT ON;

    TRUNCATE TABLE silver.DimParticipant;

    INSERT INTO silver.DimParticipant
    (
        ParticipantID,
        ParticipantName,
        Department,
        Region,
        JobLevel,
        EffectiveDate,
        ExpiryDate,
        CurrentFlag
    )
    SELECT
        ParticipantID,
        ParticipantName,
        Department,
        Region,
        JobLevel,
        GETDATE(),
        '9999-12-31',
        'Y'
    FROM landing.Participant;

END
GO


