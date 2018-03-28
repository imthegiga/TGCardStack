//
//  TGCardStackCVLayoutDelegate.swift
//  TGCardStackCVLayoutDelegate
//
//  Created by Abhishek Salokhe on 28/03/2018.
//  Copyright © 2018 Hong Leong Bank Berhad. All rights reserved.
//

import UIKit

/// Extended delegate.
@objc public protocol TGCardStackCVLayoutDelegate : UICollectionViewDelegate {
    
    /// Asks if the card at the specific index can be revealed.
    /// - Parameter collectionViewLayout: The current TGCardStackCVLayout.
    /// - Parameter canRevealCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: TGCardStackCVLayout, canRevealCardAtIndex index: Int) -> Bool
    
    /// Asks if the card at the specific index can be Unrevealed.
    /// - Parameter collectionViewLayout: The current TGCardStackCVLayout.
    /// - Parameter canUnrevealCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: TGCardStackCVLayout, canUnrevealCardAtIndex index: Int) -> Bool
    
    /// Feedback when the card at the given index will be revealed.
    /// - Parameter collectionViewLayout: The current TGCardStackCVLayout.
    /// - Parameter didRevealedCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: TGCardStackCVLayout, willRevealCardAtIndex index: Int)
    
    /// Feedback when the card at the given index was revealed.
    /// - Parameter collectionViewLayout: The current TGCardStackCVLayout.
    /// - Parameter didRevealedCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: TGCardStackCVLayout, didRevealCardAtIndex index: Int)
    
    /// Feedback when the card at the given index will be Unrevealed.
    /// - Parameter collectionViewLayout: The current TGCardStackCVLayout.
    /// - Parameter didUnrevealedCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: TGCardStackCVLayout, willUnrevealCardAtIndex index: Int)
    
    /// Feedback when the card at the given index was Unrevealed.
    /// - Parameter collectionViewLayout: The current TGCardStackCVLayout.
    /// - Parameter didUnrevealedCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: TGCardStackCVLayout, didUnrevealCardAtIndex index: Int)
    
}

