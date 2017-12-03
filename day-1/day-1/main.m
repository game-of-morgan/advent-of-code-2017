//
//  main.m
//  day-1
//
//  Created by Morgan Wowk on 2017-12-02.
//  Copyright © 2017 Morgan Wowk. All rights reserved.
//
#import <stdio.h>
#import <string.h>
#define BUZZ_SIZE 5000

char * readSampleInput(){
    char* buff = malloc(BUZZ_SIZE);
    FILE *f = fopen("/Users/morganwowk/Documents/github/advent-of-code-2017/day-1/day-1/input.txt", "r");
    fgets(buff, BUZZ_SIZE, f);
    fclose(f);
    return buff;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        char* input = readSampleInput();
        char* character;
        int sum = 0, previousDigit = -1, addedInitialCharacter = 0, firstDigit = *input - '0';
        
        for (character = input; *character != '\0'; character++){
            int characterValue = *character - '0';
            if(characterValue == previousDigit){
                sum += characterValue;
            } else {
                addedInitialCharacter = 0;
            }
            if(strlen(character) == 1 && characterValue == firstDigit){
                sum += characterValue;
            }
            previousDigit = characterValue;
        }
        
        printf("The sum total is %d\n\n", sum);

        return 0;
        
    }
}
