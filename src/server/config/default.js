'use strict';

const config = {
    name: "default",
    mongodb: {
        domain: "localhost",
        database: "shaparack"
    },
    session: {
        secret: "simple",
        redis: {
            host: "com.petmarket.local",
            port: "6379"
        }
    },
    cache: {
        prefix: "default",
        expire: 5000
    }
};

export default config;
