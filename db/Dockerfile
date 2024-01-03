FROM mysql:latest

# Set environment variables for MySQL
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_ROOT_PASSWORD=ejemplo
ENV MYSQL_USER=test
ENV MYSQL_PASSWORD=ejemplo

# Copy the SQL script into the container
COPY db.sql /docker-entrypoint-initdb.d/
EXPOSE 3306