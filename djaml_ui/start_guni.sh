APPNAME=djaml_ui
APPDIR=/home/ubuntu/django-mobile/django-ml-site/djaml_ui/

LOGFILE=$APPDIR'gunicorn.log'
ERRORFILE=$APPDIR'gunicorn-error.log'

NUM_WORKERS=3

ADDRESS=127.0.0.1:8000

cd $APPDIR

source ~/.bashrc

exec gunicorn $APPNAME.wsgi:application \
	-w $NUM_WORKERS --bind=$ADDRESS \
	--log-level=debug \
	--log-file=$LOGFILE 2>>$LOGFILE  1>>$ERRORFILE &
