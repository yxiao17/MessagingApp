//
//  ComposeViewController.swift
//  messagingapp
//
//  Created by Xuejie Guo on 8/30/20.
//  Copyright © 2020 GT. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ComposeViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    
    var ref: DatabaseReference?

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addPost(_ sender: Any) {
        // get auto id this way and will set the value to what text is
        ref?.child("Posts").childByAutoId().setValue(textView.text)
        showAddpostAlert()
    }
    
    
    @IBAction func cancelPost(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func showAddpostAlert(){
        let alert = UIAlertController(title: "Congrats!", message:"You have successfully added this post!" , preferredStyle: .alert)
        let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
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
