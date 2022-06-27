if [ -f /opt/ros/$ROS_DISTRO/setup.bash ]; then
  . /opt/ros/$ROS_DISTRO/setup.bash
fi

export PATH=/usr/lib/ccache:/vcpkg:${PATH}
export RCUTILS_COLORIZED_OUTPUT=1