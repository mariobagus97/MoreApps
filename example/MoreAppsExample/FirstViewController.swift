//
//  FirstViewController.swift
//  MoreAppsExample
//
//  Created by Muhammad Ario Bagus on 01/03/21.
//

import UIKit
import MNCAppsSDK

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))

        // Do any additional setup after loading the view.
    }
    @objc func addTapped(){
        
    }
    
    @IBAction func btnShowMoreApps(_ sender: Any) {
        
//
//        let view = MNCAppsBody(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
//        let vc = UIViewController()
//        vc.view = view
        let requestItem = MNCAppsRequest()
        requestItem.setUserID("irKmyJJGGlNjMt7Kpg3xYlRT6dn1")
        requestItem.setLanguage("en")
        requestItem.setBundleid("an.android.app")
        requestItem.setTimeToFetch(0)
        let vc = MNCAppsScreen(requestItem: requestItem)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
