package scala;

class Bob {
  def hey(message:String):String = {
    var response = "Whatever."
    if(message == message.toUpperCase) {
      response = "Whoa, chill out!"
    } else if(message.takeRight(1) == "?") {
      response = "Sure."
    }
    response
  }
}

