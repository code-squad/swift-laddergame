//
//  InputView.swift
//  ladderGameStep3
//
//  Created by Choi Jeong Hoon on 2017. 11. 6..
//  Copyright © 2017년 JH Factory. All rights reserved.
//

import Foundation

// 입력값을 받는 구조체
struct InputView {
  
    // 본 객체의 속성값을 변경가능하게 하기 위해 mutating으로 선언
      func getUserInput( ) -> (Array<String>, Int){
        var names = Array<String>()
        var heightOfLadder = Int()
        print("참여할 사람을 쉼표(,)로 구분하여 입력해 주세요.")
        if let people = readLine() {
            names = people.split(separator: ",").map(String.init)
        }
        print("사다리 높이는 몇 개인가요?")
        if let ladder = readLine() {
            heightOfLadder = Int(ladder) ?? 0
        } 
        return (names, heightOfLadder)
    }
}
