//
//  LadderGame.swift
//  LadderGame
//
//  Created by JieunKim on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private var players = [LadderPlayer]()
    // 이 변수에 대한 접근을 막는게 private인데, set을 사용하여 이 변수에 대한 set만 막는다.
    // get을 할 수 있다.
    private var height = 0
    private var _ladder: Ladder // 저장프로퍼티 생성 (상태 유지 위해 만들어줬다.)
    public func getPlayer()-> [LadderPlayer] {
        return players
    }
    
    init(players: [LadderPlayer], height: Int) {
        self.players = players
        self.height = height
        self._ladder = Ladder(numberOfPlayer: players.count, ladderLayer: height)
        
    }
    
    var numberOfPlayer: Int {
        get {
            return players.count
        }
    }
    
    var ladder: Ladder {
        get {
            return _ladder
            // 이미 저장되어 있는 객체이기 때문에 get하여 꺼내다가 쓸 수 있다.
        }
       
    }
}

