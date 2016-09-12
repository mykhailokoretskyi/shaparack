'use strict';

import BaseController from '../baseController';
import _ from 'lodash';

export default class ToolsMessages extends BaseController {
    constructor(){
        super();
    }

    handler(req, res, next){
        const id = req.params[0];
        let message, messageList;

        if (id){
            //TODO: load message by id here
            if (this.isRemoveAction(req)){
                //TODO: remove message
                res.redirect('/tools/messages');
                return;
            }
        } else {
            //TODO: load all messages
        }

        const pageData = {
            messageId: id,
            action: id ? 'read' : 'list',
            messageList: messageList ? messageList : [],
            message: message ? message : {}
        };

        res.render("tools", _.assign(pageData, res.pageData));
    }

    isRemoveAction(req) {
        //TODO: implement it
        return false;
    }
}
