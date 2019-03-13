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

func push( _ head: Node?, _ data: Int ) -> Node
{
    return Node( head, data )
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
