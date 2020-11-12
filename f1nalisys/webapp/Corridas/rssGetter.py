import requests, sys
from lxml import etree

def main():

    response = requests.get("https://www.grandprix.com/rss.xml", verify=False)
    f=open("rssf1.xml", "w")
    f.write(response.text)
    root = etree.parse("rssf1.xml")
    print(root)

main()