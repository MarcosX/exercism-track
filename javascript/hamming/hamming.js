var Hamming = function() {};

Hamming.prototype.compute = function(a_dna, b_dna) {
  if(a_dna.length != b_dna.length) {
    throw new Error('DNA strands must be of equal length.');
  }
  
  return this.calculate_difference(a_dna, b_dna);
}

Hamming.prototype.calculate_difference = function(a_dna, b_dna) {
  var count = 0;
  for(var i = 0; i < a_dna.length; i++) {
    if(a_dna[i] != b_dna[i]) {
      count++;
    }
  }

  return count;
}

module.exports = Hamming;
