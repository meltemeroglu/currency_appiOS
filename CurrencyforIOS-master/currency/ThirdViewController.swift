//
//  ThirdViewController.swift
//  currency
//
//  Created by Çağatay Gül on 16.01.2019.
//  Copyright © 2019 Çağatay Gül. All rights reserved.
//

import UIKit
let alpha = 0.3
class ThirdViewController: UIViewController {

    @IBOutlet weak var poundest: UILabel!
    @IBOutlet weak var dollarest: UILabel!
    @IBOutlet weak var tryest: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var trylabel: UILabel!
    
    @IBOutlet weak var dollarlabel: UILabel!
    
    @IBOutlet weak var poundlabbel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        trylabel.text = "\(tryhist)"
        dollarlabel.text = "\(dollarhist)"
        poundlabbel.text = "\(poundhist)"
        
        let lastAvgTry = (tryhist[0] + tryhist[1])/2
        let faultTry = tryhist[2] - lastAvgTry
        let resultTry = lastAvgTry + alpha * faultTry
        tryest.text = String(resultTry)
       
        let lastAvgUsd = (dollarhist[0] + dollarhist[1])/2
        let faultUsd = dollarhist[2] - lastAvgUsd
        let resultUsd = lastAvgUsd + alpha * faultUsd
        dollarest.text = String(resultUsd)
      
        let lastAvgGbp = (poundhist[0] + poundhist[1])/2
        let faultGbp = poundhist[2] - lastAvgGbp
        let resultGbp = lastAvgGbp + alpha * faultGbp
        poundest.text = String(resultGbp)
        
    }
    
}
