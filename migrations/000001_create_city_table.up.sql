BEGIN;

create table if not exists city (
  city_id serial primary key ,
  name varchar(30) not null,
  country varchar(30) not null,
  flag_emoji varchar(5) not null,
  created_at timestamp NOT NULL default CURRENT_TIMESTAMP, 
  updated_at timestamp NOT NULL default CURRENT_TIMESTAMP
);

select setval('city_city_id_seq', 100);

END;
