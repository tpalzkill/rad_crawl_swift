//
//  hop_ViewController.swift
//  Rad-Crawls
//
//  Created by Thomas  Palzkill on 2/8/18.
//  Copyright © 2018 Thomas  Palzkill. All rights reserved.
//

import UIKit
var hop_info: AnyObject?
class hop_ViewController: UIViewController {
    @IBOutlet weak var butt: UIImageView!
    @IBOutlet weak var bar_name: UILabel!
    @IBOutlet weak var bar_address_label: UILabel!
    var hop_info: AnyObject?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bars = hop_info?.value(forKey: "businesses") as! NSArray
        let randomIndex = Int(arc4random_uniform(UInt32(6)))
        let choice = bars[randomIndex] as AnyObject
        
        print(choice)
        let url = choice["image_url"] as! String
        let bar_label = choice["name"] as! String
        let address = choice["location"] as AnyObject
        print(address)
        let addressString = address["display_address"] as! NSArray
        let bar_address = addressString.firstObject as! String
        print(bar_address)
        bar_address_label.text = bar_address
        
            self.bar_name.text = bar_label
        
        print(bar_label)
        let pictureURL = URL(string: url)!
        let session = URLSession(configuration: .default)
        let downloadPicTask = session.dataTask(with: pictureURL) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                        // Finally convert that Data into an image and do what you wish with it.
                        self.image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                        self.butt.image = self.image
                        }
//                        print(type(of: image))
//                        self.butt.image = image
                        // Do something with your image.
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        downloadPicTask.resume()
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
