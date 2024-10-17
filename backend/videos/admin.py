from django.contrib import admin
from django.contrib.auth.models import User
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

# Register your models here.
from .models import Video

class UserAdmin(BaseUserAdmin):
    # Specify which fields to display in the admin
    list_display = ('username', 'email', 'first_name', 'last_name', 'is_staff', 'is_active')
    list_filter = ('is_staff', 'is_active')
    search_fields = ('username', 'email', 'first_name', 'last_name')


admin.site.unregister(User)
admin.site.register(User, UserAdmin)
admin.site.register(Video)
