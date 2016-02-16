//
// This is only a SKELETON file for the "Bob" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

var Bob = function() {};

Bob.prototype.hey = function(input) {
         var WHATEVER = 'Whatever.',
         CHILL = 'Whoa, chill out!',
         SURE = 'Sure.',
         FINE = 'Fine. Be that way!';

         var chillRe = /^[A-Z|\W]+\!$/,
             forcefulQuestionRe = /^[A-Z|\W]+\?$/,
             shoutingRe = /^[A-Z]+$/,
             questionRe = /\?$/,
             nonWordsRe = /[\d|\s]+/g;

         var onlyLetters = input.replace(nonWordsRe, '');

         if (chillRe.test(onlyLetters)) {
           return CHILL;
         }
         if (forcefulQuestionRe.test(onlyLetters)) {
           return CHILL;
         }
         if (shoutingRe.test(onlyLetters)) {
           return CHILL;
         }
         if (questionRe.test(input)) {
           return SURE;
         }
         if (onlyLetters === '') {
           return FINE;
         }
         return WHATEVER;
};

module.exports = Bob;
