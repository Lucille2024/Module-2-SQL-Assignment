--CREATE EMPLOYEE TABLE
CREATE TABLE employee (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(200),
	last_name VARCHAR (200),
	contact_number INT,
	email VARCHAR(200),
	address VARCHAR(1000),
	shift_id VARCHAR(200),
	site_id VARCHAR(50),
	client_id INT,
	vehicle_id VARCHAR (50),
	incident_id INT,
	FOREIGN KEY (shift_id) REFERENCES shift(shift_id),
	FOREIGN KEY (site_id) REFERENCES site(site_id),
	FOREIGN KEY (client_id) REFERENCES client(client_id),
	FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id),
	FOREIGN KEY (Incident_id) REFERENCES incident(incident_id)
);

--CREATE CLIENT TABLE
CREATE TABLE client(
	client_id INT PRIMARY KEY,
	client_name VARCHAR(200),
	client_address VARCHAR(1000),
	contact_number INT,
	email VARCHAR(200),
	site_id VARCHAR(50),
	FOREIGN KEY (site_id) REFERENCES site(site_id)
);

--CREATE SITE TABLE
CREATE TABLE site(
 	site_id VARCHAR(50) PRIMARY KEY,
	site_name VARCHAR(200),
	site_address VARCHAR(1000),
	client_id INT,
	employee_id INT,
	vehicle_id VARCHAR(50),
	incident_id INT,
	FOREIGN KEY (client_id) REFERENCES client(client_id),
	FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
	FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id),
	FOREIGN KEY (incident_id) REFERENCES incident(incident_id)
);

--CREATE SHIFT TABLE
CREATE TABLE shift(
	shift_id INT PRIMARY KEY,
	shift_date DATE,
	shift_time TIMESTAMP,
	arrival_time TIMESTAMP,
	departure_time TIMESTAMP,
	employee_id INT,
	client_id INT,
	site_id VARCHAR(50),
	vehicle_id VARCHAR(50),
	incident_id INT,
	FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
	FOREIGN KEY (client_id) REFERENCES client(client_id),
	FOREIGN KEY (site_id) REFERENCES site(site_id),
	FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id),
	FOREIGN KEY (incident_id) REFERENCES incident(incident_id)
);

--CREATE INCIDENT TABLE
CREATE TABLE incident(
	incident_id INT PRIMARY KEY,
	incident_details VARCHAR(2000),
	resolution_status VARCHAR (10), --YES, NO, IN-PROGRESS
	incident_date_time TIMESTAMP,
	shift_id INT,
	site_id VARCHAR(50),
	client_id INT,
	employee_id INT,
	FOREIGN KEY (shift_id) REFERENCES shift(shift_id),
	FOREIGN KEY (site_id) REFERENCES site(site_id),
	FOREIGN KEY (client_id) REFERENCES client(client_id),
	FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);


--CREATE VEHICLES TABLE
CREATE TABLE vehicle(
	vehicle_id VARCHAR(50) PRIMARY KEY,
	vehicle_model VARCHAR(200),
	vehicle_make VARCHAR(200),
	site_id VARCHAR(50),
	shift_id INT,
	employee_id INT,
	client_id INT,
	FOREIGN KEY(site_id) REFERENCES site(site_id),
	FOREIGN KEY (shift_id) REFERENCES shift(shift_id),
	FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
	FOREIGN KEY (client_id) REFERENCES client(client_id)
	);
	
--CREATE A TABLE FOR BOOKED SHIFTS
CREATE TABLE booked_shifts(
	booking_id INT PRIMARY KEY,
	employee_id INT,
	shift_id INT,
	booking_time TIMESTAMP,
	FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
	FOREIGN KEY (shift_id) REFERENCES shift(shift_id),
);