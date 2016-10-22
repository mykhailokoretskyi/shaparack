'use strict';

import BaseController from './baseController';
import _ from 'lodash';

export default class Cat extends BaseController {
    constructor() {
        super();
    }

    handler(req, res, next) {
        const pageData = {
            lang: req.i18n_lang
        };
        res.render('cat', _.assign(pageData, res.pageData));
    }
}