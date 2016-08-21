'use strict';

import BaseController from './baseController';

export default class Login extends BaseController {
    constructor() {
        super();
    }

    handler(req, res, next) {
        const data = req.body;
        res.status(200).end();
    }
}
