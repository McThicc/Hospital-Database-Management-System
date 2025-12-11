-- Sample Data to Insert into Hosptial Database
-- Steven Jones
-- ITC 341

BEGIN
	EXECUTE IMMEDIATE 'TRUNCATE TABLE BILL_ITEM CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
	IF SQLCODE != -942 THEN RAISE; END IF;
END;
/ 
BEGIN
	EXECUTE IMMEDIATE 'TRUNCATE TABLE BILL CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
	IF SQLCODE != -942 THEN RAISE; END IF;
END;
/ 
BEGIN
	EXECUTE IMMEDIATE 'TRUNCATE TABLE TREATMENT_PLAN CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
	IF SQLCODE != -942 THEN RAISE; END IF;
END;
/ 
BEGIN
	EXECUTE IMMEDIATE 'TRUNCATE TABLE STAFF_ASSIGNMENT CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
	IF SQLCODE != -942 THEN RAISE; END IF;
END;
/ 
BEGIN
	EXECUTE IMMEDIATE 'TRUNCATE TABLE ADMISSION CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
	IF SQLCODE != -942 THEN RAISE; END IF;
END;
/ 
BEGIN
	EXECUTE IMMEDIATE 'TRUNCATE TABLE BILL CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
	IF SQLCODE != -942 THEN RAISE; END IF;
END;
/ 
BEGIN
	EXECUTE IMMEDIATE 'TRUNCATE TABLE TREATMENT CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
	IF SQLCODE != -942 THEN RAISE; END IF;
END;
/ 
BEGIN
	EXECUTE IMMEDIATE 'TRUNCATE TABLE STAFF CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
	IF SQLCODE != -942 THEN RAISE; END IF;
END;
/ 
BEGIN
	EXECUTE IMMEDIATE 'TRUNCATE TABLE ROOM CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
	IF SQLCODE != -942 THEN RAISE; END IF;
END;
/ 
BEGIN
	EXECUTE IMMEDIATE 'TRUNCATE TABLE PATIENT CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
	IF SQLCODE != -942 THEN RAISE; END IF;
END;
/ 
BEGIN
	EXECUTE IMMEDIATE 'TRUNCATE TABLE DISEASE CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
	IF SQLCODE != -942 THEN RAISE; END IF;
END;
/ 
BEGIN
	EXECUTE IMMEDIATE 'TRUNCATE TABLE DEPARTMENT CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
	IF SQLCODE != -942 THEN RAISE; END IF;
END;
/ 

-- Departments
INSERT ALL
	INTO DEPARTMENT (DeptID, DeptName, Description) VALUES (101, 'Emergency', 'Initial assessment and critical care.')
	INTO DEPARTMENT (DeptID, DeptName, Description) VALUES (102, 'Cardiology', 'Heart health and surgery.')
	INTO DEPARTMENT (DeptID, DeptName, Description) VALUES (103, 'General Ward', 'Standard inpatient care.')
	INTO DEPARTMENT (DeptID, DeptName, Description) VALUES (104, 'Surgery', 'All general and specialty surgical services')
	INTO DEPARTMENT (DeptID, DeptName, Description) VALUES (105, 'Pediatrics', 'Child health and inpatient pediatric care')
	INTO DEPARTMENT (DeptID, DeptName, Description) VALUES (106, 'Oncology', 'Cancer diagnosis and treatment')
	INTO DEPARTMENT (DeptID, DeptName, Description) VALUES (107, 'Radiology', 'Imaging services')
	INTO DEPARTMENT (DeptID, DeptName, Description) VALUES (108, 'Neurology', 'Brain and nervous system care')
	INTO DEPARTMENT (DeptID, DeptName, Description) VALUES (109, 'Orthopedics', 'Bone and joint services')
	INTO DEPARTMENT (DeptID, DeptName, Description) VALUES (110, 'Maternity', 'Labor, delivery, and postnatal care')
	INTO DEPARTMENT (DeptID, DeptName, Description) VALUES (111, 'Pharmacy', 'Medication dispensing and management')
	INTO DEPARTMENT (DeptID, DeptName, Description) VALUES (112, 'Laboratory', 'Clinical lab testing')
	INTO DEPARTMENT (DeptID, DeptName, Description) VALUES (113, 'Rehab', 'Physical and occupational therapy')
SELECT * FROM dual;

-- Rooms (Ward, ICU, Operating Theater, etc.)
INSERT ALL
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('R101', 'General Ward', 150.00, 103)
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('R102', 'General Ward', 150.00, 103)
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('R103', 'General Ward', 150.00, 103)
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('ICU01', 'ICU', 500.00, 101)
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('ICU02', 'ICU', 500.00, 101)
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('OT01', 'Operating Theater', 1000.00, 102)
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('S201', 'Surgery Ward', 300.00, 104)
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('S202', 'Surgery Ward', 300.00, 104)
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('P301', 'Pediatric Ward', 130.00, 105)
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('P302', 'Pediatric Ward', 130.00, 105)
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('ONC01', 'Oncology Suite', 400.00, 106)
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('RAD01', 'Imaging Bay', 200.00, 107)
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('NEU01', 'Neurology Ward', 350.00, 108)
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('ORTH01', 'Ortho Ward', 220.00, 109)
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('MAT01', 'Maternity Room', 280.00, 110)
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('PH01', 'Pharmacy Office', 0.00, 111)
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('LAB01', 'Lab Bay', 120.00, 112)
	INTO ROOM (RoomNumber, Room_Type, Room_Rate, DeptID) VALUES ('REH01', 'Rehab Gym', 90.00, 113)
SELECT * FROM dual;

-- Staff (Insert Doctors, Nurses, and Ward Boys)
INSERT ALL
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5001, 'Dr. Jonesy', 'Smith', 'Doctor', 'Cardiologist', 102)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5002, 'Dr. Steven', 'Jones', 'Doctor', 'Emergency Med', 101)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5003, 'Nurse Rory', 'Williams', 'Nurse', 'Critical Care', 101)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5004, 'Ward Tom', 'Havorford', 'Ward Boy', NULL, 103)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5100, 'Dr. Alice', 'Miller', 'Doctor', 'General Surgery', 104)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5101, 'Dr. Brian', 'Lee', 'Doctor', 'Pediatrics', 105)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5102, 'Dr. Carmen', 'Ng', 'Doctor', 'Oncology', 106)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5103, 'Dr. Diego', 'Martinez', 'Doctor', 'Radiology', 107)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5104, 'Dr. Evelyn', 'Khan', 'Doctor', 'Neurology', 108)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5105, 'Dr. Frank', 'Osei', 'Doctor', 'Orthopedics', 109)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5106, 'Dr. Grace', 'Yam', 'Doctor', 'Obstetrics', 110)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5107, 'Hector', 'Diaz', 'Pharmacist', NULL, 111)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5108, 'Ivy', 'Chen', 'Lab Tech', NULL, 112)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5109, 'Jon', 'Park', 'Physio', NULL, 113)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5110, 'Kelly', 'Brown', 'Nurse', 'Surgery', 104)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5111, 'Liam', 'Nguyen', 'Nurse', 'Pediatrics', 105)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5112, 'Maya', 'Singh', 'Nurse', 'Oncology', 106)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5113, 'Noah', 'Kim', 'Radiology Tech', NULL, 107)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5114, 'Olivia', 'Adams', 'Nurse', 'Neurology', 108)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5115, 'Paul', 'Green', 'Nurse', 'Ortho', 109)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5116, 'Quinn', 'Lee', 'Midwife', NULL, 110)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5117, 'Rosa', 'Diaz', 'Pharmacy Tech', NULL, 111)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5118, 'Sam', 'Wong', 'Lab Tech', NULL, 112)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5119, 'Tina', 'Hall', 'Therapist', NULL, 113)
	INTO STAFF (StaffID, First_Name, Last_Name, Role, Specialty, DeptID) VALUES (5120, 'Uma', 'Patel', 'Admin', NULL, 101)
SELECT * FROM dual;

-- Update Head Doctor for Cardiology
UPDATE DEPARTMENT SET Head_Doctor_StaffID = 5001 WHERE DeptID = 102;

-- Patients
INSERT ALL
	INTO PATIENT (PatientID, First_Name, Last_Name, Date_of_Birth, Gender, Phone_Number, Address) VALUES (1, 'John', 'Doe', TO_DATE('1985-05-10','YYYY-MM-DD'), 'M', '555-1234', '123 Main St')
	INTO PATIENT (PatientID, First_Name, Last_Name, Date_of_Birth, Gender, Phone_Number, Address) VALUES (2, 'Jane', 'Doe', TO_DATE('1998-11-20','YYYY-MM-DD'), 'F', '555-5678', '456 Oak Ave')
	INTO PATIENT (PatientID, First_Name, Last_Name, Date_of_Birth, Gender, Phone_Number, Address) VALUES (3, 'NotJohn', 'NotDoe', TO_DATE('1979-09-17','YYYY-MM-DD'), 'M', '374-3247', '542 The Ave')
	INTO PATIENT (PatientID, First_Name, Last_Name, Date_of_Birth, Gender, Phone_Number, Address) VALUES (4, 'Finn', 'Sween', TO_DATE('2000-04-23','YYYY-MM-DD'), 'M', '387-7812', 'CMU Lane')
	INTO PATIENT (PatientID, First_Name, Last_Name, Date_of_Birth, Gender, Phone_Number, Address) VALUES (5, 'Josh', 'Walmart', TO_DATE('2003-11-09','YYYY-MM-DD'), 'M', '234-5634', 'Homeless')
	INTO PATIENT (PatientID, First_Name, Last_Name, Date_of_Birth, Gender, Phone_Number, Address) VALUES (6, 'Emily', 'Stone', TO_DATE('1990-02-14','YYYY-MM-DD'), 'F', '555-2345', '78 Pine St')
	INTO PATIENT (PatientID, First_Name, Last_Name, Date_of_Birth, Gender, Phone_Number, Address) VALUES (7, 'Michael', 'Brown', TO_DATE('1982-06-03','YYYY-MM-DD'), 'M', '555-3456', '9 Elm St')
	INTO PATIENT (PatientID, First_Name, Last_Name, Date_of_Birth, Gender, Phone_Number, Address) VALUES (8, 'Sophia', 'Garcia', TO_DATE('1995-12-30','YYYY-MM-DD'), 'F', '555-4567', '12 Maple Ave')
	INTO PATIENT (PatientID, First_Name, Last_Name, Date_of_Birth, Gender, Phone_Number, Address) VALUES (9, 'Daniel', 'Wilson', TO_DATE('1975-03-21','YYYY-MM-DD'), 'M', '555-5670', '34 Oak St')
	INTO PATIENT (PatientID, First_Name, Last_Name, Date_of_Birth, Gender, Phone_Number, Address) VALUES (10, 'Olivia', 'Martinez', TO_DATE('1988-08-08','YYYY-MM-DD'), 'F', '555-6781', '56 Cedar Rd')
	INTO PATIENT (PatientID, First_Name, Last_Name, Date_of_Birth, Gender, Phone_Number, Address) VALUES (11, 'Liam', 'Anderson', TO_DATE('2001-01-15','YYYY-MM-DD'), 'M', '555-7892', '78 Birch Ln')
	INTO PATIENT (PatientID, First_Name, Last_Name, Date_of_Birth, Gender, Phone_Number, Address) VALUES (12, 'Ava', 'Thomas', TO_DATE('1993-09-09','YYYY-MM-DD'), 'F', '555-8903', '90 Spruce Dr')
	INTO PATIENT (PatientID, First_Name, Last_Name, Date_of_Birth, Gender, Phone_Number, Address) VALUES (13, 'Noah', 'Harris', TO_DATE('1980-04-04','YYYY-MM-DD'), 'M', '555-9014', '123 Willow Way')
	INTO PATIENT (PatientID, First_Name, Last_Name, Date_of_Birth, Gender, Phone_Number, Address) VALUES (14, 'Mia', 'Clark', TO_DATE('1996-07-07','YYYY-MM-DD'), 'F', '555-0125', '456 Poplar St')
	INTO PATIENT (PatientID, First_Name, Last_Name, Date_of_Birth, Gender, Phone_Number, Address) VALUES (15, 'Ethan', 'Lewis', TO_DATE('1987-10-10','YYYY-MM-DD'), 'M', '555-1314', '789 Aspen Blvd')
SELECT * FROM dual;

-- Diseases
INSERT ALL
	INTO DISEASE (DiseaseCode, Name, Description) VALUES ('COR01', 'Coronary Artery Disease', 'Blockage in heart arteries.')
	INTO DISEASE (DiseaseCode, Name, Description) VALUES ('FLU01', 'Influenza A', 'Common variant of viral respiratory infection, Type A.')
	INTO DISEASE (DiseaseCode, Name, Description) VALUES ('COV01', 'COVID-19', 'SARS-CoV-2, Infectious Disease')
	INTO DISEASE (DiseaseCode, Name, Description) VALUES ('FLU02', 'Influenza B', 'Common variant viral respiratory infection, Type B.')
	INTO DISEASE (DiseaseCode, Name, Description) VALUES ('ASTH1', 'Asthma', 'Chronic lung condition')
	INTO DISEASE (DiseaseCode, Name, Description) VALUES ('DIAB1', 'Type 2 Diabetes', 'Metabolic disorder')
	INTO DISEASE (DiseaseCode, Name, Description) VALUES ('HYP01', 'Hypertension', 'High blood pressure')
	INTO DISEASE (DiseaseCode, Name, Description) VALUES ('PNEU1', 'Pneumonia', 'Lung infection')
	INTO DISEASE (DiseaseCode, Name, Description) VALUES ('FRA01', 'Fracture', 'Bone fracture')
SELECT * FROM dual;

-- Admissions
INSERT ALL
	INTO ADMISSION (AdmissionID, PatientID, Admission_Date, RoomNumber, Primary_Diagnosis) VALUES (1001, 1, TO_DATE('2025-11-01 10:00:00','YYYY-MM-DD HH24:MI:SS'), 'R101', 'FLU01')
	INTO ADMISSION (AdmissionID, PatientID, Admission_Date, RoomNumber, Primary_Diagnosis) VALUES (1002, 2, TO_DATE('2025-11-15 14:30:00','YYYY-MM-DD HH24:MI:SS'), 'ICU01', 'COR01')
	INTO ADMISSION (AdmissionID, PatientID, Admission_Date, RoomNumber, Primary_Diagnosis) VALUES (1003, 3, TO_DATE('2025-11-07 12:45:00','YYYY-MM-DD HH24:MI:SS'), 'R102', 'FLU02')
	INTO ADMISSION (AdmissionID, PatientID, Admission_Date, RoomNumber, Primary_Diagnosis) VALUES (1004, 4, TO_DATE('2025-11-23 08:21:00','YYYY-MM-DD HH24:MI:SS'), 'R103', 'COV01')
	INTO ADMISSION (AdmissionID, PatientID, Admission_Date, RoomNumber, Primary_Diagnosis) VALUES (1005, 5, TO_DATE('2025-11-04 03:56:00','YYYY-MM-DD HH24:MI:SS'), 'ICU02', 'COV01')
	INTO ADMISSION (AdmissionID, PatientID, Admission_Date, RoomNumber, Primary_Diagnosis) VALUES (1010, 6, TO_DATE('2025-10-05 09:00:00','YYYY-MM-DD HH24:MI:SS'), 'S201', 'FRA01')
	INTO ADMISSION (AdmissionID, PatientID, Admission_Date, RoomNumber, Primary_Diagnosis) VALUES (1011, 7, TO_DATE('2025-10-07 11:30:00','YYYY-MM-DD HH24:MI:SS'), 'P301', 'ASTH1')
	INTO ADMISSION (AdmissionID, PatientID, Admission_Date, RoomNumber, Primary_Diagnosis) VALUES (1012, 8, TO_DATE('2025-10-10 08:45:00','YYYY-MM-DD HH24:MI:SS'), 'ONC01', 'DIAB1')
	INTO ADMISSION (AdmissionID, PatientID, Admission_Date, RoomNumber, Primary_Diagnosis) VALUES (1013, 9, TO_DATE('2025-10-12 13:20:00','YYYY-MM-DD HH24:MI:SS'), 'RAD01', 'PNEU1')
	INTO ADMISSION (AdmissionID, PatientID, Admission_Date, RoomNumber, Primary_Diagnosis) VALUES (1014, 10, TO_DATE('2025-10-20 07:10:00','YYYY-MM-DD HH24:MI:SS'), 'NEU01', 'HYP01')
	INTO ADMISSION (AdmissionID, PatientID, Admission_Date, RoomNumber, Primary_Diagnosis) VALUES (1015, 11, TO_DATE('2025-10-22 15:00:00','YYYY-MM-DD HH24:MI:SS'), 'ORTH01', 'FRA01')
	INTO ADMISSION (AdmissionID, PatientID, Admission_Date, RoomNumber, Primary_Diagnosis) VALUES (1016, 12, TO_DATE('2025-11-02 10:30:00','YYYY-MM-DD HH24:MI:SS'), 'MAT01', 'PNEU1')
	INTO ADMISSION (AdmissionID, PatientID, Admission_Date, RoomNumber, Primary_Diagnosis) VALUES (1017, 13, TO_DATE('2025-11-03 09:10:00','YYYY-MM-DD HH24:MI:SS'), 'LAB01', 'ASTH1')
	INTO ADMISSION (AdmissionID, PatientID, Admission_Date, RoomNumber, Primary_Diagnosis) VALUES (1018, 14, TO_DATE('2025-11-05 12:45:00','YYYY-MM-DD HH24:MI:SS'), 'REH01', 'FRA01')
	INTO ADMISSION (AdmissionID, PatientID, Admission_Date, RoomNumber, Primary_Diagnosis) VALUES (1019, 15, TO_DATE('2025-11-10 16:20:00','YYYY-MM-DD HH24:MI:SS'), 'S202', 'DIAB1')
SELECT * FROM dual;

-- Staff Assignments
-- Dr. Steven Jones (5002) assigned to John Doe (Admission 1001)
INSERT INTO STAFF_ASSIGNMENT (StaffID, AdmissionID, Assignment_Role, Start_Date) VALUES (5002, 1001, 'Attending Doctor', TO_DATE('2025-11-01','YYYY-MM-DD'));

-- Nurse Rory Williams (5003) assigned to John Doe (Admission 1001)
INSERT INTO STAFF_ASSIGNMENT (StaffID, AdmissionID, Assignment_Role, Start_Date) VALUES (5003, 1001, 'Primary Care Nurse', TO_DATE('2025-11-01','YYYY-MM-DD'));

-- Dr. Jonesy Smith (5001) assigned to Jane Doe (Admission 1002)
INSERT INTO STAFF_ASSIGNMENT (StaffID, AdmissionID, Assignment_Role, Start_Date) VALUES (5001, 1002, 'Attending Doctor', TO_DATE('2025-11-15','YYYY-MM-DD'));

-- Dr. Steven Jones (5002) assigned to NotJohn NotDoe (Admission 1003)
INSERT INTO STAFF_ASSIGNMENT (StaffID, AdmissionID, Assignment_Role, Start_Date) VALUES (5002, 1003, 'Attending Doctor', TO_DATE('2025-11-07','YYYY-MM-DD'));

-- Nurse Rory Williams (5003) assigned to NotJohn NotDoe (Admission 1003)
INSERT INTO STAFF_ASSIGNMENT (StaffID, AdmissionID, Assignment_Role, Start_Date) VALUES (5003, 1003, 'Primary Care Nurse', TO_DATE('2025-11-07','YYYY-MM-DD'));

-- Dr. Jonesy Smith (5001) assigned to Finn Sween (Admission 1004)
INSERT INTO STAFF_ASSIGNMENT (StaffID, AdmissionID, Assignment_Role, Start_Date) VALUES (5001, 1004, 'Attending Doctor', TO_DATE('2025-11-23','YYYY-MM-DD'));

-- Dr. Steven Jones (5002) assigned to Josh Walmart (Admission 1005)
INSERT INTO STAFF_ASSIGNMENT (StaffID, AdmissionID, Assignment_Role, Start_Date) VALUES (5002, 1005, 'Attending Doctor', TO_DATE('2025-11-04','YYYY-MM-DD'));

--I'm not going to do comments for everysingle one for all of these assignments, after I show a couple, you get the idea
INSERT INTO STAFF_ASSIGNMENT (StaffID, AdmissionID, Assignment_Role, Start_Date) VALUES (5100, 1010, 'Attending Surgeon', TO_DATE('2025-10-05','YYYY-MM-DD'));
INSERT INTO STAFF_ASSIGNMENT (StaffID, AdmissionID, Assignment_Role, Start_Date) VALUES (5110, 1010, 'Surgical Nurse', TO_DATE('2025-10-05','YYYY-MM-DD'));
INSERT INTO STAFF_ASSIGNMENT (StaffID, AdmissionID, Assignment_Role, Start_Date) VALUES (5101, 1011, 'Attending Pediatrician', TO_DATE('2025-10-07','YYYY-MM-DD'));
INSERT INTO STAFF_ASSIGNMENT (StaffID, AdmissionID, Assignment_Role, Start_Date) VALUES (5111, 1011, 'Pediatric Nurse', TO_DATE('2025-10-07','YYYY-MM-DD'));
INSERT INTO STAFF_ASSIGNMENT (StaffID, AdmissionID, Assignment_Role, Start_Date) VALUES (5102, 1012, 'Oncologist', TO_DATE('2025-10-10','YYYY-MM-DD'));
INSERT INTO STAFF_ASSIGNMENT (StaffID, AdmissionID, Assignment_Role, Start_Date) VALUES (5112, 1012, 'Oncology Nurse', TO_DATE('2025-10-10','YYYY-MM-DD'));
INSERT INTO STAFF_ASSIGNMENT (StaffID, AdmissionID, Assignment_Role, Start_Date) VALUES (5103, 1013, 'Radiologist', TO_DATE('2025-10-12','YYYY-MM-DD'));
INSERT INTO STAFF_ASSIGNMENT (StaffID, AdmissionID, Assignment_Role, Start_Date) VALUES (5113, 1013, 'Rad Tech', TO_DATE('2025-10-12','YYYY-MM-DD'));
INSERT INTO STAFF_ASSIGNMENT (StaffID, AdmissionID, Assignment_Role, Start_Date) VALUES (5104, 1014, 'Neurologist', TO_DATE('2025-10-20','YYYY-MM-DD'));
INSERT INTO STAFF_ASSIGNMENT (StaffID, AdmissionID, Assignment_Role, Start_Date) VALUES (5114, 1014, 'Neuro Nurse', TO_DATE('2025-10-20','YYYY-MM-DD'));

-- Treatments
INSERT ALL
	INTO TREATMENT (TreatmentID, Treatment_Name, Description, Base_Cost) VALUES (1, 'ECG', 'Electrocardiogram', 150.00)
	INTO TREATMENT (TreatmentID, Treatment_Name, Description, Base_Cost) VALUES (2, 'Angioplasty', 'Surgical procedure for blocked vessels.', 12000.00)
	INTO TREATMENT (TreatmentID, Treatment_Name, Description, Base_Cost) VALUES (3, 'Viral Panel Test', 'Test for common viruses.', 250.00)
	INTO TREATMENT (TreatmentID, Treatment_Name, Description, Base_Cost) VALUES (4, 'COVID-19 Test', 'SARS-CoV-2 Swab Test', 100.00)
	INTO TREATMENT (TreatmentID, Treatment_Name, Description, Base_Cost) VALUES (5, 'X-Ray', 'Radiographic imaging', 120.00)
	INTO TREATMENT (TreatmentID, Treatment_Name, Description, Base_Cost) VALUES (6, 'MRI', 'Magnetic Resonance Imaging', 800.00)
	INTO TREATMENT (TreatmentID, Treatment_Name, Description, Base_Cost) VALUES (7, 'Cast Application', 'Orthopedic cast', 200.00)
	INTO TREATMENT (TreatmentID, Treatment_Name, Description, Base_Cost) VALUES (8, 'Chemotherapy Session', 'Oncology infusion', 3500.00)
SELECT * FROM dual;

-- Treatment Plan (Patient John Doe, Admission 1001)
INSERT INTO TREATMENT_PLAN (PlanID, AdmissionID, TreatmentID, Date_Performed) VALUES (1, 1001, 3, TO_DATE('2025-11-01','YYYY-MM-DD'));

-- Treatment Plan (Patient Jane Doe, Admission 1002)
INSERT ALL
	INTO TREATMENT_PLAN (PlanID, AdmissionID, TreatmentID, Date_Performed) VALUES (2, 1002, 1, TO_DATE('2025-11-15','YYYY-MM-DD'))
	INTO TREATMENT_PLAN (PlanID, AdmissionID, TreatmentID, Date_Performed) VALUES (3, 1002, 2, TO_DATE('2025-11-16','YYYY-MM-DD'))
SELECT * FROM dual;

-- Treatment Plan (Patient NotJohn NotDoe, Admission 1003)
INSERT INTO TREATMENT_PLAN (PlanID, AdmissionID, TreatmentID, Date_Performed) VALUES (4, 1003, 3, TO_DATE('2025-11-08','YYYY-MM-DD'));

-- Treatment Plan (Patient Finn Sween, Admission 1004)
INSERT INTO TREATMENT_PLAN (PlanID, AdmissionID, TreatmentID, Date_Performed) VALUES (5, 1004, 4, TO_DATE('2025-11-23','YYYY-MM-DD'));

-- Treatment Plan (Patient Josh Walmart, Admission 1005)
INSERT INTO TREATMENT_PLAN (PlanID, AdmissionID, TreatmentID, Date_Performed) VALUES (6, 1005, 4, TO_DATE('2025-11-04','YYYY-MM-DD'));

INSERT INTO TREATMENT_PLAN (PlanID, AdmissionID, TreatmentID, Date_Performed) VALUES (100, 1010, 5, TO_DATE('2025-10-05','YYYY-MM-DD'));
INSERT INTO TREATMENT_PLAN (PlanID, AdmissionID, TreatmentID, Date_Performed) VALUES (101, 1011, 5, TO_DATE('2025-10-08','YYYY-MM-DD'));
INSERT INTO TREATMENT_PLAN (PlanID, AdmissionID, TreatmentID, Date_Performed) VALUES (102, 1012, 8, TO_DATE('2025-10-11','YYYY-MM-DD'));
INSERT INTO TREATMENT_PLAN (PlanID, AdmissionID, TreatmentID, Date_Performed) VALUES (103, 1013, 6, TO_DATE('2025-10-12','YYYY-MM-DD'));
INSERT INTO TREATMENT_PLAN (PlanID, AdmissionID, TreatmentID, Date_Performed) VALUES (104, 1014, 6, TO_DATE('2025-10-21','YYYY-MM-DD'));
INSERT INTO TREATMENT_PLAN (PlanID, AdmissionID, TreatmentID, Date_Performed) VALUES (105, 1015, 7, TO_DATE('2025-10-23','YYYY-MM-DD'));
INSERT INTO TREATMENT_PLAN (PlanID, AdmissionID, TreatmentID, Date_Performed) VALUES (106, 1016, 3, TO_DATE('2025-11-03','YYYY-MM-DD'));
INSERT INTO TREATMENT_PLAN (PlanID, AdmissionID, TreatmentID, Date_Performed) VALUES (107, 1017, 5, TO_DATE('2025-11-04','YYYY-MM-DD'));
INSERT INTO TREATMENT_PLAN (PlanID, AdmissionID, TreatmentID, Date_Performed) VALUES (108, 1018, 7, TO_DATE('2025-11-06','YYYY-MM-DD'));
INSERT INTO TREATMENT_PLAN (PlanID, AdmissionID, TreatmentID, Date_Performed) VALUES (109, 1019, 2, TO_DATE('2025-11-11','YYYY-MM-DD'));


-- Billing & Discharge (John Doe, Admission 1001)
-- John Doe (1001) discharged after 3 days
UPDATE ADMISSION SET Discharge_Date = TO_DATE('2025-11-04 12:00:00','YYYY-MM-DD HH24:MI:SS') WHERE AdmissionID = 1001;
INSERT INTO BILL (BillID, AdmissionID, Bill_Date, Total_Amount, Status) VALUES (2001, 1001, TO_DATE('2025-11-04','YYYY-MM-DD'), 0.00, 'Pending');

-- Bill Items for Admission 1001 (Room and Treatment)
INSERT ALL
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1, 2001, 'Room R101 (3 days)', 'Room Charge', 3, 150.00)
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (2, 2001, 'Viral Panel Test', 'Treatment Fee', 1, 250.00)
SELECT * FROM dual;
UPDATE BILL SET Total_Amount = (SELECT SUM(Quantity * Unit_Price) FROM BILL_ITEM WHERE BillID = 2001) WHERE BillID = 2001;

-- Billing & Discharge (NotJohn NotDoe, Admission 1003)
-- NotJohn NotDoe (1003) discharged after 5 days
UPDATE ADMISSION SET Discharge_Date = TO_DATE('2025-11-12 12:00:00','YYYY-MM-DD HH24:MI:SS') WHERE AdmissionID = 1003;
INSERT INTO BILL (BillID, AdmissionID, Bill_Date, Total_Amount, Status) VALUES (2002, 1003, TO_DATE('2025-11-12','YYYY-MM-DD'), 0.00, 'Pending');

-- Bill Items for Admission 1003 (Room and Treatment)
INSERT ALL
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (3, 2002, 'Room R102 (5 days)', 'Room Charge', 5, 150.00)
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (4, 2002, 'Viral Panel Test', 'Treatment Fee', 1, 250.00)
SELECT * FROM dual;
UPDATE BILL SET Total_Amount = (SELECT SUM(Quantity * Unit_Price) FROM BILL_ITEM WHERE BillID = 2002) WHERE BillID = 2002;

-- Billing & Discharge (Admission 1002)
INSERT INTO BILL (BillID, AdmissionID, Bill_Date, Total_Amount, Status)
	VALUES (3001, 1002, TO_DATE('2025-11-20','YYYY-MM-DD'), 0.00, 'Pending');

-- Bill Items for Admission 1002
INSERT ALL
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1001, 3001, 'ICU01 (4 days)', 'Room Charge', 4, 500.00)
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1002, 3001, 'ECG', 'Treatment Fee', 1, 150.00)
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1003, 3001, 'Angioplasty', 'Treatment Fee', 1, 12000.00)
SELECT * FROM dual;
UPDATE BILL SET Total_Amount = (SELECT SUM(Quantity * Unit_Price) FROM BILL_ITEM WHERE BillID = 3001) WHERE BillID = 3001;

-- Billing & Discharge (Admission 1004)
INSERT INTO BILL (BillID, AdmissionID, Bill_Date, Total_Amount, Status)
	VALUES (3002, 1004, TO_DATE('2025-11-25','YYYY-MM-DD'), 0.00, 'Pending');

-- Bill Items for Admission 1004
INSERT ALL
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1004, 3002, 'R103 (2 days)', 'Room Charge', 2, 150.00)
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1005, 3002, 'COVID-19 Test', 'Treatment Fee', 1, 100.00)
SELECT * FROM dual;
UPDATE BILL SET Total_Amount = (SELECT SUM(Quantity * Unit_Price) FROM BILL_ITEM WHERE BillID = 3002) WHERE BillID = 3002;

-- Billing & Discharge (Admission 1005)
INSERT INTO BILL (BillID, AdmissionID, Bill_Date, Total_Amount, Status)
	VALUES (3003, 1005, TO_DATE('2025-11-09','YYYY-MM-DD'), 0.00, 'Pending');

-- Bill Items for Admission 1005
INSERT ALL
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1006, 3003, 'ICU02 (5 days)', 'Room Charge', 5, 500.00)
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1007, 3003, 'COVID-19 Test', 'Treatment Fee', 1, 100.00)
SELECT * FROM dual;
UPDATE BILL SET Total_Amount = (SELECT SUM(Quantity * Unit_Price) FROM BILL_ITEM WHERE BillID = 3003) WHERE BillID = 3003;

-- Billing & Discharge (Admission 1010)
INSERT INTO BILL (BillID, AdmissionID, Bill_Date, Total_Amount, Status)
	VALUES (3004, 1010, TO_DATE('2025-10-10','YYYY-MM-DD'), 0.00, 'Pending');

-- Bill Items for Admission 1010
INSERT ALL
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1008, 3004, 'S201 (5 days)', 'Room Charge', 5, 300.00)
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1009, 3004, 'X-Ray', 'Imaging', 1, 120.00)
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1010, 3004, 'Cast Application', 'Treatment Fee', 1, 200.00)
SELECT * FROM dual;
UPDATE BILL SET Total_Amount = (SELECT SUM(Quantity * Unit_Price) FROM BILL_ITEM WHERE BillID = 3004) WHERE BillID = 3004;

-- Billing & Discharge (Admission 1011)
INSERT INTO BILL (BillID, AdmissionID, Bill_Date, Total_Amount, Status)
	VALUES (3005, 1011, TO_DATE('2025-10-09','YYYY-MM-DD'), 0.00, 'Pending');

-- Bill Items for Admission 1011
INSERT ALL
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1011, 3005, 'P301 (2 days)', 'Room Charge', 2, 130.00)
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1012, 3005, 'X-Ray', 'Imaging', 1, 120.00)
SELECT * FROM dual;
UPDATE BILL SET Total_Amount = (SELECT SUM(Quantity * Unit_Price) FROM BILL_ITEM WHERE BillID = 3005) WHERE BillID = 3005;

-- Billing & Discharge (Admission 1012)
INSERT INTO BILL (BillID, AdmissionID, Bill_Date, Total_Amount, Status)
	VALUES (3006, 1012, TO_DATE('2025-10-15','YYYY-MM-DD'), 0.00, 'Pending');

-- Bill Items for Admission 1012
INSERT ALL
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1013, 3006, 'ONC01 (3 days)', 'Room Charge', 3, 400.00)
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1014, 3006, 'Chemotherapy Session', 'Treatment Fee', 1, 3500.00)
SELECT * FROM dual;
UPDATE BILL SET Total_Amount = (SELECT SUM(Quantity * Unit_Price) FROM BILL_ITEM WHERE BillID = 3006) WHERE BillID = 3006;

-- Billing & Discharge (Admission 1013)
INSERT INTO BILL (BillID, AdmissionID, Bill_Date, Total_Amount, Status)
	VALUES (3007, 1013, TO_DATE('2025-10-13','YYYY-MM-DD'), 0.00, 'Pending');

-- Bill Items for Admission 1013
INSERT ALL
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1015, 3007, 'RAD01 (1 day)', 'Room Charge', 1, 200.00)
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1016, 3007, 'MRI', 'Imaging', 1, 800.00)
SELECT * FROM dual;
UPDATE BILL SET Total_Amount = (SELECT SUM(Quantity * Unit_Price) FROM BILL_ITEM WHERE BillID = 3007) WHERE BillID = 3007;

-- Billing & Discharge (Admission 1014)
INSERT INTO BILL (BillID, AdmissionID, Bill_Date, Total_Amount, Status)
	VALUES (3008, 1014, TO_DATE('2025-10-24','YYYY-MM-DD'), 0.00, 'Pending');

-- Bill Items for Admission 1014
INSERT ALL
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1017, 3008, 'NEU01 (3 days)', 'Room Charge', 3, 350.00)
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1018, 3008, 'MRI', 'Imaging', 1, 800.00)
SELECT * FROM dual;
UPDATE BILL SET Total_Amount = (SELECT SUM(Quantity * Unit_Price) FROM BILL_ITEM WHERE BillID = 3008) WHERE BillID = 3008;

-- Billing & Discharge (Admission 1015)
INSERT INTO BILL (BillID, AdmissionID, Bill_Date, Total_Amount, Status)
	VALUES (3009, 1015, TO_DATE('2025-10-24','YYYY-MM-DD'), 0.00, 'Pending');

-- Bill Items for Admission 1015
INSERT ALL
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1019, 3009, 'ORTH01 (2 days)', 'Room Charge', 2, 220.00)
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1020, 3009, 'Cast Application', 'Treatment Fee', 1, 200.00)
SELECT * FROM dual;
UPDATE BILL SET Total_Amount = (SELECT SUM(Quantity * Unit_Price) FROM BILL_ITEM WHERE BillID = 3009) WHERE BillID = 3009;

-- Billing & Discharge (Admission 1016)
INSERT INTO BILL (BillID, AdmissionID, Bill_Date, Total_Amount, Status)
	VALUES (3010, 1016, TO_DATE('2025-11-04','YYYY-MM-DD'), 0.00, 'Pending');

-- Bill Items for Admission 1016
INSERT ALL
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1021, 3010, 'MAT01 (1 day)', 'Room Charge', 1, 280.00)
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1022, 3010, 'Viral Panel Test', 'Treatment Fee', 1, 250.00)
SELECT * FROM dual;
UPDATE BILL SET Total_Amount = (SELECT SUM(Quantity * Unit_Price) FROM BILL_ITEM WHERE BillID = 3010) WHERE BillID = 3010;

-- Billing & Discharge (Admission 1017)
INSERT INTO BILL (BillID, AdmissionID, Bill_Date, Total_Amount, Status)
	VALUES (3011, 1017, TO_DATE('2025-11-05','YYYY-MM-DD'), 0.00, 'Pending');

-- Bill Items for Admission 1017
INSERT ALL
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1023, 3011, 'LAB01 (1 day)', 'Room Charge', 1, 120.00)
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1024, 3011, 'X-Ray', 'Imaging', 1, 120.00)
SELECT * FROM dual;
UPDATE BILL SET Total_Amount = (SELECT SUM(Quantity * Unit_Price) FROM BILL_ITEM WHERE BillID = 3011) WHERE BillID = 3011;

-- Billing & Discharge (Admission 1018)
INSERT INTO BILL (BillID, AdmissionID, Bill_Date, Total_Amount, Status)
	VALUES (3012, 1018, TO_DATE('2025-11-12','YYYY-MM-DD'), 0.00, 'Pending');

-- Bill Items for Admission 1018
INSERT ALL
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1025, 3012, 'REH01 (7 days)', 'Room Charge', 7, 90.00)
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1026, 3012, 'Cast Application', 'Treatment Fee', 1, 200.00)
SELECT * FROM dual;
UPDATE BILL SET Total_Amount = (SELECT SUM(Quantity * Unit_Price) FROM BILL_ITEM WHERE BillID = 3012) WHERE BillID = 3012;

-- Billing & Discharge (Admission 1019)
INSERT INTO BILL (BillID, AdmissionID, Bill_Date, Total_Amount, Status)
	VALUES (3013, 1019, TO_DATE('2025-11-15','YYYY-MM-DD'), 0.00, 'Pending');

-- Bill Items for Admission 1019
INSERT ALL
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1027, 3013, 'S202 (4 days)', 'Room Charge', 4, 300.00)
	INTO BILL_ITEM (BillItemID, BillID, Item_Description, Item_Type, Quantity, Unit_Price) VALUES (1028, 3013, 'Angioplasty', 'Treatment Fee', 1, 12000.00)
SELECT * FROM dual;
UPDATE BILL SET Total_Amount = (SELECT SUM(Quantity * Unit_Price) FROM BILL_ITEM WHERE BillID = 3013) WHERE BillID = 3013;