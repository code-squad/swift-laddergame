//
//  InputView.swift
//  LadderGame
//
//  Created by 심 승민 on 2017. 10. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView{
    // 문장을 입력받아 전처리.
    static func input(msg: String)->String?{
        print(msg, terminator: " ")
        guard let inputLine = readLine() else{ return nil }
        return inputLine
    }
    
    // 입력받은 문장을 게임에 사용할 이름들로 전처리.
    static func splitNames(of inputNames: String, with sep: Character)->[String]{
        // 쉼표 기준 배열로 분리.
        let splitNames = inputNames.split(separator: sep)
        return splitNames.map { $0.trimmingCharacters(in: .whitespaces) }
    }
}
