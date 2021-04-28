DROP PROCEDURE IF EXISTS get_FileState;
GO


CREATE PROCEDURE get_FileState(
	@StateId TINYINT = NULL OUTPUT,
    @StateName varchar(250) = NULL OUTPUT 
)
AS
BEGIN
	
	DECLARE
        -- Код возврата процедуры, по умолчанию 
		@resultCode INT = -1, 
        @lastCount INT

    IF @StateId IS NULL
        SELECT
            @StateId = StateId
        FROM
            FileStates
        WHERE
            StateName = @StateName
    ELSE
        SELECT
            @StateName = StateName,
            @StateId = StateId
        FROM
            FileStates
        WHERE
            StateId = @StateId
    
    SELECT
        @lastCount = @@ROWCOUNT,
        @errorNumber = @@ERROR
    ;

    IF @errorNumber <> 0
        RETURN @errorNumber
    ;

    IF @lastCount > 0
        SELECT
            @resultCode = 0
        ;
    ELSE
        SELECT
            @resultCode = -1,
            @CountryId = NULL
        ;

    RETURN @resultCode

END
GO