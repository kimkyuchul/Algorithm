import Foundation

func solution(_ binomial:String) -> Int {
    let binomials = binomial.split { $0 == " " }.map { String($0) }
    let first = Int(binomials[0])!
    let susic = binomials[1]
    let second = Int(binomials[2])!
    
    switch susic {
        case "+":
        return first + second
        
        case "-":
        return first - second
        
        case "*":
        return first * second
        
        default:
        return 0
    }
}