use Fullstack_2023_AR
--clients table
INSERT INTO Clients(Name, Surname, Phone, email)
VALUES ('Adam', 'Smith', '+48333-667-822', 'adam.smith@yahoo.com');
INSERT INTO Clients(Name, Surname, Phone, email)
VALUES ('Joe', 'Doe', '+48343-667-822', 'joe.doe@yahoo.com');
INSERT INTO Clients(Name, Surname, Phone, email)
VALUES ('Stephan', 'Jones', '+48333-667-824', 'stephan.jones@yahoo.com');
INSERT INTO Clients(Name, Surname, Phone, email)
VALUES ('Mariusz', 'Kowalski', '+48333-667-222', 'm.kowalski@gmail.com');
INSERT INTO Clients(Name, Surname, Phone, email)
VALUES ('Lukas', 'Pukas', '+48333-567-822', 'l.pukas@gmail.com');
--couintry table
INSERT INTO Coutries(Name, Continent)
VALUES ('Poland', 'Europe');
INSERT INTO Coutries(Name, Continent)
VALUES ('Slovakia', 'Europe');
--devices table
INSERT INTO Devices(IdDevice,IdDeviceStatus,Name,EnergyProduced,OperatingHours,MaxEnergyProduced)
VALUES (LEFT(NEWID(),26),42,'POL123456',20000.5,13,60000);
INSERT INTO Devices(IdDevice, IdDeviceStatus,Name,EnergyProduced,OperatingHours,MaxEnergyProduced)
VALUES (LEFT(NEWID(),26),43,'POL123466',50000.5,55,60000);
INSERT INTO Devices(IdDevice,IdDeviceStatus,Name,EnergyProduced,OperatingHours,MaxEnergyProduced)
VALUES (LEFT(NEWID(),26),44,'POL123446',24000.5,17,60000);
INSERT INTO Devices(IdDevice,IdDeviceStatus,Name,EnergyProduced,OperatingHours,MaxEnergyProduced)
VALUES (LEFT(NEWID(),26),45,'POL123476',20600.5,15,60000);
INSERT INTO Devices(IdDevice,IdDeviceStatus,Name,EnergyProduced,OperatingHours,MaxEnergyProduced)
VALUES (LEFT(NEWID(),26),46,'POL123496',70000.5,23,60000);
INSERT INTO Devices(IdDevice,IdDeviceStatus,Name,EnergyProduced,OperatingHours,MaxEnergyProduced)
VALUES (LEFT(NEWID(),26),47,'SLO123456',20800.5,18,60000);
INSERT INTO Devices(IdDevice,IdDeviceStatus,Name,EnergyProduced,OperatingHours,MaxEnergyProduced)
VALUES (LEFT(NEWID(),26),48,'SLO123496',25000.5,21,60000);
INSERT INTO Devices(IdDevice,IdDeviceStatus,Name,EnergyProduced,OperatingHours,MaxEnergyProduced)
VALUES (LEFT(NEWID(),26),49,'SLO123456',29000.5,11,60000);
INSERT INTO Devices(IdDevice,IdDeviceStatus,Name,EnergyProduced,OperatingHours,MaxEnergyProduced)
VALUES (LEFT(NEWID(),26),50,'POL123436',28000.5,24,60000);
INSERT INTO Devices(IdDevice,IdDeviceStatus,Name,EnergyProduced,OperatingHours,MaxEnergyProduced)
VALUES (LEFT(NEWID(),26),51,'SLO123426',60000.5,55,60000);
--DEV STATUSES TABLE
INSERT INTO Dev_Statuses(StatusName,StatusDescription)
VALUES (0,'Normal run');
INSERT INTO Dev_Statuses(StatusName,StatusDescription)
VALUES (0,'Normal run');
INSERT INTO Dev_Statuses(StatusName,StatusDescription)
VALUES (0,'Normal run');
INSERT INTO Dev_Statuses(StatusName,StatusDescription)
VALUES (0,'Normal run');
INSERT INTO Dev_Statuses(StatusName,StatusDescription)
VALUES (1,'Failure request');
INSERT INTO Dev_Statuses(StatusName,StatusDescription)
VALUES (0,'Normal run');
INSERT INTO Dev_Statuses(StatusName,StatusDescription)
VALUES (3,'In service');
INSERT INTO Dev_Statuses(StatusName,StatusDescription)
VALUES (0,'Normal run');
INSERT INTO Dev_Statuses(StatusName,StatusDescription)
VALUES (4,'In tests');
INSERT INTO Dev_Statuses(StatusName,StatusDescription)
VALUES (2,'Failure diagnosis');
--failures
INSERT INTO Failures(StartDate,EndDate) VALUES ('2024/01/14 08:00:00','2024/01/17 10:00:01');
INSERT INTO Failures(StartDate,EndDate) VALUES ('2024/01/16 14:00:01','2024/01/20 14:00:00');
INSERT INTO Failures(StartDate,EndDate) VALUES ('2024/01/16 22:00:00','2024/01/19 04:00:00');
INSERT INTO Failures(StartDate,EndDate) VALUES ('2024/01/13 22:00:01','2024/02/20 06:00:01');
INSERT INTO Failures(StartDate,EndDate) VALUES ('2024/01/13',NULL);
INSERT INTO Failures(StartDate,EndDate) VALUES ('2024/02/13 14:00:00','2024/02/17 07:00:00');
INSERT INTO Failures(StartDate,EndDate) VALUES ('2024/02/13 06:00:01',NULL);
INSERT INTO Failures(StartDate,EndDate) VALUES ('2024/01/29 20:00;09',NULL);
INSERT INTO Failures(StartDate,EndDate) VALUES ('2023/12/13 00:00:01','2023/12/31 06:00:01');
INSERT INTO Failures(StartDate,EndDate) VALUES ('2024/01/05 06:00:00','2024/01/12 22:00:01');
--services
INSERT INTO Services(ServiceManName, ServiceManSurname,RepairStatus)
VALUES('Andrzej','Kowalski','Repair finished');
INSERT INTO Services(ServiceManName, ServiceManSurname,RepairStatus)
VALUES('Andrzej','Kowalski','Repair finished');
INSERT INTO Services(ServiceManName, ServiceManSurname,RepairStatus)
VALUES('Szymon','Maskal','Repair finished');
INSERT INTO Services(ServiceManName, ServiceManSurname,RepairStatus)
VALUES('Robert','Mlynarz','Repair finished');
INSERT INTO Services(ServiceManName, ServiceManSurname,RepairStatus)
VALUES('Robert','Mlynarz','Prepare to diagnosis');
INSERT INTO Services(ServiceManName, ServiceManSurname,RepairStatus)
VALUES('Mikolaj','Mlocek','Repair finished');
INSERT INTO Services(ServiceManName, ServiceManSurname,RepairStatus)
VALUES('Mikolaj','Mlocek','Repair in progress');
INSERT INTO Services(ServiceManName, ServiceManSurname,RepairStatus)
VALUES('Roman','Wojdalski','Test in progress');
INSERT INTO Services(ServiceManName, ServiceManSurname,RepairStatus)
VALUES('Roman','Wojdalski','Test in progress');
INSERT INTO Services(ServiceManName, ServiceManSurname,RepairStatus)
VALUES('Szymon','Maskal','Diagnose in progress');
---locations
INSERT INTO Locations(City,Adress,Coordinates) VALUES ('Malkinia','Ksawera 5, 00-234',geometry::STGeomFromText('POINT (52.69 22.02)', 0));
INSERT INTO Locations(City,Adress,Coordinates) VALUES ('Malkinia','Ksawera 7, 00-234',geometry::STGeomFromText('POINT (52.69 21.02)', 0));
INSERT INTO Locations(City,Adress,Coordinates) VALUES ('Belchatow','Mosta 5, 97-400',geometry::STGeomFromText('POINT (51.40 19.41)', 0));
INSERT INTO Locations(City,Adress,Coordinates) VALUES ('Belchatow','Mosta 7, 97-400',geometry::STGeomFromText('POINT (51.40 19.42)', 0));
INSERT INTO Locations(City,Adress,Coordinates) VALUES ('Brzechów','Brzecha 20, 26-021',geometry::STGeomFromText('POINT (50.83 20.77)', 0));
INSERT INTO Locations(City,Adress,Coordinates) VALUES ('Fintice',',Lesnicka 13 082 16',geometry::STGeomFromText('POINT (49.05 21.28)', 0));
INSERT INTO Locations(City,Adress,Coordinates) VALUES ('Fintice',',Lesnicka 15 082 16',geometry::STGeomFromText('POINT (49.05 21.30)', 0));
INSERT INTO Locations(City,Adress,Coordinates) VALUES ('Fintice',',Lesnicka 14 082 16',geometry::STGeomFromText('POINT (49.05 21.29)', 0));
INSERT INTO Locations(City,Adress,Coordinates) VALUES ('Brzechów','Brzecha 21, 26-021',geometry::STGeomFromText('POINT (50.83 20.78)', 0));
INSERT INTO Locations(City,Adress,Coordinates) VALUES ('Fintice',',Lesnicka 16 082 16',geometry::STGeomFromText('POINT (49.05 21.31)', 0));
-- regions
INSERT INTO Regions(IdDevice)
SELECT IdDevice from Devices

Update Regions
set IdLocation = 1,Name='Ostro³êka_sud',State_of_Province='Mazowieckie' 
WHERE IdRegion=11
Update Regions
set IdLocation = 2,Name='Ostro³êka_sud',State_of_Province='Mazowieckie' 
WHERE IdRegion=12
Update Regions
set IdLocation = 3,Name='Be³chatów_nord',State_of_Province='³ódzkie' 
WHERE IdRegion=13
Update Regions
set IdLocation = 4,Name='Be³chatów_nord',State_of_Province='³ódzkie' 
WHERE IdRegion=14
Update Regions
set IdLocation = 5,Name='Kielce_east',State_of_Province='Œwiêtkorzyskie' 
WHERE IdRegion=15
Update Regions
set IdLocation = 6,Name='Presov_nord',State_of_Province='Presov' 
WHERE IdRegion=16
Update Regions
set IdLocation = 7,Name='Presov_nord',State_of_Province='Presov' 
WHERE IdRegion=17
Update Regions
set IdLocation = 8,Name='Presov_nord',State_of_Province='Presov' 
WHERE IdRegion=18
Update Regions
set IdLocation = 9,Name='Kielce_east',State_of_Province='Œwiêtkorzyskie' 
WHERE IdRegion=19
Update Regions
set IdLocation = 10,Name='Presov_nord',State_of_Province='Presov' 
WHERE IdRegion=20
--RegionOrders
INSERT INTO RegionOrders(IdRegion)
SELECT IdRegion From Regions
--OrderDetails
INSERT INTO OrderDetails(IdRO)
SELECT IdRegionOrders FROM RegionOrders
Update OrderDetails
set EnergyDemand=1200000,StartPeriod='2024/06/01 00:00',EndPeriod='2024/10/01 00:00'
Where IdOD=13
Update OrderDetails
set EnergyDemand=60000,StartPeriod='2024/01/01 00:00',EndPeriod='2024/05/31 00:00'
Where IdOD=14
Update OrderDetails
set EnergyDemand=40000,StartPeriod='2024/10/02 00:00',EndPeriod='2024/12/31'
Where IdOD=15
Update OrderDetails
set EnergyDemand=60000,StartPeriod='2024/01/01 00:00',EndPeriod='2024/06/01 00:00'
Where IdOD=16
Update OrderDetails
set EnergyDemand=50000,StartPeriod='2024/06/02 00:00',EndPeriod='2024/12/31 00:00'
Where IdOD=17
Update OrderDetails
set EnergyDemand=60000,StartPeriod='2024/01/01 00:00',EndPeriod='2024/06/01 00:00'
Where IdOD=18
Update OrderDetails
set EnergyDemand=50000,StartPeriod='2024/06/02 00:00',EndPeriod='2024/12/31 00:00'
Where IdOD=19
Update OrderDetails
set EnergyDemand=60000,StartPeriod='2024/01/01 00:00',EndPeriod='2024/06/01 00:00'
Where IdOD=20
Update OrderDetails
set EnergyDemand=50000,StartPeriod='2024/06/02 00:00',EndPeriod='2024/12/31 00:00'
Where IdOD=21
Update OrderDetails
set EnergyDemand=10000,StartPeriod='2024/01/01 00:00',EndPeriod='2024/12/31 00:00'
Where IdOD=22
Update OrderDetails
set EnergyDemand=10000,StartPeriod='2024/03/01 00:00',EndPeriod='2024/12/31 00:00'
Where IdOD=23
Update OrderDetails
set EnergyDemand=10000,StartPeriod='2024/03/01 00:00',EndPeriod='2024/12/31 00:00'
Where IdOD=24
--statuses
INSERT INTO Statuses(OrderStatusName,OrderStatusDescription)
VALUES
--('Processing','Order under processing'),
--('Processing','Order under processing'),
--('Processing','Order under processing'),
--('Processing','Order under processing'),
--('Processing','Order under processing'),
--('Processing','Order under processing'),
--('Processing','Order under processing'),
--('Processing','Order under processing'),
--('Processing','Order under processing'),
('Accepted','Order accepted'),
('Accepted','Order accepted');
---order statuses table
delete from OrderStatuses
INSERT INTO OrderStatuses(IdOrdDet)
SELECT IdOD FROM OrderDetails
Update OrderStatuses
set IdStatus=1
WHERE IdOrderStatus=11
Update OrderStatuses
set IdStatus=2
WHERE IdOrderStatus=12
Update OrderStatuses
set IdStatus=3
WHERE IdOrderStatus=13
Update OrderStatuses
set IdStatus=4
WHERE IdOrderStatus=14
Update OrderStatuses
set IdStatus=5
WHERE IdOrderStatus=15
Update OrderStatuses
set IdStatus=6
WHERE IdOrderStatus=16
Update OrderStatuses
set IdStatus=7
WHERE IdOrderStatus=17
Update OrderStatuses
set IdStatus=8
WHERE IdOrderStatus=18
Update OrderStatuses
set IdStatus=9
WHERE IdOrderStatus=19
Update OrderStatuses
set IdStatus=10
WHERE IdOrderStatus=20
Update OrderStatuses
set IdStatus=11
WHERE IdOrderStatus=21
Update OrderStatuses
set IdStatus=12
WHERE IdOrderStatus=22
Update OrderStatuses
set IdClient=1
WHERE IdOrderStatus Between 11 and 13
Update OrderStatuses
set IdClient=2
WHERE IdOrderStatus Between 14 and 16
Update OrderStatuses
set IdClient=3
WHERE IdOrderStatus Between 17 and 18
Update OrderStatuses
set IdClient=4
WHERE IdOrderStatus Between 19 and 20
Update OrderStatuses
set IdClient=5
WHERE IdOrderStatus Between 21 and 22
