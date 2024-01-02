data class Node<T>(val nodeValue: T, var nextNode: Node<T>?, var previousNode: Node<T>?)

class Deque<T> {

    var head: Node<T>? = null
    var last: Node<T>? = head

    fun push(value: T) {
        if (head == null) {
            head = Node<T>(value, null, null)
            last = head
        } else {
            last?.nextNode = Node<T>(value, null, last)
            last = last?.nextNode
        }
    }

    fun pop(): T? {
        if (last == null) {
            return null
        } else {
            val returnValue = last?.nodeValue
            last = last?.previousNode
            last?.nextNode = null
            return returnValue
        }
    }

    fun unshift(value: T) {
        if (head == null) {
            head = Node<T>(value, null, null)
            last = head
        } else {
            head?.previousNode = Node<T>(value, head, null)
            head = head?.previousNode
        }
    }

    fun shift(): T? {
        if (head == null) {
            return null
        } else {
            val returnValue = head?.nodeValue
            head = head?.nextNode
            head?.previousNode = null
            return returnValue
        }
    }
}
