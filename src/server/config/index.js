'use strict';

import _ from 'lodash';

const defaultConfig = require('./default');
const environmentOverlay = require('./' + (process.env.NODE_ENV || 'default'));

export default class Config {
    constructor() {
    }

    static config = _.assign({}, defaultConfig.default, environmentOverlay.default);

    static getConfig() {
        return Config.config;
    }
}
