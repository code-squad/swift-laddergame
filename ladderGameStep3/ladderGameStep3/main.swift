//
//  main.swift
//  ladderGameStep3
//
//  Created by Choi Jeong Hoon on 2017. 11. 6..
//  Copyright © 2017년 JH Factory. All rights reserved.
//

import Foundation

// 프로그램 구현함수
func excuteLadderGame () {
    // 1. 인풋뷰 인스턴스생성
    var inputView = InputView()
    
    // 2. 인풋뷰의 입력값을 받는 함수호출하여 두개의 상수에 값을 대입
    let (names,height) = inputView.getUserInput()
    
    // 3. 인풋뷰 인스턴스를 파라미터로 받는 레더게임 인스턴스를 생성
    let ladderGame = LadderGame(inputView: inputView)
    
    // 4. 레더게임 인스턴스를 파라미터로 받는 리절트뷰 인스턴스를 생성
    let resultView = ResultView(ladderGame: ladderGame)
    
    // 5. 리절트뷰의 사다리전체출력 메서드를 호출
    resultView.printFullLadder(colOf: names.count, rowOf: height)
}

// 프로그램 구현함수를 호출
excuteLadderGame()
