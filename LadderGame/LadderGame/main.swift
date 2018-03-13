/*
 커밋할 때는 최소 작업단위로 나눠서 커밋 PR은 여러 개 커밋이 합쳐져 있어야 한다.
 struct를 추가하면 파일을 나눠서 작업하기 파일을 추가하면 커밋을 해야
 좋은 커밋 로그 공부
 */
 
 
 /*
 LadderGame 이 모든 객체를 생성해서 소유하고 있어서 의존성을 갖고 있는 것보다는
 다른 객체가 할 일을 넘겨주도록 (=의존성을 줄이도록) 작성하는 게 좋습니다.
 여기 변수들이 (극단적으로보면) 존재하지 않고, LadderGame을 호출하는 상위 객체에서 넘겨주도록 작성하는 게 좋습니다. 이 부분은 3단계를 할 때 개선해봅시다.
 ->감이 안 잡힘.
 */


import Foundation
func main(){
    var input = Input()
    input.start()
    let inputValue:(numerOfPerson:Int, heightOffLadder:Int) = input.result
    var ladderGame = LadderGame(inputValue.numerOfPerson, inputValue.heightOffLadder)
    let ladderMatrix = ladderGame.makeLadder()
    Output().printLadder(ladderMatrix)
}

main()
