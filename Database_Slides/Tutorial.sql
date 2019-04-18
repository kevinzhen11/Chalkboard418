CREATE TABLE lab(
    labID int not null primary key identity,
    patientId int not null foreign key references patient(patientId),
    diagnosisId int not null foreign key references diagnosis(diagnosisId)
)

CREATE TABLE happyPatient(
    patientId int not null primary key foreign key references patient (patientId),
    happinessLevel numeric(10,5)  /*Numeric instead of double */
)

CREATE INDEX IX_happyPatient_happinessLevel ON happyPatient(happinessLevel) INCLUDE (patientID)

create table appointment (
	patientId int not null foreign key references patient(patientId)
)


select * from happyPatient where happinessLevel = 5;

alter table patient alter column age numeric (3,1)

SELECT patientID, firstName, lastName, age FROM patient /*drag that sheet*/