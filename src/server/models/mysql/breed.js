'use strict';

import MySQL from './mysql';

export default class Breed extends MySQL {
    constructor(args) {
        const {
            id,
            code,
            label,
            ...other
        } = args;

        super(other);

        this.id = id;
        this.code = code;
        this.label = label;
    }

    static load(id) {
        return new Promise((resolve, reject) => {
            const connection = Breed.getConnection();
            connection.query("SELECT * FROM breeds WHERE id=?", [id], function(err, rows, fields){
                if (rows.length > 1) {
                    Breed.warnMultipleColumnsInSelect(arguments);
                }
                resolve( new Breed(rows[0]) );
            });
        });
    }
}
