CREATE TABLE Person(
PersonId INT NOT NULL PRIMARY KEY IDENTITY,
LastName VARCHAR(30) NOT NULL,
FirstName VARCHAR(30) NOT NULL,
)

CREATE INDEX IX_Person_LastName ON Person (LastName) INCLUDE (PersonId)
CREATE INDEX IX_Person_FirstName ON Person (FirstName)

CREATE TABLE Email(
EmailId INT NOT NULL PRIMARY KEY IDENTITY, 
PersonId INT NOT NULL FOREIGN KEY REFERENCES Person(PersonId),
Email VARCHAR(80) NOT NULL,
)

CREATE INDEX IX_Email_PersonId ON Email (PersonId) INCLUDE (EmailId)
CREATE INDEX IX_Email_Email ON Email (Email)

CREATE TABLE PhoneNumber(
PhoneNumberId INT NOT NULL PRIMARY KEY IDENTITY, 
PersonId INT NOT NULL FOREIGN KEY REFERENCES Person(PersonId),
PhoneNumber VARCHAR(15) NOT NULL,
)

CREATE INDEX IX_PhoneNumber_PersonId ON PhoneNumber (PersonId) INCLUDE (PhoneNumberId)
CREATE INDEX IX_PhoneNumber_PhoneNumber ON PhoneNumber (PhoneNumber)

CREATE TABLE Team(
TeamId INT NOT NULL PRIMARY KEY IDENTITY,
Name VARCHAR(30) NOT NULL,
Wins INT NOT NULL,
Losses INT NOT NULL,
)

CREATE INDEX IX_Team_Name ON Team (Name) INCLUDE (TeamId)
CREATE INDEX IX_Team_Wins ON Team (Wins)
CREATE INDEX IX_Team_Losses ON Team (Losses)  

CREATE TABLE Home(
HomeId INT NOT NULL PRIMARY KEY IDENTITY,
TeamId INT NOT NULL FOREIGN KEY REFERENCES Team(TeamId),
HomeName VARCHAR(30) NOT NULL
)

CREATE INDEX IX_Home_TeamId ON Home (TeamId)
CREATE INDEX IX_Home_Name ON Home (Name)
 
CREATE TABLE Visitor(
VisitorId INT NOT NULL PRIMARY KEY IDENTITY,
TeamId INT NOT NULL FOREIGN KEY REFERENCES Team(TeamId),
VisitorName VARCHAR(30) NOT NULL
)

CREATE INDEX IX_Visitor_TeamId ON Visitor (TeamId)
CREATE INDEX IX_Visitor_Name ON Visitor (Name)

CREATE TABLE Player(
PlayerId INT NOT NULL PRIMARY KEY IDENTITY,
PersonId INT NOT NULL FOREIGN KEY REFERENCES Person(PersonId),
TeamId INT NOT NULL FOREIGN KEY REFERENCES Team(TeamId),
Title VARCHAR (30) NOT NULL,
StartingYear DATE NOT NULL,
Salary MONEY NOT NULL,
SalaryBonus MONEY NOT NULL,
)

CREATE INDEX IX_Player_PersonId ON Player (PersonId) INCLUDE (PlayerId)
CREATE INDEX IX_Player_TeamId ON Player (TeamId)
CREATE INDEX IX_Player_Title ON Player (Title)
CREATE INDEX IX_Player_StartingYear ON Player (StartingYear)
CREATE INDEX IX_Player_Salary ON Player (Salary)
CREATE INDEX IX_Player_SalaryBonus ON Player (SalaryBonus)

CREATE TABLE Coach(
CoachId INT NOT NULL PRIMARY KEY IDENTITY,
PersonId INT NOT NULL FOREIGN KEY REFERENCES Person(PersonId),
TeamId INT NOT NULL FOREIGN KEY REFERENCES Team(TeamId),
Title VARCHAR (30) NOT NULL,
Salary MONEY NOT NULL,
)

CREATE INDEX IX_Coach_PersonId ON Coach (PersonId) INCLUDE (CoachId)
CREATE INDEX IX_Coach_TeamId ON Coach (TeamId)
CREATE INDEX IX_Coach_Title ON Coach (Title)
CREATE INDEX IX_Coach_Salary ON Coach (Salary)

CREATE TABLE Administrative(
AdministrativeId INT NOT NULL PRIMARY KEY IDENTITY,
PersonId INT NOT NULL FOREIGN KEY REFERENCES Person(PersonId),
TeamId INT NOT NULL FOREIGN KEY REFERENCES Team(TeamId),
Title VARCHAR (30) NOT NULL,
Salary MONEY NOT NULL,
)

CREATE INDEX IX_Administrative_PersonId ON Administrative (PersonId) INCLUDE (AdministrativeId)
CREATE INDEX IX_Administrative_TeamId ON Administrative (TeamId)
CREATE INDEX IX_Administrative_Title ON Administrative (Title) 
CREATE INDEX IX_Administrative_Salary ON Administrative (Salary)  


CREATE TABLE Game(
GameId INT NOT NULL PRIMARY KEY IDENTITY,
HomeId INT NOT NULL FOREIGN KEY REFERENCES Home(HomeId),
VisitorId INT NOT NULL FOREIGN KEY REFERENCES Visitor(VisitorId),
Name VARCHAR (30) NOT NULL,
HomeHalfTimeScore INT NOT NULL,
VisitorHalfTimeScore INT NOT NULL,
HomeFinalScore INT NOT NULL,
VisitorFinalScore INT NOT NULL,
GameDate DATE NOT NULL,
GameTime TIME NOT NULL,
)

CREATE INDEX IX_Game_Home ON Game (HomeId) INCLUDE (GameId)
CREATE INDEX IX_Game_Visitor ON Game (VisitorId)
CREATE INDEX IX_Game_HomeHalftimeScore ON Game (HomeHalfTimeScore)
CREATE INDEX IX_Game_VisitorHalfTimeScore ON Game (VisitorHalfTimeScore)
CREATE INDEX IX_Game_HomeFinalScore ON Game (HomeFinalScore)
CREATE INDEX IX_Game_VisitorFinalScore ON Game (VisitorFinalScore)
CREATE INDEX IX_Game_GameDate ON Game (GameDate)
CREATE INDEX IX_Game_GameTime ON Game (GameTime)

CREATE TABLE ScoringEvents(
ScoringEventsId INT NOT NULL PRIMARY KEY IDENTITY,
GameId INT NOT NULL FOREIGN KEY REFERENCES Game(GameId),
PlayerId INT NOT NULL,
Score INT NOT NULL,
)

CREATE INDEX IX_ScoringEvents_GameId ON ScoringEvents (GameId) INCLUDE (ScoringEventsId)
CREATE INDEX IX_ScoringEvents_PlayerId ON ScoringEvents (PlayerId)
CREATE INDEX IX_ScoringEvents_Score ON ScoringEvents (Score)
