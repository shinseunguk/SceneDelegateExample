//
//  SceneDelegate.swift
//  SceneDelegateExample
//
//  Created by plsystems on 2023/03/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    lazy var TAG_BG_IMG = -101
    lazy var bgLabel: UILabel = {
        let label = UILabel()
        label.frame = UIScreen.main.bounds
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "민감한 정보 숨기기"
        return label
    }()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.frame = UIScreen.main.bounds
        bgView.tag = TAG_BG_IMG
        bgView.backgroundColor = .black
        return bgView
    }()
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    // MARK: - 앱이 Active 상태가 되었을 때 호출되는 메서드입니다.
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        callBackgroundImage(false)
    }
    
    // MARK: - Active -> In-Active 상태로 변한 것을 알 수 있습니다.
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        callBackgroundImage(true)
    }
    
    // MARK: - 앱이 Foreground 상태가 됐을 때 호출되는 메서드입니다. (Background -> Foreground)
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        callBackgroundImage(false)
    }
    
    // MARK: - 앱이 Background 상태가 됐을 때 호출되는 메서드입니다. (Foreground -> Background)
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        callBackgroundImage(true)
    }
    
    func callBackgroundImage(_ bShow: Bool) {
        
        let backgroundView = window?.rootViewController?.view.window?.viewWithTag(TAG_BG_IMG)
        
        if bShow {
            
            if backgroundView == nil {
                bgView.addSubview(bgLabel)
                window?.rootViewController?.view.window?.addSubview(bgView)
            }
        } else {
            
            if let backgroundView = backgroundView {
                backgroundView.removeFromSuperview()
            }
        }
    }
}

