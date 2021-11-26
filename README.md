# OmniAuth::Decidim

This is the [Decidim](https://github.com/decidim/decim) strategy for OmniAuth. It should be used when using a Decidim application as an OAuth provider.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-decidim'
```

And then execute:

    $ bundle

## Version compatiblity

Depending in which Decidim version it's being used in the application is necessary to use differents versions of omniauth-decidim for compatibility reasons.

|omniauth-decidim version | decidim version |
|-------------------------|-----------------|
| 0.1.0                   | <    0.25.2     |
| 0.2.1                   | >=   0.25.2     |

## Usage

### Configure the Decidim application which acts as the OAuth provider

You need to create an OAuth application at your Decidim provider installation in order to get the Client ID, Client Secret and Site parameters. Check [Decidim's related documentation](https://docs.decidim.org/en/services/social_providers/#_decidim) in how to configure the Decidim social provider.

### Configure the Decidim OAuth clients

Enable `:decidim` as an OmniAuth strategy in the client application. To do it, set the `omniauth/decidim/enabled` key to true in `config/secrets.yml` .
Optionally, the strategy can be further configured by also adding the `client_id`, `client_secret` and `site_url` keys with the values you got from your Decidim provider installation. This setting will be shared amongst all organizations in the instance, but can be selectively overriden in each organization's system administration panel.

This is an example `config/secrets.yml`:

```ruby
  omniauth:
    decidim:
      enabled: true
      client_id: <%= ENV["DECIDIM_CLIENT_ID"] %>
      client_secret: <%= ENV["DECIDIM_CLIENT_SECRET"] %>
      site_url: <%= ENV["DECIDIM_SITE_URL"] %>
```

Since Decidim v0.22.0, once enabled, the `:decidim` omniauth client strategy will be automatically loaded at boot time. Thus, there's no need to tell Devise about the omniauth strategy.

## Authentication Hash

An example auth hash available in `request.env['omniauth.auth']`:

```ruby
{
  :provider => "decidim",
  :uid => "123456",
  :info => {
    :nickname => "foobar",
    :name => "Foo Bar",
    :email => "foo@bar.com",
    :image => "http://www.example.org/avatar.jpeg",
  },
  :credentials => {
    :token => "a1b2c3d4...", # The OAuth 2.0 access token
    :secret => "abcdef1234"
  }
}
```

## Following our license

If you plan to release your application you'll need to publish it using the same license: GPL Affero 3. We recommend doing that on GitHub before publishing, you can read more on "[Being Open Source From Day One is Especially Important for Government Projects](http://producingoss.com/en/governments-and-open-source.html#starting-open-for-govs)". If you have any trouble you can contact us on [Gitter](https://gitter.im/decidim/decidim).
