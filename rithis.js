var express = require('express'),
    stylus = require('stylus'),
    app = express();


app.configure(function () {
    this.set('view engine', 'blade');
    this.set('views', __dirname + '/views');

    this.use(stylus.middleware(__dirname + '/public'));
    this.use(express.static(__dirname + '/public'));
});


app.get('/', function (req, res) {
    res.render('index', function (err, html) {
        res.send(err ? 500 : html);
    });
});


app.listen(process.env.VCAP_APP_PORT || 3000);
