'use strict';

import mysql from 'mysql';
import Config from '../config';

const config = Config.getConfig();

const connection = mysql.createConnection( config.mysql.connection );
export default connection;
