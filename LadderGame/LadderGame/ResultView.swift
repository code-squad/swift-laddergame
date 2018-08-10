import Foundation

struct ResultView {
    func printLadder(_ makeLadder:[[String]] ,_ names:String) {
        var ladder:String = ""
        for oneLadder in makeLadder {
            ladder += "\(oneLadder.joined(separator: " "))| \n"
        }
        print(ladder, terminator: " ")
        print(names)
    }
}
