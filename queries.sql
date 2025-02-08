-- 1. Total number of doctors
select count(*) from doctors;

--  count
-- -------
--     42
-- (1 row)


-- 2. Total number of doctors with ratings
select count(*)
from doctors
where rating is not null;

--  count
-- -------
--     13
-- (1 row)


-- 3. Doctors having the same phone number
select phone, array_agg(id), array_agg(name)
from doctors
group by phone
having count(id) > 1;

--    phone    |    array_agg     |                                                    array_agg
-- ------------+------------------+------------------------------------------------------------------------------------------------------------------
--  3342222073 | {12,14,19}       | {"Patrick Kelly, DO","Kristy Nichols, CRNP","Sherry Wright, CRNP"}
--  8504444700 | {22,48,55}       | {"Micalyn Kelley, APRN","Amy Dugger, FNP","Christopher Reid, MD"}
--  3342224327 | {24,26}          | {"Gregory D. Price Sr, MD","Heide Price, FNP"}
--  3342222393 | {10,27}          | {"Robert L. Long, MD","Connie Lasley, CRNP"}
--  3342224191 | {20,31}          | {"Timothy Day, MD","Ashton Wells, MD"}
--  3344287047 | {45,46,49,50,52} | {"Christopher Blatz, CRNA","Willie Furr, CRNA","Sandy Griffin, CRNA","Julie Gay, CRNA","Michele Thomason, CRNA"}
--  3344282273 | {32,36,38}       | {"Asia Dutton, CRNP","Kelly Hammett, CRNP","April Johnson, CRNP"}
--  3342227337 | {13,16,18,29}    | {"Christyl Hines, CRNP","Hope Veasey, CRNP","Gabrielle Baldwin, MD","Srividhya Sridharan, MD"}
--  3342221366 | {33,35,39,40}    | {"Jill Elmore, CRNP","Jenny Goss, CNM","William Farmer, MD","Kathrine Langley, CRNP"}
-- (9 rows)


-- 4. Doctors with more than one location
select d.id, d.name, count(l.*)
from locations l
     join location_doctor ld
         on l.id = ld.loc_id
     join doctors d
         on ld.doc_id = d.id
group by d.id
having count(l.*) > 1;

--  id |          name           | count
-- ----+-------------------------+-------
--  22 | Micalyn Kelley, APRN    |     2
--  43 | JoAnne Smith, DO        |     2
--  31 | Ashton Wells, MD        |     2
--  20 | Timothy Day, MD         |     2
--  17 | Bhagwan Bang, MD        |     2
--  24 | Gregory D. Price Sr, MD |     2
-- (6 rows)
