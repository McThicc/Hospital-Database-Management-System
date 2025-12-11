-- Some Queries to show that the thing works
-- Steven Jones
-- ITC 341

-- 1. Lists all active and discharged patients with their personal details, admission date, assigned room, and primary diagnosis
SELECT
    P.PatientID,
    P.First_Name || ' ' || P.Last_Name AS Patient_Name,
    P.Phone_Number,
    A.AdmissionID,
    A.Admission_Date,
    A.Discharge_Date,
    R.RoomNumber,
    R.Room_Type,
    D.Name AS Primary_Diagnosis
FROM
    PATIENT P
JOIN
    ADMISSION A ON P.PatientID = A.PatientID
JOIN
    ROOM R ON A.RoomNumber = R.RoomNumber
JOIN
    DISEASE D ON A.Primary_Diagnosis = D.DiseaseCode
ORDER BY
    A.Admission_Date DESC;

-- 2. Shows each Doctor and Nurse currently assigned to patients and the count of their active admissions
SELECT
    S.StaffID,
    S.Role,
    S.First_Name || ' ' || S.Last_Name AS Staff_Name,
    COUNT(DISTINCT SA.AdmissionID) AS Active_Admissions_Count
FROM
    STAFF S
JOIN
    STAFF_ASSIGNMENT SA ON S.StaffID = SA.StaffID
JOIN
    ADMISSION A ON SA.AdmissionID = A.AdmissionID
WHERE
    S.Role IN ('Doctor', 'Nurse') -- Filter for the roles that we actually want to see
    AND A.Discharge_Date IS NULL    -- So that it doesn't show people that have already been discharged
GROUP BY
    S.StaffID, S.Role, S.First_Name, S.Last_Name
ORDER BY
    Active_Admissions_Count DESC;

-- 3. This query calculates the total charges for the room and treatment costs for a patient
SELECT
    A.AdmissionID,
    P.First_Name || ' ' || P.Last_Name AS Patient_Name,
    -- Calculate Room Charges: Date difference in Days * Room Rate
    -- Uses current date if not discharged, or their discharge date if discharged
    SUM(
        (NVL(A.Discharge_Date, SYSDATE) - A.Admission_Date) * R.Room_Rate
    ) AS Total_Room_Charges,
    -- Calculate Treatment Charges: Base_Cost for all treatments performed added together
    NVL(SUM(T.Base_Cost), 0.00) AS Total_Treatment_Fees,
    -- Total Bill: Room Charges + Treatment Fees
    (
        SUM((NVL(A.Discharge_Date, SYSDATE) - A.Admission_Date) * R.Room_Rate)
        +
        NVL(SUM(T.Base_Cost), 0.00)
    ) AS Estimated_Total_Bill
FROM
    ADMISSION A
JOIN
    PATIENT P ON A.PatientID = P.PatientID
JOIN
    ROOM R ON A.RoomNumber = R.RoomNumber
LEFT JOIN
    TREATMENT_PLAN TP ON A.AdmissionID = TP.AdmissionID
LEFT JOIN
    TREATMENT T ON TP.TreatmentID = T.TreatmentID
WHERE
    A.AdmissionID = 1002 -- Change this ID to calculate for a different patient if you're curious
GROUP BY
    A.AdmissionID, P.First_Name, P.Last_Name;

-- 4. Lists all rooms, their status, and the department they belong to
SELECT
    R.RoomNumber,
    R.Room_Type,
    R.Status,
    R.Room_Rate,
    D.DeptName
FROM
    ROOM R
JOIN
    DEPARTMENT D ON R.DeptID = D.DeptID
ORDER BY
    D.DeptName, R.RoomNumber;

-- 5. Lists the name and contact details of all patients whose attending doctor is Dr. Jonesy Smith (StaffID 5001) (I'm not the most creative with fake names)
SELECT
    P.First_Name || ' ' || P.Last_Name AS Patient_Name,
    P.Phone_Number,
    A.AdmissionID,
    A.RoomNumber
FROM
    PATIENT P
JOIN
    ADMISSION A ON P.PatientID = A.PatientID
JOIN
    STAFF_ASSIGNMENT SA ON A.AdmissionID = SA.AdmissionID
WHERE
    SA.StaffID = 5001 -- Filter by Dr. Jonesy Smith's StaffID
    AND SA.Assignment_Role = 'Attending Doctor'
    AND A.Discharge_Date IS NULL;