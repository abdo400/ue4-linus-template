# ue4-linux-template
UE4 linux template

## Docker

How to run a game server via Docker:

```bash 
docker run -p 42000:42000/udp -p 43000:43000/udp <image> main --variable port.game=42000 --variable port.query=43000
```

### Parameters 

| Argument    | Default | Comment                                                                                                      |
|-------------|---------|--------------------------------------------------------------------------------------------------------------|
| -Port       |         | game server port, this is auto set by gameye
| -QueryPort  |         | game server query port, this is auto set by gameye                                                               
