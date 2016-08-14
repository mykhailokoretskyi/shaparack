var express = require('express');
var router = express.Router();
import Home from '../src/server/controllers/home';

/* GET home page. */
router.get('/', new Home().run);

module.exports = router;
