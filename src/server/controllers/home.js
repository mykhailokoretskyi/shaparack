'use strict';

import BaseController from './baseController';

export default class Home extends BaseController {
    constructor() {
        super();
    }

    handler(req, res, next) {
        res.render('index', {
            title: 'Express',
            mainGalleryImages: [
                {
                    path: "/img/happyClients",
                    name: "client_3.jpg"
                },
                {
                    path: "/img/happyClients",
                    name: "client_3.jpg"
                },
                {
                    path: "/img/happyClients",
                    name: "client_3.jpg"
                },
                {
                    path: "/img/happyClients",
                    name: "client_3.jpg"
                }
            ],
            catsForSale: [
                {
                    id: 1,
                    name: "Mock cat",
                    images: [
                        {
                            path: "/img/happyClients",
                            name: "client_3.jpg"
                        }
                    ]
                },
                {
                    id: 1,
                    name: "Mock cat",
                    images: [
                        {
                            path: "/img/happyClients",
                            name: "client_3.jpg"
                        }
                    ]
                },
                {
                    id: 1,
                    name: "Mock cat",
                    images: [
                        {
                            path: "/img/happyClients",
                            name: "client_3.jpg"
                        }
                    ]
                },
                {
                    id: 1,
                    name: "Mock cat",
                    images: [
                        {
                            path: "/img/happyClients",
                            name: "client_3.jpg"
                        }
                    ]
                },
                {
                    id: 1,
                    name: "Mock cat",
                    images: [
                        {
                            path: "/img/happyClients",
                            name: "client_3.jpg"
                        }
                    ]
                },
                {
                    id: 1,
                    name: "Mock cat",
                    images: [
                        {
                            path: "/img/happyClients",
                            name: "client_3.jpg"
                        }
                    ]
                }
            ]
        });
    }
}
