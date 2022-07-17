/*:
## Plot Settings
 
 How do you want the data points on your scatter plots to display? `PlotPoint` actually has one final property, named `symbol`, of type `Symbol`.
 
 `Symbol` is an enum with the following cases:
 
- `circle`
- `square`
- `diamond`
- `triangle`
- `x`
- `plus`
 
 You can use these new properties by calling a new intializer for `PlotPoint`:\
 `init(x:y:color:size:symbol:)`

 `PlotView` itself gains the capability to draw lines with a new property named `mode` of type `PlotMode`. The `PlotMode` enum has the following cases:
 
- `pointsOnly`
- `linesOnly`
- `pointsAndLines`
 
 The `pointsOnly` mode is the default. If you use either of the other two modes, the `PlotView` will make groups of all points that have the same color and symbol, sort each group by increasing `x` value, and draw lines between points in each group.
 
 `ChartKeyItem` also gains a `symbol` property and a new initializer, `init(color:name:symbol:)`, so you can display symbols in the chart key to match those in your plot.

 - callout(Exercise): Experiment with plot point symbols, line drawing modes, and key item symbols.
 */
makePlot()

plotView.xAxisMinimum = 10
plotView.xAxisMaximum = 70
plotView.yAxisMinimum = 0
plotView.yAxisMaximum = 100

plotView.points = [
    PlotPoint(x: 10, y: 10)
    ,PlotPoint(x: 20, y: 20)
    ,PlotPoint(x: 30, y: 30)
    ,PlotPoint(x: 40, y: 70)
    ,PlotPoint(x: 50, y: 50)
    ,PlotPoint(x: 60, y: 40)
    ,PlotPoint(x: 70, y: 100)
    ,PlotPoint(x: 10, y: 90, color: .cyan)
    ,PlotPoint(x: 20, y: 80, color: .cyan, size: 10)
    ,PlotPoint(x: 30, y: 70, color: .cyan, size: 15)
    ,PlotPoint(x: 40, y: 50, color: .cyan, size: 10)
    ,PlotPoint(x: 50, y: 30, color: .cyan)
    ,PlotPoint(x: 60, y: 20, color: .cyan)
    ,PlotPoint(x: 70, y: 10, color: .cyan)
    ,PlotPoint(x: 10, y: 40, color: .red, size: 15, symbol: .plus)
    ,PlotPoint(x: 20, y: 30, color: .red, size: 15, symbol: .plus)
    ,PlotPoint(x: 30, y: 20, color: .red, size: 15, symbol: .plus)
    ,PlotPoint(x: 40, y: 10, color: .red, size: 15, symbol: .plus)
    ,PlotPoint(x: 50, y: 20, color: .red, size: 15, symbol: .plus)
    ,PlotPoint(x: 60, y: 30, color: .red, size: 15, symbol: .plus)
    ,PlotPoint(x: 70, y: 40, color: .red, size: 15, symbol: .plus)
]

plotView.mode = .pointsAndLines

keyView.keyItems = [
    ChartKeyItem(color: .black, name: "Black", symbol: .circle),
    ChartKeyItem(color: .cyan, name: "Cyan", symbol: .circle),
    ChartKeyItem(color: .red, name: "Red", symbol: .plus)
]


/*:
[Previous](@previous)  |  page 8 of 9  |  [Next: Wrapping Up](@next)
 */