var express = require('express');
var router = express.Router();

import passport from 'passport';
import cache, {PageCacheMiddleware} from '../server/cache';
import Home from '../server/controllers/home';
import Browse from '../server/controllers/browse';
import Contacts from '../server/controllers/contacts';
import Login from '../server/controllers/login';
import SignUp from '../server/controllers/signUp';
import Articles from '../server/controllers/articles';
import CatShows from '../server/controllers/catShows';

/* GET home page. */
router.get(
    '/',
    PageCacheMiddleware,
    cache.route(),
    new Home().run
);

/* GET browse page */
router.get(
    "/browse",
    PageCacheMiddleware,
    cache.route(),
    new Browse().run
);

/* GET articles page */
router.get(
    "/articles",
    PageCacheMiddleware,
    cache.route(),
    new Articles().run
);

/* GET catShows page */
router.get(
    "/catShows",
    PageCacheMiddleware,
    cache.route(),
    new CatShows().run
);

router.get(
    "/contacts",
    PageCacheMiddleware,
    cache.route(),
    new Contacts().run
);

router.get(
    '/login',
    new Login().run
);

router.post(
    '/login',
    passport.authenticate('local'),
    new Login().run
);

// router.get(
//     '/cat',
//     PageCacheMiddleware,
//     cache.route(),
//     new Cat().run
// )

//router.post('/signup', new SignUp().run);

module.exports = router;
