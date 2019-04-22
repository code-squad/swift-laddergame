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
    func readHeight(possibleRange range: Range<UInt> = UInt.min..<UInt.max ) throws -> UInt {
        print("최대 사다리 높이는 몇 개인가요?")
        let text = try readText()
        
        guard let number = UInt(text) else {
            throw InputError.notANumber
        }
        
        guard range.contains(number) else {
            throw InputError.invalidNumber
        }
        
        return number
    }
    
    func readPlayers() throws -> [LadderPlayer] {
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        let names = try readText().split(separator: ",")
        
        return names.map { LadderPlayer(name: String($0)) }
    }
}
