//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

///시작 함수
func main() {
    let userInput: InputView
    
    do {
        userInput = try InputView()
    } catch let error where error is InputError {
        print(error.localizedDescription)
        return
    } catch let error where error is PlayerNameError {
        print(error.localizedDescription)
        return
    } catch {
        return
    }
    
    let ladderGame: LadderGame
    
    do {
        ladderGame = try LadderGame(players: userInput.players, height: userInput.ladderHeight)
    } catch {
        print(error.localizedDescription)
        return
    }
    
    ResultView.printLadder(ladderGame: ladderGame)
}

main()
