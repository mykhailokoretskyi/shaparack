'use strict';

import BaseController from '../baseController';
import _ from 'lodash';

export default class ToolsHome extends BaseController {
    constructor() {
        super();
    }

    handler(req, res, next) {
        const pageData = {};

        if (!res.pageData.pageSubType){
            res.redirect("/tools/home");
            return;
        }

        res.render('tools', _.assign(res.pageData, pageData));
    }
}
