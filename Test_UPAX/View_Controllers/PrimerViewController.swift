//
//  PrimerViewController.swift
//  Test_UPAX
//
//  Created by Eduardo Navarrete Carmona on 10/10/19.
//  Copyright © 2019 Eduardo Navarrete Carmona. All rights reserved.
//

import UIKit

class PrimerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let arrayTitulos: Array = ["Cámara", "Foto", "Nombre Completo", "Número telefónico", "Fecha de Nacimiento", "Sexo", "Color Favorito"]
    
    var arrayPass: NSMutableArray = []
    
    
    
    
    // MARK: - Protocolos de TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTitulos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! primerTableViewCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        //Se llena la tabla con el arreglo "arrayTitulos"
        switch indexPath.row {
        case 0:
            cell.tituloLbl.text = arrayTitulos[indexPath.row]
        case 1:
            cell.tituloLbl.text = arrayTitulos[indexPath.row]
        case 2:
            cell.tituloLbl.text = arrayTitulos[indexPath.row]

        case 3:
            cell.tituloLbl.text = arrayTitulos[indexPath.row]
        case 4:
            cell.tituloLbl.text = arrayTitulos[indexPath.row]
        case 5:
            cell.tituloLbl.text = arrayTitulos[indexPath.row]
        case 6:
        cell.tituloLbl.text = arrayTitulos[indexPath.row]
            
        default:
            cell.tituloLbl.text = ""
        }
        
        return cell
}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) as? primerTableViewCell {
    
        //Se cambia la imagen del bullet dependiendo si se selecciona una celda, de igual manera se agregan o se quitan elementos del array que pasará al siguiente ViewController
        if (cell.bulletImg.image == UIImage (named: "RED_CIRCLE_BULLLET")) {
            
            cell.bulletImg.image = UIImage (named: "EMPTY_BULLET")
            
            arrayPass .remove(arrayTitulos[indexPath.row])
            print(arrayPass)

        } else {
            let image = UIImage(named: "RED_CIRCLE_BULLLET")
            cell.bulletImg.image = image
            arrayPass .add(arrayTitulos[indexPath.row])
            print(arrayPass)
            }
        }
        
        tableView .reloadData()
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
// MARK: - Actions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
