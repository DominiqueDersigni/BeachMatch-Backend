--users table
INSERT INTO users (keycloak_id, name, email, address, city, age)
VALUES ('00b62447-8db1-43e0-a9d6-03d61228e605', 'Gittha van der Hulst', 'gittha@gittha.nl', 'Plein 1', 'Bergen NH', 59),
       ('2dc8cbd8-167a-4e31-a227-2f3fa39d418f', 'Valerie van Doorn', 'valerie@valerie.nl','Voorstraat 3', 'Harlingen', 31 ),
       ('e238f009-0dc1-4517-af40-685b14e62543', 'Daniel Dersigni', 'daniel@daniel.nl', 'Rokin 4', 'Amsterdam', 29),
    ('979ec544-c13e-46fa-97f7-8bf4a5e9e66d', 'Juliette Helder', 'juliette@juliette.nl','Coolsingel 2', 'Rotterdam', 27 );


--beaches table
INSERT INTO beaches (name, description, province, latitude, longitude)
VALUES
('Bergen aan Zee', 'A quiet, natural beach surrounded by high dunes, close to the dune area of the Schoorlse Duinen. Ideal for long walks and escaping the crowds.', 'Noord-Holland', 52.6627, 4.6272),
('Scheveningen', 'The busiest seaside resort in the Netherlands, with a lively boulevard, the famous pier and many beach clubs. Perfect for a day full of activity.', 'Zuid-Holland', 52.1110, 4.2780),
('Zandvoort', 'A popular beach close to Amsterdam and Haarlem, with plenty of beach pavilions and easy access by train. Great for a quick day at the sea.', 'Noord-Holland', 52.3745, 4.5265),
('Banjaardstrand', 'A wide family-friendly beach on the coast of Noord-Beveland, with dunes behind it and views of the Oosterscheldekering.', 'Zeeland', 51.5880, 3.6750),
('Bloemendaal aan Zee', 'A lively North Sea beach backed by dunes, known for its beach pavilions and easy access from Haarlem.', 'Noord-Holland', 52.4050, 4.5480),
('Oostkapelle', 'A spacious Zeeland beach next to the nature area De Manteling, popular with walkers and visitors looking for a quieter stretch of coast.', 'Zeeland', 51.5800, 3.5360),
('Nollestrand', 'A lively city beach in Vlissingen, close to the boulevard and known for views of ships passing through the Westerschelde.', 'Zeeland', 51.4480, 3.5500),
('Buren aan Zee', 'A broad North Sea beach on Ameland, with open views, plenty of space for walks and a lifeguard post during the summer season.', 'Friesland', 53.4490, 5.8170),
('Strand Horst', 'A long recreation area on the Wolderwijd near Ermelo, offering lakeside beaches and space for water sports and a relaxing day outdoors.', 'Gelderland', 52.3330, 5.5650),
('Strand Nulde', 'A freshwater beach on the Nuldernauw near Putten, with shallow water and a relaxed setting for swimming and family outings.', 'Gelderland', 52.2830, 5.4950),
('Erkemederstrand', 'A long sandy beach on the Nuldernauw near Zeewolde, with open water views and plenty of room for walking and recreation.', 'Flevoland', 52.2700, 5.4140),
('Makkum Beach', 'A popular sandy beach on the IJsselmeer, known for its shallow water, broad shoreline and views across the lake.', 'Friesland', 53.0560, 5.3990),
('Mirnserklif', 'A small beach on the IJsselmeer in the wooded Gaasterland area, appreciated for its peaceful setting and views over the water.', 'Friesland', 52.8620, 5.4580),
('Recreatiestrand De Zandmeren', 'A freshwater recreation beach beside the Maas near Kerkdriel, offering a place to swim and unwind away from the coast.', 'Gelderland', 51.7720, 5.3370),
('Callantsoog', 'A spacious sandy beach on the North Sea, backed by dunes and close to the village of Callantsoog.', 'Noord-Holland', 52.8410, 4.6930),
('Petten', 'A broad sandy beach beside the Hondsbossche Duinen, with plenty of room for a quiet walk and sea air.', 'Noord-Holland', 52.7660, 4.6590),
('Egmond aan Zee', 'A classic seaside beach near the village centre, with a lighthouse, dunes and a lively promenade nearby.', 'Noord-Holland', 52.6210, 4.6270),
('Noordwijk aan Zee', 'A wide resort beach with an inviting boulevard, beach pavilions and easy access to the dunes.', 'Zuid-Holland', 52.2430, 4.4300),
('Katwijk aan Zee', 'A family-friendly sandy beach beside Katwijk’s promenade, with views of the old village and its white church.', 'Zuid-Holland', 52.2040, 4.3950),
('Hoek van Holland', 'A long, broad beach at the mouth of the Nieuwe Waterweg, popular for swimming, walks and watching ships.', 'Zuid-Holland', 51.9900, 4.1050),
('Renesse', 'A long Zeeland beach with sections for families, water sports and nature, next to the dunes and forests of Schouwen.', 'Zeeland', 51.7350, 3.7590),
('Cadzand-Bad', 'A broad sandy beach at the southernmost seaside resort in the Netherlands, known for coastal walks and fossil shark teeth.', 'Zeeland', 51.3790, 3.3840),
('De Koog', 'A popular Texel beach near the island’s main seaside village, with a wide sandy shore and access to dunes and beach pavilions.', 'Noord-Holland', 53.1020, 4.7470),
('West aan Zee', 'A broad North Sea beach on Terschelling, with open horizons, dunes and plenty of space for long walks.', 'Friesland', 53.3900, 5.2220),
('Castricum aan Zee', 'A wide North Sea beach backed by the dunes of the Noordhollands Duinreservaat, popular with surfers and walkers alike.', 'Noord-Holland', 52.5540, 4.6100);;


--beachfeatures tabel
INSERT INTO beachfeatures (name, description)
VALUES
('Relax beach', 'A calm beach, ideal for relaxing and enjoying the peace and quiet.'),
('Surf beach', 'Good waves and wind conditions for surfing, kitesurfing or windsurfing.'),
('Dog beach', 'Dogs are welcome on this beach.'),
('Lifeguard', 'Lifeguards are present during the summer season.'),
('Beach club', 'There is at least one beach club or pavilion.'),
('BBQ allowed', 'Barbecues or a small campfire are allowed in designated areas.');

-- join table beaches_beachfeatures
INSERT INTO beaches_beachfeatures (beach_id, beachfeature_id)
VALUES
    (1, 1), -- Bergen aan Zee: Relax beach
    (1, 3), -- Bergen aan Zee: Dog beach
    (1, 6), -- Bergen aan Zee: BBQ allowed
    (2, 2), -- Scheveningen: Surf beach
    (2, 4), -- Scheveningen: Lifeguard
    (2, 5), -- Scheveningen: Beach club
    (3, 4), -- Zandvoort: Lifeguard
    (3, 5), -- Zandvoort: Beach club
    (4, 1), -- Banjaardstrand: Relax beach
    (4, 4), -- Banjaardstrand: Lifeguard
    (4, 5), -- Banjaardstrand: Beach club
    (5, 1), -- Bloemendaal aan Zee: Relax beach
    (5, 2), -- Bloemendaal aan Zee: Surf beach
    (5, 4), -- Bloemendaal aan Zee: Lifeguard
    (5, 5), -- Bloemendaal aan Zee: Beach club
    (6, 1), -- Oostkapelle: Relax beach
    (6, 3), -- Oostkapelle: Dog beach
    (6, 5), -- Oostkapelle: Beach club
    (7, 4), -- Nollestrand: Lifeguard
    (7, 5), -- Nollestrand: Beach club
    (8, 1), -- Buren aan Zee: Relax beach
    (8, 3), -- Buren aan Zee: Dog beach
    (8, 4), -- Buren aan Zee: Lifeguard
    (9, 1), -- Strand Horst: Relax beach
    (9, 2), -- Strand Horst: Surf beach
    (10, 1), -- Strand Nulde: Relax beach
    (10, 5), -- Strand Nulde: Beach club
    (11, 1), -- Erkemederstrand: Relax beach
    (11, 3), -- Erkemederstrand: Dog beach
    (11, 5), -- Erkemederstrand: Beach club
    (12, 1), -- Makkum Beach: Relax beach
    (12, 2), -- Makkum Beach: Surf beach
    (12, 5), -- Makkum Beach: Beach club
    (13, 1), -- Mirnserklif: Relax beach
    (13, 2), -- Mirnserklif: Surf beach
    (14, 1), -- Recreatiestrand De Zandmeren: Relax beach
    (15, 1), -- Callantsoog: Relax beach
    (15, 2), -- Callantsoog: Surf beach
    (15, 4), -- Callantsoog: Lifeguard
    (15, 5), -- Callantsoog: Beach club
    (16, 1), -- Petten: Relax beach
    (16, 2), -- Petten: Surf beach
    (16, 5), -- Petten: Beach club
    (17, 1), -- Egmond aan Zee: Relax beach
    (17, 2), -- Egmond aan Zee: Surf beach
    (17, 4), -- Egmond aan Zee: Lifeguard
    (17, 5), -- Egmond aan Zee: Beach club
    (18, 1), -- Noordwijk aan Zee: Relax beach
    (18, 2), -- Noordwijk aan Zee: Surf beach
    (18, 4), -- Noordwijk aan Zee: Lifeguard
    (18, 5), -- Noordwijk aan Zee: Beach club
    (19, 1), -- Katwijk aan Zee: Relax beach
    (19, 2), -- Katwijk aan Zee: Surf beach
    (19, 4), -- Katwijk aan Zee: Lifeguard
    (19, 5), -- Katwijk aan Zee: Beach club
    (20, 1), -- Hoek van Holland: Relax beach
    (20, 2), -- Hoek van Holland: Surf beach
    (20, 4), -- Hoek van Holland: Lifeguard
    (20, 5), -- Hoek van Holland: Beach club
    (21, 1), -- Renesse: Relax beach
    (21, 2), -- Renesse: Surf beach
    (21, 4), -- Renesse: Lifeguard
    (21, 5), -- Renesse: Beach club
    (22, 1), -- Cadzand-Bad: Relax beach
    (22, 2), -- Cadzand-Bad: Surf beach
    (22, 4), -- Cadzand-Bad: Lifeguard
    (22, 5), -- Cadzand-Bad: Beach club
    (23, 1), -- De Koog: Relax beach
    (23, 2), -- De Koog: Surf beach
    (23, 4), -- De Koog: Lifeguard
    (23, 5), -- De Koog: Beach club
    (24, 1), -- West aan Zee: Relax beach
    (24, 2), -- West aan Zee: Surf beach
    (24, 4), -- West aan Zee: Lifeguard
    (24, 5), -- West aan Zee: Beach club
    (25, 1), -- Castricum aan Zee: Relax beach
    (25, 2), -- Castricum aan Zee: Surf beach
    (25, 4), -- Castricum aan Zee: Lifeguard
    (25, 5); -- Castricum aan Zee: Beach club

-- reviews table
INSERT INTO reviews (title, text, score, create_date, beach_id, user_id)
VALUES
    ('A lovely place to unwind', 'The fresh sea air and quiet stretch of sand made this a lovely place for a long walk. We enjoyed the dunes as much as the beach.', 5, '2026-01-01', 1, 1),
    ('Lively seaside day', 'There is lots to do around the pier and boulevard, and the wide beach still gives you room to walk. It was busy and the food stops felt pricey, but the atmosphere was fun.', 4, '2026-01-09', 2, 2),
    ('Long walks and easy access', 'A very long beach with plenty of pavilions nearby. It was easy to reach by train, though it gets crowded on a sunny day.', 4, '2026-01-18', 3, 3),
    ('Wide and clean beach', 'There was plenty of space even with other visitors around. The sand was clean and the views of the Delta Works made the walk extra nice.', 5, '2026-01-27', 4, 4),
    ('Great views, bring a jacket', 'The beach is wide and beautiful, with fun waves and a lovely sunset. It was windy and parking was expensive, but we still had a great afternoon.', 4, '2026-02-05', 5, 1),
    ('Beautiful Zeeland beach', 'The soft sand and open sea views were lovely. It was a bit windy and busy near the main entrance, but a walk further along gave us plenty of space.', 5, '2026-02-14', 6, 2),
    ('A relaxed beach with character', 'The sand was comfortable to walk on and the colorful beach huts give the place a cheerful look. We noticed some seaweed later in the day, but still enjoyed our visit.', 4, '2026-02-23', 7, 3),
    ('Room for a peaceful walk', 'A broad beach with lots of space to stroll and enjoy the sea air. The wind was strong during our visit, so we were glad we brought an extra layer.', 5, '2026-03-04', 8, 4),
    ('Good spot for wind and water sports', 'We came for the open space and the windsurfing. The wind was excellent for being on the water, although the shoreline had some weeds and reeds.', 4, '2026-03-13', 9, 1),
    ('A pleasant day by the lake', 'The calm, shallow water was nice for a relaxed visit, and there was room for the children and dog to enjoy the beach. It can get busy on warm days.', 4, '2026-03-21', 10, 2),
    ('A great beach for dogs', 'There is plenty of space beside the water and our dog loved the designated beach area. The lake water is calm, which made it a relaxing day for all of us.', 5, '2026-03-30', 11, 3),
    ('Shallow water and lots of space', 'The beach is clean and the water stays shallow for quite a distance. There are cafés close by, though the promenade can feel lively and crowded in summer.', 4, '2026-04-08', 12, 4),
    ('A quiet nature stop', 'A small, peaceful spot to sit by the IJsselmeer and enjoy the view. The nearby trees and picnic area make it feel especially relaxing.', 5, '2026-04-17', 13, 1),
    ('A fun family swimming spot', 'We enjoyed the sandy beach and the swimming area, and there was plenty to keep the children busy. The facilities nearby made it easy to spend a few hours here.', 4, '2026-04-26', 14, 2),
    ('Lovely wide beach', 'The beach was beautiful and there was lots of room for a walk. The village nearby has plenty of places to eat, though the area can be busy in high season.', 5, '2026-05-05', 15, 3),
    ('Clean beach and a nice walk', 'The beach was spacious and clean, with a fun wooden play area for children. Parking was convenient, but we missed having public changing facilities.', 4, '2026-05-14', 16, 4),
    ('A classic beach day', 'A long, well-kept sandy beach with lovely sea air and several pavilions for a break. It was busy near the village, but easy to find a quieter stretch after a walk.', 5, '2026-05-23', 17, 1),
    ('Spacious and relaxing', 'A very wide beach with beautiful dunes and places to eat nearby. We enjoyed a long walk, though getting there by car took some patience.', 4, '2026-06-01', 18, 2),
    ('Soft sand and a beautiful sunset', 'The beach was clean and calm, with soft sand and a lovely view in the evening. There are plenty of food options nearby and the bus stop is close.', 5, '2026-06-09', 19, 3),
    ('Big beach, easy to reach', 'The beach is huge and the metro makes it easy to get there. We liked watching the ships, but found some litter and sharp shells in places.', 4, '2026-06-18', 20, 4),
    ('Space, dunes and a lively village', 'A beautiful wide beach that is perfect for a long walk, with dunes and beach cafés close by. It gets lively in summer, so we walked further to find a quieter spot.', 5, '2026-06-27', 21, 1),
    ('A peaceful beach walk', 'There is lots of space for a quiet walk, and looking for small fossils kept us busy along the tide line. We would happily come back with the family.', 5, '2026-07-06', 22, 2),
    ('A lovely Texel beach', 'The wide sandy beach and sea view were wonderful. We stopped at a pavilion afterwards; it was welcoming, although it was worth checking opening times first.', 5, '2026-07-15', 23, 3),
    ('A beautiful stretch of sand', 'The beach felt spacious and peaceful, with lovely dunes and a great view over the sea. A nearby pavilion was a nice place to relax after our walk.', 5, '2026-07-24', 24, 4),
    ('Fun, but busy in the sun', 'We had a great time walking along the beach and watching the activity around the pier. It was crowded on a warm afternoon, so visiting earlier might be more relaxing.', 4, '2026-08-02', 2, 3),
    ('A sunset worth staying for', 'The long beach was perfect for an evening walk, and the sunset was beautiful. There were plenty of places to grab a drink afterwards.', 5, '2026-08-11', 3, 4),
    ('Lovely views, a few shells', 'The beach is broad and the views of the water and bridge are lovely. There were some shells underfoot, so I was glad I had sandals.', 4, '2026-08-20', 4, 1),
    ('Soft sand and fresh air', 'We enjoyed the soft sand, the sea breeze and the walk through the dunes. It was windy, but that made the sunset even more special.', 5, '2026-08-28', 6, 3),
    ('The dog loved it', 'A spacious lakeside beach with calm, shallow water. The dog area was a highlight for us, and we found plenty of room to relax.', 5, '2026-09-06', 11, 4),
    ('An easy beach day with children', 'The shallow water made it easy for the children to splash around, and we liked having cafés close to the beach. It was lively near the promenade.', 4, '2026-09-15', 12, 1),
    ('A quieter walk outside peak time', 'The sand and dunes are beautiful, and we found a peaceful stretch after walking away from the village. Parking near the entrance was busy.', 4, '2026-09-24', 17, 2),
    ('Look closely along the tide line', 'We had a relaxing walk and spent time looking through the shells for small fossils. The beach is spacious, with a nice natural feel.', 5, '2026-10-03', 22, 3),
    ('Lovely setting, but parking adds up', 'The sand and waves are beautiful, but parking was expensive and there were not many spaces left. The beach bars also felt a little too crowded for a quiet day.', 2, '2026-10-12', 5, 2),
    ('Nice views, limited facilities', 'The water and landscape are lovely, but we expected more facilities for a full day out. It felt a bit disappointing once we had settled in.', 2, '2026-10-21', 14, 3),
    ('Too small for a busy afternoon', 'The beach is attractive, but it felt cramped when we visited and there was seaweed in the water later in the day. We expected a more comfortable swim.', 3, '2026-10-30', 7, 4),
    ('A clean beach, but bring what you need', 'The sand was clean, but public changing facilities were hard to find and food options nearby were limited. We would come back for a walk, not for a full beach day.', 2, '2026-11-08', 16, 1);

-- mode of transport table
INSERT INTO user_entity_modes_of_transport (user_entity_user_id, modes_of_transport)
VALUES
    (1, 'BIKE'),
    (1, 'CAR'),
    (2, 'BIKE'),
    (2, 'PUBLIC_TRANSPORT'),
    (2, 'BOAT'),
    (3, 'WALKING'),
    (3, 'BIKE'),
    (4, 'CAR'),
    (4, 'WALKING'),
    (4, 'PUBLIC_TRANSPORT');

-- favorites table
INSERT INTO favorites (beach_id, user_id)
VALUES
    (1, 1),  -- Gittha: Bergen aan Zee
    (17, 1), -- Gittha: Egmond aan Zee
    (25, 1), -- Gittha: Castricum aan Zee
    (16, 1), -- Gittha: Petten
    (15, 1), -- Gittha: Callantsoog
    (12, 2), -- Valerie: Makkum Beach
    (24, 2), -- Valerie: West aan Zee
    (13, 2), -- Valerie: Mirnserklif
    (8, 2),  -- Valerie: Buren aan Zee
    (5, 3),  -- Daniel: Bloemendaal aan Zee
    (3, 3),  -- Daniel: Zandvoort
    (17, 3), -- Daniel: Egmond aan Zee
    (18, 3), -- Daniel: Noordwijk aan Zee
    (2, 4),  -- Juliette: Scheveningen
    (20, 4), -- Juliette: Hoek van Holland
    (19, 4), -- Juliette: Katwijk aan Zee
    (18, 4); -- Juliette: Noordwijk aan Zee