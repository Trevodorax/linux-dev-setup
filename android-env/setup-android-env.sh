#!/bin/sh

# Update package list and install dependencies
sudo apt update
sudo apt install -y wget unzip openjdk-11-jdk

# Set JAVA_HOME environment variable for OpenJDK 11
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> ~/.zshrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.zshrc

# Install Android SDK
ANDROID_SDK_URL="https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip"
ANDROID_SDK_DIR="$HOME/Android/Sdk"
mkdir -p $ANDROID_SDK_DIR/cmdline-tools
wget $ANDROID_SDK_URL -O android-sdk.zip
unzip android-sdk.zip -d $ANDROID_SDK_DIR/cmdline-tools
mv $ANDROID_SDK_DIR/cmdline-tools/cmdline-tools $ANDROID_SDK_DIR/cmdline-tools/latest
rm android-sdk.zip

# Set ANDROID_SDK_ROOT environment variable
echo "export ANDROID_SDK_ROOT=$ANDROID_SDK_DIR" >> ~/.zshrc
echo "export PATH=\$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:\$PATH" >> ~/.zshrc
echo "export PATH=\$ANDROID_SDK_ROOT/platform-tools:\$PATH" >> ~/.zshrc
source ~/.zshrc

# Install essential Android SDK packages
yes | $ANDROID_SDK_DIR/cmdline-tools/latest/bin/sdkmanager --licenses
$ANDROID_SDK_DIR/cmdline-tools/latest/bin/sdkmanager "platform-tools" "platforms;android-30"

source ~/.zshrc
