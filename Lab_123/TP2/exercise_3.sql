DROP TABLE MY_OBJECTS;
CREATE TABLE IF NOT EXISTS MY_OBJECTS(
	Object VARCHAR(255),
	Type VARCHAR(50)
);

INSERT INTO MY_OBJECTS (Object, Type)
SELECT table_name AS Object, 'Table' AS Type
FROM information_schema.tables
WHERE table_schema = 'public'
UNION
SELECT column_name AS Object, 'Column' AS Type
FROM information_schema.columns
WHERE table_schema = 'public'
UNION
SELECT conname AS Object, 'Constraint' AS Type
FROM pg_constraint
WHERE connamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public');

SELECT * FROM MY_OBJECTS ORDER BY Type