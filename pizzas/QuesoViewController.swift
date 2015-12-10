//
//  QuesoViewController.swift
//  pizzas
//
//  Created by olver on 10/12/15.
//  Copyright (c) 2015 olver. All rights reserved.
//

import UIKit

class QuesoViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var seleccion:String = "";
    let quesos:[String] = ["mozarela","cheddar","parmesano","sin queso"];
    var tamañoPizza:String = "";
    var tipoMasa:String = "";
    @IBOutlet weak var txtTamaño: UILabel!
    
    @IBOutlet weak var txtMasa: UILabel!
    @IBOutlet weak var boton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        txtTamaño.text = tamañoPizza;
        txtMasa.text = tipoMasa;
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
        return quesos.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        return quesos[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        seleccion = self.quesos[row];
        print(seleccion);
        boton.enabled = true;
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVista = segue.destinationViewController as! IngredientesViewController;
        sigVista.tamañoPizza = self.tamañoPizza;
        sigVista.tipoMasa = self.tipoMasa;
        sigVista.tipoQueso = seleccion;
    }
    @IBAction func siguiente(sender: AnyObject) {
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
