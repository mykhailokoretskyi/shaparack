'use strict';

import MySQL from './mysql';
import Image from './image';

export default class Show extends MySQL {
    constructor (args){
        const {
            id,
            title,
            text,
            video,
            date_of_show,
            ...other
        } = args;

        super(other);

        this.id = id;
        this.title = title;
        this.text = text;
        this.video = video;
        this.dateOfShow = date_of_show;
        this.images = [];

    }

    static load (id){
        return new Promise((resolve, reject)=>{
                const connection = Show.getConnection();
                connection.query(`SELECT * FROM shows WHERE id=?`,[id], function(err, rows, fields){
                    if (rows.length > 1) {
                        Show.warnMultipleColumnsInSelect(arguments);
                    }
                    const shows = new Show(rows[0]);
                    shows.initDependencies().then(()=>{
                        resolve(shows);
                    })
                });
            }
        );
    }

    static loadAll (){
        return new Promise ((resolve, reject)=>{
            const shows = [];
            const connection = Show.getConnection();
            connection.query(`SELECT * FROM shows`,(err, rows, fields)=>{
                rows.forEach((row)=>{
                    shows.push(new Show(row).initDependencies());
                });
                Promise.all(shows).then((values)=>{
                    resolve(values);
                });
            });
        });
    }

    initDependencies (){
        return new Promise((resolve, reject)=>{
            Promise.all([
                Image.loadImagesForShow(this.id)
            ]).then((values)=>{
                this.images = values[0];
                resolve(this);
            });
        });
    }

}