import requests, urllib3, re
from urllib3.contrib.appengine import AppEngineManager

def main():
    
    for ano in range(16,21):
    
        for corrida in range(0,1):
            response = requests.get("http://ergast.com/api/f1/20"+str(ano)+"/"+str(corrida), verify=False)
            f = open("corrida"+str(ano)+"_"+str(corrida)+".xml", "x")
            resposta= change(response.text)
            f.write(resposta)


def change(stringz):
    str1=stringz.replace("utf-8", "iso-8859-1")
    str2=str1.replace('<?xml-stylesheet type="text/xsl" href="/schemas/mrd-1.4.xsl"?>', '')
    result = re.search('<MRData(.*)>', str2)
    str3=str2.replace(result.group(1), '')
    return str3


print(main())

