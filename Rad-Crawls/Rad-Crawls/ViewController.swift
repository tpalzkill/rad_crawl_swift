//
//  ViewController.swift
//  Rad-Crawls
//
//  Created by Thomas  Palzkill on 2/8/18.
//  Copyright © 2018 Thomas  Palzkill. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
     let login_url = "https://peaceful-scrubland-57916.herokuapp.com/login"
    var user_info: AnyObject?
    @IBOutlet weak var email_entry: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var submitLogin: UIButton!
    @IBOutlet weak var registrationAnchor: UIButton!
    
    @IBAction func submitLogin(_ sender: Any) {
        let parameters: Parameters=[
            "username":self.email_entry.text!,
            "password":self.password.text!
        ]
        print(parameters)
        Alamofire.request(login_url, method: .post, parameters: parameters).responseJSON
            {response in
                print(response)
                let result = response.result.value
                let jsonData = result as! NSDictionary
                self.user_info = jsonData.value(forKey: "data") as AnyObject
                if((jsonData.value(forKey: "data")) != nil) {
                    self.performSegue(withIdentifier: "login_success", sender: self)
                }
        }
        
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login_success" {
    
            if let destinationViewController = segue.destination as? user_profileViewController {
                destinationViewController.userDataPassed = user_info
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

