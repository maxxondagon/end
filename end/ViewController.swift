//
//  ViewController.swift
//  end
//
//  Created by Maxim Soloboev on 26.03.2023.
//

import UIKit

class ViewController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.sectionInset = .init(
            top: 0,
            left: 10,
            bottom: 0,
            right: 10
        )
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: "cell"
        )
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        collectionView.frame = view.bounds
        view.addSubview(collectionView)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath
        )
        cell.backgroundColor = .systemOrange.withAlphaComponent(0.6)
        cell.layer.cornerRadius = 8
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize {
        let widthSize: CGFloat = view.frame.width - 100
        let heightSize: CGFloat = collectionView.frame.height / 2
        return CGSize(width: widthSize, height: heightSize)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let itemWidth: CGFloat = view.frame.width - 100
        let cellWidth = itemWidth + 10
        let xOffset = targetContentOffset.pointee.x / cellWidth
        targetContentOffset.pointee.x = round(xOffset) * cellWidth - 10
    }
}
