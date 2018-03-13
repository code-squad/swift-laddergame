//
//  Input.swift
//  LadderGame
//
//  Created by rhino Q on 2018. 3. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

/*
 들여쓰기 depth를  1단계로 줄이기
 메소드의 라인 최대 10줄
 method가 한 가지일만 하도록
 
 위 3개 다 메소드를 분리하기
 */

//Input객체는 참여할 사람은 몇 명인가요?  질문하고 숫자 받고
//유효처리하고
//최대 사다리 높이는 몇 개인가요? 질문하고 숫자 받고
//유효처리하고
//값을 LadderGame에 넘겨줘

struct Input {
    private var numberOfPerson:Int = 0
    private var heightOfLadder:Int = 0
    // guard let으로 개선
    private func inValidCheck(_ rawInputValue:String?) -> Int {
        
        guard let inputValue = rawInputValue else {
            return 0
        }
        
        guard let realValue = Int(inputValue) else {
            return 0
        }
        return realValue
    }
    
    /*
     참여자 수를 입력받는 것 동작과 사다리 높이를 입력받는 동작 두 가지를 하고 있네요.
     함수 하나가 한 가지 동작만 하도록 개선해보세요.
     -> start()를 함수를 askNumberOfPerson() 과 askHeightOfLadder()으로 나눴습니다
     참여자나 사다리 높이를 0을 입력하면 어떻게 되는건가요? -> 0이면 다시 입력하게 했습니다
     */
    mutating func askNumberOfPesron(){
        print("참여할 사람은 몇 명 인가요?")
        let rawNumberOfPerson = inValidCheck(readLine())
        if rawNumberOfPerson != 0 {
            numberOfPerson = rawNumberOfPerson
            return
        }
        askNumberOfPesron()
    }
    
    mutating func askHeightOfLadder(){
        print("최대 사다리 높이는 몇개 인가요?")
        let rawHeightOfPerson = inValidCheck(readLine())
        if rawHeightOfPerson != 0 {
            heightOfLadder = rawHeightOfPerson
            return
        }
        askHeightOfLadder()
    }
    var result: (Int,Int){
        return (numberOfPerson, heightOfLadder)
    }
}
