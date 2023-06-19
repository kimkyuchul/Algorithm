//
//  개인정보 수집 유효기간.swift
//  Algorithm
//
//  Created by 김규철 on 2023/06/19.
//

import Foundation

func solution(_ today: String, _ terms: [String], _ privacies: [String]) -> [Int] {
    var answer = [Int]()
    
    let todayComponents = today.split(separator: ".")
    let todayYear = Int(todayComponents[0])!
    let todayMonth = Int(todayComponents[1])!
    let todayDay = Int(todayComponents[2])!
    
    var termData = [String: Int]()
    
    for term in terms {
        let termComponents = term.split(separator: " ")
        if let key = termComponents.first, let value = Int(termComponents[1]) {
            termData[String(key)] = value
        }
    }
    
    for (index, privacy) in privacies.enumerated() {
        let privacyComponents = privacy.split(separator: " ")
        let privacyDateComponents = privacyComponents[0].split(separator: ".")
        
        var year = Int(privacyDateComponents[0])!
        var month = Int(privacyDateComponents[1])!
        var day = Int(privacyDateComponents[2])!
        
        let term = termData[String(privacyComponents[1])]!
        
        month += term
        // 2배수의 월 경계에서 문제를 발생  예를 들어, 12월에 유효기간을 더한 경우 12 + 유효기간이 13 이상이 되어버리면 월이 13이 되고, 이는 올바른 범위를 벗어나게 됨 그래서 -1을 한다.
        let yearDiff = (month - 1) / 12
        print((month) / 12)
        month = (month - 1) % 12 + 1
        year += yearDiff
        
        if todayYear > year || (todayYear == year && todayMonth > month) || (todayYear == year && todayMonth == month && todayDay >= day) {
            answer.append(index + 1)
        }
    }
    
    return answer
}



// 밑은 대단한 코드

//func solution(_ today: String, _ terms: [String], _ privacies: [String]) -> [Int] {
//    var answer: [Int] = []
//
//    let formatter = DateFormatter()
//    formatter.dateFormat = "YYYY.MM.dd"
//
//    let today = formatter.date(from: today)!
//    var termsDict: [String: Int] = [:]
//
//    terms.forEach { term in
//        let split = term.split(separator: " ").map { String($0) }
//        termsDict[split[0]] = Int(split[1])!
//    }
//
//    for (i, privacy) in privacies.enumerated() {
//        let split = privacy.split(separator: " ").map { String($0) }
//
//        guard let date = formatter.date(from: split[0]),
//              let term = termsDict[split[1]] else {
//            continue
//        }
//
//        let month = DateComponents(month: term)
//        let expiration = Calendar.current.date(byAdding: month, to: date)!
//
//        if today >= expiration {
//            answer.append(i + 1)
//        }
//    }
//
//    return answer
//}
