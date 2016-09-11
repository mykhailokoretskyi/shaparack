var express = require('express');
var path = require('path');
import Config from './src/server/config';

var i18n=require("i18n-express");
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var redis   = require("redis");
var session = require('express-session');
var redisStore = require('connect-redis')(session);
var client  = redis.createClient();
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var mongoose = require('mongoose');

import Account from './src/server/mongo/model/account';

var config = Config.getConfig();

var routes = require('./src/routes/index');
var toolsRoutes = require('./src/routes/tools');

//////////////////////////////////////////////////////////
mongoose.connect(`mongodb://${config.mongodb.domain}/${config.mongodb.database}`);
var db = mongoose.connection;
db.on('error', () => {
    throw new Error("Cannot connect to mongo");
});
db.once('open', () => {
    console.log("Connected to mongo");
});
//////////////////////////////////////////////////////////

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'src/views'));
app.set('view engine', 'ejs');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));

app.use(session({
    secret: config.session.secret,
    // create new redis store.
    store: new redisStore({ host: config.session.redis.host, port: config.session.redis.host, client: client}),
    saveUninitialized: false,
    resave: false
}));

app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(passport.initialize());
app.use(passport.session());
app.use(express.static(path.join(__dirname, 'public')));
app.use(i18n({
    translationsPath: path.join(__dirname, 'i18n'),
    siteLangs: ["en","ua"],
    cookieLangName: "LANGUAGE",
    paramLangName: "lang",
    defaultLang: "en"
}));

// passport config
passport.use(new LocalStrategy(Account.authenticate()));
passport.serializeUser(Account.serializeUser());
passport.deserializeUser(Account.deserializeUser());

app.use('/', routes);
app.use('/tools', toolsRoutes);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') !== 'production') {
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
  });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: {}
  });
});


module.exports = app;
