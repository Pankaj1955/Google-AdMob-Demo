//
//  ViewController.swift
//  Google AdMob Demo
//
//  Created by Pankaj on 02/01/19.
//  Copyright © 2019 Canarys Automations Pvt Ltd. All rights reserved.
//

import UIKit
import GoogleMobileAds


class ViewController: UIViewController,UITextFieldDelegate, GADInterstitialDelegate{

    @IBOutlet weak var GoogleBannerView: GADBannerView!
    
    var interstitialAd : GADInterstitial!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        GoogleBannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        GoogleBannerView.rootViewController = self
        GoogleBannerView.load(GADRequest())
        
        self.interstitialAd = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        request.testDevices = ["2077ef9a63d2b398840261c8221a0c9b"]
        self.interstitialAd.load(request)
        self.interstitialAd = reloadInterstitialAd()

    }

    @IBAction func showAd(_ sender: Any) {
        if self.interstitialAd.isReady {
            self.interstitialAd.present(fromRootViewController: self)
        }
    
    }
    func reloadInterstitialAd() -> GADInterstitial {
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    private func interstitialDidDismissScreen(ad: GADInterstitial!) {
        self.interstitialAd = reloadInterstitialAd()
    }
    
}

