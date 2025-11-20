cinm编译器支持AI模型到pim模拟实验  

# 介绍  
cinm支持AI模型（mobilenet）到存内架构模拟端到端全流程   
支持直接编写Python语言，自动转换为存内模拟器支持的程序   
支持 Python语言 -> Pytorch ir -> linlag mlir -> cinm mlir -> llvm ir -> 模拟器可执行程序 全流程   

# 来源  
ALPINE: Analog In-Memory Acceleration withTight Processor Integration for Deep Learning https://arxiv.org/pdf/2205.10042   
Hardware-Aware Compilation and Simulation for In-Memory Computing  https://esweek.org/tutorials/   

# 实验环境  
ubuntu22.04  

# 代码下载
git clone https://github.com/jingge815/Cinnamon.git --branch feature/pytorch-support  
cd Cinnamon  

# 编译方法 

## 1.配置已编译好的llvm21  
编译cinm前置需要llvm21，具体编译过程可详见：https://github.com/jingge815/Cinnamon/blob/feature/develop-compiler/install.md 利用这个脚本编译可自动完成原版llvm21下载和编译  
配置llvm21路径  
修改.github/workflows/build-llvm.sh文件中的LLVM21_BUILD_DIR变量，例如：
LLVM21_BUILD_DIR="/home/fengjingge/src/downmem/new2-downmem/cinm/Cinnamon/third-party/llvm/build"  

## 2.编译处理
./build.sh     

具体的处理步骤如下：  
  1) Create Python venv and install deps  
  2) Source the venv  
  3) Build LLVM  
  4) Build Torch-MLIR  
  5) Download/prepare UpMem SDK  
  6) Build Cinnamon  
  7) Build ALPINE in container (required)  

大概编译需要多个小时   

## 3.安装notebook
pip install notebook  

## 4.安装pytorch
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu  

## 5.设置环境变量  
export LD_LIBRARY_PATH= cinm中编译安装的llvm路径，例如：     
export LD_LIBRARY_PATH=/home/fengjingge/tmp/Cinnamon/third-party/llvm/build/lib:$LD_LIBRARY_PATH   

## 6.设置Torch-MLIR python环境  
jupyter kernelspec remove torch-mlir-venv -y  
cd "项目根目录"  
source .venv/bin/activate  
pip install ipykernel  
python -m ipykernel install --user --name=torch-mlir-venv --display-name "Torch-MLIR (venv)"   

# 实验方法 
## 1.运行notebook
./start-notebook.sh  
终端会输出一个网址   
例如：http://localhost:8888/tree?token=30811c88b090b7758a4f40f69ec465d174bfafb90bef616b  

## 2.打开网址  
在网络浏览器打开上面的网址。选择 文件夹tutorial->notebooks  
共计包含7个测试集：  
00_intro  
01_vecadd_base  
02_vecadd_baser_run  
03_conv_test  
04_alpine_run  
05_mobilenet  
06_gemm_opt  
07_gemm_run  

## 3.执行指定脚本
点击上述特定程序后，在Jupyter中，选择内核为Torch-MLIR(venv)（右上角「Kernel」→「Change kernel」），然后重新运行代码。  

# 注意事项  
在执行build.sh中，执行git clone命令可能因为网络不稳定中途断掉，解决办法：多尝试几次 ./build.sh  


