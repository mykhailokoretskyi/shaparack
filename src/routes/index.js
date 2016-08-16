var express = require('express');
var router = express.Router();

import passport from 'passport';
import cache, {PageCacheMiddleware} from '../server/cache';
import Home from '../server/controllers/home';
import Login from '../server/controllers/login';
import SignUp from '../server/controllers/signUp';

/* GET home page. */
router.get(
    '/',
    PageCacheMiddleware,
    cache.route(),
    new Home().run
);
router.post('/login', passport.authenticate('local'), new Login().run);
router.post('/signup', new SignUp().run);
router.get('/users', cache.route(), function(req, res, next) {
    res.send('respond with a resource');
});

module.exports = router;
