//
//  MusicListsViewController.swift
//  MusicPlayer
//
//  Created by maple on 29/10/23.
//

import UIKit

class MusicListsViewController: UIViewController {

    @IBOutlet weak var musicListTableView: UITableView!
    
    var viewModel: MusicListViewModelInput

    init(viewModel: MusicListViewModelInput) {
        self.viewModel = viewModel
        super.init(nibName: "MusicListsViewController", bundle: nil)
        self.viewModel.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicListTableView.register(UINib(nibName: "MusicTableViewCell", bundle: nil), forCellReuseIdentifier: "MusicTableViewCell")
        musicListTableView.dataSource = self
        musicListTableView.delegate = self
        viewModel.getMusicLists()
    }
}

extension MusicListsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MusicTableViewCell", for: indexPath) as? MusicTableViewCell else {
            return UITableViewCell()
        }
        let cellViewModel = viewModel.cellViewModels[indexPath.row]
        cell.configure(withCellViewModel: cellViewModel)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectMusic(atIndex: indexPath.row)
    }

}

extension MusicListsViewController: MusicListViewModelOutput {

    func showLoader() {

    }
    
    func hideLoader() {

    }
    
    func showAlert(title: String, message: String) {

    }
    
    func reloadMusicList() {
        DispatchQueue.main.async {
            self.musicListTableView.reloadData()
        }
    }
    

}
