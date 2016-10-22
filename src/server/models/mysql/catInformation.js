'use strict';

import MySQL from './mysql';

export default class CatInformation extends MySQL{
    constructor(args){
        const {
            cat_id,
            long_text_en,
            short_text_en,
            long_text_ua,
            short_text_ua,
            ...other
        } = args;

        super(other);

        this.catId = cat_id;
        this.longTextEn = long_text_en;
        this.shortTextEn = short_text_en;
        this.longTextUa = long_text_ua;
        this.shortTextUa = short_text_ua;
    }

    static load(catId){
        return new Promise((resolve, reject) => {
            const connection = CatInformation.getConnection();
            connection.query("SELECT * FROM cats_information WHERE cat_id=?", [catId], function(err, rows, fields){
                if (rows.length > 1) {
                    CatInformation.warnMultipleColumnsInSelect(arguments);
                }
                resolve( new CatInformation(rows[0]) );
            });
        });
    }

}
