platform='unknown';
unamestr=`uname`;

#TODO(mvv): check uname for OS X
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
   #TODO(mvv): install things other than ubuntu
   source ubuntu.sh
fi

success "detected & configured platform: $platform"
