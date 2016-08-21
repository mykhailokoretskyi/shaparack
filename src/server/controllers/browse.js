'use strict';

import BaseController from './baseController';
import Cat from '../models/mysql/cat';
import _ from 'lodash';

export default class Browse extends BaseController {
    constructor() {
        super();
    }

    handler(req, res, next) {
        if(!req.query.type || !req.query.breed){
            res.redirect('/');
            return;
        }
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
            res.render('browse', _.assign(res.pageData, pageData));
        });
    }
}
