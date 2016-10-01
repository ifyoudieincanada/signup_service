# SignupService

The idea behind SignupService is it will be able to generate a series of unique
signup codes that can be used to create accounts on this website. This
application doesn't handle user creation, it only allows validation of users via
a preshared key.

Tables:
  * Keys
      The Keys table is the only table here. It's columns are `string:key` and
      `bool:claimed`.

To start your Phoenix app:

  * Run `setup.sh` to create the required `postgresql` users
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
