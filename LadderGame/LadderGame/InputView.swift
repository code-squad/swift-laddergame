//
//  inputView.swift
//  LadderGame
//
//  Created by oingbong on 2018. 7. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
//    print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
//    let inputPerson:String = readLine()!
//    return Int(inputPerson)!
    
    var inputName:String
    
    mutating func inputPerson() -> Int {
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        self.inputName = readLine()!
        return Int(self.inputName)!
    }
    
}
