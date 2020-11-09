from BaseXClient import BaseXClient
from django.shortcuts import render
from lxml import etree

session = BaseXClient.Session('localhost', 1984, 'admin', 'admin')
# Create your views here.

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
    # Não esquecer de ligar o BaseXServer e o BaseXClient antes de correr estas funções, senão não liga à BD
    #try:
    #session.execute("open formula1")
    #except IOError:
     #   session.execute("create db formula1")

        # populate db from api
        #session.execute("open formula1")

    #print(session.info())
    # add document
    #root = etree.parse("webapp/Corridas/2018/2018_constructors.xml")
    #print(root)

    #session.add("Cons2018", etree.tostring(root).decode("iso-8859-1"))
    #print(session.info())
    #session.close()
    tparams = {}
    return render(request, 'index.html', tparams)
