package scala;

class Bob {
  def hey(message:String):String = {
    replyTo(findTypeOf(message))
  }

  private def replyTo(messageType:String):String = messageType match {
    case "shouting" => "Whoa, chill out!"
    case "questioning" => "Sure."
    case "silencing" => "Fine. Be that way!"
    case _ => "Whatever."
  }

  private def findTypeOf(message:String):String = {
    if(shouting(message)) {
      "shouting"
    } else if(questioning(message)) {
      "questioning"
    } else if(silencing(message)) {
      "silencing"
    } else {
      "none"
    }
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

