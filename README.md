# sh lib load lib
## desc

some function to load lib for ymc shell lib

## deps

### test

- [x] sh-lib-path-resolve
- [x] sh-lib-test
- [x] sh-lib-time-cost
- [x] sh-lib-project-dir-map

### prod

- [ ] xxx

## apis

- [x] lib_ini
- [x] lib_has
- [x] lib_load
- [x] lib_require
- [x] lib_check

```sh
cat src/index.sh |  grep "function " | sed "s/function */- [x] /g"  | sed "s/(.*) *{//g"
```

## feats

- [x] basic curd load lib
## usage

### how to use for poduction?

```sh
# get the code

# run the index file
# ./src/index.sh

# or import to your sh file
# source /path/to/the/index file

# simple usage
lib_load "${THIS_FILE_PATH}/sh-lib-hi.sh"
hi "how are you"
```

### how to use for developer?

```sh
# get the code

# run test
./test/index.sh
#2 get some fail test
#./test/index.sh | grep "it is false"
```

## author

yemiancheng <ymc.github@gmail.com>

## license

MIT
