USE [Leadership360Lakehouse]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_DimCompetency]    Script Date: 20-06-2026 12:59:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[usp_Load_DimCompetency]
AS
BEGIN

    SET NOCOUNT ON;

    TRUNCATE TABLE silver.DimCompetency;

    INSERT INTO silver.DimCompetency
    (
        CompetencyID,
        CompetencyName,
        Category
    )
    SELECT
        CompetencyID,
        CompetencyName,
        Category
    FROM landing.Competency;

END
GO


