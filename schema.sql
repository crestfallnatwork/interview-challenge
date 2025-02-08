begin;
create table doctors(
    id serial primary key,
    name text,
    gender text,
    language text,
    link text unique,
    phone text,
    rating numeric,
    number_of_ratings numeric,
    accept_new boolean,
    employed boolean,
    specialities text,
    image text
);

create table locations(
    id serial primary key,
    name text,
    address text,
    phone text,
    link text unique
);
create table location_doctor(
    loc_id int references locations(id),
    doc_id int references doctors(id),
    constraint unique_loc_doc unique(loc_id, doc_id)
);
commit;
