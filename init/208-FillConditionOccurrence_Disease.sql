INSERT INTO omopcdm_synthetic.condition_occurrence
(
  person_id
  , condition_concept_id
  , condition_start_date
  , condition_start_datetime
  , condition_end_date
  , condition_end_datetime
  , condition_type_concept_id
  , condition_status_concept_id
  , stop_reason
  , provider_id
  , visit_occurrence_id
  , visit_detail_id
  , condition_source_value
  , condition_source_concept_id
  , condition_status_source_value
  , condition_event_id
  , cond_event_field_concept_id
)
SELECT 
  e.person_id AS person_id
  , e.episode_object_concept_id AS condition_concept_id
  , e.episode_start_date AS condition_start_date
  , e.episode_start_datetime AS condition_start_datetime
  , NULL AS condition_end_date
  , NULL AS condition_end_datetime
  , 32879 AS condition_type_concept_id
  , NULL AS condition_status_concept_id
  , NULL AS stop_reason
  , NULL AS provider_id
  , NULL AS visit_occurrence_id
  , NULL AS visit_detail_id
  , e.episode_source_value AS condition_source_value
  , c.concept_id AS condition_source_concept_id
  , NULL AS condition_status_source_value
  , e.episode_id AS condition_event_id
  , 756290 AS cond_event_field_concept_id
  FROM omopcdm_synthetic.episode AS e
  LEFT JOIN omopcdm_synthetic.concept AS c
	ON c.concept_code = e.episode_source_value
  WHERE e.episode_concept_id = 32533