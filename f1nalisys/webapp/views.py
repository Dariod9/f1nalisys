import xmltodict
from BaseXClient import BaseXClient
from django.shortcuts import render
from lxml import etree

session = BaseXClient.Session('localhost', 1984, 'admin', 'admin')
# Create your views here.


def teams(request):
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
        'title': 'Teams',
        'teams': info,
    }

    return render(request, 'teams.html', tparams)


# tentativa de transformação
def teams2(request):
    query = "xquery for $c in collection('f1')//ConstructorTable return $c"
    exe = session.execute(query)
    print(exe)
    root = etree.fromstring(exe)

    xsl_file = etree.parse('webapp/xsl_files/teams.xsl')
    tranform = etree.XSLT(xsl_file)
    html = tranform(root)

    tparams = {
        'html': html
    }
    return render(request, 'teams.html', tparams)


def drivers(request):
    query = "xquery for $p in collection('f1')//DriverTable return $p"
    exe = session.execute(query)

    output = xmltodict.parse(exe)
    print("out: ", output)

    info = dict()
    for t in output['DriverTable']['Driver']:
        info[t['PermanentNumber']] = dict()
        info[t['PermanentNumber']]['name'] = t['GivenName'] + t['FamilyName']
        info[t['PermanentNumber']]['date'] = t['DateOfBirth']
        info[t['PermanentNumber']]['nation'] = t['Nationality']

    tparams = {
        'title': 'pilots',
        'drivers': info,
    }

    return render(request, 'drivers.html', tparams)


def home(request):
    # #Não esquecer de ligar o BaseXServer e o BaseXClient antes de correr estas funções, senão não liga à BD
    # session.execute("open f1")
    # # add document
    # root = etree.parse("webapp/Corridas/2018/2018_drivers.xml")
    #
    # session.add("CORRIDAS", etree.tostring(root).decode("utf-8"))
    # print(session.info())
    tparams = {}
    return render(request, 'home.html', tparams)


def about(request):
    return render(request, 'about.html', {'title': 'About'})


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
