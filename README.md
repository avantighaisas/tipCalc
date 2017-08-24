# Pre-work - TipCalc

TipCalc is a tip calculator application for iOS.

Submitted by: Avanti Ghaisas

Time spent: 3+ hours

## User Stories

The following **required** functionality is complete:

* [Yes] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [Yes] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [Yes ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.
* [Yes ] Using locale-specific currency and currency thousands separators.
* [Yes Partially] UI animations implemnted but not sure whether it is working or not as expected.
* [No] Remembering the bill amount across app restarts (if <10mins)

The following **additional** features are implemented:

* Added feedback section : If no tip selected, asked for improvement areas and for any tip given asked which area customer liked.
* Added app icon

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

https://github.com/avantighaisas/tipCalc/blob/master/Video%20Walkthrough.gif


## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** 
    Reactions to iOS app development platform : The learning pattern is standardized in terms of using  Xcode, Swift/ObjectiveC, cocoa touch class, storyboard etc. Help is extensive and self understanding.
    It is interesting to extend basic features provided by iOS.

    outlets -> Provide a way to reference interface objects in the code with which developer can modify properties of that object. (Changing text, color, font etc.)

    actions -> There are two things associated with actions:
     - Defining which actions user can perform on given object  (tap, text change etc performed by user)
     - What should happen in response to these actions (defining in the code )
    
    This is a event driven programming.  The user performs actions in the interface that trigger events in the app. These events result in the execution of the app’s logic and manipulation of its data.


Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** 
    If we assign a closure to a property of a class's instance and the body of the closure accesses a property of the instance, such as self.anyProperty or calls the instance methods such as self.anyInsatnceMethod().

    This strong reference cycle happens because closure is a reference type. So when we assign closure to a property, we assign reference to a closure.
    
    We can resolve this reference cycle by defining the rules (weak/unowned) to use while capturing one or more references.


## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
