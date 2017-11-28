//
//  gameViewController.swift
//  sorteio
//
//  Created by alessandra leventhal on 27/11/2017.
//  Copyright © 2017 ariel leventhal. All rights reserved.
//

import UIKit

class gameViewController: UIViewController {
    var nomes = [String] ()
    var inst = ["Pergunta Para:","Desafia:"]
    var previousVC : ViewController?
    
    @IBOutlet weak var pessoa1: UILabel!
    @IBOutlet weak var instrucao: UILabel!
    @IBOutlet weak var pessoa2: UILabel!
  
    
    @IBAction func sortear(_ sender: Any) {
        let draw1 = Int(arc4random_uniform(UInt32(nomes.count)))
        let person1 = nomes[draw1]
        nomes.remove(at: draw1)
        let draw2 = Int(arc4random_uniform(UInt32(nomes.count)))
        let person2 = nomes[draw2]
        nomes.insert(person1, at: draw1)
        pessoa1.text = person1
        pessoa2.text = person2
        instrucao.text = inst[Int(arc4random_uniform(2))]
    }
    
    
    @IBAction func addGnt(_ sender: Any) {
        previousVC?.nomes = self.nomes
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pessoa1.text = ""
        pessoa2.text = ""
        instrucao.text = ""
        // Do any additional setup after loading the view.
    }

 
}
