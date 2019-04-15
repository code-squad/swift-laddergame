import Foundation
protocol Pattern{
    
}


enum PatternType:Int{
    case column = 0
    case step
}
enum ColumnType : String,Pattern{
    case column = "|"
}
enum StepType : String,Pattern,CaseIterable{
    case exist = "-"
    case none = " "
    
    func getNextPattern()->(StepType){
        switch self{
        case .exist:
            return .none
        case .none:
            return randomPattern()
        }
    }
    func randomPattern()->(StepType){
        let index = Int.random(in: 0...StepType.allCases.count)
        return StepType.allCases[index]
    }
}
enum Question : String,CaseIterable{
    case aboutNumberOfParticipant = "참여할 사람은 몇 명 인가요?"
    case aboutHeightOfLadder = "최대 사다리의 높이는 몇 개 인가요?"
}
enum PatternColume:String{
    case colume = "|"
}


typealias LadderInfo = [Int]
typealias Row = [String]
typealias Ladder = [[String]]


struct LadderGame{
    
    //=====================
    //    1단계 데이터 입력
    //=====================
    func input()->(LadderInfo){
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
    
    
    //=====================
    //    4단계 데이터 형식화
    //=====================
   
    
    //=====================
    //    5단계 데이터 출력
    //=====================
 
   
    
    
}


let ladderGame = LadderGame()
ladderGame.input()
