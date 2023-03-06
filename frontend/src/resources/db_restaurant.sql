-- db_restaurant

CREATE TABLE food(
    food_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    food_name VARCHAR(255),
    food_star VARCHAR(255),
    food_vote VARCHAR(255),
    food_price VARCHAR(255),
    food_discount VARCHAR(255),
    food_desc VARCHAR(255),
    food_status VARCHAR(255),
    food_type VARCHAR(255),
    food_category VARCHAR(255),
    food_src VARCHAR(255)
)