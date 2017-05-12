//
//  ViewController.swift
//  JSON fun
//
//  Created by Admin on 11.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.myjson.com/bins/1gmkql")
        
        
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
                        //Array
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        print(myJson)
                        
                    }
                    catch
                    {
                        
                    }
                }
            }
            
        }
        task.resume()
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class TextMessage {
    
    var date : String
    var title : String
    var conten : String
    
    init(date : String, title : String, content : String) {
        self.date = date
        self.title = title
        self.conten = content
    }
}

class ImageMessage {
    
    var date : String
    var title : String
    var source : String
    
    init(date : String, title : String, source : String) {
        self.date = date
        self.title = title
        self.source = source

    }
}

class SocialMessage {
    
    var date : String
    var network : String
    var title : String
    var source : String

    init(date : String, network : String, title : String, source : String) {
        self.date = date
        self.network = network
        self.title = title
        self.source = source
}
}

