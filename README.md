[![BSD3 License](https://img.shields.io/badge/license-BSD3-blue.svg?style=flat-square)](https://tldrlegal.com/license/bsd-3-clause-license-%28revised%29)

# simple-lang
A simple language for learning more about programming languages.

Posts from Stephen Diehl influeced this a lot:
- http://dev.stephendiehl.com/fun/002_parsers.html#parsec
- http://www.stephendiehl.com/llvm/

## Run it
Build and run:
```
$ stack build
$ stack exec simple-lang-exe
```

## Very simple "REPL"
The `E` as in `Eval` is still to be done.

Give an arithmetic expression and it will print the resulting AST:
```
Type an arithmetic expression: 
1+2*(1+2*1)+(4/2)
               (*)               
                |                
    -----------------            
   /                 \           
  (+)               (+)          
   |                 |           
  ----           -----------     
 /    \         /           \    
1.0  2.0       (*)         (/)   
                |           |    
              -------      ----  
             /       \    /    \ 
            (+)     1.0  4.0  2.0
             |                   
            ----                 
           /    \                
          1.0  2.0               
```
