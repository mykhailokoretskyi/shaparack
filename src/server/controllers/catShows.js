'use strict';

import BaseController from './baseController';
import Show from '../models/mysql/show';
import _ from 'lodash';

export default class CatShows extends BaseController {
    constructor() {
        super();
    }

    handler(req, res, next) {

        const promises = [
            Show.loadAll()
        ];

        Promise.all(promises).then((values)=>{
            const pageData = {
                shows: values[0],
                lang: req.i18n_lang
            };
            console.log(pageData.shows);
            res.render('catShows', _.assign(pageData, res.pageData));
        });
    }
}