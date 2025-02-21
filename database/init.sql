-- Create basic schema
CREATE SCHEMA IF NOT EXISTS moravids_schema;

-- Set default permissions
ALTER DEFAULT PRIVILEGES IN SCHEMA moravids_schema GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO moravids_username;

-- Switch to using the schema
SET search_path TO moravids_schema;

-- Create Users Table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert test data
INSERT INTO users (username, email) VALUES
('test_user', 'test@moravids.com');