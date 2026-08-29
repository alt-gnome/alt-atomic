# Force colored history/fish_delta output even if $LESS is preconfigured.

if status is-interactive; and not set -q __onyx_less_fixed
    set -gx LESS $LESS --RAW-CONTROL-CHARS
    set -gx __onyx_less_fixed 1
end
