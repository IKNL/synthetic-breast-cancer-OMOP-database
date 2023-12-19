-- indices: takes 7 - 55 minutes
CREATE INDEX idx_person_id  ON omopcdm_synthetic.person  (person_id ASC);
CLUSTER omopcdm_synthetic.person  USING idx_person_id ;
CREATE INDEX idx_gender ON omopcdm_synthetic.person (gender_concept_id ASC);

CREATE INDEX idx_observation_period_id_1  ON omopcdm_synthetic.observation_period  (person_id ASC);
CLUSTER omopcdm_synthetic.observation_period  USING idx_observation_period_id_1 ;

CREATE INDEX idx_visit_person_id_1  ON omopcdm_synthetic.visit_occurrence  (person_id ASC);
CLUSTER omopcdm_synthetic.visit_occurrence  USING idx_visit_person_id_1 ;
CREATE INDEX idx_visit_concept_id_1 ON omopcdm_synthetic.visit_occurrence (visit_concept_id ASC);

CREATE INDEX idx_visit_det_person_id_1  ON omopcdm_synthetic.visit_detail  (person_id ASC);
CLUSTER omopcdm_synthetic.visit_detail  USING idx_visit_det_person_id_1 ;
CREATE INDEX idx_visit_det_concept_id_1 ON omopcdm_synthetic.visit_detail (visit_detail_concept_id ASC);
CREATE INDEX idx_visit_det_occ_id ON omopcdm_synthetic.visit_detail (visit_occurrence_id ASC);

CREATE INDEX idx_condition_person_id_1  ON omopcdm_synthetic.condition_occurrence  (person_id ASC);
CLUSTER omopcdm_synthetic.condition_occurrence  USING idx_condition_person_id_1 ;
CREATE INDEX idx_condition_concept_id_1 ON omopcdm_synthetic.condition_occurrence (condition_concept_id ASC);
CREATE INDEX idx_condition_visit_id_1 ON omopcdm_synthetic.condition_occurrence (visit_occurrence_id ASC);

CREATE INDEX idx_episode_person_id_1 ON omopcdm_synthetic.episode (person_id ASC);
CLUSTER omopcdm_synthetic.episode USING idx_episode_person_id_1;
CREATE INDEX idx_episode_concept_id_1 ON omopcdm_synthetic.episode (episode_concept_id ASC);

CREATE INDEX idx_ee_episode_id_1 ON omopcdm_synthetic.episode_event (episode_id ASC);
CLUSTER omopcdm_synthetic.episode_event USING idx_ee_episode_id_1;
CREATE INDEX idx_ee_field_concept_id_1 ON omopcdm_synthetic.episode_event (episode_event_field_concept_id ASC);

CREATE INDEX idx_drug_person_id_1  ON omopcdm_synthetic.drug_exposure  (person_id ASC);
CLUSTER omopcdm_synthetic.drug_exposure  USING idx_drug_person_id_1 ;
CREATE INDEX idx_drug_concept_id_1 ON omopcdm_synthetic.drug_exposure (drug_concept_id ASC);
CREATE INDEX idx_drug_visit_id_1 ON omopcdm_synthetic.drug_exposure (visit_occurrence_id ASC);

CREATE INDEX idx_procedure_person_id_1  ON omopcdm_synthetic.procedure_occurrence  (person_id ASC);
CLUSTER omopcdm_synthetic.procedure_occurrence  USING idx_procedure_person_id_1 ;
CREATE INDEX idx_procedure_concept_id_1 ON omopcdm_synthetic.procedure_occurrence (procedure_concept_id ASC);
CREATE INDEX idx_procedure_visit_id_1 ON omopcdm_synthetic.procedure_occurrence (visit_occurrence_id ASC);

CREATE INDEX idx_device_person_id_1  ON omopcdm_synthetic.device_exposure  (person_id ASC);
CLUSTER omopcdm_synthetic.device_exposure  USING idx_device_person_id_1 ;
CREATE INDEX idx_device_concept_id_1 ON omopcdm_synthetic.device_exposure (device_concept_id ASC);
CREATE INDEX idx_device_visit_id_1 ON omopcdm_synthetic.device_exposure (visit_occurrence_id ASC);

CREATE INDEX idx_measurement_person_id_1  ON omopcdm_synthetic.measurement  (person_id ASC);
CLUSTER omopcdm_synthetic.measurement  USING idx_measurement_person_id_1 ;
CREATE INDEX idx_measurement_concept_id_1 ON omopcdm_synthetic.measurement (measurement_concept_id ASC);
CREATE INDEX idx_measurement_visit_id_1 ON omopcdm_synthetic.measurement (visit_occurrence_id ASC);

CREATE INDEX idx_observation_person_id_1  ON omopcdm_synthetic.observation  (person_id ASC);
CLUSTER omopcdm_synthetic.observation  USING idx_observation_person_id_1 ;
CREATE INDEX idx_observation_concept_id_1 ON omopcdm_synthetic.observation (observation_concept_id ASC);
CREATE INDEX idx_observation_visit_id_1 ON omopcdm_synthetic.observation (visit_occurrence_id ASC);

CREATE INDEX idx_death_person_id_1  ON omopcdm_synthetic.death  (person_id ASC);
CLUSTER omopcdm_synthetic.death  USING idx_death_person_id_1 ;

CREATE INDEX idx_note_person_id_1  ON omopcdm_synthetic.note  (person_id ASC);
CLUSTER omopcdm_synthetic.note  USING idx_note_person_id_1 ;
CREATE INDEX idx_note_concept_id_1 ON omopcdm_synthetic.note (note_type_concept_id ASC);
CREATE INDEX idx_note_visit_id_1 ON omopcdm_synthetic.note (visit_occurrence_id ASC);

CREATE INDEX idx_note_nlp_note_id_1  ON omopcdm_synthetic.note_nlp  (note_id ASC);
CLUSTER omopcdm_synthetic.note_nlp  USING idx_note_nlp_note_id_1 ;
CREATE INDEX idx_note_nlp_concept_id_1 ON omopcdm_synthetic.note_nlp (note_nlp_concept_id ASC);

CREATE INDEX idx_specimen_person_id_1  ON omopcdm_synthetic.specimen  (person_id ASC);
CLUSTER omopcdm_synthetic.specimen  USING idx_specimen_person_id_1 ;
CREATE INDEX idx_specimen_concept_id_1 ON omopcdm_synthetic.specimen (specimen_concept_id ASC);

CREATE INDEX idx_fact_relationship_id1 ON omopcdm_synthetic.fact_relationship (domain_concept_id_1 ASC);
CREATE INDEX idx_fact_relationship_id2 ON omopcdm_synthetic.fact_relationship (domain_concept_id_2 ASC);
CREATE INDEX idx_fact_relationship_id3 ON omopcdm_synthetic.fact_relationship (relationship_concept_id ASC);


/************************
Standardized health system data
************************/

CREATE INDEX idx_location_id_1  ON omopcdm_synthetic.location  (location_id ASC);
CLUSTER omopcdm_synthetic.location  USING idx_location_id_1 ;

CREATE INDEX idx_care_site_id_1  ON omopcdm_synthetic.care_site  (care_site_id ASC);
CLUSTER omopcdm_synthetic.care_site  USING idx_care_site_id_1 ;

CREATE INDEX idx_provider_id_1  ON omopcdm_synthetic.provider  (provider_id ASC);
CLUSTER omopcdm_synthetic.provider  USING idx_provider_id_1 ;

/************************
Standardized health economics
************************/

CREATE INDEX idx_period_person_id_1  ON omopcdm_synthetic.payer_plan_period  (person_id ASC);
CLUSTER omopcdm_synthetic.payer_plan_period  USING idx_period_person_id_1 ;

CREATE INDEX idx_cost_event_id  ON omopcdm_synthetic.cost (cost_event_id ASC);

/************************
Standardized derived elements
************************/

CREATE INDEX idx_drug_era_person_id_1  ON omopcdm_synthetic.drug_era  (person_id ASC);
CLUSTER omopcdm_synthetic.drug_era  USING idx_drug_era_person_id_1 ;
CREATE INDEX idx_drug_era_concept_id_1 ON omopcdm_synthetic.drug_era (drug_concept_id ASC);

CREATE INDEX idx_dose_era_person_id_1  ON omopcdm_synthetic.dose_era  (person_id ASC);
CLUSTER omopcdm_synthetic.dose_era  USING idx_dose_era_person_id_1 ;
CREATE INDEX idx_dose_era_concept_id_1 ON omopcdm_synthetic.dose_era (drug_concept_id ASC);

CREATE INDEX idx_condition_era_person_id_1  ON omopcdm_synthetic.condition_era  (person_id ASC);
CLUSTER omopcdm_synthetic.condition_era  USING idx_condition_era_person_id_1 ;
CREATE INDEX idx_condition_era_concept_id_1 ON omopcdm_synthetic.condition_era (condition_concept_id ASC);

/**************************
Standardized meta-data
***************************/

CREATE INDEX idx_metadata_concept_id_1  ON omopcdm_synthetic.metadata  (metadata_concept_id ASC);
CLUSTER omopcdm_synthetic.metadata  USING idx_metadata_concept_id_1 ;

CREATE INDEX idx_source_to_concept_map_3  ON omopcdm_synthetic.SOURCE_TO_CONCEPT_MAP  (target_concept_id ASC);
CLUSTER omopcdm_synthetic.SOURCE_TO_CONCEPT_MAP  USING idx_source_to_concept_map_3 ;
CREATE INDEX idx_source_to_concept_map_1 ON omopcdm_synthetic.SOURCE_TO_CONCEPT_MAP (source_vocabulary_id ASC);
CREATE INDEX idx_source_to_concept_map_2 ON omopcdm_synthetic.SOURCE_TO_CONCEPT_MAP (target_vocabulary_id ASC);
CREATE INDEX idx_source_to_concept_map_c ON omopcdm_synthetic.SOURCE_TO_CONCEPT_MAP (source_code ASC);

-- Check whether all the indexes were generated (Total should be 57 for patient data only)
CREATE OR REPLACE FUNCTION count_indexes ()
  RETURNS text AS
$$
DECLARE result integer DEFAULT 0;
BEGIN
	result := (SELECT count(tablename)::int
				FROM pg_indexes
				WHERE schemaname = 'omopcdm'
        AND indexname LIKE 'idx_%');
	RAISE NOTICE 'Number of indexes available: %: ', result;
  IF result = 17 then
    RAISE WARNING 'Only the indexes for vocabulary exist. You should have 74 indexes in total.';
  ELSEIF result = 57 then
      RAISE NOTICE 'Only the indexes for patient data exist. You should have 74 indexes in total.';
  ELSEIF result = 74 then
      RAISE NOTICE 'Indexes for vocabulary and patient data were generated successfully.';
  ELSE
    RAISE WARNING 'Something went wrong when creating the indexes.';
  END IF;

    RETURN result;
END;
$$
LANGUAGE 'plpgsql';

SELECT count_indexes()
