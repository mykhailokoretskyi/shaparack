'use strict';

export default function requiresAuthentication(req, res, next) {
    if (req.session.passport){
        next();
    } else {
        req.session.requiredAuthFrom = req.baseUrl + req.url;
        res.redirect("/login");
    }
}
