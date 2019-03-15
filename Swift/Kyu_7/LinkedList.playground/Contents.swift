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

/**
 Test functions implemented for node class.
 
 - Parameter function: Name of function to test.
 - Parameter head:     Head of linked list to test function on.
 - Parameter Int:      Data to pass to tested function, if needed.
 
 - Returns: Nothing.
 */
func test( function: String, data: Int = 0, head: Node? = nil, index: Int = 0 )
{
    var head = head
    
    switch function
    {
        case "init":
            print( "Test node initializer: data = \(data).")
            print( "Before: " + toString( head ) )
            head = Node( data )
            print( "After: " + toString( head ) + "\n" )
        case "push":
            print( "Test push: data = \(data)" )
            print( "Before: " + toString( head ) )
            head = push( head, data )
            print( "After: " + toString( head ) + "\n" )
        case "buildOneTwoThree":
            print( "Test build one, two, three." )
            print( "Before: " + toString( head ) )
            head = buildOneTwoThree()
            print( "After: " + toString( head ) + "\n" )
        case "length":
            print( "Test length." )
            print( "Before: " + toString( head ) )
            print( "Length: \(length( head )).\n" )
        case "count":
            print( "Test count: element = \(data)." )
            print( "Before: " + toString( head ) )
            print( "Count: \(count( head, data )).\n" )
        case "getNth":
            print( "Test get nth element: n = \(index)." )
            print( "Before: " + toString( head ) )
            do{
                try print( "Element at \(index): \(getNth(head, index)?.data ?? -1).\n" )
            } catch let error {
                print("Error: \(error)\n")
            }
        case "insertNth":
            print( "Test insert nth node: n = \(index), data = \(data)" )
            print( "Before: " + toString( head ) )
            do{
                head = try insertNth(head, index, data)
                print( "After: " + toString( head ) + "\n" )
            } catch let error {
                print("Error: \(error)\n")
            }
        case "sortedInsert":
            print( "Test sorted insert: data = \(data)." )
            print( "Before: " + toString( head ) )
            head = sortedInsert(head, data)
            print( "After: " + toString( head ) + "\n")
        default:
            print( "Default." )
    }
}

var head: Node?

// Test init.
print( "\n***** Test Init *****" )
print( "=====================\n" )

test( function: "init", data: 1 )

// Test push.
print( "\n***** Test Push *****" )
print( "=====================\n" )

test( function: "push", data: 0 )
head = push( head, 0 )
test( function: "push", data: 1, head: head )

// Test buildOneTwoThree.
print( "\n***** Test Build One Two Three *****" )
print( "====================================\n" )

test( function: "buildOneTwoThree" )

// Test length.
print( "\n***** Test Length *****" )
print( "=======================\n" )
head = buildOneTwoThree()
test( function: "length" )
test( function: "length", head: head )

// Test count.
print( "***** Test Count *****" )
print( "======================\n" )
head = push( head, 3 )
test( function: "count", data: 3 )
test( function: "count", data: 3, head: head )
test( function: "count", data: 5, head: head )

// Test getNth.
head = buildOneTwoThree()
print( "\n***** Test Get Nth *****" )
print( "========================\n" )
test( function: "getNth", head: head, index: -1 )
test( function: "getNth", head: head, index: 0 )
test( function: "getNth", head: head, index: 1 )
test( function: "getNth", head: head, index: 2 )
test( function: "getNth", head: head, index: 3 )

// Test insertNth
print( "\n***** Test Insert Nth *****" )
print( "===========================\n" )
test( function: "insertNth", data: 0, head: nil, index: -1 )
test( function: "insertNth", data: 0, head: nil, index: 3 )
test( function: "insertNth", data: 0, head: nil, index: 0 )
test( function: "insertNth", data: 0, head: head, index: -1 )
head = buildOneTwoThree()
test( function: "insertNth", data: 0, head: head, index: 0 )
head = buildOneTwoThree()
test( function: "insertNth", data: 0, head: head, index: 1 )
head = buildOneTwoThree()
test( function: "insertNth", data: 0, head: head, index: 2 )
head = buildOneTwoThree()
test( function: "insertNth", data: 0, head: head, index: 3 )
head = buildOneTwoThree()
test( function: "insertNth", data: 0, head: head, index: 4 )

// Test sortedInsert.
print( "\n***** Test Sorted Insert *****" )
print( "==========================\n" )
test( function: "sortedInsert", data: 0 )
head = buildOneTwoThree()
test( function: "sortedInsert", data: 0, head: head )
head = buildOneTwoThree()
test( function: "sortedInsert", data: 1, head: head )
head = buildOneTwoThree()
test( function: "sortedInsert", data: 3, head: head )
head = buildOneTwoThree()
test( function: "sortedInsert", data: 4, head: head )
