$ ->
    main = new Main

    app = Sammy  ->
          # define a 'route'
          @get '#/', ->
              source   = $("#home-page-tpl").html();
              template = Handlebars.compile(source);
              mainHtml = template()
              $('#content .row').html(mainHtml);
              main.createCategoriesList(0);
              main.createCart()
          @get '#/category/:id', ->
              source   = $("#category-tpl").html();
              template = Handlebars.compile(source);
              mainHtml = template({name: 'Nazwa kategorii'})
              $('#content .row').html(mainHtml);
              main.createCategoriesList(this.params['id'])
              main.getHtmlOfProductsTable(this.params['id'])
              main.createCart()
          @get '#/product/:id', ->
              callback = (data) ->
                  source   = $("#product-tpl").html();
                  template = Handlebars.compile(source);
                  mainHtml = template({id: data.id, name:data.name, price:data.price, price_100: data.price * 100, buyer_id:3})
                  $('#content .row').html(mainHtml);

              $.get '/products/' + this.params['id'] + '.json', callback
              main.createCart()
          @get '#/search', ->

              callback = (data) ->
                  console.log(data);
                  source   = $("#search-results-tpl").html();
                  template = Handlebars.compile(source);
                  html = template({ products: data});
                  $('#content .row').html(html);

                  $('form#search input[name="search"]').val('')
                  $('form#search input[name="price_from"]').val('')
                  $('form#search input[name="price_to"]').val('')

              $.get '/search.json?' + $('form#search').serialize(), callback

          @post '#/orders/create', ->
              $.post('/orders/',
                  {
                      buyer_id: this.params['buyer_id']
                      price: this.params['price'],
                      product_id: this.params['product_id'],
                      quantity: this.params['quantity']
                  })
              this.redirect '#/orders'

          @get '#/orders', ->
              callback = (data) ->
                  source   = $("#orders-tpl").html();
                  template = Handlebars.compile(source);
                  html = template({ orders: data});
                  console.log(html)
                  $('#content .row').html(html);

              $.get '/orders.json', callback

          @get '#/orders/:id/remove', ->
              $.get '/orders/' + this.params['id'] + '/remove'
              this.redirect '#/orders'

    app.run '#/'

    $('form').submit ->
        return false;

    $('form#search').unbind("submit");


class Main
    constructor: ->

    createCategoriesList: (categoryId) ->
        callback = (data)->
            source   = $("#categories-tpl").html()
            template = Handlebars.compile(source)
            html = template({categories: data});

            $('#categories-list').html(html);

            Main.prototype.updateCategoriesList(categoryId)

            return true

        $.get('/categories/names.json', {}, callback, 'json')

    updateCategoriesList: (categoryId) ->
        $('#categories li').removeClass('active')
        if categoryId == 0
            # home page
            $('#categories-list a[href="#/"]').parent().attr('class','active');
        else
            $('#categories-list a[href="#/category/' + categoryId + '"]').parent().attr('class','active');

    getHtmlOfProductsTable: (categoryId) ->
        callback = (data) ->
            source   = $("#products-table-tpl").html();
            template = Handlebars.compile(source);
            html = template({ products: data});
            $('#main table').html(html);

        $.get '/categories/' + categoryId + '.json', callback

    createCart: ->
        callback = (data) ->
            source   = $("#orders-right-tpl").html();
            template = Handlebars.compile(source);
            html = template({ orders: data});
            $('#right').html(html);

        $.get '/orders.json', callback