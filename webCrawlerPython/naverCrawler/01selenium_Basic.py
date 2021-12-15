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