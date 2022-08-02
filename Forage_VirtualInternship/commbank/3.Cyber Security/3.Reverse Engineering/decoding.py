from base64 import b64decode as b64d
from base64 import b64encode as b64e
from random import randint

def flag_generator():
	flag = "<redacted>"

	flag = flag.encode('zlib')

	for i in range(randint(0, 10)):
		flag = b64e(flag)

	return b64e(flag)
# zlib has an error so it is really hard to figure out how it works.

def flag_decoder(flag_example):
    flag=b64d(flag_example)
    length=len(flag_example)
    for i in range(randint(0, length)):
        flag = b64d(flag)
     
    return flag

if __name__ == '__main__':
	flag = "Vm0xd1MwNUdXWGxWV0dSUFZsZG9XRmx0ZUV0V01XeDBaVWRHVjFac1NsWlZWbEpIVlRKS1NHVkdXbFpOVmtwWVZrZDRTMk14V25GWApiSEJYVWxSV2VWZFdaRFJaVjAxNFZHNUdWQXBpUmxwWVdXdG9RMUpXV2toTlZGSmFWbTFTV0ZkcmFFOVZkM0JwVjBkb2RsWkdXbUZqCk1EQjRWMjVLWVZKRlNsQlZha0poVFVaYVNFNVZkRlZhTTBKWVdXdFdkMVZXV2xkaFNHUnFDazFXV25wV01uUmhWakpLY21ORk9WZGkKV0dob1ZXcEdkMVpzV25SU2JGcFNWMFZLVmxaWE1UQmpiVlpYV2taV1ZXSnRVbkZEYXpGWFVtcFNWMDFxVmxSV1ZFcEhZMnMxVjFWcwpjRmNLVWxWd2IxWldVa2RXYlZaSFYyNVNVMkpGTlZkV01GWkxaR3hrVjFWclpGZGhlbFpZVld4b2MxZHRWblJsUmtwRVlrWmFXVlF3ClVuTlNSbkEyVFVSc1JGcDZNRGxEWnowOUNnPT0K"
	# flag = flag_generator()
	print ("Try to get the flag reversing the python script that generated it!")
	print ("Flag string: " + flag)
	print("Decode: "+flag_decoder(flag))
