source scripts/library.sh

instruction="START"
execute $instruction

instruction="MOV A, 20"
execute $instruction

instruction="MOV B, A"
execute $instruction

instruction="ADD A, 1"
execute $instruction

instruction="ADD B, A"
execute $instruction

instruction="STOP"
execute $instruction