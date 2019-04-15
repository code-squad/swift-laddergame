import Foundation

// - MARK: - Protocol
protocol Pattern{
    func getRawValue()->(String)
}

// - MARK: - Enum
enum PatternType:Int{
    case column = 0
    case step
    
    func generate(before:StepType)->(Pattern){
        switch self {
        case .column:
            return ColumnType.column
        case .step:
            return before.getNextPattern()
        }
    }
}
enum ColumnType : String,Pattern{
    case column = "|"
    
    func getRawValue()->(String){
        return self.rawValue
    }
}
enum StepType : String,Pattern,CaseIterable{
    case exist = "-"
    case none = " "
    func getRawValue()->(String){
        return self.rawValue
    }
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


typealias Width = Int
typealias Height = Int
typealias LadderInfo = (Width,Height)
typealias Row = [String]
typealias Ladder = [[String]]

// - MARK: - LadderGame
struct LadderGame{
    
    //=====================
    //    1단계 데이터 입력
    //=====================
    func input()->(LadderInfo){
        var answers = Question.allCases.map{
            q in
            return ask(question: q)
        }
        return LadderInfo(answers[0]*2-1,answers[1])
    }
    func ask(question : Question)->(Int){
        print(question.rawValue)
        guard let answer = Int(readLine() ?? "error") , answer > 0 else {
            print("잘못된 입력입니다")
            return ask(question: question)
        }
        return answer
    }
    
    //=====================
    //    2단계 데이터 처리
    //=====================
    func makeRow(width:Width)->(Row){
        var row = Row()
        for index in 0...width {
            let patternType = PatternType.init(rawValue: index%2)
            let pattern = patternType?.generate(before: StepType(rawValue: row[index/2]) ?? .none).getRawValue()
            row.append(pattern!)
        }
        return row
    }
    
    
    
    
    //=====================
    //    3단계 데이터 저장
    //=====================
    
    
    //=====================
    //    4단계 데이터 형식화
    //=====================
    
    
    //=====================
    //    5단계 데이터 출력
    //=====================
    
    
    
    
}


let ladderGame = LadderGame()
print(
    ladderGame.input())
