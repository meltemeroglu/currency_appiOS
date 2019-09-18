//
//  SecondViewController.swift
//  currency
//
//  Created by Çağatay Gül on 14.01.2019.
//  Copyright © 2019 Çağatay Gül. All rights reserved.
//

import UIKit
import Charts
class SecondViewController: UIViewController {

    @IBOutlet weak var chartview: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        var linechartentry = [ChartDataEntry]()
        
        for i in 0..<curarray.count{
            let values = ChartDataEntry(x: Double(i), y: curarray[i])
            linechartentry.append(values)
        }
        let set1 = LineChartDataSet(values: linechartentry, label: "CURRENCY")
        set1.colors = [NSUIColor.red]
        let data = LineChartData()
        data.addDataSet(set1)
        chartview.data = data
       
    }
}
