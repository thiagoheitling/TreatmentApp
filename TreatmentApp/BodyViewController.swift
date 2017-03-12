//
//  SecondViewController.swift
//  TreatmentApp
//
//  Created by Thiago Heitling on 2017-03-10.
//  Copyright © 2017 Thiago Heitling. All rights reserved.
//

import UIKit

class BodyViewController: UIViewController {
    
    // All joints (buttons) are referenced by a tag number in storyboard.
    // They are sequenced in pairs(right side < left side) from bottom part of the body to the upper part.
    // So tag 1 = right foot , tag 2 = left foot, and so on.
    
    let jointTags = 19
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "BODY JOINTS"
        
        hideButtons()
    }
    
    func hideButtons() {
        
        for tag in 0...jointTags {
        
            let joint = self.view.viewWithTag(tag) as? UIButton
            joint?.setBackgroundImage(nil, for: .normal)
        }
    }

    @IBAction func jointPressed(_ sender: UIButton) {
        
        toggleJointImages(with: sender)
    }
    
    func toggleJointImages(with joint: UIButton) {
        
        if joint.currentBackgroundImage == nil {
            joint.setBackgroundImage(UIImage(named:"JointButton"), for: .normal)
        }
        else {
            joint.setBackgroundImage(nil, for: .normal)
        }
        
        for tag in 0...jointTags {
            
            if tag != joint.tag {
                
                let untouchedJoint = self.view.viewWithTag(tag) as? UIButton
                untouchedJoint?.setBackgroundImage(nil, for: .normal)
            }
        }
    }
    
}

