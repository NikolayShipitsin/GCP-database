USE traindb;
GO


DROP TABLE IF EXISTS FileStates;
DROP SEQUENCE IF EXISTS dbo.FileStatesIds;
GO
CREATE TABLE FileStates
(
    StateId TINYINT NOT NULL DEFAULT NEXT VALUE FOR dbo.PrototypesIds,
    StateName VARCHAR(250)
    CONSTRAINT [UX_State] UNIQUE (StateName)
)
GO

DROP TABLE IF EXISTS SoundFiles;
DROP SEQUENCE IF EXISTS dbo.SoundFilesIds;
GO

CREATE TABLE SoundFiles
(
    FileId INT NOT NULL  DEFAULT NEXT VALUE FOR dbo.PrototypesIds,
    StateId TINYINT NOT NULL,
    FileNameStr VARCHAR(250),
    DateOfAdd DATETIME
    CONSTRAINT [FK_SoundFiles_FileStates] FOREIGN KEY (StateId) REFERENCES FileStates (StateId),
    CONSTRAINT [UX_FileNameStr] UNIQUE (FileNameStr)
)
GO