//
//  MoviesTabBarViewController.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 28/08/2024.
//

import UIKit

class MoviesTabBarViewController: UITabBarController {
    private let apiClient = APIClient()
    private lazy var moviesRepo = MoviesDataRepositoriy(apiClient: apiClient)
    private lazy var fetchMoviesUseCase = FetchMoviesUseCase(movieRepository: moviesRepo)
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewControllers()
        // Do any additional setup after loading the view.
    }
    
    private func setUpViewControllers() {
        let nowPlayingViewModel = MoviesViewModel(fetchMoviesUseCase: fetchMoviesUseCase, category: .nowPlaying)
        let popularViewModel = MoviesViewModel(fetchMoviesUseCase: fetchMoviesUseCase, category: .popular)
        let upCommingViewModel = MoviesViewModel(fetchMoviesUseCase: fetchMoviesUseCase, category: .upComming)
        
        let nowPlayingViewController = MoviesListViewController(viewModel: nowPlayingViewModel)
        nowPlayingViewController.title = "Now Playing"
         nowPlayingViewController.tabBarItem = UITabBarItem(title: "Now Playing", image: UIImage(systemName: "play.circle"), selectedImage: UIImage(systemName: "play.circle.fill"))
        let popularViewController = MoviesListViewController(viewModel: popularViewModel)
        popularViewController.title = "Popular"
            popularViewController.tabBarItem = UITabBarItem(title: "Popular", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
            
        let upcomingViewController = MoviesListViewController(viewModel: upCommingViewModel)
        upcomingViewController.title = "Upcoming"
          upcomingViewController.tabBarItem = UITabBarItem(title: "Upcoming", image: UIImage(systemName: "calendar"), selectedImage: UIImage(systemName: "calendar.fill"))

        self.viewControllers = [UINavigationController(rootViewController: nowPlayingViewController),UINavigationController(rootViewController: popularViewController),UINavigationController(rootViewController: upcomingViewController)]
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
