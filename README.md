# Experimental Suricata Training Environment

## Requirements

This training environment requires Docker and Docker compose. These can be
installed on Windows, Mac and Linux with Docker Desktop:
https://www.docker.com/products/personal/

If on Linux, Docker and Docker-Compose are likely available from your
package manager.

## Setup

First clone this git repository:

```
git clone https://github.com/jasonish/experimental-suricata-training
```

> **_NOTE:__ Depending on how you installed docker the command might
> be `docker-compose` or `docker compose`.

Then docker-compose up:

```
cd experimental-suricata-training
docker-compose up
```

To access the training environment CLI:

```
docker-compose exec suricata bash
```

To access EveBox for visual event display go to http://localhost:5636 with a
browser on your machine.

## Replaying a PCAP

To replay a PCAP first enter the training environment CLI (see above),
then run the following command:

```
./suri-replay-pcap.sh ../pcaps/purplefox-exploit-kit-with-powershell-payloads.pcap
```
