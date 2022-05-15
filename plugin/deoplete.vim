" deoplete
let g:deoplete#enable_at_startup = 1
augroup cpp-path
    autocmd!
    autocmd FileType cpp setlocal path=.,/usr/include,/usr/local/include,/opt/ros/noetic/include,/home/ros_catkin_ws/devel/include
augroup END

