from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import VideoViewSet, RegisterView, LoginView, KeepAliveView
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

# Setting up the router for the VideoViewSet
router = DefaultRouter()
router.register(r'videos', VideoViewSet)

# Defining urlpatterns
urlpatterns = [
    path('login/', LoginView.as_view(), name='login'),
    path('register/', RegisterView.as_view(), name='register'),
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('', include(router.urls)),
    path('keep-alive/', KeepAliveView.as_view(), name='keep_alive'),
]
