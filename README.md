# Jungle

Jungle is a small e-commerce application with admin authentication built with Ruby on Rails 4.2 and Stripe.

## Screenshots

### Products Index
![Products Index](https://github.com/mattdanielmurphy/jungle-rails/blob/master/screenshots/products-index.png)

### Product Category: Apparel
![Product Category: Apparel](https://github.com/mattdanielmurphy/jungle-rails/blob/master/screenshots/product-category-apparel.png)

### Product Category: Electronics
![Product Category: Electronics](https://github.com/mattdanielmurphy/jungle-rails/blob/master/screenshots/product-category-electronics.png)

### Cart
![Cart](https://github.com/mattdanielmurphy/jungle-rails/blob/master/screenshots/cart.png)

### Checkout
![Checkout](https://github.com/mattdanielmurphy/jungle-rails/blob/master/screenshots/checkout.png)

### Admin Authentication
![Admin Authentication](https://github.com/mattdanielmurphy/jungle-rails/blob/master/screenshots/admin-authentication.png)

### Admin Product Page
![Admin Product Page](https://github.com/mattdanielmurphy/jungle-rails/blob/master/screenshots/admin-product-page.png)

## Setup

1. Clone this repository.
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
