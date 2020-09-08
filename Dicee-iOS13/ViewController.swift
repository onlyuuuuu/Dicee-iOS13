//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageDice1: UIImageView!
    @IBOutlet weak var imageDice2: UIImageView!
    @IBOutlet weak var buttonRoll: UIButton!
    
    var pressCount = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("start viewDidLoad()...")
        
        buttonRoll.layer.cornerRadius = 20
        
        imageDice1.layer.cornerRadius = 15
        imageDice2.layer.cornerRadius = 15
        
        // set value by image literal
        imageDice1.image = #imageLiteral(resourceName: "DiceFive")
        imageDice2.image = #imageLiteral(resourceName: "DiceSix")
        
        // set value by code
//        imageDice1.image = UIImage(named: "DiceFive")
//        imageDice2.image = UIImage(named: "DiceSix")
        
        print("end viewDidLoad()...")
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let dice = ["DiceOne",
                    "DiceTwo",
                    "DiceThree",
                    "DiceFour",
                    "DiceFive",
                    "DiceSix"]
        pressCount = pressCount + 1
        print("Roll button pressed! Times: " + String(pressCount))
        imageDice1.image = UIImage(named: dice[Int.random(in: 0..<6)])
        imageDice2.image = UIImage(named: dice[Int.random(in: 0..<6)])
        if (pressCount == 10) {
            imageDice1.image = UIImage(named: dice[5])
            imageDice2.image = UIImage(named: dice[5])
        }
        if (pressCount > 10) {
            let alert = UIAlertController(title: "Nhấn 10 lần rồi đó", message: "Nhấn gì nhiều dữ dị thằng loz?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Đéo nhấn nữa", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Nhấn tiếp", style: .destructive, handler: nil))
            alert.addAction(UIAlertAction(title: "C Ú T", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}

