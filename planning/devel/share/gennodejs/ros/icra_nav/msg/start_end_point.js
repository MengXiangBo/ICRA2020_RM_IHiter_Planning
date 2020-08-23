// Auto-generated. Do not edit!

// (in-package icra_nav.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class start_end_point {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.flStartX = null;
      this.flStartY = null;
      this.flEndX = null;
      this.flEndY = null;
    }
    else {
      if (initObj.hasOwnProperty('flStartX')) {
        this.flStartX = initObj.flStartX
      }
      else {
        this.flStartX = 0.0;
      }
      if (initObj.hasOwnProperty('flStartY')) {
        this.flStartY = initObj.flStartY
      }
      else {
        this.flStartY = 0.0;
      }
      if (initObj.hasOwnProperty('flEndX')) {
        this.flEndX = initObj.flEndX
      }
      else {
        this.flEndX = 0.0;
      }
      if (initObj.hasOwnProperty('flEndY')) {
        this.flEndY = initObj.flEndY
      }
      else {
        this.flEndY = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type start_end_point
    // Serialize message field [flStartX]
    bufferOffset = _serializer.float32(obj.flStartX, buffer, bufferOffset);
    // Serialize message field [flStartY]
    bufferOffset = _serializer.float32(obj.flStartY, buffer, bufferOffset);
    // Serialize message field [flEndX]
    bufferOffset = _serializer.float32(obj.flEndX, buffer, bufferOffset);
    // Serialize message field [flEndY]
    bufferOffset = _serializer.float32(obj.flEndY, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type start_end_point
    let len;
    let data = new start_end_point(null);
    // Deserialize message field [flStartX]
    data.flStartX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [flStartY]
    data.flStartY = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [flEndX]
    data.flEndX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [flEndY]
    data.flEndY = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'icra_nav/start_end_point';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7b46825f0775aab6934c6297120354ac';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 flStartX
    float32 flStartY
    float32 flEndX
    float32 flEndY
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new start_end_point(null);
    if (msg.flStartX !== undefined) {
      resolved.flStartX = msg.flStartX;
    }
    else {
      resolved.flStartX = 0.0
    }

    if (msg.flStartY !== undefined) {
      resolved.flStartY = msg.flStartY;
    }
    else {
      resolved.flStartY = 0.0
    }

    if (msg.flEndX !== undefined) {
      resolved.flEndX = msg.flEndX;
    }
    else {
      resolved.flEndX = 0.0
    }

    if (msg.flEndY !== undefined) {
      resolved.flEndY = msg.flEndY;
    }
    else {
      resolved.flEndY = 0.0
    }

    return resolved;
    }
};

module.exports = start_end_point;
