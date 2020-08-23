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

class RobotHeat {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.chassis_volt = null;
      this.chassis_current = null;
      this.chassis_power = null;
      this.chassis_power_buffer = null;
      this.shooter_heat = null;
    }
    else {
      if (initObj.hasOwnProperty('chassis_volt')) {
        this.chassis_volt = initObj.chassis_volt
      }
      else {
        this.chassis_volt = 0;
      }
      if (initObj.hasOwnProperty('chassis_current')) {
        this.chassis_current = initObj.chassis_current
      }
      else {
        this.chassis_current = 0;
      }
      if (initObj.hasOwnProperty('chassis_power')) {
        this.chassis_power = initObj.chassis_power
      }
      else {
        this.chassis_power = 0.0;
      }
      if (initObj.hasOwnProperty('chassis_power_buffer')) {
        this.chassis_power_buffer = initObj.chassis_power_buffer
      }
      else {
        this.chassis_power_buffer = 0;
      }
      if (initObj.hasOwnProperty('shooter_heat')) {
        this.shooter_heat = initObj.shooter_heat
      }
      else {
        this.shooter_heat = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotHeat
    // Serialize message field [chassis_volt]
    bufferOffset = _serializer.uint16(obj.chassis_volt, buffer, bufferOffset);
    // Serialize message field [chassis_current]
    bufferOffset = _serializer.uint16(obj.chassis_current, buffer, bufferOffset);
    // Serialize message field [chassis_power]
    bufferOffset = _serializer.float64(obj.chassis_power, buffer, bufferOffset);
    // Serialize message field [chassis_power_buffer]
    bufferOffset = _serializer.uint16(obj.chassis_power_buffer, buffer, bufferOffset);
    // Serialize message field [shooter_heat]
    bufferOffset = _serializer.uint16(obj.shooter_heat, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotHeat
    let len;
    let data = new RobotHeat(null);
    // Deserialize message field [chassis_volt]
    data.chassis_volt = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [chassis_current]
    data.chassis_current = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [chassis_power]
    data.chassis_power = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [chassis_power_buffer]
    data.chassis_power_buffer = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [shooter_heat]
    data.shooter_heat = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/RobotHeat';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '12a69f2d33ac7367772428034e998f18';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #robot power and heat data
    uint16 chassis_volt
    uint16 chassis_current
    float64  chassis_power
    uint16 chassis_power_buffer
    uint16 shooter_heat
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotHeat(null);
    if (msg.chassis_volt !== undefined) {
      resolved.chassis_volt = msg.chassis_volt;
    }
    else {
      resolved.chassis_volt = 0
    }

    if (msg.chassis_current !== undefined) {
      resolved.chassis_current = msg.chassis_current;
    }
    else {
      resolved.chassis_current = 0
    }

    if (msg.chassis_power !== undefined) {
      resolved.chassis_power = msg.chassis_power;
    }
    else {
      resolved.chassis_power = 0.0
    }

    if (msg.chassis_power_buffer !== undefined) {
      resolved.chassis_power_buffer = msg.chassis_power_buffer;
    }
    else {
      resolved.chassis_power_buffer = 0
    }

    if (msg.shooter_heat !== undefined) {
      resolved.shooter_heat = msg.shooter_heat;
    }
    else {
      resolved.shooter_heat = 0
    }

    return resolved;
    }
};

module.exports = RobotHeat;
