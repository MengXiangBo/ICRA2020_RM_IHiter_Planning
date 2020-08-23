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

class ShootState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.single_shoot = null;
      this.continue_shoot = null;
      this.run_friction_whell = null;
      this.friction_whell_speed = null;
    }
    else {
      if (initObj.hasOwnProperty('single_shoot')) {
        this.single_shoot = initObj.single_shoot
      }
      else {
        this.single_shoot = 0;
      }
      if (initObj.hasOwnProperty('continue_shoot')) {
        this.continue_shoot = initObj.continue_shoot
      }
      else {
        this.continue_shoot = 0;
      }
      if (initObj.hasOwnProperty('run_friction_whell')) {
        this.run_friction_whell = initObj.run_friction_whell
      }
      else {
        this.run_friction_whell = 0;
      }
      if (initObj.hasOwnProperty('friction_whell_speed')) {
        this.friction_whell_speed = initObj.friction_whell_speed
      }
      else {
        this.friction_whell_speed = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ShootState
    // Serialize message field [single_shoot]
    bufferOffset = _serializer.int32(obj.single_shoot, buffer, bufferOffset);
    // Serialize message field [continue_shoot]
    bufferOffset = _serializer.int32(obj.continue_shoot, buffer, bufferOffset);
    // Serialize message field [run_friction_whell]
    bufferOffset = _serializer.int32(obj.run_friction_whell, buffer, bufferOffset);
    // Serialize message field [friction_whell_speed]
    bufferOffset = _serializer.int32(obj.friction_whell_speed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ShootState
    let len;
    let data = new ShootState(null);
    // Deserialize message field [single_shoot]
    data.single_shoot = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [continue_shoot]
    data.continue_shoot = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [run_friction_whell]
    data.run_friction_whell = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [friction_whell_speed]
    data.friction_whell_speed = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/ShootState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '36f858c917904d9229bf553ee5e21890';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 single_shoot
    int32 continue_shoot
    int32 run_friction_whell
    int32 friction_whell_speed
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ShootState(null);
    if (msg.single_shoot !== undefined) {
      resolved.single_shoot = msg.single_shoot;
    }
    else {
      resolved.single_shoot = 0
    }

    if (msg.continue_shoot !== undefined) {
      resolved.continue_shoot = msg.continue_shoot;
    }
    else {
      resolved.continue_shoot = 0
    }

    if (msg.run_friction_whell !== undefined) {
      resolved.run_friction_whell = msg.run_friction_whell;
    }
    else {
      resolved.run_friction_whell = 0
    }

    if (msg.friction_whell_speed !== undefined) {
      resolved.friction_whell_speed = msg.friction_whell_speed;
    }
    else {
      resolved.friction_whell_speed = 0
    }

    return resolved;
    }
};

module.exports = ShootState;
