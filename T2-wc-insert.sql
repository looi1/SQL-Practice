--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-wc-insert.sql

--Student ID: 32439180
--Student Name: Looi Teck San
--Unit Code: fit3171
--Applied Class No:1

/* Comments for your marker:




*/
-- Task 2 Load the PASSENGER and MANIFEST tables with your own
-- test data following the data requirements expressed in the brief

-- =======================================
-- PASSENGER
-- =======================================
INSERT INTO passenger VALUES (
    1,
    'Looi',
    'Teck San',
    to_date('01/01/2002','dd/mm/yyyy'),
    'M',
    '0121231234',
    null
);

INSERT INTO passenger VALUES (
    2,
    'Kelly',
    'Clarkson',
    to_date('01/02/2006','dd/mm/yyyy'),
    'F',
    null,
    1
);

INSERT INTO passenger VALUES (
    3,
    'Nicole',
    'David',
    to_date('13/03/1980','dd/mm/yyyy'),
    'F',
    '0123456789',
    null
);

INSERT INTO passenger VALUES (
    4,
    'Tan',
    'Xiao Ming',
    to_date('20/05/2010','dd/mm/yyyy'),
    'M',
    null,
    3
);

INSERT INTO passenger VALUES (
    5,
    'Jay',
    'Chou',
    to_date('15/01/1990','dd/mm/yyyy'),
    'M',
    '0123987456',
    null
);

INSERT INTO passenger VALUES (
    6,
    'Li',
    'Rong Hao',
    to_date('17/02/2011','dd/mm/yyyy'),
    'M',
    null,
    5
);

INSERT INTO passenger VALUES (
    7,
    'Wang',
    'Li Hong',
    to_date('21/06/1975','dd/mm/yyyy'),
    'M',
    '0122156891',
    null
);

INSERT INTO passenger VALUES (
    8,
    'Wang',
    'Lily',
    to_date('15/08/2021','dd/mm/yyyy'),
    'F',
    null,
    7
);

INSERT INTO passenger VALUES (
    9,
    'Wang',
    'Jun Jie',
    to_date('15/08/2014','dd/mm/yyyy'),
    'M',
    null,
    7
);

INSERT INTO passenger VALUES (
    10,
    'Peter',
    'Kelvin',
    to_date('21/10/1970','dd/mm/yyyy'),
    'M',
    '7543168381',
    null
);

INSERT INTO passenger VALUES (
    11,
    'Harry',
    'Potter',
    to_date('25/12/1981','dd/mm/yyyy'),
    'M',
    '6846114523',
    null
);

INSERT INTO passenger VALUES (
    12,
    'Hermione',
    'Granger',
    to_date('15/04/1990','dd/mm/yyyy'),
    'F',
    '4479957953',
    null
);

INSERT INTO passenger VALUES (
    13,
    'Ron',
    'Weasley',
    to_date('01/03/1980','dd/mm/yyyy'),
    'M',
    '0160682155',
    null
);

INSERT INTO passenger VALUES (
    14,
    'Albus',
    'Dumbledore',
    to_date('01/03/1965','dd/mm/yyyy'),
    'M',
    '0194697734',
    null
);

INSERT INTO passenger VALUES (
    15,
    'Credence',
    'Albus',
    to_date('19/09/2005','dd/mm/yyyy'),
    'M',
    null,
    14
);

commit;
-- =======================================
-- MANIFEST
--select * from cruise;
--select * from cabin where ship_code = 105;
--select * from manifest;

INSERT INTO manifest VALUES (
    0000001,
    1,
    1,
    to_date('01/04/2022 11:00 am','dd/mm/yyyy hh:mi am'),
    101,
    1001);

INSERT INTO manifest VALUES (
    0000002,
    2,
    1,
    to_date('01/04/2022 12:15 pm','dd/mm/yyyy hh:mi pm'),
    101,
    1001);

INSERT INTO manifest VALUES (
    0000003,
    3,
    2,
    to_date('16/04/2022 8:05 am','dd/mm/yyyy hh:mi am'),
    102,
    2001);

INSERT INTO manifest VALUES (
    0000004,
    4,
    2,
    to_date('16/04/2022 10:30 am','dd/mm/yyyy hh:mi am'),
    102,
    2001);

INSERT INTO manifest VALUES (
    00000005,
    5,
    2,
    to_date('16/04/2022 4:30 pm','dd/mm/yyyy hh:mi pm'),
    102,
    2002);
    
INSERT INTO manifest VALUES (
    00000006,
    6,
    2,
    to_date('16/04/2022 1:20 pm','dd/mm/yyyy hh:mi pm'),
    102,
    2002);

INSERT INTO manifest VALUES (
    0000007,
    7,
    3,
    to_date('15/04/2022 2:14 pm','dd/mm/yyyy hh:mi pm'),
    103,
    210);

INSERT INTO manifest VALUES (
    0000008,
    8,
    3,
    to_date('15/04/2022 9:15 am','dd/mm/yyyy hh:mi am'),
    103,
    210);

INSERT INTO manifest VALUES (
    0000009,
    9,
    3,
    to_date('15/04/2022 3:15 pm','dd/mm/yyyy hh:mi pm'),
    103,
    210);

--at least 2 passengers completed more than 1 cruise--
INSERT INTO manifest VALUES (
    0000010,
    11,
    4,
    to_date('07/05/2022 2:13 pm','dd/mm/yyyy hh:mi pm'),
    101,
    1011);
    
INSERT INTO manifest VALUES (
    0000011,
    12,
    4,
    to_date('06/05/2022 11:13 am','dd/mm/yyyy hh:mi am'),
    101,
    1012);
    
INSERT INTO manifest VALUES (
    00000012,
    13,
    4,
    to_date('07/05/2022 9:46 am','dd/mm/yyyy hh:mi am'),
    101,
    1011);

INSERT INTO manifest VALUES (
    00000013,
    14,
    5,
    to_date('08/05/2022 11:53 am','dd/mm/yyyy hh:mi am'),
    102,
    2001);
    
INSERT INTO manifest VALUES (
    00000014,
    15,
    5,
    to_date('08/05/2022 12:14 pm','dd/mm/yyyy hh:mi pm'),
    102,
    2001);

INSERT INTO manifest VALUES (
    00000015,
    7,
    5,
    to_date('08/05/2022 11:05 am','dd/mm/yyyy hh:mi am'),
    102,
    2013
    );
    
INSERT INTO manifest VALUES (
    00000016,
    8,
    5,
    to_date('08/05/2022 1:45 pm','dd/mm/yyyy hh:mi pm'),
    102,
    2013);
    
INSERT INTO manifest VALUES (
    00000017,
    9,
    5,
    to_date('08/05/2022 5:31 pm','dd/mm/yyyy hh:mi pm'),
    102,
    2013);
   
INSERT INTO manifest VALUES (
    0000018,
    11,
    6,
    to_date('18/09/2022 3:12 pm','dd/mm/yyyy hh:mi pm'),
    101,
    2001);
    
INSERT INTO manifest VALUES (
    0000019,
    12,
    6,
    to_date('18/09/2022 2:14 pm','dd/mm/yyyy hh:mi pm'),
    101,
    2001);
    
INSERT INTO manifest VALUES (
    00000020,
    13,
    6,
    to_date('18/09/2022 4:16 pm','dd/mm/yyyy hh:mi pm'),
    101,
    2001);   

--at least 2 passengers did not show up
INSERT INTO manifest VALUES (
    00000021,
    10,
    1,
    null,
    101,
    2001);
    
INSERT INTO manifest VALUES (
    00000022,
    14,
    2,
    null,
    102,
    4002);

INSERT INTO manifest VALUES (
    00000023,
    15,
    2,
    null,
    102,
    4002);

INSERT INTO manifest VALUES (
    00000024,
    10,
    6,
    null,
    105,
    8031);
    
--at leaset 2 passengers book future cruise

INSERT INTO manifest VALUES (
    00000025,
    1,
    7,
    null,
    103,
    110);

INSERT INTO manifest VALUES (
    00000026,
    2,
    7,
    null,
    103,
    110);

INSERT INTO manifest VALUES (
    00000027,
    3,
    7,
    null,
    103,
    111);

INSERT INTO manifest VALUES (
    00000028,
    4,
    7,
    null,
    103,
    111);
    
INSERT INTO manifest VALUES (
    0000029,
    5,
    8,
    null,
    105,
    9012);

INSERT INTO manifest VALUES (
    00000030,
    6,
    8,
    null,
    105,
    9012);

commit;

--select * from passenger;
--select * from manifest;

-- =======================================