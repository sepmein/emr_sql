-- DROP SCHEMA emr_back;

CREATE SCHEMA emr_back AUTHORIZATION sinouser1;
-- emr_back.emr_patient_info definition

-- Drop table

-- DROP TABLE emr_back.emr_patient_info;

CREATE TABLE emr_back.emr_patient_info (
	id varchar(80) NOT NULL,
	patient_name varchar(100) NULL,
	id_card_type_code varchar(2) NULL,
	id_card_type_name varchar(20) NULL,
	id_card varchar(50) NULL,
	gender_code varchar(2) NULL,
	gender_name varchar(10) NULL,
	birth_date timestamp(0) NULL,
	nationality_code varchar(5) NULL,
	nationality_name varchar(50) NULL,
	nation_code varchar(2) NULL,
	nation_name varchar(50) NULL,
	permanent_addr_code varchar(9) NULL,
	permanent_addr_name varchar(100) NULL,
	permanent_addr_detail varchar(250) NULL,
	current_addr_code varchar(9) NULL,
	current_addr_name varchar(100) NULL,
	current_addr_detail varchar(250) NULL,
	workunit varchar(250) NULL,
	marital_status_code varchar(2) NULL,
	marital_status_name varchar(20) NULL,
	tel varchar(70) NULL,
	contacts varchar(100) NULL,
	contacts_tel varchar(70) NULL,
	org_code varchar(9) NULL,
	org_name varchar(100) NULL,
	operator_id varchar(40) NULL,
	operation_time timestamp(6) NULL,
	invalid_flag varchar(1) NULL,
	education_code varchar(2) NULL,
	education_name varchar(20) NULL,
	nultitude_type_code varchar(2) NULL,
	nultitude_type_name varchar(20) NULL,
	data_status varchar(4) NULL,
	create_date timestamp(6) NULL,
	nultitude_type_other varchar(100) NULL,
	qzrj_data_type varchar(2) NULL,
	CONSTRAINT emr_patient_info_unique UNIQUE (id)
);
CREATE INDEX emr_patient_info_patient_name_idx ON emr_back.emr_patient_info USING btree (patient_name, id_card);

-- Permissions

ALTER TABLE emr_back.emr_patient_info OWNER TO sinouser1;
GRANT ALL ON TABLE emr_back.emr_patient_info TO sinouser1;


-- emr_back.emr_activity_info definition

-- Drop table

-- DROP TABLE emr_back.emr_activity_info;

CREATE TABLE emr_back.emr_activity_info (
	id varchar(80) NULL,
	patient_id varchar(80) NULL,
	activity_type_code varchar(2) NULL,
	activity_type_name varchar(20) NULL,
	serial_number varchar(100) NULL,
	activity_time timestamp(6) NULL,
	patient_name varchar(100) NULL,
	id_card_type_code varchar(2) NULL,
	id_card_type_name varchar(20) NULL,
	id_card varchar(50) NULL,
	chief_complaint text NULL,
	present_illness_his text NULL,
	physical_examination text NULL,
	studies_summary_result text NULL,
	diagnose_time timestamp(6) NULL,
	disease_code varchar(50) NULL,
	disease_name varchar(250) NULL,
	wm_disease_code varchar(400) NULL,
	wm_disease_name varchar(400) NULL,
	tcm_disease_code varchar(250) NULL,
	tcm_disease_name varchar(250) NULL,
	tcm_syndrome_code varchar(250) NULL,
	tcm_syndrome_name varchar(250) NULL,
	dept_code varchar(40) NULL,
	dept_name varchar(100) NULL,
	org_code varchar(9) NULL,
	org_name varchar(100) NULL,
	operator_id varchar(40) NULL,
	operation_time timestamp(6) NULL,
	invalid_flag varchar(1) NULL,
	data_status varchar(4) NULL,
	create_date timestamp(6) NULL,
	fill_doctor varchar(50) NULL,
	qzrj_data_type varchar(2) NULL,
	report_disease_code varchar(50) NULL,
	report_disease_name varchar(250) NULL,
	CONSTRAINT emr_activity_info_unique UNIQUE (id),
	CONSTRAINT emr_activity_info_emr_patient_info_fk FOREIGN KEY (patient_id) REFERENCES emr_back.emr_patient_info(id)
);
CREATE INDEX emr_activity_info_patient_id_idx ON emr_back.emr_activity_info USING btree (patient_id, id_card);
CREATE INDEX emr_activity_info_serial_number_idx ON emr_back.emr_activity_info USING btree (serial_number);

-- Permissions

ALTER TABLE emr_back.emr_activity_info OWNER TO sinouser1;
GRANT ALL ON TABLE emr_back.emr_activity_info TO sinouser1;


-- emr_back.emr_admission_info definition

-- Drop table

-- DROP TABLE emr_back.emr_admission_info;

CREATE TABLE emr_back.emr_admission_info (
	id varchar(80) NULL,
	patient_id varchar(80) NULL,
	serial_number varchar(100) NULL,
	ward_name varchar(50) NULL,
	ward_no varchar(10) NULL,
	bed_no varchar(10) NULL,
	patient_name varchar(100) NULL,
	id_card_type_code varchar(2) NULL,
	id_card_type_name varchar(20) NULL,
	id_card varchar(50) NULL,
	admission_date timestamp(6) NULL,
	chief_complaint text NULL,
	present_illness_his text NULL,
	health_status_code varchar(1) NULL,
	past_illness_his text NULL,
	infection_code varchar(1) NULL,
	infection_his text NULL,
	vaccination_his text NULL,
	operation_his text NULL,
	blood_transfusion text NULL,
	allergy_his text NULL,
	personal_his text NULL,
	marital_his text NULL,
	menstrual_his text NULL,
	family_his text NULL,
	physical_examination text NULL,
	specialized_examination text NULL,
	studies_summary_result text NULL,
	observation_result text NULL,
	treatment varchar(100) NULL,
	wm_inital_diagnosis_name varchar(400) NULL,
	wm_inital_diagnosis_code varchar(400) NULL,
	tcm_inital_diagnosis_name varchar(250) NULL,
	tcm_inital_diagnosis_code varchar(250) NULL,
	tcm_inital_syndrome_name varchar(250) NULL,
	tcm_inital_syndrome_code varchar(250) NULL,
	inital_diagnosis_date timestamp(0) NULL,
	wm_revised_diagnosis_name varchar(400) NULL,
	wm_revised_diagnosis_code varchar(400) NULL,
	tcm_revised_diagnosis_name varchar(250) NULL,
	tcm_revised_diagnosis_code varchar(250) NULL,
	tcm_revised_syndrome_name varchar(250) NULL,
	tcm_revised_syndrome_code varchar(250) NULL,
	revised_diagnosis_date timestamp(0) NULL,
	wm_confirmed_diagnosis_name varchar(400) NULL,
	wm_confirmed_diagnosis_code varchar(400) NULL,
	tcm_confirmed_diagnosis_name varchar(250) NULL,
	tcm_confirmed_diagnosis_code varchar(250) NULL,
	tcm_confirmed_syndrome_name varchar(250) NULL,
	tcm_confirmed_syndrome_code varchar(250) NULL,
	confirmed_diagnosis_date timestamp(0) NULL,
	complementary_diagnosis_name varchar(250) NULL,
	complementary_diagnosis_code varchar(50) NULL,
	complementary_diagnosis_date timestamp(0) NULL,
	admission_diagnosis_order varchar(2) NULL,
	visiting_physician_id varchar(50) NULL,
	resident_physician_id varchar(50) NULL,
	chief_physician_id varchar(50) NULL,
	org_code varchar(9) NULL,
	org_name varchar(100) NULL,
	dept_code varchar(40) NULL,
	dept_name varchar(100) NULL,
	operator_id varchar(40) NULL,
	operation_time timestamp(6) NULL,
	invalid_flag varchar(1) NULL,
	data_status varchar(4) NULL,
	create_date timestamp(6) NULL,
	CONSTRAINT emr_admission_info_unique UNIQUE (id),
	CONSTRAINT emr_admission_info_emr_patient_info_fk FOREIGN KEY (patient_id) REFERENCES emr_back.emr_patient_info(id)
);
CREATE INDEX emr_admission_info_patient_id_idx ON emr_back.emr_admission_info USING btree (patient_id, id_card, patient_name, serial_number);

-- Permissions

ALTER TABLE emr_back.emr_admission_info OWNER TO sinouser1;
GRANT ALL ON TABLE emr_back.emr_admission_info TO sinouser1;


-- emr_back.emr_admission_record definition

-- Drop table

-- DROP TABLE emr_back.emr_admission_record;

CREATE TABLE emr_back.emr_admission_record (
	id varchar(80) NULL,
	patient_id varchar(80) NULL,
	serial_number varchar(100) NULL,
	patient_name varchar(100) NULL,
	id_card_type_code varchar(2) NULL,
	id_card_type_name varchar(20) NULL,
	id_card varchar(50) NULL,
	pay_method_code varchar(2) NULL,
	pay_method_name varchar(50) NULL,
	health_card_no varchar(18) NULL,
	admission_num varchar(3) NULL,
	reg_no varchar(18) NULL,
	admission_date timestamp(6) NULL,
	admission_dept_code varchar(20) NULL,
	admission_dept_name varchar(50) NULL,
	ward_no varchar(10) NULL,
	discharge_date timestamp(6) NULL,
	discharge_dept_code varchar(20) NULL,
	discharge_dept_name varchar(50) NULL,
	discharge_ward varchar(10) NULL,
	admission_days varchar(4) NULL,
	wm_outpatient_diagnosis_name varchar(400) NULL,
	wm_outpatient_diagnosis_code varchar(400) NULL,
	discharge_diagnosis_name varchar(400) NULL,
	discharge_diagnosis_code varchar(400) NULL,
	wm_other_diagnosis_name varchar(400) NULL,
	wm_other_diagnosis_code varchar(400) NULL,
	external_causes_name varchar(250) NULL,
	external_causes_code varchar(50) NULL,
	external_causes_system_name text NULL,
	pathological_diagnosis_name varchar(250) NULL,
	pathological_diagnosis_code varchar(50) NULL,
	pathological_no varchar(50) NULL,
	allergy_code varchar(1) NULL,
	allergy_drug text NULL,
	autopsy_code varchar(1) NULL,
	chief_physician_id varchar(50) NULL,
	resident_physician_id varchar(50) NULL,
	accept_org_code varchar(9) NULL,
	accept_org_name varchar(70) NULL,
	org_code varchar(9) NULL,
	org_name varchar(100) NULL,
	dept_code varchar(40) NULL,
	dept_name varchar(100) NULL,
	operator_id varchar(40) NULL,
	operation_time timestamp(6) NULL,
	invalid_flag varchar(1) NULL,
	data_status varchar(4) NULL,
	create_date timestamp(6) NULL,
	CONSTRAINT emr_admission_record_unique UNIQUE (id),
	CONSTRAINT emr_admission_record_emr_patient_info_fk FOREIGN KEY (patient_id) REFERENCES emr_back.emr_patient_info(id)
);

-- Permissions

ALTER TABLE emr_back.emr_admission_record OWNER TO sinouser1;
GRANT ALL ON TABLE emr_back.emr_admission_record TO sinouser1;


-- emr_back.emr_daily_course definition

-- Drop table

-- DROP TABLE emr_back.emr_daily_course;

CREATE TABLE emr_back.emr_daily_course (
	id varchar(80) NULL,
	patient_id varchar(80) NULL,
	serial_number varchar(100) NULL,
	patient_name varchar(100) NULL,
	id_card_type_code varchar(2) NULL,
	id_card_type_name varchar(20) NULL,
	id_card varchar(50) NULL,
	ward_name varchar(50) NULL,
	ward_no varchar(10) NULL,
	bed_no varchar(10) NULL,
	create_time timestamp(6) NULL,
	course text NULL,
	order_content text NULL,
	observation_result text NULL,
	treatment text NULL,
	org_code varchar(9) NULL,
	org_name varchar(100) NULL,
	dept_code varchar(40) NULL,
	dept_name varchar(100) NULL,
	operator_id varchar(40) NULL,
	operation_time timestamp(6) NULL,
	invalid_flag varchar(1) NULL,
	data_status varchar(4) NULL,
	create_date timestamp(6) NULL,
	disease_progression_code varchar(1) NULL,
	disease_progression_name varchar(50) NULL,
	CONSTRAINT emr_daily_course_unique UNIQUE (id),
	CONSTRAINT emr_daily_course_emr_patient_info_fk FOREIGN KEY (patient_id) REFERENCES emr_back.emr_patient_info(id)
);

-- Permissions

ALTER TABLE emr_back.emr_daily_course OWNER TO sinouser1;
GRANT ALL ON TABLE emr_back.emr_daily_course TO sinouser1;


-- emr_back.emr_death_info definition

-- Drop table

-- DROP TABLE emr_back.emr_death_info;

CREATE TABLE emr_back.emr_death_info (
	id varchar(80) NULL,
	patient_id varchar(80) NULL,
	activity_type_code varchar(2) NULL,
	activity_type_name varchar(20) NULL,
	serial_number varchar(100) NULL,
	patient_name varchar(100) NULL,
	id_card_type_code varchar(2) NULL,
	id_card_type_name varchar(20) NULL,
	id_card varchar(50) NULL,
	treatment_desc text NULL,
	dead_date timestamp(6) NULL,
	direct_cause_name varchar(250) NULL,
	direct_cause_code varchar(50) NULL,
	death_diagnosis_name varchar(250) NULL,
	death_diagnosis_code varchar(50) NULL,
	chief_physician_id varchar(50) NULL,
	org_code varchar(9) NULL,
	org_name varchar(100) NULL,
	dept_code varchar(40) NULL,
	dept_name varchar(100) NULL,
	operator_id varchar(40) NULL,
	operation_time timestamp(6) NULL,
	invalid_flag varchar(1) NULL,
	data_status varchar(4) NULL,
	create_date timestamp(6) NULL,
	CONSTRAINT emr_death_info_unique UNIQUE (id),
	CONSTRAINT emr_death_info_emr_patient_info_fk FOREIGN KEY (patient_id) REFERENCES emr_back.emr_patient_info(id)
);

-- Permissions

ALTER TABLE emr_back.emr_death_info OWNER TO sinouser1;
GRANT ALL ON TABLE emr_back.emr_death_info TO sinouser1;


-- emr_back.emr_discharge_info definition

-- Drop table

-- DROP TABLE emr_back.emr_discharge_info;

CREATE TABLE emr_back.emr_discharge_info (
	id varchar(80) NULL,
	patient_id varchar(80) NULL,
	serial_number varchar(100) NULL,
	patient_name varchar(100) NULL,
	id_card_type_code varchar(2) NULL,
	id_card_type_name varchar(20) NULL,
	id_card varchar(50) NULL,
	ward_name varchar(50) NULL,
	ward_no varchar(10) NULL,
	bed_no varchar(10) NULL,
	admission_date timestamp(6) NULL,
	admission_desc text NULL,
	admission_diagnosis_code varchar(400) NULL,
	admission_diagnosis_name varchar(400) NULL,
	studies_summary_result text NULL,
	observation_result text NULL,
	treatment varchar(100) NULL,
	treatment_desc text NULL,
	tcm_decoction_method varchar(100) NULL,
	tcm_use_method varchar(100) NULL,
	discharge_desc text NULL,
	discharge_date timestamp(6) NULL,
	discharge_diagnosis_name varchar(400) NULL,
	discharge_diagnosis_code varchar(400) NULL,
	tcm_discharge_diagnosis_code varchar(250) NULL,
	tcm_discharge_diagnosis_name varchar(250) NULL,
	tcm_discharge_syndrome_code varchar(250) NULL,
	tcm_discharge_syndrome_name varchar(250) NULL,
	discharge_symptoms_signs text NULL,
	discharge_order text NULL,
	resident_physician_id varchar(50) NULL,
	chief_physician_id varchar(50) NULL,
	org_code varchar(9) NULL,
	org_name varchar(100) NULL,
	dept_code varchar(40) NULL,
	dept_name varchar(100) NULL,
	operator_id varchar(40) NULL,
	operation_time timestamp(6) NULL,
	invalid_flag varchar(1) NULL,
	data_status varchar(4) NULL,
	create_date timestamp(6) NULL,
	disease_progression_code varchar(1) NULL,
	disease_progression_name varchar(50) NULL,
	CONSTRAINT emr_discharge_info_unique UNIQUE (id),
	CONSTRAINT emr_discharge_info_emr_patient_info_fk FOREIGN KEY (patient_id) REFERENCES emr_back.emr_patient_info(id)
);

-- Permissions

ALTER TABLE emr_back.emr_discharge_info OWNER TO sinouser1;
GRANT ALL ON TABLE emr_back.emr_discharge_info TO sinouser1;


-- emr_back.emr_ex_clinical definition

-- Drop table

-- DROP TABLE emr_back.emr_ex_clinical;

CREATE TABLE emr_back.emr_ex_clinical (
	id varchar(80) NULL,
	patient_id varchar(80) NULL,
	activity_type_code varchar(2) NULL,
	activity_type_name varchar(20) NULL,
	serial_number varchar(100) NULL,
	patient_name varchar(100) NULL,
	id_card_type_code varchar(2) NULL,
	id_card_type_name varchar(20) NULL,
	id_card varchar(50) NULL,
	ward_name varchar(50) NULL,
	ward_no varchar(10) NULL,
	bed_no varchar(10) NULL,
	application_form_no varchar(50) NULL,
	apply_org_code varchar(9) NULL,
	apply_org_name varchar(100) NULL,
	apply_dept_name varchar(50) NULL,
	apply_dept_code varchar(20) NULL,
	chief_complaint text NULL,
	symptom_start_date timestamp(0) NULL,
	symptom_end_date timestamp(0) NULL,
	symptom_desc text NULL,
	treatment_desc text NULL,
	special_examination_code varchar(1) NULL,
	examination_objective_desc text NULL,
	examination_subjective_desc text NULL,
	examination_notes text NULL,
	examination_report_no varchar(100) NULL,
	examination_report_date timestamp(0) NULL,
	examination_report_id varchar(50) NULL,
	org_code varchar(9) NULL,
	org_name varchar(100) NULL,
	dept_code varchar(40) NULL,
	dept_name varchar(100) NULL,
	operator_id varchar(40) NULL,
	operation_time timestamp(6) NULL,
	invalid_flag varchar(1) NULL,
	examination_type_code varchar(20) NULL,
	data_status varchar(4) NULL,
	create_date timestamp(6) NULL,
	examination_type_name varchar(100) NULL,
	CONSTRAINT emr_ex_clinical_unique UNIQUE (id),
	CONSTRAINT emr_ex_clinical_emr_patient_info_fk FOREIGN KEY (patient_id) REFERENCES emr_back.emr_patient_info(id)
);

-- Permissions

ALTER TABLE emr_back.emr_ex_clinical OWNER TO sinouser1;
GRANT ALL ON TABLE emr_back.emr_ex_clinical TO sinouser1;


-- emr_back.emr_ex_clinical_item definition

-- Drop table

-- DROP TABLE emr_back.emr_ex_clinical_item;

CREATE TABLE emr_back.emr_ex_clinical_item (
	id varchar(80) NULL,
	ex_clinical_id varchar(80) NULL,
	item_name varchar(100) NULL,
	examination_result_code varchar(5) NULL,
	examination_result_name varchar(20) NULL,
	examination_quantification varchar(50) NULL,
	examination_quantification_unit varchar(50) NULL,
	operator_id varchar(40) NULL,
	operation_time timestamp(6) NULL,
	invalid_flag varchar(1) NULL,
	item_code varchar(100) NULL,
	data_status varchar(4) NULL,
	create_date timestamp(6) NULL,
	CONSTRAINT emr_ex_clinical_item_unique UNIQUE (id),
	CONSTRAINT emr_ex_clinical_item_emr_ex_clinical_fk FOREIGN KEY (ex_clinical_id) REFERENCES emr_back.emr_ex_clinical(id)
);
CREATE INDEX emr_ex_clinical_item_ex_clinical_id_idx ON emr_back.emr_ex_clinical_item USING btree (ex_clinical_id);

-- Permissions

ALTER TABLE emr_back.emr_ex_clinical_item OWNER TO sinouser1;
GRANT ALL ON TABLE emr_back.emr_ex_clinical_item TO sinouser1;


-- emr_back.emr_ex_lab definition

-- Drop table

-- DROP TABLE emr_back.emr_ex_lab;

CREATE TABLE emr_back.emr_ex_lab (
	id varchar(80) NULL,
	patient_id varchar(80) NULL,
	activity_type_code varchar(2) NULL,
	activity_type_name varchar(20) NULL,
	serial_number varchar(100) NULL,
	patient_name varchar(100) NULL,
	id_card_type_code varchar(2) NULL,
	id_card_type_name varchar(20) NULL,
	id_card varchar(50) NULL,
	ward_name varchar(50) NULL,
	ward_no varchar(10) NULL,
	bed_no varchar(10) NULL,
	application_form_no varchar(50) NULL,
	apply_org_name varchar(100) NULL,
	apply_org_code varchar(9) NULL,
	apply_dept_name varchar(50) NULL,
	apply_dept_code varchar(20) NULL,
	apply_physician_id varchar(50) NULL,
	specimen_no varchar(100) NULL,
	specimen_sampling_date timestamp(6) NULL,
	specimen_receiving_date timestamp(6) NULL,
	examination_physician_id varchar(50) NULL,
	examination_date timestamp(0) NULL,
	examination_report_no varchar(100) NULL,
	examination_objective_desc text NULL,
	examination_subjective_desc text NULL,
	examination_notes text NULL,
	examination_report_date timestamp(0) NULL,
	examination_report_id varchar(50) NULL,
	org_code varchar(9) NULL,
	org_name varchar(100) NULL,
	dept_code varchar(40) NULL,
	dept_name varchar(100) NULL,
	operator_id varchar(40) NULL,
	operation_time timestamp(6) NULL,
	invalid_flag varchar(1) NULL,
	data_status varchar(4) NULL,
	create_date timestamp(6) NULL,
	specimen_category_code varchar(20) NULL,
	specimen_category_name varchar(100) NULL,
	CONSTRAINT emr_ex_lab_unique UNIQUE (id),
	CONSTRAINT emr_ex_lab_emr_patient_info_fk FOREIGN KEY (patient_id) REFERENCES emr_back.emr_patient_info(id)
);

-- Permissions

ALTER TABLE emr_back.emr_ex_lab OWNER TO sinouser1;
GRANT ALL ON TABLE emr_back.emr_ex_lab TO sinouser1;


-- emr_back.emr_ex_lab_item definition

-- Drop table

-- DROP TABLE emr_back.emr_ex_lab_item;

CREATE TABLE emr_back.emr_ex_lab_item (
	id varchar(80) NULL,
	ex_lab_id varchar(80) NULL,
	item_code varchar(100) NULL,
	item_name text NULL,
	examination_result_code varchar(5) NULL,
	examination_result_name varchar(20) NULL,
	examination_quantification varchar(100) NULL,
	examination_quantification_unit varchar(20) NULL,
	operation_time timestamp(6) NULL,
	operator_id varchar(40) NULL,
	invalid_flag varchar(1) NULL,
	data_status varchar(4) NULL,
	create_date timestamp(6) NULL,
	examination_quantification_lower varchar(20) NULL,
	examination_quantification_upper varchar(20) NULL,
	examination_quantification_ri varchar(2) NULL,
	source_examination_result_code varchar(100) NULL,
	source_examination_result_name text NULL,
	CONSTRAINT emr_ex_lab_item_unique UNIQUE (id),
	CONSTRAINT emr_ex_lab_item_emr_lab_fk FOREIGN KEY (ex_lab_id) REFERENCES emr_back.emr_ex_lab(id)
);
CREATE INDEX emr_ex_lab_item_ex_lab_id_idx ON emr_back.emr_ex_lab_item USING btree (ex_lab_id);

-- Permissions

ALTER TABLE emr_back.emr_ex_lab_item OWNER TO sinouser1;
GRANT ALL ON TABLE emr_back.emr_ex_lab_item TO sinouser1;


-- emr_back.emr_first_course definition

-- Drop table

-- DROP TABLE emr_back.emr_first_course;

CREATE TABLE emr_back.emr_first_course (
	id varchar(80) NOT NULL,
	patient_id varchar(80) NOT NULL,
	serial_number varchar(100) NULL,
	patient_name varchar(100) NULL,
	id_card_type_code varchar(2) NULL,
	id_card_type_name varchar(20) NULL,
	id_card varchar(50) NULL,
	ward_name varchar(50) NULL,
	ward_no varchar(10) NULL,
	bed_no varchar(10) NULL,
	create_time timestamp(6) NULL,
	chief_complaint text NULL,
	present_illness_his text NULL,
	observation_result text NULL,
	diagnosis_basis text NULL,
	wm_inital_diagnosis_code varchar(400) NULL,
	wm_inital_diagnosis_name varchar(400) NULL,
	tcm_inital_diagnosis_code varchar(250) NULL,
	tcm_inital_diagnosis_name varchar(250) NULL,
	tcm_inital_syndrome_code varchar(250) NULL,
	tcm_inital_syndrome_name varchar(250) NULL,
	wm_diff_diagnosis_code varchar(400) NULL,
	wm_diff_diagnosis_name varchar(400) NULL,
	tcm_primary_diagnosis_code varchar(250) NULL,
	tcm_primary_diagnosis_name varchar(250) NULL,
	tcm_primary_syndrome_code varchar(250) NULL,
	tcm_primary_syndrome_name varchar(250) NULL,
	treatment_plan text NULL,
	treatment varchar(100) NULL,
	resident_physician_id varchar(50) NULL,
	org_code varchar(9) NULL,
	org_name varchar(100) NULL,
	dept_code varchar(40) NULL,
	dept_name varchar(100) NULL,
	operator_id varchar(40) NULL,
	operation_time timestamp(6) NULL,
	invalid_flag varchar(1) NULL,
	data_status varchar(4) NULL,
	create_date timestamp(6) NULL,
	disease_progression_code varchar(1) NULL,
	disease_progression_name varchar(50) NULL,
	CONSTRAINT emr_first_course_unique UNIQUE (id),
	CONSTRAINT emr_first_course_emr_patient_info_fk FOREIGN KEY (patient_id) REFERENCES emr_back.emr_patient_info(id)
);
CREATE INDEX emr_first_course_id_card_idx ON emr_back.emr_first_course USING btree (id_card, patient_name, serial_number);

-- Permissions

ALTER TABLE emr_back.emr_first_course OWNER TO sinouser1;
GRANT ALL ON TABLE emr_back.emr_first_course TO sinouser1;


-- emr_back.emr_order definition

-- Drop table

-- DROP TABLE emr_back.emr_order;

CREATE TABLE emr_back.emr_order (
	id varchar(80) NULL,
	patient_id varchar(80) NULL,
	activity_type_code varchar(2) NULL,
	activity_type_name varchar(20) NULL,
	serial_number varchar(100) NULL,
	patient_name varchar(100) NULL,
	id_card_type_code varchar(2) NULL,
	id_card_type_name varchar(20) NULL,
	id_card varchar(50) NULL,
	prescription_no varchar(30) NULL,
	prescription_type_code varchar(1) NULL,
	prescription_issuance_date timestamp(0) NULL,
	prescription_validity_days varchar(2) NULL,
	excute_date timestamp(0) NULL,
	prescription_issuance_id varchar(50) NULL,
	prescription_dispensing_id varchar(50) NULL,
	prescription_notes varchar(100) NULL,
	org_code varchar(9) NULL,
	org_name varchar(100) NULL,
	dept_code varchar(40) NULL,
	dept_name varchar(100) NULL,
	operator_id varchar(40) NULL,
	operation_time timestamp(6) NULL,
	invalid_flag varchar(1) NULL,
	data_status varchar(4) NULL,
	create_date timestamp(6) NULL,
	CONSTRAINT emr_order_unique UNIQUE (id),
	CONSTRAINT emr_order_emr_patient_info_fk FOREIGN KEY (patient_id) REFERENCES emr_back.emr_patient_info(id)
);

-- Permissions

ALTER TABLE emr_back.emr_order OWNER TO sinouser1;
GRANT ALL ON TABLE emr_back.emr_order TO sinouser1;


-- emr_back.emr_order_item definition

-- Drop table

-- DROP TABLE emr_back.emr_order_item;

CREATE TABLE emr_back.emr_order_item (
	id varchar(80) NULL,
	order_id varchar(80) NULL,
	drug_code varchar(20) NULL,
	drug_name varchar(50) NULL,
	drug_specifications varchar(50) NULL,
	drug_dosage_code varchar(8) NULL,
	drug_dosage_unit_code varchar(6) NULL,
	drug_dosage_unit_name varchar(20) NULL,
	drug_dosage_total varchar(15) NULL,
	tcm_prescription varchar(500) NULL,
	tcm_number varchar(2) NULL,
	tcm_decoction_method varchar(100) NULL,
	tcm_use_method varchar(100) NULL,
	operator_id varchar(40) NULL,
	operation_time timestamp(6) NULL,
	invalid_flag varchar(1) NULL,
	data_status varchar(4) NULL,
	create_date timestamp(6) NULL,
	CONSTRAINT emr_order_item_unique UNIQUE (id),
	CONSTRAINT emr_order_item_emr_order_fk FOREIGN KEY (order_id) REFERENCES emr_back.emr_order(id)
);

-- Permissions

ALTER TABLE emr_back.emr_order_item OWNER TO sinouser1;
GRANT ALL ON TABLE emr_back.emr_order_item TO sinouser1;


-- emr_back.emr_outpatient_obs definition

-- Drop table

-- DROP TABLE emr_back.emr_outpatient_obs;

CREATE TABLE emr_back.emr_outpatient_obs (
	id varchar(80) NULL,
	patient_id varchar(80) NULL,
	serial_number varchar(100) NULL,
	patient_name varchar(100) NULL,
	id_card_type_code varchar(2) NULL,
	id_card_type_name varchar(20) NULL,
	id_card varchar(50) NULL,
	allergy_his_flag varchar(1) NULL,
	allergy_his text NULL,
	outpatient_date timestamp(6) NULL,
	inital_diagnosis_code varchar(1) NULL,
	chief_complaint text NULL,
	present_illness_his text NULL,
	past_illness_his text NULL,
	physical_examination text NULL,
	observation_result text NULL,
	studies_summary_result text NULL,
	wm_diagnosis_code varchar(400) NULL,
	wm_diagnosis_name varchar(400) NULL,
	tcm_inital_diagnosis_code varchar(250) NULL,
	tcm_inital_diagnosis_name varchar(250) NULL,
	tcm_inital_syndrome_code varchar(250) NULL,
	tcm_inital_syndrome_name varchar(250) NULL,
	differentiation_basis varchar(100) NULL,
	treatment varchar(100) NULL,
	course text NULL,
	observation_date timestamp(6) NULL,
	notes text NULL,
	org_code varchar(9) NULL,
	org_name varchar(100) NULL,
	dept_code varchar(40) NULL,
	dept_name varchar(100) NULL,
	operator_id varchar(40) NULL,
	operation_time timestamp(6) NULL,
	invalid_flag varchar(1) NULL,
	data_status varchar(4) NULL,
	create_date timestamp(6) NULL,
	CONSTRAINT emr_outpatient_obs_unique UNIQUE (id),
	CONSTRAINT emr_outpatient_obs_emr_patient_info_fk FOREIGN KEY (patient_id) REFERENCES emr_back.emr_patient_info(id)
);
CREATE INDEX emr_outpatient_obs_patient_id_idx ON emr_back.emr_outpatient_obs USING btree (patient_id, serial_number, id_card, patient_name);

-- Permissions

ALTER TABLE emr_back.emr_outpatient_obs OWNER TO sinouser1;
GRANT ALL ON TABLE emr_back.emr_outpatient_obs TO sinouser1;


-- emr_back.emr_outpatient_record definition

-- Drop table

-- DROP TABLE emr_back.emr_outpatient_record;

CREATE TABLE emr_back.emr_outpatient_record (
	id varchar(80) NULL,
	patient_id varchar(80) NULL,
	serial_number varchar(100) NULL,
	patient_name varchar(100) NULL,
	id_card_type_code varchar(2) NULL,
	id_card_type_name varchar(20) NULL,
	id_card varchar(50) NULL,
	allergy_his_flag varchar(1) NULL,
	allergy_his text NULL,
	outpatient_date timestamp(6) NULL,
	inital_diagnosis_code varchar(1) NULL,
	chief_complaint text NULL,
	present_illness_his text NULL,
	past_illness_his text NULL,
	infection_his text NULL,
	vaccination_his text NULL,
	operation_his text NULL,
	blood_transfusion text NULL,
	personal_his text NULL,
	marital_his text NULL,
	menstrual_his text NULL,
	family_his text NULL,
	physical_examination text NULL,
	observation_result text NULL,
	studies_summary_result text NULL,
	wm_diagnosis_code varchar(400) NULL,
	wm_diagnosis_name varchar(400) NULL,
	tcm_inital_diagnosis_code varchar(250) NULL,
	tcm_inital_diagnosis_name varchar(250) NULL,
	tcm_inital_syndrome_code varchar(250) NULL,
	tcm_inital_syndrome_name varchar(250) NULL,
	differentiation_basis varchar(100) NULL,
	treatment varchar(100) NULL,
	org_code varchar(9) NULL,
	org_name varchar(100) NULL,
	dept_code varchar(40) NULL,
	dept_name varchar(100) NULL,
	operator_id varchar(40) NULL,
	operation_time timestamp(6) NULL,
	invalid_flag varchar(1) NULL,
	data_status varchar(4) NULL,
	create_date timestamp(6) NULL,
	CONSTRAINT emr_outpatient_record_unique UNIQUE (id),
	CONSTRAINT emr_outpatient_record_emr_patient_info_fk FOREIGN KEY (patient_id) REFERENCES emr_back.emr_patient_info(id)
);
CREATE INDEX emr_outpatient_record_patient_id_idx ON emr_back.emr_outpatient_record USING btree (patient_id, serial_number, patient_name, id_card);

-- Permissions

ALTER TABLE emr_back.emr_outpatient_record OWNER TO sinouser1;
GRANT ALL ON TABLE emr_back.emr_outpatient_record TO sinouser1;


-- emr_back.emr_vital_signs_record definition

-- Drop table

-- DROP TABLE emr_back.emr_vital_signs_record;

CREATE TABLE emr_back.emr_vital_signs_record (
	id varchar(80) NULL,
	patient_id varchar(80) NULL,
	activity_type_code varchar(2) NULL,
	activity_type_name varchar(20) NULL,
	serial_number varchar(100) NULL,
	patient_name varchar(100) NULL,
	id_card_type_code varchar(2) NULL,
	id_card_type_name varchar(20) NULL,
	id_card varchar(50) NULL,
	create_date timestamp(6) NULL,
	ventilatorused_code varchar(2) NULL,
	ventilatorused_name varchar(2) NULL,
	critical_care_code varchar(2) NULL,
	critical_care_name varchar(2) NULL,
	org_code varchar(9) NULL,
	org_name varchar(100) NULL,
	dept_code varchar(40) NULL,
	dept_name varchar(100) NULL,
	operator_id varchar(40) NULL,
	operation_time timestamp(6) NULL,
	invalid_flag varchar(2) NULL,
	CONSTRAINT emr_vital_signs_record_unique UNIQUE (id),
	CONSTRAINT emr_vital_signs_record_emr_patient_info_fk FOREIGN KEY (patient_id) REFERENCES emr_back.emr_patient_info(id)
);

-- Permissions

ALTER TABLE emr_back.emr_vital_signs_record OWNER TO sinouser1;
GRANT ALL ON TABLE emr_back.emr_vital_signs_record TO sinouser1;




-- Permissions

GRANT ALL ON SCHEMA emr_back TO sinouser1;