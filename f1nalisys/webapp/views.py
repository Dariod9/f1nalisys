from django.shortcuts import render


# Create your views here.

def home(request):
    tparams = {}
    return render(request, 'home.html', tparams)


def about(request):
    return render(request, 'about.html', {'title': 'About'})


def index(request):
    tparams = {}
    return render(request, 'index.html', tparams)
