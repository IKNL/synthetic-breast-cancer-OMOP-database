-- primary keys: takes 1-21 minute
ALTER TABLE omopcdm_synthetic.PERSON ADD CONSTRAINT xpk_PERSON PRIMARY KEY (person_id);
ALTER TABLE omopcdm_synthetic.OBSERVATION_PERIOD ADD CONSTRAINT xpk_OBSERVATION_PERIOD PRIMARY KEY (observation_period_id);
ALTER TABLE omopcdm_synthetic.VISIT_OCCURRENCE ADD CONSTRAINT xpk_VISIT_OCCURRENCE PRIMARY KEY (visit_occurrence_id);
ALTER TABLE omopcdm_synthetic.VISIT_DETAIL ADD CONSTRAINT xpk_VISIT_DETAIL PRIMARY KEY (visit_detail_id);
ALTER TABLE omopcdm_synthetic.CONDITION_OCCURRENCE ADD CONSTRAINT xpk_CONDITION_OCCURRENCE PRIMARY KEY (condition_occurrence_id);
ALTER TABLE omopcdm_synthetic.DRUG_EXPOSURE ADD CONSTRAINT xpk_DRUG_EXPOSURE PRIMARY KEY (drug_exposure_id);
ALTER TABLE omopcdm_synthetic.PROCEDURE_OCCURRENCE ADD CONSTRAINT xpk_PROCEDURE_OCCURRENCE PRIMARY KEY (procedure_occurrence_id);
ALTER TABLE omopcdm_synthetic.DEVICE_EXPOSURE ADD CONSTRAINT xpk_DEVICE_EXPOSURE PRIMARY KEY (device_exposure_id);
ALTER TABLE omopcdm_synthetic.MEASUREMENT ADD CONSTRAINT xpk_MEASUREMENT PRIMARY KEY (measurement_id);
ALTER TABLE omopcdm_synthetic.OBSERVATION ADD CONSTRAINT xpk_OBSERVATION PRIMARY KEY (observation_id);
ALTER TABLE omopcdm_synthetic.NOTE ADD CONSTRAINT xpk_NOTE PRIMARY KEY (note_id);
ALTER TABLE omopcdm_synthetic.NOTE_NLP ADD CONSTRAINT xpk_NOTE_NLP PRIMARY KEY (note_nlp_id);
ALTER TABLE omopcdm_synthetic.SPECIMEN ADD CONSTRAINT xpk_SPECIMEN PRIMARY KEY (specimen_id);
ALTER TABLE omopcdm_synthetic.LOCATION ADD CONSTRAINT xpk_LOCATION PRIMARY KEY (location_id);
ALTER TABLE omopcdm_synthetic.CARE_SITE ADD CONSTRAINT xpk_CARE_SITE PRIMARY KEY (care_site_id);
ALTER TABLE omopcdm_synthetic.PROVIDER ADD CONSTRAINT xpk_PROVIDER PRIMARY KEY (provider_id);
ALTER TABLE omopcdm_synthetic.PAYER_PLAN_PERIOD ADD CONSTRAINT xpk_PAYER_PLAN_PERIOD PRIMARY KEY (payer_plan_period_id);
ALTER TABLE omopcdm_synthetic.COST ADD CONSTRAINT xpk_COST PRIMARY KEY (cost_id);
ALTER TABLE omopcdm_synthetic.DRUG_ERA ADD CONSTRAINT xpk_DRUG_ERA PRIMARY KEY (drug_era_id);
ALTER TABLE omopcdm_synthetic.DOSE_ERA ADD CONSTRAINT xpk_DOSE_ERA PRIMARY KEY (dose_era_id);
ALTER TABLE omopcdm_synthetic.CONDITION_ERA ADD CONSTRAINT xpk_CONDITION_ERA PRIMARY KEY (condition_era_id);
ALTER TABLE omopcdm_synthetic.EPISODE ADD CONSTRAINT xpk_EPISODE PRIMARY KEY (episode_id);
ALTER TABLE omopcdm_synthetic.METADATA ADD CONSTRAINT xpk_METADATA PRIMARY KEY (metadata_id);

-- Check whether all the primary keys were generated (total should be 23)
CREATE OR REPLACE FUNCTION count_pkeys ()
  RETURNS text AS
$$
DECLARE result integer DEFAULT 0;
BEGIN
result := (SELECT count(tablename)::int
            FROM pg_indexes
            WHERE schemaname = 'omopcdm_synthetic'
            AND indexname LIKE 'xpk_%');
	RAISE NOTICE 'Number of primary keys available: %: ', result;
	IF result = 5 then
		RAISE WARNING 'Only the primary keys for vocabulary exist. You should have 28 primary keys in total.';
  ELSEIF result = 28 then
  		RAISE NOTICE 'Primary keys for vocabulary and patient data are generated successfully.';
  ELSE
    RAISE WARNING 'Something went wrong when creating the primary keys. You should have 28 primary keys.';
	END IF;

    RETURN result;
END;
$$
LANGUAGE 'plpgsql';

SELECT count_pkeys()
