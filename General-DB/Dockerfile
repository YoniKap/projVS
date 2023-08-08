FROM mysql:latest


COPY guitar.sql /docker-entrypoint-initdb.d
COPY auth.sql /docker-entrypoint-initdb.d

# Expose the default MySQL port (3306) (optional, adjust as needed)
EXPOSE 3306 