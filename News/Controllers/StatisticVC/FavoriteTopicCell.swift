//
//  favoriteTopicCell.swift
//  News
//
//  Created by Алексей Ревякин on 12.01.2023.
//

import UIKit

class FavoriteTopicCell: UITableViewCell {
    //MARK: - varible
    
    let labelRectangle = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    let label = UILabel()
    let button = UIButton()
    var isFollowing: Bool!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Create labelRectangle
    func makeLabelRectangle(name: Character, number:Int) {
        contentView.addSubview(labelRectangle)
        labelRectangle.layer.cornerRadius = labelRectangle.bounds.height / 2
        labelRectangle.layer.masksToBounds = true
        switch number {
        case 0:
            labelRectangle.backgroundColor = Resources.Color.firstTopic
        case 1:
            labelRectangle.backgroundColor = Resources.Color.secondTopic
        case 2:
            labelRectangle.backgroundColor = Resources.Color.thirdTopic
        default:
            break
        }
        labelRectangle.font = Resources.Font.favoriteTopicLabelRectengleHelvetica
        labelRectangle.text = String(name)
        labelRectangle.textColor = .white
        labelRectangle.textAlignment = .center
        labelRectangle.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.width.height.equalTo(50)
        }
    }
    
    //MARK: - Create button
    func makeButton(isFollowing: Bool) {
        self.isFollowing = isFollowing
        contentView.addSubview(button)
        button.layer.cornerRadius = 3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        buttonIsFollow(isFollowing: isFollowing)
        button.addTarget(self, action: #selector(followTopic(sender: )), for: .touchUpInside)
    }
    
    @objc private func followTopic(sender: UIButton) {
        isFollowing = !isFollowing
        buttonIsFollow(isFollowing: isFollowing)
    }
    
    func buttonIsFollow(isFollowing: Bool) {
        if isFollowing {
            button.backgroundColor = .white
            button.layer.borderColor = Resources.Color.border.cgColor
            button.layer.borderWidth = 0.5
            button.setTitle("Unfollow", for: .normal)
            button.setTitleColor(Resources.Color.active, for: .normal)
            button.snp.updateConstraints{ make in
                make.width.equalTo(92)
                make.height.equalTo(44)
                make.top.equalToSuperview().offset(3)
                make.right.equalToSuperview()
            }
        } else {
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = Resources.Color.active
            button.setTitle("Follow", for: .normal)
            button.layer.borderWidth = 0
            button.snp.updateConstraints{ make in
                make.width.equalTo(77)
                make.height.equalTo(44)
                make.top.equalToSuperview().offset(3)
                make.right.equalToSuperview()
            }
        }
    }
    
    //MARK: - Create label
    func makeLabel(name: String) {
        contentView.addSubview(label)
        label.text = name
        label.font = Resources.Font.favoriteTopicLabelHelvetica
        label.snp.makeConstraints { make in
            make.left.equalTo(labelRectangle.snp.right).offset(19)
            make.width.equalTo(189)
            make.height.equalTo(22)
            make.centerY.equalTo(labelRectangle.snp.centerY)
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
