//
//  Movie.swift
//  Demo-MVVM
//
//  Created by wangliang on 16/6/13.
//  Copyright © 2016年 wangliang. All rights reserved.
//

import UIKit

class Movie: NSObject {

    var title: String = "" {
        didSet{
            title = "片名:" + title
        }
    }

    var tag: String = "" {
        didSet{
            tag = "类型:" + tag
        }
    }

    var act: String = "" {
        didSet{
            act = "主演:" + act
        }
    }
    var year: String = "" {
        didSet{
            year = "上映时间:" + year
        }
    }

    var rating: String = "" {
        didSet{
            if rating != "" {
                rating = "评分:" + rating
            }
        }
    }

    var area: String = "" {
        didSet{
            area = "欧美/港台/大陆:" + area
        }
    }

    var dir: String = "" {
        didSet{
            dir = "导演:" + dir
        }
    }

    var desc: String = "" {
        didSet{
            desc = "剧情介绍:" + desc
        }
    }

    var cover: String = ""
    var vdo_status: String = ""
    var playlinks: PlayLink?
    var video_rec: [Viedo] = []
    var act_s: [Acts] = []
    
    init(dict: [String: AnyObject])
    {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    override func setValue(value: AnyObject?, forKey key: String) {
        
        if "video_rec" == key {
            video_rec = self.dict2ViedoModel(value as! [[String: AnyObject]])
            return
        }
        
        if "playlinks" == key {
            playlinks = PlayLink(dict: value as! [String : AnyObject])
            return
        }

        if "act_s" == key {
            act_s = self.dict2ActsModel(value as! [[String: AnyObject]])
            return
        }
        
        super.setValue(value, forKey: key)
    }
    
    func dict2ViedoModel(list: [[String: AnyObject]]) -> [Viedo] {
        var viedos = [Viedo]()
        for dict in list {
            viedos.append(Viedo(dict: dict))
        }
        return viedos
    }
    
    func dict2ActsModel(list: [[String: AnyObject]]) -> [Acts] {
        var acts = [Acts]()
        for dict in list {
            acts.append(Acts(dict: dict))
        }
        return acts
    }
}
