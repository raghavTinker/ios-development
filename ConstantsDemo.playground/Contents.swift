import Foundation


struct MyStructure{
    let instanceProperty = "ABC"
    static let typeProperty = "123"
    
    func instanceMethod(){
        print("I am in an instance")
        //print(typeProperty) not possible
    }
    
    static func typeFunction(){
        print("\(typeProperty)")
        //print("\(instanceProperty)") not possible
    }
}

//to access the instance property I need to create an object
let myS = MyStructure()
print(myS.instanceProperty)
//print(myS.typeProperty) => this is not possible

myS.instanceMethod()
print(MyStructure.typeProperty) //this doesnt require an object to be created
MyStructure.typeFunction()
