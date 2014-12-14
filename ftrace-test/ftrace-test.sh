#!/bin/sh

cd /sys/kernel/debug/tracing

while read event sym; do
  echo pribing $sym
  echo 1 > events/`echo $event | cut -f2 -d: `/enable
  sleep 0.1
done < kprobe_events
