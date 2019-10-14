//
//  SegundoViewController.swift
//  Test_UPAX
//
//  Created by Eduardo Navarrete Carmona on 13/10/19.
//  Copyright © 2019 Eduardo Navarrete Carmona. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class SegundoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    
    struct imageToDisplay {
        var downladedImage: UIImage?
    }

    var lastIndex: NSIndexPath?
    var arrayPassed = [String] ()
    var imageTaken: UIImage?
    
    let arraySexo: Array = ["Masculino", "Femenino"]
    let arrayColores = ["Azul", "Rojo", "Verde", "Rosa", "Amarillo"]
    let pickerDate = UIDatePicker()
    var fechaString: String? = nil
        
    @IBOutlet weak var tabla: UITableView!
    
        // MARK: - TableView Methods
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            arrayPassed.count
            }
        
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            let item = arrayPassed[section]
            
            switch item {
                
                case "Cámara":
                    return 1
                    
                case "Foto":
                    return 1
                    
                case "Nombre Completo":
                    return 1
                    
                case "Número telefónico":
                    return 1
                    
                case "Fecha de Nacimiento":
                    return 1
                
                case "Sexo":
                    return 2
                    
                case "Color Favorito":
                    return 5
                    
                default:
                        return 3
                }
            }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            arrayPassed[section]
        }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
                let item = arrayPassed[indexPath.section]
                
                switch item {
                case "Cámara":
                    let cell = tabla.dequeueReusableCell(withIdentifier: "camara") as! CamaraCell
                    cell.selectionStyle = UITableViewCell.SelectionStyle.none
                    
                    if imageTaken == nil {
                        print("Imagen Vacia")
                    } else {
                        cell.imgCamara.image = imageTaken
                    }
                        return cell
                    
                case "Foto":
                    let cell = tableView.dequeueReusableCell(withIdentifier: "fotoCell") as! FotoCell
                    cell.selectionStyle = UITableViewCell.SelectionStyle.none
                    
                    
                    let url = URL(string: "https://http2.mlstatic.com/vegeta-tamano-real-para-armar-en-papercraft-D_NQ_NP_892880-MLA26232224460_102017-F.jpg")

                    DispatchQueue.global().async {
                        let data = try? Data(contentsOf: url!)
                        DispatchQueue.main.async {
                            cell.downloadedImg.image = UIImage(data: data!)
                        }
                    }
                    return cell
                    
                    
                case "Nombre Completo":
                    let cell = tableView.dequeueReusableCell(withIdentifier: "nombreCell") as! NombreCell
                    cell.selectionStyle = UITableViewCell.SelectionStyle.none
                    //cell.nombreTxtFld.delegate = self()
                    //cell.nombreTxtFld.delegate = self as? UITextFieldDelegate
                    
                    return cell
                    
                case "Número telefónico":
                    let cell = tableView.dequeueReusableCell(withIdentifier: "telefonoCell") as! TelefonoCell
                    cell.selectionStyle = UITableViewCell.SelectionStyle.none
                    //cell.labelFoto.text = "Prueba"
                    return cell
                    
                case "Fecha de Nacimiento":
                    let cell = tableView.dequeueReusableCell(withIdentifier: "fechaCell") as! FechaCell
                    cell.selectionStyle = UITableViewCell.SelectionStyle.none
                    cell.fechaTextField.delegate = self
                    cell.fechaTextField.inputView = pickerDate
                    pickerDate.datePickerMode = .date
                    pickerDate.addTarget(self, action: #selector(updateDateField(sender:)), for: .valueChanged)
                    cell.fechaTextField.text = formatDateForDisplay(date: pickerDate.date)
                    
                    return cell
                    
                case "Sexo":
                    let cell = tableView.dequeueReusableCell(withIdentifier: "sexoCell") as! SexoCell
                    cell.selectionStyle = UITableViewCell.SelectionStyle.none
                    cell.sexoLbl.text = arraySexo[indexPath.row]
                    return cell
                    
                case "Color Favorito":
                    let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell") as! ColorCell
                    cell.selectionStyle = UITableViewCell.SelectionStyle.none
                    cell.colorLbl.text = arrayColores[indexPath.row]
                    if indexPath.row == 0 {
                        cell.backgroundColor = UIColor .blue
                    } else if indexPath.row == 1 {
                        cell.backgroundColor = UIColor .red
                    } else if indexPath.row == 2 {
                    cell.backgroundColor = UIColor .green
                    } else if indexPath.row == 3 {
                    cell.backgroundColor = UIColor .systemPink
                    } else if indexPath.row == 4 {
                    cell.backgroundColor = UIColor .yellow
                    }
                        return cell
                    
                default:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "camara") as! CamaraCell
                    cell.selectionStyle = UITableViewCell.SelectionStyle.none
                        return cell
                }
        }
            
            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
               let item = arrayPassed[indexPath.section]
               
               switch item {
                   
                   case "Cámara":
                    self.lastIndex = indexPath as NSIndexPath
                    let vc = UIImagePickerController()
                    vc.sourceType = .camera
                    vc.allowsEditing = true
                    vc.delegate = self
                    present(vc, animated: true)
                       return
                       
                   case "Nombre Completo":
                       return
                       
                   case "Número telefónico":
                       return
                       
                   case "Fecha de Nacimiento":
                       return
                   
                   case "Sexo":
                    tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
                       return
                       
                   case "Color Favorito":
                    tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
                       return
                       
                   default:
                           return
                   }
                        
            }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let item = arrayPassed[indexPath.section]
        
        switch item {
            case "Sexo":
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
            default:
            return
        }
    }
            
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                
                let item = arrayPassed[indexPath.section]
                
                switch item {
                    
                    case "Cámara":
                        return 160
                        
                    case "Foto":
                        return 160
                        
                    case "Nombre Completo":
                        return 80
                        
                    case "Número telefónico":
                        return 80
                        
                    case "Fecha de Nacimiento":
                        return 80
                    
                    case "Sexo":
                        return 60
                        
                    case "Color Favorito":
                        return 60
                        
                    default:
                            return 100
                    }
               
            }
            
            
            func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
                false
            }
    
    //MARK: - Functions
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

        
        guard let image = info[.editedImage] as? UIImage else {
                print("No image found")
                return
            }
        
        imageTaken = image
            print(image.size)
        tabla.reloadData()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let cell = tabla.dequeueReusableCell(withIdentifier: "nombreCell") as! NombreCell
        let maxLength = 5
        let currentString: NSString = cell.nombreTxtFld.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    @objc func updateDateField(sender: UIDatePicker) {
        //let cell = tabla.dequeueReusableCell(withIdentifier: "fechaCell") as! FechaCell
        fechaString = formatDateForDisplay(date: sender.date)
    }
    
    fileprivate func formatDateForDisplay(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: date)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

        override func viewDidLoad() {
            super.viewDidLoad()
            
            let cell = tabla.dequeueReusableCell(withIdentifier: "nombreCell") as! NombreCell
            cell.nombreTxtFld.delegate = self
            cell.nombreTxtFld.smartInsertDeleteType = UITextSmartInsertDeleteType.no
            
            tabla.tableFooterView = UIView()
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
