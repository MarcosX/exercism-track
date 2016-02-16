//
// This is only a SKELETON file for the "Bob" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

var Bob = function() {};

Bob.prototype = {
  hey: function(input) {
         if (this.yelling(input)) {
           return 'Whoa, chill out!';
         } else if (this.questioning(input)) {
           return 'Sure.';
         } else if (this.silecing(input)) {
           return 'Fine. Be that way!';
         }

         return 'Whatever.';
  },

  yelling: function(input) {
             return !(input === input.toLowerCase()) && input === input.toUpperCase();
           },

  questioning: function(input) {
                 return /\?$/.test(input);
               },

  silecing: function(input) {
              return /^\s*$/.test(input);
            },
}

module.exports = Bob;
