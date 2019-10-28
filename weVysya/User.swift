//
//  User.swift
//  weVysya
//
//  Created by Darshan Sk on 10/28/19.
//  Copyright © 2019 Centura. All rights reserved.
//

import Foundation

class User {
   public init(age: Int?, isRenewed: Bool?, isAllowedToAddandViewAttendance: Bool?, hubId: Int?, email: String?, anniversaryDate: String?, companyName: String?, isAllowAllPersmission: Bool?, gender: String?, isAllowedToAddMeetingDates: Bool?, isAllowedtoViewCnT: Bool?, website: String?, memberName: String?, recieptUrl: String?, isAllowedToViewEventReport: Bool?, spouseNumber: Int?, visitingCardFront: String?, address: String?, isAllowedToAddEvent: Bool?, gothra: String?, facebookPage: String?, id: Int?, adharNumber: Int?, hubName: String?, token: String?, dob: String?, category: String?, membershipId: String?, isNewMember: Bool?, visitingCardBack: String?, bloodGroup: String?, flag: Int?, isAllowedToRegisterVisitor: Bool?, photoURL: String?, phoneNumber: String?) {
        self.age = age
        self.isRenewed = isRenewed
        self.isAllowedToAddandViewAttendance = isAllowedToAddandViewAttendance
        self.hubId = hubId
        self.email = email
        self.anniversaryDate = anniversaryDate
        self.companyName = companyName
        self.isAllowAllPersmission = isAllowAllPersmission
        self.gender = gender
        self.isAllowedToAddMeetingDates = isAllowedToAddMeetingDates
        self.isAllowedtoViewCnT = isAllowedtoViewCnT
        self.website = website
        self.memberName = memberName
        self.recieptUrl = recieptUrl
        self.isAllowedToViewEventReport = isAllowedToViewEventReport
        self.spouseNumber = spouseNumber
        self.visitingCardFront = visitingCardFront
        self.address = address
        self.isAllowedToAddEvent = isAllowedToAddEvent
        self.gothra = gothra
        self.facebookPage = facebookPage
        self.id = id
        self.adharNumber = adharNumber
        self.hubName = hubName
        self.token = token
        self.dob = dob
        self.category = category
        self.membershipId = membershipId
        self.isNewMember = isNewMember
        self.visitingCardBack = visitingCardBack
        self.bloodGroup = bloodGroup
        self.flag = flag
        self.isAllowedToRegisterVisitor = isAllowedToRegisterVisitor
        self.photoURL = photoURL
        self.phoneNumber = phoneNumber
    }
    
    
    private var age: Int!
   
    
    private var isRenewed: Bool!
   private var isAllowedToAddandViewAttendance: Bool!
  private var hubId: Int!
  private var email: String!
 private var anniversaryDate: String!
  private var companyName: String!
    private var isAllowAllPersmission: Bool!
    private var gender: String!
    private var isAllowedToAddMeetingDates: Bool!
    private var isAllowedtoViewCnT: Bool!
    private var website: String!
    private var memberName: String!
    private var recieptUrl: String!
  private var isAllowedToViewEventReport: Bool!
    private var spouseNumber: Int!
  private var visitingCardFront : String!
  private var address : String!
    private var isAllowedToAddEvent: Bool!
  private var gothra : String!
    private var facebookPage: String!
    private var id: Int!
    private var adharNumber: Int!
    private var hubName: String!
    private var token: String!
    private var dob: String!
  private var category: String!
  private var membershipId: String!
    private var isNewMember: Bool!
  private var visitingCardBack: String!
  private var bloodGroup: String!
    private var flag: Int!
    private var isAllowedToRegisterVisitor: Bool!
  private var photoURL: String!
  private var phoneNumber: String!
    
    
    
    
    static let user = User(age: 0, isRenewed: false, isAllowedToAddandViewAttendance: false, hubId: 0, email: "", anniversaryDate:  "", companyName:  "", isAllowAllPersmission: false, gender:  "", isAllowedToAddMeetingDates: false, isAllowedtoViewCnT: false, website:  "", memberName:  "", recieptUrl:  "", isAllowedToViewEventReport: false, spouseNumber: 0, visitingCardFront:  "", address:  "", isAllowedToAddEvent: false, gothra:  "", facebookPage:  "", id: 0, adharNumber: 0, hubName:  "", token:  "", dob:  "", category:  "", membershipId:  "", isNewMember: false, visitingCardBack:  "", bloodGroup:  "", flag: 0 , isAllowedToRegisterVisitor: false, photoURL:  "", phoneNumber:  "")
    
  
    //getters
    public func getAge() -> Int{
           return self.age
       }
    public func getIsRenewed() -> Bool{
           return  self.isRenewed
       }
    
   public func getIsAllowedToAddandViewAttendance() -> Bool{
             return  self.isAllowedToAddandViewAttendance
         }
      
   
    public func getHubId() -> Int{
        return self.hubId
    }
    public func getEmail() -> String{
           return self.email
       }
  public func getAnniversaryDate() -> String{
      return self.anniversaryDate
  }
   public func getCompanyName() -> String{
       return self.companyName
   }
    
  public func getIsAllowAllPersmission() -> Bool{
      return  self.isAllowAllPersmission
  }
 public func getGender() -> String{
     return self.gender
 }
  public func getIsAllowedToAddMeetingDates() -> Bool{
      return  self.isAllowedToAddMeetingDates
  }
   public func getIsAllowedtoViewCnT() -> Bool{
        return  self.isAllowedtoViewCnT
    }
  public func getWebsite() -> String{
      return self.website
  }
    public func getMemberName() -> String{
        return self.memberName
    }
    public func getRecieptUrl() -> String{
           return self.recieptUrl
       }
  public func getIsAllowedToViewEventReport() -> Bool{
      return  self.isAllowedToViewEventReport
  }
    public func getSpouseNumber() -> Int{
        return  self.spouseNumber
    }
   public func getId() -> Int{
          return  self.id
      }
    public func getFlag() -> Int{
        return  self.flag
    }
    public func getAdharNumber() -> Int{
        return  self.adharNumber
    }
    public func getVisitingCardFront() -> String{
        return self.visitingCardFront
    }
    
    public func getAddress() -> String{
        return self.address
    }
    public func getGothra() -> String{
           return self.gothra
       }
    
    public func getFacebookPage() -> String{
        return self.facebookPage
    }
   public func getHubName() -> String{
          return self.hubName
      }
    public func getToken() -> String{
        return self.token
    }
    
    public func getIsAllowedToAddEvent() -> Bool{
         return  self.isAllowedToAddEvent
     }
  public func getDOB() -> String{
         return self.dob
     }
     
  public func getCategory() -> String{
      return self.category
  }
  public func getIsNewMember() -> Bool{
          return  self.isNewMember
      }
    public func getIsAllowedToRegisterVisitor() -> Bool{
        return  self.isAllowedToRegisterVisitor
    }
    public func getMembershipId() -> String{
        return self.membershipId
    }
    public func getVisitingCardBack() -> String{
        return self.visitingCardBack
    }
    public func getBloodGroup() -> String{
        return self.bloodGroup
    }
  public func getPhotoURL() -> String{
        return self.photoURL
    }
  public func getPhoneNumber() -> String{
        return self.phoneNumber
    }
  // setters
    public func setage( age: Int){
        self.age = age
    }
    public func setAge(age: Int){
           self.age = age
       }
    public func setIsRenewed(isRenewed: Bool){
        self.isRenewed = isRenewed
    }
    public func setIsAllowedToAddandViewAttendance(isAllowedToAddandViewAttendance: Bool){
        self.isAllowedToAddandViewAttendance = isAllowedToAddandViewAttendance
    }
    public func setHubID(hubId: Int){
        self.hubId = hubId
    }
    public func setEmail(email: String){
        self.email  = email
        
    }
    public func setAnniversaryDate(anniversaryDate: String){
        self.anniversaryDate = anniversaryDate
    }
    public func setCompanyName(companyName: String){
        self.companyName = companyName
    }
    public func setIsAllowAllPersmission(isAllowAllPersmission: Bool){
        self.isAllowAllPersmission = isAllowAllPersmission
    }
    public func setGender(gender: String){
        self.gender = gender
    }
    
    public func setIsAllowedToAddMeetingDates(isAllowedToAddMeetingDates: Bool){
        self.isAllowedToAddMeetingDates = isAllowedToAddMeetingDates
    }
    public func setIsAllowedtoViewCnT(isAllowedtoViewCnT: Bool){
        self.isAllowedtoViewCnT = isAllowedtoViewCnT
    }
    
    
    public func setWebsite(website: String){
        self.website = website
    }
    
    public func setMemberName(memberName: String){
        self.memberName =  memberName
    }
    public func setRecieptUrl(recieptUrl: String){
        self.recieptUrl = recieptUrl
    }
    
    public func setIsAllowedToViewEventReport(isAllowedToViewEventReport: Bool){
        self.isAllowedToViewEventReport = isAllowedToViewEventReport
    }
    
    
    public func setSpouseNumber(spouseNumber: Int){
        self.spouseNumber = spouseNumber
    }
    
    
    public func setVisitingCardFront(visitingCardFront: String){
        self.visitingCardFront = visitingCardFront
    }
    
    public func setAddress(address: String){
        self.address = address
    }
    
    public func setIsAllowedToAddEvent(isAllowedToAddEvent: Bool){
        self.isAllowedToAddEvent = isAllowedToAddEvent
    }
    
    
    public func setGothra(gothra: String){
        self.gothra = gothra
    }

    public func setFacebookPage(facebookPage: String){
        self.facebookPage = facebookPage
    }
    public func setId(id: Int){
        self.id = id
    }
    public func setAdharNumber(adharNumber: Int){
        self.adharNumber = adharNumber
    }
    public func setHubName(hubName: String){
        self.hubName = hubName
    }
    
    public func setToken(token: String){
        self.token = token
    }
    
    public func setCategory(category: String){
        self.category = category
    }
     
    public func setDOB(dob: String){
        self.dob = dob
    }
    public func setMembershipId(membershipId: String){
        self.membershipId = membershipId
    }
    
    public func setIsNewMember(isNewMember: Bool){
        self.isNewMember = isNewMember
    }
    
    public func setVisitingCardBack(visitingCardBack: String){
        self.visitingCardBack = visitingCardBack
    }
    
    public func setBloodGroup(bloodGroup: String){
        self.bloodGroup = bloodGroup
    }
    
    public func setFlag(flag: Int){
        self.flag = flag
    }
    
    public func setIsAllowedToRegisterVisitor(isAllowedToRegisterVisitor: Bool){
        self.isAllowedToRegisterVisitor = isAllowedToRegisterVisitor
    }
    
    public func setPhotoURL(photoURL: String){
        self.photoURL = photoURL
    }
    
    public func setPhoneNumber(phoneNumber: String){
        self.phoneNumber = phoneNumber
    }
    

}
