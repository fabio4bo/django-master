from django.http.response import HttpResponse
from django.shortcuts import render


def hello(request):
    html = '''
        <h1 style="color: green;"> Hello World!</h1>
    '''
    return HttpResponse(html)