#!/bin/bash
set -e

# Prompt for project name
read -p "Enter the project name: " project_name

# Prompt for organization name (default to com.example.<project_name> if empty)
read -p "Enter the organization name (in reverse domain format, e.g., com.example) [default: com.example.$project_name]: " org_name
org_name=${org_name:-com.example.$project_name}

# Create Flutter project
flutter create --org $org_name $project_name

# Navigate to project folder
cd $project_name

# Clone repository
git clone https://github.com/AswinAzikar/FeatureRichArchFlutter.git

# Copy files from the starter repository
cp -r  FeatureRichArchFlutter/lib .

#Copy config files of vscode
cp -r FeatureRichArchFlutter/.vscode .

#cp -r starter/assets .



# Remove starter.sh from the project folder 
rm -f starter.sh

# Remove the starter repository
rm -rf FeatureRichArchFlutter

# Add Flutter packages
flutter pub add dio dartz flutter_spinkit pinput google_sign_in country_code_picker firebase_auth firebase_core firebase_analytics flutter_svg animations jwt_decoder get hive path_provider flutter_animate firebase_messaging webview_flutter firebase_crashlytics gap lottie device_info_plus package_info_plus file_picker image_picker image_cropper url_launcher cloud_firestore intl geolocator geocoding dotted_border cached_network_image flutter_typeahead infinite_scroll_pagination fluttertoast dio_cookie_manager auto_size_text connectivity_plus flutter_local_notifications permission_handler google_maps_flutter screen_protector dotted_border



flutter pub get

sudo apt install sl
sl -a
# Open project in VS Code
code .