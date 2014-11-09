CREATE TABLE census(year char(4),
/*                    datanum numeric(2),*/
                    serial char(8),
/*                    hhwt numeric(10),
                    gq char(1),
                    pernum numeric(4),
                    perwt numeric(10),
                    hcovany numeric(1),
                    hcovpriv numeric(1),
                    hinsemp numeric(1),
                    hinspur numeric(1),
                    hinstri numeric(1),
                    hcovpub numeric(1),
                    hinscaid numeric(1),
                    hinscare numeric(1),
                    hinsva numeric(1),
                    hinsihs numeric(1),*/
                    empstat char(1),
/*                    empstatd numeric(2),*/
                    inctot char(7),
                    migplac1 char(3));

CREATE TABLE staging(data text);
\copy places_staging FROM /home/james/brownback_cut/usa_00001.dat;

INSERT INTO census(year, serial, empstat, inctot, migplac1)
    SELECT substring(data,1,4) As year, substring(data,7,8) As serial, substring(data,50,1) As empstat, substring(data,53,7) As inctot, substring(data,60,3) As migplac1
    FROM staging;
