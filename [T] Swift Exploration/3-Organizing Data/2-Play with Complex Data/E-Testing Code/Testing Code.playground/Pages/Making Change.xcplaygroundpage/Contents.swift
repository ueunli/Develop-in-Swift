/*:
 ## Making Change
 
 Imagine that you're writing code for an automated checkout machine at a supermarket. You've created a function that decides how to dispense change when the shopper pays. Below is the documentation for the function. (You can also Option-click the function name in the code below to see the documentation.)
 
 `change(for: Double, purchasePrice: Double) -> [Denomination]`
 \
 *Gives the amount of change due for a given purchase.*\
 ***Parameters***:\
 ` ` ` ` ` ` ` ` ***amountGiven**: The amount of money given, in dollars*\
 ` ` ` ` ` ` ` ` ***purchasePrice**: The price of the item being purchased, in dollars*\
 ***Returns**: An array of currency denominations that should be given as change. An empty array is returned in case of error.*\
 ***Note**: The amount given should not be less than the purchase price. The maximum purchase price is $500*\
 *(larger amounts have to be handled via card or check), and the minimum purchase price is $0.01.*

 - Experiment: Test the function with different purchase prices and amounts of cash. (Print the results to the console if the array is too large to see in the results sidebar.) Make sure you test illegal values, as well as those at and beyond the legal limits.
 */
change(for: 10, purchasePrice: 2.75)

change(for: 1, purchasePrice: 0.99)
change(for: 4, purchasePrice: 3.75)
change(for: 5, purchasePrice: 3.75)
change(for: 10, purchasePrice: 2.78)
change(for: 20.50, purchasePrice: 10.50)
change(for: 20, purchasePrice: 15.80)
change(for: 5, purchasePrice: 0) // Should print an error
change(for: 600, purchasePrice: 550) // Should print an error
change(for: 10, purchasePrice: 10.01) // Should print an error
change(for: 0, purchasePrice: 1.50) // Should print an error
/*:
 A better way to test is to express each call as a comparison between the actual result and the expected one. That way, any failures will appear as `false` in the results sidebar.
 
 - callout(Exercise): Rewrite your tests following the pattern below.
 */
change(for: 10, purchasePrice: 2.75) == [.five, .one, .one, .quarter]

change(for: 1, purchasePrice: 0.99) == [.penny]
change(for: 4, purchasePrice: 3.75) == [.quarter]
change(for: 5, purchasePrice: 3.75) == [.one, .quarter]
change(for: 10, purchasePrice: 2.78) == [.five, .one, .one, .dime, .dime, .penny, .penny]
change(for: 20.50, purchasePrice: 10.50) == [.ten]
change(for: 20, purchasePrice: 15.80) == [.one, .one, .one, .one, .dime, .dime]
change(for: 5, purchasePrice: 0) == []
change(for: 600, purchasePrice: 550) == []
change(for: 10, purchasePrice: 10.01) == []
change(for: 0, purchasePrice: 1.50) == []

// This test fails.
change(for: 10, purchasePrice: 8.95) == [.one, .nickel]
/*:
 Have you seen any errors in your testing? If not, try purchasing an item that costs $8.95.
 
 Why does the function fail with this example?
 
 Next, discover some more numeric limitations of computers.

[Previous](@previous)  |  page 5 of 7  |  [Next: Limitations of Floats](@next)
 */