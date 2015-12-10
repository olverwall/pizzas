//
//  ConfirmViewController.swift
//  pizzas
//
//  Created by olver on 10/12/15.
//  Copyright (c) 2015 olver. All rights reserved.
//

import UIKit

class ConfirmViewController: UIViewController {
    
    
    @IBOutlet weak var txtIngredientes: UITextView!
    @IBOutlet weak var txtQueso: UILabel!
    @IBOutlet weak var txtMasa: UILabel!
    @IBOutlet weak var txtTamaño: UILabel!
    var tamañoPizza:String = "";
    var tipoMasa:String = "";
    var tipoQueso:String = "";
    var ingredientes:[String] = [];
    
    override func viewWillAppear(animated: Bool) {
        txtTamaño.text = tamañoPizza;
        txtMasa.text = tipoMasa;
        txtQueso.text = tipoQueso;
        for ingre in ingredientes{
            txtIngredientes.text = txtIngredientes.text + "\(ingre).\n";
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
