/*:
## Spelling Errors

 By using the existing edit distance algorithm as the basis of your code to detect spelling errors, rather than coming up with your own, you'll benefit from:
 
 - Reduced development time.
 - Reduced testing.
 - Easier debugging of your code.
 
 That's why it's very rare to find code that *doesn't* use existing algorithms in some way. The iOS SDK is a good example of existing algorithms—they make the process of building an app much easier than if you had to write all the code yourself (for example, to draw all the letters of all the text onscreen).
 
 Now it's time to correct the remaining errors in your survey data. You'll solve the problem with a modular solution.

 - callout(Exercise): First, complete the function below, which returns the closest match in the show catalog for a given string.\
\
(The `editDistance()` function is implemented elsewhere so that you can use it without its code cluttering up your solution.)
 */
// Looks through the potentialMatches array to find the item that most closely matches the string in the first argument, and returns that string.
func closestMatch(for string: String, from potentialMatches: [String]) -> String {
    // Initialize the best edit distance to the worst possible value
    var bestEditDistance = Int.max
    // Initialize the index of the best match to the first index
    var bestMatchIndex = 0
    
    for i in 0 ..< potentialMatches.count {
        // Get the potential match at index i
        let potentialMatch = potentialMatches[i]
        
        // Get the edit distance from the string to the ith potential match
        let distance = editDistance(from: string, to: potentialMatch)

        // If the distance calculated above is better than best edit distance,
        // update the best edit distance and best match index
        if distance < bestEditDistance {
            bestMatchIndex = i
            bestEditDistance = distance
        }
    }
    
    return potentialMatches[bestMatchIndex]
}

/*:
 - callout(Exercise): Starting with your solution code from [Correcting Errors](Correcting%20Errors), add the following steps:
    1. After you've created the lowercase version of the survey value, check to see if it's in the lowercase version of the show catalog included in this playground page as `lowercaseCatalog`.
    2. If it is, tally it as usual.
    3. If it's not, tally the closest match from the catalog.\
 \
 As a bonus, print the errors and their corrections when you find them.
 
 **Be careful**: If you copy and paste your solution code, be careful not to lose the new comments on lines 73 and 74 below.
 */
// The lowercase version of the show catalog has already been created.
lowercaseCatalog

print("\n\n***** THIRD CLEANING PASS *****\n\n")


// Print a header
print("\n\n***** TABULATION FOR VALID DATA ******\n\n")

// Create a Tabulator instance.
var tabulator = Tabulator()

// Loop through surveyData. Make a lowercase version of each value.
for show in surveyData {
    let lowerShow = show.lowercased()
    // If the catalog contains the value, increment its count.
    if lowercaseCatalog.contains(lowerShow) {
        tabulator.incrementCount(forValue: lowerShow)
    } else {
        // Otherwise, find the closest match for the value and increment the count for that.
        let showClosestMatch = closestMatch(for: lowerShow, from: lowercaseCatalog)
        tabulator.incrementCount(forValue: showClosestMatch)
        print("\(show) -> \(showClosestMatch)")
    }
}

// Loop through all tabulator values. Print only those that are contained in the lowercase version of the show catalog.
for show in tabulator.values {
    if lowercaseCatalog.contains(show) {
        print("\(show): \(tabulator.count(forValue: show))")
    }
}

// Print a header
print("\n\n***** DATA ERRORS ******\n\n")

// Create a variable to keep a count of the errors.
var errorCount = 0

print("***** ERRORS")

// Loop through all tabulator values.
for show in tabulator.values {
    // If a value is not contained in the lowercase show catalog:
    if !lowercaseCatalog.contains(show) {
        // - Increase the error count
        errorCount += 1
        // - Print it
        print(show)
    }
}

// Print the error count.
print("***** Total errors: \(errorCount)")
/*:
[Previous](@previous)  |  page 7 of 11  |  [Next: Higher-Order Information](@next)
 */