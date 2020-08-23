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

class BonusStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.red_bonus = null;
      this.blue_bonus = null;
    }
    else {
      if (initObj.hasOwnProperty('red_bonus')) {
        this.red_bonus = initObj.red_bonus
      }
      else {
        this.red_bonus = 0;
      }
      if (initObj.hasOwnProperty('blue_bonus')) {
        this.blue_bonus = initObj.blue_bonus
      }
      else {
        this.blue_bonus = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BonusStatus
    // Serialize message field [red_bonus]
    bufferOffset = _serializer.uint8(obj.red_bonus, buffer, bufferOffset);
    // Serialize message field [blue_bonus]
    bufferOffset = _serializer.uint8(obj.blue_bonus, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BonusStatus
    let len;
    let data = new BonusStatus(null);
    // Deserialize message field [red_bonus]
    data.red_bonus = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [blue_bonus]
    data.blue_bonus = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/BonusStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '45f50b5ec6e45c780298e74c42177aa1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #bonus zone status
    uint8 UNOCCUPIED = 0
    uint8 BEING_OCCUPIED= 1
    uint8 OCCUPIED = 2
    uint8 red_bonus
    uint8 blue_bonus
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BonusStatus(null);
    if (msg.red_bonus !== undefined) {
      resolved.red_bonus = msg.red_bonus;
    }
    else {
      resolved.red_bonus = 0
    }

    if (msg.blue_bonus !== undefined) {
      resolved.blue_bonus = msg.blue_bonus;
    }
    else {
      resolved.blue_bonus = 0
    }

    return resolved;
    }
};

// Constants for message
BonusStatus.Constants = {
  UNOCCUPIED: 0,
  BEING_OCCUPIED: 1,
  OCCUPIED: 2,
}

module.exports = BonusStatus;
