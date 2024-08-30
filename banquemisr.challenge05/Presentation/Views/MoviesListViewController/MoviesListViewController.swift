//
//  MoviesListViewController.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 28/08/2024.
//

import UIKit

class MoviesListViewController: UIViewController {

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
//            print(isLoading?.description)
        }
        
        viewModel.movies.bind { movies in
            self.reloadTableView()
        }
        
        viewModel.error.bind { err in
            print(err.debugDescription)
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
}
