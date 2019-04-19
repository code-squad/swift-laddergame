//
//  playLadderGame.swift
//  LadderGame
//
//  Created by 이희찬 on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

func playladdergame (){
    let start = Input()
    let movement = Function()
    let end = Output()
    end.playPrint(ladders: movement.playDraw(ladder: start.playInput()))
}








