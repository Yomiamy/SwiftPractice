
// ====== forEach ======
let lovers = ["Penny", "Joi", "Paggy"]
lovers.forEach { name in
    print("name is \(name)")
}

// ====== Map ======
var grades = [50, 80, 70]
var newGrades = grades.map {
    $0 + 10
}
print(newGrades)

// ====== Filter ======
var goodGrades = grades.filter { $0 > 60 }
print(goodGrades)
