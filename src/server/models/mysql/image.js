'use strict';

import MySQL from './mysql';

export default class Image extends MySQL {
    constructor(args) {
        const {
            id,
            name,
            path,
            width,
            height,
            ...other
        } = args;

        super(other);

        this.id = id;
        this.name = name;
        this.path = path;
        this.width = width;
        this.height = height;
    }

    static load(id) {
        return new Promise((resolve, reject) => {
            const connection = Image.getConnection();
            connection.query("SELECT * from images where id=?", [id], function(err, rows, fields){
                if (rows.length > 1) {
                    Image.warnMultipleColumnsInSelect(arguments);
                }
                resolve( new Image(rows[0]) );
            });
        });
    }

    static loadImagesForHomeGallery(){
        const images = [];
        return new Promise((resolve, reject) => {
            const connection = Image.getConnection();
            connection.query(`
                SELECT * 
                FROM images i 
                INNER JOIN (image_mappings im) 
                ON (i.id=im.image_id) 
                WHERE im.destination_id = (SELECT id 
                    FROM image_destinations 
                    WHERE label = 'Home Page Gallery')`,
                (err, rows, fields) => {
                    rows.forEach((row) => {
                        images.push(new Image(row));
                    });
                    resolve(images);
                }
            );
        });
    }

    static getImagesForCat(catId) {
        if (!catId){
            throw new Error("catId is missing. Cannot load images");
        }
        const images = [];
        return new Promise((resolve, reject) => {
            const connection = Image.getConnection();
            connection.query(`
                SELECT * 
                FROM images i 
                INNER JOIN (image_mappings im) 
                ON (i.id=im.image_id) 
                WHERE im.cat_id = ?
                    AND im.destination_id = (SELECT id 
                        FROM image_destinations 
                        WHERE label = 'Cat')`,
                [ catId ],
                (err, rows, fields) => {
                    rows.forEach((row) => {
                        images.push(new Image(row));
                    });
                    resolve(images);
                }
            );
        });
    }
}
