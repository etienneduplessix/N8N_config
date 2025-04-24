
DO
$$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE rolname = 'n8n') THEN
      CREATE ROLE n8n WITH LOGIN PASSWORD 'n8npass';
   END IF;
END
$$;

CREATE DATABASE n8ndb
  WITH OWNER = n8n
       ENCODING = 'UTF8'
       LC_COLLATE = 'en_US.UTF-8'
       LC_CTYPE = 'en_US.UTF-8'
       TEMPLATE = template0;

GRANT ALL PRIVILEGES ON DATABASE n8ndb TO n8n;
