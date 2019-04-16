import Foundation

let game = LadderGame()

    try game.run()


/*
enum ErrorType:String,Error{
    case inputError = "숫자형식의 입력이 아닙니다."
    case outOfRange = "입력범위를 벗어났습니다."
    func alertErrorMessage(){
        print("=======================================================")
        print("               ❗️\(self.rawValue)❗️")
        print("                     재시작합니다")
        print("=======================================================")
    }
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
    func input() throws ->(LadderInfo){
        let answers = try Question.allCases.map{
            return try ask(question: $0)
        }
        return LadderInfo(answers[0]*2-1,answers[1])
    }
    func ask(question : Question) throws ->(Int){
        print(question.rawValue)
        guard let answer = Int(readLine() ?? "")  else {
            throw ErrorType.inputError
        }
        guard  answer > 0 else {
            throw ErrorType.outOfRange
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
    func run() throws->(Void) {
        var isError = false
        repeat{
            do{
                print("사다리게임을 시작합니다")
                let ladderInfo  = try input()
                let ladder = makeLadder(info: ladderInfo)
                output(target: ladder)
                isError = false
            }catch ErrorType.inputError{
                 isError = true
                ErrorType.inputError.alertErrorMessage()
            }catch ErrorType.outOfRange{
                isError = true
                ErrorType.outOfRange.alertErrorMessage()
            }
        }while isError
    }
}

let game = LadderGame()
try game.run()
*/
