/*:
## Pie Chart Settings
 
 `PieChartView` also has a property that you can use to tweak its look.
 
- `labelDisplayStyle`: How labels are displayed, expressed as a `WedgeLabelDisplayStyle`.
 
 `WedgeLabelDisplayStyle` is an `enum` with the following cases:
 
- `interior`: Labels are displayed inside wedges.
- `exterior`: Labels are displayed just outside wedges.
- `none`: Wedges aren't labeled.

 - callout(Exercise): Experiment with the label styles.
 */
makePieChart()
pieChartView.wedges = [
    PieWedge(proportion: 0.2, color: .red)
    ,PieWedge(proportion: 0.3, color: .green)
    ,PieWedge(proportion: 0.1, color: .blue)
    ,PieWedge(proportion: 0.25, color: .purple)
    ,PieWedge(proportion: 0.15, color: .orange)
]

pieChartView.labelDisplayStyle = .exterior

/*:
[Previous](@previous)  |  page 3 of 9  |  [Next: More about Colors](@next)
 */