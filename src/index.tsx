import {
  requireNativeComponent,
  UIManager,
  Platform,
  ViewProps,
  ViewStyle,
} from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-audio-graph' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

interface AudioGraphProps extends ViewProps {
  style: ViewStyle;

  title: string;
  summary: string;
  xTitle: string;
  xValues: ReadonlyArray<number>;
  yTitle: string;
  yValues: ReadonlyArray<number>;
}

const ComponentName = 'AudioGraphView';

export const AudioGraphView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<AudioGraphProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };
