//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Sonu Kumar on 01/11/24.
//  Copyright © 2024 Sonu Kumar. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var bmiResult: UILabel!
    @IBOutlet weak var feedbackMessage: UILabel!
    
    var bmiValue : String?
    var advice : String?
    var color : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bmiResult.text = bmiValue
        feedbackMessage.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func recalculateBmi(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
