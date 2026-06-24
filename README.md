# Landing Page

A lightweight, production-ready marketing landing page built with Ruby on Rails 8.

It is intentionally minimal: a single static page plus a custom 404. There is no
database, no background jobs, and no JavaScript framework beyond Turbo, so the app
boots fast and deploys as a small container.

## Requirements

- Ruby (see [`.ruby-version`](.ruby-version))
- Bundler

## Getting started

```bash
bin/setup          # install dependencies and clear logs/tmp
bin/dev            # start the server at http://localhost:3000
```

## Structure

- `app/controllers/pages_controller.rb` — serves `home` and the custom `not_found` page
- `app/views/pages/` — page markup (`home.html.erb`, `not_found.html.erb`)
- `app/assets/stylesheets/application.css` — all styling
- `config/routes.rb` — root route, `/up` health check, and a catch-all to the 404

## Testing

```bash
bin/rails test
```

## Linting and security scans

```bash
bin/rubocop          # Ruby style (rubocop-rails-omakase)
bin/brakeman         # static security analysis
bin/importmap audit  # JS dependency vulnerability scan
```

## Deployment

The app ships with a production [`Dockerfile`](Dockerfile). Build and run it anywhere
that hosts containers (a PaaS such as Render/Fly/Heroku, or your own Docker host):

```bash
docker build -t landing_page .
docker run -d -p 80:80 -e RAILS_MASTER_KEY=<config/master.key> --name landing_page landing_page
```

The container serves traffic through [Thruster](https://github.com/basecamp/thruster)
in front of Puma, with SSL enforced by default (set `RAILS_FORCE_SSL=false` to run
over plain HTTP locally).
