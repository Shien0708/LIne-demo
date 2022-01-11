//
//  ViewController.swift
//  LIne demo
//
//  Created by 方仕賢 on 2021/11/18.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var chimmyImageView: UIImageView!
    @IBOutlet weak var inputIconImageView1: UIImageView!
    @IBOutlet weak var inputIconImageView2: UIImageView!
    @IBOutlet weak var inputIconImageView3: UIImageView!
    @IBOutlet weak var inputIconImageView4: UIImageView!
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    
    
    let correctPassword = [0,0,0,0]
    var inputPassword = [Int]()
    var index = 0
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button0: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hideIcons(isBackButton: false)
        enterButton.isHidden = true
    }
    
    
    @IBAction func erase(_ sender: UIButton) {
        
        switch sender {
        case backButton:
            
            if index > 0 {
                hideIcons(isBackButton: true)
                inputPassword.remove(at: index-1)
                index -= 1
                
            }
       
        case clearButton:
            
            if index > 0 {
                hideIcons(isBackButton: false)
                index -= inputPassword.count
                inputPassword = []
                
            }
            
            
        default:
            index += 0
        }
    }
    
    
    @IBAction func press(_ sender: UIButton) {
        
        if index <= 4 {
            switch sender {
                
            case button0:
                inputPassword.append(0)
                index += 1
                print("\(inputPassword)")
            case button1:
                inputPassword.append(1)
                index += 1
                print("\(inputPassword)")
            case button2:
                inputPassword.append(2)
                index += 1
                print("\(inputPassword)")
            case button3:
                inputPassword.append(3)
                index += 1
                print("\(inputPassword)")
            case button4:
                inputPassword.append(4)
                index += 1
                print("\(inputPassword)")
            case button5:
                inputPassword.append(5)
                index += 1
                print("\(inputPassword)")
            case button6:
                inputPassword.append(6)
                index += 1
                print("\(inputPassword)")
            case button7:
                inputPassword.append(7)
                index += 1
                print("\(inputPassword)")
            case button8:
                inputPassword.append(8)
                index += 1
                print("\(inputPassword)")
            case button9:
                inputPassword.append(9)
                index += 1
                print("\(inputPassword)")
            default:
                index += 0
                print("0")
            }
            
            
        }
        
        
        
        if inputIconImageView1.isHidden == true {
            inputIconImageView1.isHidden = false
            
            
        } else if inputIconImageView2.isHidden == true {
            inputIconImageView2.isHidden = false
        
        } else if inputIconImageView3.isHidden == true {
            inputIconImageView3.isHidden = false
            
            for num in 0...inputPassword.count-1 {
                
                if correctPassword[num] == inputPassword[num] {
                    
                    index -= 1
                    
                    if index == 0 {
                        enterButton.isHidden = false
                    }
                    
                }
            }
            
        } else {
            
           
                        //display wrong alert
                        print("wrong")
                        inputIconImageView4.isHidden = false
                        chimmyImageView.image = UIImage(named: "angryChimmy")
                        label.text = "You can't enter!"
                        index = 0
                        inputPassword = []
                        displayWrongMessage()
            
            
        }
    }
    
    @IBAction func enter(_ sender: UIButton) {
        
        inputIconImageView4.isHidden = false
    }
    
    
    func hideIcons(isBackButton: Bool){
        
       
            if inputPassword.count == 3 {
                
                if isBackButton == true {
                    inputIconImageView3.isHidden = true
                    
                } else {
                    inputIconImageView1.isHidden = true
                    inputIconImageView2.isHidden = true
                    inputIconImageView3.isHidden = true
                    
                }
                
            } else if inputPassword.count == 2 {
                
                if isBackButton == true {
                    
                    inputIconImageView2.isHidden = true
                    
                } else {
                    inputIconImageView1.isHidden = true
                    inputIconImageView2.isHidden = true
                }
                
            } else if inputPassword.count == 1 {
                
                inputIconImageView1.isHidden = true
                
            } else {
                inputIconImageView1.isHidden = true
                inputIconImageView2.isHidden = true
                inputIconImageView3.isHidden = true
                inputIconImageView4.isHidden = true
            }
            
       
        
        
    }
    
    func displayWrongMessage(){
        
        
        let controller = UIAlertController(title: "Wrong Passwords!", message: "", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Try again", style: .default, handler: {(action: UIAlertAction!)->Void in
            self.hideIcons(isBackButton: false)
            self.chimmyImageView.image = UIImage(named: "chimmy")
            self.label.text = "Enter the passwords"
        })
        
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
        
        
    }


}

