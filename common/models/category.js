'use strict';

module.exports = function (Category) {
    Category.observe('access', function limitToTenant(ctx, next) {
        var LoopBackContext = require('loopback-context');
        var myctx = LoopBackContext.getCurrentContext();
        var accessToken = myctx.get('accessToken');

        //console.log(accessToken, ctx.query, ctx.query.where);
        
        if (accessToken == undefined) {
            var err = new Error("User's token is missing");
            err.statusCode = 400;
            //console.log(1);            
            next(err);
        }else if (ctx.query.where == undefined) {
            ctx.query.where = { UserID: accessToken.userId };
            //console.log(2);
            next();
        } else if (ctx.query.where.UserID == undefined) {
            ctx.query.where.UserID = accessToken.userId;
            //console.log(3);
            next();
        } else {
            var err = new Error("User's token is missing - Others");
            err.statusCode = 400;
            //console.log(4);            
            next(err);
        };

    });
};
