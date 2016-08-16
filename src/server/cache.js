'use strict';

import Config from './config';
import _ from 'lodash';
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

export function PageCacheMiddleware(req, res, next){
    const name = [
        req.url,
        req.method,
        req.i18n_lang
    ];
    res.use_express_redis_cache = true;
    res.express_redis_cache_name = name.join(":");
    next();
}
