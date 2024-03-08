BEGIN;

create table if not exists event (
  event_id serial primary key ,
  name varchar(30) not null,
  event_slug varchar(50) not null unique,
  address varchar(200) not null,
  gmap_link  varchar(200) not null,
  city_id serial not null,
  created_at timestamp NOT NULL default CURRENT_TIMESTAMP, 
  updated_at timestamp NOT NULL default CURRENT_TIMESTAMP,

  constraint fk_city_id
    foreign key(city_id)
      references city(city_id)
        on delete cascade,
  unique(name, address)
);

END;
