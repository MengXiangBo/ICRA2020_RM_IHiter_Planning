// Auto-generated. Do not edit!

// (in-package roborts_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ObstacleMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.obstacles = null;
      this.ids = null;
      this.orientations = null;
      this.velocities = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('obstacles')) {
        this.obstacles = initObj.obstacles
      }
      else {
        this.obstacles = [];
      }
      if (initObj.hasOwnProperty('ids')) {
        this.ids = initObj.ids
      }
      else {
        this.ids = [];
      }
      if (initObj.hasOwnProperty('orientations')) {
        this.orientations = initObj.orientations
      }
      else {
        this.orientations = [];
      }
      if (initObj.hasOwnProperty('velocities')) {
        this.velocities = initObj.velocities
      }
      else {
        this.velocities = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObstacleMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [obstacles]
    // Serialize the length for message field [obstacles]
    bufferOffset = _serializer.uint32(obj.obstacles.length, buffer, bufferOffset);
    obj.obstacles.forEach((val) => {
      bufferOffset = geometry_msgs.msg.PolygonStamped.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [ids]
    bufferOffset = _arraySerializer.uint32(obj.ids, buffer, bufferOffset, null);
    // Serialize message field [orientations]
    // Serialize the length for message field [orientations]
    bufferOffset = _serializer.uint32(obj.orientations.length, buffer, bufferOffset);
    obj.orientations.forEach((val) => {
      bufferOffset = geometry_msgs.msg.QuaternionStamped.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [velocities]
    // Serialize the length for message field [velocities]
    bufferOffset = _serializer.uint32(obj.velocities.length, buffer, bufferOffset);
    obj.velocities.forEach((val) => {
      bufferOffset = geometry_msgs.msg.TwistWithCovariance.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObstacleMsg
    let len;
    let data = new ObstacleMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [obstacles]
    // Deserialize array length for message field [obstacles]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.obstacles = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.obstacles[i] = geometry_msgs.msg.PolygonStamped.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [ids]
    data.ids = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    // Deserialize message field [orientations]
    // Deserialize array length for message field [orientations]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.orientations = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.orientations[i] = geometry_msgs.msg.QuaternionStamped.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [velocities]
    // Deserialize array length for message field [velocities]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.velocities = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.velocities[i] = geometry_msgs.msg.TwistWithCovariance.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.obstacles.forEach((val) => {
      length += geometry_msgs.msg.PolygonStamped.getMessageSize(val);
    });
    length += 4 * object.ids.length;
    object.orientations.forEach((val) => {
      length += geometry_msgs.msg.QuaternionStamped.getMessageSize(val);
    });
    length += 336 * object.velocities.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/ObstacleMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a537b0b7fce70da7b78c2df042f56aa2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Message that contains a list of polygon shaped obstacles.
    # Special types:
    # Polygon with 1 vertex: Point obstacle
    # Polygon with 2 vertices: Line obstacle
    # Polygon with more than 2 vertices: First and last points are assumed to be connected
    #
    # If optional properties (orientaions or velocities) are provided,
    # each container size must match the number of obstacles
    # otherwise let them empty.
    
    
    std_msgs/Header header
    
    # Actual obstacle positions (polygon descriptions)
    geometry_msgs/PolygonStamped[] obstacles
    
    # Obstacle IDs [optional]
    # Specify IDs in order to provide (temporal) relationships
    # between obstacles among multiple messages.
    # If provided it must be size(ids) = size(obstacles)
    uint32[] ids
    
    # Individual orientations (centroid) [optional]
    # If provided it must be size(orientations) = size(obstacles) 
    geometry_msgs/QuaternionStamped[] orientations
    
    # Individual velocities (centroid) [optional]
    # If provided it must be size(velocities) = size(obstacles)
    geometry_msgs/TwistWithCovariance[] velocities
    
    
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
    
    ================================================================================
    MSG: geometry_msgs/PolygonStamped
    # This represents a Polygon with reference coordinate frame and timestamp
    Header header
    Polygon polygon
    
    ================================================================================
    MSG: geometry_msgs/Polygon
    #A specification of a polygon where the first and last points are assumed to be connected
    Point32[] points
    
    ================================================================================
    MSG: geometry_msgs/Point32
    # This contains the position of a point in free space(with 32 bits of precision).
    # It is recommeded to use Point wherever possible instead of Point32.  
    # 
    # This recommendation is to promote interoperability.  
    #
    # This message is designed to take up less space when sending
    # lots of points at once, as in the case of a PointCloud.  
    
    float32 x
    float32 y
    float32 z
    ================================================================================
    MSG: geometry_msgs/QuaternionStamped
    # This represents an orientation with reference coordinate frame and timestamp.
    
    Header header
    Quaternion quaternion
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: geometry_msgs/TwistWithCovariance
    # This expresses velocity in free space with uncertainty.
    
    Twist twist
    
    # Row-major representation of the 6x6 covariance matrix
    # The orientation parameters use a fixed-axis representation.
    # In order, the parameters are:
    # (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
    float64[36] covariance
    
    ================================================================================
    MSG: geometry_msgs/Twist
    # This expresses velocity in free space broken into its linear and angular parts.
    Vector3  linear
    Vector3  angular
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ObstacleMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.obstacles !== undefined) {
      resolved.obstacles = new Array(msg.obstacles.length);
      for (let i = 0; i < resolved.obstacles.length; ++i) {
        resolved.obstacles[i] = geometry_msgs.msg.PolygonStamped.Resolve(msg.obstacles[i]);
      }
    }
    else {
      resolved.obstacles = []
    }

    if (msg.ids !== undefined) {
      resolved.ids = msg.ids;
    }
    else {
      resolved.ids = []
    }

    if (msg.orientations !== undefined) {
      resolved.orientations = new Array(msg.orientations.length);
      for (let i = 0; i < resolved.orientations.length; ++i) {
        resolved.orientations[i] = geometry_msgs.msg.QuaternionStamped.Resolve(msg.orientations[i]);
      }
    }
    else {
      resolved.orientations = []
    }

    if (msg.velocities !== undefined) {
      resolved.velocities = new Array(msg.velocities.length);
      for (let i = 0; i < resolved.velocities.length; ++i) {
        resolved.velocities[i] = geometry_msgs.msg.TwistWithCovariance.Resolve(msg.velocities[i]);
      }
    }
    else {
      resolved.velocities = []
    }

    return resolved;
    }
};

module.exports = ObstacleMsg;
