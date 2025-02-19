## (2)
### (b)
```logika
⊢ a → a  
{  
    1. {  
        2. a    assume  
    }  
    3. a → a    →i 1  
}
```

## (3)
### (a)
Indeed not accepted
```logika
s, q, r ⊢ r ∧ (q ∧ s)  
{  
    1. p            assume  
    2. q            premise  
    3. r            premise  
    4. q ∨ p        ∨i 2 1  
    5. r ∧ (q ∧ p)  ∧i 3 4  
}
```

### (b)
![[POM Week 4 Exercise 3.b]]

### (c)
Accepted
```logika
s, q, r ⊢ r ∧ (q ∧ s)  
{  
    1. s            premise  
    2. q            premise  
    3. r            premise  
    4. q ∧ s        ∧i 2 1  
    5. r ∧ (q ∧ s)  ∧i 3 4  
}
```

## (4)
### (a)
Confirmed yes
```logika
⊢ a → a ∧ a  
{  
    1. {  
        2. a        assume  
        3. a ∧ a    ∧i 2 2  
    }  
    4. a → a ∧ a    →i 1  
}
```

### (b)
```logika
⊢ a → a ∨ a  
{  
    1. {  
        2. a        assume  
        3. a ∨ a    ∨i1 2  
    }  
    4. a → a ∨ a    →i 1  
}
```

## (5)
### (a)
```logika
a ∧ b ⊢ a ∨ b  
{  
    1. a ∧ b    premise  
    2. a        ∧e1 1  
    3. a ∨ b    ∨i1 2  
}
```

### (b)
```logika
p ∨ p ⊢ p  
{  
    1. p ∨ p    premise  
    2. {  
        3. p    assume  
    }  
    4. p        ∨e 1 2 2  
}
```

## (6)
### (a)
![[POM Week 4 Exercise 6.a]]

### (b)
![[POM Week 4 Exercise 6.b]]

## (7)
### (a)
```logika
p → q, ¬q ⊢ ¬p  
{  
    1. {  
        2. p        assume  
        3. p → q    premise  
        4. q        →e 3 2  
        5. ¬q       premise  
        6. ⊥        ¬e 4 5  
    }  
    7. ¬p           ¬i 1
}
```

### (b)
```logika
¬q ⊢ q → s  
{  
    1. {  
        2. q    assume  
        3. ¬q   premise  
        4. ⊥    ¬e 2 3  
        5. s    ⊥e 4  
    }  
    6. q → s    →i 1  
}
```
