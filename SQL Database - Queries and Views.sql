--BOOKING A SHIFT
INSERT INTO booked_shift
VALUES (1001, 202401031,0600);

--ALTER THE SHIFT TABLE TO SHOW SHIFT STATUS
ALTER TABLE shift
ADD COLUMN status VARCHAR(50) DEFAULT 'AVAILABLE' NOT NULL;

--UPDATE SHIFT STATUS AFTER BOOKING
UPDATE shift
SET status= 'booked'
WHERE shift_id = 202401031;

--UPDATE SHIFT TO SHOW CLIENT AND SITE INFORMATION
UPDATE shift
SET status = 'booked'
	site_id = office_01
	client_id = 001
WHERE shift_id = 202401031;

--VIEW BOOKED SHIFTS BY EMPLOYEE
SELECT*FROM booked_shift
WHERE employee_id = 1001;

--VIEW HOURS WORKED PER MONTH PER EMPLOYEE
CREATE VIEW employee_hours_per_month AS
SELECT
    employee_id,
    DATE_FORMAT(shift_date, '%Y-%m') AS month,
    SUM(TIMESTAMPDIFF(HOUR, arrival_time, departure_time)) AS hours_worked
FROM shift
GROUP BY employee_id, month;


--RECORD AN INCIDENT DURING A SHIFT
INSERT INTO incident(
	incident_details,
	resolution_status,
	incident_date_time,
	shift_id,
	site_id,
	client_id,
	employee_id)

VALUES (
	'robbery', 
	'in-progress', 
	'2024-01-03 23:00:00',
	202401031,
	'office_01', 
	001, 
	1001);

