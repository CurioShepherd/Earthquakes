//
//  MapKitViewController.swift
//  Earthquakes
//
//  Created by Koulutus on 22/11/2017.
//  Copyright © 2017 Koulutus. All rights reserved.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController {
    
    var movedValue : Int!
    
    @IBOutlet weak var allMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
