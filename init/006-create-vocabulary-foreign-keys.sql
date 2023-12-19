-- foreign key constraints takes 3-14 minutes
ALTER TABLE omopcdm_synthetic.CONCEPT ADD CONSTRAINT fpk_CONCEPT_domain_id FOREIGN KEY (domain_id) REFERENCES omopcdm_synthetic.DOMAIN (DOMAIN_ID);
ALTER TABLE omopcdm_synthetic.CONCEPT ADD CONSTRAINT fpk_CONCEPT_vocabulary_id FOREIGN KEY (vocabulary_id) REFERENCES omopcdm_synthetic.VOCABULARY (VOCABULARY_ID);
ALTER TABLE omopcdm_synthetic.CONCEPT ADD CONSTRAINT fpk_CONCEPT_concept_class_id FOREIGN KEY (concept_class_id) REFERENCES omopcdm_synthetic.CONCEPT_CLASS (CONCEPT_CLASS_ID);
ALTER TABLE omopcdm_synthetic.VOCABULARY ADD CONSTRAINT fpk_VOCABULARY_vocabulary_concept_id FOREIGN KEY (vocabulary_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DOMAIN ADD CONSTRAINT fpk_DOMAIN_domain_concept_id FOREIGN KEY (domain_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.CONCEPT_CLASS ADD CONSTRAINT fpk_CONCEPT_CLASS_concept_class_concept_id FOREIGN KEY (concept_class_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.CONCEPT_RELATIONSHIP ADD CONSTRAINT fpk_CONCEPT_RELATIONSHIP_concept_id_1 FOREIGN KEY (concept_id_1) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.CONCEPT_RELATIONSHIP ADD CONSTRAINT fpk_CONCEPT_RELATIONSHIP_concept_id_2 FOREIGN KEY (concept_id_2) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.CONCEPT_RELATIONSHIP ADD CONSTRAINT fpk_CONCEPT_RELATIONSHIP_relationship_id FOREIGN KEY (relationship_id) REFERENCES omopcdm_synthetic.RELATIONSHIP (RELATIONSHIP_ID);
ALTER TABLE omopcdm_synthetic.RELATIONSHIP ADD CONSTRAINT fpk_RELATIONSHIP_relationship_concept_id FOREIGN KEY (relationship_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.CONCEPT_SYNONYM ADD CONSTRAINT fpk_CONCEPT_SYNONYM_concept_id FOREIGN KEY (concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.CONCEPT_SYNONYM ADD CONSTRAINT fpk_CONCEPT_SYNONYM_language_concept_id FOREIGN KEY (language_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.CONCEPT_ANCESTOR ADD CONSTRAINT fpk_CONCEPT_ANCESTOR_ancestor_concept_id FOREIGN KEY (ancestor_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.CONCEPT_ANCESTOR ADD CONSTRAINT fpk_CONCEPT_ANCESTOR_descendant_concept_id FOREIGN KEY (descendant_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DRUG_STRENGTH ADD CONSTRAINT fpk_DRUG_STRENGTH_drug_concept_id FOREIGN KEY (drug_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DRUG_STRENGTH ADD CONSTRAINT fpk_DRUG_STRENGTH_ingredient_concept_id FOREIGN KEY (ingredient_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DRUG_STRENGTH ADD CONSTRAINT fpk_DRUG_STRENGTH_amount_unit_concept_id FOREIGN KEY (amount_unit_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DRUG_STRENGTH ADD CONSTRAINT fpk_DRUG_STRENGTH_numerator_unit_concept_id FOREIGN KEY (numerator_unit_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.DRUG_STRENGTH ADD CONSTRAINT fpk_DRUG_STRENGTH_denominator_unit_concept_id FOREIGN KEY (denominator_unit_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.COHORT_DEFINITION ADD CONSTRAINT fpk_COHORT_DEFINITION_definition_type_concept_id FOREIGN KEY (definition_type_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
ALTER TABLE omopcdm_synthetic.COHORT_DEFINITION ADD CONSTRAINT fpk_COHORT_DEFINITION_subject_concept_id FOREIGN KEY (subject_concept_id) REFERENCES omopcdm_synthetic.CONCEPT (CONCEPT_ID);
--ALTER TABLE omopcdm_synthetic.COHORT_DEFINITION ADD CONSTRAINT fpk_COHORT_DEFINITION_cohort_definition_id FOREIGN KEY (cohort_definition_id) REFERENCES omopcdm_synthetic.COHORT (COHORT_DEFINITION_ID);

-- Check whether all the foreign keys were generated (this should be 21 for vocabulary only)
CREATE OR REPLACE FUNCTION count_fkeys  ()
  RETURNS text AS
$$
DECLARE result integer DEFAULT 0;
BEGIN
	result := (SELECT count(conname)::int
				FROM pg_constraint
				WHERE contype = 'f' );
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
