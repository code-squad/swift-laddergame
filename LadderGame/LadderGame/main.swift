/*
 커밋할 때는 최소 작업단위로 나눠서 커밋 PR은 여러 개 커밋이 합쳐져 있어야 한다.
 struct를 추가하면 파일을 나눠서 작업하기 파일을 추가하면 커밋을 해야
 좋은 커밋 로그 공부
 */

/* 사다리 step3
 사다리 게임에 참여하는 사람에 이름을 최대5글자까지 부여할 수 있다. 사다리를 출력할 때 사람 이름도 같이 출력한다.
 사람 이름은 쉼표(,)를 기준으로 구분한다.
 사람 이름을 5자 기준으로 출력하기 때문에 사다리 폭도 넓어져야 한다.
 
 참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)
 pobi,honux,crong,jk
 최대 사다리 높이는 몇 개인가요?
 5
 |-----|     |-----|
 |     |-----|-----|
 |-----|     |     |
 |     |-----|-----|
 |-----|     |-----|
 pobi  honux crong   jk
 
 사람 이름을 쉼표(,)를 기준으로 분리하려면 String 타입에 split(separator: ",") 메소드를 활용한다.
 let names = inputName.split(separator: ",")
 사용자가 입력한 이름의 숫자 만큼 사다리 가로 축을 생성한다.
 이름 속성을 갖는 참여자 LadderPlayer struct를 작성한다.
 사다리 발판 하나를 표현하는 LadderStep struct를 작성한다.
 모든 구조체는 각자 다른 스위프트 파일로 작성한다.
 
 사다리 높이 속성과 참여자를 Array로 포함하는 LadderGame struct를 작성한다.
 
 struct LadderGame {
 var height = 0
 var names : [LadderPlayer]
 
 // 로직 구현
 }
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
