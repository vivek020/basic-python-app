    upstream app_servers {

        server pyapp:8000;
        # server 127.0.0.1:8081;
        # ..
        # .

    }

    # Configuration for Nginx
    server {

        # Running port
        listen 80;
        server_name  pyapp.com;
        # Settings to serve static files 
        location ^~ /static/  {

            # Example:
            # root /full/path/to/application/static/file/dir;
            root /app/static/;

        }

        # Serve a static file (ex. favico)
        # outside /static directory
        location = /favico.ico  {

            root /app/favico.ico;

        }

        # Proxy connections to the application servers
        # app_servers
        location / {

            proxy_pass         http://app_servers;
            proxy_redirect     off;
            proxy_set_header   Host $host;
            proxy_set_header   X-Real-IP $remote_addr;
            proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header   X-Forwarded-Host $server_name;

        }
    }
