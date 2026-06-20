USE [Leadership360Lakehouse]
GO

/****** Object:  View [audit].[vw_DataQualitySummary]    Script Date: 20-06-2026 12:51:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [audit].[vw_DataQualitySummary]
AS

SELECT

    RuleName,

    PassCount,

    FailCount,

    RunDate

FROM audit.DataQualityCheck;
GO


