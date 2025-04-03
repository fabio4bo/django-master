from django.http.response import HttpResponse
from django.shortcuts import render

from .models import Car


def hello(request):
    html = '''
        <h1 style="color: green;"> Hello World!</h1>
    '''
    return HttpResponse(html)


def cars(request):
    cars_list = Car.objects.all()
    context = {'cars': cars_list}
    view = 'cars/cars.html'

    return render(request, template_name=view, context=context)
