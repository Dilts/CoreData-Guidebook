//
//  PlaceViewController.swift
//  GuidebookCoreData
//
//  Created by Brian Dilts on 5/26/21.
//

import UIKit

class PlaceViewController: UIViewController {

    // MARK: - Variables and Properties
    
    lazy var infoViewController:InfoViewController = {
        
        let infoVC = self.storyboard?.instantiateViewController(identifier: Constants.INFO_VIEWCONTROLLER) as! InfoViewController
        
        return infoVC
        
    }()
    
    lazy var mapViewController:MapViewController = {
       
        let mapVC = self.storyboard?.instantiateViewController(identifier: Constants.MAP_VIEWCONTROLLER) as! MapViewController
        
        return mapVC
        
    }()
    
    lazy var notesViewController:NotesViewController = {
       
        let notesVC = self.storyboard?.instantiateViewController(identifier: Constants.NOTES_VIEWCONTROLLER) as! NotesViewController
        
        return notesVC
        
    }()
    
    var place:Place?
    
    
    
    // MARK: - ViewController lifecycle
    
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Set the image
        if place?.imageName != nil {
            placeImageView.image = UIImage(named: place!.imageName!)
        }
        
        // Set the name
        placeNameLabel.text = place!.name
        
        switchChildViewControllers(infoViewController)
        
    }

    
    // MARK: - Methods

    private func switchChildViewControllers(_ childVC:UIViewController) {
        
        // Add it as a child view controller of this one
        addChild(childVC)
        
        // Add its view as a subview of the container view
        containerView.addSubview(childVC.view)
        
        // Set its frame and sizing
        childVC.view.frame = containerView.bounds
        childVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Indicate that it's moved
        childVC.didMove(toParent: self)
        
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            switchChildViewControllers(infoViewController)
        case 1:
            switchChildViewControllers(mapViewController)
        case 2:
            switchChildViewControllers(notesViewController)
        default:
            switchChildViewControllers(infoViewController)
        }
        
    }
    
}
