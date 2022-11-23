# Microsoft SQL server in Docker

Some helpful scripts and configurations to easily get a Microsoft SQL server
instance running in a docker container on Linux.

This project uses Microsoft's docker image for SQL server and uses
docker-compose to easily manage container configurations.

## Requirements

- Linux operating system
- Docker
- Docker composer

## Usage

- Clone repository (`git clone https://github.com/macleysousa/docker-mssql-server-2017.git; cd docker-compose-mssql`)
- Configure password in `docker-compose.yml` file.
- Start the container (`docker-compose up -d`)

To stop the container, use the `docker-compose stop` script.

Log in on the database with your credentials:

- User: `sa`
- Password: `Docker.SQL.Server.2017` (default)

## License

This project is released under the GNU GPL-3.0 license. Check out the [LICENSE](LICENSE) file for more information.
