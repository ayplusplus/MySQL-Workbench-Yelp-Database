-- ACO 320 MySQL Project - Final Project
-- Sean Austin
-- insert.sql

-- BUSINESS
-- 10 businesses covering multiple cities, star ratings, and
-- review counts. Designed to produce interesting Query 1 and
-- Query 2 results including ties and varied category membership.

INSERT INTO business (business_id, name, street, city, state, zip, stars, review_count) VALUES
    ('biz0000000000000000001', 'Pizzeria Bianco',          '623 E Adams St',       'Phoenix',    'AZ', '85004', 4.5,  8),
    ('biz0000000000000000002', 'Flower Child',             '4402 N 75th St',       'Scottsdale', 'AZ', '85251', 4.0,  4),
    ('biz0000000000000000003', 'Changing Hands Bookstore', '6428 S McClintock Dr', 'Tempe',      'AZ', '85283', 4.5,  4),
    ('biz0000000000000000004', 'Lux Central',              '4402 N Central Ave',   'Phoenix',    'AZ', '85012', 3.5,  4),
    ('biz0000000000000000005', 'Tacos Chiwas',             '1814 E McDowell Rd',   'Phoenix',    'AZ', '85006', 5.0,  4),
    ('biz0000000000000000006', 'The Lost Leaf',            '914 N 5th St',         'Phoenix',    'AZ', '85004', 4.0,  3),
    ('biz0000000000000000007', 'Matts Big Breakfast',      '801 N 1st St',         'Phoenix',    'AZ', '85004', 4.5,  3),
    ('biz0000000000000000008', 'Postino Arcadia',          '3939 E Campbell Ave',  'Phoenix',    'AZ', '85018', 4.0,  3),
    ('biz0000000000000000009', 'Ghost Ranch',              '1006 N 2nd St',        'Phoenix',    'AZ', '85004', 3.0,  2),
    ('biz0000000000000000010', 'Sip Coffee and Beer',      '4400 N Scottsdale Rd', 'Scottsdale', 'AZ', '85251', 4.0,  2);

-- BUSINESS CATEGORIES
-- Each business has at least 2 categories. The Restaurants
-- category is shared by 6 businesses (illustrates multi-business
-- aggregation in Query 2). Mexican is shared by biz5 and biz9.
-- Coffee & Tea is shared by biz4 and biz10. Bars is shared by
-- biz6 and biz10. Each demonstrates multi-business categories.

INSERT INTO business_categories (business_id, category) VALUES
    ('biz0000000000000000001', 'Restaurants'),
    ('biz0000000000000000001', 'Pizza'),
    ('biz0000000000000000002', 'Restaurants'),
    ('biz0000000000000000002', 'Salad'),
    ('biz0000000000000000003', 'Shopping'),
    ('biz0000000000000000003', 'Bookstores'),
    ('biz0000000000000000004', 'Coffee & Tea'),
    ('biz0000000000000000004', 'Cafes'),
    ('biz0000000000000000005', 'Restaurants'),
    ('biz0000000000000000005', 'Mexican'),
    ('biz0000000000000000006', 'Bars'),
    ('biz0000000000000000006', 'Music Venues'),
    ('biz0000000000000000007', 'Restaurants'),
    ('biz0000000000000000007', 'Breakfast & Brunch'),
    ('biz0000000000000000008', 'Restaurants'),
    ('biz0000000000000000008', 'Wine Bars'),
    ('biz0000000000000000009', 'Restaurants'),
    ('biz0000000000000000009', 'Mexican'),
    ('biz0000000000000000010', 'Coffee & Tea'),
    ('biz0000000000000000010', 'Bars');

-- USERS (10 users)

INSERT INTO user (user_id, name, review_count, yelping_since) VALUES
    ('usr0000000000000000001', 'Alice Monroe',   8, '2018-03-15'),
    ('usr0000000000000000002', 'Brian Cho',      7, '2019-07-22'),
    ('usr0000000000000000003', 'Carmen Vega',    5, '2020-01-10'),
    ('usr0000000000000000004', 'David Kim',      5, '2017-11-05'),
    ('usr0000000000000000005', 'Elena Torres',   4, '2021-06-30'),
    ('usr0000000000000000006', 'Frank Nguyen',   4, '2022-02-14'),
    ('usr0000000000000000007', 'Grace Park',     3, '2020-09-01'),
    ('usr0000000000000000008', 'Henry Shaw',     3, '2016-05-20'),
    ('usr0000000000000000009', 'Isabelle Cruz',  2, '2023-01-11'),
    ('usr0000000000000000010', 'James Liu',      2, '2023-08-04');

-- REVIEWS
-- Designed to verify Query 1 ordering and Query 2 aggregation:
--
-- Expected Query 1 ordering (avg DESC, count DESC):
--   biz5  avg=5.00  count=4   (Tacos Chiwas)
--   biz7  avg=4.67  count=3   (Matts Big Breakfast)
--   biz3  avg=4.50  count=4   (Changing Hands) -- tie avg with biz1, more reviews
--   biz1  avg=4.25  count=8   (Pizzeria Bianco)
--   biz8  avg=4.00  count=3   (Postino Arcadia)  -- tie avg with biz10/biz2/biz6
--   biz10 avg=4.00  count=2   (Sip Coffee)       -- same avg, fewer reviews
--   biz2  avg=3.75  count=4   (Flower Child)
--   biz6  avg=3.67  count=3   (The Lost Leaf)
--   biz4  avg=3.00  count=4   (Lux Central)      -- tie avg with biz9, more reviews
--   biz9  avg=3.00  count=2   (Ghost Ranch)

INSERT INTO review (review_id, business_id, user_id, stars, review_date, review_text) VALUES

    -- biz1 Pizzeria Bianco: 8 reviews, stars 5,4,4,4,5,4,4,4 -> avg 4.25
    ('rev0000000000000000001', 'biz0000000000000000001', 'usr0000000000000000001', 5, '2024-01-10', 'Best pizza in Phoenix, hands down. The crust is perfectly charred.'),
    ('rev0000000000000000002', 'biz0000000000000000001', 'usr0000000000000000002', 4, '2024-02-14', 'Fantastic flavor but the wait was a bit long. Worth it though.'),
    ('rev0000000000000000003', 'biz0000000000000000001', 'usr0000000000000000003', 4, '2024-03-01', 'Great spot. Margherita pizza was excellent. Will be back.'),
    ('rev0000000000000000004', 'biz0000000000000000001', 'usr0000000000000000004', 4, '2024-04-05', 'Solid pizza. The wait is annoying but the food makes up for it.'),
    ('rev0000000000000000005', 'biz0000000000000000001', 'usr0000000000000000005', 5, '2024-05-18', 'Absolutely outstanding. One of the best meals I have had in years.'),
    ('rev0000000000000000006', 'biz0000000000000000001', 'usr0000000000000000006', 4, '2024-06-22', 'Great crust and fresh toppings. Service was friendly too.'),
    ('rev0000000000000000007', 'biz0000000000000000001', 'usr0000000000000000007', 4, '2024-07-30', 'Classic Bianco experience. Busy as always but totally worth it.'),
    ('rev0000000000000000008', 'biz0000000000000000001', 'usr0000000000000000008', 4, '2024-08-11', 'The Rosa pizza is incredible. Slightly pricey but quality shows.'),

    -- biz2 Flower Child: 4 reviews, stars 4,4,4,3 -> avg 3.75
    ('rev0000000000000000009', 'biz0000000000000000002', 'usr0000000000000000001', 4, '2024-03-05', 'Fresh, healthy options. Love the bowls. Great for a quick lunch.'),
    ('rev0000000000000000010', 'biz0000000000000000002', 'usr0000000000000000004', 4, '2024-04-20', 'Solid menu with good vegetarian choices. A bit pricey but worth it.'),
    ('rev0000000000000000011', 'biz0000000000000000002', 'usr0000000000000000009', 4, '2024-06-01', 'Clean ingredients and good flavor. Love this place for lunch.'),
    ('rev0000000000000000012', 'biz0000000000000000002', 'usr0000000000000000010', 3, '2024-08-14', 'Decent food but portions are small for the price.'),

    -- biz3 Changing Hands: 4 reviews, stars 5,4,5,4 -> avg 4.50
    ('rev0000000000000000013', 'biz0000000000000000003', 'usr0000000000000000002', 5, '2024-05-11', 'A wonderful local bookstore. Great selection and friendly staff.'),
    ('rev0000000000000000014', 'biz0000000000000000003', 'usr0000000000000000003', 4, '2024-06-03', 'Love browsing here. Found several great picks. Cozy atmosphere.'),
    ('rev0000000000000000015', 'biz0000000000000000003', 'usr0000000000000000007', 5, '2024-07-19', 'Best independent bookstore in the valley. Events are fantastic too.'),
    ('rev0000000000000000016', 'biz0000000000000000003', 'usr0000000000000000008', 4, '2024-09-05', 'Great selection and a coffee bar inside. My go-to weekend spot.'),

    -- biz4 Lux Central: 4 reviews, stars 3,4,3,2 -> avg 3.00
    ('rev0000000000000000017', 'biz0000000000000000004', 'usr0000000000000000004', 3, '2024-06-15', 'Good coffee, but the seating gets crowded on weekends.'),
    ('rev0000000000000000018', 'biz0000000000000000004', 'usr0000000000000000005', 4, '2024-07-08', 'Nice vibe and solid espresso. I come here to study often.'),
    ('rev0000000000000000019', 'biz0000000000000000004', 'usr0000000000000000009', 3, '2024-08-22', 'Decent coffee. The space is cool but service was slow today.'),
    ('rev0000000000000000020', 'biz0000000000000000004', 'usr0000000000000000010', 2, '2024-10-01', 'Disappointing visit. Order was wrong and took forever.'),

    -- biz5 Tacos Chiwas: 4 reviews, stars 5,5,5,5 -> avg 5.00 (highest avg)
    ('rev0000000000000000021', 'biz0000000000000000005', 'usr0000000000000000001', 5, '2024-08-19', 'Incredible tacos. Authentic flavors and super affordable.'),
    ('rev0000000000000000022', 'biz0000000000000000005', 'usr0000000000000000006', 5, '2024-09-02', 'Best tacos in the valley, no contest. The al pastor is amazing.'),
    ('rev0000000000000000023', 'biz0000000000000000005', 'usr0000000000000000007', 5, '2024-09-28', 'Absolutely perfect. Every taco was bursting with flavor.'),
    ('rev0000000000000000024', 'biz0000000000000000005', 'usr0000000000000000008', 5, '2024-10-15', 'Unbeatable tacos at an unbeatable price. A Phoenix gem.'),

    -- biz6 The Lost Leaf: 3 reviews, stars 4,4,3 -> avg 3.67
    ('rev0000000000000000025', 'biz0000000000000000006', 'usr0000000000000000002', 4, '2024-10-14', 'Great local bar with live music. Chill crowd and good beer selection.'),
    ('rev0000000000000000026', 'biz0000000000000000006', 'usr0000000000000000003', 4, '2024-11-02', 'Love the eclectic vibe here. Great local bands on weekends.'),
    ('rev0000000000000000027', 'biz0000000000000000006', 'usr0000000000000000005', 3, '2024-11-20', 'Good atmosphere but service was slow. Beer selection is nice though.'),

    -- biz7 Matts Big Breakfast: 3 reviews, stars 4,5,5 -> avg 4.67
    ('rev0000000000000000028', 'biz0000000000000000007', 'usr0000000000000000001', 4, '2024-02-08', 'Excellent breakfast spot. Lines are long but food is worth every minute.'),
    ('rev0000000000000000029', 'biz0000000000000000007', 'usr0000000000000000006', 5, '2024-04-17', 'The pancakes are unreal. Best breakfast in Phoenix, full stop.'),
    ('rev0000000000000000030', 'biz0000000000000000007', 'usr0000000000000000010', 5, '2024-07-03', 'Incredible diner food. Everything is made fresh. Highly recommend.'),

    -- biz8 Postino Arcadia: 3 reviews, stars 4,4,4 -> avg 4.00
    ('rev0000000000000000031', 'biz0000000000000000008', 'usr0000000000000000002', 4, '2024-03-22', 'Great wine and bruschetta combos. Perfect happy hour spot.'),
    ('rev0000000000000000032', 'biz0000000000000000008', 'usr0000000000000000004', 4, '2024-05-09', 'Lovely atmosphere and solid wine selection. Bruschetta is delicious.'),
    ('rev0000000000000000033', 'biz0000000000000000008', 'usr0000000000000000009', 4, '2024-08-30', 'One of my favorite spots for a date night. Great ambiance and food.'),

    -- biz9 Ghost Ranch: 2 reviews, stars 3,3 -> avg 3.00 (ties biz4; biz4 has more reviews)
    ('rev0000000000000000034', 'biz0000000000000000009', 'usr0000000000000000003', 3, '2024-05-25', 'Decent Mexican food but nothing special. The margaritas were good.'),
    ('rev0000000000000000035', 'biz0000000000000000009', 'usr0000000000000000007', 3, '2024-09-13', 'Average experience. Food was okay, service was friendly enough.'),

    -- biz10 Sip Coffee and Beer: 2 reviews, stars 4,4 -> avg 4.00
    ('rev0000000000000000036', 'biz0000000000000000010', 'usr0000000000000000005', 4, '2024-06-07', 'Cool concept: coffee in the morning, beer at night. Solid execution.'),
    ('rev0000000000000000037', 'biz0000000000000000010', 'usr0000000000000000008', 4, '2024-10-22', 'Great vibes and friendly staff. Love the hybrid coffee-bar concept.');
