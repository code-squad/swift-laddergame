/*
 커밋할 때는 최소 작업단위로 나눠서 커밋 PR은 여러 개 커밋이 합쳐져 있어야 한다.
 struct를 추가하면 파일을 나눠서 작업하기 파일을 추가하면 커밋을 해야
 좋은 커밋 로그 공부
 */

import Foundation
func main(){
    var input = Input()
    var numberOfPerson:Int = 0
    var heightOfLadder:Int = 0
    
    while numberOfPerson == 0 {
        numberOfPerson = input.askNumberOfPesron()
    }
    
    while heightOfLadder == 0 {
        heightOfLadder = input.askHeightOfLadder()
    }

    var ladderGame = LadderGame(numberOfPerson, heightOfLadder)
    let ladderMatrix = ladderGame.makeLadder()
    Output.printLadder(ladderMatrix)
}

main()
