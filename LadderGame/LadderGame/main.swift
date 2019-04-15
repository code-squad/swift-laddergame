import Foundation


enum ErrorType:String, Error{
    case wrongFormat = "잘못된 형식의 입력입니다."
    case outOfRange = "범위를 벗어났습니다."
}

// - MARK: - Protocol
protocol Pattern{
    func getRawValue()->(String)
}

// - MARK: - Enum
enum PatternType:Int,CaseIterable{
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
        let index = Int.random(in: 0..<StepType.allCases.count)
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
typealias Ladder = [Row]

// - MARK: - LadderGame
struct LadderGame{
    func input()->(LadderInfo){
        var answers = Question.allCases.map{
            return ask(question: $0)
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
    func makeRow(width:Width)->(Row){
        var row = Row.init(repeating: "", count: width)
        for index in 0..<width {
        
            let patternType = PatternType.allCases[index%2]
            let pattern = patternType.generate(before: StepType.init(rawValue: row[index/2]) ?? .none)
            row[index] = pattern.getRawValue()
        }
        return row
    }
    func makeLadder(info:LadderInfo)->(Ladder){
        let (width,height) = info
        var ladder = Ladder()
        for _ in 0..<height{
            let row = makeRow(width: width)
            ladder.append(row)
        }
        return ladder
    }
    
    func output(target:[Any]){
        guard let ladder = target as? Ladder else{
            _ = target.map{ print($0, separator: "", terminator: "")  }
            return
        }
        _ = ladder.map{
            output(target:$0)
            print()
        }
    }
    func run(){
        let ladderInfo  = input()
        let ladder = makeLadder(info: ladderInfo)
        output(target: ladder)
        
    }
}

let game = LadderGame()
game.run()
