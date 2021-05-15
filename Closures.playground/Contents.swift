import UIKit

func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int{
    return operation(n1, n2)
}
func add(no1: Int, no2: Int) -> Int{
    return no1 + no2
}

func multiply(no1: Int, no2: Int) -> Int{
    return no1 * no2
}
print(calculator(n1: 1, n2: 2, operation: add(no1:no2:)))
print(calculator(n1: 1, n2: 2, operation: multiply(no1:no2:)))
print(calculator(n1: 3, n2: 3, operation: {(no1: Int, no2: Int) -> Int in
    return no1 * no2
}))

//Type inference
print(calculator(n1: 3, n2: 3, operation: {(no1, no2) in
    return no1 * no2
}))

print(calculator(n1: 3, n2: 3, operation: {(no1, no2) in no1 * no2}))


print(calculator(n1: 3, n2: 3, operation: {$0 * $1})) //$0 first parameter and $1 second
print(calculator(n1: 3, n2: 3) {$0 * $1}) //Trailing parameter


let array: [Int] = [1,2,34,5]
//I want to add 1 to each element

func addOne(n1: Int) -> Int{
    return n1 + 1
}
array.map(addOne)
print(array.map({$0 + 1}))
 
let newArray: [String] = array.map({"\($0 + 1)"})

/*
    Closure expression syntax
    {(parameters) -> return type in
        statements
    }
*/
