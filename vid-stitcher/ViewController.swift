//
//  ViewController.swift
//  vid-stitcher
//
//  Created by Anjana Somathilake on 6/20/16.
//  Copyright © 2016 Nuclei Technologies. All rights reserved.
//

//https://www.raywenderlich.com/30200/avfoundation-tutorial-adding-overlays-and-animations-to-videos

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBAction func mergeVidBtnTouched(sender: UIButton) {
        
        let dialog = UIAlertController(title: "Hello", message: "How are you?", preferredStyle: UIAlertControllerStyle.Alert)
        
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        
        dialog.addAction(action)
        
        presentViewController(dialog, animated: false, completion: nil)
        
        
        //Create AVMutableComposition Object which will hold our multiple AVMutableCompositionTrack
        var mixComposition = AVMutableComposition()
        

        let video_1_url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("1", ofType: "m4v")!)
        
        let video_1_asset = AVURLAsset(URL: video_1_url, options: nil)
        
        //Here where load our movie Assets using AVURLAsset
//        AVURLAsset* firstAsset = [AVURLAsset URLAssetWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @”gizmo” ofType: @”mp4″]] options:nil];
//        AVURLAsset * secondAsset = [AVURLAsset URLAssetWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @”gizmo” ofType: @”mp4″]] options:nil];
//        
        let video_1 = mixComposition.addMutableTrackWithMediaType(AVMediaTypeVideo,preferredTrackID: Int32(kCMPersistentTrackID_Invalid))
    

        do {
            try video_1.insertTimeRange(CMTimeRangeMake(kCMTimeZero, video_1_asset.duration),ofTrack: video_1_asset.tracksWithMediaType(AVMediaTypeVideo)[0] ,atTime: kCMTimeZero)
        } catch _ {
            print("Failed to load first track video")
        }
        


        
        
        
        
        
    }
    @IBOutlet weak var mergeVidBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

