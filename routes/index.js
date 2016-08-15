var express = require('express');
var router = express.Router();

import passport from 'passport';
//import Account from '../src/server/mongo/model/account';
import Home from '../src/server/controllers/home';
import Login from '../src/server/controllers/login';
import SignUp from '../src/server/controllers/signUp';

/* GET home page. */
router.all('/', new Home().run);
router.post('/login', passport.authenticate('local'), new Login().run);
router.post('/signup', new SignUp().run);

module.exports = router;
