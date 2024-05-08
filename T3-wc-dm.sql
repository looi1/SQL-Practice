--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-wc-dm.sql

--Student ID: 32439180
--Student Name: Looi Teck San
--Unit Code: fit3171
--Applied Class No: 1

/* Comments for your marker:




*/

--3(a)
Drop Sequence passenger_seq;
Create Sequence passenger_seq start with 100 increment by 1;

Drop Sequence manifest_seq;
Create Sequence manifest_seq start with 100 increment by 1;


--3(b)
INSERT INTO passenger VALUES (
    passenger_seq.nextval,
    'Dominik',
    'Davies',
    to_date('21/10/1980','dd/mm/yyyy'),
    'M',
    '0493336312',
    null
);

INSERT INTO passenger VALUES (
    passenger_seq.nextval,
    'Henrietta',
    'Davies',
    to_date('15/05/2010','dd/mm/yyyy'),
    'F',
    null,
    (select passenger_id from passenger where upper(passenger_fname) = upper('Dominik') and upper(passenger_lname) = upper('Davies') and passenger_contact='0493336312')

);

INSERT INTO passenger VALUES (
    passenger_seq.nextval,
    'Poppy',
    'Davies',
    to_date('21/01/2008','dd/mm/yyyy'),
    'F',
    null,
   (select passenger_id from passenger where upper(passenger_fname) = upper('Dominik') and upper(passenger_lname) = upper('Davies') and passenger_contact='0493336312')
);
commit;

INSERT INTO manifest VALUES (
    manifest_seq.nextval,
    (select passenger_id from passenger where upper(passenger_fname) = upper('Dominik') and upper(passenger_lname) = upper('Davies')and passenger_contact='0493336312'),
    (select cruise_id from cruise where upper(cruise_name) = upper('Melbourne to Auckland')),
    null,
    (select ship_code from cruise where upper(cruise_name) = upper('Melbourne to Auckland')),
    210);


INSERT INTO manifest VALUES (
    manifest_seq.nextval,
    (select passenger_id from passenger where upper(passenger_fname) = upper('Henrietta') and upper(passenger_lname) = upper('Davies') and guardian_id = (select passenger_id from passenger where passenger_contact='0493336312' )),
    (select cruise_id from cruise where upper(cruise_name) = upper('Melbourne to Auckland')),
    null,
    (select ship_code from cruise where upper(cruise_name) = upper('Melbourne to Auckland')),
    210);

INSERT INTO manifest VALUES (
    manifest_seq.nextval,
    (select passenger_id from passenger where upper(passenger_fname) = upper('Poppy') and upper(passenger_lname) = upper('Davies')and guardian_id = (select passenger_id from passenger where passenger_contact='0493336312' )),
    (select cruise_id from cruise where upper(cruise_name) = upper('Melbourne to Auckland')),
    null,
    (select ship_code from cruise where upper(cruise_name) = upper('Melbourne to Auckland')),
    210);

commit;

--3(c)
Delete from manifest where passenger_id = (select passenger_id from passenger where upper(passenger_fname) = upper('Poppy') and upper(passenger_lname) = upper('Davies')and guardian_id = (select passenger_id from passenger where passenger_contact='0493336312' )); 
commit;
--cabin_no = (select cabin_no from cabin where cabin_capacity =2 and upper(cabin_class) = upper('o'))
Update manifest set cabin_no = 113
Where passenger_id = (select passenger_id from passenger where upper(passenger_fname) = upper('Dominik') and upper(passenger_lname) = upper('Davies')and passenger_contact='0493336312' );

Update manifest set cabin_no = 113
Where passenger_id = (select passenger_id from passenger where upper(passenger_fname) = upper('Henrietta') and upper(passenger_lname) = upper('Davies')and guardian_id = (select passenger_id from passenger where passenger_contact='0493336312' ));

commit;



--3(d)
Delete from manifest where passenger_id = (select passenger_id from passenger where upper(passenger_fname) = upper('Dominik') and upper(passenger_lname) = upper('Davies')and passenger_contact='0493336312');
Delete from manifest where passenger_id = (select passenger_id from passenger where upper(passenger_fname) = upper('Henrietta') and upper(passenger_lname) = upper('Davies')and guardian_id = (select passenger_id from passenger where passenger_contact='0493336312' )); 


commit;
