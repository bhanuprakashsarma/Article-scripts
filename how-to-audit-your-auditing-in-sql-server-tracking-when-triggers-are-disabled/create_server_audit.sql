USE master;
GO
CREATE SERVER AUDIT ServerAudit
TO FILE (FILEPATH = 'c:\audits\', MAXSIZE = 2 GB)
WITH (ON_FAILURE = CONTINUE);
GO
ALTER SERVER AUDIT ServerAudit
WITH (STATE = ON);