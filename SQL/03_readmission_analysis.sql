SELECT
    admission_id,
    patient_id,
    admission_date,
    discharge_date,
    LAG(discharge_date) OVER (
        PARTITION BY patient_id
        ORDER BY admission_date
    ) AS previous_discharge_date
FROM rr_admissions
ORDER BY patient_id, admission_date;

WITH admission_history AS (
    SELECT
        admission_id,
        patient_id,
        admission_date,
        discharge_date,
        LAG(discharge_date) OVER (
            PARTITION BY patient_id
            ORDER BY admission_date
        ) AS previous_discharge_date
    FROM rr_admissions
)
SELECT
    admission_id,
    patient_id,
    admission_date,
    previous_discharge_date,
    admission_date - previous_discharge_date AS days_to_readmission
FROM admission_history
ORDER BY patient_id, admission_date;



WITH admission_history AS (
    SELECT
        admission_id,
        patient_id,
        admission_date,
        discharge_date,
        LAG(discharge_date) OVER (
            PARTITION BY patient_id
            ORDER BY admission_date
        ) AS previous_discharge_date
    FROM rr_admissions
)
SELECT
    admission_id,
    patient_id,
    admission_date,
    previous_discharge_date,
    admission_date - previous_discharge_date AS days_to_readmission,
    CASE
        WHEN admission_date - previous_discharge_date BETWEEN 0 AND 30
        THEN 'YES'
        ELSE 'NO'
    END AS readmitted_within_30_days
FROM admission_history
ORDER BY patient_id, admission_date;


WITH admission_history AS (
    SELECT
        patient_id,
        admission_date,
        LAG(discharge_date) OVER (
            PARTITION BY patient_id
            ORDER BY admission_date
        ) AS previous_discharge_date
    FROM rr_admissions
),
readmission_flags AS (
    SELECT
        patient_id,
        CASE
            WHEN admission_date - previous_discharge_date BETWEEN 0 AND 30
            THEN 1
            ELSE 0
        END AS readmitted_30_days
    FROM admission_history
)
SELECT
    SUM(readmitted_30_days) AS total_30_day_readmissions,
    COUNT(*) AS total_admissions,
    ROUND(
        SUM(readmitted_30_days) * 100.0 / COUNT(*),
        2
    ) AS readmission_rate_percent
FROM readmission_flags;

WITH admission_history AS (
    SELECT
        admission_id,
        patient_id,
        admission_date,
        discharge_date,
        LAG(discharge_date) OVER (
            PARTITION BY patient_id
            ORDER BY admission_date
        ) AS previous_discharge_date
    FROM rr_admissions
)
SELECT
    patient_id,
    admission_id,
    admission_date,
    previous_discharge_date,
    admission_date - previous_discharge_date AS days_to_readmission
FROM admission_history
WHERE admission_date - previous_discharge_date BETWEEN 0 AND 30
ORDER BY days_to_readmission;

SELECT
    p.patient_id,
    p.first_name,
    p.last_name,
    COUNT(a.admission_id) AS total_admissions
FROM rr_patients p
JOIN rr_admissions a
    ON p.patient_id = a.patient_id
GROUP BY
    p.patient_id,
    p.first_name,
    p.last_name
HAVING COUNT(a.admission_id) > 1
ORDER BY total_admissions DESC;


WITH admission_history AS (
    SELECT
        a.admission_id,
        a.patient_id,
        a.admission_date,
        a.discharge_date,
        a.length_of_stay,
        LAG(a.discharge_date) OVER (
            PARTITION BY a.patient_id
            ORDER BY a.admission_date
        ) AS previous_discharge_date
    FROM rr_admissions a
)
SELECT
    p.patient_id,
    p.first_name,
    p.last_name,
    TRUNC(
        MONTHS_BETWEEN(ah.admission_date, p.date_of_birth) / 12
    ) AS age_at_admission,
    p.chronic_condition,
    ah.admission_id,
    ah.length_of_stay,
    ah.admission_date - ah.previous_discharge_date
        AS days_to_readmission
FROM admission_history ah
JOIN rr_patients p
    ON ah.patient_id = p.patient_id
WHERE ah.admission_date - ah.previous_discharge_date
      BETWEEN 0 AND 30
ORDER BY days_to_readmission;

SELECT column_name
FROM user_tab_columns
WHERE table_name = 'RR_DIAGNOSES'
ORDER BY column_id;


WITH admission_history AS (
    SELECT
        a.admission_id,
        a.patient_id,
        a.admission_date,
        a.discharge_date,
        LAG(a.discharge_date) OVER (
            PARTITION BY a.patient_id
            ORDER BY a.admission_date
        ) AS previous_discharge_date
    FROM rr_admissions a
)
SELECT
    ah.patient_id,
    p.first_name,
    p.last_name,
    ah.admission_id,
    d.diagnosis_code,
    d.diagnosis_name,
    d.diagnosis_type,
    d.severity,
    ah.admission_date - ah.previous_discharge_date
        AS days_to_readmission
FROM admission_history ah
JOIN rr_patients p
    ON ah.patient_id = p.patient_id
JOIN rr_diagnoses d
    ON ah.admission_id = d.admission_id
WHERE ah.admission_date - ah.previous_discharge_date
      BETWEEN 0 AND 30
ORDER BY days_to_readmission;

WITH admission_history AS (
    SELECT
        a.admission_id,
        a.patient_id,
        a.admission_date,
        LAG(a.discharge_date) OVER (
            PARTITION BY a.patient_id
            ORDER BY a.admission_date
        ) AS previous_discharge_date
    FROM rr_admissions a
)
SELECT
    d.diagnosis_name,
    COUNT(*) AS readmission_count
FROM admission_history ah
JOIN rr_diagnoses d
    ON ah.admission_id = d.admission_id
WHERE ah.admission_date - ah.previous_discharge_date
      BETWEEN 0 AND 30
GROUP BY d.diagnosis_name
ORDER BY readmission_count DESC;


WITH admission_history AS (
    SELECT
        a.admission_id,
        a.patient_id,
        a.admission_date,
        LAG(a.discharge_date) OVER (
            PARTITION BY a.patient_id
            ORDER BY a.admission_date
        ) AS previous_discharge_date
    FROM rr_admissions a
)
SELECT
    p.chronic_condition,
    COUNT(*) AS readmission_count
FROM admission_history ah
JOIN rr_patients p
    ON ah.patient_id = p.patient_id
WHERE ah.admission_date - ah.previous_discharge_date
      BETWEEN 0 AND 30
GROUP BY p.chronic_condition
ORDER BY readmission_count DESC;

WITH admission_history AS (
    SELECT
        a.admission_id,
        a.patient_id,
        a.admission_date,
        LAG(a.discharge_date) OVER (
            PARTITION BY a.patient_id
            ORDER BY a.admission_date
        ) AS previous_discharge_date
    FROM rr_admissions a
)
SELECT
    p.chronic_condition,
    COUNT(*) AS readmission_count
FROM admission_history ah
JOIN rr_patients p
    ON ah.patient_id = p.patient_id
WHERE ah.admission_date - ah.previous_discharge_date
      BETWEEN 0 AND 30
GROUP BY p.chronic_condition
ORDER BY readmission_count DESC;


WITH admission_history AS (
    SELECT
        a.admission_id,
        a.patient_id,
        a.admission_date,
        LAG(a.discharge_date) OVER (
            PARTITION BY a.patient_id
            ORDER BY a.admission_date
        ) AS previous_discharge_date
    FROM rr_admissions a
),
readmission_data AS (
    SELECT
        ah.patient_id,
        ah.admission_date,
        TRUNC(
            MONTHS_BETWEEN(ah.admission_date, p.date_of_birth) / 12
        ) AS age_at_admission
    FROM admission_history ah
    JOIN rr_patients p
        ON ah.patient_id = p.patient_id
    WHERE ah.admission_date - ah.previous_discharge_date
          BETWEEN 0 AND 30
)
SELECT
    CASE
        WHEN age_at_admission < 50 THEN 'Under 50'
        WHEN age_at_admission BETWEEN 50 AND 64 THEN '50-64'
        WHEN age_at_admission BETWEEN 65 AND 74 THEN '65-74'
        ELSE '75+'
    END AS age_group,
    COUNT(*) AS readmission_count
FROM readmission_data
GROUP BY
    CASE
        WHEN age_at_admission < 50 THEN 'Under 50'
        WHEN age_at_admission BETWEEN 50 AND 64 THEN '50-64'
        WHEN age_at_admission BETWEEN 65 AND 74 THEN '65-74'
        ELSE '75+'
    END
ORDER BY readmission_count DESC;

WITH admission_history AS (
    SELECT
        a.admission_id,
        a.patient_id,
        a.admission_date,
        a.length_of_stay,
        LAG(a.discharge_date) OVER (
            PARTITION BY a.patient_id
            ORDER BY a.admission_date
        ) AS previous_discharge_date
    FROM rr_admissions a
)
SELECT
    CASE
        WHEN length_of_stay <= 3 THEN '1-3 Days'
        WHEN length_of_stay <= 5 THEN '4-5 Days'
        ELSE '6+ Days'
    END AS length_of_stay_group,
    COUNT(*) AS readmission_count
FROM admission_history
WHERE admission_date - previous_discharge_date
      BETWEEN 0 AND 30
GROUP BY
    CASE
        WHEN length_of_stay <= 3 THEN '1-3 Days'
        WHEN length_of_stay <= 5 THEN '4-5 Days'
        ELSE '6+ Days'
    END
ORDER BY readmission_count DESC;


WITH admission_history AS (
    SELECT
        a.admission_id,
        a.patient_id,
        a.admission_date,
        LAG(a.discharge_date) OVER (
            PARTITION BY a.patient_id
            ORDER BY a.admission_date
        ) AS previous_discharge_date
    FROM rr_admissions a
)
SELECT
    p.insurance_provider,
    COUNT(*) AS readmission_count
FROM admission_history ah
JOIN rr_patients p
    ON ah.patient_id = p.patient_id
WHERE ah.admission_date - ah.previous_discharge_date
      BETWEEN 0 AND 30
GROUP BY p.insurance_provider
ORDER BY readmission_count DESC;


WITH admission_history AS (
    SELECT
        a.*,
        LAG(a.discharge_date) OVER (
            PARTITION BY a.patient_id
            ORDER BY a.admission_date
        ) AS previous_discharge_date
    FROM rr_admissions a
)
SELECT
    ah.admission_id,
    ah.patient_id,
    p.first_name,
    p.last_name,
    p.gender,
    p.city,
    p.state,
    p.insurance_provider,
    p.chronic_condition,
    ah.admission_date,
    ah.discharge_date,
    ah.admission_type,
    ah.department,
    ah.discharge_disposition,
    ah.length_of_stay,
    ah.total_cost,

    CASE
        WHEN ah.previous_discharge_date IS NOT NULL
        THEN ah.admission_date - ah.previous_discharge_date
    END AS days_to_readmission,

    CASE
        WHEN ah.admission_date - ah.previous_discharge_date
             BETWEEN 0 AND 30
        THEN 'YES'
        ELSE 'NO'
    END AS readmitted_within_30_days

FROM admission_history ah
JOIN rr_patients p
    ON ah.patient_id = p.patient_id
ORDER BY ah.admission_date;