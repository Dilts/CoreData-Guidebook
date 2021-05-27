//
//  AddNoteViewController.swift
//  GuidebookCoreData
//
//  Created by Brian Dilts on 5/27/21.
//

import UIKit
import CoreData

class AddNoteViewController: UIViewController {

    // MARK: - Variables and Properties

    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var textView: UITextView!
    
    var place:Place?
    
    // MARK: - ViewController Lifecycle

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // add styling to note
        cardView.layer.cornerRadius = 5
        cardView.layer.shadowColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowOffset = .zero
        cardView.layer.shadowRadius = 5
        
    }
    
    // MARK: - Methods

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
        // Create a new note and configure the properties
        let n = Note(context: context)
        n.date = Date()
        n.text = textView.text
        n.place = place
        
        // Save the context
        appDelegate.saveContext()
        
        // After save is tapped dimiss popup
        dismiss(animated: true, completion: nil)
        
    }
    
}
