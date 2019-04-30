//
//  OutputView.swift
//  LadderGame
//
//  Created by JH on 30/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView  {
    
    //플레이어이름 출력하는 함수
    func showPlayerName(playerName: Array<String>) {
        var showName = String()
        
        for index in 0..<playerName.count {
            var name = playerName[index]
            while name.count < 6 {
                name.insert(" ", at: name.endIndex)
            }
            showName = showName + name
        }
        print(showName)
    }

}
