//
//  InputView.swift
//  LadderGame
//
//  Created by jack on 2017. 12. 4..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//
//사용자의 입력을 받는 구조체
import Foundation

struct InputView {
    //종료키인 q인지 확인하는 함수
    //입력 : 문자열
    private func isExitKey (inputString : String) -> Bool {
        let temp = inputString
        guard temp == "q" else {
            return true
        }
        return false
    }
    //참가자 수를 생성하는 함수
    //q일 경우 0을 반환한다.
     func generateEntry () -> [String]? {
        print("종료를 원하시면 q를 입력해주세요.")
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        let userEntry = readLine()
        guard isExitKey(inputString: userEntry ?? "") == true else {
            return [""]
        }
        guard let input = userEntry else {
            return nil
        }
        let names = input.split(separator: ",").map(String.init)
        return names
    }
    
    //사다리 높이 갯수를 생성하는 함수
    //q를 입력할 경우 0을 반환한다.
     func generateHeight () -> Int {
        print("사다리 높이의 갯수는 몇 개 인가요?")
        let userHeight = readLine()
        guard isExitKey(inputString: userHeight ?? "") == true else {
            return 0
        }
        return Int(userHeight ?? "") ?? 0
    }
}
