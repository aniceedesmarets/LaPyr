USE lapyr;
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

