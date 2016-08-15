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
