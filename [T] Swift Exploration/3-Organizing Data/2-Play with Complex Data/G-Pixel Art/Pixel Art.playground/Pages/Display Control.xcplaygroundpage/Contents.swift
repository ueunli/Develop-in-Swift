/*:
 ## Controlling the Display
 
 The `backgroundColor` property of `PixelDisplay` controls the display color.
 
 - callout(Experiment): Try changing the background color of the display.
 */
display.backgroundColor = .cyan
/*:
 Notice that any of the pixels you've already set don't change color.
 
- callout(Experiment): Add a few pixels and change the background color again.
 */

display.setPixel(x: 5, y: 5, color: .black)
display.setPixel(x: 1, y: 2, color: .black)

display.backgroundColor = .green
/*:
 Notice that you don't see the first background color at all. That's because all the operations execute quickly when your code runs.
 
 On the next page, put some pixels in a row.

[Previous](@previous)  |  page 3 of 13  |  [Next: Lines](@next)
 */