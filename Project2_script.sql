-- creating databse

CREATE DATABASE EMR1;

USE EMR1;

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(50),
    insurance VARCHAR(50)
);

CREATE TABLE Providers (
    provider_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(50) NOT NULL
);

CREATE TABLE Visits (
    visit_id INT PRIMARY KEY,
    patient_id INT NOT NULL,
    provider_id INT NOT NULL,
    facility VARCHAR(50) NOT NULL,
    visit_date DATETIME NOT NULL,
    reason_for_visit VARCHAR(500) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (provider_id) REFERENCES Providers(provider_id)
);


CREATE TABLE Clinical_Care (
    clinical_care_id INT PRIMARY KEY,
    visit_id INT NOT NULL,
    sign_and_symptoms VARCHAR(500),
    discharge_diagnosis VARCHAR(500),
    prescriptions VARCHAR(500),
    exams_tests_procedures VARCHAR(500),
    FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT NOT NULL,
    provider_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    exam_room VARCHAR(50) NOT NULL,
    appointment_type VARCHAR(50) NOT NULL,
    appointment_status VARCHAR(50) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (provider_id) REFERENCES Providers(provider_id)
);

CREATE TABLE Beds (
    bed_id INT PRIMARY KEY,
    bed_type VARCHAR(50) NOT NULL,
    bed_location VARCHAR(50) NOT NULL
);

CREATE TABLE Bed_Assignments (
    bed_assignment_id INT PRIMARY KEY,
    visit_id INT NOT NULL,
    bed_id INT NOT NULL,
    admission_date DATETIME NOT NULL,
    discharge_date DATETIME,
    FOREIGN KEY (visit_id) REFERENCES Visits(visit_id),
    FOREIGN KEY (bed_id) REFERENCES Beds(bed_id)
);


CREATE TABLE Supplies (
    supply_id INT PRIMARY KEY,
    supply_name VARCHAR(50) NOT NULL,
    quantity INT NOT NULL
);

CREATE TABLE Billing (
    billing_id INT PRIMARY KEY,
    visit_id INT NOT NULL,
    amount_due DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(50) NOT NULL,
    FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
);


-- Patients table

INSERT INTO Patients (patient_id, first_name, last_name, date_of_birth, address, phone_number, email, insurance) VALUES
(1, 'John', 'Doe', '1985-07-12', '123 Main St', '555-1234', 'johndoe@email.com', 'Blue Cross'),
(2, 'Jane', 'Smith', '1990-02-28', '456 Oak Ave', '555-5678', 'janesmith@email.com', 'Aetna'),
(3, 'Sang', 'Kim', '1978-10-05', '789 Maple Blvd', '555-9012', 'sangkim@email.com', 'Cigna'),
(4, 'Ji-eun', 'Park', '1983-06-19', '321 Pine St', '555-3456', 'jieunpark@email.com', 'UnitedHealth'),
(5, 'Sukhvinder', 'Singh', '1975-12-01', '654 Cedar Dr', '555-7890', 'sukhvindersingh@email.com', 'Humana'),
(6, 'Seung-hoon', 'Lee', '1992-09-07', '987 Elm St', '555-2345', 'seunghoonlee@email.com', 'Kaiser'),
(7, 'Sujata', 'Patel', '1980-04-23', '753 Oak Ave', '555-6789', 'sujatapatel@email.com', 'Blue Cross'),
(8, 'Rohit', 'Sharma', '1988-12-15', '246 Pine St', '555-0123', 'rohitsharma@email.com', 'Aetna'),
(9, 'Aarti', 'Patil', '1973-05-30', '135 Maple Blvd', '555-4567', 'aartipatil@email.com', 'Cigna'),
(10, 'Sung-ho', 'Choi', '1995-01-22', '864 Cedar Dr', '555-8901', 'sunghochoi@email.com', 'UnitedHealth');

--  PROVIDERS TABLE VALUES

INSERT INTO Providers (provider_id, first_name, last_name, specialty) VALUES
(1, 'Soo Jin', 'Park', 'Pediatrics'),
(2, 'Ji Woo', 'Kim', 'Internal Medicine'),
(3, 'Sang Min', 'Lee', 'Cardiology'),
(4, 'Sun Hwa', 'Cho', 'Dermatology'),
(5, 'Priya', 'Patel', 'Family Medicine'),
(6, 'Amit', 'Shah', 'Neurology'),
(7, 'Rakesh', 'Kumar', 'Oncology'),
(8, 'Ritu', 'Singh', 'Obstetrics and Gynecology'),
(9, 'Naveen', 'Reddy', 'Orthopedics'),
(10, 'Hae Won', 'Kim', 'Psychiatry');

-- VISITS

INSERT INTO Visits (visit_id, patient_id, provider_id, facility, visit_date, reason_for_visit)
VALUES
    (1, 3, 6, 'Mercy General Hospital', '2022-08-12 10:30:00', 'Annual check-up'),
    (2, 1, 2, 'St. Mary Hospital', '2022-11-02 09:45:00', 'Flu symptoms'),
    (3, 5, 3, 'St. Vincent Medical Center', '2022-12-01 14:15:00', 'Chest pain'),
    (4, 8, 10, 'Kaiser Permanente Oakland Medical Center', '2023-02-10 11:00:00', 'Ear infection'),
    (5, 2, 7, 'NewYork-Presbyterian Hospital', '2023-03-15 16:30:00', 'Broken arm'),
    (6, 9, 9, 'Massachusetts General Hospital', '2023-04-20 08:00:00', 'Routine physical'),
    (7, 6, 5, 'Mayo Clinic', '2023-05-01 13:45:00', 'Migraines'),
    (8, 7, 12, 'Mount Sinai Hospital', '2023-06-17 10:00:00', 'Annual check-up'),
    (9, 4, 4, 'UCLA Medical Center', '2023-07-08 14:15:00', 'Shortness of breath'),
    (10, 10, 1, 'Johns Hopkins Hospital', '2023-09-03 11:30:00', 'Fever');
    
    
    -- CLINICAL CARE TABLE VALUES
    
    
    INSERT INTO Clinical_Care (clinical_care_id, visit_id, sign_and_symptoms, discharge_diagnosis, prescriptions, exams_tests_procedures)
VALUES 
(1, 1, 'Fever, cough, headache', 'Common cold', 'Acetaminophen', 'Physical examination, CBC'),
(2, 2, 'Abdominal pain, nausea, vomiting', 'Gastritis', 'Omeprazole', 'Endoscopy'),
(3, 3, 'Shortness of breath, chest pain', 'Pulmonary embolism', 'Anticoagulants', 'CT scan'),
(4, 4, 'Fatigue, weight gain', 'Hypothyroidism', 'Levothyroxine', 'TSH blood test'),
(5, 5, 'Chest pain, palpitations', 'Atrial fibrillation', 'Beta-blocker', 'EKG'),
(6, 6, 'Fever, headache, skin rash', 'Lyme disease', 'Doxycycline', 'ELISA test'),
(7, 7, 'Abdominal pain, bloating, constipation', 'Irritable bowel syndrome', 'Fiber supplement', 'Colonoscopy'),
(8, 8, 'Joint pain, stiffness', 'Rheumatoid arthritis', 'Methotrexate', 'RF blood test'),
(9, 9, 'Numbness, tingling, weakness', 'Herniated disc', 'NSAIDs', 'MRI'),
(10, 10, 'Chest pain, shortness of breath', 'Myocardial infarction', 'Aspirin, nitroglycerin', 'Cardiac catheterization');


-- APPOINTMENTS TABLE VALUES

INSERT INTO Appointments (appointment_id, patient_id, provider_id, appointment_date, exam_room, appointment_type, appointment_status)
VALUES 
(1, 2, 4, '2022-05-15 10:00:00', 'Room 101', 'General Check-up', 'Confirmed'),
(2, 5, 1, '2022-06-12 14:30:00', 'Room 203', 'Dental Exam', 'Confirmed'),
(3, 3, 3, '2022-07-08 09:15:00', 'Room 102', 'Physical Therapy', 'Canceled'),
(4, 1, 2, '2022-08-16 11:45:00', 'Room 205', 'Eye Exam', 'Confirmed'),
(5, 4, 5, '2022-09-19 16:00:00', 'Room 104', 'General Check-up', 'Confirmed'),
(6, 2, 4, '2022-10-23 15:20:00', 'Room 201', 'Dental Cleaning', 'Confirmed'),
(7, 1, 1, '2022-11-18 13:00:00', 'Room 206', 'Physical Exam', 'Confirmed'),
(8, 3, 3, '2022-12-14 08:45:00', 'Room 103', 'Physical Therapy', 'Confirmed'),
(9, 5, 2, '2023-01-21 10:30:00', 'Room 202', 'Eye Exam', 'Confirmed'),
(10, 4, 5, '2023-02-17 11:15:00', 'Room 105', 'General Check-up', 'Confirmed');


-- BEDS TABLE VALUES


INSERT INTO Beds (bed_id, bed_type, bed_location) VALUES
(1, 'Standard', 'East Wing, 3rd floor'),
(2, 'Standard', 'West Wing, 2nd floor'),
(3, 'Intensive Care', 'North Wing, 5th floor'),
(4, 'Pediatric', 'South Wing, 4th floor'),
(5, 'Standard', 'East Wing, 1st floor'),
(6, 'Intensive Care', 'West Wing, 3rd floor'),
(7, 'Standard', 'North Wing, 2nd floor'),
(8, 'Pediatric', 'South Wing, 5th floor'),
(9, 'Intensive Care', 'East Wing, 4th floor'),
(10, 'Standard', 'West Wing, 1st floor');


-- BED ASSIGNMENT TABLE VALUES

INSERT INTO Bed_Assignments (bed_assignment_id, visit_id, bed_id, admission_date, discharge_date)
VALUES 
(1, 2, 3, '2022-01-01 10:00:00', '2022-01-05 14:30:00'),
(2, 5, 1, '2022-02-12 08:15:00', '2022-02-18 16:45:00'),
(3, 7, 6, '2022-03-15 12:30:00', '2022-03-17 10:45:00'),
(4, 10, 8, '2022-04-20 11:00:00', '2022-04-22 09:30:00'),
(5, 1, 2, '2022-05-08 09:45:00', '2022-05-12 11:15:00'),
(6, 3, 5, '2022-06-17 13:00:00', '2022-06-19 16:00:00'),
(7, 6, 10, '2022-07-23 17:30:00', '2022-07-25 08:15:00'),
(8, 9, 9, '2022-08-30 09:00:00', '2022-09-02 13:30:00'),
(9, 8, 4, '2022-09-15 10:45:00', '2022-09-18 12:00:00'),
(10, 4, 7, '2022-10-25 14:00:00', '2022-10-30 16:30:00');

-- INSERTING VALUES INTO SUPPLIES TABLE

INSERT INTO Supplies (supply_id, supply_name, quantity)
VALUES 
(1, 'Band-Aids', 100),
(2, 'Syringes', 50),
(3, 'Gauze', 200),
(4, 'Oxygen masks', 20),
(5, 'Thermometers', 30),
(6, 'Ace bandages', 80),
(7, 'Aspirin', 150),
(8, 'Insulin', 10),
(9, 'Sanitizer', 100),
(10, 'Neosporin', 50);

-- INSERTING VALUES INTO BILLING TABLE 

INSERT INTO Billing (billing_id, visit_id, amount_due, payment_status)
VALUES
    (1, 1, 1500.00, 'unpaid'),
    (2, 2, 200.50, 'paid'),
    (3, 3, 75.25, 'unpaid'),
    (4, 4, 500.00, 'unpaid'),
    (5, 5, 1200.75, 'paid'),
    (6, 6, 350.00, 'unpaid'),
    (7, 7, 1000.00, 'paid'),
    (8, 8, 75.00, 'paid'),
    (9, 9, 300.00, 'unpaid'),
    (10, 10, 600.25, 'unpaid');
    
   -- support editing of existing records to correct data entry mistakes 
   
    UPDATE Patients
SET address = 'New Address'
WHERE patient_id = 1;


UPDATE Patients
SET insurance = 'New Insurance'
WHERE patient_id = 1;

-- searching of patient records based on name, ID, and possibly

SELECT * FROM Patients WHERE first_name = 'John' AND last_name = 'Doe';

SELECT * FROM Visits WHERE visit_date >= '2022-01-01' AND visit_date <= '2022-12-31';

-- reporting functions such as listing of all patients who satisfy certain selection criteria, such as those who have been given certain diagnosis,

SELECT p.first_name, p.last_name, c.discharge_diagnosis
FROM Patients p
JOIN Visits v ON p.patient_id = v.patient_id
JOIN Clinical_Care c ON v.visit_id = c.visit_id
WHERE c.discharge_diagnosis = 'common cold';

-- Listing of all patients who visited on a certain day

SELECT p.first_name, p.last_name, v.visit_date
FROM Patients p
JOIN Visits v ON p.patient_id = v.patient_id
WHERE DATE(v.visit_date) = '2023-03-15';



-- Listing of all patients who have been seen by a certain doctor:

SELECT p.first_name, p.last_name, pr.first_name AS provider_first_name, pr.last_name AS provider_last_name
FROM Patients p
JOIN Visits v ON p.patient_id = v.patient_id
JOIN Providers pr ON v.provider_id = pr.provider_id
WHERE pr.last_name = 'Park';

-- Retrieve patient information and their appointments:


SELECT p.first_name, p.last_name, a.appointment_date, a.appointment_type, a.appointment_status
FROM Patients p
INNER JOIN Appointments a ON p.patient_id = a.patient_id
WHERE p.patient_id = 1;

-- Retrieve provider information and their upcoming appointments:

SELECT pr.first_name, pr.last_name, a.appointment_date, a.appointment_type, a.appointment_status
FROM Providers pr
INNER JOIN Appointments a ON pr.provider_id = a.provider_id
WHERE pr.provider_id = 1 AND a.appointment_date > NOW();

-- Retrieve a patient's clinical care information:


SELECT cc.sign_and_symptoms, cc.discharge_diagnosis, cc.prescriptions, cc.exams_tests_procedures
FROM Clinical_Care cc
INNER JOIN Visits v ON cc.visit_id = v.visit_id
INNER JOIN Patients p ON v.patient_id = p.patient_id
WHERE p.patient_id = 1;

-- Retrieve a patient's billing information:

SELECT b.amount_due, b.payment_status
FROM Billing b
INNER JOIN Visits v ON b.visit_id = v.visit_id
INNER JOIN Patients p ON v.patient_id = p.patient_id
WHERE p.patient_id = 1;

-- Get a patient's visits:


SELECT v.visit_id, v.visit_date, v.reason_for_visit, p.first_name AS provider_first_name, p.last_name AS provider_last_name
FROM Visits v
JOIN Providers p ON v.provider_id = p.provider_id
WHERE v.patient_id = 5;

-- Get a patient's appointments:


SELECT Appointments.appointment_id, Appointments.appointment_date, Appointments.exam_room, Appointments.appointment_type, Appointments.appointment_status, Providers.first_name AS provider_first_name, Providers.last_name AS provider_last_name
FROM Appointments
JOIN Providers ON Appointments.provider_id = Providers.provider_id
WHERE Appointments.patient_id = 1;


-- -------------------------

-- Project 2 --

DELIMITER //

CREATE PROCEDURE GetPatients()
BEGIN
    SELECT * FROM Patients;
END //

DELIMITER ;


-- Creating roles

CREATE ROLE 'physician';

-- Create the user 'physician' and grant privileges
CREATE USER 'physician'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE ON EMR1.Patients TO 'physician';


CREATE ROLE 'Providers';

-- Create the user 'Providers' and grant privileges
CREATE USER 'Providers'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE ON EMR1.Providers TO 'Providers';



-- audit trail

CREATE TABLE AuditTrail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(255),
    record_id INT,
    action VARCHAR(50),
    user_id INT,
    timestamp TIMESTAMP,
    previous_value JSON
);

-- Trigger for the Patients table

-- Trigger for the Patients table
DELIMITER //

CREATE TRIGGER patients_audit_trigger
AFTER INSERT ON Patients
FOR EACH ROW
BEGIN
    INSERT INTO AuditTrail (table_name, record_id, action, user_id, timestamp)
    VALUES ('Patients', NEW.id, 'INSERT', @user_id, NOW());
END//

CREATE TRIGGER patients_update_audit_trigger
AFTER UPDATE ON Patients
FOR EACH ROW
BEGIN
    INSERT INTO AuditTrail (table_name, record_id, action, user_id, timestamp, previous_value)
    VALUES ('Patients', NEW.id, 'UPDATE', @user_id, NOW(), JSON_OBJECT(
        'name', OLD.name,
        'age', OLD.age,
        'gender', OLD.gender,
        'address', OLD.address
    ));
END//

DELIMITER ;

-- Trigger for the Patients table


-- --------------------------------------------------

CREATE TABLE Audit_Log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    table_name VARCHAR(50) NOT NULL,
    record_id INT NOT NULL,
    user_id INT NOT NULL,
    action_type VARCHAR(10) NOT NULL,
    action_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Patients table
ALTER TABLE Patients ADD COLUMN previous_values JSON;

-- Providers table
ALTER TABLE Providers ADD COLUMN previous_values JSON;

-- Visits table
ALTER TABLE Visits ADD COLUMN previous_values JSON;

-- Clinical_Care table
ALTER TABLE Clinical_Care ADD COLUMN previous_values JSON;

-- Appointments table
ALTER TABLE Appointments ADD COLUMN previous_values JSON;

-- Beds table
ALTER TABLE Beds ADD COLUMN previous_values JSON;

-- Bed_Assignments table
ALTER TABLE Bed_Assignments ADD COLUMN previous_values JSON;

-- Supplies table
ALTER TABLE Supplies ADD COLUMN previous_values JSON;

-- Billing table
ALTER TABLE Billing ADD COLUMN previous_values JSON;

-- ---------------------------

-- Patients table trigger
DELIMITER //

CREATE TRIGGER Patients_Audit_Trigger
AFTER UPDATE ON Patients
FOR EACH ROW
BEGIN
    IF OLD.first_name <> NEW.first_name OR
       OLD.last_name <> NEW.last_name OR
       OLD.date_of_birth <> NEW.date_of_birth OR
       OLD.address <> NEW.address OR
       OLD.phone_number <> NEW.phone_number OR
       OLD.email <> NEW.email OR
       OLD.insurance <> NEW.insurance THEN

        INSERT INTO Audit_Log (table_name, record_id, user_id, action_type)
        VALUES ('Patients', NEW.patient_id, 1, 'update');
    END IF;
END //

DELIMITER ;




DESCRIBE Patients;

DESCRIBE Audit_Log;

ALTER TABLE table_name DROP COLUMN previous_values;


-- -----------------------------------------------------------------------------------




-- Create triggers to capture the changes in each table and insert into Audit_Log




-- Adding indexes to the Patients table
CREATE INDEX idx_patients_last_name ON Patients(last_name);
CREATE INDEX idx_patients_date_of_birth ON Patients(date_of_birth);

CREATE INDEX idx_providers_last_name ON Providers(last_name);
CREATE INDEX idx_providers_specialty ON Providers(specialty);

CREATE INDEX idx_visits_patient_id ON Visits(patient_id);
CREATE INDEX idx_visits_provider_id ON Visits(provider_id);
CREATE INDEX idx_visits_visit_date ON Visits(visit_date);

CREATE INDEX idx_appointments_patient_id ON Appointments(patient_id);
CREATE INDEX idx_appointments_provider_id ON Appointments(provider_id);
CREATE INDEX idx_appointments_appointment_date ON Appointments(appointment_date);

CREATE INDEX idx_bed_assignments_visit_id ON Bed_Assignments(visit_id);
CREATE INDEX idx_bed_assignments_bed_id ON Bed_Assignments(bed_id);

CREATE INDEX idx_billing_visit_id ON Billing(visit_id);

-- views

-- View 1: Patient Information with Provider Details
CREATE VIEW PatientProviderView AS
SELECT P.patient_id, P.first_name, P.last_name, P.date_of_birth, P.address, P.phone_number, P.email, P.insurance,
       V.visit_id, V.facility, V.visit_date,
       PR.first_name AS provider_first_name, PR.last_name AS provider_last_name, PR.specialty
FROM Patients P
JOIN Visits V ON P.patient_id = V.patient_id
JOIN Providers PR ON V.provider_id = PR.provider_id;

-- View 2: Latest Visit for Each Patient
CREATE VIEW LatestVisitView AS
SELECT P.patient_id, P.first_name, P.last_name, P.date_of_birth, V.visit_id, V.visit_date
FROM Patients P
JOIN Visits V ON P.patient_id = V.patient_id
JOIN (
    SELECT patient_id, MAX(visit_date) AS latest_visit_date
    FROM Visits
    GROUP BY patient_id
) LV ON V.patient_id = LV.patient_id AND V.visit_date = LV.latest_visit_date;

-- View 3: Bed Assignments with Patient Details
CREATE VIEW BedAssignmentsView AS
SELECT BA.bed_assignment_id, BA.visit_id, BA.bed_id, BA.admission_date, BA.discharge_date,
       P.patient_id, P.first_name, P.last_name, P.date_of_birth
FROM Bed_Assignments BA
JOIN Visits V ON BA.visit_id = V.visit_id
JOIN Patients P ON V.patient_id = P.patient_id;
