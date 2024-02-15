BEGIN;

create table if not exists city (
  city_id serial primary key,
  hero_image varchar(250) not null,
  cover_image varchar(250) not null
);

select setval('city_city_id_seq', 99);

END;
