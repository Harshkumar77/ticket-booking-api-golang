insert into city(name, country, flag_emoji) values
  ('Delhi', 'India', '🇮🇳'),
  ('Goa' , 'India' , '🇮🇳')
  ;

-- Admin account - email: ketan.admin@app.com passwd: CoolAdmin
insert into account(dob, first_name, last_name, email, city_id, on_boarded, admin, passwd) values
  ('2000-03-09' , 'ketan', 'sharma', 'ketan.admin@app.com', (select city_id from city where city.name = 'Delhi'), true, true, '$2a$04$vhsu7wckvzldrisjfeksi.l.emhmvb0rb6ddkgy7ww7z1/d9ht3ic')
 ;

-- Normal account 
insert into account(dob, first_name, last_name, email, city_id, on_boarded, admin, passwd) values
  ('2000-03-10' , 'sham', 'sharma', 'sham.user@app.com', (select city_id from city where city.name = 'Delhi'), false, false, '$2a$04$vhsu7wckvzldrisjfeksi.l.emhmvb0rb6ddkgy7ww7z1/d9ht3ic'),
  ('2000-03-07' , 'varun', 'sharma', 'varun.user@app.com', (select city_id from city where city.name = 'Goa'), false, false, '$2a$04$vhsu7wckvzldrisjfeksi.l.emhmvb0rb6ddkgy7ww7z1/d9ht3ic'),
  ('2000-03-09' , 'kranti', 'sharma', 'kranti.user@app.com', (select city_id from city where city.name = 'Goa'), false, false, '$2a$04$vhsu7wckvzldrisjfeksi.l.emhmvb0rb6ddkgy7ww7z1/d9ht3ic'),
  ('2000-03-13' , 'dummy', 'sharma', 'dummy.user@app.com', (select city_id from city where city.name = 'Delhi'), false, false, '$2a$04$vhsu7wckvzldrisjfeksi.l.emhmvb0rb6ddkgy7ww7z1/d9ht3ic')
  ;

insert into event(name, event_slug, address_title, address_full, gmap_iframe, city_id, event_date, registration_end_date, created_by) values
  (
    'Pots & Brews: A Pottery Experience',
    'pots-brews-a-pottery-experience-et02',
    'Chalkbooard',
    'Plot 3A, 24/1, 24/1, Hauz Khas Village, Deer Park, Hauz Khas, New Delhi, Delhi 110016, India',
    '<iframe src="https://www.google.com/maps/embed?pb=!1m13!1m8!1m3!1d28035.894772738233!2d77.194267!3d28.55514!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjjCsDMzJzE4LjUiTiA3N8KwMTEnMzkuNCJF!5e0!3m2!1sen!2sus!4v1709986233057!5m2!1sen!2sus" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>',
    (select city_id from city where city.name = 'Delhi'),
    CURRENT_DATE + INTERVAL '3 days',
    CURRENT_DATE + INTERVAL '5 days',
    (select account_id from account where admin = true limit 1)
  ),
  (
    'Experience 3',
    'experience-et03',
    'Chalkbooard',
    'Plot 3A, 24/1, 24/1, Hauz Khas Village, Deer Park, Hauz Khas, New Delhi, Delhi 110016, India',
    '<iframe src="https://www.google.com/maps/embed?pb=!1m13!1m8!1m3!1d28035.894772738233!2d77.194267!3d28.55514!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjjCsDMzJzE4LjUiTiA3N8KwMTEnMzkuNCJF!5e0!3m2!1sen!2sus!4v1709986233057!5m2!1sen!2sus" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>',
    (select city_id from city where city.name = 'Delhi'),
    CURRENT_DATE + INTERVAL '3 days',
    CURRENT_DATE + INTERVAL '5 days',
    (select account_id from account where admin = true limit 1)
  ),
  (
    'Brews: A Pottery Experience 2',
    'brews-a-pottery-experience-et0',
    'Chalkbooard',
    'Plot 3A, 24/1, 24/1, Hauz Khas Village, Deer Park, Hauz Khas, New Delhi, Delhi 110016, India',
    '<iframe src="https://www.google.com/maps/embed?pb=!1m13!1m8!1m3!1d28035.894772738233!2d77.194267!3d28.55514!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjjCsDMzJzE4LjUiTiA3N8KwMTEnMzkuNCJF!5e0!3m2!1sen!2sus!4v1709986233057!5m2!1sen!2sus" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>',
    (select city_id from city where city.name = 'Delhi'),
    CURRENT_DATE + INTERVAL '3 days',
    CURRENT_DATE + INTERVAL '5 days',
    (select account_id from account where admin = true limit 1)
  )
  ;

insert into seat_type (event_id, type, price, total) values 
  (
    (select event_id from event where event_slug = 'pots-brews-a-pottery-experience-et02'), 
    'Standard',
    699,
    100
  ),
  (
    (select event_id from event where event_slug = 'experience-et03'), 
    'Standard',
    199,
    100
  ),
  (
    (select event_id from event where event_slug = 'brews-a-pottery-experience-et0'), 
    'Mini',
    1699,
    100
  ),
  (
    (select event_id from event where event_slug = 'brews-a-pottery-experience-et0'), 
    'Standard',
    1699,
    100
  )
  ;

insert into tag (tag, tag_emoji) values
  ('Music', '🎵'),
  ('Art', '🎨'),
  ('Food', '🍔'),
  ('Sports', '⚽'),
  ('Theater', '🎭'),
  ('Comedy', '😂'),
  ('Film', '🎬'),
  ('Workshop', '🔧'),
  ('Charity', '❤️'),
  ('Culture', '🌍'),
  ('Dance', '💃'),
  ('Tech', '💻'),
  ('Outdoor', '🏞️'),
  ('Networking', '🤝'),
  ('Fashion', '👗'),
  ('Reading', '📚'),
  ('Market', '🥕'),
  ('Yoga', '🧘'),
  ('Wine', '🍷')
  ;

insert into event_tag_map (tag, event_id) values
  ((select tag from tag where tag = 'Fashion'), (select event_id from event where event_slug = 'pots-brews-a-pottery-experience-et02')),
  ((select tag from tag where tag = 'Art'), (select event_id from event where event_slug = 'brews-a-pottery-experience-et0')),
  ((select tag from tag where tag = 'Workshop'), (select event_id from event where event_slug = 'brews-a-pottery-experience-et0')),
  ((select tag from tag where tag = 'Dance'), (select event_id from event where event_slug = 'experience-et03')),
  ((select tag from tag where tag = 'Outdoor'), (select event_id from event where event_slug = 'experience-et03'))
  ;

-- seperately because some of them will fail for sure
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));
insert into account_tag_map(tag , account_id) values
  ((select tag from event_tag_map order by random() limit 1), (select account_id from account where admin = false order by random() limit 1));

insert into transaction(event_id, tickets_booked, account_id, seat_type_id) values
  (
    (select event_id from event where event_slug = 'pots-brews-a-pottery-experience-et02'),  
    floor(random() * 5) + 1,
    (select account_id from account where admin = false order by random() limit 1),
    (select seat_type_id from seat_type where event_id = ( select event_id from event where event_slug = 'pots-brews-a-pottery-experience-et02') order by random() limit 1)
  );
insert into transaction(event_id, tickets_booked, account_id, seat_type_id) values
  (
    (select event_id from event where event_slug ='experience-et03'),  
    floor(random() * 5) + 1,
    (select account_id from account where admin = false order by random() limit 1),
    (select seat_type_id from seat_type where event_id = ( select event_id from event where event_slug ='experience-et03') order by random() limit 1)
  );
insert into transaction(event_id, tickets_booked, account_id, seat_type_id) values
  (
    (select event_id from event where event_slug = 'brews-a-pottery-experience-et0'),  
    floor(random() * 5) + 1,
    (select account_id from account where admin = false order by random() limit 1),
    (select seat_type_id from seat_type where event_id = ( select event_id from event where event_slug = 'brews-a-pottery-experience-et0') order by random() limit 1)
  );
insert into transaction(event_id, tickets_booked, account_id, seat_type_id) values
  (
    (select event_id from event where event_slug = 'pots-brews-a-pottery-experience-et02'),  
    floor(random() * 5) + 1,
    (select account_id from account where admin = false order by random() limit 1),
    (select seat_type_id from seat_type where event_id = ( select event_id from event where event_slug = 'pots-brews-a-pottery-experience-et02') order by random() limit 1)
  );
insert into transaction(event_id, tickets_booked, account_id, seat_type_id) values
  (
    (select event_id from event where event_slug ='experience-et03'),  
    floor(random() * 5) + 1,
    (select account_id from account where admin = false order by random() limit 1),
    (select seat_type_id from seat_type where event_id = ( select event_id from event where event_slug ='experience-et03') order by random() limit 1)
  );
insert into transaction(event_id, tickets_booked, account_id, seat_type_id) values
  (
    (select event_id from event where event_slug = 'brews-a-pottery-experience-et0'),  
    floor(random() * 5) + 1,
    (select account_id from account where admin = false order by random() limit 1),
    (select seat_type_id from seat_type where event_id = ( select event_id from event where event_slug = 'brews-a-pottery-experience-et0') order by random() limit 1)
  );
insert into transaction(event_id, tickets_booked, account_id, seat_type_id) values
  (
    (select event_id from event where event_slug = 'pots-brews-a-pottery-experience-et02'),  
    floor(random() * 5) + 1,
    (select account_id from account where admin = false order by random() limit 1),
    (select seat_type_id from seat_type where event_id = ( select event_id from event where event_slug = 'pots-brews-a-pottery-experience-et02') order by random() limit 1)
  );
insert into transaction(event_id, tickets_booked, account_id, seat_type_id) values
  (
    (select event_id from event where event_slug ='experience-et03'),  
    floor(random() * 5) + 1,
    (select account_id from account where admin = false order by random() limit 1),
    (select seat_type_id from seat_type where event_id = ( select event_id from event where event_slug ='experience-et03') order by random() limit 1)
  );
insert into transaction(event_id, tickets_booked, account_id, seat_type_id) values
  (
    (select event_id from event where event_slug = 'brews-a-pottery-experience-et0'),  
    floor(random() * 5) + 1,
    (select account_id from account where admin = false order by random() limit 1),
    (select seat_type_id from seat_type where event_id = ( select event_id from event where event_slug = 'brews-a-pottery-experience-et0') order by random() limit 1)
  );
insert into transaction(event_id, tickets_booked, account_id, seat_type_id) values
  (
    (select event_id from event where event_slug = 'pots-brews-a-pottery-experience-et02'),  
    floor(random() * 5) + 1,
    (select account_id from account where admin = false order by random() limit 1),
    (select seat_type_id from seat_type where event_id = ( select event_id from event where event_slug = 'pots-brews-a-pottery-experience-et02') order by random() limit 1)
  );
insert into transaction(event_id, tickets_booked, account_id, seat_type_id) values
  (
    (select event_id from event where event_slug ='experience-et03'),  
    floor(random() * 5) + 1,
    (select account_id from account where admin = false order by random() limit 1),
    (select seat_type_id from seat_type where event_id = ( select event_id from event where event_slug ='experience-et03') order by random() limit 1)
  );
insert into transaction(event_id, tickets_booked, account_id, seat_type_id) values
  (
    (select event_id from event where event_slug = 'brews-a-pottery-experience-et0'),  
    floor(random() * 5) + 1,
    (select account_id from account where admin = false order by random() limit 1),
    (select seat_type_id from seat_type where event_id = ( select event_id from event where event_slug = 'brews-a-pottery-experience-et0') order by random() limit 1)
  );
insert into transaction(event_id, tickets_booked, account_id, seat_type_id) values
  (
    (select event_id from event where event_slug = 'pots-brews-a-pottery-experience-et02'),  
    floor(random() * 5) + 1,
    (select account_id from account where admin = false order by random() limit 1),
    (select seat_type_id from seat_type where event_id = ( select event_id from event where event_slug = 'pots-brews-a-pottery-experience-et02') order by random() limit 1)
  );
insert into transaction(event_id, tickets_booked, account_id, seat_type_id) values
  (
    (select event_id from event where event_slug ='experience-et03'),  
    floor(random() * 5) + 1,
    (select account_id from account where admin = false order by random() limit 1),
    (select seat_type_id from seat_type where event_id = ( select event_id from event where event_slug ='experience-et03') order by random() limit 1)
  );
insert into transaction(event_id, tickets_booked, account_id, seat_type_id) values
  (
    (select event_id from event where event_slug = 'brews-a-pottery-experience-et0'),  
    floor(random() * 5) + 1,
    (select account_id from account where admin = false order by random() limit 1),
    (select seat_type_id from seat_type where event_id = ( select event_id from event where event_slug = 'brews-a-pottery-experience-et0') order by random() limit 1)
  );

select (select count(*) from city) || ' cities inserted';
select (select count(*) from account where admin = true) || ' admins inserted';
select (select count(*) from account where admin = false) || ' users inserted';
select (select count(*) from event) || ' events inserted';
select (select count(distinct event_id) from seat_type) || ' events seat_type inserted';
select (select count(distinct event_id) from event_tag_map) || ' events mapped with tag';
select (select count(distinct account_id) from account_tag_map) || ' account mapped with ' || (select count(distinct tag) from account_tag_map) ||' tag';
select (select count(*) from transaction) || ' transactions inserted';


