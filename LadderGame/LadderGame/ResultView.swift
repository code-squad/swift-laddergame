//
//  ResultView.swift
//  LadderGame
//
//  Created by 이진영 on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    func convertLadderRow(_ row: [LadderStep]) -> String {
        var rowText = LadderComponent.firstComponent.rawValue
        
        for value in row {
            rowText.append(value.convertLadderStep())
            rowText.append(LadderComponent.verticalComponent.rawValue)
        }
        
        return rowText
    }
    
    func printLadder(ladder: [[LadderStep]], players: [LadderPlayer]) {
        for row in ladder {
            print(convertLadderRow(row))
        }
        
        for player in players {
            print(player.name, terminator: " ")
        }
    }
}
