nate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bar_main 2>&1 | tee -a /tmp/polybar1.log & disown
polybar bar_side 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
