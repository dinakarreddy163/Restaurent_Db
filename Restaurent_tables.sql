-- Table for Admins
CREATE TABLE mydb.Admins (
    admin_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15) UNIQUE
);

-- Table for Waiters
CREATE TABLE mydb.Waiters (
    waiter_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15) UNIQUE
);

-- Table for Cooks
CREATE TABLE mydb.Cooks (
    cook_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15) UNIQUE
);

-- Table for Customers
CREATE TABLE mydb.Customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15) UNIQUE
);

-- Table for Tables
CREATE TABLE mydb.Tables (
    table_id INT PRIMARY KEY,
    table_number INT NOT NULL UNIQUE,
    capacity INT NOT NULL,
    is_occupied BOOLEAN DEFAULT FALSE
);

-- Table for Orders
CREATE TABLE mydb.Orders (
    order_id INT PRIMARY KEY,
    table_id INT,
    customer_id INT,
    waiter_id INT,
    cook_id INT,
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (table_id) REFERENCES Tables(table_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (waiter_id) REFERENCES Waiters(waiter_id),
    FOREIGN KEY (cook_id) REFERENCES Cooks(cook_id)
);

-- Table for Menu Items
CREATE TABLE mydb.MenuItems (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Table for Order Items
CREATE TABLE mydb.OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES MenuItems(item_id)
);

-- Table for Login Credentials
CREATE TABLE mydb.Login (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    role ENUM('admin', 'waiter', 'cook') NOT NULL,
    user_reference_id INT NOT NULL,
    FOREIGN KEY (user_reference_id) REFERENCES Admins(admin_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (user_reference_id) REFERENCES Waiters(waiter_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (user_reference_id) REFERENCES Cooks(cook_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
