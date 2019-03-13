class Node
{
    var data: Int
    var next: Node?
    
    init( _ data: Int )
    {
        self.data = data
    }
    
    convenience init( _ next: Node?, _ data: Int )
    {
        self.init( data )
        self.next = next
    }
}

/**
 Builds the linked list:
 1 -> 2 -> 3 -> nil
 
 - Returns: The head of the linked list.
 */
func buildOneTwoThree() -> Node
{
    var head: Node
    
    head = push(nil, 3)
    head = push(head, 2)
    head = push(head, 1)
    
    return head
}

/**
 Push a new node to the front of the supplied linked list.
 
 - Parameter head: Head of linked list to push new node onto.
 - Parameter data: Data to store in new node that is being pushed onto the linked list.
 
 - Returns: The new head of the linked list.
 */
func push( _ head: Node?, _ data: Int ) -> Node
{
    return Node( head, data )
}

/**
 Generate string representation of supplied linked list.

 String is of the form:
    node1.data -> node2.data -> node3.data -> ... -> nil
 
 - Parameter head: Head of linked list to generate string of.
 
 - Returns: String representation of linked list.
 */
func toString(_ head: Node?) -> (String)
{
    guard let h = head
    else {
        return "nil"
    }
    
    // Reccursively generate string of child node
    return "\(h.data) -> " + toString(h.next)
}

var head1 = buildOneTwoThree()

print( toString(head1) )
