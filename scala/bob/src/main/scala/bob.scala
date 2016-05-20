package scala;

class Bob {
  def hey(message:String):String = {
    if(shouting(message)) {
      return "Whoa, chill out!"
    } else if(questioning(message)) {
      return "Sure."
    } else if(silencing(message)) {
      return "Fine. Be that way!"
    }
    "Whatever."
  }

  private def questioning(message:String):Boolean = {
    message.takeRight(1) == "?"
  }

  private def shouting(message:String):Boolean = {
    message != message.toLowerCase && message == message.toUpperCase
  }

  private def silencing(message:String):Boolean = {
    message.trim.isEmpty
  }
}

