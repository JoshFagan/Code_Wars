func bouncingBall(_ h: Double, _ bounce: Double, _ window: Double) -> (Int)
{
    // Float parameter "h" in meters must be greater than 0
    // Float parameter "bounce" must be greater than 0 and less than 1
    // Float parameter "window" must be less than h
    if !(h > 0) || ( !(bounce > 0) || !(bounce < 1) ) || !(window < h)
    {
        return -1
    }
    
    // Count of number of times mother has seen ball pass window
    var count = 0
    // Current height of ball
    var currHeight = h
    
    // While height of ball is greater than height of window, keep bouncing ball
    while currHeight > window
    {
        // Account for ball passing window on it's way down
        count += 1
        // New height of ball after bounce
        currHeight *= bounce
        // Account for ball potentially passing window on it's way up
        if currHeight > window
        {
            count += 1
        }
    }
    
    return count
}

// h = 3, bounce = 0.66, window = 1.5, result is 3
bouncingBall(3, 0.66, 1.5)

// h = 3, bounce = 1, window = 1.5, result is -1 (Condition 2) not fulfilled).
bouncingBall(3, 1, 1.5)
