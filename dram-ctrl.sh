#!/bin/bash

declare -a arr=("disparity-cif-solo" "mser-cif-solo" "sift-cif-solo" "svm-cif-solo" "texture_synthesis-cif-solo" "disparity-cif-3b4096-budfr" "mser-cif-3b4096-budfr" "sift-cif-3b4096-budfr" "svm-cif-3b4096-budfr" "texture_synthesis-cif-3b4096-budfr" "disparity-cif-3b4096-mdu" "mser-cif-3b4096-mdu" "sift-cif-3b4096-mdu" "svm-cif-3b4096-mdu" "texture_synthesis-cif-3b4096-mdu" "disparity-cif-3b4096-dma" "mser-cif-3b4096-dma" "sift-cif-3b4096-dma" "svm-cif-3b4096-dma" "texture_synthesis-cif-3b4096-dma" "disparity-cif-3b4096-dmt98" "mser-cif-3b4096-dmt98" "sift-cif-3b4096-dmt98" "svm-cif-3b4096-dmt98" "texture_synthesis-cif-3b4096-dmt98" "disparity-cif-3b4096-dmt90" "mser-cif-3b4096-dmt90" "sift-cif-3b4096-dmt90" "svm-cif-3b4096-dmt90" "texture_synthesis-cif-3b4096-dmt90")

disk_image_path=$(realpath ../full_system_images/disks/linux-arm-ael.img)
kernel_path=$(realpath ../gem5-linux/vmlinux)

for i in "${arr[@]}"
do
     gnome-terminal -x bash -c "./build/ARM/gem5.opt -d ../results/dram-ctrl --stats-file=$i.txt configs/spec2006/simpoint_fs.py --cfg=configs/spec2006/arm.cfg --disk-image=${disk_image_path} --num-cpus=4 --mem-size=2048MB --kernel=${kernel_path} --machine-type=VExpress_EMM --mem-type=lpddr2_s4_1066_x32 --simpoint-mode=batch --benchmark=$i --checkpoint-dir=m5out/cpt.7846767145000"
done
