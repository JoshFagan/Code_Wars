enum ErrorsToThrow: Error
{
    case indexOutOfRange
    case emptyList
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

struct Context {
    var source:Node?
    var dest:Node?
}

/**
 Append one linked list to the end of another linked list.
 
 - Parameter listA: Head of linked list to be appended to.
 - Parameter listB: Head of linked list to append.
 
 - Returns: Head of joined linked list.
 */
func append(_ listA:Node?, _ listB:Node?) -> Node?
{
    guard listA != nil else
    {
        return listB
    }
    
    // Make last element of first linked list link to first element of second linked list.
    do{
        try getNth( listA, length(listA)-1 )?.next = listB
    } catch let error {
        print("Error: \(error)")
        return nil
    }
    
    return listA
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
    guard let head = head else
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
    guard 0 <= index && index <= length(head) - 1 else
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
    guard 0 <= index && index <= length(head) else
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
 Implements Insertion Sort to rearranges nodes in a linked list so they are sorted in increasing order.
 
 - Parameter head: Head of linked list.
 
 - Returns: Head of sorted linked list.
 */
func insertSort(head: Node?) -> Node?
{
    var head = head
    var highestSorted: Node?
    var nextToSort: Node?
    var data: Int
    
    highestSorted = head
    nextToSort = highestSorted?.next
    
    
    while nextToSort != nil
    {
        if nextToSort!.data < highestSorted!.data
        {
            data = nextToSort!.data
            highestSorted!.next = nextToSort!.next
            head = sortedInsert( head, data )
            nextToSort = highestSorted?.next
        }
        else
        {
            highestSorted = nextToSort
            nextToSort = nextToSort?.next
        }
    }
    
    return head
}

/**
 Count the number of nodes in a linked list.
 
 - Parameter head: Head of linked list.
 
 - Returns: Number of elements in linked list.
 */
func length(_ head: Node?) -> Int
{
    guard let head = head else
    {
        return 0
    }
    
    // Recursively find length of child node.
    return 1 + length(head.next)
}

/**
 Takes the node from the front of the source list and moves it to the front of the destintation list.
 
 - Parameter source: Head of source linked list.
 - Parameter dest:   Head of destination linked list.
 
 - Returns: Structure contatining new heads of source and destination linked list.
 */
func moveNode(source:Node?, dest:Node?) throws -> Context?
{
    guard let source = source else
    {
        throw ErrorsToThrow.emptyList
    }
    
    let context = Context( source: source.next, dest: push( dest, source.data ) )
    
    return context
}

/**
 Takes the node from the front of the source list and moves it to the front of the destintation list.
 
 - Parameter source: Head of source linked list.
 - Parameter dest:   Head of destination linked list.
 
 - Returns: None.
 */
func moveNodeInPlace(_ source: inout Node?, _ dest: inout Node?) throws
{
    guard source != nil, dest != nil, source?.data != nil else
    {
        throw ErrorsToThrow.emptyList
    }
    
    dest = push( dest, (source?.data)! )
    source = source?.next
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
 Deletes any duplicate nodes from a list sorted in increasing order.
 
 - Parameter head: Head of sorted list.
 
 - Returns: Head of list with duplicates removed.
 */
func removeDuplicates(head:Node?) -> Node?
{
    var curr: Node?
    curr = head
    
    // Iterate through linked list and remove nodes with values duplicates of current node.
    while curr?.next != nil
    {
        if curr?.data == curr?.next?.data
        {
            curr?.next = curr?.next?.next
        }
        else
        {
            curr = curr?.next
        }
    }
    return head
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
    guard let head = head else
    {
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
func test( function: String, data: Int = 0, index: Int = 0, head: Node? = nil, head2: Node? = nil )
{
    var head = head
    var head2 = head2
    
    print( "Test \(function).")
    print( "Before: " + toString( head ) )

    switch function
    {
        case "append":
            print( "Before: " + toString( head2 ) )
            head = append( head, head2 )
        case "buildOneTwoThree":
            head = buildOneTwoThree()
        case "count":
            print( "element = \(data)." )
            print( "Count: \(count( head, data )).\n" )
        case "getNth":
            print( "n = \(index)." )
            do{
                try print( "Element at \(index): \(getNth(head, index)?.data ?? -1).\n" )
            } catch let error {
                print("Error: \(error)")
            }
        case "init":
            print( "data = \(data).")
            head = Node( data )
        case "insertNth":
            print( "n = \(index), data = \(data)" )
            do{
                head = try insertNth(head, index, data)
            } catch let error {
                print("Error: \(error)")
            }
        case "insertSort":
            head = insertSort(head: head)
        case "length":
            print( "Length: \(length( head )).\n" )
        case "moveNode":
            do{
                print( "Before: " + toString( head2 ) )
                let context = try moveNode( source: head, dest: head2 )
                print( "After: " + toString( context?.source ) )
                print( "After: " + toString( context?.dest ) )
            } catch let error {
                print("Error: \(error)\n")
            }
        case "moveNodeInPlace":
            do{
                print( "Before: " + toString( head2 ) )
                try moveNodeInPlace( &head, &head2 )
                print( "After: " + toString( head ) )
                print( "After: " + toString( head2 ) )
            } catch let error {
                print("Error: \(error)\n")
        }
        case "push":
            print( "data = \(data)" )
            head = push( head, data )
        case "removeDuplicates":
            head = removeDuplicates(head: head)
        case "sortedInsert":
            print( "data = \(data)." )
            head = sortedInsert(head, data)
        default:
            print( "Default." )
    }
    
    switch function
    {
        case "append", "buildOneTwoThree", "getNth", "init", "insertNth", "insertSort", "push", "removeDuplicates", "sortedInsert":
            print( "After: " + toString( head ) + "\n")
        default:
            print( "\n" )
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
test( function: "getNth", index: -1, head: head )
test( function: "getNth", index: 0, head: head )
test( function: "getNth", index: 1, head: head )
test( function: "getNth", index: 2, head: head )
test( function: "getNth", index: 3, head: head )

// Test insertNth
print( "\n***** Test Insert Nth *****" )
print( "===========================\n" )
test( function: "insertNth", data: 0, index: -1, head: nil )
test( function: "insertNth", data: 0, index: 3, head: nil )
test( function: "insertNth", data: 0, index: 0, head: nil )
test( function: "insertNth", data: 0, index: -1, head: head )
head = buildOneTwoThree()
test( function: "insertNth", data: 0, index: 0, head: head )
head = buildOneTwoThree()
test( function: "insertNth", data: 0, index: 1, head: head )
head = buildOneTwoThree()
test( function: "insertNth", data: 0, index: 2, head: head )
head = buildOneTwoThree()
test( function: "insertNth", data: 0, index: 3, head: head )
head = buildOneTwoThree()
test( function: "insertNth", data: 0, index: 4, head: head )

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

// Test insertSort.
print( "\n***** Test Insert Sort *****" )
print( "==========================\n" )
head = Node(1)
test( function: "insertSort", head: nil )
test( function: "insertSort", head: head )
head = push(push(head, 2), 3 )
test( function: "insertSort", head: head )

// Test append.
print( "\n***** Test Append *****" )
print( "=========================\n" )
var head2: Node?
head = nil
head2 = nil
test( function: "append", head: head, head2: head2 )
head = push(nil, 1)
head2 = nil
test( function: "append", head: head, head2: head2 )
head = nil
head2 = push(nil, 2)
test( function: "append", head: head, head2: head2 )
head = buildOneTwoThree()
head2 = push(push(push(nil, 6), 5), 4)
test( function: "append", head: head, head2: head2 )

// Test remove duplicates.
print( "\n***** Test Remove Duplicates *****" )
print( "==============================\n" )
test( function: "removeDuplicates", head: nil )
test( function: "removeDuplicates", head: Node(1) )
head = buildOneTwoThree()
head = push(head, 1)
head = push(head, 1)
head = push(head, 1)
test( function: "removeDuplicates", head: head )
head = buildOneTwoThree()
head?.next?.next?.next = buildOneTwoThree()
head = insertSort(head: head)
test( function: "removeDuplicates", head: head )

// Test move node.
print( "\n***** Test Move Node *****" )
print( "==============================\n" )
head = nil
head2 = nil
test( function: "moveNode", head: head, head2: head2 )
head = Node( 0 )
head2 = nil
test( function: "moveNode", head: head, head2: head2 )
head = Node( 0 )
head2 = Node( 0 )
test( function: "moveNode", head: head, head2: head2 )
head = buildOneTwoThree()
head2 = push(push(push(nil, 6), 5), 4)
test( function: "moveNode", head: head, head2: head2 )

// Test move node in place.
print( "\n***** Test Move Node In Place *****" )
print( "=====================================\n" )
head = nil
head2 = nil
test( function: "moveNodeInPlace", head: head, head2: head2 )
head = Node( 0 )
head2 = nil
test( function: "moveNodeInPlace", head: head, head2: head2 )
head = nil
head2 = Node( 0 )
test( function: "moveNodeInPlace", head: head, head2: head2 )
head = Node( 0 )
head2 = Node( 0 )
test( function: "moveNodeInPlace", head: head, head2: head2 )
head = buildOneTwoThree()
head2 = push(push(push(nil, 6), 5), 4)
test( function: "moveNodeInPlace", head: head, head2: head2 )
