//
//  InputView.swift
//  Laddergame
//
//  Created by yangpc on 2017. 10. 16..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import Foundation

struct InputView {

    func read() -> [String] {
        var inputs = [String]()
        print("참여할 사람 이름을 입력하세요.")
        let n = readLine() ?? ""
        print("최대 사다리 높이는 몇 개인가요?")
        let m = readLine() ?? ""
        inputs.append(n)
        inputs.append(m)
        return inputs
    }

}
