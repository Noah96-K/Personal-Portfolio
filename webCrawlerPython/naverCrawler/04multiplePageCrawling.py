# -*- coding:utf-8 -*-

from selenium import webdriver
import time
from selenium.webdriver.common.keys import Keys #for the enter function
import csv

#브라우저 생성
browser=webdriver.Chrome('/Users/noah/Documents/chromedriver')

        
def get_crawl(URL,csvWriter):
    browser.get(URL)
    browser.implicitly_wait(10) #로딩이 끝날 때까지 10초 기다림
    # heihgt before the scroll
    before_h=browser.execute_script("return window.scrollY") #can use js

    # infinite scroll
    while True:
        #scroll down to the bottom
       browser.find_element_by_css_selector("body").send_keys(Keys.END) #end key on the keyboard 
       #page loading time between scroll
       time.sleep(2) 
       #height after scroll
       after_h=browser.execute_script("return window.scrollY")
       if after_h==before_h:
           break
       before_h=after_h
    
    
    #product information div
    items=browser.find_elements_by_css_selector(".basicList_info_area__17Xyo")
    
    for item in items:
        name=item.find_element_by_css_selector(".basicList_title__3P9Q7").text
        try:
            price=item.find_element_by_css_selector(".price_num__2WUXn").text
        except:
            price="판매 중단" #there is no price info since it is all soldout
        link=item.find_element_by_css_selector(".basicList_title__3P9Q7>a").get_attribute('href')
        print(name, price, link)
        csvWriter.writerow([name,price,link])


url_sample='https://search.shopping.naver.com/search/all?frm=NVSHATC&origQuery=%EC%95%84%EC%9D%B4%ED%8F%B0%2013&pagingIndex={}&pagingSize=40&productSet=total&query=%EC%95%84%EC%9D%B4%ED%8F%B0%2013&sort=rel&timestamp=&viewType=list'

for i in range(1,3):
    #create file
    f=open(r"/Users/noah/Desktop/JobSearchingExp/FuturePlay/web crawling/data.csv", 'a', encoding='UTF-16', newline='') #direction of the file
    csvWriter=csv.writer(f)
    url=url_sample.format(str(i))
    get_crawl(url,csvWriter)
        