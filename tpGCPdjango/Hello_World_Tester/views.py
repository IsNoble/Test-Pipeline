from django.shortcuts import render

def Hello_World_Tester(request):
        return render(request, 'Hello_World_Tester.html', {})
