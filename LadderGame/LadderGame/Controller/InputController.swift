//
//  InputController.swift
//  LadderGame
//
//  Created by Jung seoung Yeo on 2018. 3. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

class InputrController {
    // 숫자를 입력
    func number() throws -> Int {
        guard let inputText = readLine() else {
            throw LadderGameError.isEmptyError
        }
        
        guard let convertInt = Int(inputText) else {
            throw LadderGameError.convertError
        }
        
        return convertInt
    }
}
