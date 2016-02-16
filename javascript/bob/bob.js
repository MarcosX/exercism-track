//
// This is only a SKELETON file for the "Bob" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

var Bob = function() {};

Bob.prototype = {
  hey: function(input) {
         var onlyValidChars = this.filterInvalidChars(input);

         if (this.yelling(onlyValidChars)) {
           return 'Whoa, chill out!';
         } else if (this.questioning(onlyValidChars)) {
           return 'Sure.';
         } else if (this.silecing(onlyValidChars)) {
           return 'Fine. Be that way!';
         }

         return 'Whatever.';
  },

  yelling: function(input) {
             var forcefuQuestionExclamationRe = /^[A-Z|\W]+[\!|\?]$/,
             shoutingRe = /^[A-Z]+$/;

             return forcefuQuestionExclamationRe.test(input) || shoutingRe.test(input);
           },

  questioning: function(input) {
                 return /\?$/.test(input);
               },

  silecing: function(input) {
              return input === '';
            },

  filterInvalidChars: function(input) {
                        return input.replace(/[\d|\s]+/g, '');
                      }
}

module.exports = Bob;
