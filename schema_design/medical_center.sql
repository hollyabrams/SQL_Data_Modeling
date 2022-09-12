-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

-- Each doctor and their specialty is listed in this table
CREATE TABLE Doctors (
    id int   NOT NULL,
    name text   NOT NULL,
    specialty text   NOT NULL,
    CONSTRAINT pk_Doctors PRIMARY KEY (
        id
     )
);

-- Creates an id for each visit. Contains doctor and patient information. 
CREATE TABLE Visits (
    id int   NOT NULL,
    doctor_id int   NOT NULL,
    patient_id int   NOT NULL,
    visit_date date   NOT NULL,
    CONSTRAINT pk_Visits PRIMARY KEY (
        id
     )
);


-- Contains individual patient information
CREATE TABLE Patients (
    id int   NOT NULL,
    name text   NOT NULL,
    insurance text   NOT NULL,
    DOB date   NOT NULL,
    CONSTRAINT pk_Patients PRIMARY KEY (
        id
     )
);

-- Contains a list of all diseases and their description. 
CREATE TABLE Diseases (
    id int   NOT NULL,
    name text   NOT NULL,
    description text   NOT NULL,
    CONSTRAINT pk_Diseases PRIMARY KEY (
        id
     )
);

-- Contains diagnosis information for each visit. 
CREATE TABLE Diagnosis (
    id int   NOT NULL,
    visit_id int   NOT NULL,
    disease_id int   NOT NULL,
    notes text   NOT NULL,
    CONSTRAINT pk_Diagnosis PRIMARY KEY (
        id
     )
);

ALTER TABLE Visits ADD CONSTRAINT fk_Visits_doctor_id FOREIGN KEY(doctor_id)
REFERENCES Doctors (id);

ALTER TABLE Visits ADD CONSTRAINT fk_Visits_patient_id FOREIGN KEY(patient_id)
REFERENCES Patients (id);

ALTER TABLE Diagnosis ADD CONSTRAINT fk_Diagnosis_visit_id FOREIGN KEY(visit_id)
REFERENCES Visits (visit_date);

ALTER TABLE Diagnosis ADD CONSTRAINT fk_Diagnosis_disease_id FOREIGN KEY(disease_id)
REFERENCES Diseases (id);


INSERT INTO Doctors
  (id, name, specialty)
VALUES
  (1, 'Suess', 'Storyteller'),
  (2, 'Strange', 'Magician'),
  (3, 'Jekyll', 'Split Personality Disorders');
