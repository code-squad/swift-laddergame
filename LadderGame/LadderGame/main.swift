import Foundation
/// 사람과 사다리의 수를 입력받는 함수
func inputCount()->Int {
    let countOfText = readLine()
    
    guard let count = Int(countOfText!) else { return 0 }
    
    return count
}

func makeLadderOfLayer(_ countOfPeople : Int)->[Int]{
    var ladderOfLayer : [Int] = []
    for peopleIndex in 0...countOfPeople-2 {
        var horizontalLadder = Int.random(in: 0...1)
        if peopleIndex>=1 && ladderOfLayer[peopleIndex - 1] == 1 { horizontalLadder = 0 }
        ladderOfLayer.append(horizontalLadder)
    }
    return ladderOfLayer
}

/// 사람의 숫자와 사다리의 숫자를 입력 받아 사다리를 만들고 출력하는 함수
func makeLadder()->[[Int]] {
    print("참여할 사람은 몇 명 인가요?")
    let countOfPeople = inputCount()
    print("최대 사다리 높이는 몇 개인가요?")
    let countOfLadder = inputCount()
    if countOfPeople > 0 && countOfLadder > 0 {
        var ladders :[[Int]] = []
        
        // 사람의 숫자와 사다리의 숫자를 바탕으로 사다리의 모양을 2차원 배열에 저장
        for ladderIndex in 0...countOfLadder-1 {
            ladders.append(makeLadderOfLayer(countOfPeople))
        }
        return ladders
    }
    return [[]]
}

/// 층별 사다리 출력함수
func outputLadderOfLayer(_ layer:[Int]){
    var horizontalLadder : String
    print("|", terminator:"")
    for peopleIndex in layer{
        switch peopleIndex{
        case 1 : horizontalLadder = "-"
        default : horizontalLadder = " "
        }
        print("\(horizontalLadder)|", terminator:"")
    }
}

/// 층별 출력함수
func outputLadder(_ ladders:[[Int]]) {
    guard ladders == [[]]
    else {
        for ladderIndex in ladders {
            outputLadderOfLayer(ladderIndex)
            print("")
        }
        return
    }
    print("0보다 큰 정수를 입력해주세요!")
}

let ladders = makeLadder()
outputLadder(ladders)

