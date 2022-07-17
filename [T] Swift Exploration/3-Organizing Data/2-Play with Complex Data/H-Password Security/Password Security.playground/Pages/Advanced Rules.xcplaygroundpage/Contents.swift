/*:
## Advanced Rules
 You could also verify that a password contains at least one uppercase letter and one lowercase letter. That way an attacker can't limit their algorithm to lowercase letters, hoping a user was too lazy to use the shift key when typing their password.
 
 Another useful check is making sure that the password doesn't contain the username, so that the user can't choose "user01" and "user01password!".
 */
import Foundation
let tenCommonPasswords = [
    "123456",
    "123456789",
    "qwerty",
    "password",
    "12345678",
    "111111",
    "iloveyou",
    "1q2w3e",
    "123123",
    "password1"
]
let digits = "0123456789"
let punctuation = "!@#$%^&*(),.<>;'`~[]{}\\|/?_-+= "
/*:
### Implement your algorithm below with the additional new rules:

- Contains at least one uppercase letter and one lowercase letter
- Doesn't contain the username
 
 - Note: To detect whether a character is uppercase, use the `isUppercase` property.
 */
let username = "swiftC0der84"
let password = "password"

if tenCommonPasswords.contains(password) {
    print("This is a common password. Please choose another one.")
} else if password.count < 16 {
    print("Your password must contain at least 16 characters.")
} else if password.contains(username) {
    print("Your password can't contain your username.")
} else {
    var numberOfDigits = 0
    var numberOfPunctuationCharacters = 0
    var numberOfRegularLetters = 0
    var numberOfUppercaseLetters = 0
    var numberOfLowercaseLetters = 0
    
    for character in password {
        if digits.contains(character) {
            numberOfDigits += 1
        } else if punctuation.contains(character) {
            numberOfPunctuationCharacters += 1
        } else {
            numberOfRegularLetters += 1
            
            if character.isUppercase {
                numberOfUppercaseLetters += 1
            } else {
                numberOfLowercaseLetters += 1
            }
        }
    }
    
    if numberOfDigits == 0 {
        print("Your password must contain at least one digit.")
    } else if numberOfPunctuationCharacters == 0 {
        print("Your password must contain at least one of these punctuation marks: \(punctuation).")
    } else if numberOfRegularLetters == 0 {
        print("Your password must contain at least one regular letter.")
    } else if numberOfUppercaseLetters == 0 {
        print("Your password must contain at least one uppercase letter.")
    } else if numberOfLowercaseLetters == 0 {
        print("Your password must contain at least one lowercase letter.")
    } else {
        print("Your password is secure.")
    }
}

/*:
[Previous](@previous)  |  page 3 of 5  |  [Next: Custom Algorithm](@next)
 */