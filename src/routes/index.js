var express = require('express');
var router = express.Router();

import passport from 'passport';
//import Account from '../src/server/mongo/model/account';
import Home from '../server/controllers/home';
import Login from '../server/controllers/login';
import SignUp from '../server/controllers/signUp';

/* GET home page. */
router.all('/', new Home().run);
router.post('/login', passport.authenticate('local'), new Login().run);
router.post('/signup', new SignUp().run);

module.exports = router;
