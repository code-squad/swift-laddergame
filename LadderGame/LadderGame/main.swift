/*
 커밋할 때는 최소 작업단위로 나눠서 커밋 PR은 여러 개 커밋이 합쳐져 있어야 한다.
 struct를 추가하면 파일을 나눠서 작업하기 파일을 추가하면 커밋을 해야
 좋은 커밋 로그 공부
 */
 /* 피드백 반영할 것
 ladderMatrix -> [[Bool]]
 
 
 0을 입력하면 다시 입력받는 것을 재귀로 호출하는군요!
 어떤 함수를 호출하고 반복해서 호출할 지 판단하는 흐름 제어는 그 함수를 호출한 상위 모듈에서 하는게 좋습니다.
 하위 모듈에서 무한 반복이 되도록 재귀 호출을 하는 방법은 지양하세요.
 */

import Foundation
func main(){
    var input = Input()
    let numberOfPerson = input.askNumberOfPesron()
    let heightOfLadder = input.askHeightOfLadder()
    var ladderGame = LadderGame(numberOfPerson, heightOfLadder)
    let ladderMatrix = ladderGame.makeLadder()
    Output.printLadder(ladderMatrix)
}

main()
