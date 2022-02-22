/* Database schema to keep the structure of entire database. */
DROP TABLE IF EXISTS patients;
CREATE TABLE patients (
  id INT GENERATED AS IDENTITY,
  name VARCHAR(255),
  date_of_birth DATE,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS medical_histories;
CREATE TABLE medical_histories (
  id INT GENERATED AS IDENTITY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (patient_id) REFERENCES patients(id)
);

DROP TABLE IF EXISTS treatments;
CREATE TABLE treatments (
  id INT GENERATED AS IDENTITY,
  name VARCHAR(255),
  type VARCHAR(255),
  PRIMARY KEY (id)
);