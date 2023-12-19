DROP FUNCTION IF EXISTS copyif;

CREATE FUNCTION copyif(tablename text, filename text) RETURNS VOID AS
$func$
BEGIN
EXECUTE (
  format('DO
  $do$
  BEGIN
  IF NOT EXISTS (SELECT FROM %s) THEN
     COPY %s FROM ''%s'' WITH DELIMITER E''\t'' CSV HEADER QUOTE E''\b'' ;
  END IF;
  END
  $do$
', tablename, tablename, filename));
END
$func$ LANGUAGE plpgsql;

-- copy data takes about 10-20 minutes
SELECT copyif('omopcdm_synthetic.DRUG_STRENGTH',        '/docker-entrypoint-initdb.d/vocab/DRUG_STRENGTH.csv');
SELECT copyif('omopcdm_synthetic.CONCEPT',              '/docker-entrypoint-initdb.d/vocab/CONCEPT.csv');
SELECT copyif('omopcdm_synthetic.CONCEPT_RELATIONSHIP', '/docker-entrypoint-initdb.d/vocab/CONCEPT_RELATIONSHIP.csv');
SELECT copyif('omopcdm_synthetic.CONCEPT_ANCESTOR',     '/docker-entrypoint-initdb.d/vocab/CONCEPT_ANCESTOR.csv');
SELECT copyif('omopcdm_synthetic.CONCEPT_SYNONYM',      '/docker-entrypoint-initdb.d/vocab/CONCEPT_SYNONYM.csv');
SELECT copyif('omopcdm_synthetic.RELATIONSHIP',         '/docker-entrypoint-initdb.d/vocab/RELATIONSHIP.csv');
SELECT copyif('omopcdm_synthetic.CONCEPT_CLASS',        '/docker-entrypoint-initdb.d/vocab/CONCEPT_CLASS.csv');
SELECT copyif('omopcdm_synthetic.DOMAIN',               '/docker-entrypoint-initdb.d/vocab/DOMAIN.csv');
SELECT copyif('omopcdm_synthetic.VOCABULARY',           '/docker-entrypoint-initdb.d/vocab/VOCABULARY.csv');

-- Check whether items were loaded  (only checks for loading of omopcdm_synthetic.concepts)
CREATE OR REPLACE FUNCTION count_vocab ()
  RETURNS text AS
$$
DECLARE result integer DEFAULT 0;
BEGIN
	result := (SELECT count(*)::int
				FROM omopcdm_synthetic.concept
				LIMIT 1);
	RAISE NOTICE 'Loading completed. Number of items available: % ', result;
	IF result = 0 THEN
		RAISE WARNING 'There was a problem loading the items.';
	END IF;

    RETURN result;
END;
$$
LANGUAGE 'plpgsql';

SELECT count_vocab()
