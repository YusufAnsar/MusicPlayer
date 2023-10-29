//
//  MusicListViewModel.swift
//  MusicPlayer
//
//  Created by maple on 29/10/23.
//

import UIKit

protocol MusicListViewModelInput: AnyObject {
    var viewController: MusicListViewModelOutput? { get set }
    func getMusicLists()
    func didSelectMusic(atIndex index: Int)
    var cellViewModels: [MusicListCellViewModel] { get }

}

protocol MusicListViewModelOutput: UIViewController {
    func showLoader()
    func hideLoader()
    func showAlert(title: String, message: String)
    func reloadMusicList()
}

class MusicListViewModel {
    private let musicService: MusicService
    weak var viewController: MusicListViewModelOutput?
    lazy var cellViewModels = [MusicListCellViewModel]()
    lazy var musicItems = [MusicItem]()

    init(musicService: MusicService) {
        self.musicService = musicService
    }

}

extension MusicListViewModel: MusicListViewModelInput {

    func getMusicLists() {
        Task(priority: .userInitiated) {
            viewController?.showLoader()
            let result = await musicService.getMusicLists()
            viewController?.hideLoader()
            switch result {
                case.success(let response):
                    parseResponse(response: response)
                    viewController?.reloadMusicList()
                case .failure(let error):
                    viewController?.showAlert(title: "Error", message: error.description)
            }
        }
    }

    func didSelectMusic(atIndex index: Int) {
        let musicitem = musicItems[index]
        let musicViewModel = MusicPlayerViewModel(musicItem: musicitem)
        let viewContoller = MusicPlayerViewController(viewModel: musicViewModel)
        self.viewController?.navigationController?.pushViewController(viewContoller, animated: true)
    }

    private func parseResponse(response: MusicResponse) {
        musicItems = response
        for item in response {
            let cellViewModel = MusicListCellViewModel(musicItem: item)
            cellViewModels.append(cellViewModel)
        }
    }
}
