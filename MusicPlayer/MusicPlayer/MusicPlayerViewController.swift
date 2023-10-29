//
//  MusicPlayerViewController.swift
//  MusicPlayer
//
//  Created by maple on 29/10/23.
//

import UIKit

class MusicPlayerViewController: UIViewController {

    var viewModel: MusicPlayerViewModelInput

    init(viewModel: MusicPlayerViewModelInput) {
        self.viewModel = viewModel
        super.init(nibName: "MusicPlayerViewController", bundle: nil)
        self.viewModel.viewController = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension MusicPlayerViewController: MusicPlayerViewModelOutput {

}
