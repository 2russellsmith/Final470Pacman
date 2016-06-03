// Generated by gencpp from file sphero_swarm_node/SpheroImu.msg
// DO NOT EDIT!


#ifndef SPHERO_SWARM_NODE_MESSAGE_SPHEROIMU_H
#define SPHERO_SWARM_NODE_MESSAGE_SPHEROIMU_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <geometry_msgs/Quaternion.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Vector3.h>

namespace sphero_swarm_node
{
template <class ContainerAllocator>
struct SpheroImu_
{
  typedef SpheroImu_<ContainerAllocator> Type;

  SpheroImu_()
    : header()
    , name()
    , orientation()
    , orientation_covariance()
    , angular_velocity()
    , angular_velocity_covariance()
    , linear_acceleration()
    , linear_acceleration_covariance()  {
      orientation_covariance.assign(0.0);

      angular_velocity_covariance.assign(0.0);

      linear_acceleration_covariance.assign(0.0);
  }
  SpheroImu_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , name(_alloc)
    , orientation(_alloc)
    , orientation_covariance()
    , angular_velocity(_alloc)
    , angular_velocity_covariance()
    , linear_acceleration(_alloc)
    , linear_acceleration_covariance()  {
      orientation_covariance.assign(0.0);

      angular_velocity_covariance.assign(0.0);

      linear_acceleration_covariance.assign(0.0);
  }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;

   typedef  ::geometry_msgs::Quaternion_<ContainerAllocator>  _orientation_type;
  _orientation_type orientation;

   typedef boost::array<double, 9>  _orientation_covariance_type;
  _orientation_covariance_type orientation_covariance;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _angular_velocity_type;
  _angular_velocity_type angular_velocity;

   typedef boost::array<double, 9>  _angular_velocity_covariance_type;
  _angular_velocity_covariance_type angular_velocity_covariance;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _linear_acceleration_type;
  _linear_acceleration_type linear_acceleration;

   typedef boost::array<double, 9>  _linear_acceleration_covariance_type;
  _linear_acceleration_covariance_type linear_acceleration_covariance;




  typedef boost::shared_ptr< ::sphero_swarm_node::SpheroImu_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sphero_swarm_node::SpheroImu_<ContainerAllocator> const> ConstPtr;

}; // struct SpheroImu_

typedef ::sphero_swarm_node::SpheroImu_<std::allocator<void> > SpheroImu;

typedef boost::shared_ptr< ::sphero_swarm_node::SpheroImu > SpheroImuPtr;
typedef boost::shared_ptr< ::sphero_swarm_node::SpheroImu const> SpheroImuConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sphero_swarm_node::SpheroImu_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sphero_swarm_node::SpheroImu_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace sphero_swarm_node

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'geometry_msgs': ['/opt/ros/jade/share/geometry_msgs/cmake/../msg'], 'sphero_swarm_node': ['/home/zeta/catkin_ws/src/sphero_ros/sphero_swarm_node/msg'], 'std_msgs': ['/opt/ros/jade/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::sphero_swarm_node::SpheroImu_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sphero_swarm_node::SpheroImu_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sphero_swarm_node::SpheroImu_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sphero_swarm_node::SpheroImu_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sphero_swarm_node::SpheroImu_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sphero_swarm_node::SpheroImu_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sphero_swarm_node::SpheroImu_<ContainerAllocator> >
{
  static const char* value()
  {
    return "20ae3401bf7716c60688d084d6c356ec";
  }

  static const char* value(const ::sphero_swarm_node::SpheroImu_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x20ae3401bf7716c6ULL;
  static const uint64_t static_value2 = 0x0688d084d6c356ecULL;
};

template<class ContainerAllocator>
struct DataType< ::sphero_swarm_node::SpheroImu_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sphero_swarm_node/SpheroImu";
  }

  static const char* value(const ::sphero_swarm_node::SpheroImu_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sphero_swarm_node::SpheroImu_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Header header\n\
string name\n\
geometry_msgs/Quaternion orientation\n\
float64[9] orientation_covariance\n\
geometry_msgs/Vector3 angular_velocity\n\
float64[9] angular_velocity_covariance\n\
geometry_msgs/Vector3 linear_acceleration\n\
float64[9] linear_acceleration_covariance\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Quaternion\n\
# This represents an orientation in free space in quaternion form.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
float64 w\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Vector3\n\
# This represents a vector in free space. \n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
";
  }

  static const char* value(const ::sphero_swarm_node::SpheroImu_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sphero_swarm_node::SpheroImu_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.name);
      stream.next(m.orientation);
      stream.next(m.orientation_covariance);
      stream.next(m.angular_velocity);
      stream.next(m.angular_velocity_covariance);
      stream.next(m.linear_acceleration);
      stream.next(m.linear_acceleration_covariance);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct SpheroImu_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sphero_swarm_node::SpheroImu_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sphero_swarm_node::SpheroImu_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
    s << indent << "orientation: ";
    s << std::endl;
    Printer< ::geometry_msgs::Quaternion_<ContainerAllocator> >::stream(s, indent + "  ", v.orientation);
    s << indent << "orientation_covariance[]" << std::endl;
    for (size_t i = 0; i < v.orientation_covariance.size(); ++i)
    {
      s << indent << "  orientation_covariance[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.orientation_covariance[i]);
    }
    s << indent << "angular_velocity: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.angular_velocity);
    s << indent << "angular_velocity_covariance[]" << std::endl;
    for (size_t i = 0; i < v.angular_velocity_covariance.size(); ++i)
    {
      s << indent << "  angular_velocity_covariance[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.angular_velocity_covariance[i]);
    }
    s << indent << "linear_acceleration: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.linear_acceleration);
    s << indent << "linear_acceleration_covariance[]" << std::endl;
    for (size_t i = 0; i < v.linear_acceleration_covariance.size(); ++i)
    {
      s << indent << "  linear_acceleration_covariance[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.linear_acceleration_covariance[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // SPHERO_SWARM_NODE_MESSAGE_SPHEROIMU_H