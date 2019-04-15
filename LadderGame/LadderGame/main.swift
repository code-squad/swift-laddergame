import Foundation


enum PatternType:Int{
    case colume = 0
    case step = 1
    
}
enum Question : String,CaseIterable{
    case aboutNumberOfParticipant = "참여할 사람은 몇명 인가요?"
    case aboutHeightOfLadder = "최대 사다리의 높이는  몇개 인가요?"
}



enum PatternColume:String{
    case colume = "|"
}
enum PattenOfStep:String,CaseIterable{
    case step = "-"
    case none = " "
    
    func checkRepeat(before:PattenOfStep)->(PattenOfStep){
        switch before {
        case .step:
            return .none
        case .none:
            return self
        }
    }
}
typealias LadderInfo = [Int]
typealias Row = [String]
typealias Columes = [[String]]
typealias Steps = [[String]]
typealias Ladder = [[String]]

//=====================
//    1단계 데이터 입력
//=====================

func input()->LadderInfo{
    var ladderInfo = LadderInfo()
    _ = Question.allCases.map{
        q in
        ladderInfo.append(ask(question: q))
    }
    return ladderInfo
}

func ask(question : Question)->(Int){
    print(question.rawValue)
    guard let answer = Int(readLine() ?? "error") else {
        print("잘못된 입력입니다")
        return ask(question: question)
    }
    return answer
}

//=====================
//    2단계 데이터 처리
//=====================


//=====================
//    3단계 데이터 저장
//=====================

func makeRowOfColume(numberOfPeople:Int)->(Row){
    let colume = PatternColume.colume
    return [String].init(repeating: colume.rawValue, count: numberOfPeople)
}

/*func makeSteps(ladderInfo : LadderInfo)->(Steps){
    let (numberOfPeople,heightOfLadder) = ladderInfo
    let numberOfBetween = numberOfPeople-1
    var steps = Steps()
    for _ in 1...heightOfLadder{
        let rowOfSteps = makeRowOfSteps(numberOfBetween: numberOfBetween)
        steps.append(rowOfSteps)
    }
    return steps
}*/
func makeRowOfSteps(numberOfBetween:Int)->(Row){
    var beforePattern = PattenOfStep.none
    let patternsOfStep = PattenOfStep.allCases
    var rowOfSteps = [String]()
    for _ in 1...numberOfBetween {
        let selectedPattern = getRandompatternOfStep(patterns: patternsOfStep)
        let currentPattern = selectedPattern.checkRepeat(before: beforePattern)
        beforePattern = selectedPattern
        rowOfSteps.append(currentPattern.rawValue)
    }
    return rowOfSteps
}
func getRandompatternOfStep(patterns:[PattenOfStep])->(PattenOfStep){
    return patterns[Int.random(in: 0..<patterns.count)]
}

//=====================
//    4단계 데이터 형식화
//=====================
func assembleLadder(columes:Columes,steps:Steps)->(Ladder){
    var ladder = Ladder()
    let numberOfRow = columes.count
    
    for indexOfRow in 0..<numberOfRow {
        let rowOfLadder = assembleRowOfLadder(index: indexOfRow, columes: columes, steps: steps)
        ladder.append(rowOfLadder)
    }
    return ladder
}

func assembleRowOfLadder(index:Int,columes:Columes,steps:Steps)->([String]){
    var rowOfLadder = Row()
    let numOfPattern = columes[0].count + steps[0].count
    for indexOfPattern in 0..<numOfPattern{
        let patternType = PatternType.init(rawValue: (indexOfPattern % 2) )
        let pattern = getPattern(indexOfRows: index, indexOfPatterns: indexOfPattern, patternType: patternType!, columes: columes, steps: steps)
        rowOfLadder.append(pattern)
    }
    return rowOfLadder
}

func getPattern(indexOfRows:Int,indexOfPatterns:Int,patternType:PatternType,columes:Columes,steps:Steps)->(String){
    switch patternType {
    case .colume:
        return columes[indexOfRows][indexOfPatterns/2]
    case .step:
        return steps[indexOfRows][indexOfPatterns/2]
    }
}


//=====================
//    5단계 데이터 출력
//=====================
func printLadder(ladder:Ladder){
    for row in ladder {
        printRow(row: row)
        print()
    }
}
func printRow(row:Row){
    for pattern in row{
        print(pattern, terminator: "")
    }
}

/*
func ladderGame(){
    let ladderInfo = inputLadderInfo()
    let columes = makeColumes(ladderInfo: ladderInfo)
    let steps = makeSteps(ladderInfo: ladderInfo)
    let ladder = assembleLadder(columes: columes, steps: steps)
    
    printLadder(ladder: ladder)
}
*/
//ladderGame()

