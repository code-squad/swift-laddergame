//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation
/// << LadderGame Step_3 >> ///
/** << 요구사항 >>
 1. 기존 코드를 모두 삭제하고 처음부터 다시 구현을 시작하거나, 이전 단계 메소드 분리 요구사항을 구현한 상태에서 시작한다.
 2. 구조체 타입 강의 슬라이드 자료를 학습한다.
 3. 사다리 게임에 참여하는 사람에 이름을 최대5글자까지 부여할 수 있다. 사다리를 출력할 때 사람 이름도 같이 출력한다.
 4. 사람 이름은 쉼표(,)를 기준으로 구분한다.
 5. 사람 이름을 5자 기준으로 출력하기 때문에 사다리 폭도 넓어져야 한다.
 **/
/// Hint 참고

func main() {
    let inputView: InputView = InputView()
    let ladderPlayerStr: [String] = inputView.getLadderUser()
    let ladderPlayer: [LadderPlayer] = inputView.storeLadderPlayer(ladderUser: ladderPlayerStr)
    let ladderHeight: Int = inputView.getLadderHeight()
    let ladderGame: LadderGame = LadderGame(height: ladderHeight, names: ladderPlayer)
    let checkDemend: CheckError = CheckError()
    if checkDemend.checkEverything(ladderHeight: ladderHeight, ladderPlayer: ladderPlayer) == false { return }
    let CompleteLadderStep: [[LadderStep]] = ladderGame.completeWholeLadderStep()
    let resultView: ResultView = ResultView()
    resultView.printWholeLadderStep(ladder: CompleteLadderStep)
    resultView.printPlayerName(ladderPlayer: ladderPlayer)
}
main()
