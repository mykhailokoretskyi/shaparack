'use strict';

const express = require('express');
const router = express.Router('/tools');

import Tools from '../server/controllers/tools/home';

router.get(
    '/*',
    new Tools().run
);

module.exports = router;
