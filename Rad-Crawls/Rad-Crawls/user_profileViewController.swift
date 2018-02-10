//
//  user_profileViewController.swift
//  Rad-Crawls
//
//  Created by Thomas  Palzkill on 2/8/18.
//  Copyright © 2018 Thomas  Palzkill. All rights reserved.
//

import UIKit
import Alamofire

var userDataPassed: AnyObject?
var prof_info: AnyObject?
class user_profileViewController : UIViewController {
var userDataPassed: AnyObject?
  // if id equals 
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userDataPassed)
        // Do any additional setup after loading the view.
        Alamofire.request("https://peaceful-scrubland-57916.herokuapp.com/landing", method: .get).responseJSON
            {response in
                let result = response.result.value
                let jsonData = result as! NSDictionary
//                print(jsonData)
                prof_info = jsonData.value(forKey: "bars") as AnyObject
//                print(prof_info as AnyObject)
//                if (prof_info is NSArray) {
//                    print(prof_info as Any)
//                }
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hop_trigger" {
            
            if let destinationViewController = segue.destination as? hop_ViewController {
        destinationViewController.hop_info = prof_info
            }
        }
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
// ?.value(forKey: "id") line 21
