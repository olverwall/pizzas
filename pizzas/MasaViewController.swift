//
//  MasaViewController.swift
//  pizzas
//
//  Created by olver on 9/12/15.
//  Copyright (c) 2015 olver. All rights reserved.
//

import UIKit

class MasaViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var listaMasa: UIPickerView!
    
    @IBOutlet weak var txtTamaño: UILabel!
    @IBOutlet weak var boton: UIButton!
    let masas: [String] = ["Delgada","Crujiente","Gruesa"];
    
    var seleccion:String = "";
    var tamañoPizza:String = "";
    
    override func viewWillAppear(animated: Bool) {
        txtTamaño.text = tamañoPizza;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boton.enabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return masas.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        return masas[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        seleccion = self.masas[row];
        print(seleccion);
        boton.enabled = true;
    }
    
    @IBAction func siguiente(sender: AnyObject) {
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVista = segue.destinationViewController as! QuesoViewController;
        sigVista.tamañoPizza = self.tamañoPizza;
        sigVista.tipoMasa = seleccion;
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
