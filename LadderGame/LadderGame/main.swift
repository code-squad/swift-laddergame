/*
 커밋할 때는 최소 작업단위로 나눠서 커밋 PR은 여러 개 커밋이 합쳐져 있어야 한다.
 struct를 추가하면 파일을 나눠서 작업하기 파일을 추가하면 커밋을 해야
 좋은 커밋 로그 공부
 */


import Foundation
func main(){
    var input = Input()
    var names:[String]?
    var heightOfLadder:Int = 0
    var ladderGame:LadderGame
    while names == nil {
        names = input.askNumberOfPesron()
    }
    
    while heightOfLadder == 0 {
        heightOfLadder = input.askHeightOfLadder()
    }
    
    guard let safetyNames = names else {
        return
    }
    
    ladderGame = LadderGame(safetyNames, heightOfLadder)

    let (ladderMatrix, players) = ladderGame.makeLadder()
    Output.printLadder(ladderMatrix)
    Output.printPlayers(players)
}

main()
