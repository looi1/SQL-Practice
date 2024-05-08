--****PLEASE ENTER YOUR DETAILS BELOW****
--T1-wc-schema.sql

--Student ID: 32439180
--Student Name: Looi Teck San
--Unit Code: Fit3171
--Applied Class No: 1

/* Comments for your marker:




*/

-- Task 1 Add Create table statements for the Missing TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script

-- PASSENGER
Create Table passenger(
    passenger_id Number(6) Not Null,
    passenger_fname Varchar2(30), 
    passenger_lname Varchar2(30),
    passenger_dob Date Not Null,
    passenger_gender Char(1) Not Null,
    passenger_contact Char(10),
    guardian_id Number(6)
    );
    COMMENT ON COLUMN passenger.passenger_id IS
        'Unique identifier for a passenger';
        
    COMMENT ON COLUMN passenger.passenger_fname IS
        'Passenger first name';
    
    COMMENT ON COLUMN passenger.passenger_lname IS
        'Passenger last name';
        
    COMMENT ON COLUMN passenger.passenger_dob  IS
        'Passenger date of birth';
    
    COMMENT ON COLUMN passenger.passenger_gender IS
        'Passenger gender (M for male, F for female, or X for non-binary/indeterminate/intersex/unspecified/other)';
    
    COMMENT ON COLUMN passenger.passenger_contact  IS
        'Passenger contact number';
    
    COMMENT ON COLUMN passenger.guardian_id IS
        'Unique identifier for a passenger guardian';
        
    ALTER TABLE passenger ADD CONSTRAINT passenger_pk Primary Key ( passenger_id );
    ALTER TABLE passenger ADD CONSTRAINT passenger_un Unique (passenger_contact);


-- MANIFEST

Create Table manifest(
    manifest_id  Number(7) Not Null,
    passenger_id Number(6) Not Null, 
    cruise_id Number(6) Not Null,
    manifest_board_datetime Date,
    ship_code Number(4) Not Null,
    cabin_no Number(5) Not Null
    );
    COMMENT ON COLUMN manifest.manifest_id IS
        'Unique identifier for a manifest';
        
    COMMENT ON COLUMN manifest.passenger_id IS
        'Unique identifier for a passenger';
    
    COMMENT ON COLUMN manifest.cruise_id IS
        'Unique identifier for a cruise';
        
    COMMENT ON COLUMN manifest.manifest_board_datetime IS
        ' Date/time passenger boarded ship';
        
    COMMENT ON COLUMN manifest.ship_code IS
        ' code number for a ship';
        
    COMMENT ON COLUMN manifest.cabin_no IS
        ' cabin number';
        
    ALTER TABLE manifest ADD CONSTRAINT manifest_pk Primary Key ( manifest_id );
    ALTER TABLE manifest ADD CONSTRAINT passenger_cruise_id_un Unique (passenger_id,cruise_id);

-- Add all missing FK Constraints below here

--passenger fk
    ALTER TABLE passenger ADD CONSTRAINT passenger_guardian_fk FOREIGN KEY ( guardian_id ) REFERENCES passenger ( passenger_id );

--manifest fk 
    ALTER TABLE manifest ADD CONSTRAINT manifest_passenger_fk FOREIGN KEY ( passenger_id ) REFERENCES passenger ( passenger_id );
    ALTER TABLE manifest ADD CONSTRAINT manifest_cruise_fk FOREIGN KEY ( cruise_id ) REFERENCES cruise ( cruise_id );
    ALTER TABLE manifest ADD CONSTRAINT manifest_ship_fk FOREIGN KEY ( ship_code ) REFERENCES ship ( ship_code );
    ALTER TABLE manifest ADD CONSTRAINT manifest_cabin_fk FOREIGN KEY ( ship_code,cabin_no ) REFERENCES cabin ( ship_code,cabin_no );