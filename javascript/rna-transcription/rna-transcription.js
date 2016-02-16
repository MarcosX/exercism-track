var rnaTranscriptionTable = {
  C: 'G',
  G: 'C',
  A: 'U',
  T: 'A'
}

var DnaTranscriber = function() {};

DnaTranscriber.prototype.toRna = function(dna){
  return dna.split('').map(function(e){
    return rnaTranscriptionTable[e];
  }).join('');
}

module.exports = DnaTranscriber;
