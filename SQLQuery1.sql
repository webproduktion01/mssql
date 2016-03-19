USE [LabBase]
GO

DECLARE	@return_value Int

EXEC	@return_value = [dbo].[TestProcedure]

SELECT	@return_value as 'Return Value'

GO
