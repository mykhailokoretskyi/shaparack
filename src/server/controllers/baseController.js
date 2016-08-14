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

        console.log(req.session.uuid);

        this.handler(req, res, next);
    }

    handler() {}
}
