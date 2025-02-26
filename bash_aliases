alias refresh="source ~/.bashrc"

function rdi()
{
    dir=$PWD
    cd ~/ros_catkin_ws/src
    rosdep update
    rosdep install -i -r -y --from-paths .
    cd $dir
}

function cmk()
{
    dir=$PWD
    cd ~/ros_catkin_ws
    catkin build $@ -DCMAKE_BUILD_TYPE=Release
    cd $dir
}

function search()
{
  grep "$@" -sIrnC 1 .
}

function format_c()
{
  find $@ -name "*.h" | xargs clang-format -style=file -i
  find $@ -name "*.c" | xargs clang-format -style=file -i
  find $@ -name "*.hpp" | xargs clang-format -style=file -i
  find $@ -name "*.cpp" | xargs clang-format -style=file -i
}

alias git_log="git log --all --graph --decorate"

function cb()
{
    dir=$PWD
    cd ~/ros2_ws
    if [ $# -gt 0 ]; then
        colcon build --packages-select $1 --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
    else
        colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
    fi
    . install/local_setup.bash
    cd $dir
}

alias vim="nvim"
alias vi="nvim"
alias dsp="~/dotfiles/tmux_split.sh"
alias kgzros='killall -9 gzserver gzclient roslaunch rosmaster'
alias mros_update='roslaunch brushee_motor_driver mbed_ros_lib_update.launch'

function rmaster_set()
{
    if [ $# -eq 0 ]; then
        echo "please input machine name"
    else
        export ROS_MASTER_URI=http://$1:11311
    fi
    echo "ROS_MASTER_URI is $ROS_MASTER_URI"
}

function remote_page_open()
{
    if [ $# -ne 2 ]; then
        echo "please enter whith machine name and url"
    else
        ssh -y -YC $1 -t 'export DISPLAY=0 && google-chrome $2'
    fi
}
