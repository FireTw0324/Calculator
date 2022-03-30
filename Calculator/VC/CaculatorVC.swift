//
//  CaculatorVC.swift
//  Calculator
//
//  Created by HaoKai Lee on 2022/3/28.
//

import UIKit


class CaculatorVC: UIViewController {
    @IBOutlet weak var results: UILabel!
    @IBOutlet weak var workings: UILabel!
    var working: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clear()
    }
    
    func clear(){
        working = ""
        results.text = ""
        workings.text = ""
    }
    
    func addToWork(value: String){
        working = working + value
        workings.text = working
        
    }
    
    func formateResult(result: Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }else{
            return String(format: "%.2f", result)
        }
    }
    
    func validInput() -> Bool{
        var count = 0
        var funcCharIndex = [Int]()
        
        for char in working{
            if(specialOne(char: char)){
                funcCharIndex.append(count)
            }
            count += 1
        }
        var previous : Int = -1
        for index in funcCharIndex{
            if (index == working.count - 1){
                return false
            }
            
            if previous != -1{
                if (index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialOne(char: Character) -> Bool {
        if char == "*"{
            return true
        }
        if char == "/"{
            return true
        }
        if char == "+"{
            return true
        }
        if char == "-"{
            return true
        }
        if char == "."{
            return true
        }
        return false
    }
    
    
    @IBAction func equalsBtn(_ sender: Any) {
        if workings.text == ""{

        }else{
            if(validInput()){
                let expression = NSExpression(format: working)
                let result = expression.expressionValue(with: nil, context: nil) as! Double
                let string = formateResult(result: result)
                results.text = string
            }else{
                let controller = UIAlertController(title: "輸入錯誤", message: "請確認輸入值是否符合邏輯", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                controller.addAction(okAction)
                self.present(controller, animated: true, completion: nil)
            }
        }
    
    }
    @IBAction func allClearBtn(_ sender: Any) {
        clear()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        if (!working.isEmpty){
            working.removeLast()
            workings.text = working
        }
    }
    

    
    @IBAction func XBtn(_ sender: Any) {
        if workings.text == ""{
            
        }else{
            if(validInput()){
                self.equalsBtn((Any).self)
                let value = Int(results.text!)!
                var total = 1
                if value < 0 {
                    let controller = UIAlertController(title: "輸入錯誤", message: "階乘不能小於０", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                    controller.addAction(okAction)
                    self.present(controller, animated: true, completion: nil)
                }else if value == 0{
                    results.text = "1"
                    
                }else if value > 14{
                    let controller = UIAlertController(title: "輸入錯誤", message: "請輸入小於１５", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                    controller.addAction(okAction)
                    self.present(controller, animated: true, completion: nil)
                }else{
                    var num = 1
                    while num < value+1{
                        total *= num
                        num += 1
                    }
                    results.text = String(total)
                }
            }else{
                let controller = UIAlertController(title: "輸入錯誤", message: "請確認輸入值是否符合邏輯", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                controller.addAction(okAction)
                self.present(controller, animated: true, completion: nil)
            }
            
        }
    }
    
    @IBAction func divideBtn(_ sender: Any) {
        addToWork(value: "/")
    }
    @IBAction func timesBtn(_ sender: Any) {
        addToWork(value: "*")
    }
    @IBAction func plusBtn(_ sender: Any) {
        addToWork(value: "+")
    }
    @IBAction func subtractBtn(_ sender: Any) {
        addToWork(value: "-")
    }
    @IBAction func oneBtn(_ sender: Any) {
        addToWork(value: "1")
    }
    @IBAction func twoBtn(_ sender: Any) {
        addToWork(value: "2")
    }
    @IBAction func threeBtn(_ sender: Any) {
        addToWork(value: "3")
    }
    @IBAction func fourBtn(_ sender: Any) {
        addToWork(value: "4")
    }
    @IBAction func fiveBtn(_ sender: Any) {
        addToWork(value: "5")
    }
    @IBAction func sixBtn(_ sender: Any) {
        addToWork(value: "6")
    }
    @IBAction func sevenBtn(_ sender: Any) {
        addToWork(value: "7")
    }
    @IBAction func eightBtn(_ sender: Any) {
        addToWork(value: "8")
    }
    @IBAction func nineBtn(_ sender: Any) {
        addToWork(value: "9")
    }
    @IBAction func zeroBtn(_ sender: Any) {
        addToWork(value: "0")
    }
    @IBAction func pointBtn(_ sender: Any) {
        addToWork(value: ".")
    }
    
    


}
