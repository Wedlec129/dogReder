//
//  ViewControllerAbout.swift
//  godReder
//
//  Created by Борух Соколов on 21.04.2023.
//

import UIKit

class ViewControllerAbout: UIViewController {

    
    @IBOutlet weak var imageShw: UIImageView!
    
    var image:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageShw.image=image
    }
    
    @IBAction func shareButton(_ sender: Any) {
        
        let shareController=UIActivityViewController(activityItems: [image!] ,applicationActivities: nil)
        
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool{
                print("успешно")
            }
        }
        present(shareController, animated: true,completion: nil)
        
        
    }
    

}
