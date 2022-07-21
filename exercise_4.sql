/* Task 13 */
SELECT 
   s.Stationedid AS station_id,
   t.TruckType AS truck_type,
   SUM(f.Wastecollected) AS total_waste
FROM 
   FactTrips f 
INNER JOIN DimStation s
   ON f.Stationid = s.Stationedid
INNER JOIN DimTruck t
   ON f.Truckid = t.Truckid
GROUP BY 
GROUPING SETS (station_id, truck_type);

/* Task 14 */
SELECT 
   d.Year AS year,
   s.City AS city,
   s.Stationedid AS station_id,
   SUM(f.Wastecollected) AS total_waste
FROM 
   FactTrips f 
INNER JOIN DimDate d 
   ON f.Dateid = d.dateid
INNER JOIN DimStation s 
   ON f.Stationid = s.Stationedid
GROUP BY 
ROLLUP (year, city, station_id);

/* Task 15 */
SELECT 
   d.Year AS year,
   s.City AS city,
   s.Stationedid AS station_id,
   AVG(f.Wastecollected) AS average_waste
FROM 
   FactTrips f 
INNER JOIN DimDate d 
   ON f.Dateid = d.dateid
INNER JOIN DimStation s 
   ON f.Stationid = s.Stationedid
GROUP BY 
CUBE (year, city, station_id);

/* Task 16 */
/* MQT (Materialized Query Table) */
CREATE MATERIALIZED VIEW max_waste_stats AS (
SELECT  
   s.city AS city,
   s.Stationedid AS station_id,
   t.TruckType AS truck_type,
   max(f.Wastecollected) AS max_waste 
FROM 
   FactTrips f 
INNER JOIN DimStation s
   ON f.Stationid = s.Stationedid
INNER JOIN DimTruck t
   ON f.Truckid = t.Truckid
GROUP BY city, station_id, truck_type
);