//
//  ViewController.swift
//  JSON fun
//
//  Created by Admin on 11.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var massagesTableView: UITableView!
    var fetchedTextMessage = [TextMessage]()
    var fetchedImageMessage = [ImageMessage]()
    var fetchedSocialMessage = [SocialMessage]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        massagesTableView.dataSource = self
        
        parseData()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
}
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fetchedTextMessage.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = massagesTableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = fetchedTextMessage[indexPath.row].date
        cell?.detailTextLabel?.text = fetchedTextMessage[indexPath.row].title
        
        return cell!
    }
    

    func parseData() {
        
        //Array for all future messages
        fetchedTextMessage = []
        
        let url = "https://api.myjson.com/bins/1gmkql"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print ("ERROR")
            }
            else
            {
                    do
                    {
                        //Array with parsing data
                        let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                        
                        
                        for eachFetchedTextMessage in fetchedData {
                            
                            let eachTextMessage = eachFetchedTextMessage as! [String : Any]
                            
                            let type = eachTextMessage["type"] as! String
                            let date = eachTextMessage["date"] as! String
                            let title = eachTextMessage["title"] as! String
                            
                            if type == "text" {
                                let content = eachTextMessage["content"] as! String
                                self.fetchedTextMessage.append(TextMessage(type: type, date: date, title: title, content: content))
                            }
                        
                            else if type == "image" {
                           
                            }
                            else if type == "social" {
                                
                            }
                            
                        }
                        
                        self.massagesTableView.reloadData()
                        
                    }
                    catch
                    {
                        print("ERROR 2")
                    }
                }
            }
        
        task.resume()
        
}
}

class Message {
    var type : String
    var date : String
    var title : String
    var content : String
    
    init(type: String, date: String, title: String, content: String) {
        self.type = type
        self.date = date
        self.title = title
        self.content = content    }
}

class TextMessage: Message {
    
    
    }


class ImageMessage: Message {
    

    }


class SocialMessage: Message {
    
}

class MessageFactory {
    func getMessage(type: String) -> Message? {
        if type == "text" {
            
            /*let type = eachTextMessage["type"] as! String
            let date = eachTextMessage["date"] as! String
            let title = eachTextMessage["title"] as! String
            self.fetchedTextMessage.append(TextMessage(type: type, date: date, title: title, content: content))*/
        }
            
        else if type == "image" {
            
        }
            
        else if type == "social" {
            
        }
        return nil
    }
}
