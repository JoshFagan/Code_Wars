class Node
{
    var data: Int
    var next: Node?
    
    init( _ data: Int )
    {
        self.data = data
    }
}

func push( _ head:Node?, _ data:Int ) -> Node
{
    guard let h = head
    else
    {
        return Node(data)
    }
    
    let newHead = Node( data )
    newHead.next = h
    
    return newHead
}

func buildOneTwoThree() -> Node
{
    var head: Node
    
    head = push(nil, 3)
    head = push(head, 2)
    head = push(head, 1)
    
    return head
}

func toString(_ node: Node?) -> (String)
{
    guard let n = node
    else {
        return "nil"
    }
    
    return "\(n.data) -> " + toString(n.next)
}

var head1 = buildOneTwoThree()

print( toString(head1) )
