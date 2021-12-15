from selenium import webdriver
import time
from selenium.webdriver.common.keys import Keys #for the enter function

#브라우저 생성
browser=webdriver.Chrome('/Users/noah/Documents/chromedriver')

#웹사이트 열기
browser.get('https://www.naver.com')
browser.implicitly_wait(10) #로딩이 끝날 때까지 10초 기다림

#쇼핑 메뉴 클릭
browser.find_element_by_css_selector('a.nav.shop').click()
time.sleep(2) #wait

#검색창 클릭

search=browser.find_element_by_css_selector('input.co_srh_input._input')
search.click()


#search the keyword
search.send_keys('아이폰 13')
search.send_keys(Keys.ENTER)

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
        price=item.find_element_by_css_selector(".basicList_price_area__1UXXR").text
    except:
        price="판매 중단" #there is no price info since it is all soldout
    link=item.find_element_by_css_selector(".basicList_title__3P9Q7>a").get_attribute('href')
    print(name, price, link)
    