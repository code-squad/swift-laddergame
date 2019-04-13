import Foundation

struct InputControl {
    
    private func ask(for question: String) throws -> String {
        print(question)
        guard let input = readLine() else {
            throw InputError.invalidInput
        }
        return input
    }
    
    func readNameOfPlayers() throws -> [Player] {
        let nameOfPlayers = try ask(for: "참여할 사람 이름을 입력하세요. (이름은 쉼표`,`로 구분)")
        let players = nameOfPlayers.split(separator: ",").map { Player(name: String($0)) }
        guard players.count > 1 else {
            throw InputError.invalidNumberOfPlayers
        }
        for player in players {
            guard player.name.count <= LadderGame.maximumNameLength else {
                throw InputError.invalidPlayerName
            }
        }
        return players
    }
    
    func readHeight() throws -> Int {
        guard let height = Int(try ask(for: "사다리의 높이를 입력하세요.")) else {
            throw InputError.notNumber
        }
        guard height > 0 else {
            throw InputError.invalidLadderHeight
        }
        return height
    }
    
    
}
