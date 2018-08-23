import Foundation

//참여할 사람 입력 받기 -> InputView
struct InputView {
    
    private static func readSomething(_ announcement : String) -> String {
        print(announcement)
        let some = readLine() ?? ""
        return some
    }
    
    func inputUserData () -> Array<String> {
        let inputUserName = InputView.readSomething("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        let player = inputUserName.components(separatedBy: ",")
        return player
    }
   
//사다리 높이 정하기 -> InputView
    func inputLadderLength () -> Int {
        
        let maxLadderNumber = InputView.readSomething("최대 사다리 높이는 몇 개인가요?")
        return Int(maxLadderNumber) ?? 0
    }
}

