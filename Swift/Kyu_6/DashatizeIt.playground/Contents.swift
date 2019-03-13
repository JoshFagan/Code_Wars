/// Closure implementation that will not work on Swift 3, but will work on Swift 4
func dashatize( _ number: Int ) -> (String)
{
    // Number to dashatize
    let num: Int
    
    // Array of characters representing input number
    var charArray: [Character]
    // String to store dashitized number
    var dashStr: String
    
    // If number is negative, negate number
    if number < 0
    {
        num = number * (-1)
    }
    else
    {
        num = number
    }
    
    // Convert input number to string
    charArray = Array( String( num ) )
    
    // Map odd number characters to characters with dashes on either side
    dashStr = charArray.reduce("")
    {
        (result, char) -> (String) in
        
        if Int(String(char))! % 2 == 1
        {
            if !result.hasSuffix("-")
            {
                return "\(result)-\(char)-"
            }
            else
            {
                return "\(result)\(char)-"
            }
        }
        return "\(result)\(char)"
    }
    
    // Remove first and last element of array if they are dashes
    if dashStr.hasPrefix("-")
    {
        dashStr.removeFirst()
    }
    
    if dashStr.hasPrefix("-")
    {
        dashStr.removeLast()
    }
    
    return dashStr
}

/// Loop implementation that will work with Swift 3
func dashatize2( _ number: Int ) -> (String)
{
    // Original number of characters in number string
    let count: Int
    // Number to dashatize
    let num: Int
    
    // Whether there is already a dash next to the current character
    var isNextDash: Bool
    // String to store dashitized number
    var dashStr: String
    // Current index to read from string
    var readIndx: String.Index
    // Current index to insert dashing into string
    var writeIndx: String.Index
    
    // If number is negative, negate number
    if number < 0
    {
        num = number * (-1)
    }
    else
    {
        num = number
    }
    
    // Convert input number to string
    dashStr = String( num )
    
    // Initialize to false since first character cannot have dash to left of it
    isNextDash = false
    
    // Start reading and inserting at begining of string
    readIndx = dashStr.startIndex
    writeIndx = dashStr.startIndex
    
    // Number of characters in string will increase as dashes are added.
    // Store original number of characters to reference later.
    count = dashStr.characters.count

    // Iterate over every character in string and add dash if appropriate
    for (i, char) in dashStr.characters.enumerated()
    {
        // If the character represents an odd number, check to see if dash can be added
        if Int(String(char))! % 2 == 1
        {
            // Do not add dash to left of character if it is the first character in the string
            if i > 0
            {
                // Do not add dash to left of character if there is already a dash
                // to the left of the string
                if !isNextDash
                {
                    // Add dash to left of character
                    dashStr.insert("-", at: writeIndx)
                    // Increase insert index as length of string has been increased
                    writeIndx = dashStr.index(after: writeIndx)
                }
            }
            
            // Do not add dash to right of character if it is the last character in the string
            if i < count-1
            {
                // Add dash to right of character
                dashStr.insert("-", at: dashStr.index(after: writeIndx))
                // Increase insert index as length of string has been increased
                writeIndx = dashStr.index(after: writeIndx)
                // Next character in string will now have a dash to the left of it
                isNextDash = true
            }
        }
        else
        {
            // If this is an even number than the next character will not have a dash to the left of it
            isNextDash = false
        }
        readIndx = dashStr.index(after: readIndx)
        writeIndx = dashStr.index(after: writeIndx)
    }
    return dashStr
}

// dashatize(274) -> '2-7-4'
let num = 327924
dashatize(num)
