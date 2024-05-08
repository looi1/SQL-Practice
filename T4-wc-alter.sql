--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-wc-alter.sql

--Student ID: 32439180
--Student Name: Looi Teck San
--Unit Code: fit3171
--Applied Class No: 1

/* Comments for your marker:




*/

--4(a)
Alter Table cruise Add(
    cruise_total_passengers Number(4) Default 0);
    COMMENT ON COLUMN cruise.cruise_total_passengers IS
        'total passengers in a cruise';
commit;   

Update cruise set cruise_total_passengers = (select total_passenger from (select cruise.cruise_id, count(passenger_id) as total_passenger from manifest join cruise on manifest.cruise_id = cruise.cruise_id group by cruise.cruise_id order by cruise.cruise_id) where cruise_id = cruise.cruise_id)
where cruise_id = (select cruise_id from (select cruise.cruise_id, count(passenger_id) as total_passenger from manifest join cruise on manifest.cruise_id = cruise.cruise_id group by cruise.cruise_id order by cruise.cruise_id)where cruise_id = cruise.cruise_id);
commit;


--4(b)


DROP TABLE ship_maintain_record CASCADE CONSTRAINTS;

Create Table ship_maintain_record(
    ship_code Number(6) Not Null,
    ship_maintain_start_date Date,
    ship_maintain_exp_end_date Date,
    ship_maintain_type varchar2(35));
    
    COMMENT ON COLUMN ship_maintain_record.ship_code IS
        'unique identifier for each ship';
    
    
    COMMENT ON COLUMN ship_maintain_record.ship_maintain_start_date IS
        'maintainance start date of a ship';
        
    COMMENT ON COLUMN ship_maintain_record.ship_maintain_exp_end_date IS
        'ship maintenance expected end date';
        
    COMMENT ON COLUMN ship_maintain_record.ship_maintain_type IS
        'type of maintainance(Preventive or Scheduled
Maintenance, Corrective or Breakdown Maintenance, and Condition Maintenance)'; 
        
    ALTER TABLE ship_maintain_record ADD CONSTRAINT ship_maintain_record_pk Primary Key ( ship_code, ship_maintain_start_date ); --composite primary key--
    ALTER TABLE ship_maintain_record ADD CONSTRAINT ship_maintain_record_un Unique (ship_code, ship_maintain_start_date, ship_maintain_exp_end_date);
    
    Alter TABLE ship_maintain_record ADD CONSTRAINT ck_ship_maintain_type CHECK ( upper(ship_maintain_type)= upper('Preventive or Scheduled Maintenance') or  upper(ship_maintain_type)= upper('Corrective or Breakdown Maintenance') or  upper(ship_maintain_type)= upper('Condition Maintenance'));
    ALTER TABLE ship_maintain_record ADD CONSTRAINT ship_maintain_record_ship_fk FOREIGN KEY ( ship_code ) REFERENCES ship ( ship_code );

    
commit; 
        
--4(c)

Alter Table manifest Add(
    guardian_history Number(6) Default null);
    COMMENT ON COLUMN manifest.guardian_history IS
        'the passenger guardian';
        
Update manifest set guardian_history = (select guardian_id 
                                        from(select manifest.passenger_id,guardian_id from manifest join passenger on manifest.passenger_id = passenger.passenger_id group by manifest.passenger_id,guardian_id order by manifest.passenger_id)
                                        where passenger_id = manifest.passenger_id)
                                        where passenger_id = manifest.passenger_id;
                                        

commit;




