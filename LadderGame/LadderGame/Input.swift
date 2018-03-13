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
    private func inValidCheck(_ inputValue:String?) -> Int {
        guard inputValue != nil || (inputValue?.isEmpty ?? false) else {
            return 0
        }
        return Int(inputValue!) ?? 0
    }
    
    mutating func start(){
        print("참여할 사람은 몇 명 인가요?")
        let rawNumberOfPerson = inValidCheck(readLine())
        if rawNumberOfPerson != 0 {
            numberOfPerson = rawNumberOfPerson
        }
        print("최대 사다리 높이는 몇개 인가요?")
        let rawHeightOfPerson = inValidCheck(readLine())
        if rawHeightOfPerson != 0 {
            heightOfLadder = rawHeightOfPerson
        }
    }
    var result: (Int,Int){
        return (numberOfPerson, heightOfLadder)
    }
}
