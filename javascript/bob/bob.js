//
// This is only a SKELETON file for the "Bob" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

var Bob = function() {
  this.WHATEVER = 'Whatever.';
  this.CHILL = 'Whoa, chill out!';
  this.SURE = 'Sure.';
  this.FINE = 'Fine. Be that way!';
};

Bob.prototype = {
  hey: function(input) {
         var onlyValidChars = this.filterInvalidChars(input);

         if (this.yelling(onlyValidChars)) {
           return this.CHILL;
         } else if (this.questioning(onlyValidChars)) {
           return this.SURE;
         } else if (this.silecing(onlyValidChars)) {
           return this.FINE;
         }

         return this.WHATEVER;
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
