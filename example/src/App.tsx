import * as React from 'react';

import { StyleSheet, View } from 'react-native';
import { AudioGraphView } from 'react-native-audio-graph';

export default function App() {
  return (
    <View style={styles.container}>
      <AudioGraphView
        accessible
        accessibilityLabel={'Inner audio graph view'}
        color="#32a852"
        style={styles.box}
        title={'Test graph title'}
        summary={'Text graph summary'}
        xTitle={'x axis title'}
        xValues={[1, 2, 3, 4, 5]}
        yTitle={'y axis title'}
        yValues={[0, 2, 20, -5, 0]}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
