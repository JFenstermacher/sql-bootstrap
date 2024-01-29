# SQL Practice Bootstrap

This repository contains a basic docker postgreSQL bootstrap
with helper commands to make creating / connecting and running queries easy.

## Prerequisites

* Docker installed
* Make installed (should be available on every OS distribution w/o need for install)

If you're on Windows, then use the [Windows Subsystem For Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/install) and use ubuntu.

### Installing Docker

Launch an ubuntu shell, and the following command should allow you to install.

```bash
sudo apt install -y docker
```

## Repository Structure

These are the main directories and files to know.

```
.
├── Makefile
├── bootstrap
├── docker-compose.yaml
└── scripts
```

### Makefile

Houses all the easy to call commands within the project.

### bootstrap

Houses bootstrap seed data. When database stands up for the first time, the scripts located in this directory will be run.
That data is persisted across interactions (computer shutdown, etc). If you want to start fresh you can always run `make clean`.

### docker-compose.yaml

This is a `docker` compose file. This is beyond the scope of this practice, but just a useful tool for creating repeatable environments.
It is what allows the majority of commands to be consistent across different development environments.

### scripts

Where your user provided SQL goes, by default `main.sql` will run when you call `make run`, but other scripts can be specified.

## Usage

All the following steps assume you have this project open in a terminal.
Your basic workflow will go as follows:

* `make up` - Create database
* update `scripts/main.sql`
* `make run` - runs your updated queries

### Stand up database

You'll need to open a terminal for this work, and be in the directory of this project:

This will "install" postgreSQL, bootstrap it with some sample data, and expose it so you can local interact with it.

```bash
make up
```

### Create a query to run

By default, whenever `make run` is called, whatever is in the `scripts/main.sql` file will be executed.
If you want to run a different separate query, but don't want to edit the contents of `scripts/main.sql`
you can create a separate file in the `scripts` directory, and add an argument to the `make` command to 
make that happen.

### Run your queries

By default, `scripts/main.sql` will run.

```bash
make run
```

If you want to run another script, you can do so by passing an argument.

```bash
make run SCRIPT=other.sql
```

This will run a script in the `scripts` directory called `other.sql`.

## Additional Commands

There are additional commands available

### Clean

By default, data will persist across database standups, this is handled by a `docker` volume which explanation is outside the scope of this project.
If you want to start from a fresh slate, you can delete the volume and recreate the database.

```bash
# Shuts down database and deletes volume
make clean

# Recreates the database
make up
```

### Connect

If you want to connect to the database, and run commands directly, run the following:

```bash
make connect
```

Note: `make up` has to be run before this command will work
