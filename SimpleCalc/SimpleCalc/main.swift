//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        
        let oper : String = findOperator(args) // Finding operator in Equation
        
        // Switch Condition for which Operator I found
        switch oper {
        case "+":
            let int1 : Int! = Int(args[0])
            let int2 : Int! = Int(args[2])
            return int1 + int2
        
        case "-":
            let int1 : Int! = Int(args[0])
            let int2 : Int! = Int(args[2])
            return int1 - int2
        
        case "%":
            let int1 : Int! = Int(args[0])
            let int2 : Int! = Int(args[2])
            return (int1 % int2 + int2) % int2

        case "/":
            let int1 : Int! = Int(args[0])
            let int2 : Int! = Int(args[2])
            return int1 / int2
            
        case "*":
            let int1 : Int! = Int(args[0])
            let int2 : Int! = Int(args[2])
            return int1 * int2
        
        case "count":
            if args.count < 2 {
                return 0
            } else {
                return args.count - 1
            }
        
        case "avg":
            var summed : Int! = 0
            if args.count < 2 {
                return 0
            } else {
                for i in 0...args.count - 2 {
                    let toAdd : Int! = Int(args[i])
                    summed += toAdd
                }
                let num : Int = summed / (args.count - 1)
                return num
            }
            
        case "fact":
            if args.count < 2 {
                return 0
            } else if args[0] == "1" || args[0] == "0" {
                return 1
            } else {
                let product : Int! = Int(args[0])
                var toCompute = abs(product)
                
                for i in stride(from: toCompute - 1, to: 1, by: -1) {
                    toCompute *= i
                }
                return product > 0 ? toCompute : -toCompute
            }
            
        default:
            print("Error")
            
        }
        return 0
    }
    
    // Method used to find the operator
    private func findOperator(_ args: [String]) -> String {
        if Int(args[args.count - 1]) != nil {
            return args[args.count - 2]
        } else {
            return args[args.count - 1]
        }
    }
    
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

