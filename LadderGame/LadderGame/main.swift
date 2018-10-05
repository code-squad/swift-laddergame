//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main(){
    var gamePlay = LadderGame()
    guard gamePlay.inputFromPlayer() else{
        return
    }
    gamePlay.outputView()
}

main()
