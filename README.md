# Visit Ha'il — SENG 362 Group Project
Student: Ali Alqunon | ID: 202104964

## Overview
A small responsive PHP + MySQL tourism web application. Visitors can register, log in, search tours, view details, book a date, see bookings, and cancel bookings. Admins can create, update, and hide tour listings. This is a classroom demo, not a payment service.

## Requirements
- PHP 8.1+ with PDO MySQL
- MySQL 8+ (XAMPP includes PHP/MySQL and Apache)
- Modern browser

## Setup (XAMPP on Windows)
1. Copy `Visit_Hail_Project` into `C:\xampp\htdocs\`.
2. Start **Apache** and **MySQL** in XAMPP Control Panel.
3. Open `http://localhost/phpmyadmin`, choose **Import**, and import `database.sql`.
4. By default config.php connects to `127.0.0.1`, database `visit_hail`, user `root`, blank password. Change environment variables DB_HOST, DB_NAME, DB_USER, DB_PASS if necessary.
5. Open `http://localhost/Visit_Hail_Project/`.
6. Register a visitor account, then log in to book.

## Enable admin (local demo only)
After registering a dedicated admin account, use phpMyAdmin SQL tab:
`UPDATE users SET role='admin' WHERE email='YOUR_ADMIN_EMAIL';`
Log out and log back in. Do not promote untrusted accounts.

## Architecture
Three-layer approach: presentation (PHP templates/CSS), application logic (PHP handlers), data layer (PDO + MySQL). Passwords are hashed, SQL queries are parameterized, output is HTML escaped, booking is transactional, and state-changing forms use CSRF tokens.

## Pages
- `index.php`: home
- `tours.php`: search/list
- `tour.php`: details
- `register.php`, `login.php`, `logout.php`: authentication
- `book.php`: reservation
- `my_bookings.php`: history/cancel
- `admin.php`: tour CRUD (soft delete)

## Git workflow required by rubric (must be done by students)
1. `git init` and commit starter files.
2. Create a remote GitHub repository, add it as origin, push `main`.
3. Make branches such as `feature/auth`, `feature/booking`, `feature/ui`.
4. Push branches and open pull requests; ask a teammate to review before merging.
5. Put the actual repository URL in the report and include screenshots of reviewed pull requests.

## Important limits
- No actual payments, emails, real availability from tour operators, or production deployment.
- Example tour names, prices, and capacities are **demo data**, not real offers.
- This package has not been tested against a running PHP/MySQL instance in this environment. Run the test cases and record actual results.
- Lighthouse scores must be measured in Chrome on a reachable running app. Do not submit invented scores.
