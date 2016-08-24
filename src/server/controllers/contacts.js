'use strict';

import BaseController from './baseController';
import _ from 'lodash';

export default class Contacts extends BaseController {
    constructor() {
        super();
    }

    handler(req, res, next) {
        const pageData = {
            lang: req.i18n_lang,
            recaptcha: true
        };
        res.render('contacts', _.assign(pageData, res.pageData));
    }
}
