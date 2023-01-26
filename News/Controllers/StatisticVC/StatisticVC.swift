//
//  StatisticVC.swift
//  News
//
//  Created by Алексей Ревякин on 04.01.2023.
//

import UIKit
import SnapKit

class StatisticVC: Base {
    //MARK: - Varible
    
    private let yourStatLabel = UILabel()
    private let viewStats = UIView()
    private var diference = 0
    
    private let favoriteIntLabel = UILabel()
    private let readIntLabel = UILabel()
    private let savedIntLabel = UILabel()
    private let favoriteTopicLabel = UILabel()
    
    private let favoriteTableView = UITableView()
    
    private var readInt = 0
    private var favoriteInt = 0
    private var savedInt = 0
    
    private let identifire = "identifire"
    
    var data = [FavoriteTopic(name: "Techology", isFolowing: true),
                FavoriteTopic(name: "Sport", isFolowing: false),
                FavoriteTopic(name: "Life & Style", isFolowing: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diference = 414 - Int(view.bounds.width)

        view.backgroundColor = .white
        addNavBarItem(with: Resources.Strings.NavBar.stat)
        createYourStatsLabel()
        createStatView()
        createFavoriteTopic()
        createFavoriteTableView()
    }
    
    override func touchRight(sender: UIButton) {
        addSaved()
    }
}

extension StatisticVC {
    //MARK: - func for creating yourStatLabel
    
    private func createYourStatsLabel() {
        yourStatLabel.text = Resources.Strings.Stats.yourStat
        yourStatLabel.textColor = Resources.Color.heading
        yourStatLabel.font = Resources.Font.headingHelvetica
        self.view.addSubview(yourStatLabel)
        yourStatLabel.snp.makeConstraints { make in
            make.width.equalTo(96)
            make.height.equalTo(18)
            make.top.equalToSuperview().offset(36)
            make.left.equalToSuperview().offset(27)
        }
    }
    
    private func createStatView() {
        //MARK: - Create VeiwStats
        
        viewStats.layer.cornerRadius = 15
        viewStats.layer.masksToBounds = true
        viewStats.layer.borderColor = Resources.Color.border.cgColor
        viewStats.layer.borderWidth = 0.5
        
        self.view.addSubview(viewStats)
        viewStats.snp.makeConstraints { make in
            make.width.equalTo(350 - diference)
            make.height.equalTo(180)
            make.top.equalTo(yourStatLabel.snp.bottom).offset(22)
            make.left.equalTo(yourStatLabel.snp.left)
        }
        
        //MARK: - Create todayLabel
        
        let todayLabel = UILabel()
        todayLabel.text = Resources.Strings.Stats.today
        todayLabel.font = Resources.Font.headingHelvetica
        todayLabel.textColor = .black
        viewStats.addSubview(todayLabel)
        todayLabel.snp.makeConstraints { make in
            make.width.equalTo(99)
            make.height.equalTo(20)
            make.left.equalToSuperview().offset(14.5)
            make.top.equalToSuperview().offset(20.5)
        }
        
        
        //MARK: - Create Read View Stats
        
       
        readIntLabel.font = Resources.Font.bigIntHelvetica
        readIntLabel.textColor = .black
        readIntLabel.text = String(readInt)
        readIntLabel.textAlignment = .center
        viewStats.addSubview(readIntLabel)
        readIntLabel.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(42)
            make.centerX.equalTo(viewStats.snp.left).offset(66)
            make.top.equalTo(todayLabel.snp.bottom).offset(43)
        }
        
        let readLabel = UILabel()
        readLabel.text = Resources.Strings.Stats.read
        readLabel.font = Resources.Font.headingHelvetica
        readLabel.textColor = Resources.Color.heading
        readLabel.textAlignment = .center
        viewStats.addSubview(readLabel)
        readLabel.snp.makeConstraints { make in
            make.width.equalTo(44)
            make.height.equalTo(20)
            make.centerX.equalTo(readIntLabel.snp.centerX)
            make.top.equalTo(readIntLabel.snp.bottom).offset(4)
        }
        
        //MARK: - Create Saved View Stats

        
        savedIntLabel.font = Resources.Font.bigIntHelvetica
        savedIntLabel.textColor = .black
        savedIntLabel.text = String(savedInt)
        savedIntLabel.textAlignment = .center
        viewStats.addSubview(savedIntLabel)
        savedIntLabel.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(42)
            make.centerX.equalTo(viewStats.snp.right).offset(-66)
            make.centerY.equalTo(readIntLabel.snp.centerY)
        }

        let savedLabel = UILabel()
        savedLabel.text = Resources.Strings.Stats.favorite
        savedLabel.font = Resources.Font.headingHelvetica
        savedLabel.textColor = Resources.Color.heading
        savedLabel.textAlignment = .center
        viewStats.addSubview(savedLabel)
        savedLabel.snp.makeConstraints { make in
            make.width.equalTo(69)
            make.height.equalTo(20)
            make.centerX.equalTo(savedIntLabel.snp.centerX)
            make.top.equalTo(readIntLabel.snp.bottom).offset(4)
        }
        
        //MARK: - Create Favorite View Stats

        
        favoriteIntLabel.font = Resources.Font.bigIntHelvetica
        favoriteIntLabel.textColor = .black
        favoriteIntLabel.text = String(favoriteInt)
        favoriteIntLabel.textAlignment = .center
        viewStats.addSubview(favoriteIntLabel)
        favoriteIntLabel.snp.makeConstraints { make in
            make.width.equalTo(35)
            make.height.equalTo(42)
            make.centerX.equalToSuperview()
            make.top.equalTo(todayLabel.snp.bottom).offset(43)
        }

        let favoriteLabel = UILabel()
        favoriteLabel.text = Resources.Strings.Stats.saved
        favoriteLabel.font = Resources.Font.headingHelvetica
        favoriteLabel.textColor = Resources.Color.heading
        favoriteLabel.textAlignment = .center
        viewStats.addSubview(favoriteLabel)
        favoriteLabel.snp.makeConstraints { make in
            make.width.equalTo(44)
            make.height.equalTo(20)
            make.centerX.equalTo(favoriteIntLabel.snp.centerX)
            make.top.equalTo(readIntLabel.snp.bottom).offset(4)
        }
    }
    
    //MARK: - func for creating favoriteTopicLabel
    
    private func createFavoriteTopic() {
        favoriteTopicLabel.text = Resources.Strings.Stats.favoriteTopic
        favoriteTopicLabel.font = Resources.Font.headingHelvetica
        favoriteTopicLabel.textColor = Resources.Color.heading
        self.view.addSubview(favoriteTopicLabel)
        favoriteTopicLabel.snp.makeConstraints { make in
            make.left.equalTo(yourStatLabel.snp.left)
            make.top.equalTo(viewStats.snp.bottom).offset(30)
            make.width.equalTo(127)
            make.height.equalTo(18)
        }
    }
}

extension StatisticVC: UITableViewDelegate, UITableViewDataSource {
    //MARK: - creating tableView with favorite topic
    
    private func createFavoriteTableView() {
        self.view.addSubview(favoriteTableView)
        favoriteTableView.snp.makeConstraints { make in
            make.left.equalTo(viewStats.snp.left)
            make.right.equalTo(viewStats.snp.right)
            make.top.equalTo(favoriteTopicLabel.snp.bottom).offset(24)
            make.bottom.equalToSuperview()
        }
        favoriteTableView.register(FavoriteTopicCell.self, forCellReuseIdentifier: identifire)
        
        favoriteTableView.dataSource = self
        favoriteTableView.delegate = self
        
        favoriteTableView.isScrollEnabled = false
        favoriteTableView.allowsSelection = false
        favoriteTableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath) as! FavoriteTopicCell
        cell.makeLabelRectangle(name: data[indexPath.row].name.first!, number: indexPath.row)
        cell.makeButton(isFollowing: data[indexPath.row].isFolowing)
        cell.makeLabel(name: data[indexPath.row].name)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
    
    
    
}

@objc extension StatisticVC {
    // MARK: - func for adding 1 to savedLabel
    
    func addSaved() {
        savedInt += 1
        savedIntLabel.text = String(savedInt)
    }
    
    // MARK: - func for adding 1 to favoriteLabel
    
    func addFavorite() {
        favoriteInt += 1
        favoriteIntLabel.text = String(savedInt)
    }
    
    // MARK: - func for adding 1 to readLabel
    
    func addRead() {
        readInt += 1
        readIntLabel.text = String(readInt)
    }
}

