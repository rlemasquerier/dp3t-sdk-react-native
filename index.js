import {NativeModules} from 'react-native';

const {RNDP3TSDK} = NativeModules;

const dp3t = {
  initialize: RNDP3TSDK.initialize,
  startTracing: RNDP3TSDK.startTracing,
  stopTracing: RNDP3TSDK.stopTracing,
};

export default dp3t;
