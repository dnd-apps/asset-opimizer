#!/usr/bin/bash env

log() {
  PREFIX="[Asset Optimizer][root]"
  printf "%-16s: %s\n" "${PREFIX}" "$1"
}

repeat () {
	printf %100s | tr " " "$1"
    echo ""
}

chown $(whoami) -R /assets

repeat "="
log "Asset Optimization"
log `date`
repeat "="

find . -type f \( -name "*.png"  \) -exec optipng "${OPTIPNG_ARGS-:""}" {} \; &
find . -type f \( -name "*.jpg" -o -name "*.jpeg" \) -exec jpegoptim "${JPEGOPTIM_ARGS-:"--max=90"}" {} \; &
find . -type f \( -name "*.gif"  \) -exec gifsicle "${GIFSICLE_ARGS-:"--batch --optimize"}" {} \; &

wait

repeat "="
log "Asset Optimization - Done"
log `date`
repeat "="


