/*------------------------------------------------------------
*        Script SQLSERVER 
------------------------------------------------------------*/


/*------------------------------------------------------------
-- Table: ActionQSE
------------------------------------------------------------*/
CREATE TABLE ActionQSE(
	idAction           INT IDENTITY (1,1) NOT NULL ,
	dateDebut          DATETIME  ,
	delais             FLOAT   ,
	acheve             FLOAT   ,
	numeroImportance   INT   ,
	dateFin            DATETIME  ,
	pieceJustificative VARCHAR (50)  ,
	nom                VARCHAR (50)  ,
	recurrence         VARCHAR (50)  ,
	idFamille          INT   ,
	idVerification     INT   ,
	idSite             INT   ,
	idAction_1         INT   ,
	CONSTRAINT prk_constraint_ActionQSE PRIMARY KEY NONCLUSTERED (idAction)
);


/*------------------------------------------------------------
-- Table: Famille
------------------------------------------------------------*/
CREATE TABLE Famille(
	idFamille INT IDENTITY (1,1) NOT NULL ,
	nom       VARCHAR (50)  ,
	CONSTRAINT prk_constraint_Famille PRIMARY KEY NONCLUSTERED (idFamille)
);


/*------------------------------------------------------------
-- Table: Detection
------------------------------------------------------------*/
CREATE TABLE Detection(
	idDetection        INT IDENTITY (1,1) NOT NULL ,
	nomDetection       VARCHAR (50)  ,
	detailDetection    VARCHAR (200)  ,
	descriptionAnalyse VARCHAR (200)  ,
	conclusionAnalyse  VARCHAR (200)  ,
	idAction           INT   ,
	CONSTRAINT prk_constraint_Detection PRIMARY KEY NONCLUSTERED (idDetection)
);


/*------------------------------------------------------------
-- Table: Reglementation
------------------------------------------------------------*/
CREATE TABLE Reglementation(
	idReglementation INT IDENTITY (1,1) NOT NULL ,
	designation      VARCHAR (200)  ,
	lien             VARCHAR (200)  ,
	idCategorie      INT   ,
	CONSTRAINT prk_constraint_Reglementation PRIMARY KEY NONCLUSTERED (idReglementation)
);


/*------------------------------------------------------------
-- Table: Tache
------------------------------------------------------------*/
CREATE TABLE Tache(
	idTache     INT IDENTITY (1,1) NOT NULL ,
	nom         VARCHAR (50)  ,
	description VARCHAR (200)  ,
	CONSTRAINT prk_constraint_Tache PRIMARY KEY NONCLUSTERED (idTache)
);


/*------------------------------------------------------------
-- Table: Verification
------------------------------------------------------------*/
CREATE TABLE Verification(
	idVerification INT IDENTITY (1,1) NOT NULL ,
	moyenne        FLOAT   ,
	totalPoint     FLOAT   ,
	idAction       INT   ,
	CONSTRAINT prk_constraint_Verification PRIMARY KEY NONCLUSTERED (idVerification)
);


/*------------------------------------------------------------
-- Table: QSE
------------------------------------------------------------*/
CREATE TABLE QSE(
	idSalarie          INT IDENTITY (1,1) NOT NULL ,
	nom                VARCHAR (50)  ,
	statutHierarchique VARCHAR (50)  ,
	email              VARCHAR (100)  ,
	tel                VARCHAR (10)  ,
	prenom             VARCHAR (50)  ,
	identifiant        VARCHAR (50)  ,
	mdp                VARCHAR (50)  ,
	CONSTRAINT prk_constraint_QSE PRIMARY KEY NONCLUSTERED (idSalarie)
);


/*------------------------------------------------------------
-- Table: Question
------------------------------------------------------------*/
CREATE TABLE Question(
	idQuestion INT IDENTITY (1,1) NOT NULL ,
	question   VARCHAR (100)  ,
	detail     VARCHAR (200)  ,
	pointOui   FLOAT   ,
	pointNon   FLOAT   ,
	CONSTRAINT prk_constraint_Question PRIMARY KEY NONCLUSTERED (idQuestion)
);


/*------------------------------------------------------------
-- Table: Site
------------------------------------------------------------*/
CREATE TABLE Site(
	idSite  INT IDENTITY (1,1) NOT NULL ,
	nomSite VARCHAR (50)  ,
	CONSTRAINT prk_constraint_Site PRIMARY KEY NONCLUSTERED (idSite)
);


/*------------------------------------------------------------
-- Table: Categorie
------------------------------------------------------------*/
CREATE TABLE Categorie(
	idCategorie INT IDENTITY (1,1) NOT NULL ,
	nom         VARCHAR (50)  ,
	CONSTRAINT prk_constraint_Categorie PRIMARY KEY NONCLUSTERED (idCategorie)
);


/*------------------------------------------------------------
-- Table: Detection_Reglementation
------------------------------------------------------------*/
CREATE TABLE Detection_Reglementation(
	idReglementation INT  NOT NULL ,
	idAction         INT  NOT NULL ,
	CONSTRAINT prk_constraint_Detection_Reglementation PRIMARY KEY NONCLUSTERED (idReglementation,idAction)
);


/*------------------------------------------------------------
-- Table: Action_Tache
------------------------------------------------------------*/
CREATE TABLE Action_Tache(
	detail   VARCHAR (200)  ,
	fait     bit   ,
	idTache  INT  NOT NULL ,
	idAction INT  NOT NULL ,
	CONSTRAINT prk_constraint_Action_Tache PRIMARY KEY NONCLUSTERED (idTache,idAction)
);


/*------------------------------------------------------------
-- Table: Questionnaire
------------------------------------------------------------*/
CREATE TABLE Questionnaire(
	idVerification INT  NOT NULL ,
	idQuestion     INT  NOT NULL ,
	CONSTRAINT prk_constraint_Questionnaire PRIMARY KEY NONCLUSTERED (idVerification,idQuestion)
);


/*------------------------------------------------------------
-- Table: Salarie_Action
------------------------------------------------------------*/
CREATE TABLE Salarie_Action(
	type      VARCHAR (25)  ,
	idSalarie INT  NOT NULL ,
	idAction  INT  NOT NULL ,
	CONSTRAINT prk_constraint_Salarie_Action PRIMARY KEY NONCLUSTERED (idSalarie,idAction)
);



ALTER TABLE ActionQSE ADD CONSTRAINT FK_ActionQSE_idFamille FOREIGN KEY (idFamille) REFERENCES Famille(idFamille);
ALTER TABLE ActionQSE ADD CONSTRAINT FK_ActionQSE_idVerification FOREIGN KEY (idVerification) REFERENCES Verification(idVerification);
ALTER TABLE ActionQSE ADD CONSTRAINT FK_ActionQSE_idSite FOREIGN KEY (idSite) REFERENCES Site(idSite);
ALTER TABLE ActionQSE ADD CONSTRAINT FK_ActionQSE_idAction_1 FOREIGN KEY (idAction_1) REFERENCES ActionQSE(idAction);
ALTER TABLE Detection ADD CONSTRAINT FK_Detection_idAction FOREIGN KEY (idAction) REFERENCES ActionQSE(idAction);
ALTER TABLE Reglementation ADD CONSTRAINT FK_Reglementation_idCategorie FOREIGN KEY (idCategorie) REFERENCES Categorie(idCategorie);
ALTER TABLE Verification ADD CONSTRAINT FK_Verification_idAction FOREIGN KEY (idAction) REFERENCES ActionQSE(idAction);
ALTER TABLE Detection_Reglementation ADD CONSTRAINT FK_Detection_Reglementation_idReglementation FOREIGN KEY (idReglementation) REFERENCES Reglementation(idReglementation);
ALTER TABLE Detection_Reglementation ADD CONSTRAINT FK_Detection_Reglementation_idAction FOREIGN KEY (idAction) REFERENCES ActionQSE(idAction);
ALTER TABLE Action_Tache ADD CONSTRAINT FK_Action_Tache_idTache FOREIGN KEY (idTache) REFERENCES Tache(idTache);
ALTER TABLE Action_Tache ADD CONSTRAINT FK_Action_Tache_idAction FOREIGN KEY (idAction) REFERENCES ActionQSE(idAction);
ALTER TABLE Questionnaire ADD CONSTRAINT FK_Questionnaire_idVerification FOREIGN KEY (idVerification) REFERENCES Verification(idVerification);
ALTER TABLE Questionnaire ADD CONSTRAINT FK_Questionnaire_idQuestion FOREIGN KEY (idQuestion) REFERENCES Question(idQuestion);
ALTER TABLE Salarie_Action ADD CONSTRAINT FK_Salarie_Action_idSalarie FOREIGN KEY (idSalarie) REFERENCES QSE(idSalarie);
ALTER TABLE Salarie_Action ADD CONSTRAINT FK_Salarie_Action_idAction FOREIGN KEY (idAction) REFERENCES ActionQSE(idAction);
