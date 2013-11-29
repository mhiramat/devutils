#!/bin/sh

TRACEDIR=/sys/kernel/debug/tracing

[ -f kernel-symbols ] || \
cat /proc/kallsyms | grep -i " t " | grep -v "\[" | cut -f3 -d" " | cut -f1 -d"." | sort | uniq > kernel-symbols
[ -f ftrace-symbols ] || \
cat $TRACEDIR/available_filter_functions | cut -f1 -d"." | sort > ftrace-symbols
[ -f non-ftrace-symbols ] || \
diff kernel-symbols ftrace-symbols | grep "^<" | cut -f2 -d" "  > non-ftrace-symbols

if [ ! -f probe-symbols ]; then
i=0
cat non-ftrace-symbols | while read sym; do
  echo p:e$i $sym | tee -a $TRACEDIR/kprobe_events
  i=$((i+1))
done
cat $TRACEDIR/kprobe_events | cut -f2 -d" " > probe-symbols
fi

