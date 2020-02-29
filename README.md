# flutter_ffi_plugin

A new flutter plugin project.

### FFI

```
codesign --remove-signature /usr/local/bin/dart
brew install cmake
cd hello_world/hello_library
cmake .
make
cd ..
dart hello.dart
```

Running Tests

```
docker build -t dart-ffi .
docker run dart-ffi
```

### WebAssembly

```
# Get the emsdk repo
git clone https://github.com/emscripten-core/emsdk.git

# Enter that directory
cd emsdk

# Fetch the latest version of the emsdk (not needed the first time you clone)
git pull

# Download and install the latest SDK tools.
./emsdk install latest

# Make the "latest" SDK "active" for the current user. (writes ~/.emscripten file)
./emsdk activate latest

# Activate PATH and other environment variables in the current terminal
source ./emsdk_env.sh
```