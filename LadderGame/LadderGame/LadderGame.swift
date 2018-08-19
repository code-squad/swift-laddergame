import Foundation

struct LadderGame {
    
    private(set) var names: [LadderPlayer]
    private var height = 0
    
    init(input: ([String], Int) ) {
        var playerArray = [LadderPlayer]()
        for name in input.0 {
            let p = LadderPlayer(name: name)
            playerArray.append(p)
        }
        self.names = playerArray
        self.height = input.1
    }
    
    func createLadderFoothold() -> Bool {
        let rowCreate = Int(arc4random_uniform(2))
        guard rowCreate % 2 == 0 else { return false }
            
        return true
    }
    
    func makeLadderElements() -> [[Bool]] {
        var ladderArray = [[Bool]](repeating: Array(repeating: false ,count: self.names.count-1), count: self.height)
        
        for i in 0..<self.height {
            for j in 0..<names.count-1 {
                ladderArray[i][j] = arc4random_uniform(2) == 0 ? true : false
            }
        }
        return ladderArray
    }
    
}

