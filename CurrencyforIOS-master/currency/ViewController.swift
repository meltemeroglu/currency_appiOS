//
//  ViewController.swift
//  currency
//
//  Created by Çağatay Gül on 5.01.2019.
//  Copyright © 2019 Çağatay Gül. All rights reserved.
//

import UIKit
import UserNotifications
var curarray = [Double]()
let dollarhist = [1.147,1.139,1.140]
let poundhist = [0.891,0.892,0.885]
let tryhist = [6.295,6.203,6.117]

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    var myCurrency : [String] = []
    var myValues:[Double] = []
    var activecur:Double = 0
    
   
    @IBAction func histButton(_ sender: AnyObject) {
         performSegue(withIdentifier: "segue2", sender: self)
    }
    @IBAction func next(_ sender: AnyObject) {
         performSegue(withIdentifier: "segue", sender: self)
    }
    @IBOutlet weak var input: UITextField!
    
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var showcurrency: UILabel!
    @IBOutlet weak var usd: UILabel!
    @IBOutlet weak var pound: UILabel!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return myCurrency.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myCurrency[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activecur=myValues[row]
    }
    
    @IBAction func button(_ sender: AnyObject) {
        if (input.text != "")
        {
             output.text=String(Double(input.text!)! * activecur)
            
            
        }
       
    }
    
    @IBAction func showvalue(_ sender: Any) {
        self.showcurrency.text = String(Double(self.myValues[18]))
        self.usd.text = String(Double(self.myValues[125]))
        self.pound.text = String(Double(self.myValues[70]))
       
        curarray.append(Double(self.myValues[125]))
        curarray.append(Double(self.myValues[70]))
        curarray.append(Double(self.myValues[18]))
        curarray.append(Double(self.myValues[71]))
        curarray.append(Double(self.myValues[72]))
       
     
       
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let content = UNMutableNotificationContent()
        content.title = "FOREIGN CURRENCY TRACKING"
        content.subtitle = "Have you not checked latest currencies yet?"
        
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "TimerDone", content: content , trigger: trigger)
        UNUserNotificationCenter.current().add(request , withCompletionHandler: nil)
        UNUserNotificationCenter.current().requestAuthorization(options:[.alert, .sound, .badge]) { (didAllow, eroor) in
            
        }
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=3d815c1c4f28e9c429709c34aed0dd86")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil
            {
                print ("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)  as AnyObject
                        if let rates = myJson["rates"] as? NSDictionary
                        {
                           
                           for (key,value) in rates
                           
                           {
                            self.myCurrency.append((key as? String)!)
                            self.myValues.append((value as? Double)!)
                            
                            }
                        }
                    }
                    catch
                    {
                        
                    }
                }
                
            }
            self.picker.reloadAllComponents()
        }
        task.resume()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
}

