# 🏥 Healthcare Readmission & Clinical Analytics

## Project Overview

This project is an end-to-end Healthcare Informatics and Data Analytics project designed to analyze hospital admissions, patient readmissions, clinical outcomes, healthcare costs, claims, diagnoses, medications, lab results, and provider performance.

The project combines:

- Oracle SQL
- Healthcare Data Modeling
- SQL Analytics
- 30-Day Readmission Analysis
- Power BI
- DAX
- Data Visualization
- Healthcare KPI Analysis

The main objective is to identify hospital readmission patterns and provide useful clinical, operational, and financial insights through an interactive Power BI dashboard.

---

## Business Problem

Hospital readmissions are an important healthcare quality and cost indicator.

The project analyzes questions such as:

- How many patients were admitted?
- How many patients were readmitted?
- What is the readmission rate?
- Which departments have the highest readmissions?
- What is the average length of stay?
- Which departments generate the highest healthcare costs?
- What diagnoses and chronic conditions are common?
- What medications are frequently used?
- What lab tests are frequently performed?
- What percentage of claims are paid or denied?
- What are the common reasons for claim denial?
- How does performance vary by doctor and department?

---

## Dataset

The project uses a simulated healthcare dataset containing multiple related tables.

### Main Tables

- `RR_PATIENTS`
- `RR_ADMISSIONS`
- `RR_DOCTORS`
- `RR_DIAGNOSES`
- `RR_LAB_RESULTS`
- `RR_MEDICATIONS`
- `RR_CLAIMS`

The dataset contains:

- 20 Patients
- 29 Hospital Admissions
- Patient demographics
- Admission and discharge information
- Doctors and departments
- Diagnoses
- Medications
- Laboratory results
- Insurance information
- Healthcare costs
- Claims and denial information

---

## Database Design

The relational database was created in Oracle SQL.

The tables are connected using fields such as:

- `PATIENT_ID`
- `ADMISSION_ID`
- `DOCTOR_ID`

These relationships allow patient, admission, clinical, provider, and financial information to be analyzed together.

---

## SQL Readmission Analysis

SQL was used to identify hospital readmissions by comparing each admission with the patient's previous discharge.

The Oracle SQL `LAG()` analytical function was used to retrieve the previous discharge date for each patient.

Example:

SELECT
    admission_id,
    patient_id,
    admission_date,
    discharge_date,
    LAG(discharge_date) OVER (
        PARTITION BY patient_id
        ORDER BY admission_date
    ) AS previous_discharge_date
FROM rr_admissions;

The number of days between the previous discharge and subsequent admission was then calculated.

A readmission was identified when the subsequent admission occurred within 30 days of the previous discharge.

---

## SQL Analysis Performed

The project includes SQL analysis for:

- Previous hospital admission identification
- Days to readmission
- 30-day readmission identification
- Readmission rate
- Patients with multiple admissions
- Readmitted patient details
- Diagnosis analysis
- Readmissions by diagnosis
- Readmissions by chronic condition
- Readmissions by age group
- Readmissions by length-of-stay group
- Readmissions by insurance provider

---

# Power BI Dashboard

The SQL healthcare dataset was connected to Power BI to create an interactive multi-page analytics dashboard.

The report contains seven analytical pages.

---

## Page 1 — Hospital Overview

Provides an overall view of hospital activity.

### KPIs

- Total Patients: 20
- Total Admissions: 29
- Total Readmissions: 9
- Readmission Rate: 31.03%
- Average Length of Stay: 4.03 Days
- Total Healthcare Cost: $224K
- Average Cost per Admission
- Average Cost per Patient

The page also provides department-level readmission analysis.

---

## Page 2 — Readmission Analysis

Focuses specifically on hospital readmissions.

### Visualizations

- Readmissions by Admission Type
- Readmissions by Discharge Disposition
- Monthly Readmission Trend
- Readmission Count
- Readmissions by Department

### Key Finding

Cardiology recorded the highest number of readmissions.

---

## Page 3 — Patient Demographics & Clinical Analysis

Provides demographic and patient population analysis.

### Visualizations

- Patients by Gender
- Patients by Insurance Provider
- Patients by Chronic Condition
- Patients by City

The dataset contains an equal gender distribution:

- Male: 10
- Female: 10

Medicare represents the largest insurance group in the patient dataset.

---

## Page 4 — Clinical Outcomes & Diagnosis Analysis

Analyzes diagnoses, severity, medications, and laboratory activity.

### Visualizations

- Diagnoses by Diagnosis Name
- Diagnoses by Severity
- Medications by Medication Name
- Lab Tests Performed

The analysis includes conditions such as:

- Essential Hypertension
- Heart Failure
- Type 2 Diabetes Mellitus
- COPD Exacerbation
- Chronic Kidney Disease
- Asthma Exacerbation

Clinical severity is analyzed using:

- Severe
- Moderate
- Mild

---

## Page 5 — Healthcare Claims & Financial Analysis

Analyzes insurance claims and healthcare financial performance.

### Financial KPIs

- Total Billed Amount: $224K
- Total Allowed Amount: $187.40K
- Total Paid Amount: $120.10K

### Visualizations

- Claims by Status
- Claims by Insurance Provider
- Denied Claims by Reason
- Billed vs Allowed vs Paid Amount by Insurance Provider

### Claims Results

Total Claims: 29

- Paid Claims: 22 (75.86%)
- Denied Claims: 7 (24.14%)

### Denial Reasons

- Medical Necessity
- Missing Information
- Prior Authorization Required
- Eligibility Issue

---

## Page 6 — Doctor & Department Performance Analysis

Evaluates hospital activity and cost across providers and departments.

### Visualizations

- Admissions by Doctor
- Admissions by Department
- Average Length of Stay by Department
- Healthcare Cost by Department

### Admissions by Doctor

- David Miller: 8
- James Anderson: 7
- Jennifer Taylor: 6
- Daniel Jackson: 4
- Lisa Thomas: 4

### Department Healthcare Costs

- Cardiology: $89K
- Pulmonology: $53K
- Nephrology: $42K
- Endocrinology: $28K
- General Medicine: $12K

Cardiology had the highest admission volume and healthcare cost.

---

## Page 7 — Healthcare Analytics Executive Summary

The Executive Summary provides management with the most important healthcare KPIs and trends on one page.

### Executive KPIs

| KPI | Result |
|-----|------:|
| Total Patients | 20 |
| Total Admissions | 29 |
| Total Readmissions | 9 |
| Readmission Rate | 31.03% |
| Average Length of Stay | 4.03 Days |
| Total Healthcare Cost | $224K |

### Executive Visualizations

- Readmissions by Department
- Healthcare Cost by Department
- Monthly Readmission Trend
- Claims by Status

This page allows healthcare leadership to quickly review clinical, operational, and financial performance.

---

# Key Business Insights

## 1. Readmission Rate

There were 9 readmissions among 29 hospital admissions.

Readmission Rate = 31.03%

---

## 2. Department Readmissions

Cardiology had the highest readmission count.

- Cardiology: 4
- Nephrology: 2
- Pulmonology: 2
- Endocrinology: 1
- General Medicine: 0

This suggests Cardiology may be an important area for further readmission investigation.

---

## 3. Length of Stay

Average Length of Stay:

4.03 Days

Department results included:

- Nephrology: 5.5 Days
- Cardiology: 5.1 Days
- Pulmonology: 3.9 Days
- Endocrinology: 3.2 Days
- General Medicine: 2.0 Days

---

## 4. Healthcare Cost

Total healthcare cost:

$224K

Cardiology generated the highest department-level healthcare cost at approximately $89K.

---

## 5. Claims Performance

29 claims were analyzed.

- 22 Paid
- 7 Denied

Approximately 24.14% of claims were denied.

Understanding denial reasons can help improve revenue-cycle processes.

---

## 6. Insurance Analysis

Medicare represented the largest insurance group and also accounted for the largest number of claims in the dataset.

---

# DAX Measures

Examples of Power BI measures used in the project:

Total Patients =
DISTINCTCOUNT(RR_PATIENTS[PATIENT_ID])

Total Admissions =
DISTINCTCOUNT(RR_ADMISSIONS[ADMISSION_ID])

Readmission Rate =
DIVIDE(
    [Readmission Count],
    [Total Admissions],
    0
)

Average Length of Stay =
AVERAGE(RR_ADMISSIONS[LENGTH_OF_STAY])

Total Healthcare Cost =
SUM(RR_ADMISSIONS[TOTAL_COST])

Total Billed Amount =
SUM(RR_CLAIMS[BILLED_AMOUNT])

Total Allowed Amount =
SUM(RR_CLAIMS[ALLOWED_AMOUNT])

Total Paid Amount =
SUM(RR_CLAIMS[PAID_AMOUNT])

---

# Tools & Technologies

| Technology | Purpose |
|------------|---------|
| Oracle SQL | Database creation and healthcare analysis |
| SQL | Data extraction, joins and readmission analysis |
| Power BI | Dashboard development |
| DAX | KPI and analytical calculations |
| Power Query | Data preparation |
| GitHub | Project documentation and version control |

---

# Project Workflow

Healthcare Data
      ↓
Oracle Database
      ↓
SQL Data Modeling
      ↓
SQL Readmission Analysis
      ↓
Power BI Data Model
      ↓
DAX Measures
      ↓
Interactive Dashboards
      ↓
Healthcare Business Insights

---

# Skills Demonstrated

This project demonstrates practical experience with:

- Healthcare Informatics
- Healthcare Data Analytics
- Hospital Readmission Analysis
- Clinical Data Analysis
- Claims Analytics
- Healthcare Financial Analytics
- SQL
- Oracle Database
- SQL Window Functions
- Relational Data Modeling
- Power BI
- DAX
- Dashboard Development
- Data Visualization
- KPI Development
- Business Intelligence

---

# Disclaimer

This project uses simulated healthcare data for educational and portfolio purposes.

It does not contain real patient information or Protected Health Information (PHI).

---

# Author

**Madhu Makara Jyothi Paate**

Healthcare Informatics | Data Analytics | SQL | Power BI