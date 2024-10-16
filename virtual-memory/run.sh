for nloops in 8 9 10 11 12 13; do
    for npages in 4 8 16 32 64; do
        number=$((10 ** nloops))
        echo -n "10^"$nloops $npages " "
        ./tlb  "$npages" "$number"
    done
done