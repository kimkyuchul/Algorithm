func solution(_ strings:[String], _ n:Int) -> [String] {
    let stringss = strings.sorted()
//     var asd: [String] = []
    
//     for i in stringss {
//         let arrayString = Array(i)
        
//         asd.append(String(arrayString[n]))
//     }
    
    return stringss.sorted { Array($0)[n] < Array($1)[n] }
}