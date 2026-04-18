//
//  CounterViewController.swift
//  Counter
//
//  Created by Amir on 18.04.2026.
//

import UIKit

class CounterViewController: UIViewController {

    @IBOutlet weak var historyOfChangesTextView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    // Создаем переменную cnt для счета числа
    var cnt = 0 {
        didSet{
            counterLabel.text = "Значение счётчика: \(cnt)"
        }
    }
    // Создаем переменную now которая возврашяет текушее время
    var now : String = {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let dateString = formatter.string(from: date)
        return dateString
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    // Функция plusOneButton для увилечение числа на 1
    @IBAction func plusOneButton(_ sender: Any) {
        cnt += 1
        historyOfChangesTextView.text += "\n[\(now)]: значение изменено на +1"
    }
    // Функция plusOneButton для сброса числа
    @IBAction func clearButton(_ sender: Any) {
        cnt = 0
        historyOfChangesTextView.text += "\n[\(now)]: значение сброшено"
    }
    // Функция plusOneButton для уменшение числа на 1
    @IBAction func minusOneButton(_ sender: Any) {
        if cnt > 0{
            cnt -= 1
            historyOfChangesTextView.text += "\n[\(now)]: значение изменено на -1"
        }else{
            historyOfChangesTextView.text += "\n[\(now)]: попытка уменьшить значение счётчика ниже 0"
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
