//
//  InputView.swift
//  LadderGame
//
//  Created by 조재흥 on 2018. 9. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    let question : String
    
    func inputValue() -> String {
        print(self.question)
        guard let value = readLine() else {return "0"}
        return value
    }
    
    init(question:String) {
        self.question = question
    }
}
