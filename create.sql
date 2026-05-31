-- ACO 320 MySQL Project - Final Project
-- Sean Austin
CREATE TABLE business (
    business_id char(22)        	NOT NULL,
    name varchar(100)    			NOT NULL,
    street varchar(100)    			NOT NULL,
    city varchar(50)     			NOT NULL,
    state char(2)         			NOT NULL,
    zip char(5)         			NOT NULL,
    stars float           			NOT NULL,
    review_count int             	NOT NULL,
    PRIMARY KEY (business_id),
    CHECK (stars >= 1.0 AND stars <= 5.0),
    CHECK (review_count >= 0)
);
CREATE TABLE business_categories (
    business_id char(22)        NOT NULL,
    category varchar(50)     	NOT NULL,
    PRIMARY KEY (business_id, category),
    FOREIGN KEY (business_id) references business(business_id)
);
CREATE TABLE user (
    user_id char(22)        		NOT NULL,
    name varchar(100)    			NOT NULL,
    review_count int             	NOT NULL,
    yelping_since char(10)        	NOT NULL,
    PRIMARY KEY (user_id),
    CHECK (review_count >= 0)
);
CREATE TABLE review (
    review_id char(22)        		NOT NULL,
    business_id char(22)        	NOT NULL,
    user_id char(22)        		NOT NULL,
    stars int             			NOT NULL,
    review_date char(10)        	NOT NULL,
    review_text varchar(5000)  		NOT NULL,
    PRIMARY KEY (review_id),
    FOREIGN KEY (business_id) references business(business_id),
    FOREIGN KEY (user_id) references user(user_id),
    CHECK (stars >= 1 AND stars <= 5)
);
