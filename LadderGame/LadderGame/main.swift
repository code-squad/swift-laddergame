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

func inputLadderInfo()->(Int,Int){
    let numberOfPeople = inputNumberOfPeople()
    let heightOfLadder = inputHeightOfLadder()
    return (numberOfPeople,heightOfLadder)
}
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




