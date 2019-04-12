import Foundation

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
typealias Columes = [[String]]
typealias Steps = [[String]]

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
    for _ in 1...numberOfPeople{
        let colume = makeColume(heightOfLadder: heightOfLadder)
        columes.append(colume)
    }
    return columes
}
func makeColume(heightOfLadder:Int)->([String]){
    let colume = PatternColume.colume
    return [String].init(repeating: colume.rawValue, count: heightOfLadder)
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
func makeRowOfSteps(numberOfBetween:Int)->([String]){
    let patternsOfStep = PattenOfStep.allCases
    var rowOfSteps = [String]()
    for _ in 1...numberOfBetween {
        rowOfSteps.append(getRandompatternOfStep(patterns: patternsOfStep).rawValue)
    }
    return rowOfSteps
}
func getRandompatternOfStep(patterns:[PattenOfStep])->(PattenOfStep){
    return patterns[Int.random(in: 0..<patterns.count)]
}


//=====================
//    4단계 데이터 형식화
//=====================


//=====================
//    2단계 데이터 출력
//=====================

