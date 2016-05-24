package scala;

class Bob {
  def hey(message:String):String = message match {
    case _ if shouting(message) => "Whoa, chill out!"
    case _ if questioning(message) => "Sure."
    case _ if silencing(message) => "Fine. Be that way!"
    case _ => "Whatever."
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

