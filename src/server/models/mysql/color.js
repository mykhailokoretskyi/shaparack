'use strict';

import MySQL from './mysql';

export default class Color extends MySQL {
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
            const connection = Color.getConnection();
            connection.query("SELECT * FROM colors WHERE id=?", [id], function(err, rows, fields){
                if (rows.length > 1) {
                    Color.warnMultipleColumnsInSelect(arguments);
                }
                resolve( new Color(rows[0]) );
            });
        });
    }
}
