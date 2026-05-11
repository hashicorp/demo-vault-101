-- Copyright IBM Corp. 2019, 2026

CREATE ROLE "{{name}}" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';
REVOKE ALL ON SCHEMA public FROM public, "{{name}}";
GRANT SELECT ON ALL TABLES IN SCHEMA public TO "{{name}}";
