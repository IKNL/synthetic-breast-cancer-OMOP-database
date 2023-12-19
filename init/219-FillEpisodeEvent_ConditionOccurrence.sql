INSERT INTO omopcdm_synthetic.episode_event
(
    episode_id
  , event_id
  , episode_event_field_concept_id
)
SELECT 
    CO.condition_event_id AS episode_id
  , CO.condition_occurrence_id AS event_id
  , 1147127 AS episode_event_field_concept_id
  FROM omopcdm_synthetic.condition_occurrence AS CO
    WHERE CO.cond_event_field_concept_id = 756290