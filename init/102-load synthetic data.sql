DROP FUNCTION IF EXISTS copyif;

CREATE FUNCTION copyif(tablename text, filename text) RETURNS VOID AS
$func$
BEGIN
EXECUTE (
  format('DO
  $do$
  BEGIN
  IF NOT EXISTS (SELECT FROM %s) THEN
     COPY %s FROM ''%s'' WITH DELIMITER E'';'' CSV HEADER QUOTE E''\b'' ;
  END IF;
  END
  $do$
', tablename, tablename, filename));
END
$func$ LANGUAGE plpgsql;

SELECT copyif('omopcdm_synthetic.data','/mnt/data.csv');