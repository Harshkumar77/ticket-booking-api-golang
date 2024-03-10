BEGIN;

create table if not exists seat_type (
  seat_type_id serial primary key ,
  event_id serial not null,
  type varchar(10) not null,
  price integer not null check(price >= 0),
  total integer not null check(price > 0),
  created_at timestamp NOT NULL default CURRENT_TIMESTAMP, 
  updated_at timestamp NOT NULL default CURRENT_TIMESTAMP,

  unique(event_id, type),
  constraint fk_event_id 
    foreign key(event_id)
      references event(event_id)
        on delete cascade
);

create table if not exists transaction (
  transaction_id uuid default gen_random_uuid() primary key,
  event_id serial not null,
  seat_type_id serial not null,
  tickets_booked integer not null check(tickets_booked > 0),
  account_id uuid not null,
  created_at timestamp NOT NULL default CURRENT_TIMESTAMP, 
  updated_at timestamp NOT NULL default CURRENT_TIMESTAMP,

  constraint fk_account_id
    foreign key(account_id)
      references account(account_id)
        on delete cascade,
  constraint fk_seat_type_id
    foreign key(seat_type_id)
      references seat_type(seat_type_id)
        on delete cascade,
  constraint fk_event_id
    foreign key(event_id)
      references event(event_id)
        on delete cascade
);

create table if not exists tag (
  tag varchar(20) primary key ,
  tag_emoji varchar(5) not null,
  created_at timestamp NOT NULL default CURRENT_TIMESTAMP, 
  updated_at timestamp NOT NULL default CURRENT_TIMESTAMP
);

create table if not exists account_tag_map (
  account_id uuid not null,
  tag varchar(20) not null,
  created_at timestamp NOT NULL default CURRENT_TIMESTAMP, 
  updated_at timestamp NOT NULL default CURRENT_TIMESTAMP,

  unique(account_id, tag),
  constraint fk_account_id
    foreign key(account_id)
      references account(account_id)
        on delete cascade,
  constraint fk_tag
    foreign key(tag)
      references tag(tag)
        on delete cascade
);

create table if not exists event_tag_map (
  event_id serial not null,
  tag varchar(20) not null,
  created_at timestamp NOT NULL default CURRENT_TIMESTAMP, 
  updated_at timestamp NOT NULL default CURRENT_TIMESTAMP,

  unique(event_id, tag),
  constraint fk_event_id
    foreign key(event_id)
      references event(event_id)
        on delete cascade,
  constraint fk_tag
    foreign key(tag)
      references tag(tag)
        on delete cascade
);

END;
