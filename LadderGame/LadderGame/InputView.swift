//
//  InputView.swift
//  LadderGame
//
//  Created by BLU on 2019. 4. 19..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    /// 문자열을 읽습니다.
    ///
    /// - Returns: 문자열
    /// - Throws: InputError.isEmpty: 입력이 비어있음
    func readText() throws -> String {
        guard let input = readLine(), !input.isEmpty else {
            throw InputError.isEmpty
        }
        
        return input
    }
    
    /// 정수형으로 변환 가능한 문자열을 읽습니다
    ///
    /// - Returns: 정수
    /// - Throws:
    ///     - InputError.isEmpty: 입력이 비어있음
    ///     - InputError.notANumber: 입력이 정수형 변환이 불가능
    func readNumber() throws -> Int {
        let text = try readText()
        
        guard let number = Int(text) else {
            throw InputError.notANumber
        }
        
        return number
    }
}
