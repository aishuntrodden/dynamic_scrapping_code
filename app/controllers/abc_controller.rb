class AbcController < ApplicationController
  
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

  def create
    xyz = Dir.glob("/var/www/html/10/*")
    CSV.open("data.csv", "wb") do |csv|
      csv << ["Name", "Address", "Phone no","Fax","Email","Website","Contact","Business Details"]
    xyz.each do |i|
      dir = Dir.glob(i);
      dir.each do |j|
      jj=j+"/*"
        dir2 = Dir.glob(jj);
        dir2.each do |jjj|
          urlen=URI::encode(jjj)
          qwerty=urlen.gsub("/var/www/html","http://localhost")
          doc= Nokogiri::HTML(open(qwerty))     
          a = doc.at_css("body").text
          a = a.gsub("\n","")
          a = a.gsub("_____________________________________________________________________________","")
          arr=a.split("*")
          arr.each do |top|
            element= top.split("Address") 
            name=element[0]
            element_1=element[1].split("Phone")
            address=element_1[0]
            element_phone=element_1[1].split("Fax") 
            phone =element_phone[0]
            byebug
            element_2=element_phone[1].split("Email")
            fax=element_2[0]
            element_3=element_2[1].split("Website")
            email=element_3[0]
            element_4=element_3[1].split("Contact")
             website=element_4[0]
             
             element_5=element_4[1].split("Business Details")
             contact=element_5[0]
             element_6=element_5[1].split("/")
             business = element_6[0]
             csv << [name,address,phone,fax,email,website,contact,business]
        
        
        
            byebug
          
        
        end
      end
      end
    end
  end
  end
end
  # doc = Nokogiri::HTML(open(url))
  # a = doc.at_css("body").text
  # a = a.gsub("\n","")
  # a = a.gsub("_____________________________________________________________________________","")
  # arr=a.split("*")
  # b=[1,2]
  # b.each do |itr|
  #   puts itr
  # end
