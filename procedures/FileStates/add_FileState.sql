DROP PROCEDURE IF EXISTS add_FileState;
GO


CREATE PROCEDURE add_FileState(
	@StateId TINYINT,
    @StateName varchar(250) 
)
AS
BEGIN 

    DECLARE
        @resultCode INT = -1

    INSERT INTO FileStates(
        StateId,
        StateName
    )
    VALUES(
        @StateId,
        @StateName
    )

    SET @resultCode = @@ERROR

    RETURN @resultCode
END;
GO