'use strict';

import BaseController from './baseController';

export default class Login extends BaseController {
    constructor() {
        super();
    }

    POSThandler(req, res, next) {
        const redirectTarget = req.session.requiredAuthFrom || '/';
        if (req.session.passport){
            delete req.session.requiredAuthFrom;
        }
        res.redirect(redirectTarget);
    }

    GEThandler(req, res, next) {
        res.render('login');
    }
}
