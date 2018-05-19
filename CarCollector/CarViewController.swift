//
//  CarViewController.swift
//  CarCollector
//
//  Created by Erza Carlsson on 5/19/18.
//  Copyright © 2018 Errzilla. All rights reserved.
//

import UIKit

class CarViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var imagePicker = UIImagePickerController()
    
   
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var carImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
    
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addCarTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let  car = Car(context: context)
        
        car.carName = titleTextField.text
        car.carImage = UIImageJPEGRepresentation(carImageView.image!, 1.0)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        carImage.image = image
        imagePicker.dismiss(animated: true, completion: nil)
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
