cypher = "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl."

alphabet = "abcdefghijklmnopqrstuvwxyz"

solution = ""

for c in cypher:
    if c == " ":
        solution += " "
    elif c == ".":
        solution += "."
    else:
        solution += alphabet[(alphabet.find(c.lower())-5) % 26]

print(solution)