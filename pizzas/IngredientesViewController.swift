//
//  IngredientesViewController.swift
//  pizzas
//
//  Created by olver on 10/12/15.
//  Copyright (c) 2015 olver. All rights reserved.
//

import UIKit

class IngredientesViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    let ingredientes:[String] = ["Jamón","Pepperoni","Salchicha","Pavo","Aceituna","cebolla","Pimiento","Piña","Anchoa","Carne Picada"];
    var tamañoPizza:String = "";
    var tipoMasa:String = "";
    var tipoQueso:String = "";
    var seleccion:String = "";
    var elegidos:[String] = [];
    var cont:Int = 0;
    @IBOutlet weak var txtQueso: UILabel!
    
    @IBOutlet weak var txtContador: UILabel!
   
    @IBOutlet weak var borrar: UIButton!
    @IBOutlet weak var seleccionados: UITextView!
    @IBOutlet weak var txtMasa: UILabel!
    @IBOutlet weak var txtTamaño: UILabel!
    
    @IBOutlet weak var boton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        txtTamaño.text = tamañoPizza;
        txtMasa.text = tipoMasa;
        txtQueso.text = tipoQueso;
        //btnBorrar.enabled = false;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        boton.enabled = false;
        cont=0;
        borrar.enabled = false;
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
        return ingredientes.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        return ingredientes[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        seleccion = self.ingredientes[row];
        print(seleccion);
        boton.enabled = true;
        borrar.enabled = true;
        cont++;
        if (cont < 6) {
            elegidos.append(seleccion);
            seleccionados.text = seleccionados.text + "\(seleccion).\n";
            txtContador.text = "Has seleccionado \(cont) ingredientes";
        }else {
        
           txtContador.text = " tienes el maximo de ingredientes \n pulsa borrar para cancelar";
        }
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVista = segue.destinationViewController as! ConfirmViewController;
        sigVista.tamañoPizza = self.tamañoPizza;
        sigVista.tipoMasa = self.tipoMasa;
        sigVista.tipoQueso = seleccion;
        sigVista.ingredientes = elegidos;
    }
    
    
    @IBAction func borrar(sender: AnyObject) {
        borrar.enabled = false;
        elegidos = [];
        seleccionados.text = "";
        cont = 0;
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
