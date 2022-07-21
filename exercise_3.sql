/* Create Dimensional Tables */
CREATE TABLE IF NOT EXISTS DimDate (
   dateid SERIAL PRIMARY KEY,
   date DATE NOT NULL,
   Year INT NOT NULL,
   Quarter INT NOT NULL,
   QuarterName VARCHAR(5) NOT NULL,
   Month INT NOT NULL,
   Monthname VARCHAR(15) NOT NULL,
   Day INT NOT NULL,
   Weekday INT NOT NULL,
   WeekdayName VARCHAR(10) NOT NULL
);

\COPY DimDate FROM '/home/anthony/WasteCollectionDW/data/DimDate.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM DimDate LIMIT 5;

CREATE TABLE IF NOT EXISTS DimTruck (
   Truckid INT NOT NULL PRIMARY KEY,
   TruckType VARCHAR(20) NOT NULL
);

\COPY DimTruck FROM '/home/anthony/WasteCollectionDW/data/DimTruck.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM DimTruck LIMIT 5;

CREATE TABLE IF NOT EXISTS DimStation (
   Stationedid INT NOT NULL PRIMARY KEY,
   City VARCHAR(20) NOT NULL
);

\COPY DimStation FROM '/home/anthony/WasteCollectionDW/data/DimStation.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM DimStation LIMIT 5;

/* Create Fact Table(s) */
CREATE TABLE IF NOT EXISTS FactTrips (
   Tripid INT NOT NULL PRIMARY KEY,
   Dateid INT NOT NULL REFERENCES DimDate (dateid),
   Stationid INT NOT NULL REFERENCES DimStation (Stationedid),
   Truckid INT NOT NULL REFERENCES DimTruck (Truckid),
   Wastecollected NUMERIC(5, 2) NOT NULL
);

\COPY FactTrips FROM '/home/anthony/WasteCollectionDW/data/FactTrips.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM FactTrips LIMIT 5;
