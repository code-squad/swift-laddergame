//
//  ResultView.swift
//  LadderGame
//
//  Created by 이진영 on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    private static func convertLadderRow(_ row: [LadderStep]) -> String {
        var rowText = LadderComponent.firstComponent.rawValue
        
        for component in row {
            rowText.append(component.convertLadderStep())
            rowText.append(LadderComponent.verticalComponent.rawValue)
        }
        
        return rowText
    }
    
    private static func convertNameToPrint(name: String) -> String {
        var convertName = name
        var blank = 5 - name.count
        
        while blank > 0 {
            blank -= 1
            
            switch blank % 2 {
            case 0:
                convertName = convertName + " "
            default:
                convertName = " " + convertName
            }
        }
        
        return convertName
    }
    
    static func printLadder(ladderGame: LadderGame) {
        for row in ladderGame.ladder {
            print(convertLadderRow(row))
        }
        
        for player in ladderGame.players {
            print(convertNameToPrint(name: player.name), terminator: " ")
        }
    }
}
