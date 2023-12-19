INSERT INTO omopcdm_synthetic.episode_event
(
    episode_id
  , event_id
  , episode_event_field_concept_id
)
SELECT 
    EE.episode_id AS episode_id
  , M.measurement_id AS event_id
  , 1147138 AS episode_event_field_concept_id
  FROM omopcdm_synthetic.measurement AS M
  JOIN omopcdm_synthetic.episode_event AS EE
    ON EE.event_id = M.measurement_event_id
  WHERE M.meas_event_field_concept_id = 1147127 AND EE.episode_event_field_concept_id = 1147127