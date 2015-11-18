upstream hhru {
	server 127.0.0.1:8883;
}

server {
	listen 80;
	server_name scm-01.mozgam.net;
	access_log /var/log/nginx/hhru.access.log;
	error_log  /var/log/nginx/hhru.error.log;

	location / {
		proxy_pass http://hhru;
		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection "upgrade";
		proxy_set_header Host $host;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-HTTPS 0;
	}
}
