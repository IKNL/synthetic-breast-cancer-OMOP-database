INSERT INTO omopcdm_synthetic.episode_event
(
    episode_id
  , event_id
  , episode_event_field_concept_id
)
SELECT 
    po.procedure_event_id AS episode_id
  , po.procedure_occurrence_id AS event_id
  , 1147082 AS episode_event_field_concept_id
  FROM omopcdm_synthetic.procedure_occurrence AS po
    WHERE po.proc_event_field_concept_id = 756290