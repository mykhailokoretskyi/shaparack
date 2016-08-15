'use strict';

import BaseController from './baseController';

export default class Home extends BaseController {
    constructor() {
        super();
    }

    handler(req, res, next) {
        res.render('index', { title: 'Express' });
    }
}
