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

class punish {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.viPunishAreas = null;
    }
    else {
      if (initObj.hasOwnProperty('viPunishAreas')) {
        this.viPunishAreas = initObj.viPunishAreas
      }
      else {
        this.viPunishAreas = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type punish
    // Serialize message field [viPunishAreas]
    bufferOffset = _arraySerializer.int32(obj.viPunishAreas, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type punish
    let len;
    let data = new punish(null);
    // Deserialize message field [viPunishAreas]
    data.viPunishAreas = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.viPunishAreas.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'icra_nav/punish';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '901ef32caa07726292504b26e2c68f0d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[] viPunishAreas
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new punish(null);
    if (msg.viPunishAreas !== undefined) {
      resolved.viPunishAreas = msg.viPunishAreas;
    }
    else {
      resolved.viPunishAreas = []
    }

    return resolved;
    }
};

module.exports = punish;
