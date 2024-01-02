//
//  DetailViewController.swift
//  VariousFalgsInTableView
//
//  Created by Venkata K on 1/1/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        guard let imagename = selectedImage else {
            return
        }
        
        title = "\(imagename.uppercased())"
        navigationItem.largeTitleDisplayMode = .never

        // Do any additional setup after loading the view.
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
            imageView.layer.borderWidth = 1.0 // Set the border width
            imageView.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("no image found")
            return
        }
        guard let imagename = selectedImage else {
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, imagename], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
