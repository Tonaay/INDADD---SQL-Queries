CREATE DATABASE UP821148db;

CREATE TABLE Client (
clientID integer,
clientTitle varchar(40),
clientFName varchar(40),
clientLName varchar(40),
clientAddress1 varchar(100),
clientCity varchar(50),
clientPhone varchar(15),
clientEmail varchar(50),
clientAccount integer,
PRIMARY KEY (clientID)
);


CREATE TABLE Participant (
partID integer(11),
partTitle varchar(15),
partFName varchar(40),
partLName varchar(40),
partDOB date,
partAddress1 varchar(100),
partCity varchar(30),
partPhone varchar(15),
partEmail varchar(50),
amountRaised decimal(8,2),
PRIMARY KEY (partID)
);


CREATE TABLE EventPlanner (
evPlannerName varchar(40),
evPlannerPhone varchar(15),
PRIMARY KEY (evPlannerName)
);


CREATE TABLE LandOwner (
landID integer(11),
landTitle varchar(40),
landFName varchar(40),
landLName varchar(40),
landAddress1 varchar(40),
landCity varchar(30),
landPhone varchar(15),
landEmail varchar(50),
PRIMARY KEY (landID)
);


CREATE TABLE LocalAuthority (
authID integer(11),
authName varchar(40),
authAddress1 varchar(50),
authCity varchar(30),
authPostcode varchar(10),
PRIMARY KEY	(authID)
);


CREATE TABLE Supplier (
supplierID integer(11),
supplierType varchar(30),
supplierContactName varchar(40),
supplierAddress1 varchar(40),
supplierCity varchar(30),
supplierPhone varchar(15),
supplierEmail varchar(50),
PRIMARY KEY (supplierID)
);


CREATE TABLE Event (
eventID integer(11),
eventName varchar(40),
eventDate date,
eventPropPresentationDate date,
eventPropClientApproval date,
eventCostToClient integer,
eventDuration integer,
clientID integer,
evPlannerName varchar(40),
landID integer,
PRIMARY KEY (eventID),
CONSTRAINT fk_ClientID FOREIGN KEY (clientID)
REFERENCES Client(clientID),
CONSTRAINT fk_EvPlannerName FOREIGN KEY (evPlannerName) 
REFERENCES EventPlanner(evPlannerName),
CONSTRAINT fk_LandID FOREIGN KEY (landID) 
REFERENCES LandOwner(landID)
);


CREATE TABLE Register (
partID integer(11),
eventID integer(11),
regDate date,
regDatePaid date,
CONSTRAINT pk_RegParticipant PRIMARY KEY (partID, eventID),
CONSTRAINT fk_PartID FOREIGN KEY (partID) 
REFERENCES Participant(partID),
CONSTRAINT fk_EventID FOREIGN KEY (eventID) 
REFERENCES Event(eventID)
);


CREATE TABLE LocalAuthorityEvent (
authID integer(11),
eventID integer(11),
authContactName varchar(40),
authContactPhone varchar(15),
CONSTRAINT pk_AuthOfEvent PRIMARY KEY (authID, eventID),
CONSTRAINT fk_EventAuthID FOREIGN KEY (authID) 
REFERENCES LocalAuthority(authID),
CONSTRAINT fk_LocalEventID FOREIGN KEY (eventID) 
REFERENCES Event(eventID)
);


CREATE TABLE EventSupplier (
supplierID integer(11),
eventID integer(11),
evSupplyCost decimal(8,2),
CONSTRAINT pk_EventSupplier PRIMARY KEY (supplierID, eventID),
CONSTRAINT fk_EventSupplierID FOREIGN KEY (supplierID) 
REFERENCES Supplier(supplierID),
CONSTRAINT fk_SuppliedEventID FOREIGN KEY (eventID) 
REFERENCES Event(eventID) 
);


CREATE TABLE Job (
jobTitle varchar(20),
pay decimal(8,2),
PRIMARY KEY(jobTitle)
);

CREATE TABLE Staff (
staffID integer(11),
jobTitle varchar(20),
staffTitle varchar(15),
staffFName varchar(40),
staffLName varchar(40),
staffDOB date,
staffAddress1 varchar(100),
staffCity varchar(30),
staffPhone varchar(15),
staffEmail varchar(50),
PRIMARY KEY(staffID),
CONSTRAINT fk_jobTitle FOREIGN KEY (jobTitle)
REFERENCES Job(jobTitle)
);

CREATE TABLE EventStaff (
staffID integer(11),
eventID integer(11),
CONSTRAINT pk_EventStaff PRIMARY KEY (staffID, eventID),
CONSTRAINT fk_StaffID FOREIGN KEY (staffID)
REFERENCES Staff(staffID),
CONSTRAINT fk_EventStaffID FOREIGN KEY (eventID)
REFERENCES Event(eventID)
);

CREATE TABLE Sponsor (
sponsorID integer(11),
sponsorName varchar(40),
sponsorAddress1 varchar(100),
sponsorAddress2 varchar(100),
sponsorCity varchar(100),
sponsorPostcode varchar(10),
sponsorPhone varchar(15),
sponsorEmail varchar(50),
PRIMARY KEY(sponsorID)
);

CREATE TABLE SponsorEvent (
sponsorID integer(11),
eventID integer(11),
sponsorEventAmount decimal(8,2),
CONSTRAINT pk_EventSponsor PRIMARY KEY (sponsorID, eventID),
CONSTRAINT fk_SponsorID FOREIGN KEY (sponsorID)
REFERENCES Sponsor(sponsorID),
CONSTRAINT fk_EventSponsorID FOREIGN KEY (eventID)
REFERENCES Event(eventID)
);


INSERT INTO Client VALUES
(1,
"Mr",
"John",
"Smith",
"10 Barnoth Road",
"Portsmouth",
"02392435315",
"jsmith@gmail.com",
3242
);

INSERT INTO Client VALUES
(2,
"Miss",
"Jane",
"Doe",
"4 Shell Road",
"Southampton",
"02392124352",
"jdoe@gmail.com",
3243
);

INSERT INTO Client VALUES
(3,
"Mr",
"George",
"Lemon",
"11 Highway Street",
"Portsmouth",
"02392433248",
"glemon@gmail.com",
3244
);

INSERT INTO Client VALUES
(4,
"Mrs",
"Barney",
"Rock",
"15 Barnoth Road",
"Portsmouth",
"02392484739",
"brock@gmail.com",
3245
);

INSERT INTO Client VALUES
(5,
"Mr",
"Samuel",
"Damien",
"10 Guildford Road",
"Portsmouth",
"02392673842",
"sdamien@gmail.com",
3246
);

INSERT INTO Client VALUES
(6,
"Miss",
"Sean",
"Earl",
"9 Creek Road",
"Brighton",
"02392323452",
"searl@gmail.com",
3247
);

INSERT INTO Client VALUES
(7,
"Miss",
"Rosie",
"Pearl",
"4 Third Avenue",
"Portsmouth",
"02393549284",
"rpearl@gmail.com",
3248
);

INSERT INTO Client VALUES
(8,
"Miss",
"Ashley",
"Brea",
"24 Hansel Road",
"London",
"02392374632",
"abrea@gmail.com",
3249
);

INSERT INTO Client VALUES
(9,
"Mr",
"Luke",
"Park",
"20 Jaggi Street",
"London",
"02392473623",
"lpark@gmail.com",
3250
);

INSERT INTO Client VALUES
(10,
"Mrs",
"Cecilia",
"Pika",
"48	Deli Road",
"Brighton",
"02392473843",
"cpika@gmail.com",
3251
);


INSERT INTO Participant VALUES
(1,
"Mr",
"Tobby",
"Wallis",
"1994-05-12",
"68 Greetham Street",
"Portsmouth",
"02392583424",
"twallis@gmail.com",
25.67
);

INSERT INTO Participant VALUES
(2,
"Miss",
"Leah",
"Graham",
"1997-03-24",
"69 Portland Street",
"Brighton",
"02392746584",
"lgraham@gmail.com",
50.65
);

INSERT INTO Participant VALUES
(3,
"Mrs",
"Jimin",
"Park",
"1995-09-14",
"15 Ainsley Road",
"Fleet",
"02392124234",
"jpark@gmail.com",
40.30
);

INSERT INTO Participant VALUES
(3,
"Mr",
"Paul",
"Lark",
"1988-04-05",
"8 Barnes Road",
"Havant",
"02392434532",
"plark@gmail.com",
54.30
);

INSERT INTO Participant VALUES
(4,
"Mr",
"Dennis",
"Oh",
"1993-08-23",
"7 Civil Street",
"Winchester",
"02392435154",
"doh@gmail.com",
120.50
);

INSERT INTO Participant VALUES
(4,
"Miss",
"Alice",
"Saint",
"1995-05-05",
"3 Angel Road",
"Petersfield",
"02392423124",
"asaint@gmail.com",
34.95
);

INSERT INTO Participant VALUES
(5,
"Mr",
"Bob",
"Ross",
"1993-04-02",
"9 Painter Road",
"Ringwood",
"02392123845",
"bross@gmail.com",
99.99
);

INSERT INTO Participant VALUES
(6,
"Miss",
"Laurie",
"Ceda",
"1996-06-11",
"4 Penning Road",
"Aldershot",
"02392492734",
"lceda@gmail.com",
76.45
);

INSERT INTO Participant VALUES
(7,
"Mrs",
"Martie",
"Maria",
"1992-11-12",
"6 Parm Road",
"Portsmouth",
"02392234123",
"mmaria@gmail.com",
10.22
);

INSERT INTO Participant VALUES
(8,
"Mr",
"Will",
"Smith",
"1994-02-01",
"1 Robot Road",
"Waterlooville",
"02392476364",
"wsmith@gmail.com",
74.95
);

INSERT INTO Participant VALUES
(9,
"Mr",
"Matthew",
"Davison",
"1993-12-04",
"14 Saxton Street",
"Petersfield",
"02392523492",
"mdavison@gmail.com",
45.32
);

INSERT INTO Participant VALUES
(10,
"Miss",
"Carol",
"Shelby",
"1998-10-03",
"3 Chelmsford Road",
"Portsmouth",
"02392763842",
"cshelby@gmail.com",
12.54
);

INSERT INTO EventPlanner VALUES
("DamienSmith",
"02392847584"
);

INSERT INTO EventPlanner VALUES
("TonyParis",
"02392495832"
);

INSERT INTO EventPlanner VALUES
("StevenFry",
"02392249312"
);

INSERT INTO EventPlanner VALUES
("DonaldsonRufus",
"02392429382"
);

INSERT INTO EventPlanner VALUES
("AntoniousDaniel",
"02392482734"
);

INSERT INTO EventPlanner VALUES
("ReggieParker",
"02392124922"
);

INSERT INTO EventPlanner VALUES
("PaulRudd",
"02392222424"
);

INSERT INTO EventPlanner VALUES
("LopatinKree",
"02392948972"
);

INSERT INTO EventPlanner VALUES
("JackDaniel",
"02392242832"
);

INSERT INTO EventPlanner VALUES
("SimonMorgan",
"02392123149"
);

INSERT INTO LandOwner VALUES
(1,
"Ipanema Garden",
"John",
"Tamer",
"12 Nicholas Street",
"Portsmouth",
"02392124532",
"jtamer@gmail.com"
);

INSERT INTO LandOwner VALUES
(2,
"Covent Lane",
"Linda",
"Dina",
"12 Flower Street",
"Portsmouth",
"02392349323",
"ldina@gmail.com"
);

INSERT INTO LandOwner VALUES
(3,
"Bean Park",
"Sam",
"Bean",
"12 Bean Street",
"Portsmouth",
"02392487423",
"sbean@gmail.com"
);

INSERT INTO LandOwner VALUES
(4,
"Sway Pond",
"John",
"Lennon",
"2 Down Street",
"Portsmouth",
"02392384721",
"jlennon@gmail.com"
);

INSERT INTO LandOwner VALUES
(5,
"Dumping Ground",
"Tracy",
"Beaker",
"57 Bog Road",
"Portsmouth",
"02392482749",
"tbeaker@gmail.com"
);

INSERT INTO LandOwner VALUES
(6,
"Dream Land",
"Kirby",
"Knight",
"69 World Street",
"Portsmouth",
"02392477922",
"kknight@gmail.com"
);

INSERT INTO LandOwner VALUES
(7,
"Deja Vu",
"Frank",
"Sinatra",
"16 Leaf Road",
"Portsmouth",
"02392294923",
"fsinatra@gmail.com"
);

INSERT INTO LandOwner VALUES
(8,
"Snake Cross",
"Andy",
"Williams",
"89 Hayling Street",
"Portsmouth",
"02392249249",
"awilliams@gmail.com"
);

INSERT INTO LandOwner VALUES
(9,
"Salvage Land",
"Devin",
"Robin",
"29 Raven Road",
"Portsmouth",
"02392198247",
"drobin@gmail.com"
);

INSERT INTO LandOwner VALUES
(10,
"Bane Circle",
"Berny",
"Sydney",
"312 Cosine Street",
"Portsmouth",
"02392294429",
"bsydney@gmail.com"
);


INSERT INTO LocalAuthority VALUES
(1,
"City Council",
"19 Commercial Road",
"Portsmouth",
"PO1 1SJ"
);

INSERT INTO LocalAuthority VALUES
(2,
"Blackwater Council",
"5 Baking Street",
"Brighton",
"PO4 2KD"
);

INSERT INTO LocalAuthority VALUES
(3,
"Blue Horizon",
"2 Latitude Road",
"Gosport",
"PO7 HI2"
);

INSERT INTO LocalAuthority VALUES
(4,
"Cowplain Council",
"34 Tennant Road",
"Ringwood",
"P2D SDK"
);

INSERT INTO LocalAuthority VALUES
(5,
"Fleet Council",
"45 Dennis Road",
"Fleet",
"PDJ 1SJ"
);

INSERT INTO LocalAuthority VALUES
(6,
"Havant Council",
"29 Ross Road",
"Havant",
"PS1 PS2"
);

INSERT INTO LocalAuthority VALUES
(7,
"Petersfield Council",
"8 Trumpet Road",
"Petersfield",
"PO1 1SJ"
);

INSERT INTO LocalAuthority VALUES
(8,
"Aldershot Council",
"100 Commercial Road",
"Aldershot",
"PSI SA7"
);

INSERT INTO LocalAuthority VALUES
(9,
"Winchester Council",
"79 Mariette Highway",
"Winchester",
"PO6 1SJ"
);

INSERT INTO LocalAuthority VALUES
(10,
"Waterlooville Council",
"15 Cross Lane",
"Waterlooville",
"PAS 1FS"
);

INSERT INTO Supplier VALUES
(1,
"Beverage",
"Steve Johnson",
"19 Kelmsford Street",
"Portsmouth",
"02392453759",
"sjohnson@gmail.com"
);

INSERT INTO Supplier VALUES
(2,
"Food",
"Tyler Dalton",
"26 Wamil Way",
"Havant",
"02392234248",
"tdalton@gmail.com"
);

INSERT INTO Supplier VALUES
(3,
"Apparel",
"Cody Rogers",
"94 Gloucester Rd",
"Brighton",
"02392497323",
"crogers@gmail.com"
);

INSERT INTO Supplier VALUES
(4,
"Transport",
"Leo Fletcher",
"107 Clifton Dr",
"Ringwood",
"02392472852",
"lfletcher@gmail.com"
);

INSERT INTO Supplier VALUES
(5,
"Transport",
"Samantha Francis",
"22 Farriers Way",
"Portsmouth",
"02392249821",
"sFrancis@gmail.com"
);

INSERT INTO Supplier VALUES
(6,
"Beverage",
"Dahlia Porter",
"25 Elmsdale Rd",
"Portsmouth",
"02392378462",
"dporter@gmail.com"
);

INSERT INTO Supplier VALUES
(7,
"Food",
"Drew Foster",
"4 The Priors",
"Fleet",
"02392472638",
"dfoster@gmail.com"
);

INSERT INTO Supplier VALUES
(8,
"Apparel",
"Cameron Conrad",
"3 Granary Rd",
"Portsmouth",
"02392482482",
"cconrad@gmail.com"
);

INSERT INTO Supplier VALUES
(9,
"Toiletries",
"Blair Knight",
"10 Beaconfield Rd",
"Portsmouth",
"02392472629",
"bknight@gmail.com"
);

INSERT INTO Supplier VALUES
(10,
"Waste Disposal",
"Noel Roberts",
"115 Roundway",
"Portsmouth",
"02392428371",
"nroberts@gmail.com"
);

INSERT INTO Event VALUES
(1,
"Schlepp-adoo",
"2017-07-12",
"2017-01-03",
"2017-01-10",
7540,
2,
1,
"DamienSmith",
1
);

INSERT INTO Event VALUES
(2,
"Marathon-Race",
"2018-07-12",
"2018-01-03",
"2018-01-10",
10000,
180,
2,
"TonyParis",
2
);

INSERT INTO Event VALUES
(3,
"Cycle-Challenge",
"2019-07-12",
"2019-01-03",
"2019-01-10",
6000,
2,
3,
"StevenFry",
3
);

INSERT INTO Event VALUES
(4,
"Jump-adoo",
"2020-07-12",
"2020-01-03",
"2020-01-10",
8000,
2,
4,
"DonaldsonRufus",
4
);

INSERT INTO Event VALUES
(5,
"Relay-Race",
"2021-07-12",
"2021-01-03",
"2021-01-10",
6000,
3,
5,
"AntoniousDaniel",
5
);

INSERT INTO Event VALUES
(6,
"Cross-Counter",
"2022-07-12",
"2022-01-03",
"2022-01-10",
4500,
3,
6,
"ReggieParker",
6
);

INSERT INTO Event VALUES
(7,
"Running-Spectrum",
"2023-07-12",
"2023-01-03",
"2023-01-10",
8000,
5,
7,
"PaulRudd",
7
);

INSERT INTO Event VALUES
(8,
"Musical-Raise",
"2024-07-12",
"2024-01-03",
"2024-01-10",
10000,
7,
8,
"JackDaniel",
8
);

INSERT INTO Event VALUES
(9,
"Schlepp-Reborn",
"2025-07-12",
"2025-01-03",
"2025-01-10",
10000,
3,
9,
"JackDaniel",
9
);

INSERT INTO Event VALUES
(10,
"Schlepp-Run",
"2026-07-12",
"2026-01-03",
"2026-01-10",
10000,
3,
10,
"SimonMorgan",
10
);

INSERT INTO Register VALUES
(1,
1,
"2017-02-15",
"2017-02-20"
);

INSERT INTO Register VALUES
(2,
1,
"2017-02-15",
"2017-02-20"
);

INSERT INTO Register VALUES
(3,
1,
"2017-02-15",
"2017-02-20"
);

INSERT INTO Register VALUES
(4,
1,
"2017-02-15",
"2017-02-20"
);

INSERT INTO Register VALUES
(5,
1,
"2017-02-15",
"2017-02-20"
);

INSERT INTO Register VALUES
(6,
1,
"2017-02-15",
"2017-02-20"
);

INSERT INTO Register VALUES
(7,
1,
"2017-02-15",
"2017-02-20"
);

INSERT INTO Register VALUES
(8,
1,
"2017-02-15",
"2017-02-20"
);

INSERT INTO Register VALUES
(9,
1,
"2017-02-15",
"2017-02-20"
);

INSERT INTO Register VALUES
(10,
1,
"2017-02-15",
"2017-02-20"
);

INSERT INTO Register VALUES
(1,
2,
"2017-02-15",
"2017-02-20"
);

INSERT INTO Register VALUES
(2,
2,
"2017-02-15",
"2017-02-20"
);

INSERT INTO Register VALUES
(3,
2,
"2017-02-15",
"2017-02-20"
);


INSERT INTO LocalAuthorityEvent VALUES
(1,
1,
"Bessie	Padilla",
"02392202032"
);

INSERT INTO LocalAuthorityEvent VALUES 
(2,
2,
"Jean Morrison",
"02392129042"
);

INSERT INTO LocalAuthorityEvent VALUES
(3,
3,
"Roderick Brady",
"02392242124"
);

INSERT INTO LocalAuthorityEvent VALUES
(4,
4,
"Sammy Floyd",
"02392217424"
);

INSERT INTO LocalAuthorityEvent VALUES
(5,
5,
"Monique Norris",
"02392098764"
);

INSERT INTO LocalAuthorityEvent VALUES
(6,
6,
"Rick Martin",
"02392024245"
);

INSERT INTO LocalAuthorityEvent VALUES
(7,
7,
"Oliver Brock",
"02392347133"
);

INSERT INTO LocalAuthorityEvent VALUES
(8,
8,
"Casey Newtonk",
"02392347133"
);

INSERT INTO LocalAuthorityEvent VALUES
(9,
9,
"Grady Hoffman",
"02392129872"
);

INSERT INTO LocalAuthorityEvent VALUES
(10,
10,
"Rachael Carson",
"02392343832"
);


INSERT INTO EventSupplier VALUES
(1,
1,
500.50
);

INSERT INTO EventSupplier VALUES
(2,
1,
500.50
);

INSERT INTO EventSupplier VALUES
(3,
1,
700.35
);

INSERT INTO EventSupplier VALUES
(4,
1,
1000.50
);

INSERT INTO EventSupplier VALUES
(5,
1,
500.50
);

INSERT INTO EventSupplier VALUES
(9,
1,
250.50
);

INSERT INTO EventSupplier VALUES
(10,
1,
500.50
);

INSERT INTO EventSupplier VALUES
(6,
2,
500.50
);

INSERT INTO EventSupplier VALUES
(7,
2,
500.50
);

INSERT INTO EventSupplier VALUES
(8,
2,
500.50
);

INSERT INTO EventSupplier VALUES
(5,
2,
500.50
);

INSERT INTO Job VALUES
("Cleaner",
8.20
);

INSERT INTO Job VALUES
("Administration",
12.20
);

INSERT INTO Job VALUES
("Stock Management",
8.20
);

INSERT INTO Job VALUES
("Fundraiser",
6.20
);

INSERT INTO Job VALUES
("Manager",
16.20
);

INSERT INTO Job VALUES
("Marketing",
15.20
);

INSERT INTO Job VALUES
("Retailer",
7.20
);

INSERT INTO Job VALUES
("Sales Assistant",
8.50
);

INSERT INTO Job VALUES
("Food Vendor",
10.00
);

INSERT INTO Job VALUES
("Security Guard",
12.50
);

INSERT INTO Staff VALUES
(1,
"Cleaner",	
"Mr",
"Rodger",
"Ulga",
"1994-05-12",
"69 Greetham Street",
"Portsmouth",
"02392444244",
"rulga@gmail.com"
);

INSERT INTO Staff VALUES
(2,
"Administration",	
"Miss",
"Ashley",
"Alec",
"1992-12-12",
"23 Numba Street",
"Portsmouth",
"02392343545",
"aalec@gmail.com"
);

INSERT INTO Staff VALUES
(3,
"Stock Management",	
"Mr",
"Lorie",
"Humbert",
"1996-04-23",
"69 Humber Street",
"Portsmouth",
"02392333333",
"lhumbert@gmail.com"
);

INSERT INTO Staff VALUES
(4,
"Fundraiser",	
"Mr",
"Jennifer",
"Debbie",
"1996-07-03",
"69 Strider Street",
"Portsmouth",
"02392584395",
"jdebbie@gmail.com"
);

INSERT INTO Staff VALUES
(5,
"Manager",	
"Mr",
"Romy",
"Royce",
"1993-02-01",
"03 Random Street",
"Portsmouth",
"02392111214",
"rroyce@gmail.com"
);

INSERT INTO Staff VALUES
(6,
"Marketing",	
"Mrs",
"Melina",
"Darren",
"1992-08-16",
"14 Darren Road",
"Portsmouth",
"02392122932",
"mdarren@gmail.com"
);

INSERT INTO Staff VALUES
(7,
"Retailer",	
"Miss",
"Karen",
"Charlton",
"1997-02-14",
"01 Amber Street",
"Portsmouth",
"02392555564",
"kcharlton@gmail.com"
);

INSERT INTO Staff VALUES
(8,
"Sales Assistant",	
"Mr",
"Jerri",
"Jerome",
"1993-04-04",
"02 Jerome Road",
"Portsmouth",
"02392888888",
"jjerome@gmail.com"
);

INSERT INTO Staff VALUES
(9,
"Food Vendor",	
"Mr",
"Delora",
"Hubert",
"1988-06-07",
"43 Hubert Street",
"Portsmouth",
"02392999999",
"dhubert@gmail.com"
);

INSERT INTO Staff VALUES
(10,
"Security Guard",	
"Mr",
"Mervin",
"Delma",
"1985-08-01",
"24 Rock Street",
"Portsmouth",
"02392787884",
"mdelma@gmail.com"
);


INSERT INTO Sponsor VALUES
(1,
"Sproite",
"17 Sproit Avenue",
"16 Sproit Road",
"Portsmouth",
"PO0 232",
"02392423545",
"sproite@sproite.org"
);

INSERT INTO Sponsor VALUES
(2,
"Cuca-Cula",
"18 Cuca-Cula Avenue",
"02 Fizz Lane",
"Portsmouth",
"PO0 233",
"02392424345",
"Cuca@Cula.org"
);

INSERT INTO Sponsor VALUES
(3,
"Dove",
"12 Bird Avenue",
"07 Kingfisher Road",
"Portsmouth",
"PO0 234",
"02392023923",
"dove@dove.org"
);

INSERT INTO Sponsor VALUES
(4,
"DELL",
"17 PC Avenue",
"16 AI Road",
"Portsmouth",
"PO23 213",
"12384736291",
"computers@dell.org"
);

INSERT INTO Sponsor VALUES
(5,
"RedArrow",
"53 Chart Avenue",
"23 Lennin Road",
"Portsmouth",
"PO1 246",
"44239242325",
"red@arrow.org"
);

INSERT INTO Sponsor VALUES
(6,
"Adeedas",
"08 Running Avenue",
"09 Sprint Road",
"Portsmouth",
"PO5 55A",
"02392434343",
"sprint@adeedas.org"
);

INSERT INTO Sponsor VALUES
(7,
"Guggle",
"172 Guggle Avenue",
"163 Guggle Road",
"Portsmouth",
"P230 223",
"43928375623",
"guggle@guggle.org"
);

INSERT INTO Sponsor VALUES
(8,
"Maple",
"23 Syrup Avenue",
"167 Lime Road",
"Portsmouth",
"P234 5OK",
"02736475839",
"demo@maple.org"
);

INSERT INTO Sponsor VALUES
(9,
"IBEEM",
"37 IBEEM Avenue",
"76 IBEEM Road",
"Portsmouth",
"B7HD HUD",
"24242424242",
"sale@ibeem.org"
);

INSERT INTO Sponsor VALUES
(10,
"Delta",
"110 Dolta Avenue",
"17 Dalta Road",
"Portsmouth",
"YUH YUI",
"02493821313",
"dalta@delta.org"
;)


