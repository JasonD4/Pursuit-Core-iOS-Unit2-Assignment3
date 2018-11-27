//
//  WhatWeAreDoing.swift
//  Hangman
//
//  Created by Jason on 11/20/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//
import UIKit

func counterPic (input: Int) -> String{
    switch input {
    case 6:
        return "hang1"
    case 5:
        return "hang2"
    case 4:
        return "hang3"
    case 3:
        return "hang4"
    case 2:
        return "hang5"
    case 1:
        return "hang6"
    case 0:
        return "hang7"
    default:
       return ""
    }
}

func newGame (input: UIButton){
}
