import Foundation

struct InputControl {
    
    //MARK: 비공개 정적 메소드
    private static func ask(for question: String) throws -> String {
        print(question)
        guard let input = readLine() else {
            throw InputError.invalidInput
        }
        return input
    }
    
    //MARK: 정적 메소드
    static func readNameOfPlayers() throws -> (Players: [Player], maxNameLength: Int) {
        let namesFromUser = try InputControl.ask(for: "참여할 사람 이름을 입력하세요. (이름은 쉼표`,`로 구분)")
        let nameOfPlayers = namesFromUser.split(separator: ",").map { String($0) }
        
        var maxNameLength = 0
        for player in nameOfPlayers {
            let playerNameLength = player.count
            if playerNameLength > maxNameLength {
                maxNameLength = playerNameLength
            }
        }
        
        guard nameOfPlayers.count > 1 else {
            throw InputError.invalidNumberOfPlayers
        }
        
        return (nameOfPlayers.map { Player(name: $0) }, maxNameLength)
    }
    
    static func readHeight() throws -> Int {
        guard let height = Int(try InputControl.ask(for: "사다리의 높이를 입력하세요.")) else {
            throw InputError.cannotClassifyNumber
        }
        guard height > 0 else {
            throw InputError.invalidLadderHeight
        }
        return height
    }
    
    
}
