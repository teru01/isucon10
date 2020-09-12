#!/bin/bash

cd "${0%/*}"
curl -s http://localhost:<port>/debug/pprof/profile?seconds=60 > $1/cpu.pprof
go tool pprof -png $1/cpu.pprof > $1/cpu.png
