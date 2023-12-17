println "Hello world"

// Working with primitives
x = 1
println x

x = new java.util.Date()
println x

x = -3.14
println x

x = false
println x

x = "Hi!"
println x

// Working with lists
myList = [1776, -1, 33, 99]
println myList
println myList[0]
println myList[-1]
println myList.size()

// Working with maps
scores = ["brett": 100, "pete":"did not finish", "andrew": 12.1234]
println scores
println scores["pete"]
println scores.pete

scores["pete"] = 42
scores["john"] = 60

println scores

new_scores = scores + ["pete": 3, "matt": 155]
println new_scores

// Multiple assignment
(a, b, c) = [1, 2, 3]
assert a == 1 && b == 2 && c == 3

// Conditional
x = Math.random()
if (x<0.5) {
  println "less"
} else {
  println "more"
}

