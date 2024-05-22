# Ticket Booking Golang
  Ticket booking Rest API built in Go and postgres

## Database Setup
  1. Create a Postgres 16.1 Database
  2. Add database URL to .env file
  3. Run to get the latest DB state 
```sh
make migrate-up-all
```
  4. See [Makefile](Makefile) for all migrate command


# Architect

## Pages
| No. | Route                                                           | Description                                  |
| --- | ---                                                             | ---                                          |
| 1.  | /                                                               | Landing                                      |
| 2.  | /login                                                          | Login                                        |
| 3.  | /register                                                       | Register                                     |
| 4.  | /welcome                                                        | On boarding                                  |
| 5.  | /explore                                                        | Explore                                      |
| 6.  | /event/:event_slug                                              | Event Page                                   |
| 7.  | /book?event=<event_slug>,type=<ticket_type>,quantity=<quantity> | Payment Page                                 |
| 8.  | /book/:payment_id                                               | Payment confirmation + Ticket Download       |
| 9.  | /settings                                                       | On boarding page loaded with user preference |
| 10. | /history                                                        | History of payments + Download Ticket again  |
|     | TODO                                                            |                                              |
| 11. | /admin/events                                                   | List of events (newest first )               |
| 12. | /admin/:event_slug                                              | Form to update, create, delete event         |
| 13. | /admin/sales                                                    | some sales data                              |

## API Routes

### User
1. Authentication
  - POST /api/auth/login 
  - POST /api/auth/register
  - POST /api/auth/signout

2. Exploring
  - GET /api/cities?q=<query>
  - GET /api/events?tags=[],price_low,price_high,type,date_start,date_end,sort=nearest|price_low_to_high|price_high_to_low
  - GET /api/event/:slug

3. Transaction
  - GET /api/history
  - POST /api/book
    - Body :
      ```
        {
          "event": "<event_slug>",
          "type": "<ticket_type>",
          "quantity": "<quantity>"
        }
      ```
  - GET /api/ticket/:transaction_id

4. Profile
  - POST /api/onboarding
  - POST /api/settings
  - DELETE /api/delete_account

### TODO: Admin
1. Operation
  - GET /api/admin/new 
  - POST /api/admin/:event_slug
  - PUT /api/admin/:event_slug
  - DELETE /api/admin/:event_slug
