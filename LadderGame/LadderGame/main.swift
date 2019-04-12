import Foundation

enum CountQuestions : String{
    case people = "참여할 사람은 몇 명 인가요?"
    case ladder = "최대 사다리 높이는 몇 개인가요?"
    
    static let allValues = [people,ladder]
}

/// 사람과 사다리의 수를 입력받는 함수
func inputCount()->[Int] {
    var counts:[Int] = []
    for question in CountQuestions.allValues{
        print(question.rawValue)
        let countOfText = readLine()
        
        guard let count = UInt(countOfText!) else { return [] }
        if count>0 { counts.append(Int(count)) }
    }
    return counts
}

func makeLadderOfLayer(_ countOfPeople : Int)->[Int]{
    var layerOfLadder : [Int] = []
    for peopleIndex in 0...countOfPeople-2 {
        var horizontalLadder = Int.random(in: 0...1)
        if peopleIndex>=1 && layerOfLadder[peopleIndex - 1] == 1 { horizontalLadder = 0 }
        layerOfLadder.append(horizontalLadder)
    }
    return layerOfLadder
}

/// 사람의 숫자와 사다리의 숫자를 입력 받아 사다리를 만들고 출력하는 함수
func makeLadder()->[[Int]] {
    let totalCount = inputCount()
    if totalCount.contains(0) != true && totalCount.count>1{
        let countLadder = totalCount[1]
        let countPeople = totalCount[0]
        var ladders :[[Int]] = []
        
        // 사람의 숫자와 사다리의 숫자를 바탕으로 사다리의 모양을 2차원 배열에 저장
        for ladderIndex in 0...countLadder-1 {
            ladders.append(makeLadderOfLayer(countPeople))
        }
        return ladders
    }
    return [[]]
}

/// 층별 사다리 출력함수
func printLayerOfLadder(layer layer:[Int]){
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
func printLadders(ladders ladders:[[Int]]) {
    guard ladders == [[]]
    else {
        for ladderRow in ladders {
            printLayerOfLadder(layer: ladderRow)
            print("")
        }
        return
    }
    print("0보다 큰 정수를 입력해주세요!")
}

let buildladders = makeLadder()
printLadders(ladders: buildladders)

