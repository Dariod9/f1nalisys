import requests, re, sys, os
from urllib3.contrib.appengine import AppEngineManager

def main(ano):
    
    if len(ano) == 2:
        anoDef=int(ano)
    else :
        anoDef= int(ano[-2:])
    
    
    path="C:/Users/DarioMatos/Desktop/EDC/f1nalisys/f1nalisys/Corridas/20"+str(anoDef)
    os.mkdir(path)

    response = requests.get("http://ergast.com/api/f1/20"+str(anoDef)+"/0", verify=False)
    f = open(path+"/20"+str(anoDef)+"_0.xml", "x")
    resposta= change(response.text)
    f.write(resposta)

    response2 = requests.get("http://ergast.com/api/f1/20"+str(anoDef)+"/drivers", verify=False)
    f = open(path+"/20"+str(anoDef)+"_drivers.xml", "x")
    resposta= change(response2.text)
    f.write(resposta)

    response = requests.get("http://ergast.com/api/f1/20"+str(anoDef)+"/constructors", verify=False)
    f = open(path+"/20"+str(anoDef)+"_constructors.xml", "x")
    resposta= change(response.text)
    f.write(resposta)

    response = requests.get("http://ergast.com/api/f1/20"+str(anoDef)+"/results", verify=False)
    f = open(path+"/20"+str(anoDef)+"_results.xml", "x")
    resposta= change(response.text)
    f.write(resposta)


def change(stringz):
    str1=stringz.replace("utf-8", "iso-8859-1")
    str2=str1.replace('<?xml-stylesheet type="text/xsl" href="/schemas/mrd-1.4.xsl"?>', '')
    result = re.search('<MRData(.*)>', str2)
    str3=str2.replace(result.group(1), '')
    return str3


main(sys.argv[1])
