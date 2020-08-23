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

class RobotDamage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.damage_type = null;
      this.damage_source = null;
    }
    else {
      if (initObj.hasOwnProperty('damage_type')) {
        this.damage_type = initObj.damage_type
      }
      else {
        this.damage_type = 0;
      }
      if (initObj.hasOwnProperty('damage_source')) {
        this.damage_source = initObj.damage_source
      }
      else {
        this.damage_source = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotDamage
    // Serialize message field [damage_type]
    bufferOffset = _serializer.uint8(obj.damage_type, buffer, bufferOffset);
    // Serialize message field [damage_source]
    bufferOffset = _serializer.uint8(obj.damage_source, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotDamage
    let len;
    let data = new RobotDamage(null);
    // Deserialize message field [damage_type]
    data.damage_type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [damage_source]
    data.damage_source = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/RobotDamage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'effef5d3b7e81a8189f62bb1e64ada64';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #robot damage
    uint8 ARMOR = 0
    uint8 OFFLINE = 1
    uint8 EXCEED_HEAT = 2
    uint8 EXCEED_POWER = 3
    uint8 damage_type
    uint8 FORWARD = 0
    uint8 LEFT = 1
    uint8 BACKWARD = 2
    uint8 RIGHT = 3
    uint8 damage_source
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotDamage(null);
    if (msg.damage_type !== undefined) {
      resolved.damage_type = msg.damage_type;
    }
    else {
      resolved.damage_type = 0
    }

    if (msg.damage_source !== undefined) {
      resolved.damage_source = msg.damage_source;
    }
    else {
      resolved.damage_source = 0
    }

    return resolved;
    }
};

// Constants for message
RobotDamage.Constants = {
  ARMOR: 0,
  OFFLINE: 1,
  EXCEED_HEAT: 2,
  EXCEED_POWER: 3,
  FORWARD: 0,
  LEFT: 1,
  BACKWARD: 2,
  RIGHT: 3,
}

module.exports = RobotDamage;
