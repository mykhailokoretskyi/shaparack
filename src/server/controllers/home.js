'use strict';

import BaseController from './baseController';

export default class Home extends BaseController {
    constructor() {
        super();
    }

    handler(req, res, next) {
        console.log(req.session);
        res.render('index', { title: 'Express' });
    }
}
