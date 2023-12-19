INSERT INTO omopcdm_synthetic.procedure_occurrence
(
  person_id
  ,procedure_concept_id
  ,procedure_date
  ,procedure_datetime
  ,procedure_end_date
  ,procedure_end_datetime
  ,procedure_type_concept_id
  ,modifier_concept_id
  ,quantity
  ,provider_id
  ,visit_occurrence_id
  ,visit_detail_id
  ,procedure_source_value
  ,procedure_source_concept_id
  ,modifier_source_value
  ,procedure_event_id
  ,proc_event_field_concept_id
)
SELECT
  e.person_id AS person_id
  , stcm.target_concept_id AS procedure_concept_id
  , e.episode_start_date AS procedure_date
  , e.episode_start_date AS procedure_datetime
  , NULL AS procedure_end_date
  , NULL AS procedure_end_datetime
  , 32879 AS procedure_type_concept_id
  , NULL AS modifier_concept_id
  , 1 AS quantity
  , NULL AS provider_id
  , NULL AS visit_occurrence_id
  , NULL AS visit_detail_id
  , d.uitgebr_chir_code AS procedure_source_value
  , NULL AS procedure_source_concept_id
  , NULL AS modifier_source_value
  , e.episode_id AS procedure_event_id
  , 756290 AS proc_event_field_concept_id
  FROM omopcdm_synthetic.episode e
  JOIN omopcdm_synthetic.person p
    ON p.person_id = e.episode_id 
  JOIN omopcdm_synthetic.data d 
    ON d.key_nkr = p.person_source_value
  JOIN omopcdm_synthetic.source_to_concept_map stcm
    ON stcm.source_code = d.uitgebr_chir_code