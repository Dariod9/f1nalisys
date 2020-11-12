import xmltodict
from BaseXClient import BaseXClient
from django.shortcuts import render
from lxml import etree

session = BaseXClient.Session('localhost', 1984, 'admin', 'admin')
# Create your views here.


def teams2(request):
    query = "xquery <root>{for $c in collection('f1')//Constructor return <elem> {$c/Name} {$c/Nationality} </elem>}</root> "
    # dá erro: nao encontra o local. Não sei em que pasta guardar os queries com as funçoes para chamar aqui
    # query = "xquery <root>{ local:get-constructors() }</root>"
    exe = session.execute(query)

    output = xmltodict.parse(exe)
    print("out: ", output)

    info = dict()
    for t in output['root']['elem']:
        info[t['Name']] = t['Nationality']

    tparams = {
        'title': 'teams',
        'teams': info,
    }

    return render(request, 'teams.html', tparams)


# tentativa de transformação
def teams(request):
    query = "xquery for $c in collection('f1')//ConstructorTable where $c/@season=2018 return $c"
    exe = session.execute(query)
    print(exe)
    root = etree.fromstring(exe)
    print("root:", root)

    xsl_file = etree.parse('webapp/xsl_files/teams.xsl')
    tranform = etree.XSLT(xsl_file)
    html = tranform(root)

    tparams = {
        'title': 'teams',
        'html': html
    }
    return render(request, 'teams.html', tparams)

def tracks(request):
    query = "xquery <root>{for $c in collection('f1')//Circuit return <elem> {$c/CircuitName} {$c/Location} </elem>}</root> "
    # dá erro: nao encontra o local. Não sei em que pasta guardar os queries com as funçoes para chamar aqui
    # query = "xquery <root>{ local:get-constructors() }</root>"
    exe = session.execute(query)

    output = xmltodict.parse(exe)
    print("out: ", output)

    info = dict()
    for t in output['root']['elem']:
        info[t['CircuitName']] = (t['Location']['Locality'],t['Location']['Country'], getImagem(t['Location']['Country']))



    print(info)
    tparams = {
        'title': 'Tracks',
        'tracklist': info,
    }
    return render(request, 'tracks.html', tparams)


def standings(request):
    queryRace = "xquery <root>{for $c in collection('f1')//RaceTable return <elem> {$c/RaceName} {$c/Circuit/CircuitName} {$c/Location/Country}  </elem>}</root> "
    queryResults = "xquery <root>{for $c in collection('f1')//Driver return <elem> {$c/Result/Driver} {$c/Circuit/CircuitName} {$c/Location/Country}  </elem>}</root> "

    exe = session.execute(queryRace)

    output = xmltodict.parse(exe)
    print("out: ", output)

    info = dict()
    for t in output['root']['elem']:
        info[t['CircuitName']] = (t['Location']['Locality'],t['Location']['Country'], getImagem(t['Location']['Country']))



    print(info)
    tparams = {
        'title': 'Tracks',
        'tracklist': info,
    }
    return render(request, 'tracks.html', tparams)


def drivers(request):
    ano = "2020"
    query = "xquery for $p in collection('f1')//DriverTable where $p/@season=" + str(ano) + " return $p"
    exe = session.execute(query)

    output = xmltodict.parse(exe)
    print("out: ", output)

    info = dict()
    for t in output['DriverTable']['Driver']:
        info[t['PermanentNumber']] = dict()
        info[t['PermanentNumber']]['name'] = t['GivenName'] + ' ' + t['FamilyName']
        info[t['PermanentNumber']]['date'] = t['DateOfBirth']
        info[t['PermanentNumber']]['nation'] = t['Nationality']

    tparams = {
        'title': 'drivers',
        'drivers': info,
    }

    return render(request, 'drivers.html', tparams)


def about(request):
    return render(request, 'about.html', {'title': 'About'})


def ano(request, ano):
    input ="xquery <root>{ for $a in collection('f1')//Race where $a/@season = " + str(ano) + " return <elem> {$a/RaceName} {$a/Circuit}{$a/Location/Locality} {$a/Locality/Country} </elem> }</root>"
    query = session.execute(input)

    info = dict()
    # print(query)
    res = xmltodict.parse(query)
    for c in res["root"]["elem"]:
        info[c["RaceName"]] = dict()
        info[c["RaceName"]]["Circuit"] = c["Circuit"]["CircuitName"]
        info[c["RaceName"]]["Location"] = c["Circuit"]["Location"]["Locality"]+", "+c["Circuit"]["Location"]["Country"]

    print(info)

    tparams= {
        'title': ano,
        "ano" : ano,
        "data": info
    }
    # print(res["root"]["elem"])
    return render(request, 'ano.html', tparams)


def index(request):
    # #Não esquecer de ligar o BaseXServer e o BaseXClient antes de correr estas funções, senão não liga à BD
    # try:
    #     session.execute("open for2")
    #     print(session.info())
    # except IOError:
    #     session.execute("create db for2")
    #     print(session.info()+"AHASUOD")

    # session.execute("open for2")
    # print(session.info())

    # #add document
    # root = etree.parse("webapp/Corridas/2018/2018_drivers.xml")
    # #print(root)
    #
    # session.add("Cons2018", etree.tostring(root).decode("iso-8859-1"))
    # #print(session.info())
    # #session.close()
    #
    # #session.execute("open cTeste (basex/data)")
    # input = "xquery <root>{ for $a in collection('for2') return <elem> {$a} </elem>} </root>"
    # query = session.execute(input)
    # #
    # #root = etree.parse("app/cursos.xml")
    # #info = dict()
    # res = xmltodict.parse(query)
    # print(res)
    tparams = {}

    return render(request, 'index.html', tparams)

def getImagem(pais):
    path = "/static/img/"
    if pais == "Italy":
        path=path+"italy.png"
    elif pais == "Spain":
        path=path+"spain.png"
    elif pais == "UK":
        path=path+"uk.png"
    elif pais == "Australia":
        path=path+"australia.png"
    elif pais == "USA":
        path=path+"usa.png"
    elif pais == "Bahrain":
        path=path+"bahrain.png"
    elif pais == "Azerbaijan":
        path=path+"azerbeijan.png"
    elif pais == "Germany":
        path=path+"germany.png"
    elif pais == "Hungary":
        path=path+"hungary.png"
    elif pais == "Brazil":
        path=path+"brazil.png"
    elif pais == "Singapore":
        path=path+"singapore.png"
    elif pais == "Monaco":
        path=path+"monaco.png"
    elif pais == "Austria":
        path=path+"austria.png"
    elif pais == "France":
        path=path+"france.png"
    elif pais == "Mexico":
        path=path+"mexico.png"
    elif pais == "China":
        path=path+"china.png"
    elif pais == "Russia":
        path=path+"russia.png"
    elif pais == "Belgium":
        path=path+"belgium.png"
    elif pais == "Japan":
        path=path+"japan.png"
    elif pais == "Canada":
        path=path+"canada.png"
    elif pais == "UAE":
        path=path+"abudhabi.png"

    return path
