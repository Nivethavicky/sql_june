-- creating database 
create database project;

show databases;
use project;

-- create table 
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    cuisine_type VARCHAR(50)
);

CREATE TABLE menu_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    restaurant_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    status ENUM('Placed', 'Preparing', 'Ready for Pickup', 'On the Way', 'Delivered', 'Cancelled') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    item_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);

INSERT INTO restaurants (name, address, phone_number, cuisine_type) 
VALUES 
    ('Saravana Bhavan', '123 Main St', '123-456-7890', 'South Indian'),
    ('Adyar Ananda Bhavan', '456 Elm St', '456-789-0123', 'South Indian'),
    ('MTR Restaurant', '789 Oak St', '789-012-3456', 'South Indian'),
    ('Udupi Palace', '321 Maple St', '321-654-9870', 'South Indian'),
    ('Madras Cafe', '555 Pine St', '555-321-0987', 'South Indian'),
    ('Andhra Spice', '987 Cedar St', '987-654-3210', 'South Indian'),
    ('Dakshin Delight', '654 Birch St', '654-987-3210', 'South Indian'),
    ('Coastal Kitchen', '876 Walnut St', '876-543-2109', 'South Indian'),
    ('Karnataka Cuisine', '234 Cherry St', '234-567-8901', 'South Indian'),
    ('Tamil Nadu Tadka', '789 Willow St', '789-123-4567', 'South Indian'),
    ('Kerala Kitchen', '432 Spruce St', '432-876-5432', 'South Indian'),
    ('Andhra Bhavan', '567 Ivy St', '567-210-9876', 'South Indian'),
    ('Udupi Bhavan', '876 Magnolia St', '876-543-2109', 'South Indian'),
    ('Malabar Dishes', '987 Poplar St', '987-210-8765', 'South Indian'),
    ('Mangalore Mess', '543 Elmwood St', '543-789-0123', 'South Indian'),
    ('Veggie Heaven', '765 Oakwood St', '765-321-0987', 'South Indian'),
    ('Spice Route', '876 Hawthorn St', '876-654-3210', 'South Indian'),
    ('Idli House', '345 Cedarwood St', '345-987-6543', 'South Indian'),
    ('Dosa Corner', '987 Birchwood St', '987-321-6540', 'South Indian'),
    ('Tiffin Express', '654 Pinecrest St', '654-210-9876', 'South Indian'),
    ('South Indian Savor', '321 Maplewood St', '321-876-5432', 'South Indian'),
    ('Curry Club', '876 Oakleaf St', '876-543-2109', 'South Indian'),
    ('Flavors of South', '345 Hickory St', '345-789-0123', 'South Indian'),
    ('Sambar House', '543 Walnutwood St', '543-210-9876', 'South Indian'),
    ('Rasam Junction', '987 Birchwood St', '987-654-3210', 'South Indian'),
    ('Southern Spice', '234 Mapleleaf St', '234-321-6540', 'South Indian'),
    ('Chettinad Chawla', '876 Sycamore St', '876-987-6543', 'South Indian'),
    ('Rice Bowl', '765 Cedarwood St', '765-210-9876', 'South Indian'),
    ('South Side Cafe', '543 Sprucewood St', '543-876-5432', 'South Indian'),
    ('Nala Kitchen', '111 Oak St', '111-222-3333', 'North Indian'),
    ('Punjab Grill', '222 Elm St', '222-333-4444', 'North Indian'),
    ('Delhi Darbar', '333 Maple St', '333-444-5555', 'North Indian'),
    ('Tandoori Flames', '444 Pine St', '444-555-6666', 'North Indian'),
    ('Naan N Curry', '555 Cedar St', '555-666-7777', 'North Indian'),
    ('Taj Mahal Restaurant', '666 Walnut St', '666-777-8888', 'North Indian'),
    ('Amritsari Dhaba', '777 Cherry St', '777-888-9999', 'North Indian'),
    ('Rajasthani Rasoi', '888 Willow St', '888-999-0000', 'North Indian'),
    ('Himalayan Kitchen', '999 Spruce St', '999-000-1111', 'North Indian'),
    ('Kashmiri Cuisine', '123 Ivy St', '123-456-7890', 'North Indian'),
    ('Pind Punjabi', '234 Magnolia St', '234-567-8901', 'North Indian'),
    ('Paneer Palace', '345 Poplar St', '345-678-9012', 'North Indian'),
    ('Bengali Bites', '456 Elmwood St', '456-789-0123', 'North Indian'),
    ('Lucknowi Lazzat', '567 Oakwood St', '567-890-1234', 'North Indian'),
    ('Chaat Corner', '678 Hawthorn St', '678-901-2345', 'North Indian'),
    ('Deccan Delight', '789 Cedarwood St', '789-012-3456', 'Karnataka Style'),
    ('Bangalore Bites', '890 Walnutwood St', '890-123-4567', 'Karnataka Style'),
    ('Mysore Masala', '901 Maplewood St', '901-234-5678', 'Karnataka Style');
    
    
--     table2 vzlue insert

INSERT INTO menu_items (restaurant_id, name, description, price) 
VALUES 
    -- For restaurant 1
    (1, 'Masala Dosa', 'Fermented crepe made from rice batter and black lentils, filled with spiced potato', 150),
    (1, 'Idli', 'Steamed cake made from fermented rice and black lentils', 50),
    (1, 'Vada', 'Fried savory doughnut made from lentil batter, served with chutney and sambar', 25),
    (1, 'Pongal', 'Savory rice dish made with rice and lentils, flavored with cumin and black pepper', 100),
    (1, 'Uttapam', 'Thick pancake made from fermented rice and lentil batter, topped with vegetables', 150),
    (1, 'Puri Bhaji', 'Deep-fried bread served with spicy potato curry', 30),
    (1, 'Upma', 'Savory South Indian dish made from semolina, served with chutney', 100),
    (1, 'Chapati', 'Thin unleavened flatbread, served with dal or curry', 150),
    (1, 'Parotta', 'Layered flatbread made from maida flour, served with side dish', 100),
    (1, 'Bisi Bele Bath', 'Spicy rice dish made with rice, lentils, vegetables, and spices', 100),
    (1, 'Puliyogare', 'Spicy tamarind rice dish cooked with peanuts, sesame seeds, and spices', 90),
    (1, 'Ghee Roast Dosa', 'Crispy crepe made from rice and lentil batter, roasted in ghee', 145),
    (1, 'Mysore Masala Dosa', 'Crispy crepe filled with spicy potato filling and chutney', 250),
    (1, 'Rava Idli', 'Soft and fluffy idlis made from semolina and rice flour', 100),
    -- For restaurant 2
    (2, 'Rava Dosa', 'Crispy crepe made from semolina and rice flour, served with chutney and sambar', 220),
    (2, 'Puliyogare', 'Spicy tamarind rice dish cooked with peanuts, sesame seeds, and spices', 250),
    (2, 'Bisi Bele Bath', 'Spicy rice dish made with rice, lentils, vegetables, and spices', 280),
    (2, 'Chow Chow Bhath', 'Combination of sweet kesari bath and spicy khara bath', 240),
    (2, 'Mysore Pak', 'Traditional South Indian sweet made from chickpea flour, ghee, and sugar', 180),
    (2, 'Ragi Mudde', 'Steamed finger millet balls, served with sambar or chutney', 200),
    (2, 'Neer Dosa', 'Soft, thin, rice crepes, served with coconut chutney or chicken curry', 230),
    (2, 'Mangalore Bonda', 'Crispy fried snack made from urad dal and rice flour, served with chutney', 190),
    (2, 'Kori Gassi', 'Spicy and tangy Mangalorean chicken curry, served with rice or neer dosa', 350),
    (2, 'Ghee Rice', 'Fragrant and flavorful rice dish cooked in ghee, served with gravy', 300),
    (2, 'Chicken Sukka', 'Dry chicken curry cooked with spices and coconut, a Mangalorean specialty', 320),
    (2, 'Fish Fry', 'Marinated fish fillets, deep-fried until crispy, served with lemon wedges', 350),
    (2, 'Kesari Bath', 'Sweet dish made from semolina, ghee, sugar, and saffron', 180),
    (2, 'Ragi Mudde', 'Steamed finger millet balls, served with sambar or chutney', 200),
      -- For restaurant 3
    
    (3, 'Pulao', 'Fragrant rice dish cooked with vegetables and spices', 130),
    (3, 'Roti', 'Whole wheat flatbread, served with curry or dal', 120),
    (3, 'Aloo Paratha', 'Flatbread stuffed with spiced mashed potatoes, served with yogurt or pickle', 140),
    (3, 'Vegetable Biryani', 'Fragrant rice dish cooked with mixed vegetables and aromatic spices', 150),
    (3, 'Paneer Tikka', 'Marinated and grilled cottage cheese cubes, served with mint chutney', 130),
    (3, 'Chole Bhature', 'Spicy chickpea curry served with deep-fried bread', 140),
    (3, 'Palak Paneer', 'Creamy spinach curry with chunks of cottage cheese', 140),
    (3, 'Dal Tadka', 'Tempered yellow lentils, flavored with spices and herbs', 100),
    (3, 'Veg Fried Rice', 'Indo-Chinese dish made with mixed vegetables and rice, stir-fried in spices', 130),
    (3, 'Veg Manchurian', 'Fried vegetable balls cooked in a tangy and spicy sauce', 140),
    (3, 'Gobi Manchurian', 'Fried cauliflower florets tossed in a spicy sauce', 120),
    (3, 'Chilli Paneer', 'Stir-fried paneer cubes cooked with onions, bell peppers, and spices', 140),
    (3, 'Paneer Butter Masala', 'Rich and creamy paneer curry made with butter, tomatoes, and spices', 150),
    (3, 'Veg Hakka Noodles', 'Stir-fried noodles with mixed vegetables, flavored with soy sauce and spices', 140),
    -- For restaurant 4
    (4, 'Veg Fried Rice', 'Indo-Chinese dish made with mixed vegetables and rice, stir-fried in spices', 230),
    (4, 'Gobi Manchurian', 'Fried cauliflower florets tossed in a spicy sauce', 210),
    (4, 'Chilli Paneer', 'Stir-fried paneer cubes cooked with onions, bell peppers, and spices', 240),
    (4, 'Mushroom Tikka', 'Marinated and grilled mushrooms, served with mint chutney', 220),
    (4, 'Veg Manchurian', 'Fried vegetable balls cooked in a tangy and spicy sauce', 200),
    (4, 'Paneer Tikka', 'Marinated and grilled cottage cheese cubes, served with mint chutney', 230),
    (4, 'Gulab Jamun', 'Deep-fried dumplings made from milk solids, soaked in sugar syrup', 180),
    (4, 'Rasgulla', 'Soft and spongy sweet made from chhena, cooked in sugar syrup', 200),
    (4, 'Rasam', 'Spicy and tangy South Indian soup made with tamarind, tomatoes, and spices', 150),
    (4, 'Curd Rice', 'Tempered rice mixed with yogurt and seasoned with mustard seeds and curry leaves', 180),
    (4, 'Mixed Vegetable Curry', 'Assorted vegetables cooked in a flavorful gravy', 220),
    (4, 'Vegetable Korma', 'Creamy and aromatic vegetable curry made with coconut milk and spices', 230),
    (4, 'Papad', 'Thin, crispy disc-shaped snack made from lentil or chickpea flour', 80),
    -- For restaurant 5
    (5, 'Chole Bhature', 'Spicy chickpea curry served with deep-fried bread', 200),
    (5, 'Dal Makhani', 'Creamy and rich lentil curry made with butter and cream', 220),
    (5, 'Aloo Gobi', 'Potato and cauliflower curry cooked with onions, tomatoes, and spices', 210),
    (5, 'Paneer Bhurji', 'Scrambled paneer cooked with onions, tomatoes, and spices', 230),
    (5, 'Malai Kofta', 'Creamy and rich dumplings made from paneer and vegetables, served in a creamy tomato-based sauce', 240),
    (5, 'Jeera Rice', 'Basmati rice flavored with cumin seeds, served with dal or curry', 180),
    (5, 'Mushroom Masala', 'Spicy and flavorful mushroom curry cooked with onions, tomatoes, and spices', 220),
    (5, 'Butter Naan', 'Soft and fluffy leavened bread brushed with butter', 120),
    (5, 'Bhindi Masala', 'Okra cooked with onions, tomatoes, and spices', 190),
    (5, 'Aloo Paratha', 'Whole wheat flatbread stuffed with spiced mashed potatoes, served with yogurt or pickle', 180),
    (5, 'Vegetable Pulao', 'Fragrant rice dish cooked with mixed vegetables and spices', 200),
    (5, 'Papad', 'Thin, crispy disc-shaped snack made from lentil or chickpea flour', 80),
    (5, 'Paneer Tikka', 'Marinated and grilled cottage cheese cubes, served with mint chutney', 230);


    

-- table3

INSERT INTO customers (username, email, password, full_name, address) 
VALUES 
    ('ravi_k', 'ravi.k@example.com', 'ravi@123', 'Ravi Kumar', '456 Walnut St'),
    ('deepa_s', 'deepa.s@example.com', 'deepa@456', 'Deepa Srinivasan', '789 Cedar St'),
    ('karthik_p', 'karthik.p@example.com', 'karthik@789', 'Karthik Prasad', '101 Birch St'),
    ('ananya_n', 'ananya.n@example.com', 'ananya@123', 'Ananya Nair', '123 Oak St'),
    ('arjun_r', 'arjun.r@example.com', 'arjun@456', 'Arjun Rajan', '456 Elm St'),
    ('priya_v', 'priya.v@example.com', 'priya@789', 'Priya Venkat', '789 Pine St'),
    ('manoj_s', 'manoj.s@example.com', 'manoj@123', 'Manoj Sharma', '101 Maple St'),
    ('nandini_m', 'nandini.m@example.com', 'nandini@456', 'Nandini Menon', '234 Cedar St'),
    ('anand_p', 'anand.p@example.com', 'anand@789', 'Anand Patel', '567 Walnut St'),
    ('deepak_k', 'deepak.k@example.com', 'deepak@123', 'Deepak Khanna', '678 Cedar St'),
    ('sneha_r', 'sneha.r@example.com', 'sneha@456', 'Sneha Rangan', '890 Pine St'),
    ('akash_g', 'akash.g@example.com', 'akash@789', 'Akash Gupta', '901 Elm St'),
    ('meera_v', 'meera.v@example.com', 'meera@123', 'Meera Varma', '234 Walnut St'),
    ('karthika_r', 'karthika.r@example.com', 'karthika@456', 'Karthika Ravi', '345 Pine St'),
    ('arvind_s', 'arvind.s@example.com', 'arvind@789', 'Arvind Swamy', '456 Maple St'),
    ('vignesh94', 'vignesh.94@example.com', 'vignesh@123', 'Vignesh Kumar', '789 Oak St'),
    ('priya_g', 'priya.g@example.com', 'priya@456', 'Priya Ganesh', '101 Pine St'),
    ('suresh_rao', 'suresh.rao@example.com', 'suresh@789', 'Suresh Rao', '234 Maple St'),
    ('ramesh_s', 'ramesh.s@example.com', 'ramesh@123', 'Ramesh Srinivasan', '345 Walnut St'),
    ('geetha_m', 'geetha.m@example.com', 'geetha@456', 'Geetha Mohan', '456 Cedar St'),
    ('karthik_k', 'karthik.k@example.com', 'karthik@789', 'Karthik Krishnan', '567 Pine St'),
    ('anitha_r', 'anitha.r@example.com', 'anitha@123', 'Anitha Raj', '678 Elm St'),
    ('arjun_n', 'arjun.n@example.com', 'arjun@456', 'Arjun Nair', '789 Oak St'),
    ('vani_k', 'vani.k@example.com', 'vani@789', 'Vani Kumar', '890 Maple St'),
    ('akash_p', 'akash.p@example.com', 'akash@123', 'Akash Prasad', '901 Walnut St'),
    ('deepa_g', 'deepa.g@example.com', 'deepa@456', 'Deepa Gupta', '123 Cedar St'),
    ('manoj_m', 'manoj.m@example.com', 'manoj@789', 'Manoj Menon', '234 Pine St'),
    ('sneha_k', 'sneha.k@example.com', 'sneha@123', 'Sneha Krishnan', '345 Elm St'),
     ('akash_s', 'akash.s@example.com', 'akash@123', 'Akash Sharma', '123 Oak St'),
    ('divya_r', 'divya.r@example.com', 'divya@456', 'Divya Rao', '456 Pine St'),
    ('karthik_v', 'karthik.v@example.com', 'karthik@789', 'Karthik Venkat', '789 Maple St'),
    ('priya_n', 'priya.n@example.com', 'priya@123', 'Priya Narayan', '101 Walnut St'),
    ('suresh_g', 'suresh.g@example.com', 'suresh@456', 'Suresh Ganesh', '234 Cedar St'),
    ('manju_k', 'manju.k@example.com', 'manju@789', 'Manju Krishnan', '567 Pine St');
    
--     table4

INSERT INTO orders (customer_id, restaurant_id, total_amount, status)
VALUES 
    (1, 1, 150.00, 'Placed'),
    (2, 2, 180.50, 'Preparing'),
    (3, 1, 200.25, 'Ready for Pickup'),
    (4, 3, 220.75, 'On the Way'),
    (5, 2, 195.00, 'Delivered'),
    (1, 3, 210.00, 'Placed'),
    (2, 1, 185.75, 'Preparing'),
    (3, 2, 195.50, 'Ready for Pickup'),
    (4, 3, 205.25, 'On the Way'),
    (5, 1, 225.00, 'Delivered'),
    (1, 2, 215.50, 'Placed'),
    (2, 3, 190.25, 'Preparing'),
    (3, 1, 220.75, 'Ready for Pickup'),
    (4, 2, 230.00, 'On the Way'),
    (5, 3, 235.25, 'Delivered'),
    (1, 1, 240.50, 'Placed'),
    (2, 2, 200.00, 'Preparing'),
    (3, 3, 225.75, 'Ready for Pickup'),
    (4, 1, 245.25, 'On the Way'),
    (5, 2, 245.50, 'Delivered'),
    (1, 3, 250.75, 'Placed'),
    (2, 1, 205.25, 'Preparing'),
    (3, 2, 230.50, 'Ready for Pickup'),
    (4, 3, 255.00, 'On the Way'),
    (5, 1, 255.75, 'Delivered'),
    (1, 2, 260.25, 'Placed'),
    (2, 3, 210.75, 'Preparing'),
    (3, 1, 235.00, 'Ready for Pickup'),
    (4, 2, 265.50, 'On the Way'),
    (5, 3, 265.75, 'Delivered'),
    (1, 1, 270.00, 'Placed'),
    (2, 2, 220.50, 'Preparing'),
    (3, 3, 240.75, 'Ready for Pickup'),
    (4, 1, 275.25, 'On the Way'),
    (5, 2, 275.50, 'Delivered'),
    (1, 3, 280.75, 'Placed'),
    (2, 1, 235.25, 'Preparing'),
    (3, 2, 250.50, 'Ready for Pickup'),
    (4, 3, 285.00, 'On the Way'),
    (5, 1, 285.75, 'Delivered'),
    (1, 2, 290.25, 'Placed'),
    (2, 3, 245.75, 'Preparing'),
    (3, 1, 265.00, 'Ready for Pickup'),
    (4, 2, 295.50, 'On the Way'),
    (5, 3, 295.75, 'Delivered');

    

-- table 5

INSERT INTO order_items (order_id, item_id, quantity, unit_price) VALUES
    (1, 1, 2, 100.00),
    (1, 2, 3, 50.00),
    (2, 3, 1, 200.00),
    (2, 4, 2, 150.00),
    (3, 5, 1, 180.00),
    (3, 6, 2, 120.00),
    (4, 7, 3, 90.00),
    (4, 8, 1, 220.00),
    (5, 9, 2, 140.00),
    (5, 10, 1, 210.00),
    (6, 11, 2, 110.00),
    (6, 12, 3, 130.00),
    (7, 13, 1, 250.00),
    (7, 14, 2, 160.00),
    (8, 15, 1, 270.00),
    (8, 16, 2, 180.00),
    (9, 17, 1, 290.00),
    (9, 18, 2, 200.00),
    (10, 19, 3, 100.00),
    (10, 20, 1, 310.00),
    (11, 21, 2, 220.00),
    (11, 22, 1, 330.00),
    (12, 23, 2, 240.00),
    (12, 24, 3, 110.00),
    (13, 25, 1, 350.00),
    (13, 26, 2, 250.00),
    (14, 27, 1, 370.00),
    (14, 28, 2, 260.00),
    (15, 29, 3, 120.00),
    (15, 30, 1, 390.00),
    (16, 31, 2, 270.00),
    (16, 32, 1, 410.00),
    (17, 33, 2, 280.00),
    (17, 34, 3, 130.00),
    (18, 35, 1, 430.00),
    (18, 36, 2, 290.00),
    (19, 37, 1, 450.00),
    (19, 38, 2, 300.00),
    (20, 39, 3, 140.00),
    (20, 40, 1, 470.00),
    (21, 41, 2, 310.00),
    (21, 42, 1, 490.00),
    (22, 43, 2, 320.00),
    (22, 44, 3, 150.00),
    (23, 45, 1, 510.00),
    (23, 46, 2, 330.00),
    (24, 47, 1, 530.00),
    (24, 48, 2, 340.00),
    (25, 49, 3, 160.00),
    (25, 50, 1, 550.00);



