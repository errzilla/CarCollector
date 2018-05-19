//
//  ViewController.swift
//  CarCollector
//
//  Created by Erza Carlsson on 5/19/18.
//  Copyright © 2018 Errzilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cars : [Car] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let car = cars[indexPath.row]
        
        cell.textLabel?.text = car.carName
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            cars = try context.fetch(Car.fetchRequest())
            print (cars)
        }catch{
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

