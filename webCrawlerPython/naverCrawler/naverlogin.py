from selenium import webdriver
import time
from selenium.webdriver.common.keys import Keys #for the enter function
import pyautogui
import pyperclip

url="https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fwww.naver.com"
browser=webdriver.Chrome('/Users/noah/Documents/chromedriver')
browser.implicitly_wait(10) #로딩이 끝날 때까지 10초 기다림
browser.maximize_window() #화면 최대화
#웹사이트 열기
browser.get(url)

id=browser.find_element_by_css_selector("#id")
# ID.send_keys(USERID) this method -> they will know that it was mecro
pyperclip.copy("id123")
pyautogui.hotkey("command", "v")
time.sleep(2) #wait

pw=browser.find_element_by_css_selector('#pw')
pw.click()
pyperclip.copy("ps1234")
pyautogui.hotkey("command", "v")
# pw.send_keys(USERPASSWORD) -> they will know that it was mecro

time.sleep(3) #wait

login_btn=browser.find_element_by_css_selector("#log\.login")
login_btn.click()

