//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
//  Forked and dev by HW on 09/04/2019
import Foundation

/// 입력값이 숫자인지 체크 - 1)빈문자열이 아니고, 2)정수숫자가 있어야하고, 3)다른 문자열이 없어야 한다
public extension String {
    func isNumber() -> Bool {
        return !self.isEmpty
            && self.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
            && self.rangeOfCharacter(from: CharacterSet.letters) == nil
    }
}

// khan,clid,faker,teddy,mata
let main = {
    while true {
        do {
            try startLadderGame()
            break;
        }catch ErrorCode.invalidInput{
            print("입력이 없습니다")
        }catch ErrorCode.notANumber{
            print("입력 문자열은 숫자가 아닙니다.")
        }catch ErrorCode.outOfRangeNumber{
            print("입력 범위가 유효한 범위가 아닙니다.")
        }catch {
            print("알 수 없는 에러 발생")
        }
    }
}

main()
