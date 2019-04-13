import Foundation


enum PatternType:Int{
    case colume = 0
    case step = 1
    
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
typealias LadderInfo = (Int,Int)
typealias Row = [String]
typealias Columes = [[String]]
typealias Steps = [[String]]
typealias Ladder = [[String]]
//=====================
//    1단계 데이터 입력
//=====================

func inputNumberOfPeople()->(Int){
    print("참여할 사람은 몇 명 인가요?")
    let numberOfPeople = stringToInt(target: readLine()!)
    
    return numberOfPeople
}
func inputHeightOfLadder()->(Int){
    print("최대 사다리 높이는 몇 개인가요?")
    let ladderOfHeight = stringToInt(target: readLine()!)
    
    return ladderOfHeight
}
func stringToInt(target:String)->(Int){
    guard let int = Int(target) else{
        return 0
    }
    return int
}

//=====================
//    2단계 데이터 처리
//=====================
func inputLadderInfo()->(LadderInfo){
    let numberOfPeople = inputNumberOfPeople()
    let heightOfLadder = inputHeightOfLadder()
    return (numberOfPeople,heightOfLadder)
}

//=====================
//    3단계 데이터 저장
//=====================
func makeColumes(ladderInfo : LadderInfo)->(Columes){
    let (numberOfPeople,heightOfLadder) = ladderInfo
    var columes = Columes()
    for _ in 1...heightOfLadder{
        let colume = makeRowOfColume(numberOfPeople: numberOfPeople)
        columes.append(colume)
    }
    return columes
}
func makeRowOfColume(numberOfPeople:Int)->(Row){
    let colume = PatternColume.colume
    return [String].init(repeating: colume.rawValue, count: numberOfPeople)
}

func makeSteps(ladderInfo : LadderInfo)->(Steps){
    let (numberOfPeople,heightOfLadder) = ladderInfo
    let numberOfBetween = numberOfPeople-1
    var steps = Steps()
    for _ in 1...heightOfLadder{
        let rowOfSteps = makeRowOfSteps(numberOfBetween: numberOfBetween)
        steps.append(rowOfSteps)
    }
    return steps
}
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






func ladderGame(){
    let ladderInfo = inputLadderInfo()
    let columes = makeColumes(ladderInfo: ladderInfo)
    let steps = makeSteps(ladderInfo: ladderInfo)
    let ladder = assembleLadder(columes: columes, steps: steps)
    
    printLadder(ladder: ladder)
}

ladderGame()
