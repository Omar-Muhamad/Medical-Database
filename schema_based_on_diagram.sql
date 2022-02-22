/* Database schema to keep the structure of entire database. */
DROP TABLE IF EXISTS patients;
CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  date_of_birth DATE,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS medical_histories;
CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (patient_id) REFERENCES patients(id)
);

DROP TABLE IF EXISTS treatments;
CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  type VARCHAR(255),
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS invoices;
CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_histories_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id)
);

DROP TABLE IF EXISTS invoice_items;
CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

DROP TABLE IF EXISTS treatment_histories;
CREATE TABLE treatment_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  medical_history_id INT,
  treatment_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);