---
name: teach
description: Build an interactive, animated, standalone HTML lesson. Use whenever I ask you to teach me something, explain how something works so I can learn it, or say I want to learn or understand a topic.
---

# Teach

Make one self-contained HTML file that gets me to a working mental model fast.

## File

- Save it as `learn/<topic-slug>.html` under the current working directory and give me the path. It is a personal artifact: never stage or commit it.
- One file, no network: inline CSS and vanilla JS, inline SVG or `<canvas>`. No CDNs, frameworks, fonts or images from outside.
- Works in light and dark (`prefers-color-scheme`), and at laptop width.

## Lesson shape

1. **The one-sentence idea** at the top, and why it matters.
2. **An animated model of the mechanism**: show what actually moves (data, state, messages, time), not decoration. Controls: play/pause, step forward/back, reset, and a speed slider. Arrow keys step.
3. **Let me poke it**: sliders, toggles or inputs that change the model's parameters so I can see cause and effect.
4. **Build up in stages**: start with the simplest case, then add one complication per stage (tabs or a stepper), each with two or three sentences of text.
5. **Bridge to what I know**: I am a Java developer; where it helps, compare with the Java equivalent and call out where the analogy breaks.
6. **Pitfalls**: the two or three mistakes people make with it.
7. **Check yourself**: three to five questions that test understanding, not recall, each revealing its answer and explanation on click.

Keep text short; the animation carries the explanation. Prefer a correct simplification over a complete one, and say what was simplified.

## Before handing over

- Extract the script and run `node --check` on it if Node is available; otherwise say the JS was not checked.
- Say that the file was not opened in a browser, unless it was.
