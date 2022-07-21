CREATE TABLE IF NOT EXISTS DataForCognos AS
SELECT 
   f.tripid as Tripid,
	s.city as City,
	f.stationid as Stationid,
	f.truckid as Truckid,
	f.wastecollected as Wastecollected,
	t.trucktype as TruckType,
	d.date as Date
FROM 
   facttrips f
JOIN dimstation s
   ON f.stationid = s.stationedid
JOIN dimtruck t
   ON f.truckid = t.truckid
JOIN dimdate d
   ON f.dateid = d.dateid;		

/* TODO: Change the file path */
\COPY DataForCognos TO '/home/anthony/WasteCollectionDW/data/output/denorm_view.csv' DELIMITER ',' CSV HEADER;
