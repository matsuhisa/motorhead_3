# motorhead でコントローラーを丸ごと置き換える

[motorhead](https://github.com/amatsuda/motorhead)を使うと、普段のページを丸ごと置き換えることが可能です。

サンプルページ

* https://evening-lowlands-34087.herokuapp.com/books

# scaffold

scaffold でサンプルを作ります。書籍（book）と著者（author）について用意します

```
rails generate scaffold Book name:string price:integer description:text
rails generate scaffold Author name:string description:text
rails generate model BookAuthor book_id:integer author_id:integer
```

# motorhead の設定

## Gemfile

```
gem 'motorhead', require: ['motorhead', 'motorhead/road_crew']
```

## g motorhead

```
rails g motorhead new_books
```

## engine.rb

アクセスする1/2で表示するようにしています。

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

http://localhost:3000/books にアクセスしたら、Motorhead の Controller を使うように routes.rb を設定します。

```ruby:app/engines/new_books/config/routes.rb
NewBooks::Engine.routes.draw do
  resources 'books', only: %w(index)
end
```

## controller の設定

置き換える Controller

```ruby:app/engines/new_books/app/controllers/new_books/books_controller.rb
class NewBooks::BooksController < ::BooksController
  include Motorhead::Controller

  def index
    super
    @authors = Author.all
  end

end
```

## view の設定

* motorhead で作ったEnginesにviewを設置します
 * EnginesにあるCSSファイルを読み込みます
 * renderでは、app/views にあるファイルを読み込みます

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
