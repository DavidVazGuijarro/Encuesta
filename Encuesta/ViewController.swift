//
//  ViewController.swift
//  Encuesta
//
//  Created by Gilberto Campos Naumov on 23/03/15.
//  Copyright (c) 2015 GilTIC. All rights reserved.
//

import UIKit
import Alamofire
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var numeroHabitacion: UITextField!
    @IBOutlet var irEncuestaButton: UIButton!
    

    @IBAction func irEncuesta(sender: AnyObject) {
        if(numeroHabitacion.text == ""){
            var alert = UIAlertController(title: "¡Error!", message:
                "Por favor, ingresa el número de cuarto", preferredStyle: UIAlertControllerStyle.Alert)
            
            self.presentViewController(alert, animated: false, completion: nil)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,
                handler: nil))
        }else {
            Alamofire.request(.GET, "http://private-00b6b-hugo4.apiary-mock.com/encuesta/1").responseJSON{ (request,response,JSON,error) in println(JSON)
            
                
            }
                
        }
        
        
    
    }
    
    @IBAction func didStartEditing(sender: UITextField) {
        //numeroHabitacion.placeholder = nil
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.numeroHabitacion.resignFirstResponder()
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "http://private-ebef6-survey3.apiary-mock.com/surveys").responseJSON{ (request,response,JSON,error) in println(JSON)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

