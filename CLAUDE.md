# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Ganasoft is a Ruby on Rails 4.2.1 application for managing livestock (animals) with genealogy tracking (mother/father relationships) and weight history. Uses PostgreSQL, Devise authentication, and is configured for Heroku deployment.

- Ruby 2.0.0-p451 (see `.ruby-version`)
- Rails 4.2.1

## Common Commands

```bash
# Setup
bundle install
rake db:create
rake db:migrate
rake db:seed              # Creates admin user from config/secrets.yml credentials

# Run development server
rails server              # Port 3000

# Database
rake db:reset             # Drop, create, migrate, seed
rake db:migrate
rake db:rollback

# Console
rails console

# No test framework or linter is configured
```

## Architecture

### Domain Model

- **Animal** — core entity with self-referential associations for genealogy (`belongs_to :mother_id`, `belongs_to :father_id`, both `class_name: "Animal"`). Has many `weight_histories`.
- **WeightHistory** — belongs to an Animal; tracks weight (decimal) with a date.
- **User** — Devise-based with invitable, confirmable, trackable modules.

Note: The migration columns are named `mother_id_id` and `father_id_id` (double `_id` suffix) due to Rails auto-appending `_id` to the `belongs_to` association names `mother_id` and `father_id`.

### Controllers

- **AnimalsController** — full CRUD, responds to HTML and JSON. `load_asociated` loads all animals for parent selection dropdowns.
- **WeightHistoriesController** — full CRUD, nested under animals in routes. Also responds to HTML and JSON.
- **UsersController** — requires authentication; users can only view their own profile.
- **VisitorsController** — public root page showing user count.

### Routes

```ruby
resources :animals do
  resources :weight_histories    # Nested
end
resources :weight_histories      # Also top-level
root to: 'visitors#index'
devise_for :users
resources :users
```

### Services

- **CreateAdminService** — creates/finds admin user using credentials from `config/secrets.yml`. Called during `db:seed`.

### Authentication

Devise handles all auth. Admin credentials are configured in `config/secrets.yml` (email, password, name). Email confirmation is enabled via the `:confirmable` module.

### Deployment

Heroku-ready with `app.json` defining post-deploy hooks (`db:migrate`, `db:seed`). Production uses Puma and `rails_12factor`.
