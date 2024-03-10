BEGIN;

create table if not exists account (
  account_id uuid default gen_random_uuid() primary key,
  dob date not null,
  first_name varchar(30) not null,
  last_name  varchar(30) not null,
  email   varchar(50) not null unique,
  city_id serial not null,
  on_boarded boolean default false not null,
  admin boolean default false not null,
  passwd varchar(70) not null,
  
  last_login timestamp NOT NULL default CURRENT_TIMESTAMP, 
  created_at timestamp NOT NULL default CURRENT_TIMESTAMP, 
  updated_at timestamp NOT NULL default CURRENT_TIMESTAMP,

  constraint fk_city_id
    foreign key(city_id)
      references city(city_id)
        on delete cascade
);

END;
