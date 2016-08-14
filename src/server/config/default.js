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
    }
};

export default config;
