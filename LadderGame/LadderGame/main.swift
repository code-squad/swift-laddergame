import Foundation

enum PatternColume:String{
    case colume = "|"
    
}
enum PattenOfStep:String{
    case step = "-"
    case none = " "
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

//=====================
//    4단계 데이터 형식화
//=====================


//=====================
//    2단계 데이터 출력
//=====================
