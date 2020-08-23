// Auto-generated. Do not edit!

// (in-package roborts_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ShootInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.remain_bullet = null;
      this.sent_bullet = null;
      this.fric_wheel_run = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('remain_bullet')) {
        this.remain_bullet = initObj.remain_bullet
      }
      else {
        this.remain_bullet = 0;
      }
      if (initObj.hasOwnProperty('sent_bullet')) {
        this.sent_bullet = initObj.sent_bullet
      }
      else {
        this.sent_bullet = 0;
      }
      if (initObj.hasOwnProperty('fric_wheel_run')) {
        this.fric_wheel_run = initObj.fric_wheel_run
      }
      else {
        this.fric_wheel_run = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ShootInfo
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [remain_bullet]
    bufferOffset = _serializer.int16(obj.remain_bullet, buffer, bufferOffset);
    // Serialize message field [sent_bullet]
    bufferOffset = _serializer.int16(obj.sent_bullet, buffer, bufferOffset);
    // Serialize message field [fric_wheel_run]
    bufferOffset = _serializer.bool(obj.fric_wheel_run, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ShootInfo
    let len;
    let data = new ShootInfo(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [remain_bullet]
    data.remain_bullet = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [sent_bullet]
    data.sent_bullet = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [fric_wheel_run]
    data.fric_wheel_run = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/ShootInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c71a8c5d03eafbb3be3f4aa0410b8278';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    #Remain bullets number
    int16 remain_bullet
    
    #Bullets fired number
    int16 sent_bullet
    
    #Friction running status
    bool fric_wheel_run
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    # 0: no frame
    # 1: global frame
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ShootInfo(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.remain_bullet !== undefined) {
      resolved.remain_bullet = msg.remain_bullet;
    }
    else {
      resolved.remain_bullet = 0
    }

    if (msg.sent_bullet !== undefined) {
      resolved.sent_bullet = msg.sent_bullet;
    }
    else {
      resolved.sent_bullet = 0
    }

    if (msg.fric_wheel_run !== undefined) {
      resolved.fric_wheel_run = msg.fric_wheel_run;
    }
    else {
      resolved.fric_wheel_run = false
    }

    return resolved;
    }
};

module.exports = ShootInfo;
