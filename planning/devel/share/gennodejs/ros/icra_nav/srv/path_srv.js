// Auto-generated. Do not edit!

// (in-package icra_nav.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class path_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vfPathPositionX = null;
      this.vfPathPositionY = null;
      this.viPathIndex = null;
    }
    else {
      if (initObj.hasOwnProperty('vfPathPositionX')) {
        this.vfPathPositionX = initObj.vfPathPositionX
      }
      else {
        this.vfPathPositionX = [];
      }
      if (initObj.hasOwnProperty('vfPathPositionY')) {
        this.vfPathPositionY = initObj.vfPathPositionY
      }
      else {
        this.vfPathPositionY = [];
      }
      if (initObj.hasOwnProperty('viPathIndex')) {
        this.viPathIndex = initObj.viPathIndex
      }
      else {
        this.viPathIndex = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type path_srvRequest
    // Serialize message field [vfPathPositionX]
    bufferOffset = _arraySerializer.float32(obj.vfPathPositionX, buffer, bufferOffset, null);
    // Serialize message field [vfPathPositionY]
    bufferOffset = _arraySerializer.float32(obj.vfPathPositionY, buffer, bufferOffset, null);
    // Serialize message field [viPathIndex]
    bufferOffset = _arraySerializer.uint32(obj.viPathIndex, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type path_srvRequest
    let len;
    let data = new path_srvRequest(null);
    // Deserialize message field [vfPathPositionX]
    data.vfPathPositionX = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [vfPathPositionY]
    data.vfPathPositionY = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [viPathIndex]
    data.viPathIndex = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.vfPathPositionX.length;
    length += 4 * object.vfPathPositionY.length;
    length += 4 * object.viPathIndex.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'icra_nav/path_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6e2339f584c26947579f6b280c3d715f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] vfPathPositionX
    float32[] vfPathPositionY
    uint32[] viPathIndex
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new path_srvRequest(null);
    if (msg.vfPathPositionX !== undefined) {
      resolved.vfPathPositionX = msg.vfPathPositionX;
    }
    else {
      resolved.vfPathPositionX = []
    }

    if (msg.vfPathPositionY !== undefined) {
      resolved.vfPathPositionY = msg.vfPathPositionY;
    }
    else {
      resolved.vfPathPositionY = []
    }

    if (msg.viPathIndex !== undefined) {
      resolved.viPathIndex = msg.viPathIndex;
    }
    else {
      resolved.viPathIndex = []
    }

    return resolved;
    }
};

class path_srvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.boSuccess = null;
    }
    else {
      if (initObj.hasOwnProperty('boSuccess')) {
        this.boSuccess = initObj.boSuccess
      }
      else {
        this.boSuccess = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type path_srvResponse
    // Serialize message field [boSuccess]
    bufferOffset = _serializer.bool(obj.boSuccess, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type path_srvResponse
    let len;
    let data = new path_srvResponse(null);
    // Deserialize message field [boSuccess]
    data.boSuccess = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'icra_nav/path_srvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eca856ee71f824332e753aaa50c58161';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool boSuccess
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new path_srvResponse(null);
    if (msg.boSuccess !== undefined) {
      resolved.boSuccess = msg.boSuccess;
    }
    else {
      resolved.boSuccess = false
    }

    return resolved;
    }
};

module.exports = {
  Request: path_srvRequest,
  Response: path_srvResponse,
  md5sum() { return '9252540c61646001ef1bfd31da90b1cc'; },
  datatype() { return 'icra_nav/path_srv'; }
};
