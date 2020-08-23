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

class RobotStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.level = null;
      this.remain_hp = null;
      this.max_hp = null;
      this.heat_cooling_limit = null;
      this.heat_cooling_rate = null;
      this.gimbal_output = null;
      this.chassis_output = null;
      this.shooter_output = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('level')) {
        this.level = initObj.level
      }
      else {
        this.level = 0;
      }
      if (initObj.hasOwnProperty('remain_hp')) {
        this.remain_hp = initObj.remain_hp
      }
      else {
        this.remain_hp = 0;
      }
      if (initObj.hasOwnProperty('max_hp')) {
        this.max_hp = initObj.max_hp
      }
      else {
        this.max_hp = 0;
      }
      if (initObj.hasOwnProperty('heat_cooling_limit')) {
        this.heat_cooling_limit = initObj.heat_cooling_limit
      }
      else {
        this.heat_cooling_limit = 0;
      }
      if (initObj.hasOwnProperty('heat_cooling_rate')) {
        this.heat_cooling_rate = initObj.heat_cooling_rate
      }
      else {
        this.heat_cooling_rate = 0;
      }
      if (initObj.hasOwnProperty('gimbal_output')) {
        this.gimbal_output = initObj.gimbal_output
      }
      else {
        this.gimbal_output = false;
      }
      if (initObj.hasOwnProperty('chassis_output')) {
        this.chassis_output = initObj.chassis_output
      }
      else {
        this.chassis_output = false;
      }
      if (initObj.hasOwnProperty('shooter_output')) {
        this.shooter_output = initObj.shooter_output
      }
      else {
        this.shooter_output = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotStatus
    // Serialize message field [id]
    bufferOffset = _serializer.uint8(obj.id, buffer, bufferOffset);
    // Serialize message field [level]
    bufferOffset = _serializer.uint8(obj.level, buffer, bufferOffset);
    // Serialize message field [remain_hp]
    bufferOffset = _serializer.uint16(obj.remain_hp, buffer, bufferOffset);
    // Serialize message field [max_hp]
    bufferOffset = _serializer.uint16(obj.max_hp, buffer, bufferOffset);
    // Serialize message field [heat_cooling_limit]
    bufferOffset = _serializer.uint16(obj.heat_cooling_limit, buffer, bufferOffset);
    // Serialize message field [heat_cooling_rate]
    bufferOffset = _serializer.uint16(obj.heat_cooling_rate, buffer, bufferOffset);
    // Serialize message field [gimbal_output]
    bufferOffset = _serializer.bool(obj.gimbal_output, buffer, bufferOffset);
    // Serialize message field [chassis_output]
    bufferOffset = _serializer.bool(obj.chassis_output, buffer, bufferOffset);
    // Serialize message field [shooter_output]
    bufferOffset = _serializer.bool(obj.shooter_output, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotStatus
    let len;
    let data = new RobotStatus(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [level]
    data.level = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [remain_hp]
    data.remain_hp = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [max_hp]
    data.max_hp = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [heat_cooling_limit]
    data.heat_cooling_limit = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [heat_cooling_rate]
    data.heat_cooling_rate = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [gimbal_output]
    data.gimbal_output = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [chassis_output]
    data.chassis_output = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [shooter_output]
    data.shooter_output = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/RobotStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '122334534857c1294574d2c7eef57af5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #robot status
    uint8 id
    uint8 level
    uint16 remain_hp
    uint16 max_hp
    uint16 heat_cooling_limit
    uint16 heat_cooling_rate
    bool gimbal_output
    bool chassis_output
    bool shooter_output
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotStatus(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.level !== undefined) {
      resolved.level = msg.level;
    }
    else {
      resolved.level = 0
    }

    if (msg.remain_hp !== undefined) {
      resolved.remain_hp = msg.remain_hp;
    }
    else {
      resolved.remain_hp = 0
    }

    if (msg.max_hp !== undefined) {
      resolved.max_hp = msg.max_hp;
    }
    else {
      resolved.max_hp = 0
    }

    if (msg.heat_cooling_limit !== undefined) {
      resolved.heat_cooling_limit = msg.heat_cooling_limit;
    }
    else {
      resolved.heat_cooling_limit = 0
    }

    if (msg.heat_cooling_rate !== undefined) {
      resolved.heat_cooling_rate = msg.heat_cooling_rate;
    }
    else {
      resolved.heat_cooling_rate = 0
    }

    if (msg.gimbal_output !== undefined) {
      resolved.gimbal_output = msg.gimbal_output;
    }
    else {
      resolved.gimbal_output = false
    }

    if (msg.chassis_output !== undefined) {
      resolved.chassis_output = msg.chassis_output;
    }
    else {
      resolved.chassis_output = false
    }

    if (msg.shooter_output !== undefined) {
      resolved.shooter_output = msg.shooter_output;
    }
    else {
      resolved.shooter_output = false
    }

    return resolved;
    }
};

module.exports = RobotStatus;
