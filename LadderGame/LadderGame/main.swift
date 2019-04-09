import Foundation
/// 사람과 사다리의 수를 입력받는 함수
func inputCount()->[Int]? {
    print("참여할 사람은 몇 명 인가요?")
    let peopleCount = readLine()
    print("최대 사다리 높이는 몇 개인가요?")
    let ladderCount = readLine()
    
    guard let people = Int(peopleCount!) else { return nil }
    guard let ladder = Int(ladderCount!) else { return nil }
    
    return [people, ladder]
}

/// 사람의 숫자와 사다리의 숫자를 입력 받아 사다리를 만들고 출력하는 함수
func makeLadder(_ inputCount : [Int]?)->[[String]] {
    if inputCount != nil && inputCount![0] > 0 && inputCount![1] > 0{
        let people = inputCount![0]
        let ladder = inputCount![1]
        
        var ladderArray :[[String]] = [[]]
        var horizontalLadder:String
        
        // 사람의 숫자와 사다리의 숫자를 바탕으로 사다리의 모양을 2차원 배열에 저장
        for i in 0...ladder-1 {
            ladderArray.append([])
            for j in 0...people-1 {
                ladderArray[i].append("|")
                let randomNum = arc4random_uniform(2)
                
                if randomNum == 0 { horizontalLadder = " " }
                else if j>=1 && ladderArray[i][(2*j)-1] == "-" { horizontalLadder = "-" }
                else { horizontalLadder = "-" }
                
                ladderArray[i].append(horizontalLadder)
            }
            ladderArray[i].removeLast()
        }
        return ladderArray
    } else {
        return [[""]]
    }
}

/// 2차원 배열 출력함수
func outputLadder(_ ladderArray:[[String]]) {
    if ladderArray == [[""]] {
        print("0보다 큰 정수를 입력해주세요!")
    } else {
        for i in ladderArray {
            for j in i{
                print(j, terminator:"")
            }
            print("")
        }
    }
}

outputLadder(makeLadder(inputCount()))

