/*:
 ## Documentation and Testing
 
 When you write functions and methods, you should document them to indicate the conditions under which they function. Documentation has important uses:
 
 - To identify appropriate values for testing
 - To make your code easier for yourself and others to read and understand
 - To serve as the basis for published documentation of an API
 - To capture your thought process as you code
 
 You'll use comments to document your code in Swift. If you use the special comment format `///`, you'll get a bonus: Swift will automatically create and format documentation that you can access by Option-clicking the item—just as you do for internal types. Try it with the `PiggyBank` type and its methods below.
 
 - callout(Exercise): The `/// - Note:` lines are currently empty. Add information to each line that indicates its limitations.
 */
/// Represents a piggy bank that holds only pennies.
/// - Note: Piggy banks can hold a maximum of 255 pennies. Negative balances are not permitted.
class PiggyBank {
    private var pennies: UInt8 = 0
    
    init() {
        pennies = 0
    }
    
    /// Returns the balance of the bank.
    func balance() -> UInt8 {
        return pennies
    }
    
    /// Deposits pennies into the bank.
    /// - Parameter pennies: the number of pennies to deposit.
    /// - Note: The amount deposited can't produce a final balance that exceeds 255 pennies.
    func deposit(pennies: UInt8) {
        self.pennies += pennies
    }
    
    /// Withdraws pennies from the bank.
    /// - Parameter pennies: the number of pennies to withdraw.
    /// - Note: The amount withdrawn must not be greater than the current balance.
    func withdraw(pennies: UInt8) {
        self.pennies -= pennies
    }
}
/*:
 ### Testing
 
 When you test a function, you should choose a range of values—including some that extend beyond the limits that the function expects.
 
 What are the limits of the `deposit` and `withdraw` methods? Make some test cases below by creating instances of `PiggyBank` and calling the two methods with values that should produce valid results—as well as some tests that should cause it to crash. Verify valid results by comparing the method call to the expected output as demonstrated. (You'll have to comment out the tests that crash your code in order to have them alongside other tests.)
 */
// Test a legal deposit amount
var bank1 = PiggyBank()
bank1.deposit(pennies: 100)
bank1.balance() == 100 // This should be true

// More test cases below...
// Test a legal withdrawal
//bank1.withdraw(pennies: 50)
//bank1.balance() == 50 // This should be true

// Now test an illegal withdrawal amount
//bank1.withdraw(pennies: 200) // This should cause a crash

// Test an overflow
//var bank2 = PiggyBank()
//bank2.deposit(pennies: 300) // This will cause a compiler error

// Test another overflow
//var bank3 = PiggyBank()
//bank3.deposit(pennies: 200)
//bank3.balance() == 200 // This should be true
//bank3.deposit(pennies: 100) // This should cause a crash
//: [Previous](@previous)  |  page 4 of 7  |  [Next: Making Change](@next)