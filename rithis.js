var express = require('express'),
    stylus = require('stylus'),
    blade = require('blade'),
    app = express();


app.configure(function () {
    blade.Compiler.doctypes['xhtml'] = blade.Compiler.doctypes['xml'] + blade.Compiler.doctypes['1.1'];

    this.set('view engine', 'blade');
    this.set('views', __dirname + '/views');

    this.use(stylus.middleware({
        src:__dirname + '/public',
        compress: process.env.NODE_ENV == 'production'
    }));
    this.use(express.static(__dirname + '/public'));
});


app.get('/', function (req, res) {
    res.render('index', function (err, html) {
        res.send(err ? 500 : html);
    });
});


app.listen(process.env.VCAP_APP_PORT || 3000);
