# @see : http://lewandowski.io/2016/10/fish-env/
function posix-source
  for i in (cat $argv)
    set name (echo $i | awk -F= '{print $1}')
    set value (echo $i | awk -F= '{print $2}')
    if test "$name"
      set -gx $name $value
    end
  end
end
