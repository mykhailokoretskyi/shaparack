'use strict';

import mongoose from 'mongoose';
import CatSchema from '../schema/cat';

export default mongoose.model("Cat", CatSchema);
