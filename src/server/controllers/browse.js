'use strict';

import BaseController from './baseController';
import Cat from '../models/mysql/cat';

export default class Browse extends BaseController {
    constructor() {
        super();
    }

    handler(req, res, next) {
        const promises = [
            Cat.loadCatsByQuery(req.query)
        ];

        Promise.all(promises).then(values => {
            const pageData = {
                title: 'Change it',
                cats: values[0],
                lang: req.i18n_lang,
                query: req.query
            };
            console.log(res);
            res.render('browse', pageData);
        });
    }
}
