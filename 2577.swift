// Reduce기능은 사실 결합이라고 불려야 마땅한 기능입니다. 리듀스는 컨테이너 내부의 콘텐츠를 하나로 합하는 기능을 실행하는 고차합수입니다. 배열이라면 배열의 모든 값을 전달인자로 전달받은 클로저의 연살 결과로 합해줍니다.
//let threeCountArray = num.reduce(0, *)
    

// 문자열로 바꿔서 하나씩 탐색이 중요
var a = Int(readLine()!)!
var b = Int(readLine()!)!
var c = Int(readLine()!)!

var sum = String(a * b * c)
//String은 문자열을, Character 는 문자를 저장할 수 있는 타입입니다.
var arr:[Character] = []

for i in sum {
    arr.append(i)
    //print(arr)
}

for i in 0...9 {
    //Binary operator '==' cannot be applied to operands of type 'Character' and 'Int'
    //Character -> Int -> String로 변경? filter 공부 필요
    let threeCountArray = arr.filter { Int(String($0)) == i }.count
    print(threeCountArray)
}
