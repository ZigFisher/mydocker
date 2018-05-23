# Openwrt compilation for hisilicon SoC in docker


##1a. Pull the latest image

```bash
docker pull mdef/openwrt_hisilicon
```
##1b. Build  the image

Clone the Repo and enter the the directory.

```bash
git clone https://github.com/mdef/MyDocker.git && cd MyDocker/project_openwrt_hisilicon
```
Build image

```bash
docker build -t yourName/openwrt_hisilicon .
```

to see available parameters for build script run
```bash
docker run -it --rm mdef/openwrt_hisilicon
```
```bash
Example output:
PLEASE SELECT ONE OPTION IN COMMAND LINE

Build firmware section:
  hi3516cv1
  hi3518av1
  hi3518cv1
  hi3518ev1
  hi3516cv2
  hi3518ev2
  hi3516сv3
...

```

##Complation of openwrt image for selected platform:
```bash
docker run -it -w /src/chaos_calmer -v `pwd`/hisilicon:/src/chaos_calmer/bin --rm mdef/openwrt_hisilicon hi3516cv1
```

in case of successful build compiled firmware will be located in:
```bash
echo `pwd`/hisilicon
```
