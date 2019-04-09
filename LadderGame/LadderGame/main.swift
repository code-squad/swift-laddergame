import Foundation
/// 사람과 사다리의 수를 입력받는 함수
func inputCount()->(countOfPeople:Int,countOfLadder:Int) {
    print("참여할 사람은 몇 명 인가요?")
    let countOfPeopleText = readLine()
    print("최대 사다리 높이는 몇 개인가요?")
    let countOfLadderText = readLine()
    
    guard let countOfPeople = Int(countOfPeopleText!) else { return (0,0) }
    guard let countOfLadder = Int(countOfLadderText!) else { return (0,0) }
    
    return (countOfPeople,countOfLadder)
}

/// 사람의 숫자와 사다리의 숫자를 입력 받아 사다리를 만들고 출력하는 함수
func makeLadder(_ countOfPeople:Int, _ countOfLadder:Int)->[[String]] {
    if countOfPeople > 0 && countOfLadder > 0{
        
        var ladders :[[String]] = [[]]
        var horizontalLadder:String
        
        // 사람의 숫자와 사다리의 숫자를 바탕으로 사다리의 모양을 2차원 배열에 저장
        for i in 0...countOfLadder-1 {
            ladders.append([])
            for j in 0...countOfPeople-1 {
                ladders[i].append("|")
                let judgmentLadder = arc4random_uniform(2)
                
                if judgmentLadder == 0 { horizontalLadder = " " }
                else if j>=1 && ladders[i][(2*j)-1] == "-" { horizontalLadder = "-" }
                else { horizontalLadder = "-" }
                
                ladders[i].append(horizontalLadder)
            }
            ladders[i].removeLast()
        }
        return ladders
    } else {
        return [[""]]
    }
}

/// 2차원 배열 출력함수
func outputLadder(_ ladders:[[String]]) {
    if ladders == [[""]] {
        print("0보다 큰 정수를 입력해주세요!")
    } else {
        for i in ladders {
            for j in i{
                print(j, terminator:"")
            }
            print("")
        }
    }
}
let inputNumber = inputCount()
let ladders = makeLadder(inputNumber.countOfPeople,inputNumber.countOfLadder)
outputLadder(ladders)
