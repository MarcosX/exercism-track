package scala;

class Bob {
  def hey(message:String):String = {
    var response = "Whatever."
    if(shouting(message)) {
      response = "Whoa, chill out!"
    } else if(questioning(message)) {
      response = "Sure."
    }
    response
  }

  private def questioning(message:String):Boolean = {
    message.takeRight(1) == "?"
  }

  private def shouting(message:String):Boolean = {
    message != message.toLowerCase && message == message.toUpperCase
  }
}

