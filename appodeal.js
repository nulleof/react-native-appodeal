'use strict';

import {
    NativeModules,
    DeviceEventEmitter,
} from "react-native";

const Appodeal = NativeModules.Appodeal;

const eventHandlers = {
    onSizeChange: new Map(),
};

const addEventListener = (type, handler) => {
    switch (type) {
        case 'onSizeChange':
            eventHandlers[type].set(handler, DeviceEventEmitter.addListener(type, handler));
            break;
        default:
            console.log(`Event with type ${type} does not exist.`);
    }
}

const removeEventListener = (type, handler) => {
    if (!eventHandlers[type].has(handler)) {
        return;
    }
    eventHandlers[type].get(handler).remove();
    eventHandlers[type].delete(handler);
}

const removeAllListeners = () => {
    DeviceEventEmitter.removeAllListeners('onSizeChange');
};

module.exports = {
    ...Appodeal,
    addEventListener,
    removeEventListener,
    removeAllListeners,
};