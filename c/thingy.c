#include <stdio.h>
#include <string.h>

#define MAX_ENTRY_SIZE 15

char action[12];
char attackResponse[] = "attack";
char healResponse[] = "heal";
int currentHp = 2147483647;

void heal(int *globalCurrentHp) {
    *globalCurrentHp = (*globalCurrentHp + 33);
    printf("You heal for 33 HP and are at %i HP\n", *globalCurrentHp);
}

void attack(){
    printf("\nYou attack for 60 Damage.\n");
}

void actionPrompt(char *name) {
    printf("\nAlright, %s, will you \'attack\' or \'heal\'? ", name);
    fgets (action, 8, stdin);
    action[strlen (action) -1] = '\0';

    if (strcmp(action, attackResponse) == 0) {
        attack();
    } else if (strcmp(action, healResponse) == 0) {
        heal(&currentHp);
    } else {
        printf("\nYou typed: \'%s\'.\n", action);
        actionPrompt(name);
    }
}

void enemyActs(int damage, int *globalCurrentHp) {
    *globalCurrentHp = (*globalCurrentHp - damage);
    printf("currentHp after damage: %i\n", *globalCurrentHp);
    printf("The enemy attacks you for %i damage.\nYou now have %i HP.\n", damage, *globalCurrentHp);
}

int main() {
    int damageDealt = 2147483600;
    int healingReceived = 45;
    int damageReceived = 110;
    int currentEnemyHp = 150;
    static char name[MAX_ENTRY_SIZE+1];

    printf("Enter your character's name: ");
    fgets (name, MAX_ENTRY_SIZE, stdin);
    name[strlen (name) - 1] = '\0';

    actionPrompt(name);
    enemyActs(damageDealt, &currentHp);
    actionPrompt(name);
    enemyActs(damageDealt, &currentHp);
    actionPrompt(name);
    enemyActs(damageDealt, &currentHp);

    return 0;
}

// Type conversion 
// float result = (float) 5 / 2;