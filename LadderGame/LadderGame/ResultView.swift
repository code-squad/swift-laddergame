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
    
    private func showLayer(_ layer:[Bool]) {
        for i in layer {
            print("|", terminator: "")
            print(i, terminator: "")
        }
        print("|")
    }

    private func showName(_ name:String) {
        print(name, terminator: "")
        for _ in 0...5 - name.count {
            print(" ", terminator: "")
        }
    }
}
