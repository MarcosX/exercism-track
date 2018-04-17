var TwoFer = function () {};

TwoFer.prototype.twoFer = function (who) {
  let name = who || 'you';
  return `One for ${name}, one for me.`;
};

module.exports = TwoFer;
