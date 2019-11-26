
# Map caps lock key to escape because caps lock sucks...
defaults -currentHost write -g com.apple.keyboard.modifiermapping.1452-832-0 -array \
'<dict>
    <key>HIDKeyboardModifierMappingDst</key>
    <real>30064771113</real>
    <key>HIDKeyboardModifierMappingSrc</key>
    <real>30064771129</real>
</dict>'