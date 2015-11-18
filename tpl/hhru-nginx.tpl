upstream hhru {
	server 127.0.0.1:{{ mojo_port }};
}

server {
	listen 80;
	server_name {{ nginx_hostname }};
	access_log /var/log/nginx/{{ nginx_hostname }}.access.log;
	error_log  /var/log/nginx/{{ nginx_hostname }}.error.log;

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
