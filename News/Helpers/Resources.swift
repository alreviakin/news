//
//  tabBarElement.swift
//  News
//
//  Created by Алексей Ревякин on 04.01.2023.
//

import UIKit

enum Resources {
    enum Color {
        static let active = UIColor(hexString: "#0077B6")
        static let inactive = UIColor(hexString: "#CCCCCC")
        
        static let heading = UIColor(hexString: "#A7A7A7")
        
        static let border = UIColor(hexString: "#BFBFBF")
        
        static let firstTopic = UIColor(hexString: "#FFB703")
        static let secondTopic = UIColor(hexString: "#C44536")
        static let thirdTopic = UIColor(hexString: "#118AB2")
        
        static let lightGrayText = UIColor(hexString: "#7F7F7F")
        
        static let categoryText = UIColor(hexString: "#898989")
    }
    
    enum Image {
        enum NavBar {
            static let pixels = UIImage(named: "pixels")
            static let cat = UIImage(named: "cat")
            
            static let dots = UIImage(named: "dots")
        }
        enum TabBar {
            static let news = UIImage(named: "news")
            static let search = UIImage(named: "search")
            static let notification = UIImage(named: "notification")
            static let stat = UIImage(named: "stat")
        }
        
        enum news {
            static let chevronRight = UIImage(named: "chevron-right")
        }
    }
    
    enum Strings {
        enum TabBar {
            static let news = "News"
            static let search = "Headlines"
            static let notification = "Notification"
            static let stat = "Stats"
        }
        
        enum NavBar {
            static let pixels = "Pixels"
            static let news = "News"
            static let headlines = "Headlines"
            static let notification = "Notification"
            static let stat = "Summary Stats"
        }
        
        enum Stats {
            static let yourStat = "YOUR STATS"
            static let today = "Today Daily"
            
            static let read = "Read"
            static let favorite = "Favorite"
            static let saved = "Saved"
            
            static let favoriteTopic = "FAVORITE TOPIC"
        }
        
        enum News {
            static let newsForYou = "News for you"
            static let topFive = "Top 5 News of the day"
        }
    }
    
    enum Font {
        static let helvetica = UIFont(name: "Helvetica", size: 23)
        static let headingHelvetica = UIFont(name: "Helvetica", size: 15)
        static let bigIntHelvetica = UIFont(name: "Helvetica", size: 30)
        static let favoriteTopicLabelRectengleHelvetica = UIFont(name: "Helvetica", size: 25)
        static let favoriteTopicLabelHelvetica = UIFont(name: "Helvetica", size: 17)
        static let covidHelvetica = UIFont(name: "Helvetica", size: 16)
        static let newsForYouHelvetica = UIFont(name: "Helvetica", size: 16)
        static let fourteenHelvetica = UIFont(name: "Helvetica", size: 14)
    }
}

struct FavoriteTopic {
    var name: String
    var isFolowing: Bool
}
