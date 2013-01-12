var express = require('express'),
    stylus = require('stylus'),
    nib = require('nib'),
    app = express();


app.configure(function () {
    this.set('view engine', 'jade');
    this.set('views', __dirname + '/views');

    this.use(stylus.middleware({
        src:__dirname + '/public',
        compile: function (str, path) {
            return stylus(str)
                .set('filename', path)
                .set('compress', process.env.NODE_ENV == 'production')
                .use(nib())
                .import('nib');
        }
    }));
    this.use(express.static(__dirname + '/public'));
});


app.get('/', function (req, res) {
    res.render('index', function (err, html) {
        res.send(err ? 500 : html);
    });
});


app.listen(process.env.VCAP_APP_PORT || 3000);
