'use strict';

const express = require('express');
const router = express.Router('/tools');

import Tools from '../server/controllers/tools/home';
import requiresAuthentication from '../server/middleware/requiresAuthentication';

router.get(
    '/*',
    requiresAuthentication,
    new Tools().run
);

module.exports = router;
