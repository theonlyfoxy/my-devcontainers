if [ -f /opt/ros/$ROS_DISTRO/setup.bash ]; then
  . /opt/ros/$ROS_DISTRO/setup.bash
fi

export PATH=/usr/lib/ccache:${PATH}
export RCUTILS_COLORIZED_OUTPUT=1