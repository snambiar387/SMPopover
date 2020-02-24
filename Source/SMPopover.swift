//
//  SMPopover.swift
//  SMPopover
//
//  Created by Sreehari M Nambiar on 20/02/20.
//  Copyright © 2020 Sreehari M Nambiar. All rights reserved.
//

import UIKit


public class SMPopover: UIView {
    
    //MARK: Public Properties

    public typealias CompletionHandler = ()-> Void
        
    public enum ArrowDirection {
        case down
    }
    public var autoDismiss = false
    public var autoDismissTimeInterval: TimeInterval = 5.7
    public var arrowDirection = ArrowDirection.down
    public var arrowHeight: CGFloat = 8
    public var contentSize: CGSize = .zero {
        didSet {
            
        }
    }
    public var contentInset: UIEdgeInsets = .zero
    public var color: UIColor = .black
    public var textColor: UIColor {
        set {
            label.textColor = newValue
        } get {
            return label.textColor
        }
    }
    public var textFont: UIFont! {
        set {
            label.font = newValue
        } get {
            return label.font
        }
    }
    public var text: String? {
        set {
            label.text = newValue
            label.sizeToFit()
        } get {
            return label.text
        }
    }
    
    //MARK: Private Properties
    
    private let label = UILabel()
    private var isPresented = false
    private var presentationCompletion: CompletionHandler?
    private var dismissalCompletion: CompletionHandler?
    
    public init(presentationCompletion: CompletionHandler? = nil, dismissalCompletion: CompletionHandler? = nil) {
        super.init(frame: .zero)
        self.presentationCompletion = presentationCompletion
        self.dismissalCompletion = dismissalCompletion
        initialSetup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    //MARK:- Private Methods
    
    private func initialSetup() {
        addSubview(label)
        backgroundColor = .clear
        textColor = .white
        label.textAlignment = .center
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 0, y: 0, width: bounds.width, height: contentSize.height)
    }
    
    private func frame(for direction: ArrowDirection,
                       from source: UIView) -> CGRect {
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        switch arrowDirection {
            
        case .down:
            x = source.frame.midX - (contentSize.width / 2)
            y = source.frame.minY - (contentSize.height + arrowHeight)
        }
        return CGRect(x: x, y: y, width: contentSize.width , height: contentSize.height + arrowHeight)
    }
    
    //MARK:- Public Methods

    public func present(from source: UIView) {
        guard !isPresented else { return }
        isPresented = true
        frame = frame(for: arrowDirection, from: source)
        source.superview?.addSubview(self)
        
        guard autoDismiss else {
            presentationCompletion?()
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + autoDismissTimeInterval) {[weak self] in
            self?.dismiss()
        }
        presentationCompletion?()
    }
    
    public func dismiss() {
        removeFromSuperview()
        frame = .zero
        isPresented = false
        dismissalCompletion?()
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        var rectBounds = bounds
        rectBounds.size.height = bounds.height - arrowHeight
        
        color.set()
        
        let rectPath = UIBezierPath(roundedRect: rectBounds, byRoundingCorners: [.topLeft,.topRight,.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 4, height: 4))
        
        rectPath.fill()
        
        let left = bounds.midX - 8
        let right = bounds.midX + 8
        
        let arrowPath = UIBezierPath()
        arrowPath.move(to: CGPoint(x: left, y: rectBounds.maxY))
        arrowPath.addLine(to: CGPoint(x: bounds.midX, y: rectBounds.maxY + arrowHeight))
        arrowPath.addLine(to: CGPoint(x: right, y: rectBounds.maxY))
        arrowPath.close()
        arrowPath.fill()
    }
}
