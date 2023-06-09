# README

## Pizza_Shop

Welcome to Pizza Shop API! This is a Rails application that provides a backend API for a pizza ordering system.
Restaurant owners can manage their menus and orders through this API, and customers can place orders.

### Link

-Below is a link to a video explainig how it works .
https://drive.google.com/file/d/1wC5QKA_qpqlKyPoqEcOdn4_7I_adbIj4/view

### Installation

- gem install rails
- rails new (name of project) --skip-javascript

#### Install dependencies:

- bundle install

#### Set up the database:

- rails db:migrate
- rails db:seed

#### Start the server:

- rails s

### Endpoints

- resources :restaurant_pizzas, only: [:create]
- resources :restaurants, only: [:index, :show, :destroy]
- resources :pizzas, only: [:index]

### License

This project is licensed under the MIT License. See LICENSE for more information.
