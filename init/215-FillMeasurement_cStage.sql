WITH CTE_EPISODES AS
(
  SELECT 
    e.person_id AS person_id
    , e.episode_id AS episode_id
    , e.episode_start_date AS episode_start_date
    , co.condition_occurrence_id AS condition_occurrence_id
  FROM omopcdm_synthetic.episode AS e
  JOIN omopcdm_synthetic.condition_occurrence AS co
    ON co.condition_event_id = e.episode_id AND co.condition_source_value = e.episode_source_value
  WHERE E.episode_concept_id = 32533
    AND CO.cond_event_field_concept_id = 756290 
),
CTE_TNM1 AS
(
  SELECT 
    CTE_E.person_id AS person_id
    , CTE_E.episode_id AS episode_id
    , CTE_E.episode_start_date AS episode_start_date
    , CTE_E.condition_occurrence_id AS condition_occurrence_id
    , CASE 
        WHEN d.incjr >= 2017 THEN '8th_'
        WHEN d.incjr >= 2010 THEN '7th_'
        WHEN d.incjr >= 2003 THEN '6th_'
        ELSE ''
      END AS TNM_version
    ,  CASE
        WHEN d.cstadium = '0' THEN '0'
        WHEN d.cstadium = '1A' THEN '1A'
        WHEN d.cstadium = '2A' THEN '2A'
        WHEN d.cstadium = '2B' THEN '2B'
        WHEN d.cstadium = '3A' THEN '3A'
        WHEN d.cstadium = '3B' THEN '3B'
        WHEN d.cstadium = '3C' THEN '3C'
        WHEN d.cstadium = '4' THEN '4'
        ELSE NULL
      END AS TNM_value
    , d.cstadium AS code
    , d.incjr AS jaar
  FROM CTE_EPISODES CTE_E
  JOIN omopcdm_synthetic.person p
    ON p.person_id = CTE_E.person_id
  JOIN omopcdm_synthetic.data d
    ON p.person_source_value = d.key_nkr 
),
CTE_TNM2 AS
(
  SELECT 
    C_TNM1.person_id AS person_id
    , C_TNM1.episode_id AS episode_id
    , C_TNM1.episode_start_date AS episode_start_date
    , C_TNM1.condition_occurrence_id AS condition_occurrence_id
    , CONCAT('c-', C_TNM1.TNM_version, 'AJCC/UICC-Stage-', C_TNM1.TNM_value) AS concept_code
    , CONCAT('cStage', C_TNM1.code, ' - ', C_TNM1.jaar) AS source_value
  FROM CTE_TNM1 AS C_TNM1
  WHERE C_TNM1.TNM_value IS NOT NULL
),
CTE_Concepts AS
(
  SELECT
    C.concept_code AS concept_code
    , C.concept_id AS concept_id
	FROM omopcdm_synthetic.concept AS C
	WHERE  C.vocabulary_id = 'Cancer Modifier'
)

INSERT INTO omopcdm_synthetic.measurement
(
  person_id
  , measurement_concept_id
  , measurement_date
  , measurement_datetime
  , measurement_time
  , measurement_type_concept_id
  , operator_concept_id
  , value_as_number
  , value_as_concept_id
  , unit_concept_id
  , range_low
  , range_high
  , provider_id
  , visit_occurrence_id
  , visit_detail_id
  , measurement_source_value
  , measurement_source_concept_id
  , unit_source_value
  , value_source_value
  , measurement_event_id
  , meas_event_field_concept_id
)
SELECT
  C_TNM2.person_id AS person_id
  , CASE
      WHEN CTE_C.concept_id IS NOT NULL THEN CTE_C.concept_id 
      ELSE 0
    END AS measurement_concept_id
  , C_TNM2.episode_start_date AS measurement_date
  , C_TNM2.episode_start_date AS measurement_datetime
  , NULL AS measurement_time
  , 32879 AS measurement_type_concept_id
  , NULL AS operator_concept_id
  , NULL AS value_as_number
  , NULL AS value_as_concept_id
  , NULL AS unit_concept_id
  , NULL AS range_low
  , NULL AS range_high
  , NULL AS provider_id
  , NULL AS visit_occurrence_id
  , NULL AS visit_detail_id
  , C_TNM2.source_value AS measurement_source_value
  , NULL AS measurement_source_concept_id
  , NULL AS unit_source_value
  , NULL AS value_source_value
  , C_TNM2.condition_occurrence_id AS measurement_event_id
  , 1147127 AS meas_event_field_concept_id
  FROM CTE_TNM2 AS C_TNM2
  LEFT JOIN CTE_Concepts AS CTE_C
    ON CTE_C.concept_code = C_TNM2.concept_code