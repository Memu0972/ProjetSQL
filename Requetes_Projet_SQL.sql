-- Création de la base de données
CREATE DATABASE Librairie;
GO

-- Utilisation de la base de données
USE Librairie;
GO

-- Création de la table Auteurs
CREATE TABLE Auteurs (
    AuteurID INT IDENTITY(1,1) PRIMARY KEY,
    NomAuteur VARCHAR(255) NOT NULL
);
GO

-- Ajout de la colonne dans la table Auteurs 
ALTER TABLE Auteurs
ADD PaysOrigine VARCHAR (100);

-- Mettre à jour les pays d'origine pour ces auteurs
UPDATE Auteurs
SET PaysOrigine = 'Union Soviétique'
WHERE NomAuteur = 'Isaac Asimov';

GO

-- Création de la table Livres
CREATE TABLE Livres (
    LivreID INT IDENTITY(1,1) PRIMARY KEY,
    Titre VARCHAR(255) NOT NULL,
    Genre VARCHAR(100),
    AuteurID INT,
    Prix DECIMAL(10, 2),
    DatePublication DATE,
    CONSTRAINT FK_Livres_Auteurs FOREIGN KEY (AuteurID) REFERENCES Auteurs(AuteurID)
);
GO

-- Création de la table Clients
CREATE TABLE Clients (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    NomClient VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Adresse VARCHAR(500),
    Telephone VARCHAR(20)
);
GO

-- Création de la table Commandes
CREATE TABLE Commandes (
    CommandeID INT IDENTITY(1,1) PRIMARY KEY,
    ClientID INT,
    DateCommande DATE,
    Total DECIMAL(10, 2),
    CONSTRAINT FK_Commandes_Clients FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);
GO

-- Création de la table DétailsCommande
CREATE TABLE DetailsCommande (
    DetailsCommandeID INT IDENTITY(1,1) PRIMARY KEY,
    CommandeID INT,
    LivreID INT,
    Quantite INT,
    PrixUnitaire DECIMAL(10, 2),
    CONSTRAINT FK_DetailsCommande_Commandes FOREIGN KEY (CommandeID) REFERENCES Commandes(CommandeID),
    CONSTRAINT FK_DetailsCommande_Livres FOREIGN KEY (LivreID) REFERENCES Livres(LivreID)
);
GO

-- Insertion des données dans Auteurs

INSERT INTO Auteurs (NomAuteur, PaysOrigine) 
VALUES 
('Robert Greene','Amérique'),
('Derek Sivers','France'),
('Marie-Eve Roy','France'),
('Catherine Bensaid','France'),
('Diane Baron','France'),
('Eckhart Tolle','France'),
('Aurélie Michel ','Amérique'),
('Jean Philippe Omotunde','France'),
('Nathalie Renault-Robet','France'),
('Flaurence Cadier','France');

GO

-- Insertion des données dans Livres
INSERT INTO Livres (Titre, Genre, AuteurID, Prix, DatePublication) 
VALUES 
('Le 48 Lois du pouvoir ', 'Devellopement personnelle', 21, 20.00, '2018-12-08'),
('Tout est entre tes mains ', 'Devellopement personnelle', 22, 15.00, '2020-01-08'),
('On a juste une vie à vivre ', 'Devellopement personnelle', 23, 10.00, '2014-08-06'),
('Aime toi, La vie t''aimera', 'Devellopement personnelle', 24, 25.00, '2018-06-22'),
('J''ai décidé de m''aimer', 'Devellopement personnelle', 25, 12.00, '2015-05-09'),
('Art du calme intérieur', 'Devellopement personnelle', 26, 20.00, '2012-10-10'),
('Un monde en nègre et blanc', 'Histoire', 27, 20.00, '2012-10-11'),
('L''origine négro-africaine du savoir grec', 'Histoire', 28, 15.00, '2013-11-12'),
('Les discours de l''histoire', 'Histoire', 29, 09.00, '2012-10-10'),
('Né coupable', 'Histoire',30, 10.00, '2010-10-10'),
('The power of dsicipline', 'Devellopement personnelle',5, 15.00, '2010-10-10');


GO

-- Insertion des données dans Clients
INSERT INTO Clients (NomClient, Email, Adresse, Telephone) 
VALUES  
('Acsa Mbombo', 'acsambombo@gmail.com', 'Q.Route d''ouvira 15, Bukavu', '0976764548'),
('Busoko Safi', 'busokasafi@gmail.com', 'Q.Place 18, Bukavu', '0823334583'),
('Kenaya Yogolelo', 'kenayayogolelo@gmail.com', 'Q.Labote 25, Bukavu', '0997670101'),
('Junior Kasereka', 'juniorkasereka@gmail.com', 'Q.Beni 52, Beni', '0972836745'),
('Bruno Rix', 'brunorix@gmail.com', 'Q.limite 5, Kinshasa', '08234456754'),
('Ruffin Gallantry', 'ruffingallantry@gmail.com', 'Q.Katindo 78, Goma', '0997670101');
GO

SELECT * FROM Clients;

-- Insertion des données dans Commandes
INSERT INTO Commandes (ClientID, DateCommande, Total) 
VALUES 
(1, '2025-04-01', 35.98),
(2, '2025-04-02', 28.98),
(3, '2025-04-10', 23.00),
(3, '2025-04-11', 25.00),
(3, '2025-04-12', 10.00),
(3, '2025-04-13', 19.99),
(3, '2025-04-14', 20.00),
(5, '2025-04-08', 9.90),
(5, '2025-04-09', 20.90),
(5, '2025-04-14', 9.90),
(3, '2025-04-14', 9.90),
(3, '2025-04-14', 9.90),
(1, '2025-04-01', 15.00), 
(2, '2025-04-05', 15.00), 
(3, '2025-04-07', 15.00), 
(5, '2025-04-10', 15.00); 

INSERT INTO Commandes (ClientID, DateCommande, Total) 
VALUES 
(4, '2025-03-09', 15.00),
(6, '2025-02-10', 15.00),
(7, '2025-01-12', 15.00),
(8, '2025-02-13', 15.00),
(9, '2025-03-14', 15.00),
(10, '2025-04-06', 15.00); 

GO

-- Insertion des données dans DétailsCommande
INSERT INTO DetailsCommande (CommandeID, LivreID, Quantite, PrixUnitaire) 
VALUES 
(1, 1, 1, 19.99),
(1, 2, 1, 15.99),
(2, 2, 1, 15.99),
(2, 3, 1, 12.99),
(8, 5, 1, 23.00),
(9, 6, 1, 25.00),
(10, 7, 1, 217.99),
(11, 8, 1, 20.00),
(12, 9, 1, 10.99),
(13, 10, 1, 09.90),
(14, 16, 1, 20.90),
(15, 14, 1, 09.90),
(16, 10, 1, 09.90),
(17, 51, 1, 15.00),
(18, 51, 1, 15.00),
(19, 51, 1, 15.00),
(20, 51, 1, 15.00),
(21, 51, 1, 15.00),
(22, 51, 1, 15.00),
(23, 51, 1, 15.00),
(24, 51, 1, 15.00),
(25, 51, 1, 15.00),
(26, 51, 1, 15.00);


--Afficher moi les livres ayant ces prix : 09.20 et 20.90 
SELECT * FROM Livres
WHERE Prix IN (9.90,20.90);

--Affiche moi la commande ID du client dont son ID est 5
SELECT CommandeID FROM Commandes
WHERE ClientID =5;

select * from Clients;

GO

--Projet d'analyse SQL d'une librairie

--Les Tris " ORDER BY ASC AND DESC"
--Afficher les noms des Auteurs triés par noms Croissants et  décroissants.

SELECT * FROM Auteurs ORDER BY NomAuteur ASC;

Go

SELECT * FROM Auteurs ORDER BY NomAuteur DESC;

Go
--FONCTION AGGREGATION 
--Afficher les nombres des auteurs
SELECT COUNT(*) AS Nbr_Auteurs FROM Auteurs;

Go
--Aficher le nom de l'auteur dont la lettre commence par S
SELECT * From Auteurs
WHERE NomAuteur LIKE 'S%';

Go
SELECT * FROM Commandes;
/*Pour Afficher les NOM du client a la place de son ID etant comme clés étrangères,
Vous devez utiliser une jointure entre la table Commande et la Table client.
*/
Go

SELECT 
Commandes.CommandeID,
Clients.NomClient AS Nom_Client,
Commandes.DateCommande,
Commandes.Total

FROM Commandes JOIN Clients
ON
Commandes.ClientID = Clients.ClientID;

Go
--Afficher les nombres des données par table  
SELECT  COUNT(*) AS Nbre_Auteurs FROM Auteurs
SELECT  COUNT(*) AS Nbre_Clients FROM Clients
SELECT  COUNT(*) AS Nbre_Livre FROM Livres;
SELECT  COUNT(*) AS Nbre_Commandes FROM Commandes
SELECT  COUNT(*) AS Nbre_DetailsCommande FROM DetailsCommande; 

SELECT * FROM Livres;

Go
--Afficher les doublons sur cette combinaison des colonnes
SELECT Titre,Genre, AuteurID,Prix,DatePublication, COUNT(*) AS Nombre_de_doublons
FROM Livres
GROUP BY Titre, Genre,AuteurID,Prix,DatePublication
HAVING COUNT(*) >1;

Go
--Supprimer la ligne en doublon tout en gardant une 
DELETE FROM Livres
WHERE LivreID NOT IN (
SELECT LivreID FROM (
SELECT LivreID,
ROW_NUMBER() OVER (PARTITION 
BY Titre, Genre,AuteurID,Prix,DatePublication ORDER BY LivreID) AS rn
FROM Livres
)AS t
WHERE rn =1
);

Go

--Projet d'analyse SQL d'une librairie
--1. Analyse des Ventes
--•	Quel est le livre le plus vendu ?
SELECT TOP 1 L.Titre, SUM(D.quantite) AS Total_vendus
FROM Livres L
JOIN DetailsCommande D ON L.LivreID =D.LivreID
GROUP BY L.Titre
ORDER BY Total_vendus DESC ;

Go

--•	Quels sont les 5 livres les plus achetés ?
SELECT TOP 5 L.Titre, SUM(D.quantite) AS Nombres_Achats
FROM Livres L
JOIN DetailsCommande D ON L.LivreID =D.LivreID
GROUP BY L.Titre
ORDER BY Nombres_Achats DESC;

Go
--•	Quelle est la tendance mensuelle des ventes ?

SELECT FORMAT(C.DateCommande, 'yyyy-MM') AS Mois, 
SUM(D.quantite) AS Total_vendus
From Commandes C
JOIN DetailsCommande D ON C.CommandeID = D.CommandeID
GROUP BY FORMAT(C.DateCommande,'yyyy-MM')
ORDER BY Mois;

Go
--•	Quelle est la tendance mensuelle des ventes par livre ?
SELECT FORMAT(C.DateCommande, 'yyyy-MM') AS Mois, L.Titre,
SUM(D.quantite) AS Total_vendus
From Commandes C
JOIN DetailsCommande D ON C.CommandeID = D.CommandeID
JOIN Livres L ON D.LivreID = L.LivreID
GROUP BY FORMAT (C.DateCommande,'yyyy-MM'),L.Titre
ORDER BY Mois, Total_vendu;

Go
--•	Quel auteur génère le plus de ventes ?
SELECT TOP 1
A.NomAuteur	AS Nom_Auteur,
SUM(D.quantite) AS Total_Vendus 
FROM Livres L
JOIN Auteurs A ON L.AuteurID = A.AuteurID
JOIN DetailsCommande D ON L.LivreID = D.LivreID
GROUP BY A.NomAuteur
ORDER BY Total_Vendus DESC;

Go
--2. Analyse des Clients
--•	Qui sont les meilleurs clients (ceux qui achètent le plus) ?
SELECT TOP 3
C.NomClient,
SUM(L.prix * dc.quantite) AS Total
FROM Clients c
JOIN Commandes co ON c.ClientID = c.ClientID
JOIN DetailsCommande dc  ON co.CommandeID = dc.CommandeID
JOIN Livres l ON dc.LivreID = l.LivreID  
GROUP BY c.NomClient
ORDER BY Total DESC;

--•	Combien de clients reviennent pour une deuxième commande ?
SELECT
       COUNT(*) AS Clients_Fideles
	 FROM ( 
	 SELECT
			 ClientID
	 FROM
			 Commandes
	 GROUP BY 
				ClientID
	 HAVING
				COUNT(*) >=2) AS Clients_avec_plusieur_commande;

--Pour voir leurs noms :
SELECT
c.ClientID,
c.NomClient,
       
	   COUNT(co.CommandeID) AS Nombre_de_Commande
FROM 
	 Clients c
	 JOIN Commandes co ON c.ClientID = co.ClientID
GROUP BY
	 c.ClientID, c.NomClient
HAVING	 
	COUNT(co.CommandeID) >=2 ;
Go

--3. Analyse des Auteurs et Livres
--•	Combien de livres chaque auteur a-t-il publié ?
SELECT
	a.AuteurID,
	a.NomAuteur,
	COUNT(l.LivreID) AS Nombre_des_Livres
FROM 
Auteurs a
LEFT JOIN
Livres l ON a.AuteurID = l.AuteurID
GROUP BY
a.AuteurID, a.NomAuteur
ORDER BY 
 Nombre_des_Livres DESC;

Go
--•	Quel genre littéraire est le plus représenté dans les ventes ?
SELECT l.Genre, SUM(dc.quantite) AS Total_Vendus
FROM Livres l

JOIN DetailsCommande dc ON l.LivreID = dc.LivreID
GROUP BY  l.Genre

ORDER BY Total_Vendus DESC;

Go
--•	Quels livres n’ont jamais été commandés ?
SELECT
	l.LivreID,
	l.Titre,
	l.Genre,
	l.Prix
FROM
	Livres l
LEFT JOIN
	DetailsCommande dc ON l.LivreID = dc.LivreID
WHERE
	dc.LivreID IS NULL;
Go
--4. Performances Commerciales
--•	Quelle est la valeur totale des ventes ?
SELECT 
		SUM(quantite * PrixUnitaire) AS Total_Vente
FROM DetailsCommande;  

Go
--•	Quel est le chiffre d’affaires généré par mois ?

SELECT FORMAT(C.DateCommande, 'yyyy-MM') AS Mois, 
SUM(dc.quantite * dc.PrixUnitaire) AS Chiffre_Affaires
From DetailsCommande dc
JOIN Commandes c ON dc.CommandeID = c.CommandeID
GROUP BY FORMAT(C.DateCommande,'yyyy-MM')
ORDER BY Mois;

Go
--•	Combien de commandes sont effectuées par mois ?
SELECT 
	FORMAT(DateCommande, 'yyyy-MM') AS Mois,
	COUNT(*) AS Nombre_Commandes
FROM Commandes 
GROUP BY FORMAT(DateCommande, 'yyyy-MM')
ORDER BY Mois;

Go
--•	Quelle est la commande la plus chère jamais faite ?
SELECT TOP 1
	dc.CommandeID,
	SUM(dc.quantite * dc.PrixUnitaire) AS Montant_Total
FROM DetailsCommande dc
GROUP BY dc.CommandeID
ORDER BY Montant_Total DESC;

Go
--5. Indicateurs clés à surveiller (KPIs)
--•	Taux de rétention des clients (combien reviennent)
WITH Commande_par_Client AS(
	SELECT ClientID, COUNT(*) AS Nbre_Commandes
	FROM Commandes
	GROUP BY ClientID
	)
SELECT 
	COUNT(CASE WHEN Nbre_Commandes >=2 THEN 1 END) * 100.0 / COUNT(*) AS Taux_Rétention_Clients
	FROM Commande_par_Client;
--•	Taux de conversion (si applicable)
--•	Taux de croissance des ventes
--•	Temps moyen entre deux commandes d’un même client



