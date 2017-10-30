//
//  LadderGame.swift
//  LadderGame
//
//  Created by Eunjin Kim on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private var height = 0
    private var names : [LadderPlayer]
    
    init(height: Int) {
        self.height = height
        self.names = []
    }
    
    init(names: [LadderPlayer]) {
        self.names = names
    }
    
    mutating func setHeight(height: Int){
        self.height = height
    }
    
    func getHeight() -> Int{
        return height
    }
    
    mutating func setNames(name: LadderPlayer){
        self.names.append(name)
    }
    
    func getNames() -> [LadderPlayer]{
        return names
    }
    
    func seperateNameOfPlayers(inputValue: String) -> Array<String>{        
        return inputValue.split(separator: ",").map(String.init)
    }
    
    func makeRandomValue() -> String {
        let randomValue = arc4random_uniform(2)
        if randomValue == 0 {
            return " "
        }else {
            return "-"
        }
    }
    
    mutating func makePlayerObject(players: Array<String>) {
        
        for name in players {
            var ladderPlayer = LadderPlayer()
            ladderPlayer.setName(name: name)
            setNames(name: ladderPlayer)
        }
    }
}
