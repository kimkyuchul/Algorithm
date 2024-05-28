import Foundation

func solution(_ letter:String) -> String {
let morse: [String: String] = [
    ".-": "a", "-...": "b", "-.-.": "c", "-..": "d", ".": "e", "..-.": "f",
    "--.": "g", "....": "h", "..": "i", ".---": "j", "-.-": "k", ".-..": "l",
    "--": "m", "-.": "n", "---": "o", ".--.": "p", "--.-": "q", ".-.": "r",
    "...": "s", "-": "t", "..-": "u", "...-": "v", ".--": "w", "-..-": "x",
    "-.--": "y", "--..": "z"
]
    
    let stringLetterArray = letter.split(separator: " ").map { String($0) }

    let result = stringLetterArray.map { morse[$0] ?? "" }.joined()
    
    return result
}