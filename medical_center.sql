DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

/c medical_center;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,

);


CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,

);

CREATE TABLE doctors_patients(
    id SERIAL PRIMARY KEY,
    doctors_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    patients_id INTEGER REFERENCES patients ON DELETE CASCADE
);

CREATE TABLE diseases(
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL

);

CREATE TABLE doctors_patients(
    id SERIAL PRIMARY KEY,
    diseases_id INTEGER REFERENCES diseases ON DELETE CASCADE,
    patients_id INTEGER REFERENCES patients ON DELETE CASCADE
);