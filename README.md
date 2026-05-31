# MySQL-Workbench-Yelp-Database

A relational MySQL database modeling the Yelp platform, built as part of ACO 320 Database Systems at Arizona State University. The project includes a full schema design, comprehensive test data, and aggregate queries for ranking businesses and categories by review performance.

---

## 📁 File Structure

| File | Description |
|------|-------------|
| `create.sql` | Creates all 4 tables with constraints and foreign keys |
| `insert.sql` | Populates all tables with 77 tuples of test data |
| `drop.sql` | Drops all tables in dependency order |
| `queries.sql` | Non-trivial queries, reflection queries, and comprehensiveness queries |

---

## 🗂️ Database Schema

### `business`
| Column | Type | Notes |
|--------|------|-------|
| business_id | char(22) | Primary Key |
| name | varchar(100) | |
| street | varchar(100) | |
| city | varchar(50) | |
| state | char(2) | |
| zip | char(5) | |
| stars | float | 1.0 – 5.0 |
| review_count | int | ≥ 0 |

### `business_categories`
| Column | Type | Notes |
|--------|------|-------|
| business_id | char(22) | FK → business |
| category | varchar(50) | Composite PK |

### `user`
| Column | Type | Notes |
|--------|------|-------|
| user_id | char(22) | Primary Key |
| name | varchar(100) | |
| review_count | int | ≥ 0 |
| yelping_since | char(10) | |

### `review`
| Column | Type | Notes |
|--------|------|-------|
| review_id | char(22) | Primary Key |
| business_id | char(22) | FK → business |
| user_id | char(22) | FK → user |
| stars | int | 1 – 5 |
| review_date | char(10) | |
| review_text | varchar(5000) | |

---

## 📊 Database Population

| Table | Tuples |
|-------|--------|
| business | 10 |
| business_categories | 20 |
| user | 10 |
| review | 37 |

Test data spans multiple cities (Phoenix, Scottsdale, Tempe), star ratings from 2–5, and 12 business categories — deliberately designed to cover edge cases for both queries.

---

## 🔍 Queries

### Query 1 — Business Rankings
For each business, calculates the number of reviews and average star rating using live review data (not the stored `review_count`). Results are ordered by highest average first, with ties broken by most reviews.

```sql
SELECT b.business_id, b.name,
       COUNT(r.review_id) AS business_review_count,
       AVG(r.stars)       AS avg_review
FROM business b
JOIN review r ON b.business_id = r.business_id
GROUP BY b.business_id, b.name
ORDER BY avg_review DESC, business_review_count DESC;
```

**Edge cases covered:**
- Tacos Chiwas: 4 reviews all 5-star → avg 5.0, ranks first
- Lux Central vs Ghost Ranch: both avg 3.0, tie broken by review count

---

### Query 2 — Category Rankings
For each business category, calculates the number of distinct businesses, total reviews, and average star rating. Results are ordered alphabetically by category.

```sql
SELECT bc.category,
       COUNT(DISTINCT bc.business_id) AS number_of_businesses,
       COUNT(r.review_id)             AS category_review_count,
       AVG(r.stars)                   AS category_average_review
FROM business_categories bc
JOIN review r ON bc.business_id = r.business_id
GROUP BY bc.category
ORDER BY bc.category ASC;
```

**Edge cases covered:**
- Restaurants: shared by 6 businesses, largest multi-business category
- Mexican: shared by Tacos Chiwas and Ghost Ranch
- Pizza, Salad, Bookstores: single-business categories
- Sip Coffee and Beer: belongs to both Coffee & Tea and Bars, reviews count toward each independently

---

## 🛠️ How to Run

1. Open MySQL Workbench and connect to your local server
2. Run `drop.sql` to clear any existing tables
3. Run `create.sql` to build the schema
4. Run `insert.sql` to populate the database
5. Run `queries.sql` to execute all queries

---

## 🧑‍💻 Author

**Sean Austin**  
B.S. Applied Computing — Arizona State University  
[LinkedIn](https://www.linkedin.com/in/sean-austin-7b3678283/) • [GitHub](https://github.com/ayplusplus)
