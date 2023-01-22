//
//  CustomAlertViewController.swift
//  iTunesSearch
//
//  Created by Bengisu Karakılınç on 22.01.2023.
//

import UIKit

class CustomAlertViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.containerView.layer.masksToBounds = true
        self.containerView.layer.cornerRadius = 4
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
