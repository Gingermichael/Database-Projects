create table clients
(client_id varchar2(6),
client_first_name varchar2(20),
client_last_name varchar2(20),
diagnosis varchar2(120),
SSN char(11),
gender varchar2(10),
client_type char(3),
DOB date,
medications varchar2(200),
school_status varchar2(20),
crisis_bed_status varchar2(20),
constraint client_client_id_pk primary key(client_id));


create table apartment
(apartment_id varchar2(6),
apartment_address varchar2(60),
apartment_number number(4),
city varchar2(20),
state varchar2(2),
zip_code varchar2(5),
condition varchar2(30),
constraint apartment_apartment_id_pk primary key(apartment_id));


create table staff
(staff_id varchar2(6),
staff_type varchar2(30),
staff_first_name varchar2(20),
staff_last_name varchar2(20),
constraint staff_staff_id_pk primary key(staff_id));


create table classes_services
(cs_id varchar2(6),
class_service_type varchar2(40),
class_service_date date,
class_service_time char(5),
constraint classes_services_cs_id_pk primary key(cs_id));


create table attendance
(attendance_id varchar2(6),
client_id varchar2(6),
cs_id varchar2(6),
client_activity number(20),
contact_activity number(20),
inside_or_outside_th varchar(7),
attendance_type varchar2(60),
constraint attendence_attendance_id_pk primary key(attendance_id),
constraint attendance_client_id_fk FOREIGN KEY (client_id)REFERENCES clients(client_id),
constraint attendance_cs_id_fk FOREIGN KEY (cs_id)REFERENCES classes_services(cs_id));


create table contacts
(contact_id varchar2(6),
attendance_id varchar2(6),
contact_first_name varchar2(20),
contact_last_name varchar2(20),
constraint contacts_contact_id_pk primary key(contact_id),
constraint contacts_attendance_id_fk FOREIGN KEY (attendance_id)REFERENCES attendance(attendance_id));


create table income_expenditure
(ie_id varchar2(6),
staff_id varchar2(6),
cop_expenditures number,
tlp_expenditures number,
tlp_client_fees number,
granting_agency varchar2(60),
grant_amount number,
donor_first_name varchar2(20),
donor_last_name varchar2(20),
donation_description varchar2(60),
donation_value number,
constraint income_expenditure_ie_id_pk primary key(ie_id),
constraint income_expenditure_staff_id_fk FOREIGN KEY (staff_id)REFERENCES staff(staff_id));


create table shift
(shift_id varchar2(6),
cs_id varchar2(6),
staff_id varchar(6),
task_role varchar2(30),
shift_hours number,
constraint shift_shift_id_pk primary key(shift_id),
constraint shift_cs_id_fk FOREIGN KEY (cs_id)REFERENCES classes_services(cs_id),
constraint shift_staff_id_fk FOREIGN KEY (staff_id)REFERENCES staff(staff_id));


create table cop
(cop_entry_id varchar2(9),
client_id varchar2(6),
services_provided varchar2(60),
date_provided date,
tlp_graduation_date date,
constraint cop_cop_entry_id_pk primary key(cop_entry_id),
constraint cop_client_id_fk FOREIGN KEY (client_id)REFERENCES clients(client_id));


create table tlp
(client_id varchar2(6),
interview_date date,
join_date date,
screening_form_submission varchar2(16),
doctor_first_name varchar2(20),
doctor_last_name varchar2(20),
doctor_phone_number varchar2(12),
attendance_standing varchar2(4),
deposit_paid varchar2(3),
fees_paid varchar2(3),
constraint tlp_client_id_pk primary key(client_id),
constraint tlp_client_id_fk FOREIGN KEY (client_id)REFERENCES clients(client_id));

create table weekly_meeting
(meeting_id varchar2(6),
client_id varchar2(6),
staff_id varchar(6),
meeting_date date,
work_related_skills number(1),
money_management number(1),
hygiene number(1),
medical_care number(1),
self_esteem number(1),
medication_compliance number(1),
healthy_social_interactions number(1),
symptom_reduction number(1),
reduction_of_isolation number(1),
experience_enjoyment number(1),
ability_to_cope number(1),
progress_notes varchar2(120),
constraint meeting_client_id_fk FOREIGN KEY (client_id)REFERENCES clients(client_id),
constraint meeting_staff_id_fk FOREIGN KEY (staff_id)REFERENCES staff(staff_id));

/*START OF CLIENTS*/

insert into clients 
values ('1001', 'Adrian', 'Peterson', 'Depression', 
'420-69-2012', 'Male', 'TLP', '21-MAR-85', 'Esocitalopram 20mg', 'not in', 'not in');

insert into clients 
values ('1002', 'Alicia', 'Keys', 'Anxiety', 
'123-45-6789', 'Female', 'TLP', '25-JAN-81', 'Xanax 10mg', 'not in', 'not in');

insert into clients 
values ('1003', 'Bill', 'Nye', 'Schizophrenia', 
'111-22-3333', 'Male', 'TLP', '27-NOV-55', 'Clozapine 10mg', 'not in', 'in');

insert into clients 
values ('1004', 'Jimmy', 'Fallon', 'Depression', 
'123-69-2012', 'Male', 'TLP', '19-SEP-74', 'Esocitalopram 10mg', 'not in', 'not in');

insert into clients 
values ('1005', 'Taylor', 'Swift', 'Post Traumatic Stress Disorder', 
'420-11-1012', 'Female', 'TLP', '13-DEC-89', 'Ativan 20mg', 'not in', 'in');

insert into clients 
values ('1006', 'Billie', 'Eilish', 'Depression', 
'420-99-0101', 'Female', 'TLP', '18-DEC-01', 'Zoloft 20mg', 'in', 'not in');

insert into clients 
values ('1007', 'Lebron', 'James', 'Anxiety', 
'420-23-1984', 'Male', 'TLP', '30-DEC-84', 'Xanax 20mg', 'not in', 'not in');

insert into clients 
values ('1008', 'Amber', 'Heard', 'Schizophrenia', 
'666-22-1986', 'Female', 'TLP', '22-APR-86', 'Risperidone 30mg', 'not in', 'in');

insert into clients 
values ('1009', 'North', 'West', 'Anorexia Nervosa', 
'808-36-8008', 'Female', 'COP', '15-JUN-13', null, 'in', 'not in');

insert into clients 
values ('1010', 'Kanye', 'West', 'Borderline Personality Disorder', 
'808-69-2012', 'Male', 'COP', '08-Jun-77', 'Risperidone 20mg', 'not in', 'not in');

insert into clients 
values ('1011', 'Kim', 'Kardashian', 'Antisocial Personality Disorder', 
'666-36-8008', 'Female', 'COP', '21-OCT-80', 'Lithium 10mg', 'not in', 'not in');


/*END OF CLIENTS*/


/*START OF STAFF*/

insert into staff
values ('2001', 'Executive Director', 'Bonnie', 'Peruttzi');

insert into staff
values ('2002', 'Business Manager', 'Ilene', 'Dicksion');

insert into staff
values ('2003', 'Clinical Director', 'Katie', 'Bottoms');

insert into staff
values ('2004', 'Recovery Coordinator', 'Jessica', 'Williams');

insert into staff
values ('2005', 'Recovery Coordinator', 'Candice', 'Patterson');


/*END OF STAFF*/


/*START OF APARTMENT*/

insert into apartment
values ('3001', '2209 4th Street', '203', 'Norman', 'OK', '73069', 'Excellent');

insert into apartment
values ('3002', '2209 4th Street', '204', 'Norman', 'OK', '73069', 'Good');

insert into apartment
values ('3003', '2209 4th Street', '205', 'Norman', 'OK', '73069', 'Bad');

insert into apartment
values ('3004', '2209 4th Street', '206', 'Norman', 'OK', '73069', 'Terrible');


/*END OF APARTMENT*/


/*START OF COP*/

insert into cop
values ('10000', '1009', 'Supportive Counseling', '09-JUL-20', null);

insert into cop
values ('10001', '1009', 'Social/Recreational', '20-AUG-20', null);

insert into cop
values ('10002', '1009', 'Crisis Intervention/Social', '11-JUN-20', null);

insert into cop
values ('10003', '1010', 'Supportive Counseling', '09-JUL-20', null);

insert into cop
values ('10004', '1010', 'Social/Recreational', '20-AUG-20', null);

insert into cop
values ('10005', '1010', 'Crisis Intervention/Social', '03-MAR-20', null);

insert into cop
values ('10006', '1010', 'Crisis Intervention/Social', '11-JUN-20', null);

insert into cop
values ('10007', '1011', 'Grocery Shopping', '11-JUN-20', '02-JAN-20');

insert into cop
values ('10008', '1011', 'Community Living Support', '12-JUL-20', '02-JAN-20');

insert into cop
values ('10009', '1011', 'Crisis Intervention/Social', '20-JUL-20', '02-JAN-20');
 
/*END OF COP*/


/*START OF TLP*/

insert into tlp
values ('1001', '01-JUN-19', '09-JUL-19', 'Submitted', 'Michael', 'Scott', '405-591-2300', 'good', 'yes', 'yes');

 insert into tlp
values ('1002', '10-JAN-19', '21-FEB-19', 'Submitted', 'Jim', 'Halpert', '405-534-2780', 'good', 'yes', 'yes');

insert into tlp
values ('1003', '21-MAR-20', '03-APR-20', 'Submitted', 'Dwight', 'Schrute', '405-674-9001', 'bad', 'no', 'no');

insert into tlp
values ('1004', '23-OCT-20', '06-NOV-20', 'Submitted', 'Pam', 'Beesly', '405-776-1233', 'bad', 'yes', 'no');

insert into tlp
values ('1005', '07-AUG-20', '21-AUG-20', 'Submitted', 'Kevin', 'Malone', '405-223-9874', 'good', 'no', 'yes');

insert into tlp
values ('1006', '09-JUN-20', '12-JUL-20', 'Submitted', 'Angela', 'Martin', '405-751-0098', 'good', 'yes', 'no');

insert into tlp
values ('1007', '14-MAR-20', '01-APR-20', 'Not Submitted', 'Holly', 'Flax', '405-234-9854', 'bad', 'no', 'yes');

insert into tlp
values ('1008', '20-DEC-20', '08-JAN-21', 'Not Submitted', 'Jan', 'Levinson', '405-136-8462', 'good', 'no', 'no');

/*END OF TLP*/


/*START OF INCOME EXPENDITURES*/

insert into income_expenditure
values ('20000', '2001', null, null, null, null, null, 'Bob', 'Shahan', 'Consultation with staff', 300.0);

insert into income_expenditure
values ('20001', '2001', null, null, null, null, null, 'Becky', 'Fleming', null, 200.0);

insert into income_expenditure
values ('20002', '2001', null, null, null, null, null, 'Chet', 'Bynum', '4th of July Pillowcases', 50.0);

insert into income_expenditure
values ('20003', '2001', null, null, null, null, null, 'Maureen', 'Bynum', '4th of July Pillowcases', 50.0);

insert into income_expenditure
values ('20004', '2001', 5456.44, null, null, null, null, null, null, null, null);

insert into income_expenditure
values ('20005', '2001', null, 20348.17, null, null, null, null, null, null, null);

insert into income_expenditure
values ('20006', '2001', null, null, 50.0, null, null, null, null, null, null);

insert into income_expenditure
values ('20007', '2001', null, null, 50.0, 'United Way', 5000.0, null, null, null, null);

insert into income_expenditure
values ('20008', '2001', null, null, 50.0, 'State Department of Mental Health', 10000.0, null, null, null, null);

insert into income_expenditure
values ('20009', '2001', null, null, 50.0, 'Caden Miller Foundation', 1500.0, null, null, null, null);

insert into income_expenditure
values ('20010', '2001', null, null, null, null, null, 'Dominic', 'Thoele', 'A Priceless Kiss', 0.0);

/*END OF INCOME EXPENDITURES*/


/*START OF WEEKLY MEETING*/

insert into weekly_meeting
values ('30000', '1001', '2004', '07-FEB-21', 2, 2, 1, 3, 2, 1, 3, 2, 1, 2, 3, 
'Adrian is doing a little better. Mainly improvements in social interactions and coping.');

 insert into weekly_meeting
values ('30001', '1001', '2004', '14-FEB-21', 3, 3, 2, 3, 3, 2, 4, 3, 2, 3, 4, 
'Adrian is doing so much better. Improvements in all categories. Hoping we can get into COP soon!');

insert into weekly_meeting
values ('30002', '1002', '2004', '07-FEB-21', 2, 3, 2, 3, 2, 2, 2, 3, 1, 3, 2, 
'Alicia is doing well. Steady improvements in most areas.');

 insert into weekly_meeting
values ('30003', '1002', '2004', '14-FEB-21', 3, 3, 3, 4, 3, 2, 3, 4, 2, 3, 3, 
'Alicia is extremely well. Improvements in almost all categories. Wants to work on isolation reduction.');

insert into weekly_meeting
values ('30004', '1003', '2004', '07-FEB-21', 2, 2, 2, 3, 2, 3, 2, 2, 3, 3, 2, 
'Bill is doing alright for now. Hoping to see some improvement in the near future.');

 insert into weekly_meeting
values ('30005', '1003', '2004', '14-FEB-21', 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 
'Bill moved to the crisis bed this week. Things are going fairly rough for him right now.');

insert into weekly_meeting
values ('30006', '1004', '2004', '07-FEB-21', 4, 4, 3, 3, 3, 4, 3, 2, 3, 2, 3, 
'Jimmy is great this week. Hoping to get into COP if improvement continues.');

 insert into weekly_meeting
values ('30007', '1004', '2004', '14-FEB-21', 2, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 
'Jimmy had a bit of a fall this last week. He is a little upset about it, but plans to work on improving again.');

insert into weekly_meeting
values ('30008', '1005', '2005', '07-FEB-21', 2, 3, 2, 3, 2, 2, 3, 2, 3, 2, 3, 
'Taylor is doing okay. It would be nice to see some improvement by next week for sure though.');

 insert into weekly_meeting
values ('30009', '1005', '2005', '14-FEB-21', 1, 2, 1, 2, 1, 2, 1, 1, 1, 1, 2, 
'Taylor entered the crisis bed last night. She seems to be rather unwell for the time being.');

insert into weekly_meeting
values ('30002', '1006', '2005', '07-FEB-21', 2, 3, 2, 3, 3, 2, 3, 2, 3, 3, 2,
'Billie is doing okay. We are aiming for steady improvement in many areas this week.');

 insert into weekly_meeting
values ('30010', '1006', '2005', '14-FEB-21', 2, 3, 2, 3, 2, 2, 3, 2, 3, 3, 2, 
'Billie is doing alright. She was unable to make many improvements since last week.');

insert into weekly_meeting
values ('30011', '1007', '2005', '07-FEB-21', 4, 4, 3, 3, 4, 3, 3, 4, 3, 4, 4, 
'Lebron is excellent. If we can get some improvement in this coming week we will consider graduation to COP.');

 insert into weekly_meeting
values ('30012', '1007', '2005', '14-FEB-21', 4, 4, 4, 4, 4, 3, 4, 4, 3, 4, 4, 
'Lebron maintaining his great improvement. We will likely graduate him very soon.');

insert into weekly_meeting
values ('30013', '1008', '2005', '07-FEB-21', 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 
'Amber is doing extremely poorly. She was moved into crisis bed early this week and has not improved since.');

 insert into weekly_meeting
values ('30014', '1008', '2005', '14-FEB-21', 1, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 
'Amber is still in crisis bed this week. No improvements to record.');

/*END OF WEEKLY MEETING*/


/*START OF CLASSES_SERVICES*/

insert into classes_services
(cs_id, class_service_type, class_service_date, class_service_time)
values (2041, 'Social/ Recreational', to_date('3-11-2021', 'DD-MM-YYYY'), '13:27');

insert into classes_services
(cs_id, class_service_type, class_service_date, class_service_time)
values (2042, 'Grocery Shopping', to_date('8-11-2021', 'DD-MM-YYYY'), '13:00');

insert into classes_services
(cs_id, class_service_type, class_service_date, class_service_time)
values (2043, 'Grocery Shopping', to_date('9-11-2021', 'DD-MM-YYYY'), '13:00');

insert into classes_services
(cs_id, class_service_type, class_service_date, class_service_time)
values (2044, 'Grocery Shopping', to_date('10-11-2021', 'DD-MM-YYYY'), '13:00');

insert into classes_services
(cs_id, class_service_type, class_service_date, class_service_time)
values (2045, 'Time Management and Goal Setting Group', to_date('22-11-2021', 'DD-MM-YYYY'), '10:00');

insert into classes_services
(cs_id, class_service_type, class_service_date, class_service_time)
values (2046, 'Life Management Skills Group', to_date('23-11-2021', 'DD-MM-YYYY'), '10:00');

insert into classes_services
(cs_id, class_service_type, class_service_date, class_service_time)
values (2047, 'Wellness Group', to_date('24-11-2021', 'DD-MM-YYYY'), '14:00');

insert into classes_services
(cs_id, class_service_type, class_service_date, class_service_time)
values (2048, 'Cleaning Skills/ Apt. Inspection Group', to_date('25-11-2021', 'DD-MM-YYYY'), '10:00');

insert into classes_services
(cs_id, class_service_type, class_service_date, class_service_time)
values (2049, 'Life Management Skills', to_date('26-11-2021', 'DD-MM-YYYY'), '10:00');

/*END OF CLASSES_SERVICES*/


/*START OF ATTENDANCE*/

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (1, 1009, 2041, 1, 0, 'inside', 'service');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (2, 1009, 2042, 1, 0, 'outside', 'service');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (3, 1010, 2043, 1, 2, 'outside', 'service');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (4, 1011, 2044, 1, 0, 'outside', 'service');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (5, 1001, 2045, 1, 1, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (6, 1002, 2045, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (7, 1003, 2045, 1, 2, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (8, 1004, 2045, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (9, 1005, 2045, 1, 3, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (10, 1006, 2045, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (11, 1007, 2045, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (12, 1008, 2045, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (13, 1001, 2046, 1, 1, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (14, 1002, 2046, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (15, 1003, 2046, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (16, 1004, 2046, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (17, 1005, 2046, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (18, 1006, 2046, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (19, 1007, 2046, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (20, 1008, 2046, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (21, 1001, 2047, 1, 1, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (22, 1002, 2047, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (23, 1003, 2047, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (24, 1004, 2047, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (25, 1005, 2047, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (26, 1006, 2047, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (27, 1007, 2047, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (28, 1008, 2047, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (29, 1001, 2048, 1, 1, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (30, 1002, 2048, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (31, 1003, 2048, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (32, 1004, 2048, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (33, 1005, 2048, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (34, 1006, 2048, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (35, 1007, 2048, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (36, 1008, 2048, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (37, 1001, 2049, 1, 1, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (38, 1002, 2049, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (39, 1003, 2049, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (40, 1004, 2049, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (41, 1005, 2049, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (42, 1006, 2049, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (43, 1007, 2049, 1, 0, 'inside', 'class');

insert into attendance
(attendance_id, client_id, cs_id, client_activity, contact_activity, inside_or_outside_th, attendance_type)
values (44, 1008, 2049, 1, 0, 'inside', 'class');

/*END OF ATTENDANCE*/


/*START OF SHIFT*/

insert into shift
(shift_id, cs_id, staff_id, task_role, shift_hours)
values (1, 2041, 2005, 'Consultation', 2);

insert into shift
(shift_id, cs_id, staff_id, task_role, shift_hours)
values (2, 2045, 2004, 'Meeting', 2);

insert into shift
(shift_id, cs_id, staff_id, task_role, shift_hours)
values (3, 2045, 2004, 'Documentation/ Preparation', 4);

insert into shift
(shift_id, cs_id, staff_id, task_role, shift_hours)
values (4, 2046, 2005, 'Meeting', 2);

insert into shift
(shift_id, cs_id, staff_id, task_role, shift_hours)
values (5, 2046, 2005, 'Documentation/ Preparation', 4);

insert into shift
(shift_id, cs_id, staff_id, task_role, shift_hours)
values (6, 2047, 2004, 'Meeting', 2);

insert into shift
(shift_id, cs_id, staff_id, task_role, shift_hours)
values (7, 2047, 2004, 'Documentation/ Preparation', 4);

insert into shift
(shift_id, cs_id, staff_id, task_role, shift_hours)
values (8, 2048, 2005, 'Meeting', 2);

insert into shift
(shift_id, cs_id, staff_id, task_role, shift_hours)
values (9, 2048, 2005, 'Documentation/ Preparation', 4);

insert into shift
(shift_id, cs_id, staff_id, task_role, shift_hours)
values (10, 2049, 2003, 'Meeting', 2);

insert into shift
(shift_id, cs_id, staff_id, task_role, shift_hours)
values (11, 2049, 2003, 'Documentation/ Preparation', 4);

insert into shift
(shift_id, cs_id, staff_id, task_role, shift_hours)
values (12, NULL, 2001, 'Administrative', 8);

insert into shift
(shift_id, cs_id, staff_id, task_role, shift_hours)
values (13, NULL, 2002, 'Administrative', 8);

/*END OF SHIFT*/




/*START OF CONTACTS*/

insert into contacts
(contact_id, attendance_id, contact_first_name, contact_last_name)
values (1, 3, 'William', 'Smith');

insert into contacts
(contact_id, attendance_id, contact_first_name, contact_last_name)
values (2, 3, 'Jay', 'Broadus');

insert into contacts
(contact_id, attendance_id, contact_first_name, contact_last_name)
values (3, 5, 'Dale', 'Wolfe');

insert into contacts
(contact_id, attendance_id, contact_first_name, contact_last_name)
values (4, 7, 'Laura', 'Lockett');

insert into contacts
(contact_id, attendance_id, contact_first_name, contact_last_name)
values (5, 7, 'Jason', 'Peel');

insert into contacts
(contact_id, attendance_id, contact_first_name, contact_last_name)
values (6, 9, 'Daniel', 'Bailey');

insert into contacts
(contact_id, attendance_id, contact_first_name, contact_last_name)
values (7, 9, 'James', 'Simonsen');

insert into contacts
(contact_id, attendance_id, contact_first_name, contact_last_name)
values (8, 9, 'Amie', 'Holt');

insert into contacts
(contact_id, attendance_id, contact_first_name, contact_last_name)
values (9, 13, 'Dale', 'Wolfe');

insert into contacts
(contact_id, attendance_id, contact_first_name, contact_last_name)
values (10, 21, 'Dale', 'Wolfe');

insert into contacts
(contact_id, attendance_id, contact_first_name, contact_last_name)
values (11, 29, 'Dale', 'Wolfe');

insert into contacts
(contact_id, attendance_id, contact_first_name, contact_last_name)
values (12, 37, 'Dale', 'Wolfe');

/*END OF CONTACTS*/

commit;

/*drop table weekly_meeting CASCADE CONSTRAINTS;
drop table cop CASCADE CONSTRAINTS;
drop table tlp CASCADE CONSTRAINTS;
drop table contacts CASCADE CONSTRAINTS;
drop table attendance CASCADE CONSTRAINTS;
drop table income_expenditure CASCADE CONSTRAINTS;
drop table shift CASCADE CONSTRAINTS;
drop table classes_services CASCADE CONSTRAINTS;
drop table apartment CASCADE CONSTRAINTS;
drop table staff CASCADE CONSTRAINTS;
drop table clients CASCADE CONSTRAINTS;
commit;*/

