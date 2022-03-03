var exec = require('cordova/exec');

exports.coolMethod = function (arg0, success, error) {
    exec(success, error, 'rootPlugin', 'coolMethod', [arg0]);
};


exports.detectRoot = function (success, error) {
    exec(success, error, 'rootPlugin', 'detectRoot', [" "]);
};

exports.exitProgress = function (success, error) {
    exec(success, error, 'rootPlugin', 'exitProgress', [" "]);
};
