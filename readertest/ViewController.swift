//
//  ViewController.swift
//  readertest
//
//  Created by apple on 2021/11/2.
//

import UIKit
import ReaderKitWrapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let pageView = LSYReadPageViewController.init()
        let fileURL = Bundle.main.url(forResource: "The Silver Chair", withExtension: "epub")
        pageView.resourceURL = fileURL
        DispatchQueue.global().async {
            pageView.model = LSYReadModel.getLocalModel(with: fileURL) as? LSYReadModel
            DispatchQueue.main.async {
                self.present(pageView, animated: true, completion: nil)
            }
            if let temp = pageView.model {
                print(temp.chapters.count)
            }
        }

    }


}

