CREATE TABLE rr_patients (
    patient_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR2(10),
    city VARCHAR2(50),
    state VARCHAR2(30),
    insurance_provider VARCHAR2(100),
    chronic_condition VARCHAR2(100)
);


CREATE TABLE rr_admissions (
    admission_id NUMBER PRIMARY KEY,
    patient_id NUMBER NOT NULL,
    doctor_id NUMBER NOT NULL,
    admission_date DATE NOT NULL,
    discharge_date DATE,
    admission_type VARCHAR2(30),
    department VARCHAR2(100),
    discharge_disposition VARCHAR2(50),
    length_of_stay NUMBER,
    total_cost NUMBER(12,2),

    CONSTRAINT fk_rr_admission_patient
        FOREIGN KEY (patient_id)
        REFERENCES rr_patients(patient_id),

    CONSTRAINT fk_rr_admission_doctor
        FOREIGN KEY (doctor_id)
        REFERENCES rr_doctors(doctor_id)
);

CREATE TABLE rr_diagnoses (
    diagnosis_id NUMBER PRIMARY KEY,
    admission_id NUMBER NOT NULL,
    patient_id NUMBER NOT NULL,
    diagnosis_code VARCHAR2(20),
    diagnosis_name VARCHAR2(150) NOT NULL,
    diagnosis_type VARCHAR2(30),
    severity VARCHAR2(30),

    CONSTRAINT fk_rr_diag_admission
        FOREIGN KEY (admission_id)
        REFERENCES rr_admissions(admission_id),

    CONSTRAINT fk_rr_diag_patient
        FOREIGN KEY (patient_id)
        REFERENCES rr_patients(patient_id)
);

CREATE TABLE rr_lab_results (
    lab_result_id NUMBER PRIMARY KEY,
    admission_id NUMBER NOT NULL,
    patient_id NUMBER NOT NULL,
    test_name VARCHAR2(100) NOT NULL,
    result_value NUMBER(10,2),
    unit VARCHAR2(30),
    reference_low NUMBER(10,2),
    reference_high NUMBER(10,2),
    test_date DATE NOT NULL,

    CONSTRAINT fk_rr_lab_admission
        FOREIGN KEY (admission_id)
        REFERENCES rr_admissions(admission_id),

    CONSTRAINT fk_rr_lab_patient
        FOREIGN KEY (patient_id)
        REFERENCES rr_patients(patient_id)
);

CREATE TABLE rr_claims (
    claim_id NUMBER PRIMARY KEY,
    admission_id NUMBER NOT NULL,
    patient_id NUMBER NOT NULL,
    insurance_provider VARCHAR2(100),
    billed_amount NUMBER(12,2),
    allowed_amount NUMBER(12,2),
    paid_amount NUMBER(12,2),
    claim_status VARCHAR2(30),
    denial_reason VARCHAR2(200),

    CONSTRAINT fk_rr_claim_admission
        FOREIGN KEY (admission_id)
        REFERENCES rr_admissions(admission_id),

    CONSTRAINT fk_rr_claim_patient
        FOREIGN KEY (patient_id)
        REFERENCES rr_patients(patient_id)
);

SELECT table_name
FROM user_tables
WHERE table_name LIKE 'RR_%'
ORDER BY table_name;