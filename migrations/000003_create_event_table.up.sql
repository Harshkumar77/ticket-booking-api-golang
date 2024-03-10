BEGIN;

create table if not exists event (
  event_id serial primary key ,
  name varchar(100) not null,
  event_slug varchar(50) not null unique,
  address_title varchar(200) not null,
  address_full varchar(400) not null,
  gmap_iframe  varchar(400) not null,
  city_id serial not null,
  event_date timestamp not null default CURRENT_TIMESTAMP, 
  registration_end_date timestamp NOT NULL default CURRENT_TIMESTAMP,
  poster varchar(300) not null default 'https://wallpaperaccess.com/full/6024879.jpg',
  cover varchar(300) not null default 'https://i.ytimg.com/vi/nJ8ENMhLaD0/maxresdefault.jpg',
  created_by uuid not null,
  created_at timestamp NOT NULL default CURRENT_TIMESTAMP, 
  updated_at timestamp NOT NULL default CURRENT_TIMESTAMP,

  constraint fk_created_by
    foreign key(created_by)
      references account(account_id)
        on delete cascade,
  constraint fk_city_id
    foreign key(city_id)
      references city(city_id)
        on delete cascade,
  unique(name, address_title, address_full)
);

END;
