//
//  DetailViewController.swift
//  Earthquakes
//
//  Created by Koulutus on 21/11/2017.
//  Copyright © 2017 Koulutus. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    var movedvalue : String!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
   
    @IBOutlet weak var longitudeLabel: UILabel!
   
    @IBOutlet weak var latitudeLabel: UILabel!
   
    @IBOutlet weak var depthLabel: UILabel!
    
    @IBOutlet weak var magnitudeLabel: UILabel!
    
    
    let regionRadius: CLLocationDistance! = 1000
    
    var earthQuage : Earthquage!
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        if parent == nil{
            print("Back button was clicked")
        }
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
