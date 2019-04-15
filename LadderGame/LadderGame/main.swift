import Foundation

enum ErrorMessages:Error{
    case wrongInput
    case outOfRange
}

func main(){
    let input : InputView = InputView()
    let buildLadder : LadderStep = LadderStep()
    let output : ResultView = ResultView()
    
    let ladderElement : LadderGame
    
    while true{
        do{
            ladderElement = try LadderGame(players: input.inputName(), ladderHeight: input.inputHeight())
            
            let ladder = buildLadder.makeLadder(players: ladderElement.names, ladderHeight: ladderElement.height)
            output.printLadder(ladders: ladder, names: ladderElement.names)
            
            break
        }catch ErrorMessages.wrongInput{
            print("잘못된 입력입니다.")
        }catch ErrorMessages.outOfRange{
            print("잘못된 범위입니다.")
        }catch {
            print("알 수 없는 에러입니다.")
        }
    }
}

main()
