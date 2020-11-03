import requests, urllib3
from urllib3.contrib.appengine import AppEngineManager

def main():
    
    for ano in range(16,21):
    
        for corrida in range(0,21):
            response = requests.get("http://ergast.com/api/f1/20"+str(ano)+"/"+str(corrida), verify=False)
            f = open("corrida"+str(ano)+"_"+str(corrida)+".xml", "x")
            f.write(response.text)

print(main())

