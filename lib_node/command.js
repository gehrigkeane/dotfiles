var execSync = require('child_process').execSync
module.exports = function _command(cmd, dir) {
  execSync(
    cmd, 
    {
      cwd: dir || __dirname,
      stdio:[0,1,2]
    });
};
