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

struct Input {

    func validCheck(_ rawInputValue:String?) -> Int {
        guard let inputValue = rawInputValue, rawInputValue!.isEmpty == false else {
            return 0
        }
        return Int(inputValue) ?? 0
    }
    
    mutating func askNumberOfPesron() -> [String]?{
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        
        guard let rawNames = readLine() else {
            return nil
        }
        
        let names = rawNames.split(separator: ",").map{ String($0) }
        
        return names
    }
    
    mutating func askHeightOfLadder() -> Int{
        print("최대 사다리 높이는 몇개 인가요?")
        let heightOfLadder = validCheck(readLine())
        return heightOfLadder
    }
}
