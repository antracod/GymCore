//
//  WorkoutMenuController.swift
//  GymCore
//
//  Created by Teodor Radu on 07.05.2022.
//

import Foundation
import RealmSwift
import UIKit

class WorkoutMenuController	: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func deletePressed(_ sender: UIButton) {
        if (sender.titleLabel?.text == "Remove Workouts")
        {
            let realm = try! Realm()
            
            let allWorkouts = realm.objects(Item.self)
            
            try! realm.write {
                realm.delete(allWorkouts)
            }
            
        }
    }
    
    @IBAction func fivePressed(_ sender: UIButton) {
        if (sender.titleLabel?.text == "5 Minute Workout")
        {
            let realm = try! Realm()
            let workouts = realm.objects(Item.self)
            
            let firstWorkout = workouts.first!
            
            
            let alert = UIAlertController(title: "Your quick exercise", message: firstWorkout.title, preferredStyle: .alert)
            present(alert,animated: true,completion: {
                alert.view.superview?.isUserInteractionEnabled = true
                alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTapOutside)))
            })
            
        }
        
    }
    
    @IBAction func boostPressed(_ sender: UIButton) {
        
        
        if (sender.titleLabel?.text == "Boost")
        {
            let realm = try! Realm()
            let workouts = realm.objects(Item.self)
            
            
            if let workout = workouts.first {
                try! realm.write {
                    workout.title = (workouts.first?.title ?? "Cardio")! + " x2"
                    workout.checked = false
                }
            }
        }
    }
    
    @objc func dismissOnTapOutside(){
        self.dismiss(animated: true, completion: nil)
    }
    
}


