//
//  ResultView.swift
//  LadderGame
//
//  Created by 조재흥 on 2018. 9. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    func showResult(_ ladder:LadderGame) {
        for i in ladder.ladder {
            showLayer(i)
        }
        for i in ladder.names {
            showName(i.name)
        }
    }
    
    func showLayer(_ layer:[String]) {
        for i in layer {
            print("|", terminator: "")
            print(i, terminator: "")
        }
        print("|")
    }

    func showName(_ name:String) {
        print(name, terminator: "")
        for _ in 0...5 - name.count {
            print(" ", terminator: "")
        }
    }
}
