//
//  ViewController.swift
//  MouseClickerApp
//
//  Created by Prasanna challa on 10/19/19.
//  Copyright © 2019 Prasanna challa. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    static let HEADER_TEXT = "RIGHT CLICK on the location where you want to perform repeated mouse clicks."
    
    @IBOutlet weak var header: NSTextField!
    @IBOutlet weak var xPositionLabel: NSTextField!
    @IBOutlet weak var yPoxitionLabel: NSTextField!
    
    private var mouseClickLocation: NSPoint! {
        didSet {
            DispatchQueue.main.async {
                self.xPositionLabel.stringValue = self.mouseClickLocation.x.description
                self.yPoxitionLabel.stringValue = self.mouseClickLocation.y.description
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViews()
    }
    
    @IBAction func startClicking(_ sender: Any) {
        guard let loc = mouseClickLocation else {
            header.stringValue = ""
            header.stringValue = ViewController.HEADER_TEXT
            return
        }
        RepeatingClicker(location: loc).startClicking()
    }
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    private func prepareViews() {
        header.stringValue = ViewController.HEADER_TEXT
        MouseLocationProvider.nextMouseClickLocation { [weak self](location) in
            self?.mouseClickLocation = location
        }
    }
}

