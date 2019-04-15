//
//  InputView.swift
//  LadderGame
//
//  Created by jang gukjin on 12/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum ErrorMessages:Error{
    case wrongInput
    case outOfRange
}

enum CountQuestions : String, CaseIterable{
    case people = "참여할 사람을 입력하세요 (구분은 ,로 하고 최대 5명까지 입력가능홥니다)"
    case ladder = "최대 사다리 높이는 몇 개인가요?"
    
    //static let allValues = [people,ladder]
}

/// 사용자의 입력을 받는 구조체
struct InputView {
    /// 사람과 사다리의 수를 입력받는 함수
    func inputCount()->(players : [String], height : Int) {
        var players:[String] = []
        var height:Int = 0
        
        while true{
            do{
                players = try inputName(askInputNameText : CountQuestions.people)
                height = try inputHeight(askInputHeightText : CountQuestions.ladder)
                break
            }catch ErrorMessages.wrongInput{
                print("잘못된 입력입니다.")
            }catch ErrorMessages.outOfRange{
                print("잘못된 범위입니다.")
            }catch {
                print("알 수 없는 에러입니다.")
            }
        }
        return (players,height)
    }

    /// 사람과 사다리의 수를 입력받는 함수
    func inputName(askInputNameText : CountQuestions) throws -> [String] {
        print(askInputNameText.rawValue)
        let nameText = readLine()
        
        if nameText == nil { throw ErrorMessages.wrongInput}
        else {
            let invertStringNames = String(nameText!)
            let names = invertStringNames.split(separator: ",").map{ String($0) }
            if names.count > 5 || names.count < 2{
                throw ErrorMessages.outOfRange
            }
            return names
        }
    }
    
    func inputHeight(askInputHeightText : CountQuestions) throws -> Int {
        print(askInputHeightText.rawValue)
        guard let heightText = Int(readLine() ?? "0"), heightText > 1 else{
            throw ErrorMessages.outOfRange
        }
        return heightText
    }
}
