# Alpine image with BIRD
This is basic lightweight Alpine image with installed BIRD routing daemon.
# Usage
Create your own docker-compose.yml file:
```yaml
services:
  bird:
    image: stakly/bird:latest
    restart: unless-stopped
    environment:
      # optionally create separated directory with configuration files
      - CFG_DIR=/etc/bird
      - TZ=Asia/Yekaterinburg
    volumes:
      # bind directory for configurations into container
      - ./bird:/etc/bird
    ports:
      - 179:179
```
Optionally create separated directory with configuration files:
```shell
user@host~# mkdir bird
user@host~# cd bird
```
Create your configuration file `bird.conf` in this directory:
```
log syslog all;
protocol device {
}
protocol direct {
	disabled;		# Disable by default
	ipv4;			# Connect to default IPv4 table
	ipv6;			# ... and to default IPv6 table
}
protocol kernel {
	ipv4 {			# Connect protocol to IPv4 table by channel
	     export all;	# Export to protocol. default is export none
	};
}
protocol kernel {
	ipv6 { export all; };
}
protocol static {
	ipv4;			# Again, IPv4 channel with default options
}
```
Run container:
```shell
user@host~# docker compose up -d
```
