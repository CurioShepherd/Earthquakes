//
//  SearchViewController.swift
//  Earthquakes
//
//  Created by Koulutus on 21/11/2017.
//  Copyright © 2017 Koulutus. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    // get the current date and time
    var currentDateTime = Date()
    
    @IBOutlet weak var StartTime: UIDatePicker!
    
    @IBAction func startTimeChanged(_ sender: UIDatePicker) {
        if (StartTime.date > EndTime.date) {
            StartTime.date = currentDateTime
        }
    }
    @IBOutlet weak var EndTime: UIDatePicker!
    
    @IBAction func endTimeChanged(_ sender: UIDatePicker) {
        if (EndTime.date > currentDateTime ||  StartTime.date > EndTime.date) {
            EndTime.date = currentDateTime
        }
    }
    
    @IBOutlet weak var Magnitude: UISlider!
    
    @IBOutlet weak var currMagVal: UILabel!
    
    @IBAction func magnitudeChanged(_ sender: UISlider) {
        currMagVal.text = String( sender.value.rounded())
    }
    
    @IBAction func searchBtn(_ sender: UIButton) {
        
        let tableViewController = TableViewController()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        tableViewController.starttime = dateFormatter.string(from: StartTime.date)
        tableViewController.endtime = dateFormatter.string(from: EndTime.date)
        tableViewController.magnitude = Magnitude.value.rounded()

        present(tableViewController, animated: true, completion: nil)
        
        //MYController.starttime = StartTime.date
        //MYController.endtime = EndTime.date
        //MYController.magnitude = Magnitude.value.rounded()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //self.navigationController?.delegate = self
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .long
        currentDateTime = formatter.date(from: formatter.string(from: currentDateTime))!
        
        currMagVal.text = "0.0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
