CREATE TABLE lab(
    labID int not null primary identity,
    patientId int not null foreign key references patient(patientId),
    diagnosisId into not null foreign key references diagnosis(diagnosisId)
)

CREATE TABLE happyPatient(
    patientId int not null primary key foreign key references patient (patientid),
    happinessLevel numeric (10.5)
)