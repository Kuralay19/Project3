//
//  MainViewController.swift
//  API1 Q
//
//  Created by Smart Castle M1A2004 on 14.04.2024.
//
import UIKit
import SDWebImage

class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    var mainData: MoviesResult?
    
    lazy var tableView :UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.rowHeight = 160
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
        setupSignals()
        getData()
        
    }
    func setupLayouts() {
        view.backgroundColor = .black
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    
    }
    func setupSignals() {
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func getData() {
        Service.shared.fetchJsonData(urlString: "https://api.themoviedb.org/3/discover/movie") { result, error in
   
            if let error = error {
                print("ERROR")
                return
            }
            if let result = result {
                self.mainData = result
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let result = mainData?.results[indexPath.row] else { return }
        let vc = DetailViewController(result: result)
        self.navigationController?
            .pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainData?.results.count ?? 0
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MainTableViewCell
        cell.backgroundColor = .black
       
        if let data = mainData?.results[indexPath.row] {
            cell.nameOfMovieLabel.text = data.title
            cell.descriptionMovieLabel.text = data.overview
              if let path = data.posterPath {
              let imageUrl = "https://image.tmdb.org/t/p/w300_and_h450_bestv2/"
              guard let url = URL(string: imageUrl + path) else { return cell }
                  cell.customImageView.sd_setImage(with: url)
          }
      }
        return cell
    }
 
    }


class MainTableViewCell: UITableViewCell {
    
    lazy var customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "posterDemo")?.withRenderingMode(.alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameOfMovieLabel: UILabel = {
        let label = UILabel()
        label.text = "Pirates of the Caribian"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .yellow
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
      
        return label
    }()
    
    lazy var descriptionMovieLabel: UILabel = {
        let label = UILabel()
        label.text = "Awesome movie, highly reccomended to watch"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayouts()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupLayouts() {
        backgroundColor = .white
        
        addSubview(customImageView)
        customImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        customImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        customImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        customImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        addSubview(nameOfMovieLabel)
        nameOfMovieLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nameOfMovieLabel.leftAnchor.constraint(equalTo: customImageView.rightAnchor).isActive = true
        nameOfMovieLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        
        addSubview(descriptionMovieLabel)
        descriptionMovieLabel.topAnchor.constraint(equalTo: nameOfMovieLabel.bottomAnchor, constant: 30).isActive = true
        descriptionMovieLabel.leftAnchor.constraint(equalTo: customImageView.rightAnchor, constant: 20).isActive = true
        descriptionMovieLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        descriptionMovieLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    }

}
/*import SwiftUI
@available(iOS 13.0,  *)
struct MainVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        func updateUIViewController(_ uiViewController: MainViewController, context: Context) {
            
        }
        
        let mainVC = MainViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainVCProvider.ContainerView>)
        -> MainViewController {
            return mainVC
        }
        

    }
}

*/
