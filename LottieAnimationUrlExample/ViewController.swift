//
//  ViewController.swift
//  LottieAnimationUrlExample
//
//  Created by Avijeet Pandey on 30/05/23.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    let lottieUrlString = "https://assets7.lottiefiles.com/packages/lf20_zjWtZvOKH8.json"
    
    private lazy var animationView: AnimationView = {
        let view = AnimationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLottieAnimationView(from: lottieUrlString)
        setupUI()
    }
    
    // MARK: - setting up lottie animation remotely using URL
    private func setupLottieAnimationView(from urlString: String) {
        
        guard let url = URL(string: urlString) else { return }

        // Loading lottie animation remotely from the url
        Animation.loadedFrom(url: url, closure: { animation in
            self.animationView.animation = animation
            self.animationView.contentMode = .scaleToFill
            self.animationView.loopMode = .loop
            self.animationView.animationSpeed = 1.0
            self.animationView.play()
            
        }, animationCache: LRUAnimationCache.sharedCache)
    }
    
    // MARK: - setupUI
    private func setupUI() {
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.heightAnchor.constraint(equalToConstant: 200),
            animationView.widthAnchor.constraint(greaterThanOrEqualToConstant: 150)
        ])
    }
}

