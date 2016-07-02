# youtubeDemo

Demo how to access youtube API

1) Download google client from: https://github.com/google/google-api-objectivec-client-for-rest

 git clone --recursive https://github.com/google/google-api-objectivec-client-for-rest.git

2) How to use GTLR.framework: a) import the framework directly, or b) import GTLRCore.xcodeproj file

3) When build GTLR.framework, make sure change "Mach-O Type" to "Static Library" from "Dynamic Library"

4) Add this define to your project file:

   -DGTLR_USE_FRAMEWORK_IMPORTS=1
