'use strict';

import BaseController from './baseController';
import Image from '../models/mysql/image';
import Cat from '../models/mysql/cat';

export default class Home extends BaseController {
    constructor() {
        super();
    }

    handler(req, res, next) {
        const promises = [
            Image.loadImagesForHomeGallery(),
            Cat.loadCatsForSale()
        ];

        Promise.all(promises).then(values => {
            const pageData = {
                title: 'Express',
                mainGalleryImages: values[0],
                catsForSale: values[1]
            };

            res.render('home', pageData);
        });
    }
}
