//
//  ViewController.swift
//  Milestone_1_HackingWithSwift
//
//  Created by Igor Guryan on 29.10.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var flagsOFCountries = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("2x.png") {
                flagsOFCountries.append(item)
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flagsOFCountries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        let countryName = String(flagsOFCountries[indexPath.row].dropLast(7)).uppercased()
        cell.textLabel?.text = countryName
        let image: UIImage! = UIImage(named: flagsOFCountries[indexPath.row])
        cell.imageView!.image = image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Flag") as? FlagViewController {
            vc.selectedImage = flagsOFCountries[indexPath.row]
            vc.position = indexPath.row + 1
            vc.pictureCount = flagsOFCountries.count
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}
