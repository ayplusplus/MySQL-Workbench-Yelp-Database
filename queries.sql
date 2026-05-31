-- ACO 320 MySQL Project - Final Project
-- Sean Austin
-- queries.sql

-- QUERY 1
-- For each business, calculate the number of reviews and the
-- average of the reviews using the data in the review table
-- (not the stored review_count on the business).
-- Order: highest avg_review first; ties broken by most reviews first.
-- Output: (business_id, name, business_review_count, avg_review)

SELECT
    b.business_id,
    b.name,
    COUNT(r.review_id)      AS business_review_count,
    AVG(r.stars)            AS avg_review
FROM business b
JOIN review r ON b.business_id = r.business_id
GROUP BY b.business_id, b.name
ORDER BY avg_review DESC, business_review_count DESC;

-- QUERY 1 - Reflection Query
-- Verify correctness by showing the raw review rows for each
-- business alongside their computed aggregate so we can
-- manually confirm the count and average.

SELECT
    b.business_id,
    b.name,
    r.review_id,
    r.stars
FROM business b
JOIN review r ON b.business_id = r.business_id
ORDER BY b.business_id, r.review_id;

-- QUERY 1 - Comprehensiveness Query
-- Show that test data covers the edge cases:
--   (a) a business with exactly 1 review (avg = that star value)
--   (b) a business with many reviews spanning all star values 1-5
--   (c) a tie in avg_review resolved by review count ordering

SELECT
    b.business_id,
    b.name,
    COUNT(r.review_id)  AS review_count,
    MIN(r.stars)        AS min_stars,
    MAX(r.stars)        AS max_stars,
    AVG(r.stars)        AS avg_stars
FROM business b
JOIN review r ON b.business_id = r.business_id
GROUP BY b.business_id, b.name
ORDER BY avg_stars DESC, review_count DESC;

-- QUERY 2
-- For each business category, calculate the number of different
-- businesses, the number of reviews, and the average review.
-- Order alphabetically by category.
-- Output: (category, number_of_businesses, category_review_count,
--          category_average_review)

SELECT
    bc.category,
    COUNT(DISTINCT bc.business_id)  AS number_of_businesses,
    COUNT(r.review_id)              AS category_review_count,
    AVG(r.stars)                    AS category_average_review
FROM business_categories bc
JOIN review r ON bc.business_id = r.business_id
GROUP BY bc.category
ORDER BY bc.category ASC;

-- QUERY 2 - Reflection Query
-- Show the individual businesses and their reviews per category
-- so the aggregated totals above can be manually verified.

SELECT
    bc.category,
    bc.business_id,
    b.name,
    r.review_id,
    r.stars
FROM business_categories bc
JOIN business b ON bc.business_id = b.business_id
JOIN review   r ON bc.business_id = r.business_id
ORDER BY bc.category, bc.business_id, r.review_id;

-- QUERY 2 - Comprehensiveness Query
-- Confirm the test data covers: a category with only one
-- business, categories shared by multiple businesses, and
-- businesses belonging to multiple categories.

SELECT
    bc.category,
    COUNT(DISTINCT bc.business_id)  AS num_businesses,
    COUNT(r.review_id)              AS total_reviews,
    AVG(r.stars)                    AS avg_stars
FROM business_categories bc
JOIN review r ON bc.business_id = r.business_id
GROUP BY bc.category
ORDER BY num_businesses DESC, bc.category;
