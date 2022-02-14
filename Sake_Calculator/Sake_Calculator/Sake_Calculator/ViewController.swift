//
//  ViewController.swift
//  Sake_Calculator
//
//  Created by Sake,Maneesh on 2/13/22.
//


import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayLabel: UILabel!
    var operandOne = ""
      var operandTwo = ""
      var operation = ""
      var operatorChanged = false
      var currentNumber2 = ""
      var multipleOperators = false
      var result = ""
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayLabel.text = "0"
    
    }
    @IBAction func ACButton(_ sender: Any) {
        operandTwo = ""
                operandOne = ""
                operatorChanged = false
                operation = ""
                currentNumber2 = ""
                displayLabel.text = ""
                multipleOperators=false
        
    }
    
    @IBAction func CButton(_ sender: Any) {
        displayLabel.text = ""
               operandTwo = ""
    }
    @IBAction func ASButton(_ sender: Any) {
        if operandOne != "" {
                    
                    displayLabel.text = "-" + displayLabel.text!
                    operandOne = "\(displayLabel.text!)"
                }
                else{
                    displayLabel.text = "-" + displayLabel.text!
                    operandTwo = "\(displayLabel.text!)"
                }
    }
    @IBAction func DivButton(_ sender: Any) {
        let value = calTemp(operation)
              operation = "/"
              displayLabel.text = (value != "") ? resultFormatter(value) : ""
              if value != "" {
                  if operandTwo != ""{
                      multipleOperators = true
                      if operatorChanged {
                          result = String(Double(value)! / Double(operandTwo)!)
                          if result == "inf"{
                              displayLabel.text! = "Error"
                          }else{
                              displayLabel.text! = resultFormatter(result)
                          }
                      }
                  }
              }
              operatorChanged = true
    }
    
    @IBAction func MulButton(_ sender: Any) {
        let temp = calTemp(operation)
               operation = "*"
               currentNumber2=""
               displayLabel.text = (temp != "") ? resultFormatter(temp) : ""
               operatorChanged=true
               displayLabel.text = ""
               
    }
    @IBAction func SubButton(_ sender: Any) {
        let temp = calTemp(operation)
              operation = "-"
              displayLabel.text = (temp != "") ? resultFormatter(temp) : ""
              if temp != "" {
                          if operandTwo != ""{
                      multipleOperators = true
                      currentNumber2 = operandTwo;
                      if operatorChanged {
                          result = String(Double(temp)! - Double(operandTwo)!)
                          displayLabel.text! = resultFormatter(result)
                      }
                  }
              }
              operatorChanged = true
    }
    @IBAction func PlusButton(_ sender: Any) {
        let temp = calTemp(operation)
                operation = "+"
                currentNumber2=""
                displayLabel.text = (temp != "") ? resultFormatter(temp) : ""
                operatorChanged=true
                displayLabel.text = ""

    }
    @IBAction func EqButton(_ sender: Any) {
        var res = ""
                switch operation {
                case "+":
                    
                    if currentNumber2 != "" {
                        res = String(Double(operandOne)! + Double(currentNumber2)!)
                        displayLabel.text = resultFormatter(res)
                         operandTwo = currentNumber2
                    }else{
                        res = String(Double(operandOne)! + Double(operandTwo)!)
                        displayLabel.text = resultFormatter(res)
                    }
                    operandOne = res
                    
                    break
                case "*":
                    if currentNumber2 != "" {
                        res = String(Double(operandOne)! * Double(currentNumber2)!)
                        displayLabel.text = resultFormatter(res)
                    }else{
                        res = String(Double(operandOne)! * Double(operandTwo)!)
                        displayLabel.text = resultFormatter(res)
                    }
                    operandOne = res
                    
                    break
                case "-":
                    if currentNumber2 != "" {
                        res = String(Double(operandOne)! - Double(currentNumber2)!)
                        displayLabel.text = resultFormatter(res)
                        //                number2 = ""
                    }else{
                        res = String(Double(operandOne)! - Double(operandTwo)!)
                        displayLabel.text = resultFormatter(res)
                    }
                    operandOne = res
                    break
                case "/":
                    if displayLabel.text == "Error"{
                        operandTwo = ""
                        operandOne = ""
                        operatorChanged = false
                        operation = ""
                        currentNumber2 = ""
                        displayLabel.text = "0"
                        multipleOperators=false
                    }else{
                        if currentNumber2 != "" {
                            res = String(Double(operandOne)! / Double(currentNumber2)!)
                            if res == "inf"{
                                displayLabel.text! = "Error"
                                return
                            }else{
                                displayLabel.text = resultFormatter(res)
                            }
                        }else{
                            res = String(Double(operandOne)! / Double(operandTwo)!)
                            if res == "inf"{
                                displayLabel.text! = "Error"
                                return
                            }else{
                                displayLabel.text = resultFormatter(res)
                            }
                        }
                        operandOne = res
                    }
                    break
                default:
                    print("Nothing")
                }
                
            }
    
    @IBAction func SrButton(_ sender: Any) {
        if displayLabel.text == "" || displayLabel.text == "0"{
                    return
                }
                let squareRoot = displayLabel.text
                displayLabel.text = resultFormatter(String(Double(squareRoot!)!.squareRoot()))
                operandOne = displayLabel.text!
                operandTwo = ""
                
    }
    @IBAction func DotButton(_ sender: Any) {
        let number = "."
                if displayLabel.text == "0"{
                    displayLabel.text = ""
                    displayLabel.textColor = .white
                }
                if !operatorChanged {
                    displayLabel.text! += number
                    operandOne += number
                }else{
                    if !multipleOperators {
                        displayLabel.text! += number
                        operandTwo += number
                    }else {
                        displayLabel.text = ""
                        displayLabel.text! += number
                        operandTwo += number
                    }
                }
    }
    @IBAction func oneButton(_ sender: Any) {
        let number = "1"
               if displayLabel.text == "0"{
                   displayLabel.text = ""
                   displayLabel.textColor = .white
               }
               if !operatorChanged {
                   displayLabel.text! += number
                   operandOne += number
               }else{
                   if !multipleOperators {
                       displayLabel.text! += number
                       operandTwo += number
                   }else {
                       displayLabel.text = ""
                       displayLabel.text! += number
                       operandTwo += number
                   }
               }
    }
    @IBAction func twoButton(_ sender: Any) {
        let number = "2"
               if displayLabel.text == "0"{
                   displayLabel.text = ""
                   displayLabel.textColor = .white
               }
               if !operatorChanged {
                   displayLabel.text! += number
                   operandOne += number
               }else{
                   if !multipleOperators {
                       displayLabel.text! += number
                       operandTwo += number
                   }else {
                       displayLabel.text = ""
                       displayLabel.text! += number
                       operandTwo += number
                   }
               }
    }
    @IBAction func threeBuutton(_ sender: Any) {
        let number = "3"
                if displayLabel.text == "0"{
                    displayLabel.text = ""
                    displayLabel.textColor = .white
                }
                if !operatorChanged {
                    displayLabel.text! += number
                    operandOne += number
                }else{
                    if !multipleOperators {
                        displayLabel.text! += number
                        operandTwo += number
                    }else {
                        displayLabel.text = ""
                        displayLabel.text! += number
                        operandTwo += number
                    }
                }
    }
    @IBAction func fourButton(_ sender: Any) {
        let number = "4"
                if displayLabel.text == "0"{
                    displayLabel.text = ""
                    displayLabel.textColor = .white
                }
                if !operatorChanged {
                    displayLabel.text! += number
                    operandOne += number
                }else{
                    if !multipleOperators {
                        displayLabel.text! += number
                        operandTwo += number
                    }else {
                        displayLabel.text = ""
                        displayLabel.text! += number
                        operandTwo += number
                    }
                }
    }
    @IBAction func fiveButton(_ sender: Any) {
        let number = "5"
               if displayLabel.text == "0"{
                   displayLabel.text = ""
                   displayLabel.textColor = .white
               }
               if !operatorChanged {
                   displayLabel.text! += number
                   operandOne += number
               }else{
                   if !multipleOperators {
                       displayLabel.text! += number
                       operandTwo += number
                   }else {
                       displayLabel.text = ""
                       displayLabel.text! += number
                       operandTwo += number
                   }
               }
    }
    @IBAction func sixButton(_ sender: Any) {
        let number = "6"
                if displayLabel.text == "0"{
                    displayLabel.text = ""
                    displayLabel.textColor = .white
                }
                if !operatorChanged {
                    displayLabel.text! += number
                    operandOne += number
                }else{
                    if !multipleOperators {
                        displayLabel.text! += number
                        operandTwo += number
                    }else {
                        displayLabel.text = ""
                        displayLabel.text! += number
                        operandTwo += number
                    }
                }
    }
    @IBAction func sevenButton(_ sender: Any) {
        let number = "7"
               if displayLabel.text == "0"{
                   displayLabel.text = ""
                   displayLabel.textColor = .white
               }
               if !operatorChanged {
                   displayLabel.text! += number
                   operandOne += number
               }else{
                   if !multipleOperators {
                       displayLabel.text! += number
                       operandTwo += number
                   }else {
                       displayLabel.text = ""
                       displayLabel.text! += number
                       operandTwo += number
                   }
               }
    }
    @IBAction func eightButton(_ sender: Any) {
        
        let number = "8"
               if displayLabel.text == "0"{
                   displayLabel.text = ""
                   displayLabel.textColor = .white
               }
               if !operatorChanged {
                   displayLabel.text! += number
                   operandOne += number
               }else{
                   if !multipleOperators {
                       displayLabel.text! += number
                       operandTwo += number
                   }else {
                       displayLabel.text = ""
                       displayLabel.text! += number
                       operandTwo += number
                   }
               }
    }
    @IBAction func nineButton(_ sender: Any) {
        let number = "9"
                if displayLabel.text == "0"{
                    displayLabel.text = ""
                    displayLabel.textColor = .white
                }
                if !operatorChanged {
                    displayLabel.text! += number
                    operandOne += number
                }else{
                    if !multipleOperators {
                        displayLabel.text! += number
                        operandTwo += number
                    }else {
                        displayLabel.text = ""
                        displayLabel.text! += number
                        operandTwo += number
                    }
                }
    }
    @IBAction func zeroButton(_ sender: Any) {
        let number = "0"
               if displayLabel.text == "0"{
                   displayLabel.text = ""
                   displayLabel.textColor = .white
               }
               if !operatorChanged {
                   displayLabel.text! += number
                   operandOne += number
               }else{
                   if !multipleOperators {
                       displayLabel.text! += number
                       operandTwo += number
                   }else {
                       displayLabel.text = ""
                       displayLabel.text! += number
                       operandTwo += number
                   }
               }
    }
    

func calTemp(_ operation:String)->String {
        if operandOne != "" && operandTwo != ""{
            if operation == "+"{
                operandOne = String(Double(operandOne)! + Double(operandTwo)!)
                currentNumber2 = operandTwo
                operandTwo = ""
                return String(operandOne)
            }
            if operation == "-"{
                operandOne = String(Double(operandOne)! - Double(operandTwo)!)
                currentNumber2 = operandTwo
                operandTwo = ""
                return String(operandOne)
            }
            if operation == "*"{
                operandOne = String(Double(operandOne)! * Double(operandTwo)!)
                currentNumber2 = operandTwo
                operandTwo = ""
                return String(operandOne)
            }
            if operation == "/"{
                operandOne = String(Double(operandOne)! / Double(operandTwo)!)
                currentNumber2 = operandTwo
                operandTwo = ""
                return String(operandOne)
            }
        }
        return ""
    }
    
    func resultFormatter(_ result:String)->String {
        let value = Double(result)!
        var resultStr = String(round(value * 100000) / 100000.0)
        
        if resultStr.contains(".0"){
            resultStr.removeSubrange(resultStr.index(resultStr.endIndex, offsetBy: -2)..<resultStr.endIndex)
        }
        
        return resultStr
    }
    


}

