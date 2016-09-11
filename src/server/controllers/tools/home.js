'use strict';

import BaseController from '../baseController';

export default class Tools extends BaseController {
    constructor() {
        super();
    }

    handler(req, res, next) {
        if(!req.session.passport){
            res.redirect("/login");
            return;
        }
        res.render('tools');
    }
}
