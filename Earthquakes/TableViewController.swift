//
//  TableViewController.swift
//  Earthquakes
//
//  Created by Koulutus on 21/11/2017.
//  Copyright © 2017 Koulutus. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var MyArray : [[String]] = [];
    
    //var newDict : NSMutableDictionary = NSMutableDictionary()
    
    static let earthQuege : Earthquake = Earthquake()
    
    var starttime : String? = ""
    var endtime : String? = ""
    var magnitude: Float? = 0.0
    
    
    func getAllEarthQuakes(startTime: String, endTime: String) {
        //let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "yyyy-MM-dd"
        
        //Earthquage.allEarthQuakes(startTime: dateFormatter.string(from: startTime),
        //                          endTime: dateFormatter.string(from: endTime)) { (earthQuage, error) in
        Earthquake.allEarthQuakes(StartTime: startTime,
                                  EndTime: endTime, completionHandler: { (earthQuage, error) in
            if let error = error {
                // got an error in getting the data
                print(error)
                return
            }
                        
            guard let earthQuakes = earthQuage else {
                print("error getting all EarthQuakes: result is nil")
                return
            }
            // success :)
            debugPrint(earthQuakes)
            //print(earthQuakes.count)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //let bundle = Bundle(for: TableViewCell.self)
        //let nib = UINib(nibName: "\(TableViewCell.self)", bundle: bundle)
        
        MyArray = [["Anna","11"], ["Sanna","8"], ["Sari","9"], ["Katja","4"],["Liisa","5"],["Marja","9"]]
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (starttime != "" && endtime != "") {
            //tableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCellID")
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCellID")
            
            getAllEarthQuakes(startTime: starttime!, endTime: endtime!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MyArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCellid", for: indexPath) as! TableViewCell
        
        // Configure the cell...
        cell.nameEarthQuake?.text = MyArray[indexPath.row][0];
        cell.magnitudeEarthQuake?.text = MyArray[indexPath.row][1];

        //scell.textLabel?.text = "Dummy Text"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48.0;
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
        
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
        if segue.identifier == "MapKitSequeID" {
            //let target = segue.destination as! MapKitViewController
            
            let viewController:MapKitViewController = segue.destination as! MapKitViewController
            
            viewController.movedValue = 1
            
        } else {
            let target = segue.destination as! DetailViewController
            
            //let result = self.tableView.indexPathForSelectedRow?.row;
            
            ////target.earthQuage = self.EarthQuakesTbl[result!];
            target.movedvalue = "1"//MyArray[result!][0];
        }
    }
    

}
