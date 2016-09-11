'use strict';

import BaseController from '../baseController';

export default class Tools extends BaseController {
    constructor() {
        super();
    }

    handler(req, res, next) {
        if (!res.pageData.pageSubType){
            res.redirect("/tools/home");
            return;
        }
        res.render('tools');
    }
}
