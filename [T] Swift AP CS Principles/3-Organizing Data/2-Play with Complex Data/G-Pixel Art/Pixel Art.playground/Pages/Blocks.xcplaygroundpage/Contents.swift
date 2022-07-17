/*:
 ## Color Blocks
 
 Now that you're using loops to create vertical and horizontal lines, the next logical step is to fill a rectangular area of the screen. Since you already have your line functions, a sensible option is to compose a new function that creates a rectangle one line at a time.
 
 You can use the horizontal line function provided for you on this page.
 
 - callout(Exercise): Create a `block` function to create a rectangular block of color. It should take five parameters: `x`, `y`, `width`, `height`, and `color`. Use the `hLine` function repeatedly to draw the block. Use your block function to create some blocks of various colors.
 */
func hline(x: Int, y: Int, length: Int, color: Color) {
    for i in 0 ... length - 1 {
        display.setPixel(x: x + i, y: y, color: color)
    }
}

func block(x: Int, y: Int, width: Int, height: Int, color: Color) {
    for i in 0 ... height - 1 {
        hline(x: x, y: y + i, length: width, color: color)
    }
}

block(x: 3, y: 3, width: 5, height: 5, color: .blue)
block(x: 10, y: 8, width: 28, height: 20, color: .yellow)
/*:
 ### Fill Speed
 
 If you created a large enough block, you might observe the playground reaching its speed limit—the block filled in from bottom to top rather than appearing all at once. There's another method in `PixelDisplay` to help you with this.
 
 `batchSetPixels` takes an array of `Pixel`s rather than just one. By passing in many pixels as an array, you're setting them all at once—rather than one at a time.
 
 You could convert the `hLine` function to use this new method. But that would only partially solve the problem—you'd still have to draw your lines one after the other. A better solution is to modify your `block` function to use a *nested loop*.
 
 ### Nested Loops
 
 Creating a rectanglar area requires you to iterate over both x and y coordinates. You can accomplish this by placing one loop inside another. For each value of the outer loop, the inner loop executes all its iterations. The code that does the work in the body of the inner loop will run for all combinations of x and y.
 
 Call the `nestedPrint()` function below to see an example. (How many times will the `print` function run?)
 */
func nestedPrint() {
    for a in 1 ... 5 {
        for b in 1 ... 3 {
            print("\(a) \(b)")
        }
    }
}

nestedPrint()
/*:
 The algorithm for your new `block` function works like this:
 
 - Create an empty array of `Pixel`s
 - For each `x` value:
    - For each `y` value:
            Create a pixel with `x` and `y` and add it to the array
 - Batch-set the pixels in the array
 
 - callout(Exercise): Create a new `block` function. (You can use a new name or comment out the one above.) Follow the pseudocode above to write your code, then test your new function. You might make lots of flags using only blocks of color—or come up with your own design ideas.
 */

func fastBlock(x: Int, y: Int, width: Int, height: Int, color: Color) {
    var pixels = [Pixel]()
    for x in x ... x + width - 1 {
        for y in y ... y + height - 1 {
            pixels.append(Pixel(x: x, y: y, color: color))
        }
    }
    display.batchSetPixels(pixels)
}

fastBlock(x: 1, y: 1, width: 38, height: 38, color: .white)
fastBlock(x: 2, y: 2, width: 36, height: 36, color: .purple)
fastBlock(x: 15, y: 5, width: 10, height: 30, color: .yellow)

//: [Previous](@previous)  |  page 5 of 13  |  [Next: Composition](@next)