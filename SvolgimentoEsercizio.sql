--Creazione tabella Anagrafica con idanagrafica, Cognome, Nome, Indirizzo, Città, CAP, Cod_Fisc:
CREATE TABLE Anagrafica (
ID_Anagrafica INT PRIMARY KEY NOT NULL IDENTITY,
Cognome NVARCHAR(30) NOT NULL,
Nome NVARCHAR(30) NOT NULL,
Indirizzo NVARCHAR(50) NOT NULL,
Città NVARCHAR(40) NOT NULL,
CAP CHAR(5) NOT NULL,
Cod_Fisc NVARCHAR(16) NOT NULL,
)
INSERT INTO Anagrafica VALUES ('Bagigi', 'Gigi', 'Piazza Risorgimento 2', 'Milano', '20010', 'GIGBGG10K10N480G')
INSERT INTO Anagrafica VALUES ('Moldavi', 'Carlo', 'Via Albania 6', 'Torino', '10010', 'CRLMDV10K10N480G')
INSERT INTO Anagrafica VALUES ('Giacometti', 'Giuseppe', 'Via Palladini 8', 'Matera', '75010', 'GPPGTT10K10N480G')
INSERT INTO Anagrafica VALUES ('Mariani', 'Alisia', 'Via de Carolis 121', 'Ancona', '60010', 'ALSMRN10K10N480G')
INSERT INTO Anagrafica VALUES ('Giovanna', 'Giorno', 'Via Spaccanapoli 301', 'Napoli', '80010', 'GRNGVN10K10N480G')
INSERT INTO Anagrafica VALUES ('Balti', 'Bianca', 'Via Artemide 19', 'Milano', '20010', 'BNCBLT10K10N480G')
INSERT INTO Anagrafica VALUES ('Izzo', 'Michele', 'Via del Campo 31', 'Bari', '70010', 'MCLIZZ10K10N480G')
INSERT INTO Anagrafica VALUES ('Betello', 'Gianni', 'Piazza d Armi 5', 'Ferrara', '44011', 'GNNBTL10K10N480G')
INSERT INTO Anagrafica VALUES ('Paoli', 'Giacomo', 'Via N. Sauro 81', 'Vicenza', '36010', 'GCMPLI10K10N480G')
INSERT INTO Anagrafica VALUES ('Camoglio', 'Mario', 'Via Mazzini 7', 'Palermo', '90010', 'MARCMG10K10N480G')
INSERT INTO Anagrafica VALUES ('Crisantemi', 'Stefano', 'Via Crisantemi 4', 'Parma', '43010', 'SFNCST10K10N480G')
INSERT INTO Anagrafica VALUES ('Brasi', 'Luca', 'Via Fossati 11', 'Palermo', '90010', 'LCABRS10K10N480G')
INSERT INTO Anagrafica VALUES ('Marzio', 'Massimo', 'Via delle Cicale 50', 'Foggia', '71010', 'MSMMRZ10K10N480G')
INSERT INTO Anagrafica VALUES ('Di Giacomo', 'Alessandra', 'Via degli Astronauti 22', 'Asti', '14010', 'LSNDGM10K10N480G')
INSERT INTO Anagrafica VALUES ('Usai', 'Elisabetta', 'Via Istria 3', 'Sassari', '07100', 'ESBUSA10K10N480G')
INSERT INTO Anagrafica VALUES ('Pellegrino', 'Nicola', 'Vicolo Stretto 1', 'Palermo', '90010', 'NCLPGR10K10N480G')
INSERT INTO Anagrafica VALUES ('Nurra', 'Davide', 'Via Gramsci 18', 'Sassari', '07100', 'DVDNRR10K10N480G')
INSERT INTO Anagrafica VALUES ('Caselli', 'Kenneth', 'Via Piermenti 55', 'Arezzo', '52010', 'KENCSL10K10N480G')
INSERT INTO Anagrafica VALUES ('Corti', 'Maria', 'Viale Umberto I 390', 'Bologna', '40010', 'MRICRT10K10N480G')
INSERT INTO Anagrafica VALUES ('Merrino', 'Marco', 'Via Grassi 89', 'Palermo', '90010', 'MRCMRN10K10N480G')



--creazione tabella TipoViolazione con idviolazione, descrizione
CREATE TABLE TipoViolazione (
ID_Violazione INT PRIMARY KEY NOT NULL IDENTITY,
Descrizione NVARCHAR(150) NOT NULL
)
INSERT INTO TipoViolazione VALUES ('Retromarcia in autostrada') --10
INSERT INTO TipoViolazione VALUES ('Forzamento di posto di blocco') --10
INSERT INTO TipoViolazione VALUES ('Mancata osservanza dello stop') --6
INSERT INTO TipoViolazione VALUES ('Violazione obbligo precedenza ai pedoni') --8
INSERT INTO TipoViolazione VALUES ('Violazione obbligo precedenza') --5
INSERT INTO TipoViolazione VALUES ('Guida senza cintura') --5
INSERT INTO TipoViolazione VALUES ('Circolazione contromano') --4
INSERT INTO TipoViolazione VALUES ('Spargimento olio motore nella carreggiata') --4
INSERT INTO TipoViolazione VALUES ('Uso abbaglianti in condizioni vietate') --3
INSERT INTO TipoViolazione VALUES ('Mancato rispetto agli agenti') --3
INSERT INTO TipoViolazione VALUES ('Mancato utilizzo fari') --1
INSERT INTO TipoViolazione VALUES ('Trasporto in sovrannumero di persone') --1
INSERT INTO TipoViolazione VALUES ('Cambiamento corsia di marcia senza segnalazione') --2


SELECT * FROM Anagrafica
SELECT * FROM TipoViolazione

-- creazione tabella Verbale con idverbale, DataViolazione, IndirizzoViolazione, Nominativo_Agente, DataTrascrizioneVerbale, Importo,
--DecurtamentoPunti
CREATE TABLE Verbale (
	ID_Verbale INT PRIMARY KEY NOT NULL IDENTITY,
	DataViolazione SMALLDATETIME NOT NULL,
	IndirizzoViolazione NVARCHAR(40) NOT NULL,
	DataTrascrizioneVerbale SMALLDATETIME NOT NULL,
	Nominativo_Agente NVARCHAR(30) NOT NULL,
	Importo MONEY NOT NULL,
	DecurtamentoPunti TINYINT NOT NULL,
	ID_Anagrafica INT NOT NULL,
	ID_Violazione INT NOT NULL,

	CONSTRAINT FORKEY_Verbale_Anagrafica FOREIGN KEY (ID_Anagrafica) REFERENCES Anagrafica (ID_Anagrafica),
	CONSTRAINT FORKEY_Verbale_TipoViolazione FOREIGN KEY (ID_Violazione) REFERENCES TipoViolazione (ID_Violazione)
)
INSERT INTO Verbale VALUES ('2024-18-01 17:00','Via Brombeis 9', '2024-21-01 15:00', 'Scarano', 10000, 10, 15, 1)
INSERT INTO Verbale VALUES ('2024-01-02 13:00','Via Rockfeller 33', '2024-05-02 09:00', 'Montalbano', 15000, 10, 17, 2)
INSERT INTO Verbale VALUES ('2008-18-11 10:00','Via del Loto 10', '2009-21-11 11:30', 'Zenigata', 50, 3, 6, 9)
INSERT INTO Verbale VALUES ('2009-08-03 14:14','Via Puccini 5', '2013-27-05 09:27', 'Bruno', 315, 5, 10, 6)
INSERT INTO Verbale VALUES ('2009-07-07 11:40','Via Pavarotti 8', '2009-08-08 13:11', 'Bruno', 1560, 3, 18, 10)
INSERT INTO Verbale VALUES ('2010-03-06 19:55','Via Piave 62', '2010-22-07 18:30', 'Catarella', 1560, 3, 20, 10)
INSERT INTO Verbale VALUES ('2020-17-04 18:28','Via Risorgimento 111', '2021-25-10 15:35', 'Montalbano', 35, 1, 5, 12)
INSERT INTO Verbale VALUES ('2003-15-12 11:15','Via Canberra 20', '2004-03-01 17:10', 'Zenigata', 5490, 8, 8, 4)
INSERT INTO Verbale VALUES ('2006-07-08 16:10','Via Londra 69', '2006-05-09 14:20', 'Zenigata', 353, 5, 1, 6)
INSERT INTO Verbale VALUES ('2009-30-11 12:30','Via degli Ottomani 2', '2009-29-12 19:20', 'Montalbano', 222, 4, 9, 8)
INSERT INTO Verbale VALUES ('2000-01-01 08:15','Viale Augusto 43', '2000-21-01 16:55', 'Montalbano', 115, 3, 13, 9)
INSERT INTO Verbale VALUES ('2001-15-10 03:00','Viale dei Giardini 54', '2002-10-11 20:00', 'Bruno', 2315, 6, 12, 3)
INSERT INTO Verbale VALUES ('2017-08-02 23:25','Via Scipione 77', '2017-08-03 10:25', 'Scarano', 257, 4, 19, 7)
INSERT INTO Verbale VALUES ('2019-08-03 21:34','Via Carlo Alberto 90', '2019-08-03 15:00', 'Zenigata', 10000, 10, 3, 1)

SELECT * FROM Verbale

--Queries

--1. Conteggio dei verbali trascritti
SELECT COUNT(*) AS ConteggioVerbaliTrascritti FROM Verbale

--2. Conteggio dei verbali trascritti raggruppati per anagrafe
SELECT Cognome, Nome, COUNT(ID_Verbale) AS ConteggioVerbaliPerAnagrafe FROM Verbale
JOIN Anagrafica ON Verbale.ID_Anagrafica = Anagrafica.ID_Anagrafica
GROUP BY Cognome, Nome

--3. Conteggio dei verbali trascritti raggruppati per tipo di violazione
SELECT Descrizione, COUNT(ID_Verbale) AS ConteggioVerbaliPerViolazione FROM Verbale
JOIN TipoViolazione ON TipoViolazione.ID_Violazione = Verbale.ID_Violazione
GROUP BY Descrizione

--4. Totale dei punti decurtati per ogni anagrafe
SELECT Cognome, Nome, SUM(DecurtamentoPunti) AS TotalePuntiDecurtatiPerAnagrafe FROM Verbale
JOIN Anagrafica ON Verbale.ID_Anagrafica = Anagrafica.ID_Anagrafica
GROUP BY Cognome, Nome

--5. Cognome, Nome, Data violazione, Indirizzo violazione, importo e punti decurtati per tutti gli anagrafici residenti a Palermo
SELECT Cognome, Nome, DataViolazione, IndirizzoViolazione, Importo, DecurtamentoPunti FROM Anagrafica
JOIN Verbale ON Anagrafica.ID_Anagrafica = Verbale.ID_Anagrafica
WHERE Città = 'Palermo'

--6. Cognome, Nome, Indirizzo, Data violazione, importo e punti decurtati per le violazioni fatte tra il febbraio 2009 e luglio 2009
SELECT Cognome, Nome, Indirizzo, DataViolazione, Importo, DecurtamentoPunti FROM Verbale
JOIN Anagrafica ON Verbale.ID_Anagrafica = Anagrafica.ID_Anagrafica
WHERE DataViolazione BETWEEN '20090201' AND '20090731'

--7. Totale degli importi per ogni anagrafico
SELECT Cognome, Nome, SUM(Importo) AS TotaleSanzionePecuniaria FROM Verbale
JOIN Anagrafica ON Verbale.ID_Anagrafica = Anagrafica.ID_Anagrafica
GROUP BY Cognome, Nome

--8. Visualizzazione di tutti gli anagrafici residenti a Palermo
SELECT Cognome, Nome, Indirizzo, Città FROM Anagrafica
WHERE Città = 'Palermo'

--9. Query parametrica che visualizzi Data violazione, Importo e decurta mento punti relativi ad una certa data

--10.Conteggio delle violazioni contestate raggruppate per Nominativo dell’agente di Polizia
SELECT Nominativo_Agente, COUNT(*) AS ViolazioniContestate
FROM Verbale
GROUP BY Nominativo_Agente
--11. Cognome, Nome, Indirizzo, Data violazione, Importo e punti decurtati per tutte le violazioni che superino il decurtamento di 5 punti
SELECT Cognome, Nome, Indirizzo, DataViolazione, Importo, DecurtamentoPunti FROM Verbale
JOIN Anagrafica ON Verbale.ID_Anagrafica = Anagrafica.ID_Anagrafica
WHERE DecurtamentoPunti > 5

--12. Cognome, Nome, Indirizzo, Data violazione, Importo e punti decurtati per tutte le violazioni che superino l’importo di 400 euro
SELECT Cognome, Nome, Indirizzo, DataViolazione, Importo, DecurtamentoPunti FROM Verbale
JOIN Anagrafica ON Verbale.ID_Anagrafica = Anagrafica.ID_Anagrafica
WHERE Importo > 400