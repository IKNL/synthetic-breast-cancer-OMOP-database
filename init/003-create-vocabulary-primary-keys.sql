-- primary keys takes about 1-2 seconds
ALTER TABLE omopcdm_synthetic.CONCEPT ADD CONSTRAINT xpk_concept PRIMARY KEY (concept_id);
ALTER TABLE omopcdm_synthetic.VOCABULARY ADD CONSTRAINT xpk_vocabulary PRIMARY KEY (vocabulary_id);
ALTER TABLE omopcdm_synthetic.DOMAIN ADD CONSTRAINT xpk_domain PRIMARY KEY (domain_id);
ALTER TABLE omopcdm_synthetic.CONCEPT_CLASS ADD CONSTRAINT xpk_concept_class PRIMARY KEY (concept_class_id);
ALTER TABLE omopcdm_synthetic.RELATIONSHIP ADD CONSTRAINT xpk_relationship PRIMARY KEY (relationship_id);

-- Check whether all the primary keys were generated (total should be 5 for vocabulary only)
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
  ELSEIF result = 23 then
      RAISE NOTICE 'Onlu the primary keys for patient data exist. You should have 28 primary keys in total.';
  ELSEIF result = 28 then
      RAISE NOTICE 'Primary keys for vocabulary and patient data wre generated successfully.';
  ELSE
    RAISE WARNING 'Something went wrong when creating the primary keys.';
  END IF;

    RETURN result;
END;
$$
LANGUAGE 'plpgsql';

SELECT count_pkeys()
