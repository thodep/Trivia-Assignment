//
//  ViewController.swift
//  Week4-Assignment
//
//  Created by tho dang on 2015-09-03.
//  Copyright (c) 2015 Tho Dang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var trivia1 = Trivia(name:"CN Tower",country:"Toronto",trivia:"Large Building",images:"1.jpg")
    var trivia2 = Trivia(name: "Casa Loma", country: "Toronto", trivia: "Big Castle",images:"2.jpg")
    var trivia3 = Trivia(name: "Royal Ontario Museum", country: "Toronto", trivia: "Big Museum",images:"4.jpg")
    var trivia4 = Trivia(name: "AGO", country: "Toronto", trivia: "Big Art Gallery",images:"3.jpg")
    var trivia5 = Trivia(name: "Toronto Zoo", country: "Toronto", trivia: "Big Zoo",images:"5.jpg")
    var trivia6 = Trivia(name: "Toronto Island", country: "Toronto", trivia: "A chain of small islands in the city of Toronto",images:"7.jpg")
    var trivia7 = Trivia(name: "Hocky Hall of Fame", country: "Toronto", trivia: "Home to hockey's greatest players",images:"6.jpg")
    var trivia8 = Trivia(name: "Distillery District", country: "Toronto", trivia: "National Historic Site",images:"8.jpg")
    var trivia9 = Trivia(name: "Rogers Centre", country: "Toronto", trivia: "The city's indoor/outdoor sports centre",images:"9.jpg")
    var trivia10 = Trivia(name: "Canada's Wonderland", country: "Vaughan", trivia:"Canada's premier amusement park" ,images:"10.jpg")
    
    var trivias = [Trivia]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        trivias.append(trivia1)
        trivias.append(trivia2)
        trivias.append(trivia3)
        trivias.append(trivia4)
        trivias.append(trivia5)
        trivias.append(trivia6)
        trivias.append(trivia7)
        trivias.append(trivia8)
        trivias.append(trivia9)
        trivias.append(trivia10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return trivias.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        
        // Configure the cell...
       
        cell.cityLabel.text = trivias[indexPath.row].country
        cell.detailLabels.text = trivias[indexPath.row].trivia
        cell.nameLabel.text = trivias[indexPath.row].name
        
        let picCollection = UIImage(named: trivias[indexPath.row].images)
        cell.landmarkPics.image = picCollection

        return cell
    }
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        // Define the initial state (before the animations process)
        cell.alpha = 0
        // Define the final state (After the animation)
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            cell.alpha = 1
        })
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "map" {
           let indexPath = self.tableView.indexPathForSelectedRow()
            let controller = segue.destinationViewController as? MapViewController
            if let myIndexValue = indexPath {
                controller?.myInt = myIndexValue.row
            }
            
        }
    }
    
    
}

