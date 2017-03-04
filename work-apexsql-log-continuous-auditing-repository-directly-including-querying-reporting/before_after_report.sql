CREATE PROCEDURE BEFORE_AFTER_REPORT @Server NVARCHAR(128),
	@Database NVARCHAR(128),
	@Table NVARCHAR(128),
	@User NVARCHAR(128)
AS
BEGIN
	SELECT A.[SERVER],
		A.[DATABASE],
		B.[TIME],
		B.[OPERATION_TYPE],
		B.[SCHEMA],
		B.[TABLE],
		B.[USER_NAME],
		B.[DURATION],
		B.[LSN],
		B.[RECONSTRUCTED],
		C.[COLUMN_NAME],
		C.[BEFORE],
		C.[AFTER]
	FROM dbo.APEXSQL_BEFORE_AFTER_DATABASE A
	INNER JOIN dbo.APEXSQL_BEFORE_AFTER_OPERATION B ON A.ID = B.DATABASE_ID
	INNER JOIN dbo.APEXSQL_BEFORE_AFTER_DETAIL C ON B.LSN = C.LSN
	WHERE (
			@Server IS NULL
			OR A.[SERVER] = @Server
			)
		AND (
			@Database IS NULL
			OR A.[DATABASE] = @Database
			)
		AND (
			@Table IS NULL
			OR B.[TABLE] = @Table
			)
		AND (
			@User IS NULL
			OR B.[USER_NAME] = @User
			)
	ORDER BY A.[SERVER],
		A.[DATABASE],
		B.[TIME]
END