import Foundation

enum ErrorMessages:Error{
    case wrongInput
    case outOfRange
}

func main(){
    let input : InputView = InputView()
    let buildLadder : LadderStep = LadderStep()
    let output : ResultView = ResultView()
    var ladderElement : LadderGame
    
    var players : [LadderPlayer] = []
    var ladderHeight : Int = 0
    
    while true{
        do{
            players = try input.inputName()
            ladderHeight = try input.inputHeight()
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
    
    let ladder = buildLadder.makeLadder(players: ladderElement.names, ladderHeight: ladderElement.height)
    output.printLadder(ladders: ladder, names: ladderElement.names)
    
}

main()
