"""api_server URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
# 추가
from django.conf.urls import include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    # 추가
    path('users/', include('accounts.urls')), ## users와 관련된 url 요청은 accounts/urls.py 파일에서 관리
    # path('image_service/', include('image_service.urls')) ## 이미지 서비스와 관련된 url 요청은 image_service/urls.py 파일에서 관리
] + static(settings.MEDIA_URL, document_root =settings.MEDIA_ROOT) ## static 파일을 서비스 하는 경로를 지정,
