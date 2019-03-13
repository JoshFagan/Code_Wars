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
 Count the occurrences of an integer in a linked list.
 
 - Parameter head: Head of linked list.
 - Parameter data: Integer to count occurrences of in linked list.
 
 - Returns: Number of occurrences of integer in linked list.
 */
func count(_ head: Node?, _ data: Int) -> Int
{
    guard let head = head
    else
    {
        return 0
    }
    
    // Does the sought after data match the current data?
    let match = (head.data == data) ? 1 : 0
    // Recursively find occurances of integer in child node.
    return match + count(head.next, data)
}

/**
 Count the number of nodes in a linked list.
 
 - Parameter head: Head of linked list.
 
 - Returns: Number of elements in linked list.
 */
func length(_ head: Node?) -> Int
{
    guard let head = head
        else
    {
        return 0
    }
    
    // Recursively find length of child node.
    return 1 + length(head.next)
}

/**
 Push a new node to the front of the supplied linked list.
 
 - Parameter head: Head of linked list.
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
 
 - Parameter head: Head of linked list.
 
 - Returns: String representation of linked list.
 */
func toString(_ head: Node?) -> (String)
{
    guard let head = head
    else {
        return "nil"
    }
    
    // Recursively generate string of child node.
    return "\(head.data) -> " + toString(head.next)
}

var head1 = buildOneTwoThree()

head1.next?.next?.next = buildOneTwoThree()
print( toString(head1) )
length(head1)

count( head1, 5 )
