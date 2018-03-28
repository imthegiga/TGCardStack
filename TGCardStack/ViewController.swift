//
//  ViewController.swift
//  TGCardStack
//
//  Created by Abhishek Salokhe on 28/03/2018.
//  Copyright © 2018 Hong Leong Bank Berhad. All rights reserved.
//

import UIKit

// MARK: - Card Layout Options
struct CardLayoutSetupOptions {
    
    var firstMovableIndex: Int = 0
    var cardHeadHeight: CGFloat = 80
    var cardShouldExpandHeadHeight: Bool = false
    var cardShouldStretchAtScrollTop: Bool = true
    var cardMaximumHeight: CGFloat = 0
    var bottomNumberOfStackedCards: Int = 5
    var bottomStackedCardsShouldScale: Bool = true
    var bottomCardLookoutMargin: CGFloat = 10
    var bottomStackedCardsMaximumScale: CGFloat = 1.0
    var bottomStackedCardsMinimumScale: CGFloat = 0.85
    var spaceAtTopForBackgroundView: CGFloat = 40
    var spaceAtTopShouldSnap: Bool = false
    var spaceAtBottom: CGFloat = 0
    var scrollAreaTop: CGFloat = 120
    var scrollAreaBottom: CGFloat = 120
    var scrollShouldSnapCardHead: Bool = false
    var scrollStopCardsAtTop: Bool = true
}

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cardFlowLayout: TGCardStackCVLayout!
    
    // MARK: - Variables
    private let numberOfCards = 5
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCollectionView()
        setupProperties()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - Collection View Delegate
extension ViewController: UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
}

// MARK: - Collection View Datasource
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC", for: indexPath)
        self.setupCellProperties(cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showCard(forPosition: indexPath.row)
    }
    
    func cardCollectionViewLayout(_ collectionViewLayout: TGCardStackCVLayout, willUnrevealCardAtIndex index: Int) {
        print("will unreveal card")
    }
    
    func cardCollectionViewLayout(_ collectionViewLayout: TGCardStackCVLayout, didRevealCardAtIndex index: Int) {
        print("did reveal card")
    }
}

// MARK: - Custom Card Stack Delegate
extension ViewController: TGCardStackDelegate {
    
    func didFlipCard() -> Bool {
        return false
    }
    
    func flipBackCardIfAny() {
        print("flip back card if needed")
    }
    
    func areAllCellFilled() -> (Bool, Int) {
        return (true, 0)
    }
    
    func animateFirstNonFilledCell() {
        print("animate first non filled cell")
    }
    
    func performValidation() {
        print("perform validation")
        showCard(forPosition: numberOfCards - 1)
    }
}

// MARK: - Initializers
extension ViewController {
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CVC")
        self.collectionView.reloadData()
    }
    
    func setupProperties() {
        let cardLayoutOptions = CardLayoutSetupOptions()
        
        //Important if you want to get callbacks for validation
        self.cardFlowLayout?.cardStackDelegate = self
        
        self.cardFlowLayout?.totalNumberOfCards = numberOfCards
        self.cardFlowLayout?.maxYOfCollectionView = self.collectionView.frame.maxY
        self.cardFlowLayout?.firstMovableIndex = cardLayoutOptions.firstMovableIndex
        self.cardFlowLayout?.cardHeadHeight = cardLayoutOptions.cardHeadHeight
        self.cardFlowLayout?.cardShouldExpandHeadHeight = cardLayoutOptions.cardShouldExpandHeadHeight
        self.cardFlowLayout?.cardShouldStretchAtScrollTop = cardLayoutOptions.cardShouldStretchAtScrollTop
        self.cardFlowLayout?.cardMaximumHeight = cardLayoutOptions.cardMaximumHeight
        self.cardFlowLayout?.bottomNumberOfStackedCards = numberOfCards - 1
        self.cardFlowLayout?.bottomStackedCardsShouldScale = cardLayoutOptions.bottomStackedCardsShouldScale
        self.cardFlowLayout?.bottomCardLookoutMargin = cardLayoutOptions.bottomCardLookoutMargin
        self.cardFlowLayout?.spaceAtTopForBackgroundView = cardLayoutOptions.spaceAtTopForBackgroundView
        self.cardFlowLayout?.spaceAtTopShouldSnap = cardLayoutOptions.spaceAtTopShouldSnap
        self.cardFlowLayout?.spaceAtBottom = cardLayoutOptions.spaceAtBottom
        self.cardFlowLayout?.scrollAreaTop = cardLayoutOptions.scrollAreaTop
        self.cardFlowLayout?.scrollAreaBottom = cardLayoutOptions.scrollAreaBottom
        self.cardFlowLayout?.scrollShouldSnapCardHead = cardLayoutOptions.scrollShouldSnapCardHead
        self.cardFlowLayout?.scrollStopCardsAtTop = cardLayoutOptions.scrollStopCardsAtTop
        self.cardFlowLayout?.bottomStackedCardsMinimumScale = cardLayoutOptions.bottomStackedCardsMinimumScale
        self.cardFlowLayout?.bottomStackedCardsMaximumScale = cardLayoutOptions.bottomStackedCardsMaximumScale
    }
    
    func showCard(forPosition position: Int) {
        collectionView.selectItem(at: IndexPath.init(row: position, section: 0), animated: true, scrollPosition: .top)
        cardFlowLayout.revealCardAt(index: position, completion: nil)
    }
    
    func setupCellProperties(_ cell: UICollectionViewCell) {
        let shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: 10).cgPath
        cell.layer.shadowPath = shadowPath
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor(white: 0.0, alpha: 1.0).cgColor
        cell.layer.shadowRadius = 5
        cell.layer.shadowOpacity = 0.35
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.rasterizationScale = UIScreen.main.scale
        cell.layer.shouldRasterize = true
        cell.clipsToBounds = false
        
        cell.contentView.layer.masksToBounds = true
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.clipsToBounds = true
        cell.contentView.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
    }
}

// MARK: - UIColor Extension
extension UIColor {
    static func randomColor() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
}
