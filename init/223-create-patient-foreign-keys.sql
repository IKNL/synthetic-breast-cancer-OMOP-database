-- foreign key constraints: takes 4-25 minutes
-- references to CONCEPT/DOMAIN/VOCABULARY table
ALTER TABLE omopcdm_synthetic.PERSON ADD CONSTRAINT fpk_PERSON_gender_concept_id FOREIGN KEY (gender_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PERSON ADD CONSTRAINT fpk_PERSON_race_concept_id FOREIGN KEY (race_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PERSON ADD CONSTRAINT fpk_PERSON_ethnicity_concept_id FOREIGN KEY (ethnicity_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PERSON ADD CONSTRAINT fpk_PERSON_gender_source_concept_id FOREIGN KEY (gender_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PERSON ADD CONSTRAINT fpk_PERSON_race_source_concept_id FOREIGN KEY (race_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PERSON ADD CONSTRAINT fpk_PERSON_ethnicity_source_concept_id FOREIGN KEY (ethnicity_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.OBSERVATION_PERIOD ADD CONSTRAINT fpk_OBSERVATION_PERIOD_period_type_concept_id FOREIGN KEY (period_type_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.VISIT_OCCURRENCE ADD CONSTRAINT fpk_VISIT_OCCURRENCE_visit_concept_id FOREIGN KEY (visit_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.VISIT_OCCURRENCE ADD CONSTRAINT fpk_VISIT_OCCURRENCE_visit_type_concept_id FOREIGN KEY (visit_type_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.VISIT_OCCURRENCE ADD CONSTRAINT fpk_VISIT_OCCURRENCE_visit_source_concept_id FOREIGN KEY (visit_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.VISIT_OCCURRENCE ADD CONSTRAINT fpk_VISIT_OCCURRENCE_admitted_from_concept_id FOREIGN KEY (admitted_from_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.VISIT_OCCURRENCE ADD CONSTRAINT fpk_VISIT_OCCURRENCE_discharged_to_concept_id FOREIGN KEY (discharged_to_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.VISIT_DETAIL ADD CONSTRAINT fpk_VISIT_DETAIL_visit_detail_concept_id FOREIGN KEY (visit_detail_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.VISIT_DETAIL ADD CONSTRAINT fpk_VISIT_DETAIL_visit_detail_type_concept_id FOREIGN KEY (visit_detail_type_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.VISIT_DETAIL ADD CONSTRAINT fpk_VISIT_DETAIL_visit_detail_source_concept_id FOREIGN KEY (visit_detail_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.VISIT_DETAIL ADD CONSTRAINT fpk_VISIT_DETAIL_admitted_from_concept_id FOREIGN KEY (admitted_from_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.VISIT_DETAIL ADD CONSTRAINT fpk_VISIT_DETAIL_discharged_to_concept_id FOREIGN KEY (discharged_to_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.CONDITION_OCCURRENCE ADD CONSTRAINT fpk_CONDITION_OCCURRENCE_condition_concept_id FOREIGN KEY (condition_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.CONDITION_OCCURRENCE ADD CONSTRAINT fpk_CONDITION_OCCURRENCE_condition_type_concept_id FOREIGN KEY (condition_type_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.CONDITION_OCCURRENCE ADD CONSTRAINT fpk_CONDITION_OCCURRENCE_condition_status_concept_id FOREIGN KEY (condition_status_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.CONDITION_OCCURRENCE ADD CONSTRAINT fpk_CONDITION_OCCURRENCE_condition_source_concept_id FOREIGN KEY (condition_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DRUG_EXPOSURE ADD CONSTRAINT fpk_DRUG_EXPOSURE_drug_concept_id FOREIGN KEY (drug_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DRUG_EXPOSURE ADD CONSTRAINT fpk_DRUG_EXPOSURE_drug_type_concept_id FOREIGN KEY (drug_type_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DRUG_EXPOSURE ADD CONSTRAINT fpk_DRUG_EXPOSURE_route_concept_id FOREIGN KEY (route_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DRUG_EXPOSURE ADD CONSTRAINT fpk_DRUG_EXPOSURE_drug_source_concept_id FOREIGN KEY (drug_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PROCEDURE_OCCURRENCE ADD CONSTRAINT fpk_PROCEDURE_OCCURRENCE_procedure_concept_id FOREIGN KEY (procedure_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PROCEDURE_OCCURRENCE ADD CONSTRAINT fpk_PROCEDURE_OCCURRENCE_procedure_type_concept_id FOREIGN KEY (procedure_type_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PROCEDURE_OCCURRENCE ADD CONSTRAINT fpk_PROCEDURE_OCCURRENCE_modifier_concept_id FOREIGN KEY (modifier_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PROCEDURE_OCCURRENCE ADD CONSTRAINT fpk_PROCEDURE_OCCURRENCE_procedure_source_concept_id FOREIGN KEY (procedure_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DEVICE_EXPOSURE ADD CONSTRAINT fpk_DEVICE_EXPOSURE_device_concept_id FOREIGN KEY (device_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DEVICE_EXPOSURE ADD CONSTRAINT fpk_DEVICE_EXPOSURE_device_type_concept_id FOREIGN KEY (device_type_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DEVICE_EXPOSURE ADD CONSTRAINT fpk_DEVICE_EXPOSURE_device_source_concept_id FOREIGN KEY (device_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DEVICE_EXPOSURE ADD CONSTRAINT fpk_DEVICE_EXPOSURE_unit_concept_id FOREIGN KEY (unit_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DEVICE_EXPOSURE ADD CONSTRAINT fpk_DEVICE_EXPOSURE_unit_source_concept_id FOREIGN KEY (unit_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.MEASUREMENT ADD CONSTRAINT fpk_MEASUREMENT_measurement_concept_id FOREIGN KEY (measurement_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.MEASUREMENT ADD CONSTRAINT fpk_MEASUREMENT_measurement_type_concept_id FOREIGN KEY (measurement_type_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.MEASUREMENT ADD CONSTRAINT fpk_MEASUREMENT_operator_concept_id FOREIGN KEY (operator_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.MEASUREMENT ADD CONSTRAINT fpk_MEASUREMENT_value_as_concept_id FOREIGN KEY (value_as_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.MEASUREMENT ADD CONSTRAINT fpk_MEASUREMENT_unit_concept_id FOREIGN KEY (unit_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.MEASUREMENT ADD CONSTRAINT fpk_MEASUREMENT_measurement_source_concept_id FOREIGN KEY (measurement_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.MEASUREMENT ADD CONSTRAINT fpk_MEASUREMENT_unit_source_concept_id FOREIGN KEY (unit_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.MEASUREMENT ADD CONSTRAINT fpk_MEASUREMENT_meas_event_field_concept_id FOREIGN KEY (meas_event_field_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.OBSERVATION ADD CONSTRAINT fpk_OBSERVATION_observation_concept_id FOREIGN KEY (observation_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.OBSERVATION ADD CONSTRAINT fpk_OBSERVATION_observation_type_concept_id FOREIGN KEY (observation_type_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.OBSERVATION ADD CONSTRAINT fpk_OBSERVATION_value_as_concept_id FOREIGN KEY (value_as_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.OBSERVATION ADD CONSTRAINT fpk_OBSERVATION_qualifier_concept_id FOREIGN KEY (qualifier_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.OBSERVATION ADD CONSTRAINT fpk_OBSERVATION_unit_concept_id FOREIGN KEY (unit_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.OBSERVATION ADD CONSTRAINT fpk_OBSERVATION_observation_source_concept_id FOREIGN KEY (observation_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.OBSERVATION ADD CONSTRAINT fpk_OBSERVATION_obs_event_field_concept_id FOREIGN KEY (obs_event_field_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DEATH ADD CONSTRAINT fpk_DEATH_death_type_concept_id FOREIGN KEY (death_type_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DEATH ADD CONSTRAINT fpk_DEATH_cause_concept_id FOREIGN KEY (cause_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DEATH ADD CONSTRAINT fpk_DEATH_cause_source_concept_id FOREIGN KEY (cause_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.NOTE ADD CONSTRAINT fpk_NOTE_note_type_concept_id FOREIGN KEY (note_type_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.NOTE ADD CONSTRAINT fpk_NOTE_note_class_concept_id FOREIGN KEY (note_class_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.NOTE ADD CONSTRAINT fpk_NOTE_encoding_concept_id FOREIGN KEY (encoding_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.NOTE ADD CONSTRAINT fpk_NOTE_language_concept_id FOREIGN KEY (language_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.NOTE ADD CONSTRAINT fpk_NOTE_note_event_field_concept_id FOREIGN KEY (note_event_field_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.NOTE_NLP ADD CONSTRAINT fpk_NOTE_NLP_section_concept_id FOREIGN KEY (section_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.NOTE_NLP ADD CONSTRAINT fpk_NOTE_NLP_note_nlp_concept_id FOREIGN KEY (note_nlp_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.NOTE_NLP ADD CONSTRAINT fpk_NOTE_NLP_note_nlp_source_concept_id FOREIGN KEY (note_nlp_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.SPECIMEN ADD CONSTRAINT fpk_SPECIMEN_specimen_concept_id FOREIGN KEY (specimen_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.SPECIMEN ADD CONSTRAINT fpk_SPECIMEN_specimen_type_concept_id FOREIGN KEY (specimen_type_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.SPECIMEN ADD CONSTRAINT fpk_SPECIMEN_unit_concept_id FOREIGN KEY (unit_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.SPECIMEN ADD CONSTRAINT fpk_SPECIMEN_anatomic_site_concept_id FOREIGN KEY (anatomic_site_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.SPECIMEN ADD CONSTRAINT fpk_SPECIMEN_disease_status_concept_id FOREIGN KEY (disease_status_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.FACT_RELATIONSHIP ADD CONSTRAINT fpk_FACT_RELATIONSHIP_domain_concept_id_1 FOREIGN KEY (domain_concept_id_1) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.FACT_RELATIONSHIP ADD CONSTRAINT fpk_FACT_RELATIONSHIP_domain_concept_id_2 FOREIGN KEY (domain_concept_id_2) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.FACT_RELATIONSHIP ADD CONSTRAINT fpk_FACT_RELATIONSHIP_relationship_concept_id FOREIGN KEY (relationship_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.LOCATION ADD CONSTRAINT fpk_LOCATION_country_concept_id FOREIGN KEY (country_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.CARE_SITE ADD CONSTRAINT fpk_CARE_SITE_place_of_service_concept_id FOREIGN KEY (place_of_service_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PROVIDER ADD CONSTRAINT fpk_PROVIDER_specialty_concept_id FOREIGN KEY (specialty_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PROVIDER ADD CONSTRAINT fpk_PROVIDER_gender_concept_id FOREIGN KEY (gender_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PROVIDER ADD CONSTRAINT fpk_PROVIDER_specialty_source_concept_id FOREIGN KEY (specialty_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PROVIDER ADD CONSTRAINT fpk_PROVIDER_gender_source_concept_id FOREIGN KEY (gender_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PAYER_PLAN_PERIOD ADD CONSTRAINT fpk_PAYER_PLAN_PERIOD_payer_concept_id FOREIGN KEY (payer_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PAYER_PLAN_PERIOD ADD CONSTRAINT fpk_PAYER_PLAN_PERIOD_payer_source_concept_id FOREIGN KEY (payer_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PAYER_PLAN_PERIOD ADD CONSTRAINT fpk_PAYER_PLAN_PERIOD_plan_concept_id FOREIGN KEY (plan_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PAYER_PLAN_PERIOD ADD CONSTRAINT fpk_PAYER_PLAN_PERIOD_plan_source_concept_id FOREIGN KEY (plan_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PAYER_PLAN_PERIOD ADD CONSTRAINT fpk_PAYER_PLAN_PERIOD_sponsor_concept_id FOREIGN KEY (sponsor_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PAYER_PLAN_PERIOD ADD CONSTRAINT fpk_PAYER_PLAN_PERIOD_sponsor_source_concept_id FOREIGN KEY (sponsor_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PAYER_PLAN_PERIOD ADD CONSTRAINT fpk_PAYER_PLAN_PERIOD_stop_reason_concept_id FOREIGN KEY (stop_reason_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PAYER_PLAN_PERIOD ADD CONSTRAINT fpk_PAYER_PLAN_PERIOD_stop_reason_source_concept_id FOREIGN KEY (stop_reason_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.PAYER_PLAN_PERIOD ADD CONSTRAINT fpk_PAYER_PLAN_PERIOD_payer_plan_period_id FOREIGN KEY (payer_plan_period_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID);
ALTER TABLE omopcdm_synthetic.COST ADD CONSTRAINT fpk_COST_cost_domain_id FOREIGN KEY (cost_domain_id) REFERENCES omopcdm_synthetic.DOMAIN (DOMAIN_ID);
ALTER TABLE omopcdm_synthetic.COST ADD CONSTRAINT fpk_COST_cost_type_concept_id FOREIGN KEY (cost_type_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.COST ADD CONSTRAINT fpk_COST_currency_concept_id FOREIGN KEY (currency_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.COST ADD CONSTRAINT fpk_COST_revenue_code_concept_id FOREIGN KEY (revenue_code_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.COST ADD CONSTRAINT fpk_COST_drg_concept_id FOREIGN KEY (drg_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DRUG_ERA ADD CONSTRAINT fpk_DRUG_ERA_drug_concept_id FOREIGN KEY (drug_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DOSE_ERA ADD CONSTRAINT fpk_DOSE_ERA_drug_concept_id FOREIGN KEY (drug_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DOSE_ERA ADD CONSTRAINT fpk_DOSE_ERA_unit_concept_id FOREIGN KEY (unit_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.CONDITION_ERA ADD CONSTRAINT fpk_CONDITION_ERA_condition_concept_id FOREIGN KEY (condition_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.EPISODE ADD CONSTRAINT fpk_EPISODE_episode_concept_id FOREIGN KEY (episode_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.EPISODE ADD CONSTRAINT fpk_EPISODE_episode_object_concept_id FOREIGN KEY (episode_object_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.EPISODE ADD CONSTRAINT fpk_EPISODE_episode_type_concept_id FOREIGN KEY (episode_type_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.EPISODE ADD CONSTRAINT fpk_EPISODE_episode_source_concept_id FOREIGN KEY (episode_source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.EPISODE_EVENT ADD CONSTRAINT fpk_EPISODE_EVENT_episode_event_field_concept_id FOREIGN KEY (episode_event_field_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.METADATA ADD CONSTRAINT fpk_METADATA_metadata_concept_id FOREIGN KEY (metadata_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.METADATA ADD CONSTRAINT fpk_METADATA_metadata_type_concept_id FOREIGN KEY (metadata_type_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.METADATA ADD CONSTRAINT fpk_METADATA_value_as_concept_id FOREIGN KEY (value_as_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.CDM_SOURCE ADD CONSTRAINT fpk_CDM_SOURCE_cdm_version_concept_id FOREIGN KEY (cdm_version_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.SOURCE_TO_CONCEPT_MAP ADD CONSTRAINT fpk_SOURCE_TO_CONCEPT_MAP_source_concept_id FOREIGN KEY (source_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.SOURCE_TO_CONCEPT_MAP ADD CONSTRAINT fpk_SOURCE_TO_CONCEPT_MAP_target_concept_id FOREIGN KEY (target_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.SOURCE_TO_CONCEPT_MAP ADD CONSTRAINT fpk_SOURCE_TO_CONCEPT_MAP_target_vocabulary_id FOREIGN KEY (target_vocabulary_id) REFERENCES omopcdm_synthetic.VOCABULARY (VOCABULARY_ID);
-- reference to patient tables
ALTER TABLE omopcdm_synthetic.PERSON ADD CONSTRAINT fpk_PERSON_location_id FOREIGN KEY (location_id) REFERENCES omopcdm_synthetic.LOCATION (LOCATION_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.PERSON ADD CONSTRAINT fpk_PERSON_provider_id FOREIGN KEY (provider_id) REFERENCES omopcdm_synthetic.PROVIDER (PROVIDER_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.PERSON ADD CONSTRAINT fpk_PERSON_care_site_id FOREIGN KEY (care_site_id) REFERENCES omopcdm_synthetic.CARE_SITE (CARE_SITE_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.OBSERVATION_PERIOD ADD CONSTRAINT fpk_OBSERVATION_PERIOD_person_id FOREIGN KEY (person_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.VISIT_OCCURRENCE ADD CONSTRAINT fpk_VISIT_OCCURRENCE_person_id FOREIGN KEY (person_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.VISIT_OCCURRENCE ADD CONSTRAINT fpk_VISIT_OCCURRENCE_provider_id FOREIGN KEY (provider_id) REFERENCES omopcdm_synthetic.PROVIDER (PROVIDER_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.VISIT_OCCURRENCE ADD CONSTRAINT fpk_VISIT_OCCURRENCE_care_site_id FOREIGN KEY (care_site_id) REFERENCES omopcdm_synthetic.CARE_SITE (CARE_SITE_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.VISIT_OCCURRENCE ADD CONSTRAINT fpk_VISIT_OCCURRENCE_preceding_visit_occurrence_id FOREIGN KEY (preceding_visit_occurrence_id) REFERENCES omopcdm_synthetic.VISIT_OCCURRENCE (VISIT_OCCURRENCE_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.VISIT_DETAIL ADD CONSTRAINT fpk_VISIT_DETAIL_person_id FOREIGN KEY (person_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.VISIT_DETAIL ADD CONSTRAINT fpk_VISIT_DETAIL_provider_id FOREIGN KEY (provider_id) REFERENCES omopcdm_synthetic.PROVIDER (PROVIDER_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.VISIT_DETAIL ADD CONSTRAINT fpk_VISIT_DETAIL_care_site_id FOREIGN KEY (care_site_id) REFERENCES omopcdm_synthetic.CARE_SITE (CARE_SITE_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.VISIT_DETAIL ADD CONSTRAINT fpk_VISIT_DETAIL_preceding_visit_detail_id FOREIGN KEY (preceding_visit_detail_id) REFERENCES omopcdm_synthetic.VISIT_DETAIL (VISIT_DETAIL_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.VISIT_DETAIL ADD CONSTRAINT fpk_VISIT_DETAIL_parent_visit_detail_id FOREIGN KEY (parent_visit_detail_id) REFERENCES omopcdm_synthetic.VISIT_DETAIL (VISIT_DETAIL_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.VISIT_DETAIL ADD CONSTRAINT fpk_VISIT_DETAIL_visit_occurrence_id FOREIGN KEY (visit_occurrence_id) REFERENCES omopcdm_synthetic.VISIT_OCCURRENCE (VISIT_OCCURRENCE_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.CONDITION_OCCURRENCE ADD CONSTRAINT fpk_CONDITION_OCCURRENCE_person_id FOREIGN KEY (person_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.CONDITION_OCCURRENCE ADD CONSTRAINT fpk_CONDITION_OCCURRENCE_provider_id FOREIGN KEY (provider_id) REFERENCES omopcdm_synthetic.PROVIDER (PROVIDER_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.CONDITION_OCCURRENCE ADD CONSTRAINT fpk_CONDITION_OCCURRENCE_visit_occurrence_id FOREIGN KEY (visit_occurrence_id) REFERENCES omopcdm_synthetic.VISIT_OCCURRENCE (VISIT_OCCURRENCE_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.CONDITION_OCCURRENCE ADD CONSTRAINT fpk_CONDITION_OCCURRENCE_visit_detail_id FOREIGN KEY (visit_detail_id) REFERENCES omopcdm_synthetic.VISIT_DETAIL (VISIT_DETAIL_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.DRUG_EXPOSURE ADD CONSTRAINT fpk_DRUG_EXPOSURE_person_id FOREIGN KEY (person_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.DRUG_EXPOSURE ADD CONSTRAINT fpk_DRUG_EXPOSURE_provider_id FOREIGN KEY (provider_id) REFERENCES omopcdm_synthetic.PROVIDER (PROVIDER_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.DRUG_EXPOSURE ADD CONSTRAINT fpk_DRUG_EXPOSURE_visit_occurrence_id FOREIGN KEY (visit_occurrence_id) REFERENCES omopcdm_synthetic.VISIT_OCCURRENCE (VISIT_OCCURRENCE_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.DRUG_EXPOSURE ADD CONSTRAINT fpk_DRUG_EXPOSURE_visit_detail_id FOREIGN KEY (visit_detail_id) REFERENCES omopcdm_synthetic.VISIT_DETAIL (VISIT_DETAIL_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.PROCEDURE_OCCURRENCE ADD CONSTRAINT fpk_PROCEDURE_OCCURRENCE_person_id FOREIGN KEY (person_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.PROCEDURE_OCCURRENCE ADD CONSTRAINT fpk_PROCEDURE_OCCURRENCE_provider_id FOREIGN KEY (provider_id) REFERENCES omopcdm_synthetic.PROVIDER (PROVIDER_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.PROCEDURE_OCCURRENCE ADD CONSTRAINT fpk_PROCEDURE_OCCURRENCE_visit_occurrence_id FOREIGN KEY (visit_occurrence_id) REFERENCES omopcdm_synthetic.VISIT_OCCURRENCE (VISIT_OCCURRENCE_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.PROCEDURE_OCCURRENCE ADD CONSTRAINT fpk_PROCEDURE_OCCURRENCE_visit_detail_id FOREIGN KEY (visit_detail_id) REFERENCES omopcdm_synthetic.VISIT_DETAIL (VISIT_DETAIL_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.DEVICE_EXPOSURE ADD CONSTRAINT fpk_DEVICE_EXPOSURE_person_id FOREIGN KEY (person_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.DEVICE_EXPOSURE ADD CONSTRAINT fpk_DEVICE_EXPOSURE_provider_id FOREIGN KEY (provider_id) REFERENCES omopcdm_synthetic.PROVIDER (PROVIDER_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.DEVICE_EXPOSURE ADD CONSTRAINT fpk_DEVICE_EXPOSURE_visit_occurrence_id FOREIGN KEY (visit_occurrence_id) REFERENCES omopcdm_synthetic.VISIT_OCCURRENCE (VISIT_OCCURRENCE_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.DEVICE_EXPOSURE ADD CONSTRAINT fpk_DEVICE_EXPOSURE_visit_detail_id FOREIGN KEY (visit_detail_id) REFERENCES omopcdm_synthetic.VISIT_DETAIL (VISIT_DETAIL_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.MEASUREMENT ADD CONSTRAINT fpk_MEASUREMENT_person_id FOREIGN KEY (person_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.MEASUREMENT ADD CONSTRAINT fpk_MEASUREMENT_provider_id FOREIGN KEY (provider_id) REFERENCES omopcdm_synthetic.PROVIDER (PROVIDER_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.MEASUREMENT ADD CONSTRAINT fpk_MEASUREMENT_visit_occurrence_id FOREIGN KEY (visit_occurrence_id) REFERENCES omopcdm_synthetic.VISIT_OCCURRENCE (VISIT_OCCURRENCE_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.MEASUREMENT ADD CONSTRAINT fpk_MEASUREMENT_visit_detail_id FOREIGN KEY (visit_detail_id) REFERENCES omopcdm_synthetic.VISIT_DETAIL (VISIT_DETAIL_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.OBSERVATION ADD CONSTRAINT fpk_OBSERVATION_person_id FOREIGN KEY (person_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.OBSERVATION ADD CONSTRAINT fpk_OBSERVATION_provider_id FOREIGN KEY (provider_id) REFERENCES omopcdm_synthetic.PROVIDER (PROVIDER_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.OBSERVATION ADD CONSTRAINT fpk_OBSERVATION_visit_occurrence_id FOREIGN KEY (visit_occurrence_id) REFERENCES omopcdm_synthetic.VISIT_OCCURRENCE (VISIT_OCCURRENCE_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.OBSERVATION ADD CONSTRAINT fpk_OBSERVATION_visit_detail_id FOREIGN KEY (visit_detail_id) REFERENCES omopcdm_synthetic.VISIT_DETAIL (VISIT_DETAIL_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.DEATH ADD CONSTRAINT fpk_DEATH_person_id FOREIGN KEY (person_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.NOTE ADD CONSTRAINT fpk_NOTE_person_id FOREIGN KEY (person_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.NOTE ADD CONSTRAINT fpk_NOTE_provider_id FOREIGN KEY (provider_id) REFERENCES omopcdm_synthetic.PROVIDER (PROVIDER_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.NOTE ADD CONSTRAINT fpk_NOTE_visit_occurrence_id FOREIGN KEY (visit_occurrence_id) REFERENCES omopcdm_synthetic.VISIT_OCCURRENCE (VISIT_OCCURRENCE_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.NOTE ADD CONSTRAINT fpk_NOTE_visit_detail_id FOREIGN KEY (visit_detail_id) REFERENCES omopcdm_synthetic.VISIT_DETAIL (VISIT_DETAIL_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.SPECIMEN ADD CONSTRAINT fpk_SPECIMEN_person_id FOREIGN KEY (person_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.CARE_SITE ADD CONSTRAINT fpk_CARE_SITE_location_id FOREIGN KEY (location_id) REFERENCES omopcdm_synthetic.LOCATION (LOCATION_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.PROVIDER ADD CONSTRAINT fpk_PROVIDER_care_site_id FOREIGN KEY (care_site_id) REFERENCES omopcdm_synthetic.CARE_SITE (CARE_SITE_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.PAYER_PLAN_PERIOD ADD CONSTRAINT fpk_PAYER_PLAN_PERIOD_person_id FOREIGN KEY (person_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.DRUG_ERA ADD CONSTRAINT fpk_DRUG_ERA_person_id FOREIGN KEY (person_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.DOSE_ERA ADD CONSTRAINT fpk_DOSE_ERA_person_id FOREIGN KEY (person_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.CONDITION_ERA ADD CONSTRAINT fpk_CONDITION_ERA_person_id FOREIGN KEY (person_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.EPISODE ADD CONSTRAINT fpk_EPISODE_person_id FOREIGN KEY (person_id) REFERENCES omopcdm_synthetic.PERSON (PERSON_ID) ON DELETE CASCADE;
ALTER TABLE omopcdm_synthetic.EPISODE_EVENT ADD CONSTRAINT fpk_EPISODE_EVENT_episode_id FOREIGN KEY (episode_id) REFERENCES omopcdm_synthetic.EPISODE (EPISODE_ID) ON DELETE CASCADE;

-- Check whether all the foreign keys were generated (this should be 156 for patient data only)
CREATE OR REPLACE FUNCTION count_fkeys  ()
  RETURNS text AS
$$
DECLARE result integer DEFAULT 0;
BEGIN
	result := (SELECT count(conname)::int
				FROM pg_constraint
				WHERE contype = 'f' and connamespace = 'omopcdm_synthetic'::regnamespace);
	RAISE NOTICE 'Number of foreign keys available: %: ', result;
  IF result = 21 then
    RAISE WARNING 'Only the foreign keys for vocabulary exist. You should have 177 foreign keys in total.';
  ELSEIF result = 156 then
    RAISE NOTICE 'Only foreign keys for patient data exist. You should have 177 foreign keys in total.';
  ELSEIF result = 177 then
      RAISE NOTICE 'Foreign keys for patient data and for vocabulary were successfully generated.';
  ELSE
      RAISE WARNING 'Something went wrong when creating the foreign keys.';
  END IF;

    RETURN result;
END;
$$
LANGUAGE 'plpgsql';

SELECT count_fkeys ()
