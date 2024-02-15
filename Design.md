# API Routes

## User
1. Authentication
  - /login 
  - /register

2. Exploring
  - /cities
  - /events
  - /event/:id
  - /recommended

3. Transaction
  - /get-cart
  - /post-cart
  - /buy
  - /get-ticket
  - /get-ticket-qr

4. Profile
  - /first-time-data
  - /update-user
  - /get-profile
  - /history

## Admin
1. Operation
  - /add-event
  - /add-sitting-arrgangment
  - /add-destination
  - /add-city
    
2. Finance
  - /add-credit
  - /generate-discount-coupon
  - /generate-cash-coupon
  - /run-discount

3. Dashboard
  - /sales-data
  - /popular
  - /generate-report

# DB design
1. account
- account_id @PK
- email_id @unique
- full_name
- city_id @FK
- wallet_balance
- password
- type User | Admin

3. City
- city_id @PK
- hero_image 
- cover_image

2. Event


4. Ticket


5. Transaction


6. Discount


7. Cart



