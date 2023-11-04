struct Card {
    let suit: String
    let rank: String
}

let suits = ["♣", "♦", "♥", "♠"]
let ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
var cards = [Card]()

for suit in suits {
    for rank in ranks {
        print(suit, rank)
        cards.append(Card(suit: suit, rank: rank))
    }
}

// let newCards = cards.shuffled()
cards.shuffle()

cards[5].suit
cards[5].rank
cards[20].suit
cards[20].rank
