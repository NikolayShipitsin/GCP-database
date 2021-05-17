DROP PROCEDURE IF EXISTS upd_Country;
GO

CREATE PROCEDURE upd_FileState(
    @StateId TINYINT = NULL OUTPUT,
    @StateName varchar(250) = NULL OUTPUT 
)
AS
BEGIN
    
    DECLARE
        -- Код возврата вложенных процедур, при наличии
		@errorNumber int = 0,
        -- Код возврата процедуры, по умолчанию 
		@resultCode int = -1

    DECLARE
        @curStateId TINYINT = @StateId,
        @curStateName varchar(250) = @StateName

    EXEC @errorNumber = get_FileState
        @curStateId OUTPUT,
        @curStateName OUTPUT
    
    IF @errorNumber < 0
    BEGIN

        IF @CStateName IS NULL
            RETURN @resultCode;
        ;

        IF @StateId IS NULL
            SELECT @StateId = NEXT VALUE FOR dbo.FileStatesIds;
        ;

        EXEC @errorNumber = add_FileState
            @StateId,
            @StateName
        ;
        
    END