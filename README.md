# motorhead でコントローラーを丸ごと置き換える

[motorhead](https://github.com/amatsuda/motorhead)を使うと、普段のページを丸ごと置き換えることが可能です。

# scaffold

scaffold でサンプルをとりあえず作ります

```
rails generate scaffold Book name:string price:integer description:text
```

# motorhead の設定

## g motorhead


```
rails g motorhead new_books
```

## engine.rb

確率を1/2ぐらいになるようにしています。

```ruby:app/engines/new_books/lib/new_books/engine.rb
require 'motorhead/engine'

module NewBooks
  class Engine < ::Rails::Engine
    include Motorhead::Engine

    active_if { rand(2).odd? }
  end
end
```

## ruotes.rb の設定

localhost:3000/books でアクセスしたら、Motorhead の Controllerを使うようにroutes.rb を設定します。

```ruby:app/engines/new_books/config/routes.rb
NewBooks::Engine.routes.draw do
  resources 'books', only: %w(index)
end
```

## controller の設定

```ruby:app/engines/new_books/app/controllers/new_books/books_controller.rb
class NewBooks::BooksController < ::BooksController
  include Motorhead::Controller

  def index
    @books = Book.limit(1)
  end

end
```

## view の設定

### テンプレートファイル

```erb:app/engines/new_books/app/views/new_books/books/index.html.erb
<%= stylesheet_link_tag "new_books/application", media: "all" %>
 <%= render 'books/title' %>
 foo
```

### パーシャルテンプレート

```erb:app/views/books/_title.html.erb
:metal: Motorhead
```

### CSS

```css:app/engines/new_books/app/assets/stylesheets/new_books/application.css
body {
  background-color: red;
}
```
