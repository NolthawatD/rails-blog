# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

-   Ruby version

-   System dependencies

-   Configuration

-   Database creation

-   How to run the test suite

-   Services (job queues, cache servers, search engines, etc.)

-   Deployment instructions

-   ...

## Manage Database

-   Model \
    create the table

```ruby
rails generate model BlogPost title:string body:text
```

-   Migration \
    path storage see database.yml in config folder to keep sqlite

```ruby
rails db:migrate
```

-   Console \
    crud or interact the database

```ruby
rails console
.model_name
.all
.create(<column>: <value>)
.find(<id>)
instance = model.find(<id>)
instance.destroy


```

## Manage Route and Controllers

-   Define root path routes

```ruby
  # Defines the root path route ("/")
  root "blog_posts#index"
```

-   New controller in app/controllers /
    create file name a prural controller

```ruby
blog_posts_controller.rb
```

-   New views erb.html in views
    create folder

```ruby
blog_posts
```

create file

```ruby
index.html.erb
```

new variables for instance and share to erb template

```ruby
  def index
    @blog_posts = BlogPost.all
  end
```

## Install packages

-   see packages

```bash
rails g
```

-   devise

```bash
./bin/bundle bundle add devise
rails g devise:install
rails g devise:views
```

set default confing URL option

```ruby
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

create a model name User

> have a new routes "devise_for :users"
> have a new models "user"
> have a new

```bash
rails g devise User
rails db:migrate
```

seed data

```ruby
user = User.where(email: "nolthawat.d@gmail.com").first_or_initialize
user.update!(
  password: "password",
  password_confirmation: "password"
)
```
```bash
rails db:seed
```



-   tailwind-css

```bash
./bin/bundle add tailwindcss-rails
./bin/rails tailwindcss:install
```

-   run watch develop

```bash
bin/dev
```
