//
//  InputView.swift
//  LadderGame
//
//  Created by 조재흥 on 2018. 9. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    var description : String
    
    func inputValue() -> String {
        print(description)
        guard let value = readLine() else {
            return "0"
        }
        return value
    }
}
