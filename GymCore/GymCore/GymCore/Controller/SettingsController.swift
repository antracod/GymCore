//
//  SettingsController.swift
//  GymCore
//
//  Created by Teodor Radu on 08.05.2022.
//

import Foundation
import UIKit
import AVFoundation



class SettingsController: UIViewController {

    var player: AVAudioPlayer!
    
   
    
    @IBOutlet weak var img: UIImageView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func sharePressed(_ sender: Any) {
        

    let text = "Download GymCore Today. Available on the AppStore"
                
  
    let textToShare = [ text ]
    let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
    activityViewController.popoverPresentationController?.sourceView = self.view
                
                
    activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
                
                // present the view controller
     self.present(activityViewController, animated: true, completion: nil)
                
    }
    
    @IBAction func musicPressed(_ sender: UIButton) {
        playSound(soundName: "sound1")
        sender.alpha = sender.alpha/2
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                  
                   sender.alpha = 1.0
               }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    @IBAction func onClickPickImage(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        present(vc,animated: true)
    }
   
    
  
    
}

extension SettingsController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            img.image = image
        }
        picker.dismiss(animated: true,completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion:  nil)
    }
    
    
}

