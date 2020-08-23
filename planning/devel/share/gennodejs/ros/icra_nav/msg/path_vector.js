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

class path_vector {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vfPositionX = null;
      this.vfPositionY = null;
    }
    else {
      if (initObj.hasOwnProperty('vfPositionX')) {
        this.vfPositionX = initObj.vfPositionX
      }
      else {
        this.vfPositionX = [];
      }
      if (initObj.hasOwnProperty('vfPositionY')) {
        this.vfPositionY = initObj.vfPositionY
      }
      else {
        this.vfPositionY = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type path_vector
    // Serialize message field [vfPositionX]
    bufferOffset = _arraySerializer.float32(obj.vfPositionX, buffer, bufferOffset, null);
    // Serialize message field [vfPositionY]
    bufferOffset = _arraySerializer.float32(obj.vfPositionY, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type path_vector
    let len;
    let data = new path_vector(null);
    // Deserialize message field [vfPositionX]
    data.vfPositionX = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [vfPositionY]
    data.vfPositionY = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.vfPositionX.length;
    length += 4 * object.vfPositionY.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'icra_nav/path_vector';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e633e5e50a58ce55b89c873561d948a7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] vfPositionX
    float32[] vfPositionY
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new path_vector(null);
    if (msg.vfPositionX !== undefined) {
      resolved.vfPositionX = msg.vfPositionX;
    }
    else {
      resolved.vfPositionX = []
    }

    if (msg.vfPositionY !== undefined) {
      resolved.vfPositionY = msg.vfPositionY;
    }
    else {
      resolved.vfPositionY = []
    }

    return resolved;
    }
};

module.exports = path_vector;
