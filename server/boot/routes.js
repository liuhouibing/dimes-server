// Copyright IBM Corp. 2014,2015. All Rights Reserved.
// Node module: loopback-example-user-management
// This file is licensed under the MIT License.
// License text available at https://opensource.org/licenses/MIT

var dsConfig = require('../datasources.json');
var path = require('path');
const request = require('request');

module.exports = function (app) {
  var User = app.models.user;

  //login page
  app.get('/', function (req, res) {
    var credentials = dsConfig.emailDs.transports[0].auth;
    res.render('index', {
      email: credentials.user,
      password: credentials.pass
    });
  });
 
  //go page
  app.get('/go', function (req, res) {
    var credentials = dsConfig.emailDs.transports[0].auth;
    res.render('login', {
      email: credentials.user,
      password: credentials.pass
    });
  });

  //verified
  app.get('/verified', function (req, res) {
    res.render('verified');
  });

  //log a user in
  app.post('/login', function (req, res) {
    User.login({
      email: req.body.email,
      password: req.body.password
    }, 'user', function (err, token) {
      if (err) {
        if (err.details && err.code === 'LOGIN_FAILED_EMAIL_NOT_VERIFIED') {
          res.render('reponseToTriggerEmail', {
            title: '登录失败',
            content: err,
            redirectToEmail: '/api/users/' + err.details.userId + '/verify',
            redirectTo: '/',
            redirectToLinkText: '点击这里',
            userId: err.details.userId
          });
        } else {
          res.render('response', {
            title: '登录失败. 错误的用户名或密码',
            content: err,
            redirectTo: '/',
            redirectToLinkText: '请再次登录',
          });
        }
        return;
      }
     
      //token.user is object constructed by functions, cann't be used directly. therefore token.user.validTo doesn't work too.
      var userString = JSON.stringify(token);
      var userObj = JSON.parse(userString);
      var validTo = userObj.user.validTo;
      
      if (validTo === null) {
        validTo = "试用";
      } 
      
      res.render('home', {
        email: req.body.email,
        accessToken: token.id,
        userId: token.userId,
        validTo: validTo,
        redirectUrl: '/api/users/change-password?access_token=' + token.id + '&userId' + token.userId + '&email=' + req.body.email
      });
    });
  });

  //log a user out
  app.get('/logout', function (req, res, next) {
    if (!req.accessToken) return res.sendStatus(401);
    User.logout(req.accessToken.id, function (err) {
      if (err) return next(err);
      res.redirect('/');
    });
  });

  //send an email with instructions to reset an existing user's password
  app.post('/request-password-reset', function (req, res, next) {
    User.resetPassword({
      email: req.body.email
    }, function (err) {
      if (err) return res.status(401).send(err);

      res.render('response', {
        title: '密码重置',
        content: '请检查您的邮件，其中有具体的密码重置指导',
        redirectTo: '/',
        redirectToLinkText: '登录'
      });
    });
  });

  //show password reset form
  app.get('/reset-password', function (req, res, next) {
    if (!req.accessToken) return res.sendStatus(401);
    res.render('password-reset', {
      redirectUrl: '/api/users/reset-password?access_token=' +
        req.accessToken.id
    });
  });


  app.get('/password-change', function (req, res, next) {
    //if (!req.body.access_token) return res.sendStatus(401);
    res.render('password-change', {
      email: req.query.email,
      accessToken: req.query.access_token,
      userId: req.query.userId,
      redirectUrl: '/api/users/change-password?access_token='+ req.query.access_token
    });

  });

};
