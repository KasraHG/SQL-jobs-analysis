DROP TABLE IF EXISTS job_applied;

CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(225), -- Corrected the type here
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(225),
    status VARCHAR(50));