coolpay-ruby-client
======================
[![Build Status](https://travis-ci.org/CoolPay/coolpay-ruby-client.svg)](https://travis-ci.org/CoolPay/coolpay-ruby-client)

`coolpay-ruby-client` is a official client for [CoolPay API](http://www.coolpay.com/docs/). The Coolpay API enables you to accept payments in a secure and reliable manner. This gem currently support CoolPay `v10` api.

## Installation

Add to your Gemfile
  
    $ gem 'coolpay-ruby-client'

or install from Rubygems:
  
    $ gem install coolpay-ruby-client
  
It is currently tested with Ruby ( >= 2.1.x)

* MRI
* Rubinius (2.0)

## Usage

Before doing anything you should register yourself with CoolPay and get access credentials. If you haven't please [click](https://coolpay.com/) here to apply.

### Create a new API client

First you should create a client instance that is anonymous or authorized with `api_key` or login credentials provided by CoolPay. 

To initialise an anonymous client:

```
require 'coolpay/api/client'
client = CoolPay::API::Client.new
```

To initialise a client with CoolPay Api Key:

```
require 'coolpay/api/client'
client = CoolPay::API::Client.new(api_key: ENV['COOLPAY_API_KEY'])
```

Or you can provide login credentials like:

```
require 'coolpay/api/client'
client = CoolPay::API::Client.new(email: ENV['COOLPAY_LOGIN'], password: ENV['COOLPAY_PASSWORD'])
```

To pass request specific headers:

```
client = Coolpay::API::Client.new({ email: ENV['COOLPAY_LOGIN'], password: ENV['COOLPAY_PASSWORD'] }, 
                                   :headers => { 'CoolPay-Callback-URL' => 'https://webshop.com' }) 
```


### API Calls

You can afterwards call any method described in CoolPay api with corresponding http method and endpoint. These methods are supported currently: `get`, `post`, `put`, `patch` and `delete`.

```
client.get("/activity").each do |activity|
  puts activity["id"]
end

```

If you want raw http response, headers Please add `:raw => true` parameter:

```
status, body, headers = client.get("/activity", :raw => true)

if status == 200
  JSON.parse(body).each do |activity|
    puts activity["id"]
  end
else
  puts "Error: #{body}"
end

```

### Handling API exceptions

By default `(get|post|patch|put|delete)` will return JSON parsed body on success (i.e. `2xx` response code) otherwise it will raise appropriate error. Your code should handle the errors appropriately. Following error codes are supported currently:


Response status |  Error    |
----------------| ----------|
`400` | `CoolPay::API::BadRequest`
`401` | `CoolPay::API::Unauthorized` 
`402` | `CoolPay::API::PaymentRequired`
`403` | `CoolPay::API::Forbidden`
`404` | `CoolPay::API::NotFound`
`405` | `CoolPay::API::MethodNotAllowed`
`406` | `CoolPay::API::NotAcceptable`
`409` | `CoolPay::API::Conflict`
`500` | `CoolPay::API::ServerError`

All exceptions inherits `CoolPay::API::Error`, so you can listen for any api error like:

```
begin
  client.post("/payments", :currency => :DKK, :order_id => '1212')
  ... 
rescue CoolPay::API::Error => e
  puts e.body
end
```

You can read more about api responses at [http://www.coolpay.com/docs/](http://www.coolpay.com/docs).

## Contributions

To contribute:

1. Write a spec that fails
2. Fix spec by adding/changing code
3. Add feature or bugfix to changelog in the "Unreleased" section
4. Submit a pull request
5. World is now a better place! :)

### Running the specs

```
bundle exec rspec
```
