/*:
## Bar Charts, Revisited
 
 In the first visualization playground, you used simple functions to create bar charts. In this playground, you'll have more control over the size and color of the bars.
 
 The new API exposes an instance of `BarChartView` named `barChart`. There's also a `ChartBar` struct which is used to specify the bars themselves. `ChartBar` has the following properties:
 
- `length`: The size of the bar, expressed as a `Double`.
- `color`: The color of the bar, expressed as a `Color`.

 `BarChartView` has several properties:
 
- `bars`: An `Array` of `ChartBar`s.
- `yAxisMinimum`: The minimum value of the Y axis, expressed as a `Double`.
- `yAxisMaximum`: The maximum value of the Y axis, expressed as a `Double`.
- `seriesLabels`: An `Array` of `String`s to display labels along the X axis with equal spacing.

 As with the pie chart, you'll also get an instance of `ChartKeyView` called `keyView`.

 - callout(Exercise): Create a bar chart using your own data.
 */
makeBarChart()

barChartView.yAxisMinimum = 0
barChartView.yAxisMaximum = 1

barChartView.bars = [
    ChartBar(length: 0.75, color: .green),
    ChartBar(length: 0.25, color: .blue),
    ChartBar(length: 0.35, color: .brown),
    ChartBar(length: 0.95, color: .yellow),
    ChartBar(length: 0.15, color: .red),
    ChartBar(length: 0.3, color: .orange)
]

barChartView.seriesLabels = [
    "Limes"
    ,"Blueberries"
    ,"Kiwis"
    ,"Bananas"
    ,"Strawberries"
    ,"Oranges"
]
//:  - callout(Challenge): Recreate the `addBar(withLength:color:)` and `setYAxis(minimum:maximum:)` functions from the first visualization playground.
import UIKit

func addBar(withLength length: Double, color: Color) {
    barChartView.bars.append(ChartBar(length: length, color:color))
}

func setYAxis(minimum: Double, maximum: Double) {
    barChartView.yAxisMinimum = minimum
    barChartView.yAxisMaximum = maximum
}

/*:
[Previous](@previous)  |  page 5 of 9  |  [Next: Bar Chart Settings](@next)
 */