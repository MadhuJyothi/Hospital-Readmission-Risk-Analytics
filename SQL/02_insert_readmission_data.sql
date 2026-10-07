INSERT ALL
INTO rr_patients VALUES (1001, 'John', 'Carter', DATE '1958-04-12', 'Male', 'Charlotte', 'NC', 'Medicare', 'Hypertension')
INTO rr_patients VALUES (1002, 'Mary', 'Wilson', DATE '1962-08-23', 'Female', 'Charlotte', 'NC', 'Medicare', 'Type 2 Diabetes')
INTO rr_patients VALUES (1003, 'Robert', 'Davis', DATE '1970-01-15', 'Male', 'Concord', 'NC', 'Blue Cross NC', 'Heart Failure')
INTO rr_patients VALUES (1004, 'Linda', 'Brown', DATE '1955-11-30', 'Female', 'Gastonia', 'NC', 'Medicare', 'COPD')
INTO rr_patients VALUES (1005, 'Michael', 'Taylor', DATE '1980-06-17', 'Male', 'Charlotte', 'NC', 'Aetna', 'Type 2 Diabetes')
INTO rr_patients VALUES (1006, 'Susan', 'Anderson', DATE '1967-03-09', 'Female', 'Matthews', 'NC', 'UnitedHealthcare', 'Hypertension')
INTO rr_patients VALUES (1007, 'James', 'Thomas', DATE '1949-12-04', 'Male', 'Pineville', 'NC', 'Medicare', 'Heart Failure')
INTO rr_patients VALUES (1008, 'Patricia', 'Jackson', DATE '1975-07-21', 'Female', 'Charlotte', 'NC', 'Cigna', 'Asthma')
INTO rr_patients VALUES (1009, 'William', 'White', DATE '1960-10-13', 'Male', 'Concord', 'NC', 'Medicare', 'Chronic Kidney Disease')
INTO rr_patients VALUES (1010, 'Jennifer', 'Harris', DATE '1985-02-28', 'Female', 'Huntersville', 'NC', 'Aetna', 'Hypertension')
INTO rr_patients VALUES (1011, 'Richard', 'Martin', DATE '1952-09-19', 'Male', 'Charlotte', 'NC', 'Medicare', 'COPD')
INTO rr_patients VALUES (1012, 'Barbara', 'Thompson', DATE '1965-05-25', 'Female', 'Gastonia', 'NC', 'UnitedHealthcare', 'Type 2 Diabetes')
INTO rr_patients VALUES (1013, 'Joseph', 'Garcia', DATE '1972-12-11', 'Male', 'Matthews', 'NC', 'Blue Cross NC', 'Hypertension')
INTO rr_patients VALUES (1014, 'Elizabeth', 'Martinez', DATE '1957-01-08', 'Female', 'Pineville', 'NC', 'Medicare', 'Heart Failure')
INTO rr_patients VALUES (1015, 'Thomas', 'Robinson', DATE '1969-04-16', 'Male', 'Charlotte', 'NC', 'Cigna', 'Type 2 Diabetes')
INTO rr_patients VALUES (1016, 'Karen', 'Clark', DATE '1978-08-05', 'Female', 'Concord', 'NC', 'UnitedHealthcare', 'Asthma')
INTO rr_patients VALUES (1017, 'Charles', 'Lewis', DATE '1954-06-27', 'Male', 'Gastonia', 'NC', 'Medicare', 'Chronic Kidney Disease')
INTO rr_patients VALUES (1018, 'Nancy', 'Walker', DATE '1963-03-14', 'Female', 'Charlotte', 'NC', 'Blue Cross NC', 'Hypertension')
INTO rr_patients VALUES (1019, 'Daniel', 'Hall', DATE '1974-11-02', 'Male', 'Huntersville', 'NC', 'Aetna', 'Type 2 Diabetes')
INTO rr_patients VALUES (1020, 'Lisa', 'Allen', DATE '1959-07-18', 'Female', 'Pineville', 'NC', 'Medicare', 'COPD')
SELECT 1 FROM dual;

COMMIT;

SELECT COUNT(*) AS total_patients
FROM rr_patients;

INSERT ALL
INTO rr_doctors VALUES (201, 'David', 'Miller', 'Cardiologist', 'Cardiology')
INTO rr_doctors VALUES (202, 'Jennifer', 'Taylor', 'Endocrinologist', 'Endocrinology')
INTO rr_doctors VALUES (203, 'James', 'Anderson', 'Pulmonologist', 'Pulmonology')
INTO rr_doctors VALUES (204, 'Lisa', 'Thomas', 'Nephrologist', 'Nephrology')
INTO rr_doctors VALUES (205, 'Daniel', 'Jackson', 'Internal Medicine', 'General Medicine')
INTO rr_doctors VALUES (206, 'Sarah', 'White', 'Emergency Physician', 'Emergency')
SELECT 1 FROM dual;

COMMIT;

SELECT COUNT(*) AS total_doctors
FROM rr_doctors;

INSERT ALL
INTO rr_admissions VALUES (3001,1001,201,DATE '2026-01-05',DATE '2026-01-09','Emergency','Cardiology','Home',4,8500)
INTO rr_admissions VALUES (3002,1001,201,DATE '2026-01-20',DATE '2026-01-23','Emergency','Cardiology','Home',3,6200)

INTO rr_admissions VALUES (3003,1002,202,DATE '2026-01-08',DATE '2026-01-12','Emergency','Endocrinology','Home',4,5400)
INTO rr_admissions VALUES (3004,1002,202,DATE '2026-03-10',DATE '2026-03-13','Elective','Endocrinology','Home',3,4100)

INTO rr_admissions VALUES (3005,1003,201,DATE '2026-01-15',DATE '2026-01-21','Emergency','Cardiology','Home',6,12500)
INTO rr_admissions VALUES (3006,1003,201,DATE '2026-02-05',DATE '2026-02-10','Emergency','Cardiology','Home',5,11000)

INTO rr_admissions VALUES (3007,1004,203,DATE '2026-02-01',DATE '2026-02-06','Emergency','Pulmonology','Home',5,9200)
INTO rr_admissions VALUES (3008,1004,203,DATE '2026-02-22',DATE '2026-02-26','Emergency','Pulmonology','Home',4,8800)

INTO rr_admissions VALUES (3009,1005,202,DATE '2026-02-10',DATE '2026-02-13','Elective','Endocrinology','Home',3,4500)

INTO rr_admissions VALUES (3010,1006,205,DATE '2026-02-15',DATE '2026-02-17','Emergency','General Medicine','Home',2,3200)

INTO rr_admissions VALUES (3011,1007,201,DATE '2026-03-01',DATE '2026-03-08','Emergency','Cardiology','Home',7,14800)
INTO rr_admissions VALUES (3012,1007,201,DATE '2026-03-25',DATE '2026-03-30','Emergency','Cardiology','Home',5,11900)

INTO rr_admissions VALUES (3013,1008,203,DATE '2026-03-05',DATE '2026-03-07','Emergency','Pulmonology','Home',2,3900)

INTO rr_admissions VALUES (3014,1009,204,DATE '2026-03-12',DATE '2026-03-18','Emergency','Nephrology','Home',6,10500)
INTO rr_admissions VALUES (3015,1009,204,DATE '2026-04-02',DATE '2026-04-07','Emergency','Nephrology','Home',5,9800)

INTO rr_admissions VALUES (3016,1010,205,DATE '2026-03-20',DATE '2026-03-22','Elective','General Medicine','Home',2,2800)

INTO rr_admissions VALUES (3017,1011,203,DATE '2026-04-01',DATE '2026-04-06','Emergency','Pulmonology','Home',5,8900)

INTO rr_admissions VALUES (3018,1012,202,DATE '2026-04-08',DATE '2026-04-11','Elective','Endocrinology','Home',3,4600)

INTO rr_admissions VALUES (3019,1013,205,DATE '2026-04-15',DATE '2026-04-17','Emergency','General Medicine','Home',2,3400)

INTO rr_admissions VALUES (3020,1014,201,DATE '2026-04-20',DATE '2026-04-26','Emergency','Cardiology','Home',6,13200)
INTO rr_admissions VALUES (3021,1014,201,DATE '2026-05-10',DATE '2026-05-15','Emergency','Cardiology','Home',5,10800)

INTO rr_admissions VALUES (3022,1015,202,DATE '2026-05-02',DATE '2026-05-05','Elective','Endocrinology','Home',3,4700)

INTO rr_admissions VALUES (3023,1016,203,DATE '2026-05-08',DATE '2026-05-10','Emergency','Pulmonology','Home',2,4100)

INTO rr_admissions VALUES (3024,1017,204,DATE '2026-05-15',DATE '2026-05-21','Emergency','Nephrology','Home',6,11200)
INTO rr_admissions VALUES (3025,1017,204,DATE '2026-06-08',DATE '2026-06-13','Emergency','Nephrology','Home',5,10100)

INTO rr_admissions VALUES (3026,1018,205,DATE '2026-06-01',DATE '2026-06-03','Elective','General Medicine','Home',2,3000)

INTO rr_admissions VALUES (3027,1019,202,DATE '2026-06-10',DATE '2026-06-13','Emergency','Endocrinology','Home',3,5100)

INTO rr_admissions VALUES (3028,1020,203,DATE '2026-06-15',DATE '2026-06-20','Emergency','Pulmonology','Home',5,9300)
INTO rr_admissions VALUES (3029,1020,203,DATE '2026-07-05',DATE '2026-07-09','Emergency','Pulmonology','Home',4,8500)

SELECT 1 FROM dual;

COMMIT;

SELECT COUNT(*) AS total_admissions
FROM rr_admissions;



SELECT COUNT(*) AS total_lab_results
FROM rr_lab_results;

INSERT ALL
INTO rr_lab_results VALUES (5001,3001,1001,'Systolic Blood Pressure',168,'mmHg',90,120,DATE '2026-01-05')
INTO rr_lab_results VALUES (5002,3002,1001,'Systolic Blood Pressure',175,'mmHg',90,120,DATE '2026-01-20')

INTO rr_lab_results VALUES (5003,3003,1002,'Blood Glucose',220,'mg/dL',70,140,DATE '2026-01-08')
INTO rr_lab_results VALUES (5004,3004,1002,'Blood Glucose',135,'mg/dL',70,140,DATE '2026-03-10')

INTO rr_lab_results VALUES (5005,3005,1003,'BNP',780,'pg/mL',0,100,DATE '2026-01-15')
INTO rr_lab_results VALUES (5006,3006,1003,'BNP',920,'pg/mL',0,100,DATE '2026-02-05')

INTO rr_lab_results VALUES (5007,3007,1004,'Oxygen Saturation',86,'%',95,100,DATE '2026-02-01')
INTO rr_lab_results VALUES (5008,3008,1004,'Oxygen Saturation',89,'%',95,100,DATE '2026-02-22')

INTO rr_lab_results VALUES (5009,3009,1005,'Blood Glucose',198,'mg/dL',70,140,DATE '2026-02-10')
INTO rr_lab_results VALUES (5010,3010,1006,'Systolic Blood Pressure',118,'mmHg',90,120,DATE '2026-02-15')

INTO rr_lab_results VALUES (5011,3011,1007,'BNP',1050,'pg/mL',0,100,DATE '2026-03-01')
INTO rr_lab_results VALUES (5012,3012,1007,'BNP',1100,'pg/mL',0,100,DATE '2026-03-25')

INTO rr_lab_results VALUES (5013,3013,1008,'Oxygen Saturation',97,'%',95,100,DATE '2026-03-05')

INTO rr_lab_results VALUES (5014,3014,1009,'Creatinine',2.8,'mg/dL',0.6,1.3,DATE '2026-03-12')
INTO rr_lab_results VALUES (5015,3015,1009,'Creatinine',3.2,'mg/dL',0.6,1.3,DATE '2026-04-02')

INTO rr_lab_results VALUES (5016,3016,1010,'Systolic Blood Pressure',116,'mmHg',90,120,DATE '2026-03-20')
INTO rr_lab_results VALUES (5017,3017,1011,'Oxygen Saturation',88,'%',95,100,DATE '2026-04-01')
INTO rr_lab_results VALUES (5018,3018,1012,'Blood Glucose',205,'mg/dL',70,140,DATE '2026-04-08')
INTO rr_lab_results VALUES (5019,3019,1013,'Systolic Blood Pressure',162,'mmHg',90,120,DATE '2026-04-15')

INTO rr_lab_results VALUES (5020,3020,1014,'BNP',850,'pg/mL',0,100,DATE '2026-04-20')
INTO rr_lab_results VALUES (5021,3021,1014,'BNP',970,'pg/mL',0,100,DATE '2026-05-10')

INTO rr_lab_results VALUES (5022,3022,1015,'Blood Glucose',190,'mg/dL',70,140,DATE '2026-05-02')
INTO rr_lab_results VALUES (5023,3023,1016,'Oxygen Saturation',96,'%',95,100,DATE '2026-05-08')

INTO rr_lab_results VALUES (5024,3024,1017,'Creatinine',3.0,'mg/dL',0.6,1.3,DATE '2026-05-15')
INTO rr_lab_results VALUES (5025,3025,1017,'Creatinine',3.5,'mg/dL',0.6,1.3,DATE '2026-06-08')

INTO rr_lab_results VALUES (5026,3026,1018,'Systolic Blood Pressure',119,'mmHg',90,120,DATE '2026-06-01')
INTO rr_lab_results VALUES (5027,3027,1019,'Blood Glucose',215,'mg/dL',70,140,DATE '2026-06-10')

INTO rr_lab_results VALUES (5028,3028,1020,'Oxygen Saturation',87,'%',95,100,DATE '2026-06-15')
INTO rr_lab_results VALUES (5029,3029,1020,'Oxygen Saturation',90,'%',95,100,DATE '2026-07-05')

SELECT 1 FROM dual;

COMMIT;

SELECT COUNT(*) AS total_lab_results
FROM rr_lab_results;

INSERT ALL
INTO rr_medications VALUES (6001,3001,1001,'Lisinopril','20 mg','Once Daily',DATE '2026-01-05',NULL)
INTO rr_medications VALUES (6002,3002,1001,'Amlodipine','10 mg','Once Daily',DATE '2026-01-20',NULL)

INTO rr_medications VALUES (6003,3003,1002,'Metformin','500 mg','Twice Daily',DATE '2026-01-08',NULL)
INTO rr_medications VALUES (6004,3004,1002,'Metformin','1000 mg','Twice Daily',DATE '2026-03-10',NULL)

INTO rr_medications VALUES (6005,3005,1003,'Furosemide','40 mg','Once Daily',DATE '2026-01-15',NULL)
INTO rr_medications VALUES (6006,3006,1003,'Furosemide','40 mg','Twice Daily',DATE '2026-02-05',NULL)

INTO rr_medications VALUES (6007,3007,1004,'Albuterol','2.5 mg','Every 6 Hours',DATE '2026-02-01',NULL)
INTO rr_medications VALUES (6008,3008,1004,'Prednisone','40 mg','Once Daily',DATE '2026-02-22',DATE '2026-02-27')

INTO rr_medications VALUES (6009,3009,1005,'Metformin','500 mg','Twice Daily',DATE '2026-02-10',NULL)
INTO rr_medications VALUES (6010,3010,1006,'Lisinopril','10 mg','Once Daily',DATE '2026-02-15',NULL)

INTO rr_medications VALUES (6011,3011,1007,'Furosemide','40 mg','Twice Daily',DATE '2026-03-01',NULL)
INTO rr_medications VALUES (6012,3012,1007,'Carvedilol','12.5 mg','Twice Daily',DATE '2026-03-25',NULL)

INTO rr_medications VALUES (6013,3013,1008,'Albuterol','2.5 mg','As Needed',DATE '2026-03-05',NULL)

INTO rr_medications VALUES (6014,3014,1009,'Losartan','50 mg','Once Daily',DATE '2026-03-12',NULL)
INTO rr_medications VALUES (6015,3015,1009,'Furosemide','20 mg','Once Daily',DATE '2026-04-02',NULL)

INTO rr_medications VALUES (6016,3016,1010,'Amlodipine','5 mg','Once Daily',DATE '2026-03-20',NULL)
INTO rr_medications VALUES (6017,3017,1011,'Albuterol','2.5 mg','Every 6 Hours',DATE '2026-04-01',NULL)
INTO rr_medications VALUES (6018,3018,1012,'Metformin','1000 mg','Twice Daily',DATE '2026-04-08',NULL)
INTO rr_medications VALUES (6019,3019,1013,'Lisinopril','20 mg','Once Daily',DATE '2026-04-15',NULL)

INTO rr_medications VALUES (6020,3020,1014,'Furosemide','40 mg','Once Daily',DATE '2026-04-20',NULL)
INTO rr_medications VALUES (6021,3021,1014,'Carvedilol','12.5 mg','Twice Daily',DATE '2026-05-10',NULL)

INTO rr_medications VALUES (6022,3022,1015,'Metformin','500 mg','Twice Daily',DATE '2026-05-02',NULL)
INTO rr_medications VALUES (6023,3023,1016,'Albuterol','2.5 mg','As Needed',DATE '2026-05-08',NULL)

INTO rr_medications VALUES (6024,3024,1017,'Losartan','50 mg','Once Daily',DATE '2026-05-15',NULL)
INTO rr_medications VALUES (6025,3025,1017,'Furosemide','20 mg','Once Daily',DATE '2026-06-08',NULL)

INTO rr_medications VALUES (6026,3026,1018,'Lisinopril','10 mg','Once Daily',DATE '2026-06-01',NULL)
INTO rr_medications VALUES (6027,3027,1019,'Metformin','1000 mg','Twice Daily',DATE '2026-06-10',NULL)

INTO rr_medications VALUES (6028,3028,1020,'Albuterol','2.5 mg','Every 6 Hours',DATE '2026-06-15',NULL)
INTO rr_medications VALUES (6029,3029,1020,'Prednisone','40 mg','Once Daily',DATE '2026-07-05',DATE '2026-07-10')

SELECT 1 FROM dual;

COMMIT;

SELECT COUNT(*) AS total_medications
FROM rr_medications;

INSERT ALL
INTO rr_claims VALUES (7001,3001,1001,'Medicare',8500,7200,6800,'Paid',NULL)
INTO rr_claims VALUES (7002,3002,1001,'Medicare',6200,5200,4800,'Paid',NULL)

INTO rr_claims VALUES (7003,3003,1002,'Medicare',5400,4500,4200,'Paid',NULL)
INTO rr_claims VALUES (7004,3004,1002,'Medicare',4100,3400,3200,'Paid',NULL)

INTO rr_claims VALUES (7005,3005,1003,'Blue Cross NC',12500,10500,9800,'Paid',NULL)
INTO rr_claims VALUES (7006,3006,1003,'Blue Cross NC',11000,9000,0,'Denied','Prior authorization required')

INTO rr_claims VALUES (7007,3007,1004,'Medicare',9200,7800,7300,'Paid',NULL)
INTO rr_claims VALUES (7008,3008,1004,'Medicare',8800,7400,0,'Denied','Medical necessity')

INTO rr_claims VALUES (7009,3009,1005,'Aetna',4500,3700,3500,'Paid',NULL)
INTO rr_claims VALUES (7010,3010,1006,'UnitedHealthcare',3200,2700,2500,'Paid',NULL)

INTO rr_claims VALUES (7011,3011,1007,'Medicare',14800,12500,11800,'Paid',NULL)
INTO rr_claims VALUES (7012,3012,1007,'Medicare',11900,10000,0,'Denied','Missing information')

INTO rr_claims VALUES (7013,3013,1008,'Cigna',3900,3200,3000,'Paid',NULL)

INTO rr_claims VALUES (7014,3014,1009,'Medicare',10500,8800,8200,'Paid',NULL)
INTO rr_claims VALUES (7015,3015,1009,'Medicare',9800,8200,0,'Denied','Prior authorization required')

INTO rr_claims VALUES (7016,3016,1010,'Aetna',2800,2300,2200,'Paid',NULL)
INTO rr_claims VALUES (7017,3017,1011,'Medicare',8900,7500,7100,'Paid',NULL)
INTO rr_claims VALUES (7018,3018,1012,'UnitedHealthcare',4600,3800,3500,'Paid',NULL)
INTO rr_claims VALUES (7019,3019,1013,'Blue Cross NC',3400,2800,2600,'Paid',NULL)

INTO rr_claims VALUES (7020,3020,1014,'Medicare',13200,11100,10400,'Paid',NULL)
INTO rr_claims VALUES (7021,3021,1014,'Medicare',10800,9000,0,'Denied','Medical necessity')

INTO rr_claims VALUES (7022,3022,1015,'Cigna',4700,3900,3600,'Paid',NULL)
INTO rr_claims VALUES (7023,3023,1016,'UnitedHealthcare',4100,3400,3200,'Paid',NULL)

INTO rr_claims VALUES (7024,3024,1017,'Medicare',11200,9400,8800,'Paid',NULL)
INTO rr_claims VALUES (7025,3025,1017,'Medicare',10100,8500,0,'Denied','Eligibility issue')

INTO rr_claims VALUES (7026,3026,1018,'Blue Cross NC',3000,2500,2400,'Paid',NULL)
INTO rr_claims VALUES (7027,3027,1019,'Aetna',5100,4200,3900,'Paid',NULL)

INTO rr_claims VALUES (7028,3028,1020,'Medicare',9300,7800,7300,'Paid',NULL)
INTO rr_claims VALUES (7029,3029,1020,'Medicare',8500,7100,0,'Denied','Missing information')

SELECT 1 FROM dual;

COMMIT;

SELECT COUNT(*) AS total_claims
FROM rr_claims;