import Foundation

enum CountQuestions : String, CaseIterable{
    case people = "참여할 사람을 입력하세요 (구분은 ,로 하고 최대 5명까지 입력가능홥니다)"
    case ladder = "최대 사다리 높이는 몇 개인가요?"
}

enum ErrorMessages:Error{
    case wrongInput
    case outOfRange
}

func main(){
    let input : InputView = InputView()
    let distinct : DistinctNameAndHeight = DistinctNameAndHeight()
    let output : ResultView = ResultView()
    var ladderElement : LadderGame
    
    var players : [LadderPlayer] = []
    var ladderHeight : Int = 0
    
    while true{
        do{
            players = try distinct.inputName(inputText: input.inputCount(askText: CountQuestions.people))
            ladderHeight = try distinct.inputHeight(inputText: input.inputCount(askText: CountQuestions.ladder))
            break
        }catch ErrorMessages.wrongInput{
            print("잘못된 입력입니다.")
        }catch ErrorMessages.outOfRange{
            print("잘못된 범위입니다.")
        }catch {
            print("알 수 없는 에러입니다.")
        }
    }
    ladderElement = LadderGame(players: players, ladderHeight: ladderHeight)
    
    let ladder = ladderElement.makeLadder(ladderInfo: ladderElement)
    output.printLadder(ladders: ladder, names: ladderElement.names)
    
}

main()
