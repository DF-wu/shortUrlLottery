//
//  mainViewController.swift
//  df_app_HW2
//
//  Created by Chu Fei on 2019/4/14.
//  Copyright © 2019 Chu Fei. All rights reserved.
//

import UIKit
import Foundation

class mainViewController: UIViewController {

    //segment
 
    @IBOutlet weak var segment_control: UISegmentedControl!
    
    //datepicker
    @IBOutlet weak var textfield_valueOfDate: UITextField!
    @IBOutlet weak var datePickerValue: UIDatePicker!
    
    @IBOutlet weak var slider_value: UILabel!
    
    @IBOutlet weak var url_textfield: UITextView!
    
    
    @IBOutlet weak var ani_imageView: UIImageView!
    
    var aniImages = [UIImage]()
    
    @IBOutlet var entireView: UIView!
    var nowColour:UIColor?
    
    let fullAlphabetNumbers = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,Z,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUIimageArray()
        nowColour = entireView.backgroundColor!
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func slider_Action(_ sender: UISlider) {
    
        ani_imageView.image = aniImages[Int(sender.value) - 1]
        slider_value.text = String(format: "%d", Int(sender.value))
    }
    
    func createUIimageArray(){
        
        for number in 1...263 {
            let image = UIImage(named: String(format : "ani_img_%d",number))!
            
            aniImages.append(image)
        }
        
    }
    
    @IBAction func datePicker_Action(_ sender: UIDatePicker) {
        let dateValue = DateFormatter()
        dateValue.dateFormat = "MM dd EE HH:mm" // 設定要顯示在Text Field的日期時間格式
        textfield_valueOfDate.text = dateValue.string(from: datePickerValue.date)
        
    }
    
  
    @IBAction func urlGenerator(_ sender: UIButton) {
        
        var siteUrlPrefix = ""
        var siteDigits = 0
        
        switch segment_control.selectedSegmentIndex {
        case 0:
            siteUrlPrefix = "imgur.com/"
            siteDigits = 7
            break
        case 1:
            siteUrlPrefix = "tinyurl.com/"
            siteDigits = 6
            break
        case 2:
            siteUrlPrefix = "ppt.cc/"
            siteDigits = 4
            break
        case 3:
            siteUrlPrefix = "goo.gl/"
            siteDigits = 6
            break
        default:
                url_textfield.text = "Error!! Retry"
        }
        
        url_textfield.text = siteUrlPrefix + url_generator(fullCharactor: fullAlphabetNumbers, digits: siteDigits)
    }
    
    
    func url_generator(fullCharactor: String , digits:Int) -> String{
        
        let letters = fullCharactor.split(separator: ",")
        
        var url = ""
        
        for _ in 1...digits {
            url += letters[Int.random(in: 0...61)]
        }
        
        return url
    }
    
    @IBAction func lightOff_switch(_ sender: UISwitch) {
        
        
        if(!sender.isOn)
        {
            entireView.backgroundColor = UIColor.darkGray
        }
        else
        {
            entireView.backgroundColor = nowColour
        }
        
    }
    
    
    
    @IBAction func ReturnExit(_ sender: Any) {
    }
    
    
    
    
    @IBAction func EasterEgg_DatePicker(_ sender: UIDatePicker) {
        
        let formater =  DateFormatter()
        
        formater.dateFormat = "YYYY"
        let year_string = formater.string(from: sender.date)
        
        print(year_string)
        if(year_string == "1996")
        {
            ani_imageView.image = UIImage(named: "SingleMEME.jpg")
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
