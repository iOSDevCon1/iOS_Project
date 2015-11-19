//
//  ItemQueue.swift
//  PodDrop
//
//  Created by Pablo Arango on 11/17/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation

//generic queue data object

class ItemNode {
    var value: Item?
    var next: ItemNode?
    
}

class ItemQueue {

    private var first: ItemNode! = ItemNode()
    
    //enqueue the specified object
    func push(value: Item) {
        
        //check for the instance
        if (first == nil) {
            first = ItemNode()
        }
        
        //establish the first node
        if (first.value == nil) {
            first.value = value;
            return
        }
        
        let childToUse: ItemNode = ItemNode()
        var current: ItemNode = first
        
        
        //cycle through the list of items to get to the end.
        while (current.next != nil) {
            current = current.next!
        }
        
        
        //append a new item
        childToUse.value = value;
        current.next = childToUse;
        
    }
    
    
    func pop() -> Item?{
        
        let firstItem: Item? = self.first?.value
        
        if (firstItem == nil) {
            return nil
        }
        
        //retrieve and queue the next item
        let queueitem: Item? = self.first.value!
        
        
        //use optional binding
        if let nextitem = self.first.next {
            self.first = nextitem
        }
        else {
            self.first = nil
        }
        
        return queueitem
    
    }
    
    func get(index:Int) -> Item?{
        var current = self.first
        while(index>0){
            current = current.next
        }
        return current.value
    }
    
    //check for the presence of a value
    func isEmpty() -> Bool {
        
        //determine if the key or instance exist
        if self.first?.value != nil {
            return false
        }
            
        else {
            return true
        }
        
    }
    
    //retrieve the first item
    func peek() -> Item? {
        return first.value!
    }


}