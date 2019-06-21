var path = require('path'),
fs = require("fs");
exports.privateKey = fs.readFileSync(path.join(__dirname, './private/privkey1.pem')).toString();
exports.certificate = fs.readFileSync(path.join(__dirname, './private/cert1.pem')).toString();