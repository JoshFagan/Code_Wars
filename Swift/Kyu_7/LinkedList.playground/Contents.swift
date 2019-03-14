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
 Insert a new node at any index within a list.
 
 - Parameter head:  The head of the linked list.
 - Parameter index: Index to insert new node at.
 - Parameter data:  Data stored in new node.
 
 - Returns: Head of linked list after node is added.
 */
func insertNth(_ head: Node?, _ index: Int, _ data: Int) throws -> Node?
{
    guard 0 <= index && index <= length(head)
        else
    {
        throw ErrorsToThrow.indexOutOfRange
    }
    
    // If inserting at start of linked list, push new node.
    if index == 0
    {
        return push(head, data)
    }
    
    // Insert node at index
    let parent = try! getNth(head, index-1)
    parent?.next = Node( parent?.next, data )
    
    return head
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
 Inserts a node into the correct location of a pre-sorted linked list which is sorted in ascending order.
 
 - Parameter head: The head of the linked list.
 - Parameter data: Data stored in node that is to be added to linked list.
 
 - Returns: The head of the linked list after sorted insertion.
 */
func sortedInsert(_ head: Node?, _ data: Int) -> Node?
{
    guard let head = head else
    {
        return push(nil, data)
    }
    
    if data <= head.data
    {
        return push(head, data)
    }
    
    head.next = sortedInsert(head.next, data)
    return head
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


// Begin testing
var head: Node?

// Test out initializing one node.
print( "Test out initializing one node: data = 10" )
head = Node( 10 )
print( toString( head ) )

// Test out push.
print( "Test out push: head = nil, data = 0" )
head = push( nil, 0 )
print( toString( head ) )
print( "Test out push: head = 0, data = 1" )
head = push( head, 1 )
print( toString( head ) )

// Test out build one, two, three.
print( "Test out build one, two, three." )
head = buildOneTwoThree()
print( toString( head ) )
head?.next?.next?.next = buildOneTwoThree()
print( toString( head ) )

// Test out length.
print( "Test out length (6)." )
print( length( head ) )

// Test out count.
print( "Test out count: element = 5 (0)" )
print( count( head, 5 ) )
print( "Test out count: element = 1 (2)" )
print( count( head, 1 ) )

// Test out get nth element.
do{
    print( "Test out get nth element: n = -1 (Out of bounds)" )
    try print( getNth(head, -1)?.data ?? -1 )
} catch let error {
    print("Error: \(error)")
}

do{
    print( "Test out get nth element: n = 0 (1)" )
    try print( getNth( head, 0 )?.data ?? -1 )
    print( "Test out get nth element: n = 2 (3)" )
    try print( getNth( head, 2 )?.data ?? -1 )
    print( "Test out get nth element: n = 5 (3)" )
    try print( getNth( head, 5 )?.data ?? -1 )

} catch let error {
    print("Error: \(error)")
}

do{
    print( "Test out get nth element: n = 6 (Out of bounds)" )
    try print( getNth( head, 6 )?.data ?? -1 )
} catch let error {
    print("Error: \(error)")
}


// Test insert nth node.
do{
    print( "Test insert nth node: index = -1, data = -1 (Out of bounds)" )
    head = try insertNth( head, -1, -1 )!
    print(toString(head))
} catch let error {
    print("Error: \(error)")
}

do{
    print( "Test insert nth node: index = 0, data = 0" )
    head = try insertNth( head, 0, 0 )!
    print(toString(head))
    print( "Test insert nth node: index = 3, data = 4" )
    head = try insertNth( head, 3, 4 )!
    print(toString(head))
    print( "Test insert nth node: index = 8, data = 8" )
    head = try insertNth( head, 8, 8 )!
    print(toString(head))
} catch let error {
    print("Error: \(error)")
}

do{
    print( "Test insert nth node: index = 10, data = 10 (Out of bounds)" )
    head = try insertNth( head, 10, 10 )!
    print(toString(head))
} catch let error {
    print("Error: \(error)")
}

do{
    print( "Test insert nth node with empty linked list: index = 0, data = 10" )
    let head2 = try insertNth( nil, 0, 10 )!
    print(toString(head2))
} catch let error {
    print("Error: \(error)")
}


// Test sorted insert.
print( "Test sorted insert." )
head = nil
print( "Insert 0 to nil." )
head = sortedInsert(head, 0)
print( toString( head ) )
print( "Insert -1." )
head = sortedInsert(head, -1)
print( toString( head ) )
print( "Insert 2." )
head = sortedInsert(head, 2)
print( toString( head ) )



