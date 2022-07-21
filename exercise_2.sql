/* Create Dimensional Tables */
CREATE TABLE IF NOT EXISTS MyDimDate (
   date_id SERIAL PRIMARY KEY,
   date_ DATE NOT NULL,
   year INT NOT NULL,
   quarter VARCHAR(2) NOT NULL,
   month INT NOT NULL,
   monthname VARCHAR(20) NOT NULL,
   day INT NOT NULL,
   weekday_ VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS MyDimWaste (
   waste_id SERIAL PRIMARY KEY,
   waste_type VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS MyDimZone (
   zone_id SERIAL PRIMARY KEY,
   zone_name VARCHAR(10) NOT NULL,
   city VARCHAR(50) NOT NULL
);

/* Create Fact Table(s) */
CREATE TABLE IF NOT EXISTS MyFactTrips (
   trip_number SERIAL PRIMARY KEY,
   waste_id INT NOT NULL REFERENCES MyDimWaste (waste_id),
   zone_id INT NOT NULL REFERENCES MyDimZone (zone_id),
   date_id INT NOT NULL REFERENCES MyDimDate (date_id),
   waste_in_tons NUMERIC(5, 2) NOT NULL
);