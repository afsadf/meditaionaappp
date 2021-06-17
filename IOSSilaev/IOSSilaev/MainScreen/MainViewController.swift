//
//  MainViewController.swift
//  IOSKartenicheva
//
//  Created by user on 15.06.2021.
//

import UIKit
import SwiftyJSON
import Alamofire

class MainViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var movies: [String] = ["bad-boys","joker","hollywood"]
    var frame = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let token = UserDefaults.standard.string(forKey: "token")!
//        let url = "http://cinema.areas.su/movies/cover"
//        let heardes: HTTPHeaders = ["Authorization": "Bearer\(token)"]
//        AF.request(url, method: .get, headers: heardes).validate().responseJSON { response in
//            switch response.result {
//            case .success(let value):
//            let json = JSON(value)
//            print("JSON: \(json)")
//            let imgSourse = json[0]["avatar"].stringValue
//            let url2 = "http://cinema.areas.su/up/images\(imgSourse)"
//            if let data = try? Data(contentsOf: URL(string: url2)!){
//                self.imgAvatar.image = UIImage(data: data)
//            }
//            case .failure(let error):
//            print(error)
//            }
//        }
//        pageControl.numberOfPages = movies.count
//            setupScreens()
//        scrollView.delegate = self
     
    }
    
    func setupScreens() {
        for index in 0..<movies.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: movies[index])

            self.scrollView.addSubview(imgView)
        }
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(movies.count)), height: scrollView.frame.size.height)
            scrollView.delegate = self
        }
    
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
            pageControl.currentPage = Int(pageNumber)
        
        
    }

}
