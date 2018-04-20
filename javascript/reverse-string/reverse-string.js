const reverseString = function(string) {
  // split string into chars so we can loop through them
  const stringChars = string.split('')
  // apply reduce prepending each char to the accumulator
  return stringChars.reduce((acc, char) => char + acc, '');
};

module.exports = reverseString;
