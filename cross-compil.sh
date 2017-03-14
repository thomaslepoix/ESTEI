#!/bin/bash

#exit status:
#0	ok
#1	syntax problem
#2	problem with sources
#3	missing dependances
#4	error occured, check status.log and prompt.log

dir=$(pwd)
norm="\\033[0m"
bold="\\033[1m"
unli="\\033[4m"
red="\\033[31m"
gren="\\033[32m"
yell="\\033[33m"
blue="\\033[36m"



#no args
	if [ $# = 0 ]
		then 
		echo "cross-compil.sh : missing arguments"
		echo -e "type ${yell}./cross-compil.sh --help${norm} for more informations"
		exit 1
	fi



#resize prompt
	if [ "$(echo $* | grep -o "\-\-help\|\-\-version\|\-\-status")" ]
		then
		newcols=$(tput cols)
		newlines=$(tput lines)
		if [ $newcols -lt 82 ]
		then newcols=82
		fi
		if [ $newlines -lt 27 ]
		then newlines=27
		fi
		echo -e "\033[8;${newlines};${newcols}t"
		sleep 0.05s
	fi



#functions
	cols=$(tput cols)
	lines=$(tput lines)
	midline=$(( $(tput cols) /2 ))

	#echo centered
	function echox {
		echo -en `tput hpa $(( ($(tput cols)-$(echo "${#1}")) /2 ))`"$1"`tput hpa $(tput cols)`; }

	#echo tab $1;$2;$3=var $3;$4;$6=characters from midline D=backward C=forward
	function echot { 
		if [ $2 ] ; then t1=$2 ; else t1=D ; fi
		if [ $4 ] ; then t2=$4 ; else t2=C ; fi
		if [ $6 ] ; then t3=$6 ; else t3=C ; fi
		echo -en "`tput hpa $midline`\033[$t1"$1"`tput hpa $midline`\033[$t2"$3"`tput hpa $midline`\033[$t3"$5"`tput hpa $cols`" ; }

	#echo 'done' right aligned
	function echod {
		tput hpa $cols
		echo -en "\b\b\b\b\b\b\b[ ${gren}DONE${norm} ]" 
		tput cud1 ; }

	#echo 'fail' right aligned
	function echof {
		tput hpa $cols
		echo -en "\b\b\b\b\b\b\b[ ${red}FAIL${norm} ]"
		tput cud1 ; }

	#check exit status $1=$? $2='log message' $3='screen message'
	function check {
		echo -e "$1\t: "$2"" >&1
		echo -e "$1\t: "$2"" >&3
		if [ $1 = 0 ]
			then
			echo -ne "$3 :" >&4 ; echod >&4
		else
			echo -ne "$3 :" >&4 ; echof >&4
			if [ $block ] ; then exit 4 ; fi
		fi ; }




#--help
	if [ $(echo $* | grep -wo "\-\-help") ]
		then
		echo -en "${yell}" ; seq -s'#' 0 $cols | tr -d '[:digit:]' ; echo -en "${norm}"
		echo -en "${yell}#${norm}${unli}" ; echox 'cross-compil.sh --help' ; echo -e "${norm}${yell}#${norm}"

		for d in $(seq 2)
		do echo -en "${yell}#${norm}" ; tput hpa $cols ; echo -e "${yell}#${norm}"
		done

		echo -en "${yell}#${norm}" ; echot '--help' 35D 'Show this menu.' 15D ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot '--version' 35D 'Show source versions and dependencies needed' 15D ; tput hpa $cols ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot 'to build crosstool chain.' 15D ; tput hpa $cols ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot '--status' 35D 'Show exit status.' 15D ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot '--download' 35D 'Download sources.' 15D ; tput hpa $cols ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot '--sources=<path/>' 35D 'Use archives from this directory.' 15D ; tput hpa $cols ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot 'You must run --version to check paquets needed.' 15D ; tput hpa $cols ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot '--output=<path/>' 35D 'Buid crosstool chain in this directory.' 15D ; tput hpa $cols ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot '--log' 35D 'Redirect all output and error messages in prompt.log.' 15D ; tput hpa $cols ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot 'Exit status are always redirected to status.log.' 15D ; tput hpa $cols ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot '--verbose' 35D 'Show all output end error messages.' 15D ; tput hpa $cols ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot '--quiet' 35D 'Dont return anything in the prompt.' 15D ; tput hpa $cols ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot '--block' 35D 'The program stops if an error occurs.' 15D ; tput hpa $cols ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot '--interactive' 35D 'Ask you to press a key between each step.' 15D ; tput hpa $cols ; echo -e "${yell}#${norm}"

		for d in $(seq $(($lines-20)))
		do echo -en "${yell}#${norm}" ; tput hpa $cols ; echo -e "${yell}#${norm}"
		done

		echo -en "${yell}" ; seq -s'#' 0 $cols | tr -d '[:digit:]' ; echo -en "${norm}"
		tput el1
		exit 0
	fi



#--version
	if [ $(echo $* | grep -wo "\-\-version") ]
		then
		echo -en "${yell}" ; seq -s'#' 0 $cols | tr -d '[:digit:]' ; echo -en "${norm}"
		echo -en "${yell}#${norm}${unli}" ; echox 'cross-compil.sh --version' ; echo -e "${norm}${yell}#${norm}"

		for d in $(seq 2)
		do echo -en "${yell}#${norm}" ; tput hpa $cols ; echo -e "${yell}#${norm}"
		done

		echo -en "${yell}#${norm}" ; echot 'Here are the source paquets you need to get to build the' 30D ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot 'crosstool chain and the dependencies you have to get installed' 30D ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot 'on your computer. To install missing dependencies, use your' 30D ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot 'paquet manager.' 30D ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot 'You can download source paquets by yourself and use the' 30D ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot "${yell}--sources=<path/to/archives/>${norm} argument." 30D ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot 'Or you can let the script do it for you by using the' 30D ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot "${yell}--download${norm} argument." 30D ; echo -e "${yell}#${norm}"

		for d in $(seq 2)
		do echo -en "${yell}#${norm}" ; tput hpa $cols ; echo -e "${yell}#${norm}"
		done

		echo -en "${yell}#${norm}${unli}" ; echot "sources paquets" 20D "dependencies" 10C ; echo -e "${norm}${yell}#${norm}"

		echo -en "${yell}#${norm}" ; tput hpa $cols ; echo -e "${yell}#${norm}"

		echo -en "${yell}#${norm}" ; echot 'binutils-2.22.tar.*' 20D "build-essential" 10C ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot 'gcc-4.7.3.tar.*' 20D "gawk" 10C ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot 'glibc-2.19.tar.*' 20D "libmpc-dev" 10C ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot 'gmp-5.0.5.tar.*' 20D ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot 'mpfr-3.1.1.tar.*' 20D ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot 'linux-3.5.3.tar.*' 20D ; echo -e "${yell}#${norm}"

		for d in $(seq $(($lines-24)))
		do echo -en "${yell}#${norm}" ; tput hpa $cols ; echo -e "${yell}#${norm}"
		done

		echo -en "${yell}" ; seq -s'#' 0 $cols | tr -d '[:digit:]' ; echo -en "${norm}"
		tput el1
		exit 0
	fi



#--status
	if [ $(echo $* | grep -wo "\-\-status") ]
		then
		echo -en "${yell}" ; seq -s'#' 0 $cols | tr -d '[:digit:]' ; echo -en "${norm}"
		echo -en "${yell}#${norm}${unli}" ; echox 'cross-compil.sh --status' ; echo -e "${norm}${yell}#${norm}"

		for d in $(seq 2)
		do echo -en "${yell}#${norm}" ; tput hpa $cols ; echo -e "${yell}#${norm}"
		done

		echo -en "${yell}#${norm}${unli}" ; echox 'exit status' ; echo -e "${norm}${yell}#${norm}"

		for d in $(seq 2)
		do echo -en "${yell}#${norm}" ; tput hpa $cols ; echo -e "${yell}#${norm}"
		done

		echo -en "${yell}#${norm}" ; echot '0' 15D ':' 10D 'Ok.' 5D ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot '1' 15D ':' 10D 'Syntax problem.' 5D ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot '2' 15D ':' 10D 'Problem with sources.' 5D ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot '3' 15D ':' 10D 'Missing dependences.' 5D ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot '4' 15D ':' 10D 'An error occured, you can check' 5D ; echo -e "${yell}#${norm}"
		echo -en "${yell}#${norm}" ; echot 'status.log and prompt.log.' 5D ; echo -e "${yell}#${norm}"

		for d in $(seq $(($lines-15)))
		do echo -en "${yell}#${norm}" ; tput hpa $cols ; echo -e "${yell}#${norm}"
		done

		echo -en "${yell}" ; seq -s'#' 0 $cols | tr -d '[:digit:]' ; echo -en "${norm}"
		tput el1
		exit 0
	fi



#--sources & --download
	if [ "$(echo $* | grep -o "\-\-download\|\-\-sources=" | wc -w)" != 1 ]
		then
		echo -e "error : you shall type ${yell}one${norm} of those arguments : ${yell}--download${norm} ; ${yell}--sources=<path>${norm}"
		echo -e "type ${yell}./cross-compil.sh --help${norm} for more informations"
		exit 1
	elif [ $(echo $* | grep -wo "\-\-download") ]
		then src="download"
	else 
		archivedir=$(echo "$(for i in $(seq 1 $#) ; do eval "echo \$$i" ; done )" | grep "\-\-sources=.*" | sed s/'\-\-sources='/''/g)
		if [ -z $archivedir ] ; then archivedir=. ; fi
		if [[ -d $archivedir && -r $archivedir ]]
			then src="sources"
			cd $archivedir
			archivedir=$(pwd)
			cd $dir

			#source check
			if [ -z "$(ls $archivedir | grep 'binutils-2.22.tar.*')" ]
				then echo -e "error : ${yell}binutils-2.22.tar.*${norm} not found in ${yell}${archivedir}${norm}"
				exit 2
				fi
			if [ -z "$(ls $archivedir | grep 'gcc-4.7.3.tar.*')" ]
				then echo -e "error : ${yell}gcc-4.7.3.tar.*${norm} not found in ${yell}${archivedir}${norm}"
				exit 2
				fi
			if [ -z "$(ls $archivedir | grep 'glibc-2.19.tar.*')" ]
				then echo -e "error : ${yell}glibc-2.19.tar.*${norm} not found in ${yell}${archivedir}${norm}"
				exit 2
				fi
			if [ -z "$(ls $archivedir | grep 'gmp-5.0.5.tar.*')" ]
				then echo -e "error : ${yell}gmp-5.0.5.tar.*${norm} not found in ${yell}${archivedir}${norm}"
				exit 2
				fi
			if [ -z "$(find $archivedir -name 'mpfr-3.1.1.tar.*')" ]
				then echo -e "error : ${yell}mpfr-3.1.1.tar.*${norm} not found in ${yell}${archivedir}${norm}"
				exit 2
				fi
			if [ -z "$(find $archivedir -name 'linux-3.5.3.tar.*')" ]
				then echo -e "error : ${yell}linux-3.5.3.tar.*${norm} not found in ${yell}${archivedir}${norm}"
				exit 2
			fi
		else echo -e "error : source directory ${yell}${archivedir}${norm} is not valid, maybe it doesnt exist or you dont have rights to read it"
			echo -e "type ${yell}./cross-compil.sh --help${norm} for more informations"
			exit 1
		fi
	fi



#--output
	if [ "$(echo $* | grep -wo "\-\-output=" | wc -w)" != 1 ]
		then echo -e "error : you shall enter ${yell}one${norm} output directory : ${yell}--output=<path>${norm}" 
		echo -e "type ${yell}./cross-compil.sh --help${norm} for more informations"
		exit 1
	else
		outdir=$(echo "$(for i in $(seq 1 $#) ; do eval "echo \$$i" ; done )" | grep "\-\-output=.*" | sed s/'\-\-output='/''/g)
		if [ -z $outdir ] ; then outdir=. ; fi
		if [[ -d $outdir && -w $outdir ]]
			then :
		else echo -e "error : output directory ${yell}${outdir}${norm} is not valid, maybe it doesnt exist or you dont have rights to write in it"
			echo -e "type ${yell}./cross-compil.sh --help${norm} for more informations"
			exit 1
		fi
	fi



#dependences check
	if [ -z "$(dpkg --list | grep 'build-essential')" ]
		then echo -e "error : missing dependencie, please install ${yell}build-essential${norm}"
		exit 3
		fi
	if [ -z "$(dpkg --list | grep 'gawk')" ]
		then echo -e "error : missing dependencie, please install ${yell}gawk${norm}"
		exit 3
		fi
	if [ -z "$(dpkg --list | grep 'libmpc-dev')" ]
		then echo -e "error : missing dependencie, please install ${yell}libmpc-dev${norm}"
		exit 3
		fi



#--block
	if [ $(echo $* | grep -wo '\-\-block') ]
		then
		block=1
	fi



#--interactive
	if [ $(echo $* | grep -wo '\-\-interactive') ]
		then
		ask="echo -e Press ${yell}ENTER${norm} to continue >"
		wait="read"
	fi



#--verbose & --quiet & --log
	prompt=$(tty)

	if [ $(echo $* | grep -wo '\-\-quiet') ] && [ $(echo $* | grep -wo '\-\-verbose') ]
		then
		echo -e "error : ${yell}--verbose${norm} and ${yell}--quiet${norm} are incompatibles"
		echo -e "type ${yell}./cross-compil.sh --help${norm} for more informations"
		exit 1
	elif [ $(echo $* | grep -wo '\-\-log') ] && [ $(echo $* | grep -wo '\-\-verbose') ]
		then
		echo -e "error : ${yell}--log${norm} and ${yell}--verbose${norm} are incompatibles"
		echo -e "type ${yell}./cross-compil.sh --help${norm} for more informations"
		exit 1
	elif [ $(echo $* | grep -wo '\-\-log') ] && [ $(echo $* | grep -wo '\-\-quiet') ]
		then
		stdout="prompt.log"
		stderr="prompt.log"
		fd4=/dev/null
	elif [ $(echo $* | grep -wo '\-\-log') ]
		then
		stdout="prompt.log"
		stderr="prompt.log"
		fd4=$prompt
	elif [ $(echo $* | grep -wo '\-\-verbose') ]
		then
		stdout=$prompt
		stderr=$prompt
		fd4=$prompt
	elif [ $(echo $* | grep -wo '\-\-quiet') ]
		then
		stdout=/dev/null
		stderr=/dev/null
		fd4=/dev/null
	else
		stdout=/dev/null
		stderr=/dev/null
		fd4=$prompt
	fi

	exec 1>$stdout
	exec 2>>$stderr
	exec 3>status.log
	exec 4>$fd4



#archivedir=<path>
#outdir=<path>
#src={download;sources}
#block={NULL;1}
#ask={NULL;echo 'press ENTER to continue'}
#wait={NULL,read}
################################################################################

date >&3 ; echo -e "${yell}$(date)${norm}" >&4
echo "$0 $@" >&3
$ask >&4 ; $wait



#build arborescence
	cd $outdir
	outdir=$(pwd)
	mkdir -p crosstool/{build/,arm/sysroot/,sources/archives/}
	 check $? "Build arborescence" "Build arborescence"
	cd crosstool/

#set environnement variables
	export SRCDIR="${outdir}/crosstool/sources"
	export BUILDDIR="${outdir}/crosstool/build"
	export INSTALLDIR="${outdir}/crosstool/arm"
	export SYSROOTDIR="${outdir}/crosstool/arm/sysroot"
	export TARGET="arm-none-linux-gnueabi"		#arch-détail-os-type de bibliothèque libc
	export BUILD="x86_64-pc-linux-gnu"			#uname
	export THREADS="$(egrep -c 'processor' /proc/cpuinfo)"
	echo "SRCDIR : $SRCDIR" >&3 ; echo -e "${blue}SRCDIR${norm} : ${blue}$SRCDIR${norm}" >&4
	echo "BUILDDIR : $BUILDDIR" >&3 ; echo -e "${blue}BUILDDIR${norm} : ${blue}$BUILDDIR${norm}" >&4
	echo "INSTALLDIR : $INSTALLDIR" >&3 ; echo -e "${blue}INSTALLDIR${norm} : ${blue}$INSTALLDIR${norm}" >&4
	echo "SYSROOTDIR : $SYSROOTDIR" >&3 ; echo -e "${blue}SYSROOTDIR${norm} : ${blue}$SYSROOTDIR${norm}" >&4
	echo "TARGET : $TARGET" >&3 ; echo -e "${blue}TARGET${norm} : ${blue}$TARGET${norm}" >&4
	echo "BUILD : $BUILD" >&3 ; echo -e "${blue}BUILD${norm} : ${blue}$BUILD${norm}" >&4
	echo "TREADS : $THREADS" >&3 ; echo -e "${blue}TREADS${norm} : ${blue}$THREADS${norm}" >&4



#sources from web
	if [ $src = download ]
		then
		cd sources/archives/
		wget ftp://ftp.gnu.org/gnu/binutils/binutils-2.22.tar.bz2
		 check $? "Download binutils-2.22.tar.bz2" "Download binutils-2.22.tar.bz2" ; $ask >&4 ; $wait
		wget ftp://ftp.gnu.org/gnu/gcc/gcc-4.7.3/gcc-4.7.3.tar.bz2
		 check $? "Download gcc-4.7.3.tar.bz2" "Download gcc-4.7.3.tar.bz2" ; $ask >&4 ; $wait
		wget ftp://ftp.gnu.org/gnu/glibc/glibc-2.19.tar.xz
		 check $? "Download glibc-2.19.tar.xz" "Download glibc-2.19.tar.xz" ; $ask >&4 ; $wait
		wget ftp://ftp.gnu.org/gnu/gmp/gmp-5.0.5.tar.xz
		 check $? "Download gmp-5.0.5.tar.xz" "Download gmp-5.0.5.tar.xz" ; $ask >&4 ; $wait
		wget ftp://ftp.gnu.org/gnu/mpfr/mpfr-3.1.1.tar.xz
		 check $? "Download mpfr-3.1.1.tar.xz" "Download mpfr-3.1.1.tar.xz" ; $ask >&4 ; $wait
		wget https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.5.3.tar.xz
		 check $? "Download linux-3.5.3.tar.xz" "Download linux-3.5.3.tar.xz" ; $ask >&4 ; $wait
	fi

#sources from disk
	if [ $src = sources ]
		then
		cp $archivedir/$(ls $archivedir | grep 'binutils-2.22.tar.*') sources/archives/
		 check $? "Copy binutils-2.22.tar.* from $archivedir" "Copy binutils-2.22.tar.* from $archivedir" ; $ask >&4 ; $wait
		cp $archivedir/$(ls $archivedir | grep 'gcc-4.7.3.tar.*') sources/archives/
		 check $? "Copy gcc-4.7.3.tar.* from $archivedir" "Copy gcc-4.7.3.tar.* from $archivedir" ; $ask >&4 ; $wait
		cp $archivedir/$(ls $archivedir | grep 'glibc-2.19.tar.*') sources/archives/
		 check $? "Copy glibc-2.19.tar.* from $archivedir" "Copy glibc-2.19.tar.* from $archivedir" ; $ask >&4 ; $wait
		cp $archivedir/$(ls $archivedir | grep 'gmp-5.0.5.tar.*') sources/archives/
		 check $? "Copy gmp-5.0.5.tar.* from $archivedir" "Copy gmp-5.0.5.tar.* from $archivedir" ; $ask >&4 ; $wait
		cp $archivedir/$(ls $archivedir | grep 'mpfr-3.1.1.tar.*') sources/archives/
		 check $? "Copy mpfr-3.1.1.tar.* from $archivedir" "Copy mpfr-3.1.1.tar.* from $archivedir" ; $ask >&4 ; $wait
		cp $archivedir/$(ls $archivedir | grep 'linux-3.5.3.*') sources/archives/
		 check $? "Copy linux-3.5.3.tar.* from $archivedir" "Copy linux-3.5.3.tar.* from $archivedir" ; $ask >&4 ; $wait
	fi

#untar source archives
	cd $SRCDIR
	for i in archives/*
		do tar -xvf $i
		 check $? "Untar $i" "Untar $i" ; $ask >&4 ; $wait
	done



#binutils
	cd $BUILDDIR
	mkdir binutils/ && cd binutils/
	../../sources/binutils-2.22/configure \
				--disable-werror \
				--build=$BUILD \
				--target=$TARGET \
				--with-sysroot=$SYSROOTDIR \
				--prefix=$INSTALLDIR
	 check $? "configure binutils" "Configure binutils" ; $ask >&4 ; $wait
	make
	 check $? "make binutils" "Make binutils" ; $ask >&4 ; $wait
	make install
	 check $? "make install binutils" "Install binutils" ; $ask >&4 ; $wait



#kernel headers
	cd $SRCDIR/linux-3.5.3/
	make mrproper
	make ARCH=arm integrator_defconfig
	 check $? "make integrator_defconfig" "Kernel-headers : set ARM-integrator architecture" ; $ask >&4 ; $wait
	make ARCH=arm headers_check
	 check $? "make check kernel-headers" "Check kernel-headers" ; $ask >&4 ; $wait
	make ARCH=arm INSTALL_HDR_PATH=$INSTALLDIR/sysroot/usr headers_install
	 check $? "make install kernel-headers" "Install kernel-headers" ; $ask >&4 ; $wait



#gcc bootstrap
	cd $BUILDDIR
	mkdir gcc-bootstrap/ && cd gcc-bootstrap/
	../../sources/gcc-4.7.3/configure \
					--build=$BUILD \
					--host=$BUILD \
					--target=$TARGET \
					--prefix=$INSTALLDIR \
					--enable-bootstrap \
					--without-headers \
					--enable-languages=c \
					--disable-threads \
					--enable-__cxa_atexit \
					--disable-libmudflap \
					--with-gnu-ld \
					--with-gnu-as \
					--disable-libssp \
					--disable-libgomp \
					--disable-nls \
					--disable-shared
	 check $? "configure gcc-bootstrap" "Configure gcc-bootstrap" ; $ask >&4 ; $wait
	make all-gcc install-gcc
	 check $? "make all-gcc install-gcc" "make all-gcc install-gcc" ; $ask >&4 ; $wait
	make all-target-libgcc install-target-libgcc
	 check $? "make all-target-libgcc install-target-libgcc" "make all-target-libgcc install-target-libgcc" ; $ask >&4 ; $wait



#glibc headers
	cd $INSTALLDIR/lib/gcc/arm-none-linux-gnueabi/4.7.3/
	ln -s libgcc.a libgcc_sh.a
	 check $? "ln -s libgcc.a libgcc_sh.a" "Symbolic link libgcc_sh.a to libgcc.a" ; $ask >&4 ; $wait

	cd $BUILDDIR
	mkdir libc-headers/ && cd libc-headers/
	export CROSS=arm-none-linux-gnueabi
	export CC=${CROSS}-gcc
	export LD=${CROSS}-ld
	export AS=${CROSS}-as
	export PATH=$INSTALLDIR/bin:$PATH
	echo "CROSS : $CROSS" >&3 ; echo -e "${blue}CROSS${norm} : ${blue}$CROSS${norm}" >&4
	echo "CC : $CC" >&3 ; echo -e "${blue}CC${norm} : ${blue}$CC${norm}" >&4
	echo "LD : $LD" >&3 ; echo -e "${blue}LD${norm} : ${blue}$LD${norm}" >&4
	echo "AS : $AS" >&3 ; echo -e "${blue}AS${norm} : ${blue}$AS${norm}" >&4
	echo "PATH : $PATH" >&3 ; echo -e "${blue}PATH${norm} : ${blue}$PATH${norm}" >&4
	echo "libc_cv_forced_unwind=yes" > config.cache
	echo "libc_cv_c_cleanup=yes" >> config.cache

	../../sources/glibc-2.19/configure \
					--build=$BUILD \
					--host=$TARGET \
					--prefix=$SYSROOTDIR \
					--with-headers=$SYSROOTDIR/usr/include \
					--config-cache \
					--enable-add-ons=ports,nptl \
					--enable-kernel=3.5.3
	 check $? "configure glibc-headers" "Configure glibc-headers" ; $ask >&4 ; $wait
	make -k install-headers cross_compiling=yes install_root=$SYSROOTDIR
	 check $? "make install glibc-headers" "Install glibc-headers" ; $ask >&4 ; $wait

	cd $INSTALLDIR/lib/gcc/arm-none-linux-gnueabi/4.7.3/
	ln -s libgcc.a libgcc_eh.a
	 check $? "ln -s libgcc.a libgcc_sh.a" "Symbolic link libgcc_eh.a to libgcc.a" ; $ask >&4 ; $wait
	ln -s libgcc.a libgcc_s.a
	 check $? "ln -s libgcc.a libgcc_sh.a" "Symbolic link libgcc_s.a to libgcc.a" ; $ask >&4 ; $wait



#glibc
	cd $BUILDDIR
	mkdir glibc/ && cd glibc/
	echo "libc_cv_forced_unwind=yes" > config.cache
	echo "libc_cv_c_cleanup=yes" >> config.cache

	../../sources/glibc-2.19/configure \
					--build=$BUILD \
					--host=$TARGET \
					--prefix=/usr \
					--with-headers=$SYSROOTDIR/usr/include \
					--config-cache \
					--enable-add-ons=ports,nptl \
					--enable-kernel=3.5.3
	 check $? "configure glibc" "Configure glibc" ; $ask >&4 ; $wait
	make
	 check $? "make glibc" "Make glibc" ; $ask >&4 ; $wait
	make install_root=$SYSROOTDIR install
	 check $? "make install glibc" "Install glibc" ; $ask >&4 ; $wait



#gcc intermediate
	cd $BUILDDIR
	mkdir gcc-intermediate/ && cd gcc-intermediate/

	unset CROSS
	unset CC
	unset AS
	unset LD
	echo "CROSS : $CROSS" >&3 ; echo -e "${blue}CROSS${norm} : ${blue}$CROSS${norm}" >&4
	echo "CC : $CC" >&3 ; echo -e "${blue}CC${norm} : ${blue}$CC${norm}" >&4
	echo "LD : $LD" >&3 ; echo -e "${blue}LD${norm} : ${blue}$LD${norm}" >&4
	echo "AS : $AS" >&3 ; echo -e "${blue}AS${norm} : ${blue}$AS${norm}" >&4
	echo "libc_cv_forced_unwind=yes" > config.cache
	echo "libc_cv_c_cleanup=yes" >> config.cache

	../../sources/gcc-4.7.3/configure \
					--build=$BUILD \
					--target=$TARGET \
					--prefix=$INSTALLDIR \
					--with-sysroot=$SYSROOTDIR \
					--enable-languages=c \
					--with-gnu-as \
					--with-gnu-ld \
					--disable-multilib \
					--with-float=soft \
					--disable-sjlj-exceptions \
					--disable-nls \
					--enable-threads=posix \
					--enable-long-longx
	 check $? "configure gcc-intermediate" "Configure gcc-intermediate" ; $ask >&4 ; $wait
	make all-gcc
	 check $? "make all-gcc gcc-intermediate" "Make gcc-intermediate" ; $ask >&4 ; $wait
	make install-gcc
	 check $? "make install-gcc gcc-intermediate" "Install gcc-intermediate" ; $ask >&4 ; $wait



#gmp
	cd $BUILDDIR
	mkdir gmp/ && cd gmp/

	export CROSS=arm-none-linux-gnueabi
	export CC=${CROSS}-gcc
	export LD=${CROSS}-ld
	export AS=${CROSS}-as
	export CFLAGS=-static
	echo "CROSS : $CROSS" >&3 ; echo -e "${blue}CROSS${norm} : ${blue}$CROSS${norm}" >&4
	echo "CC : $CC" >&3 ; echo -e "${blue}CC${norm} : ${blue}$CC${norm}" >&4
	echo "LD : $LD" >&3 ; echo -e "${blue}LD${norm} : ${blue}$LD${norm}" >&4
	echo "AS : $AS" >&3 ; echo -e "${blue}AS${norm} : ${blue}$AS${norm}" >&4
	echo "CFLAGS : $CFLAGS" >&3 ; echo -e "${blue}CFLAGS${norm} : ${blue}$CFLAGS${norm}" >&4

	../../sources/gmp-5.0.5/configure \
					--build=$BUILD \
					--host=$TARGET \
					--prefix=$INSTALLDIR \
					--disable-shared
	 check $? "configure gmp" "Configure gmp" ; $ask >&4 ; $wait
	make
	 check $? "make gmp" "Make gmp" ; $ask >&4 ; $wait
	make install
	 check $? "make install gmp" "Install gmp" ; $ask >&4 ; $wait



#mpfr
	cd $BUILDDIR
	mkdir mpfr/ && cd mpfr/
	../../sources/gmp-5.0.5/configure \
					--build=$BUILD \
					--host=$TARGET \
					--prefix=$INSTALLDIR \
					--with-gmp=$INSTALLDIR
	 check $? "configure mpfr" "Configure mpfr" ; $ask >&4 ; $wait
	make
	 check $? "make mpfr" "Make mpfr" ; $ask >&4 ; $wait
	make install
	 check $? "make install mpfr" "Install mpfr" ; $ask >&4 ; $wait



#gcc final
	cd $BUILDDIR
	mkdir gcc-final/ && cd gcc-final/

	unset CROSS
	unset CC
	unset AS
	unset LD
	unset CFLAGS
	export CC=gcc
	echo "CROSS : $CROSS" >&3 ; echo -e "${blue}CROSS${norm} : ${blue}$CROSS${norm}" >&4
	echo "CC : $CC" >&3 ; echo -e "${blue}CC${norm} : ${blue}$CC${norm}" >&4
	echo "LD : $LD" >&3 ; echo -e "${blue}LD${norm} : ${blue}$LD${norm}" >&4
	echo "AS : $AS" >&3 ; echo -e "${blue}AS${norm} : ${blue}$AS${norm}" >&4
	echo "CFLAGS : $CFLAGS" >&3 ; echo -e "${blue}CFLAGS${norm} : ${blue}$CFLAGS${norm}" >&4
	echo "libc_cv_forced_unwind=yes" > config.cache
	echo "libc_cv_c_cleanup" >> config.cache

	../../sources/gcc-4.7.3/configure \
					--build=$BUILD \
					--target=$TARGET \
					--prefix=$INSTALLDIR \
					--with-sysroot=$SYSROOTDIR \
					--enable-languages=c \
					--with-gnu-ld \
					--with-gnu-as \
					--disable-multilib \
					--with-float=soft \
					--disable-sjls-exceptions \
					--disable-nls \
					--enable-threads=posix \
					--disable-libmudflap \
					--disable-libssp \
					--enable-long-longx \
					--with-shared \
					--with-gmp=$INSTALLDIR \
					--with-mpfr=$INSTALLDIR 
	 check $? "configure gcc-final" "Configure gcc-final" ; $ask >&4 ; $wait
	make
	 check $? "make gcc-final" "Make gcc-final" ; $ask >&4 ; $wait
	make install
	 check $? "make install gcc-final" "Install gcc-final"



#done
date >&3 ; echo -e "${yell}$(date)${norm}" >&4
exit 0
