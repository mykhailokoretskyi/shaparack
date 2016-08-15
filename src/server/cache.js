'use strict';

import Config from './config';
var config = Config.getConfig();
var redis   = require("redis");
var client  = redis.createClient();
import expressRedisCache from 'express-redis-cache';

var cache = expressRedisCache({
    client: client,
    prefix: config.cache.prefix,
    expire: config.cache.expire
});

export default cache;
