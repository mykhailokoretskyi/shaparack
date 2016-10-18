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
            port: "6379",
            ttl: 1
        }
    },
    cache: {
        prefix: "shaparack",
        expire: 1
    },
    mysql: {
        connection: {
            host: "localhost",
            user: "shaparack",
            password: "shaparack",
            database: "shaparack"
        }
    }
};

export default config;
