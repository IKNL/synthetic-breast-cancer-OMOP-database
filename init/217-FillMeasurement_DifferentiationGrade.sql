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
  E.person_id AS person_id
  , CASE
      WHEN d.diffgrad = '1' THEN 36768162
	  WHEN d.diffgrad = '2' THEN 36770626
	  WHEN d.diffgrad = '3' THEN 36769666
	  ELSE 0
    END AS measurement_concept_id
  , e.episode_start_date AS measurement_date
  , e.episode_start_datetime AS measurement_datetime
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
  , d.diffgrad AS measurement_source_value
  , NULL AS measurement_source_concept_id
  , NULL AS unit_source_value
  , NULL AS value_source_value
  , co.condition_occurrence_id AS measurement_event_id
  , 1147127 AS meas_event_field_concept_id
  FROM omopcdm_synthetic.episode e
  JOIN omopcdm_synthetic.condition_occurrence co
    ON co.condition_event_id = e.episode_id AND co.condition_source_value = e.episode_source_value
  JOIN omopcdm_synthetic.person p
    ON p.person_id = e.person_id
  JOIN omopcdm_synthetic.data d
    ON p.person_source_value = d.key_nkr  
  WHERE e.episode_concept_id = 32533
    AND co.cond_event_field_concept_id = 756290 