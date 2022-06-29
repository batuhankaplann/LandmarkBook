//
//  imageViewController.swift
//  LandmarkBook
//
//  Created by Batuhan Kaplan on 29.07.2022


import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        
        
        
        //Landmark Book Data
        
        landmarkNames.append("Cesme")
        landmarkNames.append("Efes")
        landmarkNames.append("Guzelyali")
        landmarkNames.append("SaatKulesi")
        landmarkNames.append("Urla")
        
        
        
        
        
        
        landmarkImages.append(UIImage(named: "Cesme.jpg")!)
        landmarkImages.append(UIImage(named: "Efes.jpg")!)
        landmarkImages.append(UIImage(named: "Guzelyali.jpg")!)
        landmarkImages.append(UIImage(named: "SaatKulesi.jpg")!)
        landmarkImages.append(UIImage(named: "Urla.jpg")!)
        
       navigationItem.title = "Landmark Book"
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmarkNames.remove(at: indexPath.row)
            
            
            landmarkImages.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            
            
            
        }
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    


}

