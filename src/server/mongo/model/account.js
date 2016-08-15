'use strict';

import mongoose from 'mongoose';
import passportLocalMongoose from 'passport-local-mongoose';
import AccountSchema from '../schema/account';

AccountSchema.plugin(passportLocalMongoose);

export default mongoose.model('Account', AccountSchema);
