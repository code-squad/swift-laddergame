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
func makeLadder(_ countOfPeopleAndLadder : (Int, Int))->[[Int]] {
    guard countOfPeopleAndLadder.0 <= 0 || countOfPeopleAndLadder.1 <= 0 else{
        var ladders :[[Int]] = [[]]
        
        // 사람의 숫자와 사다리의 숫자를 바탕으로 사다리의 모양을 2차원 배열에 저장
        for ladderIndex in 0...countOfPeopleAndLadder.1-1 {
            ladders.append([])
            for peopleIndex in 0...countOfPeopleAndLadder.0-2 {
                let horizontalLadder = arc4random_uniform(2)
                ladders[ladderIndex].append(Int(horizontalLadder))
            }
        }
        return ladders
    }
    return [[0]]
}

/// 층별 사다리 출력함수
func outputLadderOfLayer(_ layer:[Int]){
    print("|", terminator:"")
    for peopleIndex in 0...layer.count-1{
        var horizontalLadder = "-"
        if layer[peopleIndex] == 0 || (peopleIndex>=1 && layer[peopleIndex - 1] == 1) { horizontalLadder = " " }
        print("\(horizontalLadder)|", terminator:"")
    }
}

/// 층별 출력함수
func outputLadder(_ ladders:[[Int]]) {
    guard ladders == [[0]]
    else {
        for ladderIndex in 0...ladders.count-2 {
            outputLadderOfLayer(ladders[ladderIndex])
            print("")
        }
        return
    }
    print("0보다 큰 정수를 입력해주세요!")
}

let inputNumbers = inputCount()
let ladders = makeLadder(inputNumbers)
outputLadder(ladders)
