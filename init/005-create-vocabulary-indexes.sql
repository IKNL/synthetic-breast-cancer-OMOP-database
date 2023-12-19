-- indexes takes 10-45 minutes
CREATE INDEX idx_concept_concept_id  ON omopcdm_synthetic.CONCEPT  (concept_id ASC);
CLUSTER omopcdm_synthetic.CONCEPT  USING idx_concept_concept_id ;
CREATE INDEX idx_concept_code ON omopcdm_synthetic.CONCEPT (concept_code ASC);
CREATE INDEX idx_concept_vocabluary_id ON omopcdm_synthetic.CONCEPT (vocabulary_id ASC);
CREATE INDEX idx_concept_domain_id ON omopcdm_synthetic.CONCEPT (domain_id ASC);
CREATE INDEX idx_concept_class_id ON omopcdm_synthetic.CONCEPT (concept_class_id ASC);
CREATE INDEX idx_vocabulary_vocabulary_id  ON omopcdm_synthetic.VOCABULARY  (vocabulary_id ASC);
CLUSTER omopcdm_synthetic.VOCABULARY  USING idx_vocabulary_vocabulary_id ;
CREATE INDEX idx_domain_domain_id  ON omopcdm_synthetic.DOMAIN  (domain_id ASC);
CLUSTER omopcdm_synthetic.DOMAIN  USING idx_domain_domain_id ;
CREATE INDEX idx_concept_class_class_id  ON omopcdm_synthetic.CONCEPT_CLASS  (concept_class_id ASC);
CLUSTER omopcdm_synthetic.CONCEPT_CLASS  USING idx_concept_class_class_id ;
CREATE INDEX idx_concept_relationship_id_1  ON omopcdm_synthetic.CONCEPT_RELATIONSHIP  (concept_id_1 ASC);
CLUSTER omopcdm_synthetic.CONCEPT_RELATIONSHIP  USING idx_concept_relationship_id_1 ;
CREATE INDEX idx_concept_relationship_id_2 ON omopcdm_synthetic.CONCEPT_RELATIONSHIP (concept_id_2 ASC);
CREATE INDEX idx_concept_relationship_id_3 ON omopcdm_synthetic.CONCEPT_RELATIONSHIP (relationship_id ASC);
CREATE INDEX idx_relationship_rel_id  ON omopcdm_synthetic.RELATIONSHIP  (relationship_id ASC);
CLUSTER omopcdm_synthetic.RELATIONSHIP  USING idx_relationship_rel_id ;
CREATE INDEX idx_concept_synonym_id  ON omopcdm_synthetic.CONCEPT_SYNONYM  (concept_id ASC);
CLUSTER omopcdm_synthetic.CONCEPT_SYNONYM  USING idx_concept_synonym_id ;
CREATE INDEX idx_concept_ancestor_id_1  ON omopcdm_synthetic.CONCEPT_ANCESTOR  (ancestor_concept_id ASC);
CLUSTER omopcdm_synthetic.CONCEPT_ANCESTOR  USING idx_concept_ancestor_id_1 ;
CREATE INDEX idx_concept_ancestor_id_2 ON omopcdm_synthetic.CONCEPT_ANCESTOR (descendant_concept_id ASC);
CREATE INDEX idx_drug_strength_id_1  ON omopcdm_synthetic.DRUG_STRENGTH  (drug_concept_id ASC);
CLUSTER omopcdm_synthetic.DRUG_STRENGTH  USING idx_drug_strength_id_1 ;
CREATE INDEX idx_drug_strength_id_2 ON omopcdm_synthetic.DRUG_STRENGTH (ingredient_concept_id ASC);


-- Check whether all the indexes were generated (Total should be 17)
CREATE OR REPLACE FUNCTION count_idx ()
  RETURNS text AS
$$
DECLARE result integer DEFAULT 0;
BEGIN
	result := (SELECT count(tablename)::int
			 	FROM pg_indexes
				WHERE schemaname = 'omopcdm_synthetic'
			   	AND indexname LIKE 'idx_%');
	RAISE NOTICE 'Number of indexes available: %: ', result;
  IF result = 17 then
		RAISE WARNING 'Only the indexes for vocabulary indexes exist. You should have 74 indexes in total.';
  ELSEIF result = 57 then
  		RAISE WARNING 'Only the indexes for patient data indexes exist. You should have 74 indexes in total.';
  ELSEIF result = 74 then
  		RAISE NOTICE 'Indexes for vocabulary and patient data were generated successfully.';
  ELSE
    RAISE WARNING 'Something went wrong when creating the indexes.';
	END IF;

    RETURN result;
END;
$$
LANGUAGE 'plpgsql';

SELECT count_idx()
