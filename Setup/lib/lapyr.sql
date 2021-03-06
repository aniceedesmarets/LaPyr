USE [master]
GO
/****** Object:  Database [lapyr]    Script Date: 23/04/2018 16:37:36 ******/
CREATE DATABASE [lapyr]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'lapyr', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\lapyr.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'lapyr_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\lapyr_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [lapyr] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lapyr].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lapyr] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lapyr] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lapyr] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lapyr] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lapyr] SET ARITHABORT OFF 
GO
ALTER DATABASE [lapyr] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [lapyr] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lapyr] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lapyr] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lapyr] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lapyr] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lapyr] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lapyr] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lapyr] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lapyr] SET  ENABLE_BROKER 
GO
ALTER DATABASE [lapyr] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lapyr] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lapyr] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lapyr] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lapyr] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lapyr] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lapyr] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lapyr] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [lapyr] SET  MULTI_USER 
GO
ALTER DATABASE [lapyr] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lapyr] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lapyr] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lapyr] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [lapyr] SET DELAYED_DURABILITY = DISABLED 
GO
USE [lapyr]
GO
/****** Object:  Table [dbo].[Action_Tache]    Script Date: 23/04/2018 16:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action_Tache](
	[detail] [varchar](200) NULL,
	[fait] [bit] NULL,
	[idTache] [int] NOT NULL,
	[idAction] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionQSE]    Script Date: 23/04/2018 16:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionQSE](
	[idAction] [int] IDENTITY(1,1) NOT NULL,
	[dateDebut] [datetime] NULL,
	[delais] [float] NULL,
	[acheve] [float] NULL,
	[numeroImportance] [int] NULL,
	[dateFin] [datetime] NULL,
	[pieceJustificative] [varchar](50) NULL,
	[nom] [varchar](50) NULL,
	[recurrence] [varchar](50) NULL,
	[idFamille] [int] NULL,
	[idVerification] [int] NULL,
	[idSite] [int] NULL,
	[idAction_1] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorie]    Script Date: 23/04/2018 16:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorie](
	[idCategorie] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detection]    Script Date: 23/04/2018 16:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detection](
	[idDetection] [int] IDENTITY(1,1) NOT NULL,
	[nomDetection] [varchar](50) NULL,
	[detailDetection] [varchar](200) NULL,
	[descriptionAnalyse] [varchar](200) NULL,
	[conclusionAnalyse] [varchar](200) NULL,
	[idAction] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detection_Reglementation]    Script Date: 23/04/2018 16:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detection_Reglementation](
	[idReglementation] [int] NOT NULL,
	[idAction] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Famille]    Script Date: 23/04/2018 16:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Famille](
	[idFamille] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QSE]    Script Date: 23/04/2018 16:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QSE](
	[idSalarie] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NULL,
	[statutHierarchique] [varchar](50) NULL,
	[email] [varchar](100) NULL,
	[tel] [varchar](10) NULL,
	[prenom] [varchar](50) NULL,
	[identifiant] [varchar](50) NULL,
	[mdp] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 23/04/2018 16:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[idQuestion] [int] IDENTITY(1,1) NOT NULL,
	[question] [varchar](100) NULL,
	[detail] [varchar](200) NULL,
	[pointOui] [float] NULL,
	[pointNon] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questionnaire]    Script Date: 23/04/2018 16:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questionnaire](
	[idVerification] [int] NOT NULL,
	[idQuestion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reglementation]    Script Date: 23/04/2018 16:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reglementation](
	[idReglementation] [int] IDENTITY(1,1) NOT NULL,
	[designation] [varchar](200) NULL,
	[lien] [varchar](200) NULL,
	[idCategorie] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salarie_Action]    Script Date: 23/04/2018 16:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salarie_Action](
	[type] [varchar](25) NULL,
	[idSalarie] [int] NOT NULL,
	[idAction] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Site]    Script Date: 23/04/2018 16:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Site](
	[idSite] [int] IDENTITY(1,1) NOT NULL,
	[nomSite] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tache]    Script Date: 23/04/2018 16:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tache](
	[idTache] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NULL,
	[description] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Verification]    Script Date: 23/04/2018 16:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Verification](
	[idVerification] [int] IDENTITY(1,1) NOT NULL,
	[moyenne] [float] NULL,
	[totalPoint] [float] NULL,
	[idAction] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Action_Tache] ([detail], [fait], [idTache], [idAction]) VALUES (NULL, NULL, 1, 2)
SET IDENTITY_INSERT [dbo].[ActionQSE] ON 

INSERT [dbo].[ActionQSE] ([idAction], [dateDebut], [delais], [acheve], [numeroImportance], [dateFin], [pieceJustificative], [nom], [recurrence], [idFamille], [idVerification], [idSite], [idAction_1]) VALUES (2, CAST(N'2018-03-12T00:00:00.000' AS DateTime), 180, 0, 1, NULL, NULL, N'action1', NULL, 1, 1, 6, NULL)
SET IDENTITY_INSERT [dbo].[ActionQSE] OFF
SET IDENTITY_INSERT [dbo].[Categorie] ON 

INSERT [dbo].[Categorie] ([idCategorie], [nom]) VALUES (1, N'Categorie1')
INSERT [dbo].[Categorie] ([idCategorie], [nom]) VALUES (2, N'Categorie2')
SET IDENTITY_INSERT [dbo].[Categorie] OFF
SET IDENTITY_INSERT [dbo].[Detection] ON 

INSERT [dbo].[Detection] ([idDetection], [nomDetection], [detailDetection], [descriptionAnalyse], [conclusionAnalyse], [idAction]) VALUES (1, N'Autorisation conduite', N'Autorisation de conduite sur le chantier de Tarbes est périmé pour certain agent', N'Pourquoi refaire une autorisation de conduite pour les agents ?', N'Elle est obligatoire, et ne peut circuler avec ce document', 2)
SET IDENTITY_INSERT [dbo].[Detection] OFF
INSERT [dbo].[Detection_Reglementation] ([idReglementation], [idAction]) VALUES (1, 2)
INSERT [dbo].[Detection_Reglementation] ([idReglementation], [idAction]) VALUES (2, 2)
SET IDENTITY_INSERT [dbo].[Famille] ON 

INSERT [dbo].[Famille] ([idFamille], [nom]) VALUES (1, N'ENVIRONNEMNT')
INSERT [dbo].[Famille] ([idFamille], [nom]) VALUES (2, N'MATERIEL')
INSERT [dbo].[Famille] ([idFamille], [nom]) VALUES (3, N'QUALITE')
INSERT [dbo].[Famille] ([idFamille], [nom]) VALUES (4, N'RH')
INSERT [dbo].[Famille] ([idFamille], [nom]) VALUES (5, N'SECURITE')
SET IDENTITY_INSERT [dbo].[Famille] OFF
SET IDENTITY_INSERT [dbo].[QSE] ON 

INSERT [dbo].[QSE] ([idSalarie], [nom], [statutHierarchique], [email], [tel], [prenom], [identifiant], [mdp]) VALUES (1, N'desmarets', NULL, N'anicee.desmarets@gmail.com', N'0632357453', N'anicée', N'adesmarets', N'1234')
INSERT [dbo].[QSE] ([idSalarie], [nom], [statutHierarchique], [email], [tel], [prenom], [identifiant], [mdp]) VALUES (2, N'magnou', NULL, N'rmagnou@gmail.com', N'0632357453', N'romain', N'rmagnou', N'1234')
INSERT [dbo].[QSE] ([idSalarie], [nom], [statutHierarchique], [email], [tel], [prenom], [identifiant], [mdp]) VALUES (3, N'lasarte', NULL, NULL, NULL, N'marc-antoine', N'mlasarte', N'1234')
SET IDENTITY_INSERT [dbo].[QSE] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([idQuestion], [question], [detail], [pointOui], [pointNon]) VALUES (1, N'Trouvez-vous que le projet traité est bon ?', NULL, NULL, NULL)
INSERT [dbo].[Question] ([idQuestion], [question], [detail], [pointOui], [pointNon]) VALUES (2, N'Les taux sont-ils bons?', NULL, NULL, NULL)
INSERT [dbo].[Question] ([idQuestion], [question], [detail], [pointOui], [pointNon]) VALUES (3, N'Toutes les personnes sont informées et informées ?', NULL, NULL, NULL)
INSERT [dbo].[Question] ([idQuestion], [question], [detail], [pointOui], [pointNon]) VALUES (4, N'Avez-vous des subjections à faire ?', NULL, NULL, NULL)
INSERT [dbo].[Question] ([idQuestion], [question], [detail], [pointOui], [pointNon]) VALUES (5, N'Cette action doit se refaire ?', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Question] OFF
INSERT [dbo].[Questionnaire] ([idVerification], [idQuestion]) VALUES (1, 1)
INSERT [dbo].[Questionnaire] ([idVerification], [idQuestion]) VALUES (1, 2)
INSERT [dbo].[Questionnaire] ([idVerification], [idQuestion]) VALUES (1, 3)
INSERT [dbo].[Questionnaire] ([idVerification], [idQuestion]) VALUES (1, 4)
INSERT [dbo].[Questionnaire] ([idVerification], [idQuestion]) VALUES (1, 5)
SET IDENTITY_INSERT [dbo].[Reglementation] ON 

INSERT [dbo].[Reglementation] ([idReglementation], [designation], [lien], [idCategorie]) VALUES (1, N'lien1', N'www.lien1.com', 1)
INSERT [dbo].[Reglementation] ([idReglementation], [designation], [lien], [idCategorie]) VALUES (2, N'lien2', N'www.lien2.com', 1)
INSERT [dbo].[Reglementation] ([idReglementation], [designation], [lien], [idCategorie]) VALUES (3, N'lien3', N'www.lien3.com', 2)
INSERT [dbo].[Reglementation] ([idReglementation], [designation], [lien], [idCategorie]) VALUES (4, N'lien4', N'www.lien4.com', 2)
INSERT [dbo].[Reglementation] ([idReglementation], [designation], [lien], [idCategorie]) VALUES (5, N'lien5', N'www.lien5.com', 2)
SET IDENTITY_INSERT [dbo].[Reglementation] OFF
INSERT [dbo].[Salarie_Action] ([type], [idSalarie], [idAction]) VALUES (N'CREATEUR', 1, 2)
INSERT [dbo].[Salarie_Action] ([type], [idSalarie], [idAction]) VALUES (N'EXECUTEUR', 2, 2)
INSERT [dbo].[Salarie_Action] ([type], [idSalarie], [idAction]) VALUES (N'VERIFICATEUR', 3, 2)
SET IDENTITY_INSERT [dbo].[Site] ON 

INSERT [dbo].[Site] ([idSite], [nomSite]) VALUES (1, N'ATV')
INSERT [dbo].[Site] ([idSite], [nomSite]) VALUES (2, N'ERM 1')
INSERT [dbo].[Site] ([idSite], [nomSite]) VALUES (3, N'PAU')
INSERT [dbo].[Site] ([idSite], [nomSite]) VALUES (4, N'PERIOLE')
INSERT [dbo].[Site] ([idSite], [nomSite]) VALUES (5, N'RAYNAL')
INSERT [dbo].[Site] ([idSite], [nomSite]) VALUES (6, N'TARBES')
INSERT [dbo].[Site] ([idSite], [nomSite]) VALUES (7, N'TOUS')
SET IDENTITY_INSERT [dbo].[Site] OFF
SET IDENTITY_INSERT [dbo].[Tache] ON 

INSERT [dbo].[Tache] ([idTache], [nom], [description]) VALUES (1, N'Formation', N'Elaboration du plan de formation')
SET IDENTITY_INSERT [dbo].[Tache] OFF
SET IDENTITY_INSERT [dbo].[Verification] ON 

INSERT [dbo].[Verification] ([idVerification], [moyenne], [totalPoint], [idAction]) VALUES (1, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Verification] OFF
/****** Object:  Index [prk_constraint_Action_Tache]    Script Date: 23/04/2018 16:37:36 ******/
ALTER TABLE [dbo].[Action_Tache] ADD  CONSTRAINT [prk_constraint_Action_Tache] PRIMARY KEY NONCLUSTERED 
(
	[idTache] ASC,
	[idAction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_ActionQSE]    Script Date: 23/04/2018 16:37:36 ******/
ALTER TABLE [dbo].[ActionQSE] ADD  CONSTRAINT [prk_constraint_ActionQSE] PRIMARY KEY NONCLUSTERED 
(
	[idAction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Categorie]    Script Date: 23/04/2018 16:37:36 ******/
ALTER TABLE [dbo].[Categorie] ADD  CONSTRAINT [prk_constraint_Categorie] PRIMARY KEY NONCLUSTERED 
(
	[idCategorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Detection]    Script Date: 23/04/2018 16:37:36 ******/
ALTER TABLE [dbo].[Detection] ADD  CONSTRAINT [prk_constraint_Detection] PRIMARY KEY NONCLUSTERED 
(
	[idDetection] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Detection_Reglementation]    Script Date: 23/04/2018 16:37:36 ******/
ALTER TABLE [dbo].[Detection_Reglementation] ADD  CONSTRAINT [prk_constraint_Detection_Reglementation] PRIMARY KEY NONCLUSTERED 
(
	[idReglementation] ASC,
	[idAction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Famille]    Script Date: 23/04/2018 16:37:36 ******/
ALTER TABLE [dbo].[Famille] ADD  CONSTRAINT [prk_constraint_Famille] PRIMARY KEY NONCLUSTERED 
(
	[idFamille] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_QSE]    Script Date: 23/04/2018 16:37:36 ******/
ALTER TABLE [dbo].[QSE] ADD  CONSTRAINT [prk_constraint_QSE] PRIMARY KEY NONCLUSTERED 
(
	[idSalarie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Question]    Script Date: 23/04/2018 16:37:36 ******/
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [prk_constraint_Question] PRIMARY KEY NONCLUSTERED 
(
	[idQuestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Questionnaire]    Script Date: 23/04/2018 16:37:36 ******/
ALTER TABLE [dbo].[Questionnaire] ADD  CONSTRAINT [prk_constraint_Questionnaire] PRIMARY KEY NONCLUSTERED 
(
	[idVerification] ASC,
	[idQuestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Reglementation]    Script Date: 23/04/2018 16:37:36 ******/
ALTER TABLE [dbo].[Reglementation] ADD  CONSTRAINT [prk_constraint_Reglementation] PRIMARY KEY NONCLUSTERED 
(
	[idReglementation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Salarie_Action]    Script Date: 23/04/2018 16:37:36 ******/
ALTER TABLE [dbo].[Salarie_Action] ADD  CONSTRAINT [prk_constraint_Salarie_Action] PRIMARY KEY NONCLUSTERED 
(
	[idSalarie] ASC,
	[idAction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Site]    Script Date: 23/04/2018 16:37:36 ******/
ALTER TABLE [dbo].[Site] ADD  CONSTRAINT [prk_constraint_Site] PRIMARY KEY NONCLUSTERED 
(
	[idSite] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Tache]    Script Date: 23/04/2018 16:37:36 ******/
ALTER TABLE [dbo].[Tache] ADD  CONSTRAINT [prk_constraint_Tache] PRIMARY KEY NONCLUSTERED 
(
	[idTache] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [prk_constraint_Verification]    Script Date: 23/04/2018 16:37:36 ******/
ALTER TABLE [dbo].[Verification] ADD  CONSTRAINT [prk_constraint_Verification] PRIMARY KEY NONCLUSTERED 
(
	[idVerification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Action_Tache]  WITH CHECK ADD  CONSTRAINT [FK_Action_Tache_idAction] FOREIGN KEY([idAction])
REFERENCES [dbo].[ActionQSE] ([idAction])
GO
ALTER TABLE [dbo].[Action_Tache] CHECK CONSTRAINT [FK_Action_Tache_idAction]
GO
ALTER TABLE [dbo].[Action_Tache]  WITH CHECK ADD  CONSTRAINT [FK_Action_Tache_idTache] FOREIGN KEY([idTache])
REFERENCES [dbo].[Tache] ([idTache])
GO
ALTER TABLE [dbo].[Action_Tache] CHECK CONSTRAINT [FK_Action_Tache_idTache]
GO
ALTER TABLE [dbo].[ActionQSE]  WITH CHECK ADD  CONSTRAINT [FK_ActionQSE_idAction_1] FOREIGN KEY([idAction_1])
REFERENCES [dbo].[ActionQSE] ([idAction])
GO
ALTER TABLE [dbo].[ActionQSE] CHECK CONSTRAINT [FK_ActionQSE_idAction_1]
GO
ALTER TABLE [dbo].[ActionQSE]  WITH CHECK ADD  CONSTRAINT [FK_ActionQSE_idFamille] FOREIGN KEY([idFamille])
REFERENCES [dbo].[Famille] ([idFamille])
GO
ALTER TABLE [dbo].[ActionQSE] CHECK CONSTRAINT [FK_ActionQSE_idFamille]
GO
ALTER TABLE [dbo].[ActionQSE]  WITH CHECK ADD  CONSTRAINT [FK_ActionQSE_idSite] FOREIGN KEY([idSite])
REFERENCES [dbo].[Site] ([idSite])
GO
ALTER TABLE [dbo].[ActionQSE] CHECK CONSTRAINT [FK_ActionQSE_idSite]
GO
ALTER TABLE [dbo].[ActionQSE]  WITH CHECK ADD  CONSTRAINT [FK_ActionQSE_idVerification] FOREIGN KEY([idVerification])
REFERENCES [dbo].[Verification] ([idVerification])
GO
ALTER TABLE [dbo].[ActionQSE] CHECK CONSTRAINT [FK_ActionQSE_idVerification]
GO
ALTER TABLE [dbo].[Detection]  WITH CHECK ADD  CONSTRAINT [FK_Detection_idAction] FOREIGN KEY([idAction])
REFERENCES [dbo].[ActionQSE] ([idAction])
GO
ALTER TABLE [dbo].[Detection] CHECK CONSTRAINT [FK_Detection_idAction]
GO
ALTER TABLE [dbo].[Detection_Reglementation]  WITH CHECK ADD  CONSTRAINT [FK_Detection_Reglementation_idAction] FOREIGN KEY([idAction])
REFERENCES [dbo].[ActionQSE] ([idAction])
GO
ALTER TABLE [dbo].[Detection_Reglementation] CHECK CONSTRAINT [FK_Detection_Reglementation_idAction]
GO
ALTER TABLE [dbo].[Detection_Reglementation]  WITH CHECK ADD  CONSTRAINT [FK_Detection_Reglementation_idReglementation] FOREIGN KEY([idReglementation])
REFERENCES [dbo].[Reglementation] ([idReglementation])
GO
ALTER TABLE [dbo].[Detection_Reglementation] CHECK CONSTRAINT [FK_Detection_Reglementation_idReglementation]
GO
ALTER TABLE [dbo].[Reglementation]  WITH CHECK ADD  CONSTRAINT [FK_Reglementation_idCategorie] FOREIGN KEY([idCategorie])
REFERENCES [dbo].[Categorie] ([idCategorie])
GO
ALTER TABLE [dbo].[Reglementation] CHECK CONSTRAINT [FK_Reglementation_idCategorie]
GO
ALTER TABLE [dbo].[Salarie_Action]  WITH CHECK ADD  CONSTRAINT [FK_Salarie_Action_idAction] FOREIGN KEY([idAction])
REFERENCES [dbo].[ActionQSE] ([idAction])
GO
ALTER TABLE [dbo].[Salarie_Action] CHECK CONSTRAINT [FK_Salarie_Action_idAction]
GO
ALTER TABLE [dbo].[Salarie_Action]  WITH CHECK ADD  CONSTRAINT [FK_Salarie_Action_idSalarie] FOREIGN KEY([idSalarie])
REFERENCES [dbo].[QSE] ([idSalarie])
GO
ALTER TABLE [dbo].[Salarie_Action] CHECK CONSTRAINT [FK_Salarie_Action_idSalarie]
GO
ALTER TABLE [dbo].[Verification]  WITH CHECK ADD  CONSTRAINT [FK_Verification_idAction] FOREIGN KEY([idAction])
REFERENCES [dbo].[ActionQSE] ([idAction])
GO
ALTER TABLE [dbo].[Verification] CHECK CONSTRAINT [FK_Verification_idAction]
GO
USE [master]
GO
ALTER DATABASE [lapyr] SET  READ_WRITE 
GO
