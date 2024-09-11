2 level
$$
L1_{\text{hit}} \cdot L1_{\text{access}}+ L1_{\text{miss}} \cdot (L2_{\text{hit}} \cdot L2_{\text{access}} + L2_{\text{miss}} \cdot \text{memory}_{\text{access}})
$$



$$
L1_{\text{hit}} \cdot L1_{\text{access}}+ L1_{\text{miss}} \cdot (L2_{\text{hit}} \cdot L2_{\text{access}} + L2_{\text{miss}} \cdot (L3_{\text{hit}} \cdot L3_{\text{access}} + L3_{\text{miss}} \cdot \text{memory}_{\text{access}}))
$$

$$
0.99 \cdot 1 + 0.01 \cdot (0.65 \cdot 20 + 0.35 \cdot (0.4 \cdot 30 + 0.6 \cdot 300)) = 1.792 \text{ cycles}
$$
