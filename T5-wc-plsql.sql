--****PLEASE ENTER YOUR DETAILS BELOW****
--T5-wc-plsql.sql

--Student ID: 32439180
--Student Name: Looi Teck San   
--Unit Code: fit3171
--Applied Class No: 1

/* Comments for your marker:




*/

SET SERVEROUTPUT ON

--5(a) 
-- Sequence to generate cruise_id
DROP SEQUENCE cruise_seq;

CREATE SEQUENCE cruise_seq START WITH 100 INCREMENT BY 1;

--select sysdate, sysdate-to_date('16/10/2023','dd/mm/yyyy') from dual;
-- Complete the procedure below

CREATE OR REPLACE PROCEDURE prc_insert_cruise (
  p_cruise_name IN VARCHAR2,
  p_cruise_description IN VARCHAR2,
  p_ship_code IN NUMBER,
  p_cruise_departure_datetime IN DATE,
  p_cruise_duration IN NUMBER,
  p_depart_port_code IN CHAR,
  p_output OUT VARCHAR2) 
AS
var_ship_found Number;
var_port_found Number;
var_exist_cruise Number;

BEGIN
--find valid ship
select count(*) into var_ship_found From ship Where ship_code = p_ship_code;

--find valid port
select count(*) into var_port_found From port Where upper(port_code) = upper(p_depart_port_code);

--check duplicate
select count(*) into var_exist_cruise from cruise where upper(cruise_name) = p_cruise_name or (ship_code = p_ship_code and cruise_departure_datetime =  p_cruise_departure_datetime);

    if(var_exist_cruise > 0) then p_output := 'This cruise already existed in the system!';
    Else
        if(var_ship_found=0) then p_output := 'invalid ship code, please try again with a valid ship code';
        Else
            if(var_port_found = 0) then p_output := 'invalid port code, please try again with a valid port code';
        
            Else 
                if(sysdate - p_cruise_departure_datetime > -30 ) then p_output := 'the departure date is too short or the date given has passed!';
                Else
                    Insert Into cruise Values(
                    cruise_seq.nextval,
                    p_cruise_name,
                    p_cruise_description,
                    p_ship_code,
                    p_cruise_departure_datetime,
                    p_cruise_duration,
                    0);
                    p_output := 'The new cruise for cruise id ' || cruise_seq.currval || ' has been recorded';
            end if;
           
        end if;
    end if;
end if;
END prc_insert_cruise;
/

-- Write Test Harness for 5(a)

--3 failed test harness--

--invalid ship code
declare output varchar2(100);
begin
 prc_insert_cruise('Brisbane to Singapore','16 Night Bridbane-Singapore Cruise. Starts from Brisbane, cruise to Singapore and ends at Birsbane.',1000,to_date('16/10/2023','dd/mm/yyyy'),16,'AUBNE',output);
 dbms_output.put_line(output);
 end;
 /

 
 --invalid portcode
 declare output varchar2(100);
begin
 prc_insert_cruise('Brisbane to Singapore','16 Night Bridbane-Singapore Cruise. Starts from Brisbane, cruise to Singapore and ends at Birsbane.',101,to_date('16/10/2023','dd/mm/yyyy'),16,'KUL',output);
 dbms_output.put_line(output);
 end;
 /
 
 --invalid date (passed date)
 declare output varchar2(100);
begin
 prc_insert_cruise('Brisbane to Singapore','16 Night Bridbane-Singapore Cruise. Starts from Brisbane, cruise to Singapore and ends at Birsbane.',101,to_date('16/10/2021','dd/mm/yyyy'),22,'NZDUD',output);
 dbms_output.put_line(output);
 end;
 /
 
  --invalid date (too short date)
 declare output varchar2(100);
begin
 prc_insert_cruise('Brisbane to Singapore','16 Night Bridbane-Singapore Cruise. Starts from Brisbane, cruise to Singapore and ends at Birsbane.',101,to_date('20/10/2022','dd/mm/yyyy'),16,'AUBNE',output);
 dbms_output.put_line(output);
 end;
 /
  
  --select * from cruise;
 
 --2 success harness test --
declare output varchar2(100);
begin
 prc_insert_cruise('Brisbane to Singapore','16 Night Bridbane-Singapore Cruise. Starts from Brisbane, cruise to Singapore and ends at Birsbane.',101,to_date('20/10/2023','dd/mm/yyyy'),16,'AUBNE',output);
 dbms_output.put_line(output);
 end;
 /
 
 declare output varchar2(100);
begin
prc_insert_cruise('Dunedin to Hobart','22 Night Dunedin-Hobart Cruise. Starts from Dunedin, cruise to Hobart and ends at Dunedin.',102,to_date('25/12/2022','dd/mm/yyyy'),22,'AUBNE',output);
dbms_output.put_line(output);
end;
/
 
--select * from cruise;
 rollback;

--5(b) 
--Write your trigger statement, 
--finish it with a slash(/) followed by a blank line

create or replace trigger add_cruise_port_chk
before insert on cruise_port
for each row
declare var_datetime Date;
var_duration Number;
var_cruisestartdate Date;
begin

--select date
select cp_datetime into var_datetime From  cruise_port where cp_datetime = (select max(cp_datetime) from cruise_port where cruise_id = :new.cruise_id ) and cruise_id = :new.cruise_id ;

--select duration
select  cruise_duration into var_duration from cruise where cruise_id = :new.cruise_id;

--select cruise start date
select cruise_departure_datetime into var_cruisestartdate from cruise where cruise_id = :new.cruise_id;

    if(:new.cp_datetime < var_datetime ) then
        raise_application_error(-20000,'The date given is not after the latest stop for that particular cruise');
        else 
        if(:new.cp_datetime - var_cruisestartdate > var_duration) then
        raise_application_error(-20010,'The given date is not within the duration of the cruise');
        else
        dbms_output.put_line 
            ('cruise_port stop added successfully!' );
            
        end if;
    end if;
end;
/

-- Write Test Harness for 5(b)

--failure test harness

--test harness 1, invalid date, it is not after the latest stop for the particular cruise
--prior state
select * from cruise_port order by cruise_id,cp_datetime;

--test trigger, invalid date, it is not after the latest stop for the particular cruise
insert into cruise_port values(
1,
to_Date('01/04/2022','dd/mm/yyyy'),
'A',
'AUSYD');

--post state
select * from cruise_port order by cruise_id,cp_datetime;
select count(*) from cruise_port order by cruise_id, cp_datetime;

--test harness 2, invalid duration, The given date is not within the duration of the cruise
--prior state
select * from cruise_port order by cruise_id,cp_datetime;

--test trigger, invalid duration, it is not after the latest stop for the particular cruise
insert into cruise_port values(
2,
to_Date('01/04/2023','dd/mm/yyyy'),
'A',
'AUSYD');

--post state
select * from cruise_port order by cruise_id,cp_datetime;
select count(*) from cruise_port order by cruise_id, cp_datetime;

--test harness 3, invalid duration, The given date is not within the duration of the cruise, tried a different cruise id
--prior state
select * from cruise_port order by cruise_id,cp_datetime;

--test trigger, invalid duration, it is not after the latest stop for the particular cruise
insert into cruise_port values(
5,
to_Date('01/04/2023','dd/mm/yyyy'),
'A',
'AUSYD');

--post state
select * from cruise_port order by cruise_id,cp_datetime;
select count(*) from cruise_port order by cruise_id, cp_datetime;



--success test harness

--test harness 1
--prior state
select * from cruise_port order by cruise_id,cp_datetime;

--test trigger, invalid duration, it is not after the latest stop for the particular cruise
insert into cruise_port values(
8,
to_Date('01/11/2022','dd/mm/yyyy'),
'A',
'AUSYD');

--post state
select * from cruise_port order by cruise_id,cp_datetime;
select count(*) from cruise_port order by cruise_id, cp_datetime;

--test harness 2
--prior state
select * from cruise_port order by cruise_id,cp_datetime;

--test trigger, invalid duration, it is not after the latest stop for the particular cruise
insert into cruise_port values(
5,
to_Date('10/5/2022','dd/mm/yyyy'),
'A',
'AUSYD');

--post state
select * from cruise_port order by cruise_id,cp_datetime;
select count(*) from cruise_port order by cruise_id, cp_datetime;



rollback;



