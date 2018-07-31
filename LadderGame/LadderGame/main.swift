//
//  main.swift
//  laddergame
//
//  Created by KIMMINSIK on 2018. 7. 22..
//  Copyright © 2018년 KIMMINSIK. All rights reserved.
//
/*
 1. 사람이름 입력 받고 입력 받은 수 만큼 사다리 축 생성
 2. 이름과 사다리 축 간격 맞추기
 3. 사다리 모두 출력하고 축에 맞게 이름 출력하기
 4. 객체 나누기
 5. unit test
 + 발판 중복 검사
 
 사람 이름을 쉼표(,)를 기준으로 분리하려면 String 타입에 split(separator: ",") 메소드를 활용한다.
 let names = inputName.split(separator: ",")
 사용자가 입력한 이름의 숫자 만큼 사다리 가로 축을 생성한다.
 이름 속성을 갖는 참여자 LadderPlayer struct를 작성한다.
 사다리 발판 하나를 표현하는 LadderStep struct를 작성한다.
 모든 구조체는 각자 다른 스위프트 파일로 작성한다.
 사다리 높이 속성과 참여자를 Array로 포함하는 LadderGame struct를 작성한다.
 사용자의 입력을 받는 구조체(InputView)와 결과를 출력하는 구조체(ResultView)를 분리해서 구현한다.
 main 에서는 앞에서 분리한 타입들을 조합해 기능 구현을 완성한다.
 
*/
import Foundation

//사다리 게임 메인 -> main
func radderGameMain () {
    print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
    let inputView = InputView()
    let ladderGame = LadderGame()
    let inputUserName =  inputView.inputUserData()
    let playerNumber = Int(inputUserName) // 입력 값 Int로 바꾸기
    let inputMaxLadderNumber = inputView.inputLadderLength()
    let maxLadderNumber = Int(inputMaxLadderNumber) // 입력 값 Int로 바꾸기
    let createLadder = ladderGame.ladderFrameCreater(Int(playerNumber), maxLadderNumber!)
}
// 실행 -> main
radderGameMain()
