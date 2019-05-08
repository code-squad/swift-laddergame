//
//  InputView.swift
//  LadderGame
//
//  Created by BLU on 2019. 4. 19..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    enum Error: Swift.Error {
        case isEmpty
        case notANumber
        case invalidNumber
        
        var localizedDescription: String {
            switch self {
            case .isEmpty:
                return "입력이 정의되지 않았습니다."
            case .notANumber:
                return "정수형으로 변환되지 않는 입력입니다."
            case .invalidNumber:
                return "유효하지 않은 범위의 입력입니다."
            }
        }
    }
    
    /// 문자열을 읽습니다.
    ///
    /// - Parameter question: 출력할 문자열
    /// - Returns: 문자열
    /// - Throws: InputError.isEmpty: 입력이 비어있음
    private func readText(question: String? = nil) throws -> String {
        
        if let question = question {
            print(question)
        }
        
        guard let input = readLine(), !input.isEmpty else {
            throw InputView.Error.isEmpty
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
            throw InputView.Error.notANumber
        }
        
        guard range.contains(number) else {
            throw InputView.Error.invalidNumber
        }
        
        return number
    }
    
    func readPlayerNames(question: String? = nil) throws -> [String] {
        let text = try readText(question: question)
        return text.components(separatedBy: ",")
    }
}
