//
//  MoviesListViewController.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 28/08/2024.
//

import UIKit

class MoviesListViewController: UIViewController {

    @IBOutlet weak var activityIndecator: UIActivityIndicatorView!
    @IBOutlet weak var tbView: UITableView!
    
    private var viewModel:MoviesViewModel!
    
    init(viewModel: MoviesViewModel) {
            self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        viewModel.fetchMovies()
        bindToViewModel()

    }

    func registerCell() {
        tbView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
    }
    
    func bindToViewModel() {
        viewModel.isLoadingData.bind { isLoading in
            guard let isLoading = isLoading else {
                return
            }
            if isLoading {
                DispatchQueue.main.async {
                    self.activityIndecator.startAnimating()
                }
            } else {
                DispatchQueue.main.async {
                    self.activityIndecator.stopAnimating()
                }
            }
        }
        
        viewModel.movies.bind { [weak self] movies in
            self?.reloadTableView()
        }
        
        viewModel.error.bind { [weak self] err in
            if let err = err?.localizedDescription {
                self?.showErrorAlert(with: err)
            }
        }
    }
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tbView.reloadData()
        }
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

extension MoviesListViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numOfRows()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        cell.setup(with: viewModel.movies.value![indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        if indexPath.row == viewModel.numOfRows() - 1 {
            viewModel.fetchMovies()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let movie = viewModel.movies.value?[indexPath.row] {
            let movieItem = Movie(id: movie.id, title: movie.title, releaseDate: movie.releaseDate, posterPath: movie.posterImage, overview: movie.overview)
            let detailsVC = MoviesDetailsViewController(movie:movieItem)
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}
