# react-native-audio-graph
An empty view with a simple mapping of props to the native AXChart protocol, to support audio graphs on iOS via Voiceover.

**Note:** This is the first thing I've ever published to npm, and very much an alpha. Expect breaking changes in minor updates as long as the major version remains `0`. Android is completely untested so far and probably crashes if it even builds. Ideally this library would be transparent on Android and simply return a `<View/>'.

## Installation

```sh
npm install react-native-audio-graph
```

## Usage


```tsx
import { AudioGraphView } from "react-native-audio-graph";

// ...

<AudioGraphView
  accessible
  accessibilityLabel={'Test graph title'}
  style={styles.box}
  title={'Test graph title'}
  summary={'Text graph summary'}
  xTitle={'x axis title'}
  xValues={[1, 2, 3, 4, 5]}
  yTitle={'y axis title'}
  yValues={[0, 2, 20, -5, 0]}
>
  ... some inner content (i.e., a non-audio graph) ...
</AudioGraphView>
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
