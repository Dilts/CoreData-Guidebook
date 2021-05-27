//
//  NotesViewController.swift
//  GuidebookCoreData
//
//  Created by Brian Dilts on 5/26/21.
//

import UIKit

class NotesViewController: UIViewController {

    // MARK: - Variables and Properties
    
    
    @IBOutlet weak var tableView: UITableView!
    var place:Place?
    
    // MARK: - ViewController Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addNoteTapped(_ sender: Any) {
        
        // Display the popup
        let addNoteVC = storyboard?.instantiateViewController(identifier: Constants.ADDNOTES_VIEWCONTROLLER) as! AddNoteViewController
        
        // Pass the place object through
        addNoteVC.place = place
        
        // Configure the popup mode
        addNoteVC.modalPresentationStyle = .overCurrentContext
        
        // Present it
        present(addNoteVC, animated: true, completion: nil)
        
        
    }
    

}
