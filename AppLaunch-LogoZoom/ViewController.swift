//
//  ViewController.swift
//  AppLaunch-LogoZoom
//
//  Created by Rushi Patel on 2021-07-01.
//

import UIKit

class ViewController: UIViewController {

    private let imageview :UIImageView = {
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 240, height: 183))    ;
        imageview.image = UIImage(named: "Logo");
        return imageview;
    }();
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageview);
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        imageview.center = view.center;
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.animate();
        })
        
    }
    private func animate(){
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 4;
            let diffX = size - self.view.frame.size.width;
            let diffY = self.view.frame.size.height - size;
            self.imageview.frame = CGRect(x: -( diffX / 2),
                                          y: diffY/2 ,
                                          width: size,
                                          height: size);
            
            self.imageview.alpha = 0
        });
        UIView.animate(withDuration: 1.5, animations: {
            self.imageview.alpha = 0
        },completion: { done in
        if done{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {let viewC = HomeViewController();
                                            viewC.modalTransitionStyle = .crossDissolve;
                                                viewC.modalPresentationStyle = .fullScreen;
                                                self.present(viewC, animated: true);})
        }
        })
    }
}

