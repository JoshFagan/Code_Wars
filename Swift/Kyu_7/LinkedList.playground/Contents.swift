enum ErrorsToThrow: Error
{
    case indexOutOfRange
}
    
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
 Returns the node stored at the Nth index position.
 Uses the C numbering convention that the first node is index 0.
 */
func getNth(_ head: Node?, _ index: Int) throws -> Node?
{
    guard 0 <= index && index <= length(head) - 1
        else
    {
        throw ErrorsToThrow.indexOutOfRange
    }
    
    // Return current node if index is current index.
    if index == 0
    {
        return head
    }
    
    // Recurently get Nth-1 node of child node.
    return try! getNth(head?.next, index-1)
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
func toString(_ head: Node?) -> String
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
length( head1 )
count( head1, 5 )
count( head1, 1 )

do{
    try getNth(head1, -1)?.data
} catch let error {
    print("Error: \(error)")
}

do{
    try getNth(head1, 0)?.data
    try getNth(head1, 2)?.data
    try getNth(head1, 5)?.data

} catch let error {
    print("Error: \(error)")
}

do{
    try getNth(head1, 6)?.data
} catch let error {
    print("Error: \(error)")
}
