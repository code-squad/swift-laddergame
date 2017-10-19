//
//  main.swift
//  Laddergame
//
//  Created by yangpc on 2017. 10. 16..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import Foundation

print("이전과 동일하면 s, 입력을 멈추려면 엔터를 입력하세요.")
var inputView = InputView()

while(true) {
    do {
        guard let inputs = try inputView.read() else { break }
        let game = LadderGame(inputs: inputs)
        let ladder = game.makeLadder()
        
        let resultView = ResultView()
        resultView.result(ladder: ladder, names: game.names)
        
    } catch InputError.emptyInput {
        print("입력 값이 없습니다.")
    } catch InputError.invalidInput {
        print("입력 값이 유효하지 않습니다.")
    } catch InputError.outOfLength {
        print("이름 길이를 5이하로 입력해 주세요.")
    }
}
