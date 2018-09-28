//
//  InputView.swift
//  LadderGame
//
//  Created by 윤지영 on 2018. 9. 21..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    private var guideMessage : String
    
    init(guideMessage:String) {
        self.guideMessage = guideMessage
    }
    
    func getInput() -> String {
        print(self.guideMessage)
        guard let input:String = readLine() else { return String() }
        return input
    }
}
