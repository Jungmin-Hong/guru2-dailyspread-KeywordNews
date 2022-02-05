//
//  GetKeyword.swift
//  KeywordNews
//
//  Created by 홍정민 on 2022/02/04.
//

import Foundation
import UIKit

class GetKeyword: UIViewController, UITextFieldDelegate {
    let label = UILabel()
    let tag1Label = UITextField()
    let tag2Label = UITextField()
    let tag3Label = UITextField()
    let tag4Label = UITextField()
    let tag5Label = UITextField()
    let tag6Label = UITextField()
    let tag7Label = UITextField()
    let tag8Label = UITextField()
    let tag9Label = UITextField()
    
    var gotTags: [String] = ["IT","경제","코로나","개발","게임","애플","주가","삼성","스타트업"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabel()
        configureTag1()
        configureTag2()
        configureTag3()
        configureTag4()
        configureTag5()
        configureTag6()
        configureTag7()
        configureTag8()
        configureTag9()
        
        configureButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false //back버튼 생기게 하는 코드(false일떄)
        self.navigationItem.hidesBackButton = true
    }
    
    // textfield 값 변경 감지 시 gotTags의 값도 변경해주는 코드
    @objc func tag1DidChange(_ sender: Any?) { gotTags[0] = self.tag1Label.text! }
    @objc func tag2DidChange(_ sender: Any?) { gotTags[1] = self.tag2Label.text! }
    @objc func tag3DidChange(_ sender: Any?) { gotTags[2] = self.tag3Label.text! }
    @objc func tag4DidChange(_ sender: Any?) { gotTags[3] = self.tag4Label.text! }
    @objc func tag5DidChange(_ sender: Any?) { gotTags[4] = self.tag5Label.text! }
    @objc func tag6DidChange(_ sender: Any?) { gotTags[5] = self.tag6Label.text! }
    @objc func tag7DidChange(_ sender: Any?) { gotTags[6] = self.tag7Label.text! }
    @objc func tag8DidChange(_ sender: Any?) { gotTags[7] = self.tag8Label.text! }
    @objc func tag9DidChange(_ sender: Any?) { gotTags[8] = self.tag9Label.text! }
    
    // 버튼 위치시키고 클릭시 작동하는 함수 연결
    func configureButton() {
        let okButton = UIButton()
        okButton.frame = CGRect(x: 135, y: 750, width: 150, height: 40)
        okButton.setTitle("설정 완료", for: .normal)
        okButton.setTitleColor(.white, for: .normal)
        okButton.backgroundColor = UIColor(named: "light_orange")
        okButton.layer.cornerRadius = 20
        self.view.addSubview(okButton)
        
        okButton.addTarget(self, action: #selector(onTouchButton), for: .touchUpInside)
    }
    //버튼 클릭시 함수 -> 뉴스 화면으로 넘겨주기
    @objc func onTouchButton() {
        NewsListPresenter.tags = gotTags
        let keywordDone = NewListViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(keywordDone, animated: true)
        
    }
    //태그 입력 설명 라벨
    func configureLabel() {
        label.frame = CGRect(x: 10, y: 150, width: 400, height: 150)
        label.text = "보고싶은 뉴스들의 키워드를 입력해주세요!\n입력하지 않으시면 기본 설정 단어들이 뜹니다.\n\nIT / 경제 / 코로나 / 개발 / 게임 \n애플 / 주가 / 삼성 / 스타트업"
        label.textAlignment = .center
        label.numberOfLines = 5
        self.view.addSubview(label)
    }
    //각 태그 위치시키기, 값 변동 감지하여 gotTag값 변경시켜주는 함수 연결
    func configureTag1() {
        tag1Label.frame = CGRect(x: 85, y: 300, width: 250, height: 30)
        tag1Label.borderStyle = .roundedRect
        tag1Label.placeholder = "1번째 키워드를 입력하세요"
        tag1Label.textAlignment = .center
        self.view.addSubview(tag1Label)
        self.tag1Label.addTarget(self, action: #selector(self.tag1DidChange(_:)), for: .editingChanged)
    }
    
    func configureTag2() {
        tag2Label.frame = CGRect(x: 85, y: 345, width: 250, height: 30)
        tag2Label.borderStyle = .roundedRect
        tag2Label.placeholder = "2번째 키워드를 입력하세요"
        tag2Label.textAlignment = .center
        self.view.addSubview(tag2Label)
        self.tag2Label.addTarget(self, action: #selector(self.tag2DidChange(_:)), for: .editingChanged)
    }
    
    func configureTag3() {
        tag3Label.frame = CGRect(x: 85, y: 390, width: 250, height: 30)
        tag3Label.borderStyle = .roundedRect
        tag3Label.placeholder = "3번째 키워드를 입력하세요"
        tag3Label.textAlignment = .center
        self.view.addSubview(tag3Label)
        self.tag3Label.addTarget(self, action: #selector(self.tag3DidChange(_:)), for: .editingChanged)
    }
    
    func configureTag4() {
        tag4Label.frame = CGRect(x: 85, y: 435, width: 250, height: 30)
        tag4Label.borderStyle = .roundedRect
        tag4Label.placeholder = "4번째 키워드를 입력하세요"
        tag4Label.textAlignment = .center
        self.view.addSubview(tag4Label)
        self.tag4Label.addTarget(self, action: #selector(self.tag4DidChange(_:)), for: .editingChanged)
    }
    
    func configureTag5() {
        tag5Label.frame = CGRect(x: 85, y: 480, width: 250, height: 30)
        tag5Label.borderStyle = .roundedRect
        tag5Label.placeholder = "5번째 키워드를 입력하세요"
        tag5Label.textAlignment = .center
        self.view.addSubview(tag5Label)
        self.tag5Label.addTarget(self, action: #selector(self.tag5DidChange(_:)), for: .editingChanged)
    }
    
    func configureTag6() {
        tag6Label.frame = CGRect(x: 85, y: 525, width: 250, height: 30)
        tag6Label.borderStyle = .roundedRect
        tag6Label.placeholder = "6번째 키워드를 입력하세요"
        tag6Label.textAlignment = .center
        self.view.addSubview(tag6Label)
        self.tag6Label.addTarget(self, action: #selector(self.tag6DidChange(_:)), for: .editingChanged)
    }
    
    func configureTag7() {
        tag7Label.frame = CGRect(x: 85, y: 570, width: 250, height: 30)
        tag7Label.borderStyle = .roundedRect
        tag7Label.placeholder = "7번째 키워드를 입력하세요"
        tag7Label.textAlignment = .center
        self.view.addSubview(tag7Label)
        self.tag7Label.addTarget(self, action: #selector(self.tag7DidChange(_:)), for: .editingChanged)
    }
    
    func configureTag8() {
        tag8Label.frame = CGRect(x: 85, y: 615, width: 250, height: 30)
        tag8Label.borderStyle = .roundedRect
        tag8Label.placeholder = "8번째 키워드를 입력하세요"
        tag8Label.textAlignment = .center
        self.view.addSubview(tag8Label)
        self.tag8Label.addTarget(self, action: #selector(self.tag8DidChange(_:)), for: .editingChanged)
    }
    
    func configureTag9() {
        tag9Label.frame = CGRect(x: 85, y: 660, width: 250, height: 30)
        tag9Label.borderStyle = .roundedRect
        tag9Label.placeholder = "9번째 키워드를 입력하세요"
        tag9Label.textAlignment = .center
        self.view.addSubview(tag9Label)
        self.tag9Label.addTarget(self, action: #selector(self.tag9DidChange(_:)), for: .editingChanged)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}
