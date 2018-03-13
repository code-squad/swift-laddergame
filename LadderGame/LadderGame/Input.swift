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

    private func inValidCheck(_ rawInputValue:String?) -> Int {
        
        guard let inputValue = rawInputValue else {
            return 0
        }
        
        guard let realValue = Int(inputValue) else {
            return 0
        }
        return realValue
    }
    
    mutating func askNumberOfPesron() -> Int{
        print("참여할 사람은 몇 명 인가요?")
        let numberOfPerson = inValidCheck(readLine())
        if numberOfPerson != 0 {
            return numberOfPerson
        }
        return 0
    }
    
    mutating func askHeightOfLadder() -> Int{
        print("최대 사다리 높이는 몇개 인가요?")
        let heightOfLadder = inValidCheck(readLine())
        if heightOfLadder != 0 {
            return heightOfLadder
        }
        return 0
    }
}
