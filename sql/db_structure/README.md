# EMR Database Structure Documentation

## Overview
This document provides a detailed explanation of the Electronic Medical Record (EMR) database structure. The database is designed to store comprehensive patient medical information, including patient demographics, clinical activities, examinations, and treatment records.

## Schema Information
- **Schema Name**: emr_back
- **Owner**: sinouser1
- **Database Type**: PostgreSQL

## Core Tables

### 1. Patient Information (emr_patient_info)
The central table storing patient demographic and personal information.

**Key Fields**:
- `id`: Primary key (varchar(80))
- `patient_name`: Patient's full name
- `id_card`: Identification card number
- `gender_code/name`: Patient's gender
- `birth_date`: Date of birth
- `nationality_code/name`: Nationality information
- `permanent_addr_code/name/detail`: Permanent address details
- `current_addr_code/name/detail`: Current address details
- `marital_status_code/name`: Marital status
- `education_code/name`: Education level
- `nultitude_type_code/name`: Population type

### 2. Clinical Activities (emr_activity_info)
Records various clinical activities and encounters.

**Key Fields**:
- `id`: Primary key
- `patient_id`: Foreign key to emr_patient_info
- `activity_type_code/name`: Type of clinical activity
- `serial_number`: Activity serial number
- `activity_time`: Timestamp of activity
- `chief_complaint`: Patient's main complaint
- `present_illness_his`: Present illness history
- `physical_examination`: Physical examination results
- `disease_code/name`: Diagnosis information
- `wm_disease_code/name`: Western medicine diagnosis
- `tcm_disease_code/name`: Traditional Chinese medicine diagnosis

### 3. Admission Information (emr_admission_info)
Stores detailed inpatient admission records.

**Key Fields**:
- `id`: Primary key
- `patient_id`: Foreign key to emr_patient_info
- `serial_number`: Admission serial number
- `ward_name/no`: Ward information
- `bed_no`: Bed number
- `admission_date`: Admission date
- `chief_complaint`: Patient's main complaint
- `health_status_code`: Health status indicator
- `past_illness_his`: Past medical history
- `physical_examination`: Physical examination results
- `diagnosis_information`: Various diagnosis codes and names

### 4. Examination Records
#### 4.1 Clinical Examinations (emr_ex_clinical)
Records clinical examination results.

**Key Fields**:
- `id`: Primary key
- `patient_id`: Foreign key to emr_patient_info
- `examination_type_code/name`: Type of examination
- `examination_objective_desc`: Objective examination description
- `examination_subjective_desc`: Subjective examination description
- `examination_notes`: Additional examination notes

#### 4.2 Laboratory Examinations (emr_ex_lab)
Stores laboratory test results.

**Key Fields**:
- `id`: Primary key
- `patient_id`: Foreign key to emr_patient_info
- `specimen_no`: Specimen identification number
- `specimen_sampling_date`: Date of specimen collection
- `examination_date`: Date of examination
- `examination_report_no`: Report number

### 5. Treatment Records
#### 5.1 Orders (emr_order)
Records medical orders and prescriptions.

**Key Fields**:
- `id`: Primary key
- `patient_id`: Foreign key to emr_patient_info
- `prescription_no`: Prescription number
- `prescription_type_code`: Type of prescription
- `prescription_issuance_date`: Date of prescription issuance
- `excute_date`: Execution date

#### 5.2 Order Items (emr_order_item)
Details of individual order items.

**Key Fields**:
- `id`: Primary key
- `order_id`: Foreign key to emr_order
- `drug_code/name`: Medication information
- `drug_specifications`: Drug specifications
- `drug_dosage_code/unit`: Dosage information
- `tcm_prescription`: Traditional Chinese medicine prescription

### 6. Vital Signs (emr_vital_signs_record)
Records patient vital signs measurements.

**Key Fields**:
- `id`: Primary key
- `patient_id`: Foreign key to emr_patient_info
- `create_date`: Date of measurement
- `ventilatorused_code/name`: Ventilator usage status
- `critical_care_code/name`: Critical care status

## Key Relationships
1. All clinical tables reference `emr_patient_info` through `patient_id`
2. Order items are linked to orders through `order_id`
3. Examination items are linked to their respective examination records

## Indexes
The database includes several indexes for performance optimization:
- Patient name and ID card combinations
- Activity serial numbers
- Patient identifiers across various tables

## Data Types
- `varchar`: Used for codes, names, and identifiers
- `text`: Used for detailed descriptions and notes
- `timestamp`: Used for dates and times
- `boolean`: Used for flags and status indicators

## Constraints
- Primary key constraints on all main tables
- Foreign key constraints maintaining referential integrity
- Unique constraints on critical identifiers
- Not null constraints on essential fields

## Security
- Schema and table ownership assigned to sinouser1
- Appropriate permissions granted for database operations

