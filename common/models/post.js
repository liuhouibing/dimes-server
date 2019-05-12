'use strict';

module.exports = function(Post) {
    Post.observe('access', function limitToTenant(ctx, next) {
        var LoopBackContext = require('loopback-context');
        var myctx = LoopBackContext.getCurrentContext();
        var accessToken = myctx.get('accessToken');

      //  console.log(accessToken, ctx.query, ctx.query.where);
        
        if (accessToken == undefined) {
            var err = new Error("User's token is missing");
            err.statusCode = 400;            
            next(err);
        }else if (ctx.query.where == undefined) {
            ctx.query.where = { UserID: accessToken.userId };            
            next();
        } else if (ctx.query.where.UserID == undefined) {
            ctx.query.where.UserID = accessToken.userId;            
            next();
        } else {
            var err = new Error("User's token is missing - Others");
            err.statusCode = 400;        
            next(err);
        };

      //  console.log("->", ctx.query, ctx.query.where);

    });
};
