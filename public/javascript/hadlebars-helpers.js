
Handlebars.registerHelper('list', function(items, options) {
    out = "";

    for(var i=0, l=items.length - 1; i<l; i++) {
        out = out + "<li><a href='#/category/" + items[i].id + "'>" + items[i].name + "</a></li>";
    }

    return out;
});


Handlebars.registerHelper('products-list', function(items, options) {
    out = ""

    for(var i=0, l=items.length-1; i<l; i++) {
        out = out + "<tr><td>" + items[i].name + "</td><td>" + items[i].price + "zł</td><td><a href='#/product/" + items[i].id + "'>Zobacz</a></td></tr>";
    }

    return out;
});


Handlebars.registerHelper('orders-list', function(items, options) {
    out = ""

    for(var i=0, l=items.length-1; i<l; i++) {
        out = out + "<tr><td>" + items[i].name + "</td><td>" + items[i].price + "zł</td><td>" + items[i].quantity + "</td><td>" + items[i].price_q + "zł</td><td><a href='#/orders/" + items[i].id + "/remove'>Usuń</a></td></tr>";
    }

    return out;
});

Handlebars.registerHelper('simple-list', function(items, options) {
    out = ""

    for(var i=0, l=items.length-1; i<l; i++) {
        out = out + "<li>" + items[i].name + "</li>";
    }

    return out;
});