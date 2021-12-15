from selenium import webdriver
import time
from selenium.webdriver.common.keys import Keys #for the enter function
import csv

#브라우저 생성
browser=webdriver.Chrome('/Users/noah/Documents/chromedriver')

#웹사이트 열기
browser.get('https://www.naver.com')
browser.implicitly_wait(10) #로딩이 끝날 때까지 10초 기다림

browser.find_element_by_css_selector('.link_login').click()
time.sleep(2) #wait

#browser.send_keys('아asdf')

ID=browser.find_element_by_id('id')
ID.send_keys('adfsdfasf')


search=browser.find_element_by_id('pw')
search.click()
search.send_keys('adfsdfasf')


ID.send_keys(Keys.ENTER)


browser=webdriver.Chrome('/Users/noah/Documents/chromedriver')

