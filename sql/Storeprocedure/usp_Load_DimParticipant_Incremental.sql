USE [Leadership360Lakehouse]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_DimParticipant_Incremental]    Script Date: 20-06-2026 13:01:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[usp_Load_DimParticipant_Incremental]
AS
BEGIN

    SET NOCOUNT ON;

    DECLARE @LastProcessedDate DATETIME;

    SELECT
        @LastProcessedDate = LastProcessedDate
    FROM audit.WatermarkControl
    WHERE TableName = 'Participant';

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
        p.ParticipantID,
        p.ParticipantName,
        p.Department,
        p.Region,
        p.JobLevel,
        GETDATE(),
        '9999-12-31',
        'Y'
    FROM landing.Participant p
    WHERE p.LastModifiedDate > @LastProcessedDate
    AND NOT EXISTS
    (
        SELECT 1
        FROM silver.DimParticipant d
        WHERE d.ParticipantID = p.ParticipantID
        AND d.CurrentFlag = 'Y'
    );

    UPDATE audit.WatermarkControl
    SET LastProcessedDate = GETDATE()
    WHERE TableName = 'Participant';

END;
GO


