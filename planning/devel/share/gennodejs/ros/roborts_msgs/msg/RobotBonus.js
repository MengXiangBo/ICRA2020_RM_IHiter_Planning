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

class RobotBonus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.bonus = null;
    }
    else {
      if (initObj.hasOwnProperty('bonus')) {
        this.bonus = initObj.bonus
      }
      else {
        this.bonus = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotBonus
    // Serialize message field [bonus]
    bufferOffset = _serializer.bool(obj.bonus, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotBonus
    let len;
    let data = new RobotBonus(null);
    // Deserialize message field [bonus]
    data.bonus = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/RobotBonus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '22365d98c104f9d16cae777ed759cbfe';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #robot bonus
    bool bonus
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotBonus(null);
    if (msg.bonus !== undefined) {
      resolved.bonus = msg.bonus;
    }
    else {
      resolved.bonus = false
    }

    return resolved;
    }
};

module.exports = RobotBonus;
