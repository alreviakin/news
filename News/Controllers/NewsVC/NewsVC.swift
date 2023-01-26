//
//  ViewController.swift
//  News
//
//  Created by Алексей Ревякин on 04.01.2023.
//

import UIKit
import SnapKit

final class NewsVC: Base {
    
    //MARK: - Varible
    private let covidView = UIView()
    
    private let newsForYouLabel = UILabel()
    
    private let topFiveLabel = UILabel()
    
    private var differenceWidth = 0
    private var differenceHeight = 0
    
    private let newsTableView = UITableView()
    private let identifire = "Cell"
    
    private var articlesArr: [Article] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        differenceWidth = 414 - Int(view.bounds.width)
        differenceHeight = 869 - Int(view.bounds.height)
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = makeLeftBarButtonItem()
        navigationItem.rightBarButtonItem = makeRightBarButtonItem()
        createCovidView()
        createNewsForYouLabel()
        createTopFiveLabel()
        createTableView()
        response()
    }

    //MARK: - create leftBarButtonItem
    
    private func makeLeftBarButtonItem() -> UIBarButtonItem {
        let button = UIButton()
        let imageView = UIImageView()
        imageView.image = Resources.Image.NavBar.pixels
        imageView.tintColor = Resources.Color.active
        button.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.width.equalTo(27)
            make.height.equalTo(30)
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        let pixelLabel = UILabel()
        pixelLabel.text = Resources.Strings.NavBar.pixels
        pixelLabel.font = Resources.Font.helvetica
        pixelLabel.textColor = Resources.Color.active
        
        let newsLabel = UILabel()
        newsLabel.text = Resources.Strings.NavBar.news
        newsLabel.font = Resources.Font.helvetica
        
        button.addSubview(pixelLabel)
        pixelLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(9)
            make.centerY.equalToSuperview()
            make.width.equalTo(62)
            make.height.equalTo(28)
        }
        
        button.addSubview(newsLabel)
        newsLabel.snp.makeConstraints { make in
            make.width.equalTo(63)
            make.height.equalTo(28)
            make.left.equalTo(pixelLabel.snp.right).offset(8)
            make.centerY.equalToSuperview()
        }
        return UIBarButtonItem(customView: button)
    }
    
    //MARK: - create rightBarButtonItem
    
    private func makeRightBarButtonItem() -> UIBarButtonItem {
        let button = UIButton()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        imageView.image = Resources.Image.NavBar.cat
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        imageView.clipsToBounds = true
        
        button.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(35)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-11)
        }
        
        return UIBarButtonItem(customView: button)
    }
    
    //MARK: - create covidView
    
    private func createCovidView() {
        self.view.addSubview(covidView)
        covidView.layer.cornerRadius = 10
        covidView.layer.masksToBounds = true
        covidView.layer.borderWidth = 0.5
        covidView.layer.borderColor = Resources.Color.border.cgColor
        covidView.snp.makeConstraints { make in
            make.width.equalTo(360 - differenceWidth)
            make.height.equalTo(85 - differenceHeight)
            make.left.equalToSuperview().offset(27)
            make.top.equalToSuperview().offset(25)
        }
        
        //MARK: - create covidLabel
        
        let prefixAttributeString = NSAttributedString(string: "Covid-19 News : ", attributes: [.foregroundColor: Resources.Color.active])
        let postfixAttributeString = NSAttributedString(string: "See the latest coverage about Covid-19", attributes: [.foregroundColor: Resources.Color.lightGrayText])
        let label = UILabel()
        label.attributedText = prefixAttributeString
        covidView.addSubview(label)
        label.snp.makeConstraints { make in
            make.width.equalTo(225 - differenceWidth)
            make.height.equalTo(45)
            make.top.equalToSuperview().offset(13)
            make.left.equalToSuperview().offset(15)
        }
        let labelText = NSMutableAttributedString(attributedString: prefixAttributeString)
        labelText.append(postfixAttributeString)
        label.attributedText = labelText
        label.font = Resources.Font.covidHelvetica
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        
        // create chevronButton
        
        let chevronButton = UIButton()
        chevronButton.setImage(Resources.Image.news.chevronRight, for: .normal)
        covidView.addSubview(chevronButton)
        chevronButton.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.right.equalToSuperview().offset(-11)
            make.centerY.equalTo(label.snp.centerY)
        }
    }
    
    //MARK: - create label "News for you"
    
    private func createNewsForYouLabel() {
        createLabel(label: newsForYouLabel, text: Resources.Strings.News.newsForYou, font: Resources.Font.newsForYouHelvetica!)
        newsForYouLabel.snp.makeConstraints { make in
            make.width.equalTo(126)
            make.height.equalTo(26)
            make.left.equalTo(covidView.snp.left)
            make.top.equalTo(covidView.snp.bottom).offset(20)
        }
    }
    
    //MARK: - create topFiveLabel
    
    private func createTopFiveLabel() {
        createLabel(label: topFiveLabel, text: Resources.Strings.News.topFive, font: Resources.Font.headingHelvetica!)
        topFiveLabel.textColor = Resources.Color.lightGrayText
        topFiveLabel.snp.makeConstraints { make in
            make.width.equalTo(151)
            make.height.equalTo(21)
            make.left.equalTo(covidView.snp.left)
            make.top.equalTo(newsForYouLabel.snp.bottom).offset(3)
        }
    }
    
    private func createLabel(label: UILabel,text: String, font: UIFont) {
        view.addSubview(label)
        label.font = font
        label.text = text
    }
    
    //MARK: - get news
    private func response() {
        APIManager.shared.getNews { news in
            DispatchQueue.main.async {
                self.articlesArr = news.articles!
                print(self.articlesArr.count)
                self.newsTableView.reloadData()
            }
        }
    }
    
    //MARK: - Create table view
    private func createTableView() {
        self.view.addSubview(newsTableView)
        newsTableView.snp.makeConstraints { make in
            make.right.equalTo(covidView.snp.right)
            make.left.equalTo(covidView.snp.left)
            make.top.equalTo(topFiveLabel.snp.bottom).offset(17)
            make.bottom.equalToSuperview()
        }
        newsTableView.dataSource = self
        newsTableView.delegate = self
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: identifire)
        newsTableView.allowsSelection = false
        newsTableView.separatorStyle = .none
        newsTableView.showsVerticalScrollIndicator = false
        
    }
}

extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articlesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath) as! NewsTableViewCell
        var image = UIImage()
        var url: URL!
        var title = String()
        var time = String()
        
        if !articlesArr.isEmpty {
            if let titleArticle = articlesArr[indexPath.row].title {
                title = titleArticle
            }
            if let urlString = articlesArr[indexPath.row].urlToImage {
                url = URL(string: urlString)!
            }
            if let url = url {
                if let data = try? Data(contentsOf: url) {
                    image = UIImage(data: data)!
                }
            } else {
                image = UIImage(named: "1")!
            }
            if let timeString = articlesArr[indexPath.row].publishedAt {
                time = timeString
            }
        }
        
        switch indexPath.row {
        case 0:
            cell.makeFirstNews(image: image, title: title, time: time, category: "Sports")
        default:
            cell.makeCell(image: image, title: title, time: time, category: "Sports")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 220
        default:
            return 115
        }
    }
    
}

