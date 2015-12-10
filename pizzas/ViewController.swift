//
//  ViewController.swift
//  pizzas
//
//  Created by olver on 8/12/15.
//  Copyright (c) 2015 olver. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var boton: UIButton!
    @IBOutlet weak var lista: UIPickerView!
    var tamanios: [String] = ["pequeña","mediana","grande"]
    var seleccion:String = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        boton.enabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tamanios.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        return tamanios[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        seleccion = self.tamanios[row];
        print(seleccion);
        boton.enabled = true
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVista = segue.destinationViewController as! MasaViewController;
        sigVista.tamañoPizza = seleccion;
    }
    @IBAction func next(sender: AnyObject) {
        
    }

}

