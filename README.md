# spree_paytm_gateway
Paytm payment gateway integration for spree


## Installation

1. Add this extension to your Gemfile with this line:

        gem 'spree_paytm', :github => 'niri4/spree_paytm_gateway'

2. Install the gem using Bundler:

        bundle install

3. Add migrations from extension:

        rails g spree_paytm:install

4. Restart your server

5. Add new payment method with provider

        Spree::Gateway::Paytm

6. In admin admin/payment_methods in paytm section add your hostname like 'http://HOSTNAME' example  'http://localhost:3000'in SITE URL:
