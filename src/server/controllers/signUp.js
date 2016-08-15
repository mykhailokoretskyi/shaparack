'use strict';

import BaseController from './baseController';
import passport from 'passport';
import Account from '../mongo/model/account';

export default class SignUp extends BaseController {
    constructor() {
        super();
    }

    handler(req, res, next) {
        const data = req.body;
        console.log(req, data);
        Account.register(new Account({ username : req.body.username }), req.body.password, function(err, account) {
            if (err) {
                return res.send({ account : account });
            }

            passport.authenticate('local')(req, res, function () {
                res.status(200).end();
            });
        });
    }
}
