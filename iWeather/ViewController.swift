//
//  ViewController.swift
//  iWeather
//
//  Created by HuuLuong on 7/13/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lbl_city: UILabel!
    
    @IBOutlet weak var lbl_quote: UILabel!
    
    @IBOutlet weak var btn_temp: UIButton!
    
    @IBOutlet weak var image_backGround: UIImageView!
    
    @IBOutlet weak var lbl_degree: UILabel!
    
    var quote = ["You miss 100 percent of the shots you never take. \n —Wayne Gretzky",
                 "You must be the change you wish to see in the world.\n —Gandhi",
                 " We are what we repeatedly do; excellence, then, is not an act but a habit.\n —Aristotle",
                 "Work like you don’t need money, love like you’ve never been hurt, and dance like no one’s watching.\n —Unknown Author"]

    var city = ["Ha Noi",
                "Ho Chi Minh",
                "Hue",
                "Da Nang"]
    
    var backGroundImage = ["Blood","Moon","Sun"]
    
    var isCelsius: Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isCelsius = true;
    }

    
    @IBAction func btn_actionRandom(sender: AnyObject) {
        
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        
        lbl_city.text = city[cityIndex]
        
        let quoteIndex = Int(arc4random_uniform(UInt32(quote.count)))
        
        lbl_quote.text = quote[quoteIndex]
        
        let imageIndex = Int(arc4random_uniform(UInt32(backGroundImage.count)))
        
        image_backGround.image = UIImage.init(named: backGroundImage[imageIndex])
        
        getTemp()
        
    }
    
    func getTemp() -> Void{
            
            let randomNumber = String(format: "%3.1f", tempRandom())
            
            btn_temp.setTitle(String(randomNumber), forState: .Normal)
            
      
        
    }
    
    func tempRandom() -> Double {
        if isCelsius == true {
            return Double(arc4random_uniform(17) + 15) + Double(arc4random()) / Double(INT32_MAX)
        } else {
            return Double(arc4random_uniform(62) + 59) + Double(arc4random()) / Double(INT32_MAX)
        }
    }
   
    
    @IBAction func action_convertCF(sender: UIButton) {
        if isCelsius == true {
            let degreeC = Double(sender.currentTitle!)
            let degreeF = degreeC! * 9/5 + 32
            btn_temp.setTitle(String(format: "%3.1f", degreeF), forState: .Normal)
            lbl_degree.text = "F"
            isCelsius = false
        } else {
            let degreeF = Double(sender.currentTitle!)
            let degreeC = (degreeF! - 32) * 5/9
            btn_temp.setTitle(String(format: "%3.1f", degreeC), forState: .Normal)
            lbl_degree.text = "C"
            isCelsius = true
        }
            
        
    }
    

}

