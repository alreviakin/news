//
//  NewsTableViewCell.swift
//  News
//
//  Created by Алексей Ревякин on 25.01.2023.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    private var newsImageView = UIImageView()
    private var titleLabel = UILabel()
    private var timeLabel = UILabel()
    private var dotImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "dot")
        imageView.frame = CGRect(x: 0, y: 0, width: 4, height: 4)
        return imageView
    }()
    private var categoryLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func makeFirstNews(image: UIImage, title: String, time: String, category: String) {
        //MARK: - First ImageView
        contentView.addSubview(newsImageView)
        newsImageView.layer.cornerRadius = 10
        newsImageView.layer.masksToBounds = true
        newsImageView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(132)
        }
        newsImageView.image = image
        
        //MARK: - First Title Label
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(newsImageView.snp.bottom).offset(18)
            make.left.equalToSuperview()
            make.right.equalToSuperview().offset(-41)
            make.height.equalTo(48)
        }
        titleLabel.text = title
        titleLabel.font = Resources.Font.covidHelvetica
        titleLabel.numberOfLines = 2
        
        //MARK: - First time label
        contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.equalTo(52)
            make.height.equalTo(17)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        timeLabel.text = time
        timeLabel.font = Resources.Font.fourteenHelvetica
        timeLabel.textColor = Resources.Color.categoryText
        
        //MARK: - First dot imageView
        contentView.addSubview(dotImageView)
        dotImageView.snp.makeConstraints { make in
            make.left.equalTo(timeLabel.snp.right).offset(15)
            make.width.height.equalTo(4)
            make.centerY.equalTo(timeLabel.snp.centerY)
        }
        
        //MARK: - First category label
        contentView.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.left.equalTo(dotImageView.snp.right).offset(15)
            make.right.equalToSuperview()
            make.height.equalTo(17)
            make.centerY.equalTo(timeLabel.snp.centerY)
        }
        categoryLabel.text = category
        categoryLabel.font = Resources.Font.fourteenHelvetica
        categoryLabel.textColor = Resources.Color.categoryText
    }
    
    func makeCell(image: UIImage, title: String, time: String, category: String) {
        //MARK: - Standart ImageView
        contentView.addSubview(newsImageView)
        newsImageView.layer.cornerRadius = 10
        newsImageView.layer.masksToBounds = true
        newsImageView.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(26)
            make.height.width.equalTo(82)
        }
        newsImageView.image = image
        
        //MARK: - Standart Title Label
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(newsImageView.snp.centerY)
            make.left.equalToSuperview()
            make.height.equalTo(54)
            make.width.equalTo(209)
        }
        titleLabel.text = title
        titleLabel.font = Resources.Font.covidHelvetica
        titleLabel.numberOfLines = 2
        
        //MARK: - Standart time label
        contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.equalTo(52)
            make.height.equalTo(17)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        timeLabel.text = time
        timeLabel.font = Resources.Font.fourteenHelvetica
        timeLabel.textColor = Resources.Color.categoryText
        
        //MARK: - Standart dot imageView
        contentView.addSubview(dotImageView)
        dotImageView.snp.makeConstraints { make in
            make.left.equalTo(timeLabel.snp.right).offset(15)
            make.width.height.equalTo(4)
            make.centerY.equalTo(timeLabel.snp.centerY)
        }
        
        //MARK: - Standart category label
        contentView.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.left.equalTo(dotImageView.snp.right).offset(15)
            make.right.equalTo(newsImageView.snp.left)
            make.height.equalTo(17)
            make.centerY.equalTo(timeLabel.snp.centerY)
        }
        categoryLabel.text = category
        categoryLabel.font = Resources.Font.fourteenHelvetica
        categoryLabel.textColor = Resources.Color.categoryText
    }

}
