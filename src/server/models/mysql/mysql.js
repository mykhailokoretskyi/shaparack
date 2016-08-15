'use strict';

import Model from '../model';
import connection from '../../mysql/connection';

export default class MySQL extends Model {
    constructor(args) {
        const {...other} = args;
        super(other);
    }

    static getConnection(){
        return connection;
    }

    static warnMultipleColumnsInSelect(args) {

    }
}
