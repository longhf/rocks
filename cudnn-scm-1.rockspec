package = "cudnn"
version = "scm-1"

source = {
   url = "git://github.com/longhf/cudnn.torch.R2.git",
}

description = {
   summary = "Torch7 FFI bindings for NVIDIA CuDNN kernels!",
   detailed = [[
   All CuDNN modules exposed as nn.Module derivatives so 
   that they can be used with torch's neural network package
   ]],
   homepage = "https://github.com/longhf/cudnn.torch.R2",
   license = "BSD"
}

dependencies = {
   "torch >= 6.5",
   "cutorch",
   "nn"
}

build = {
   type = "command",
   build_command = [[
cmake -E make_directory build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)" && $(MAKE)
]],
   install_command = "cd build && $(MAKE) install"
}
