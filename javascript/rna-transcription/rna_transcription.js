var rnaTranscriptionTable = {
  C: 'G',
  G: 'C',
  A: 'U',
  T: 'A'
}
var toRna = function(dna){
  var transcribedRna = [];
  for(var i = 0; i<dna.length; i++){
    transcribedRna.push(rnaTranscriptionTable[dna[i]]);
  }
  return transcribedRna.join('');
}

module.exports = toRna;
