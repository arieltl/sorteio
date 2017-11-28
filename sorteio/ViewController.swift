//
//  ViewController.swift
//  sorteio
//
//  Created by alessandra leventhal on 27/11/2017.
//  Copyright © 2017 ariel leventhal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    var nomes = [String] ()
    
    @IBOutlet weak var start: UIBarButtonItem!
    @IBOutlet weak var botao: UIButton!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var nameField: UITextField!
    @IBAction func adicionar(_ sender: Any) {
        if nameField.text != "" {
            for character in nameField.text! {
                if character != " " {
                    nomes.append(nameField.text!)
                    table.reloadData()
                    self.view.endEditing(true)
                    nameField.text = ""
                    
                    break
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.adicionar(botao)
        return true
    }
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nomes.count
    }
    
   internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "pessoa")
        cell.textLabel?.text = nomes[indexPath.row]
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    internal func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
         
                nomes.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? gameViewController {
            nextVC.nomes = self.nomes
            nextVC.previousVC = self
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.start.isEnabled = true
        
    }
    
    @IBOutlet weak var startTapped: UIBarButtonItem!
    

}

