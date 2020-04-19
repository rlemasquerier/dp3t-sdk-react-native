import {NativeModules} from 'react-native';

const {RNDP3TSDK} = NativeModules;

const dp3t = {
  initialize: RNDP3TSDK.initialize,
  startTracing: RNDP3TSDK.startTracing,
  stopTracing: RNDP3TSDK.stopTracing,
  status: RNDP3TSDK.status,
  sync: RNDP3TSDK.sync,
};

export default dp3t;
