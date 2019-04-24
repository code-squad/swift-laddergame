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
    /// - Parameter question: 출력할 문자열
    /// - Returns: 문자열
    /// - Throws: InputError.isEmpty: 입력이 비어있음
    func readText(question: String? = nil) throws -> String {
        
        if let question = question {
            print(question)
        }
        
        guard let input = readLine(), !input.isEmpty else {
            throw InputError.isEmpty
        }
        
        return input
    }
    
    /// 정수형으로 변환 가능한 문자열을 읽습니다
    ///
    /// - Parameters:
    ///   - question: 출력할 문자열
    ///   - range: 양의 정수 범위
    /// - Returns: 양의 정수
    /// - Throws:
    ///     - InputError.isEmpty: 입력이 비어있음
    ///     - InputError.notANumber: 입력이 양의 정수형으로 변환 불가
    func readNumber(question: String? = nil,
                    possibleRange range: Range<UInt> = UInt.min..<UInt.max) throws -> UInt {
        
        let text = try readText(question: question)
        
        guard let number = UInt(text) else {
            throw InputError.notANumber
        }
        
        guard range.contains(number) else {
            throw InputError.invalidNumber
        }
        
        return number
    }
}
