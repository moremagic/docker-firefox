if [ -n "$SSH_CONNECTION" ] ; then
    if test `who | grep $USER  2> /dev/null | wc -l` -eq 1;
    then
        while [ 1 ]
        do
            exec=""
            for pid in $( ps auxw | grep $USER | grep "dbus\|ibus" | grep -v grep|awk '{print $2}' ) ;
            do
                kill $pid 2> /dev/null
                exec="1"
            done
            if [ -z "$exec" ] ; then
                exit;
            fi
        done
    fi
fi

