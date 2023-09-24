//: [Previous](@previous)

import Foundation

func eatAndExercise(sport: () -> String) {
    print("After eating, \(sport())")
}

func eatAndExercise(sport: (Int, Int) -> String) {
    print("After eating, \(sport(8,8))")
}

eatAndExercise {
    return "Test"
}

//eatAndExercise { times, times2 -> String in
eatAndExercise { times, _ in
    for i in 0...times {
        print("\(i)", "--- Playing")
    }
    return "finish playing"
}
