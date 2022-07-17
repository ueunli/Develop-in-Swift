/*:
## Plots, Revisited
 
 This version of the API also exposes some new types to help you create better scatter plots. `PlotView` displays your plot data. `makePlot()` creates an instance named `plotView`. The plot data is a series of `PlotPoint` instances, stored as an array in the `points` property.
 
 `PlotView` has the following properties:
 
- `points`: An `Array` of `PlotPoint`s.
- `yAxisMinimum`: The minimum value of the Y axis, expressed as a `Double`.
- `yAxisMaximum`: The maximum value of the Y axis, expressed as a `Double`.
- `xAxisMinimum`: The minimum value of the X axis, expressed as a `Double`.
- `xAxisMaximum`: The maximum value of the X axis, expressed as a `Double`.

 `PlotPoint` has the following properties:
 
- `x`: The X coordinate of the point, expressed as a `Double`.
- `y`: The Y coordinate of the point, expressed as a `Double`.
- `color`: The color of the point, expressed as a `Color`.
- `size`: The size of the point, expressed as a `Double`.
 
 You can use several initializers to create a `PlotPoint` instance.
 
 The color will default to `.black` and the size to 5:\
 `init(x:y:f)`
 
The size will default to 5:\
`init(x:y:color:)`
 
 You specify all properties:\
`init(x:y:color:size:)`

 
 As with pie charts and bar charts, you'll also get an instance of `ChartKeyView` called `keyView`.

 - callout(Exercise): Create a plot using your own data.
 */
makePlot()

plotView.xAxisMinimum = 0
plotView.xAxisMaximum = 80
plotView.yAxisMinimum = 0
plotView.yAxisMaximum = 100

plotView.points = [
    PlotPoint(x: 10, y: 10),
    PlotPoint(x: 20, y: 20),
    PlotPoint(x: 30, y: 30),
    PlotPoint(x: 40, y: 70),
    PlotPoint(x: 50, y: 50),
    PlotPoint(x: 60, y: 40),
    PlotPoint(x: 70, y: 100),
    PlotPoint(x: 10, y: 90, color: .cyan),
    PlotPoint(x: 20, y: 80, color: .cyan),
    PlotPoint(x: 30, y: 70, color: .cyan),
    PlotPoint(x: 40, y: 50, color: .cyan),
    PlotPoint(x: 50, y: 30, color: .cyan),
    PlotPoint(x: 60, y: 20, color: .cyan),
    PlotPoint(x: 70, y: 10, color: .cyan),
    PlotPoint(x: 10, y: 40, color: .red, size: 10),
    PlotPoint(x: 20, y: 30, color: .red, size: 10),
    PlotPoint(x: 30, y: 20, color: .red, size: 10),
    PlotPoint(x: 40, y: 10, color: .red, size: 10),
    PlotPoint(x: 50, y: 20, color: .red, size: 10),
    PlotPoint(x: 60, y: 30, color: .red, size: 10),
    PlotPoint(x: 70, y: 40, color: .red, size: 10)
]
//:  - callout(Challenge): Recreate the `addPointAt(x:y:color:)`, `setXAxis(minimum:maximum:)`, and `setYAxis(minimum:maximum:)` functions from the first visualization playground.
import UIKit

func addPointAt(x: Double, y: Double, color: Color) {
    plotView.points.append(PlotPoint(x: x, y: y, color: color))
}

func setXAxis(minimum: Double, maximum: Double) {
    plotView.xAxisMinimum = minimum
    plotView.xAxisMaximum = maximum
}

func setYAxis(minimum: Double, maximum: Double) {
    plotView.yAxisMinimum = minimum
    plotView.yAxisMaximum = maximum
}

/*:
[Previous](@previous)  |  page 7 of 9  |  [Next: Plot Settings](@next)
 */