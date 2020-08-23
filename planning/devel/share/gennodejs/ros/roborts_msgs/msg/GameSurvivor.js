// Auto-generated. Do not edit!

// (in-package roborts_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class GameSurvivor {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.red3 = null;
      this.red4 = null;
      this.blue3 = null;
      this.blue4 = null;
    }
    else {
      if (initObj.hasOwnProperty('red3')) {
        this.red3 = initObj.red3
      }
      else {
        this.red3 = false;
      }
      if (initObj.hasOwnProperty('red4')) {
        this.red4 = initObj.red4
      }
      else {
        this.red4 = false;
      }
      if (initObj.hasOwnProperty('blue3')) {
        this.blue3 = initObj.blue3
      }
      else {
        this.blue3 = false;
      }
      if (initObj.hasOwnProperty('blue4')) {
        this.blue4 = initObj.blue4
      }
      else {
        this.blue4 = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GameSurvivor
    // Serialize message field [red3]
    bufferOffset = _serializer.bool(obj.red3, buffer, bufferOffset);
    // Serialize message field [red4]
    bufferOffset = _serializer.bool(obj.red4, buffer, bufferOffset);
    // Serialize message field [blue3]
    bufferOffset = _serializer.bool(obj.blue3, buffer, bufferOffset);
    // Serialize message field [blue4]
    bufferOffset = _serializer.bool(obj.blue4, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GameSurvivor
    let len;
    let data = new GameSurvivor(null);
    // Deserialize message field [red3]
    data.red3 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [red4]
    data.red4 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [blue3]
    data.blue3 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [blue4]
    data.blue4 = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/GameSurvivor';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '48420e310835d7d79e0a1b719e881088';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #robot survival
    bool red3
    bool red4
    bool blue3
    bool blue4
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GameSurvivor(null);
    if (msg.red3 !== undefined) {
      resolved.red3 = msg.red3;
    }
    else {
      resolved.red3 = false
    }

    if (msg.red4 !== undefined) {
      resolved.red4 = msg.red4;
    }
    else {
      resolved.red4 = false
    }

    if (msg.blue3 !== undefined) {
      resolved.blue3 = msg.blue3;
    }
    else {
      resolved.blue3 = false
    }

    if (msg.blue4 !== undefined) {
      resolved.blue4 = msg.blue4;
    }
    else {
      resolved.blue4 = false
    }

    return resolved;
    }
};

module.exports = GameSurvivor;
