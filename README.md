# flutter_ffi_plugin

A new flutter plugin project.

### FFI

```
# Remove Codesign on macos
codesign --remove-signature /usr/local/bin/dart

# Install cmake
brew install cmake

# Navigate to directory
cd hello_world/hello_library

# Create project files
cmake .

# Build libraries
make

# Navigate back to program
cd ..

# Run dart program
dart hello.dart
```

Running Tests

```
docker build -t dart-ffi .
docker run dart-ffi
```

### WebAssembly

https://emscripten.org/docs/getting_started/Tutorial.html

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

# If you haven’t run Emscripten before, run it now
emcc -v

# Navigate to the directory
cd hello_world/hello_library

# Build the c file -O1 -O2 Flags for optimization
emcc hello.c

# Build HTML Preview
emcc hello.c  -o hello.html

# Export functions
emcc hello.c -o function.html -s EXPORTED_FUNCTIONS='["_hello_world"]' -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]'

emcc hello.c -Os -s WASM=1 -s SIDE_MODULE=1 -o hello_world.wasm
```