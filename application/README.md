# Property Management Information System

## Introduction

This application consists of three parts:

- [x] vue.js frontend
- [x] feathers.js backend
- [x] MS SQL Server database

**IMPORTANT:**
You need to be connected to HS-Esslingen VPN for the application to work.
Any side-effects with no VPN connection are not handled and may cause the application to crash or not start properly!

## Installation

### Frontend

Requirements:

- [x] [yarn](https://yarnpkg.com/)
- [x] [node.js](https://nodejs.org/en/)

In order to install all dependencies for the frontend,
you have to `cd` into `/frontend` and run

```shell
yarn install
```

after that you can run the frontend with:

```shell
yarn run dev
```

### Backend

Requirements:

- [x] [yarn](https://yarnpkg.com/)
- [x] [node.js](https://nodejs.org/en/)

In order to install all dependencies for the frontend,
you have to `cd` into `/api` and run

```shell
yarn install
```

after that you can run the frontend with:

```shell
yarn run start
```

In order for the backend to run properly you have to add a `dbConfig.json` file to `/api/config`.

All required fields are shown in the `sampleDbConfig.json` file in `/api/config`
