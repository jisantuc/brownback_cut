CREATE TABLE census(year numeric(4),
                    serial char(8),
                    statefip char(2),
                    empstat char(1),
                    inctot numeric(7),
                    migplac1 char(3));


CREATE TABLE staging(data text);
\copy staging FROM /home/james/brownback_cut/usa_00003.dat;

INSERT INTO census(year, serial, statefip, empstat, inctot, migplac1)
    SELECT CAST(substring(data,1,4) AS numeric) AS year, substring(data,7,8) AS serial, substring(data,25,2) AS statefip, substring(data,42,1) AS empstat, CAST(substring(data,45,7) AS numeric) AS inctot, substring(data,52,3) AS migplac1
    FROM staging;
