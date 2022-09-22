# Winston Overview

[Reference](https://github.com/winstonjs/winston)

1. Simple, universal logging library
1. Support for multiple transports
1. Transport = storage device for logs
1. Each Winston logger can have multiple transports configured at different logging levels
1. Support for different logging levels
1. Flexibility in log formats and levels
1. Recommended usage => create own logger using winston
1. Create as many loggers as needed
    1. One logger = one format, multiple transports
        1. Each transport can have its own level and destination 

## Usage

1. Create a custom logger with following parameters on createLogger:
    1. level
        1. default 'info'
        1. log only if info.level is less than or equal to this set level
    1. levels
        1. default 'winston.config.npm.levels'
        1. Levels reprsenting log priorities
    1. format
        1. default 'winston.format.json'
        1. set format for info messages
    1. transports
    1. exitOnError: boolean
        1. false => handled exceptions will not cause process.exit
        1. default is true
    1. silent: boolean
        1. true => all logs are suppressed
        1. default false
1. Levels provided to createLogger will also be defined as convenience methods on the created logger
1. Transports on any created logger can be added or deleted later
1. Child loggers can be created from existing loggers
1. Logger and Transport accept an info object
    1. info object MUST have at least the level and message properties
    1. Any other properties passed are treated as "meta"

1. Logging levels conform to RFC5424
    1. error: 0
    1. warn: 1
    1. info: 2
    1. http: 3
    1. verbose: 4
    1. debug: 5
    1. silly: 6
1. Formats
    1. Can be accessed from winston.format
1. Transports
1. Exceptions
1. Rejections
1. Profiling
1. Streaming logs
1. Querying logs
1. 
