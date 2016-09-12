'use strict';

const express = require('express');
const router = express.Router('/tools');

import ToolsHome from '../server/controllers/tools/home';
import ToolsMessages from '../server/controllers/tools/messages';
import requiresAuthentication from '../server/middleware/requiresAuthentication';

router.use(requiresAuthentication);

router.get(
    '/',
    new ToolsHome().run
);

router.get(
    '/home',
    new ToolsHome().run
);

router.get(
    /(?:\/remove)?\/messages(?:\/(\d+))?/,
    new ToolsMessages().run
);

router.get(
    '/messages/:id',
    new ToolsMessages().run
);



module.exports = router;
