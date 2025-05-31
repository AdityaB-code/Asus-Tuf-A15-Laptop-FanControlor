#!/bin/bash
# Script to enable fan curves in performance mode using asusctl

echo "⚙️ Enabling fan curves for Performance profile..."
asusctl fan-curve --mod-profile performance --enable-fan-curves true
echo "✅ Fan curves enabled."
echo "Now, Go to Rog-Fan-Control!"
