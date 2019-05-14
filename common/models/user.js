// Copyright IBM Corp. 2014,2015. All Rights Reserved.
// Node module: loopback-example-user-management
// This file is licensed under the MIT License.
// License text available at https://opensource.org/licenses/MIT

var config = require('../../server/config.json');
var path = require('path');

//Replace this address with your actual address
var senderAddress = 'dimes.businesscard@gmail.com'; 

module.exports = function(User) {
  //send verification email after registration
  User.afterRemote('create', function(context, user, next) {
    var options = {
      type: 'email',
      to: user.email,
      from: senderAddress,
      subject: '人情往来账-感谢您的注册',
      template: path.resolve(__dirname, '../../server/views/verify.ejs'),
      redirect: '/verified',
      user: user
    };

    user.verify(options, function(err, response) {
      if (err) {
        User.deleteById(user.id);
        return next(err);
      }
      context.res.render('response', {
        title: '人情往来账-注册成功',
        content: '请检查您的邮件，并点击验证链接，然后才可以登录',  redirectTo: '/',
        redirectToLinkText: '登录'
      });
    });
  });
  
  // Method to render
  User.afterRemote('prototype.verify', function(context, user, next) {
    context.res.render('response', {
      title: '一封包括验证链接的邮件已经被发送到您的邮箱',
      content: '请检查您的邮件，并点击验证链接，然后才可以登录',
      redirectTo: '/',
      redirectToLinkText: '登录'
    });
  });

  //send password reset link when requested
  User.on('resetPasswordRequest', function(info) {
    var url = 'http://' + config.host + ':' + config.port + '/reset-password';
    var html = '点击 <a href="' + url + '?access_token=' +
        info.accessToken.id + '">这里</a> 重置您的密码';

    User.app.models.Email.send({
      to: info.email,
      from: senderAddress,
      subject: '人情往来账-密码重置',
      html: html
    }, function(err) {
      if (err) return console.log('> error sending password reset email');
      console.log('> sending password reset email to:', info.email);
    });
  });

  //render UI page after password change
  User.afterRemote('changePassword', function(context, user, next) {
    context.res.render('response', {
      title: '密码修改成功',
      content: '请用新密码再次登录',
      redirectTo: '/',
      redirectToLinkText: '登录'
    });
  });

  //render UI page after password reset
  User.afterRemote('setPassword', function(context, user, next) {
    context.res.render('response', {
      title: '密码重置成功',
      content: '您的密码已经被成功重置',
      redirectTo: '/',
      redirectToLinkText: '登陆'
    });
  });


};
