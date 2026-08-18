FROM postgres:15-alpine

# Copy initialization SQL script
COPY init.sql /docker-entrypoint-initdb.d/

# Optional custom configuration
COPY postgres.conf /etc/postgresql/postgresql.conf
