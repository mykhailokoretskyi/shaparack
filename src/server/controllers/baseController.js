'use strict';

import uuid from 'uuid';

export default class BaseController {
    constructor() {
        this.run = this.run.bind(this);
    }

    run (req, res, next) {
        if (req.session && !req.session.uuid) {
            req.session.uuid = uuid.v4();
        }

        res.pageData = res.pageData || {};

        const urlTokens = this.getUrlTokens(req);
        res.pageData.pageType = urlTokens[0] || 'home';
        res.pageData.facebook = true;

        this.preProcess(req, res, next);

        const handlerName = req.method + 'handler';

        if (typeof this[handlerName] === 'function'){
            this[handlerName](req, res, next);
        } else {
            this.handler(req, res, next);
        }
    }

    getUrlTokens(req) {
        const url = req.url;
        const replace = url.replace("/","");
        const split = replace.split("?");
        const urlTokens = split[0].split("/");
        return urlTokens;
    }

    handler() {}
    preProcess() {}
}
