#!/bin/bash
# LinuxGSM info_parms.sh function
# Author: Daniel Gibbs
# Website: https://gameservermanagers.com
# Description: If specific parms are not set then this will be displayed in details.

local function_selfname="$(basename $(readlink -f "${BASH_SOURCE[0]}"))"

## Examples of filtering to get info from config files
# sed 's/foo//g' - remove foo
# tr -cd '[:digit:]' leave only digits
# tr -d '=\"; ' remove selected charectors =\";
# grep -v "foo" filter out lines that contain foo

unavailable="${red}UNAVAILABLE${default}"
zero="${red}0${default}"

fn_info_parms_ark(){
	port=${port:-"0"}
	queryport=${queryport:-"0"}
	rconport=${rconport:-"0"}
	maxplayers=${maxplayers:-"0"}
}

fn_info_parms_realvirtuality(){
	port=${port:-"0"}
}

fn_info_parms_cod(){
	defaultmap=${defaultmap:-"NOT SET"}
	maxplayers=${maxplayers:-"0"}
	port=${port:-"0"}
}

fn_info_parms_dst(){
	sharding=${sharding:-"NOT SET"}
	master=${master:-"NOT SET"}
	shard=${shard:-"NOT SET"}
	cluster=${cluster:-"NOT SET"}
	cave=${cave:-"NOT SET"}

fn_info_parms_factorio(){
	port=${port:-"0"}
	rconport=${rconport:-"0"}
	rconpassword=${rconpassword:-"NOT SET"}
}

fn_info_parms_hurtworld(){
	servername=${servername:-"NOT SET"}
	port=${port:-"0"}
	queryport=${queryport:-"0"}
	maxplayers=${maxplayers:-"0"}
	defaultmap=${defaultmap:-"NOT SET"}
	creativemode=${creativemode:-"NOT SET"}
}

fn_info_parms_projectzomboid(){
	adminpassword=${adminpassword:-"NOT SET"}
}

fn_info_parms_quakeworld(){
	port=${port:-"0"}
}

fn_info_parms_quake2(){
	port=${port:-"0"}
	defaultmap=${defaultmap:-"NOT SET"}
}

fn_info_parms_source(){
	defaultmap=${defaultmap:-"NOT SET"}
	maxplayers=${maxplayers:-"0"}
	port=${port:-"0"}
	clientport=${clientport:-"0"}
}

fn_info_parms_spark(){
	defaultmap=${defaultmap:-"NOT SET"}
	maxplayers=${maxplayers:-"0"}
	port=${port:-"0"}
	queryport=$((port + 1))
	servername=${servername:-"NOT SET"}
	serverpassword=${serverpassword:-"NOT SET"}
	webadminuser=${webadminuser:-"NOT SET"}
	webadminpass=${webadminpass:-"NOT SET"}
	webadminport=${webadminport:-"0"}
	mods=${mods:-"NOT SET"}
}

fn_info_parms_unreal(){
	defaultmap=${defaultmap:-"NOT SET"}
}

# ARK: Survival Evolved
if [ "${gamename}" == "ARK: Survival Evolved" ]; then
	fn_info_parms_ark
# ARMA 3
elif [ "${engine}" == "realvirtuality" ]; then
	fn_info_parms_realvirtuality
# Call of Duty
elif [ "${gamename}" == "Call of Duty" ]||[ "${gamename}" == "Call of Duty: United Offensive" ]||[ "${engine}" == "iw2.0" ]||[ "${engine}" == "iw3.0" ]; then
	fn_info_parms_cod
# Factorio
elif [ "${gamename}" == "Factorio" ]; then
	fn_info_parms_factorio
# Project Zomboid
elif [ "${engine}" == "projectzomboid" ]; then
	fn_info_parms_projectzomboid
elif [ "${gamename}" == "QuakeWorld" ]; then
	fn_info_parms_quakeworld
elif [ "${gamename}" == "Quake 2" ]||[ "${gamename}" == "Quake 3: Arena" ]; then
	fn_info_parms_quake2
elif [ "${engine}" == "source" ]||[ "${engine}" == "goldsource" ]; then
	fn_info_parms_source
# Spark
elif [ "${engine}" == "spark" ]; then
	fn_info_parms_spark
# Unreal/Unreal 2 engine
elif [ "${engine}" == "unreal" ]||[ "${engine}" == "unreal2" ]; then
	fn_info_parms_unreal
fi
