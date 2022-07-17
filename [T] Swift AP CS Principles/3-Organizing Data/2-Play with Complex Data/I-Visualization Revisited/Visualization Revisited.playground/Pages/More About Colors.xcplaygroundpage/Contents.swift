/*:
## More about Colors
 
 Until now, you've specified colors, each starting with a period, from a fixed list. But that list represents a very small view into a full-featured type named `Color`. Each instance of `Color` represents one of the millions of colors your Mac or iOS device can display. Imagine the charts you could create with so many colors available to you. (The `Color` type in this playground is an abstraction on top of the platform-specific `UIColor` and `NSColor` types for iOS and macOS, respectively.)
 
 For fine-grained color control, `Color` has several useful initializers that take arguments of type `Double`.
 
- `init(red:green:blue:alpha:)` takes `Double` arguments, each ranging from 0 to 1, indicating the amount of red, green, blue, and alpha that make up the color. Alpha is the transparency level: An item with partial transparency (any alpha less than 1.0), will blend its color with the colors of items underneath it.
- `init(hue:saturation:brightness:alpha:)` also takes `Double` arguments. Instead of mixing the red, green, and blue primary colors, this initializer defines a color by its hue, saturation, and brightness, as well as its transparency. Hue ranges from red, at 0.0, through the rainbow spectrum of orange, yellow, and so on, until wrapping back to red at 1.0. Saturation, from 0.0 to 1.0, describes how much "color" is in the color. (Imagine the difference between a bucket of pure red paint versus a bucket of white paint with one drop of red paint added to it.) Brightness is the relative darkness or lightness of a starting color, from black at 0.0 (no brightness) to white at 1.0 (full brightness).
- `init(white:alpha:)` is a quick way to create grayscale colors with just two `Double` arguments.
 
 All of the color names you've been using, such as `.red` and `.black`, are just properties of the `Color` type. They're special properties called *class properties* because they're part of the type itself, not part of its instances. So instead of creating a new `Color` and then referring to its `black` property, you just refer to the `black` property of `Color` itself, like this: `Color.black`. Because Swift is good at type inference, you can leave out the `Color` part of this expression when using it in a place where a `Color` is expected. For example, the `color` property of both `PieWedge` and `ChartKeyItem` is actually a `Color`.
 */
//:  - callout(Challenge): Use custom colors in a pie chart. Feel free to play around with hue, saturation, and brightness, combining them in different ways in your chart.
 
makePieChart()

pieChartView.wedges = [
    PieWedge(proportion: 0.2, color: Color(hue: 1.0, saturation: 0.5, brightness: 1.0, alpha: 1.0)),
    PieWedge(proportion: 0.3, color: Color(red: 0.5, green: 0.8, blue: 0.2, alpha: 1)),
    PieWedge(proportion: 0.1, color: Color(red: 0.95, green: 0.8, blue: 0.5, alpha: 1)),
    PieWedge(proportion: 0.25, color: Color(hue: 0.7, saturation: 0.5, brightness: 1, alpha: 0.5)),
    PieWedge(proportion: 0.15, color: Color(white: 0.7, alpha: 1))
]
//:  - callout(Challenge): Use tranparency to create cool effects. (Hint: You can have pie wedges that add up to more than 100% of the pie.)
// Uncomment the following code to see the example.

/*
pieChartView.wedges = [
    PieWedge(proportion: 0.2, color: .red),
    PieWedge(proportion: 0.5, color: .yellow),
    PieWedge(proportion: 0.3, color: .blue),
    
    PieWedge(proportion: 0.08, color: Color(white: 0, alpha: 0.5), scale: 0.6, offset: 0),
    PieWedge(proportion: 0.12, color: Color(white: 1, alpha: 0.5), scale: 0.6, offset: 0),
    
    PieWedge(proportion: 0.3, color: Color(white: 0, alpha: 0.5), scale: 0.6, offset: 0),
    PieWedge(proportion: 0.2, color: Color(white: 1, alpha: 0.75), scale: 0.6, offset: 0),

    PieWedge(proportion: 0.02, color: Color(white: 0, alpha: 0.5), scale: 0.6, offset: 0),
    PieWedge(proportion: 0.28, color: Color(white: 1, alpha: 0.5), scale: 0.6, offset: 0)
]

keyView.keyItems = [
    ChartKeyItem(color: .red, name: "Dogs"),
    ChartKeyItem(color: .yellow, name: "Cats"),
    ChartKeyItem(color: .blue, name: "Hamsters"),
    
    ChartKeyItem(color: .clear, name: ""),
    
    ChartKeyItem(color: .darkGray, name: "Adopted"),
    ChartKeyItem(color: .lightGray, name: "Purchased")
]
*/

//:  - callout(Challenge): Recreate the `addWedge(withProportion:color:)` and `addKeyItem(withLabel:color:)` functions from the original visualization API.
func addWedge(withProportion proportion: Double, color: Color) {
    pieChartView.wedges.append(PieWedge(proportion: proportion, color: color))
}

func addKeyItem(withLabel label: String, color: Color) {
    keyView.keyItems.append(ChartKeyItem(color: color, name: label))
}

/*:
[Previous](@previous)  |  page 4 of 9  |  [Next: Bar Charts, Revisited](@next)
 */